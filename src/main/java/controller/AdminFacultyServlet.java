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

@WebServlet("/admin/faculty-list")
public class AdminFacultyServlet extends HttpServlet {

    private FacultyDAO facultyDAO = new FacultyDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            // Hiển thị form sửa
            int id = Integer.parseInt(request.getParameter("id"));
            Faculty faculty = facultyDAO.getFacultyById(id);
            request.setAttribute("faculty", faculty);
            request.getRequestDispatcher("/admin/faculty-form.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            // Xóa khoa
            int id = Integer.parseInt(request.getParameter("id"));
            facultyDAO.deleteFaculty(id);
            response.sendRedirect("faculty-list");
        } else if ("new".equals(action)) {
            // Hiển thị form thêm mới
            request.getRequestDispatcher("/admin/faculty-form.jsp").forward(request, response);
        } else {
            // Hiển thị danh sách
            List<Faculty> faculties = facultyDAO.getAllFaculties();
            request.setAttribute("faculties", faculties);
            request.getRequestDispatcher("/admin/faculty-list.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String idStr = request.getParameter("id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");

        Faculty faculty = new Faculty();
        faculty.setName(name);
        faculty.setDescription(description);

        if (idStr != null && !idStr.isEmpty()) {
            // Cập nhật
            faculty.setId(Integer.parseInt(idStr));
            facultyDAO.updateFaculty(faculty);
        } else {
            // Thêm mới
            facultyDAO.addFaculty(faculty);
        }

        response.sendRedirect("faculty-list");
    }
}

