package controller;

import dao.FacultyDAO;
import model.Faculty;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

// Changed URL mapping to avoid conflict with FacultyPageServlet
@WebServlet("/admin/faculties")
public class FacultyServlet extends HttpServlet {

    private FacultyDAO facultyDAO = new FacultyDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // This servlet is now intended for admin purposes, e.g., listing all faculties for management.
        // The corresponding JSP should be an admin page.
        
        List<Faculty> faculties = facultyDAO.getAllFaculties();
        request.setAttribute("faculties", faculties);

        // Forward to an admin-specific page, for example, /admin/faculties-list.jsp
        // Note: You might need to create or adjust this JSP page.
        request.getRequestDispatcher("/admin/faculties-list.jsp").forward(request, response);
    }
}
