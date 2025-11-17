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

@WebServlet("/news")
public class NewsServlet extends HttpServlet {

    private NewsDAO newsDAO = new NewsDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("detail".equals(action)) {
            // Hiển thị chi tiết tin tức
            int id = Integer.parseInt(request.getParameter("id"));
            News news = newsDAO.getNewsById(id);
            request.setAttribute("news", news);
            request.getRequestDispatcher("/news-detail.jsp").forward(request, response);
        } else {
            // Hiển thị danh sách tin tức
            List<News> newsList = newsDAO.getAllNews();
            request.setAttribute("newsList", newsList);
            request.getRequestDispatcher("/news.jsp").forward(request, response);
        }
    }
}

