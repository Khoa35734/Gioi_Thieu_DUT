package controller;

import bo.MajorBO;
import model.Admin;
import model.Major;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/faculty/majors")
public class FacultyMajorServlet extends HttpServlet {
    private MajorBO majorBO;

    @Override
    public void init() {
        majorBO = new MajorBO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/faculty/login");
            return;
        }

        Admin admin = (Admin) session.getAttribute("admin");

        if (!admin.isFacultyAdmin()) {
            response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            return;
        }

        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "create":
                showCreateForm(request, response, admin);
                break;
            case "edit":
                showEditForm(request, response, admin);
                break;
            case "delete":
                deleteMajor(request, response, admin);
                break;
            default:
                listMajors(request, response, admin);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/faculty/login");
            return;
        }

        Admin admin = (Admin) session.getAttribute("admin");

        if (!admin.isFacultyAdmin()) {
            response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            return;
        }

        String action = request.getParameter("action");

        if ("create".equals(action)) {
            createMajor(request, response, admin);
        } else if ("update".equals(action)) {
            updateMajor(request, response, admin);
        }
    }

    private void listMajors(HttpServletRequest request, HttpServletResponse response, Admin admin)
            throws ServletException, IOException {
        List<Major> majorList = majorBO.getMajorsByFaculty(admin.getFacultyId());
        request.setAttribute("majorList", majorList);
        request.setAttribute("admin", admin);
        request.getRequestDispatcher("/admin/faculty/faculty-major-list.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response, Admin admin)
            throws ServletException, IOException {
        request.setAttribute("admin", admin);
        request.getRequestDispatcher("/admin/faculty/faculty-major-form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response, Admin admin)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Major major = majorBO.getMajorById(id);

        // Check if major belongs to admin's faculty
        if (major == null || major.getFacultyId() != admin.getFacultyId()) {
            response.sendRedirect(request.getContextPath() + "/admin/faculty/majors?error=unauthorized");
            return;
        }

        request.setAttribute("major", major);
        request.setAttribute("admin", admin);
        request.getRequestDispatcher("/admin/faculty/faculty-major-form.jsp").forward(request, response);
    }

    private void createMajor(HttpServletRequest request, HttpServletResponse response, Admin admin)
            throws ServletException, IOException {
        String majorCode = request.getParameter("majorCode");
        String name = request.getParameter("name");
        String description = request.getParameter("description");

        // Check if major code already exists using BO
        if (majorBO.majorCodeExists(majorCode)) {
            request.setAttribute("error", "Mã ngành đã tồn tại!");
            request.setAttribute("admin", admin);
            request.getRequestDispatcher("/admin/faculty/faculty-major-form.jsp").forward(request, response);
            return;
        }

        Major major = new Major();
        major.setMajorCode(majorCode);
        major.setName(name);
        major.setDescription(description);
        major.setCreatedBy(admin.getId());

        // Business logic handled in BO (including facultyId)
        if (majorBO.createMajor(major, admin)) {
            response.sendRedirect(request.getContextPath() + "/admin/faculty/majors?success=created");
        } else {
            request.setAttribute("error", "Không thể tạo ngành học!");
            request.setAttribute("admin", admin);
            request.getRequestDispatcher("/admin/faculty/faculty-major-form.jsp").forward(request, response);
        }
    }

    private void updateMajor(HttpServletRequest request, HttpServletResponse response, Admin admin)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Major existingMajor = majorBO.getMajorById(id);

        // Check if major belongs to admin's faculty (BO also validates)
        if (existingMajor == null || existingMajor.getFacultyId() != admin.getFacultyId()) {
            response.sendRedirect(request.getContextPath() + "/admin/faculty/majors?error=unauthorized");
            return;
        }

        String majorCode = request.getParameter("majorCode");
        String name = request.getParameter("name");
        String description = request.getParameter("description");

        Major major = new Major();
        major.setId(id);
        major.setMajorCode(majorCode);
        major.setName(name);
        major.setDescription(description);

        // Business logic handled in BO (including validation and duplicate check)
        if (majorBO.updateMajor(major, admin)) {
            response.sendRedirect(request.getContextPath() + "/admin/faculty/majors?success=updated");
        } else {
            request.setAttribute("error", "Không thể cập nhật ngành học!");
            request.setAttribute("major", existingMajor);
            request.setAttribute("admin", admin);
            request.getRequestDispatcher("/admin/faculty/faculty-major-form.jsp").forward(request, response);
        }
    }

    private void deleteMajor(HttpServletRequest request, HttpServletResponse response, Admin admin)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        
        // Business logic and validation handled in BO
        if (majorBO.deleteMajor(id, admin)) {
            response.sendRedirect(request.getContextPath() + "/admin/faculty/majors?success=deleted");
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/faculty/majors?error=delete_failed");
        }
    }
}
