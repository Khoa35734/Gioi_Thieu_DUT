package controller;

import dao.MajorDAO;
import dao.FacultyDAO;
import model.Major;
import model.Faculty;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/major-list")
public class AdminMajorServlet extends HttpServlet {

    private MajorDAO majorDAO = new MajorDAO();
    private FacultyDAO facultyDAO = new FacultyDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Major major = majorDAO.getMajorById(id);
            List<Faculty> faculties = facultyDAO.getAllFaculties();
            request.setAttribute("major", major);
            request.setAttribute("faculties", faculties);
            request.getRequestDispatcher("/admin/major-form.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            majorDAO.deleteMajor(id);
            response.sendRedirect("major-list");
        } else if ("new".equals(action)) {
            List<Faculty> faculties = facultyDAO.getAllFaculties();
            request.setAttribute("faculties", faculties);
            request.getRequestDispatcher("/admin/major-form.jsp").forward(request, response);
        } else {
            List<Major> majors = majorDAO.getAllMajors();
            request.setAttribute("majors", majors);
            request.getRequestDispatcher("/admin/major-list.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String idStr = request.getParameter("id");
        String name = request.getParameter("name");
        int facultyId = Integer.parseInt(request.getParameter("facultyId"));

        Major major = new Major();
        major.setName(name);
        major.setFacultyId(facultyId);

        if (idStr != null && !idStr.isEmpty()) {
            major.setId(Integer.parseInt(idStr));
            majorDAO.updateMajor(major);
        } else {
            majorDAO.addMajor(major);
        }

        response.sendRedirect("major-list");
    }
}

