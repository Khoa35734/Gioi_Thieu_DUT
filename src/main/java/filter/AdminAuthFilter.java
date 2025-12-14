package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Admin;

import java.io.IOException;

@WebFilter("/admin/*")
public class AdminAuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String path = req.getRequestURI();
        String contextPath = req.getContextPath();

        // Allow direct access to login paths, logout, and static resources
        if (path.equals(contextPath + "/admin/login") ||
            path.equals(contextPath + "/admin/super/login") ||
            path.equals(contextPath + "/admin/faculty/login") ||
            path.equals(contextPath + "/admin/logout") ||
            path.endsWith("login.jsp") ||
            path.contains("/admin/assets/") ||
            path.contains("/assets/")) {
            chain.doFilter(request, response);
            return;
        }

        // Check session
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            res.sendRedirect(contextPath + "/admin/login");
            return;
        }

        Admin admin = (Admin) session.getAttribute("admin");
        String role = admin.getRole();

        // Role-based access control
        if ("super_admin".equals(role)) {
            // Super Admin can access everything.
            chain.doFilter(request, response);
            return;
        } else if ("faculty_admin".equals(role)) {
            // Faculty Admin can only access specific paths.
            if (path.startsWith(contextPath + "/admin/faculty") ||
                path.startsWith(contextPath + "/admin/news") ||
                path.startsWith(contextPath + "/admin/major")) {
                chain.doFilter(request, response);
                return;
            } else {
                // Redirect to faculty admin dashboard if trying to access other paths.
                res.sendRedirect(contextPath + "/admin/faculty-dashboard");
                return;
            }
        }

        // If no valid role, redirect to login
        res.sendRedirect(contextPath + "/admin/login");
    }

    @Override
    public void init(FilterConfig fConfig) throws ServletException {
    }

    @Override
    public void destroy() {
    }
}
