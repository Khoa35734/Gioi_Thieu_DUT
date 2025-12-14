package controller;

import dao.NewsDAO;
import model.News;
import model.Admin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/admin/news")
@MultipartConfig // Enable multipart request handling
public class AdminNewsServlet extends HttpServlet {

    private NewsDAO newsDAO = new NewsDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        HttpSession session = request.getSession(false);
        Admin currentAdmin = (session != null) ? (Admin) session.getAttribute("admin") : null;

        if (currentAdmin == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        try {
            if ("edit".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                News news = newsDAO.getNewsById(id);
                if ("faculty_admin".equals(currentAdmin.getRole()) && (news == null || !news.getFacultyId().equals(currentAdmin.getFacultyId()))) {
                    response.sendError(HttpServletResponse.SC_FORBIDDEN, "Bạn không có quyền chỉnh sửa bài viết này.");
                    return;
                }
                loadFormDependencies(request, currentAdmin);
                request.setAttribute("news", news);
                request.getRequestDispatcher("/admin/news-form.jsp").forward(request, response);
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                News news = newsDAO.getNewsById(id);
                if ("faculty_admin".equals(currentAdmin.getRole()) && (news == null || !news.getFacultyId().equals(currentAdmin.getFacultyId()))) {
                    response.sendError(HttpServletResponse.SC_FORBIDDEN, "Bạn không có quyền xóa bài viết này.");
                    return;
                }
                if (newsDAO.deleteNews(id)) {
                    session.setAttribute("successMessage", "Xóa bài viết thành công!");
                } else {
                    session.setAttribute("errorMessage", "Xóa bài viết thất bại.");
                }
                response.sendRedirect(request.getContextPath() + "/admin/news");
            } else if ("new".equals(action)) {
                loadFormDependencies(request, currentAdmin);
                request.getRequestDispatcher("/admin/news-form.jsp").forward(request, response);
            } else {
                List<News> newsList;
                if ("faculty_admin".equals(currentAdmin.getRole())) {
                    newsList = newsDAO.getNewsByFaculty(currentAdmin.getFacultyId());
                } else {
                    newsList = newsDAO.getAllNews();
                }
                request.setAttribute("newsList", newsList);
                request.getRequestDispatcher("/admin/news-list.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID không hợp lệ.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        Admin currentAdmin = (session != null) ? (Admin) session.getAttribute("admin") : null;

        if (currentAdmin == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        // --- Fixed: Read multipart form data correctly ---
        String idStr = getPartValue(request.getPart("id"));
        String title = getPartValue(request.getPart("title"));
        String content = getPartValue(request.getPart("content"));
        // Note: Thumbnail handling will require saving the file, this example just gets the name.
        Part thumbnailPart = request.getPart("thumbnail");
        String thumbnailFileName = (thumbnailPart != null) ? thumbnailPart.getSubmittedFileName() : "";


        News news = new News();
        news.setTitle(title);
        news.setContent(content);
        // TODO: Implement file saving logic and set the path to the thumbnail
        news.setThumbnail(thumbnailFileName); 
        news.setAuthorId(currentAdmin.getId());

        Integer facultyId = null;
        if ("faculty_admin".equals(currentAdmin.getRole())) {
            facultyId = currentAdmin.getFacultyId();
        } else {
            String facultyIdStr = getPartValue(request.getPart("facultyId"));
            if (facultyIdStr != null && !facultyIdStr.isEmpty() && !"0".equals(facultyIdStr)) {
                facultyId = Integer.parseInt(facultyIdStr);
            }
        }
        news.setFacultyId(facultyId);

        boolean success;
        String successMessage;
        String errorMessage;

        if (idStr != null && !idStr.isEmpty()) {
            // Update existing news
            news.setId(Integer.parseInt(idStr));
            News existing = newsDAO.getNewsById(news.getId());
            if ("faculty_admin".equals(currentAdmin.getRole()) && (existing == null || !existing.getFacultyId().equals(currentAdmin.getFacultyId()))) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN, "Bạn không có quyền cập nhật bài viết này.");
                return;
            }
            news.setCreatedDate(existing.getCreatedDate());
            success = newsDAO.updateNews(news);
            successMessage = "Cập nhật bài viết thành công!";
            errorMessage = "Cập nhật bài viết thất bại.";
        } else {
            // Create new news
            news.setCreatedDate(new Date(System.currentTimeMillis()));
            success = newsDAO.createNews(news);
            successMessage = "Tạo bài viết thành công!";
            errorMessage = "Tạo bài viết thất bại. Vui lòng kiểm tra lại dữ liệu.";
        }

        if (success) {
            session.setAttribute("successMessage", successMessage);
        } else {
            session.setAttribute("errorMessage", errorMessage);
        }
        response.sendRedirect(request.getContextPath() + "/admin/news");
    }

    private void loadFormDependencies(HttpServletRequest request, Admin currentAdmin) {
        if (currentAdmin != null && "super_admin".equals(currentAdmin.getRole())) {
            dao.FacultyDAO facultyDAO = new dao.FacultyDAO();
            request.setAttribute("faculties", facultyDAO.getAllFaculties());
        }
        request.setAttribute("currentAdmin", currentAdmin);
    }

    // Helper method to get string value from a Part
    private String getPartValue(Part part) throws IOException {
        if (part == null) {
            return null;
        }
        try (InputStream inputStream = part.getInputStream();
             BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8))) {
            return reader.lines().collect(Collectors.joining(System.lineSeparator()));
        }
    }
}
