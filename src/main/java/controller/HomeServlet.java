package controller;

import dao.FacultyDAO;
import dao.NewsDAO;
import model.Faculty;
import model.News;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/") // Map to the root context
public class HomeServlet extends HttpServlet {

    private NewsDAO newsDAO = new NewsDAO();
    private FacultyDAO facultyDAO = new FacultyDAO(); // Initialize FacultyDAO

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get random news from all faculties for featured section (limit 3)
        List<News> newsList = newsDAO.getRandomNews(3);
        
        // Debug logging
        System.out.println("=== HomeServlet Debug ===");
        System.out.println("News list size: " + (newsList != null ? newsList.size() : "NULL"));
        if (newsList != null && !newsList.isEmpty()) {
            System.out.println("First news: " + newsList.get(0).getTitle());
        } else {
            System.out.println("WARNING: No news found in database!");
        }
        System.out.println("========================");
        
        request.setAttribute("newsList", newsList);
        
        // Get all faculties and set as attribute
        List<Faculty> faculties = facultyDAO.getAllFaculties();
        request.setAttribute("faculties", faculties);
        
        // Forward to the main index page
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
