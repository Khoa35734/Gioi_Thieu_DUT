package controller;

import dao.FacultyDAO;
import dao.AdminDAO;
import model.Faculty;
import model.Admin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/faculty-admins")
public class AdminFacultyServlet extends HttpServlet {

    private FacultyDAO facultyDAO = new FacultyDAO();
    private AdminDAO adminDAO = new AdminDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            // Hiển thị form sửa Admin Khoa
            int id = Integer.parseInt(request.getParameter("id"));
            Admin admin = adminDAO.getAdminById(id);
            List<Faculty> faculties = facultyDAO.getAllFaculties();
            request.setAttribute("admin", admin);
            request.setAttribute("faculties", faculties);
            request.getRequestDispatcher("/admin/faculty-admins-form.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            // Xóa Admin Khoa
            int id = Integer.parseInt(request.getParameter("id"));
            adminDAO.deleteAdmin(id);
            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "Xóa Admin Khoa thành công!");
            response.sendRedirect("faculty-admins");
        } else if ("new".equals(action)) {
            // Hiển thị form thêm mới Admin Khoa
            List<Faculty> faculties = facultyDAO.getAllFaculties();
            request.setAttribute("faculties", faculties);
            request.getRequestDispatcher("/admin/faculty-admins-form.jsp").forward(request, response);
        } else {
            // Hiển thị danh sách Admin Khoa
            List<Admin> allAdmins = adminDAO.getAllAdmins();
            List<Admin> facultyAdmins = allAdmins.stream()
                .filter(admin -> "faculty_admin".equals(admin.getRole()))
                .toList();
            request.setAttribute("facultyAdmins", facultyAdmins);
            request.getRequestDispatcher("/admin/faculty-admins-list.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String idStr = request.getParameter("id");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String newPassword = request.getParameter("newPassword");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String facultyIdStr = request.getParameter("facultyId");

        HttpSession session = request.getSession();

        if (idStr != null && !idStr.isEmpty()) {
            // Cập nhật Admin Khoa
            Admin admin = new Admin();
            admin.setId(Integer.parseInt(idStr));
            admin.setUsername(username);
            admin.setFullName(fullName);
            admin.setEmail(email);
            admin.setRole("faculty_admin");
            admin.setFacultyId(Integer.parseInt(facultyIdStr));
            
            adminDAO.updateAdmin(admin);
            
            // Cập nhật mật khẩu nếu có
            if (newPassword != null && !newPassword.trim().isEmpty()) {
                adminDAO.updatePassword(Integer.parseInt(idStr), newPassword);
            }
            
            session.setAttribute("successMessage", "Cập nhật Admin Khoa thành công!");
            response.sendRedirect("faculty-admins");
        } else {
            // Tạo mới Admin Khoa
            Admin admin = new Admin();
            admin.setUsername(username);
            admin.setPassword(password);
            admin.setFullName(fullName);
            admin.setEmail(email);
            admin.setRole("faculty_admin");
            admin.setFacultyId(Integer.parseInt(facultyIdStr));
            
            adminDAO.createAdmin(admin);
            session.setAttribute("successMessage", "Tạo Admin Khoa thành công!");
            response.sendRedirect("faculty-admins");
        }
    }
}
