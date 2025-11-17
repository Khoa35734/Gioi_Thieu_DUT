package controller;

import dao.MajorDAO;
import model.Major;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/major")
public class MajorServlet extends HttpServlet {

    private MajorDAO majorDAO = new MajorDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy facultyId từ request (nếu có)
        String facultyIdStr = request.getParameter("facultyId");
        List<Major> majors;

        if (facultyIdStr != null && !facultyIdStr.isEmpty()) {
            int facultyId = Integer.parseInt(facultyIdStr);
            majors = majorDAO.getMajorsByFaculty(facultyId);
        } else {
            majors = majorDAO.getAllMajors();
        }

        request.setAttribute("majors", majors);
        request.getRequestDispatcher("/major.jsp").forward(request, response);
    }
}

