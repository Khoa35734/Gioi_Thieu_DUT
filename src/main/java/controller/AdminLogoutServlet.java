package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/logout")
public class AdminLogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        if (session != null) {
            // Get admin role before invalidating session
            String adminRole = (String) session.getAttribute("adminRole");
            
            // Invalidate session
            session.invalidate();
            
            // Remove cookies
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("adminUsername".equals(cookie.getName()) || 
                        "facultyAdminUsername".equals(cookie.getName())) {
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    }
                }
            }
            
            // Redirect to appropriate login page
            if ("super_admin".equals(adminRole)) {
                response.sendRedirect(request.getContextPath() + "/admin/super/login");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/faculty/login");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}
