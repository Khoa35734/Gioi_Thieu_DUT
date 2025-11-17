package controller;

import dao.AdminDAO;
import dao.NewsDAO;
import dao.FacultyDAO;
import dao.MajorDAO;
import model.Admin;
import model.News;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/dashboard")
public class DashboardServlet extends HttpServlet {
    private AdminDAO adminDAO;
    private NewsDAO newsDAO;
    private FacultyDAO facultyDAO;
    private MajorDAO majorDAO;

    @Override
    public void init() {
        adminDAO = new AdminDAO();
        newsDAO = new NewsDAO();
        facultyDAO = new FacultyDAO();
        majorDAO = new MajorDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/super/login");
            return;
        }

        Admin admin = (Admin) session.getAttribute("admin");

        // Get statistics based on role
        if (admin.isSuperAdmin()) {
            // Super Admin statistics
            List<News> allNews = newsDAO.getAllNews();
            List<Admin> allAdmins = adminDAO.getAllAdmins();
            
            request.setAttribute("totalNews", allNews.size());
            request.setAttribute("totalFaculties", facultyDAO.getAllFaculties().size());
            request.setAttribute("totalFacultyAdmins", allAdmins.stream()
                    .filter(a -> a.isFacultyAdmin()).count());
            request.setAttribute("totalMajors", majorDAO.getAllMajors().size());
            
            // Faculty admins list for table
            List<Admin> facultyAdmins = allAdmins.stream()
                    .filter(a -> a.isFacultyAdmin())
                    .toList();
            request.setAttribute("facultyAdmins", facultyAdmins);
            
            // Recent news (limit to 5)
            int newsCount = Math.min(5, allNews.size());
            if (newsCount > 0) {
                request.setAttribute("recentNews", allNews.subList(0, newsCount));
            } else {
                request.setAttribute("recentNews", allNews);
            }
            
            // Forward to Super Admin dashboard
            request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
        } else {
            // Faculty Admin - redirect to faculty dashboard
            response.sendRedirect(request.getContextPath() + "/admin/faculty/dashboard");
        }
    }
}
