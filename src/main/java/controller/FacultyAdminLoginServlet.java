package controller;

import dao.AdminDAO;
import model.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/faculty/login")
public class FacultyAdminLoginServlet extends HttpServlet {
    private AdminDAO adminDAO;

    @Override
    public void init() {
        adminDAO = new AdminDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Check if already logged in
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("admin") != null) {
            Admin admin = (Admin) session.getAttribute("admin");
            if (admin.isFacultyAdmin()) {
                response.sendRedirect(request.getContextPath() + "/admin/faculty/dashboard");
                return;
            }
        }

        // Show login page
        request.getRequestDispatcher("/admin/faculty-admin-login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");

        if (username == null || username.trim().isEmpty() || 
            password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin!");
            request.getRequestDispatcher("/admin/faculty-admin-login.jsp").forward(request, response);
            return;
        }

        Admin admin = adminDAO.login(username, password);

        if (admin != null && admin.isFacultyAdmin()) {
            // Login successful
            HttpSession session = request.getSession(true);
            session.setAttribute("admin", admin);
            session.setAttribute("adminRole", "faculty_admin");
            session.setMaxInactiveInterval(30 * 60); // 30 minutes

            // Remember me cookie
            if ("on".equals(remember)) {
                Cookie usernameCookie = new Cookie("facultyAdminUsername", username);
                usernameCookie.setMaxAge(7 * 24 * 60 * 60); // 7 days
                response.addCookie(usernameCookie);
            }

            response.sendRedirect(request.getContextPath() + "/admin/faculty/dashboard");
        } else {
            // Login failed
            request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng hoặc bạn không có quyền Faculty Admin!");
            request.setAttribute("username", username);
            request.getRequestDispatcher("/admin/faculty-admin-login.jsp").forward(request, response);
        }
    }
}
