package controller;

import bo.NewsBO;
import model.Admin;
import model.News;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.UUID;

@WebServlet("/admin/faculty/news")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,      // 1 MB
    maxFileSize = 1024 * 1024 * 10,        // 10 MB
    maxRequestSize = 1024 * 1024 * 50      // 50 MB
)
public class FacultyNewsServlet extends HttpServlet {
    private NewsBO newsBO;
    private static final String UPLOAD_DIR = "uploads/news-content";

    @Override
    public void init() {
        newsBO = new NewsBO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/faculty/login");
            return;
        }

        Admin admin = (Admin) session.getAttribute("admin");

        if (!admin.isFacultyAdmin()) {
            response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            return;
        }

        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "create":
                showCreateForm(request, response, admin);
                break;
            case "edit":
                showEditForm(request, response, admin);
                break;
            case "delete":
                deleteNews(request, response, admin);
                break;
            default:
                listNews(request, response, admin);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/faculty/login");
            return;
        }

        Admin admin = (Admin) session.getAttribute("admin");

        if (!admin.isFacultyAdmin()) {
            response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            return;
        }

        String action = request.getParameter("action");

        if ("create".equals(action)) {
            createNews(request, response, admin);
        } else if ("update".equals(action)) {
            updateNews(request, response, admin);
        }
    }

    private void listNews(HttpServletRequest request, HttpServletResponse response, Admin admin)
            throws ServletException, IOException {
        List<News> newsList = newsBO.getNewsByFaculty(admin.getFacultyId());
        request.setAttribute("newsList", newsList);
        request.setAttribute("admin", admin);
        request.getRequestDispatcher("/admin/faculty/faculty-news-list.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response, Admin admin)
            throws ServletException, IOException {
        request.setAttribute("admin", admin);
        request.getRequestDispatcher("/admin/faculty/faculty-news-form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response, Admin admin)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        News news = newsBO.getNewsById(id);

        // Check if news belongs to admin's faculty
        if (news == null || (news.getFacultyId() != null && !news.getFacultyId().equals(admin.getFacultyId()))) {
            response.sendRedirect(request.getContextPath() + "/admin/faculty/news?error=unauthorized");
            return;
        }

        request.setAttribute("news", news);
        request.setAttribute("admin", admin);
        request.getRequestDispatcher("/admin/faculty/faculty-news-form.jsp").forward(request, response);
    }

    private void createNews(HttpServletRequest request, HttpServletResponse response, Admin admin)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String dateStr = request.getParameter("createdDate");

        // Handle file upload
        String thumbnail = handleFileUpload(request, "thumbnail");

        News news = new News();
        news.setTitle(title);
        news.setContent(content);
        news.setThumbnail(thumbnail);
        news.setViews(0);

        if (dateStr != null && !dateStr.isEmpty()) {
            news.setCreatedDate(Date.valueOf(dateStr));
        } else {
            news.setCreatedDate(new Date(System.currentTimeMillis()));
        }

        // Business logic handled in BO (including facultyId and authorId)
        if (newsBO.createNews(news, admin)) {
            response.sendRedirect(request.getContextPath() + "/admin/faculty/news?success=created");
        } else {
            request.setAttribute("error", "Không thể tạo bài viết!");
            request.setAttribute("admin", admin);
            request.getRequestDispatcher("/admin/faculty/faculty-news-form.jsp").forward(request, response);
        }
    }

    private void updateNews(HttpServletRequest request, HttpServletResponse response, Admin admin)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        News existingNews = newsBO.getNewsById(id);

        // Check if news belongs to admin's faculty (business logic will also validate)
        if (existingNews == null || (existingNews.getFacultyId() != null && !existingNews.getFacultyId().equals(admin.getFacultyId()))) {
            response.sendRedirect(request.getContextPath() + "/admin/faculty/news?error=unauthorized");
            return;
        }

        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String dateStr = request.getParameter("createdDate");

        // Handle file upload
        String thumbnail = handleFileUpload(request, "thumbnail");
        if (thumbnail == null || thumbnail.isEmpty()) {
            thumbnail = existingNews.getThumbnail();
        }

        News news = new News();
        news.setId(id);
        news.setTitle(title);
        news.setContent(content);
        news.setThumbnail(thumbnail);
        news.setViews(existingNews.getViews());

        if (dateStr != null && !dateStr.isEmpty()) {
            news.setCreatedDate(Date.valueOf(dateStr));
        } else {
            news.setCreatedDate(existingNews.getCreatedDate());
        }

        // Business logic handled in BO
        if (newsBO.updateNews(news, admin)) {
            response.sendRedirect(request.getContextPath() + "/admin/faculty/news?success=updated");
        } else {
            request.setAttribute("error", "Không thể cập nhật bài viết!");
            request.setAttribute("news", existingNews);
            request.setAttribute("admin", admin);
            request.getRequestDispatcher("/admin/faculty/faculty-news-form.jsp").forward(request, response);
        }
    }

    private void deleteNews(HttpServletRequest request, HttpServletResponse response, Admin admin)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        
        // Business logic and validation handled in BO
        if (newsBO.deleteNews(id, admin)) {
            response.sendRedirect(request.getContextPath() + "/admin/faculty/news?success=deleted");
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/faculty/news?error=delete_failed");
        }
    }

    private String handleFileUpload(HttpServletRequest request, String fieldName) throws IOException, ServletException {
        Part filePart = request.getPart(fieldName);
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = getSubmittedFileName(filePart);
            if (fileName != null && !fileName.isEmpty()) {
                String extension = fileName.substring(fileName.lastIndexOf("."));
                String newFileName = UUID.randomUUID().toString() + extension;

                String uploadPath = request.getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                filePart.write(uploadPath + File.separator + newFileName);
                return UPLOAD_DIR + "/" + newFileName;
            }
        }
        return null;
    }

    private String getSubmittedFileName(Part part) {
        String header = part.getHeader("content-disposition");
        if (header != null) {
            for (String token : header.split(";")) {
                if (token.trim().startsWith("filename")) {
                    return token.substring(token.indexOf('=') + 1).trim().replace("\"", "");
                }
            }
        }
        return null;
    }
}
