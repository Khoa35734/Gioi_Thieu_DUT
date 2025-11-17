package controller;

import dao.NewsDAO;
import model.News;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    private NewsDAO newsDAO = new NewsDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<News> newsList = newsDAO.getAllNews();
        request.setAttribute("newsList", newsList);
        
        // Chuyển hướng về trang chủ
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
