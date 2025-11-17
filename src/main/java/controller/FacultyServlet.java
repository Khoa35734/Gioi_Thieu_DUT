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

@WebServlet("/faculty")
public class FacultyServlet extends HttpServlet {

    private FacultyDAO facultyDAO = new FacultyDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy danh sách khoa
        List<Faculty> faculties = facultyDAO.getAllFaculties();
        request.setAttribute("faculties", faculties);

        // Chuyển đến trang hiển thị
        request.getRequestDispatcher("/faculty.jsp").forward(request, response);
    }
}

