package controller;

import dao.FacultyDAO;
import dao.MajorDAO;
import dao.NewsDAO;
import model.Faculty;
import model.Major;
import model.News;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/faculty")
public class FacultyPageServlet extends HttpServlet {

    private FacultyDAO facultyDAO = new FacultyDAO();
    private MajorDAO majorDAO = new MajorDAO();
    private NewsDAO newsDAO = new NewsDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // For now, we'll hardcode the ID for "Khoa Công nghệ thông tin"
        // In the future, you can get this from a request parameter e.g., request.getParameter("id")
        int facultyId = 1; // Assuming 1 is the ID for IT Faculty

        try {
            // 1. Get Faculty Details
            Faculty faculty = facultyDAO.getFacultyById(facultyId);
            if (faculty == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy thông tin khoa.");
                return;
            }

            // 2. Get Majors for the Faculty
            List<Major> majors = majorDAO.getMajorsByFaculty(facultyId);

            // 3. Get News for the Faculty
            List<News> newsList = newsDAO.getNewsByFaculty(facultyId);

            // Set attributes for the JSP page
            request.setAttribute("faculty", faculty);
            request.setAttribute("majors", majors);
            request.setAttribute("newsList", newsList);

            // Forward to the template JSP
            request.getRequestDispatcher("/faculty-template.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            // Handle potential exceptions, e.g., database connection error
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã có lỗi xảy ra.");
        }
    }
}
