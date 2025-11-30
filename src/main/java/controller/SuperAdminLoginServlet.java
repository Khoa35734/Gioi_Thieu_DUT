package controller;

import dao.AdminDAO;
import model.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/super/login")
public class SuperAdminLoginServlet extends HttpServlet {
    private AdminDAO adminDAO;

    @Override
    public void init() {
        adminDAO = new AdminDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Show login page
        request.getRequestDispatcher("/admin/super-admin-login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Admin admin = adminDAO.login(username, password);

        if (admin != null && "super_admin".equals(admin.getRole())) {
            // Login successful
            HttpSession session = request.getSession(true);
            session.setAttribute("admin", admin);
            
            // Redirect to the dashboard, which is now handled by DashboardServlet
            response.sendRedirect(request.getContextPath() + "/admin/dashboard");
        } else {
            // Login failed
            request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng hoặc bạn không có quyền Super Admin!");
            request.setAttribute("username", username);
            request.getRequestDispatcher("/admin/super-admin-login.jsp").forward(request, response);
        }
    }
}
