package controller;

import dao.NewsDAO;
import model.News;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/news-list")
public class AdminNewsServlet extends HttpServlet {

    private NewsDAO newsDAO = new NewsDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            News news = newsDAO.getNewsById(id);
            request.setAttribute("news", news);
            request.getRequestDispatcher("/admin/news-form.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            newsDAO.deleteNews(id);
            response.sendRedirect("news-list");
        } else if ("new".equals(action)) {
            request.getRequestDispatcher("/admin/news-form.jsp").forward(request, response);
        } else {
            List<News> newsList = newsDAO.getAllNews();
            request.setAttribute("newsList", newsList);
            request.getRequestDispatcher("/admin/news-list.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String idStr = request.getParameter("id");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String thumbnail = request.getParameter("thumbnail");

        News news = new News();
        news.setTitle(title);
        news.setContent(content);
        news.setThumbnail(thumbnail);

        if (idStr != null && !idStr.isEmpty()) {
            news.setId(Integer.parseInt(idStr));
            newsDAO.updateNews(news);
        } else {
            newsDAO.addNews(news);
        }

        response.sendRedirect("news-list");
    }
}

