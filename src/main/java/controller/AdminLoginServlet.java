package controller;

import dao.AdminDAO;
import model.Admin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {

    private AdminDAO adminDAO = new AdminDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Admin admin = adminDAO.login(username, password);

        if (admin != null) {
            // Đăng nhập thành công
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            response.sendRedirect(request.getContextPath() + "/admin/faculty-list");
        } else {
            // Đăng nhập thất bại
            request.setAttribute("error", "Sai tên đăng nhập hoặc mật khẩu");
            request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
        }
    }
}

