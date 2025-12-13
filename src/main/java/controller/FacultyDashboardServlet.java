package controller;

import bo.NewsBO;
import bo.MajorBO;
import model.Admin;
import model.News;
import model.Major;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/faculty/dashboard")
public class FacultyDashboardServlet extends HttpServlet {
    private NewsBO newsBO;
    private MajorBO majorBO;

    @Override
    public void init() {
        newsBO = new NewsBO();
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

        // Check if faculty admin has facultyId
        Integer facultyId = admin.getFacultyId();
        if (facultyId == null) {
            System.out.println("ERROR: Faculty admin has no facultyId assigned!");
            request.setAttribute("error", "Tài khoản admin khoa chưa được gán khoa. Vui lòng liên hệ Super Admin.");
            request.getRequestDispatcher("/admin/faculty/faculty-dashboard.jsp").forward(request, response);
            return;
        }

        // Get faculty statistics using BO
        int totalNews = newsBO.getTotalNewsCount(admin);
        int totalMajors = majorBO.getTotalMajorsCount(admin);
        List<News> recentNews = newsBO.getRecentNews(admin, 5);
        List<Major> facultyMajors = majorBO.getMajorsForAdmin(admin);
        
        request.setAttribute("totalNews", totalNews);
        request.setAttribute("totalMajors", totalMajors);
        request.setAttribute("newNewsThisMonth", 5); // TODO: Calculate from DB
        request.setAttribute("activeMajors", totalMajors);
        request.setAttribute("monthlyViews", 1250); // TODO: Calculate from DB
        request.setAttribute("viewsGrowth", 15); // TODO: Calculate from DB
        request.setAttribute("pendingNews", 3); // TODO: Calculate from DB
        request.setAttribute("totalViews", 5420); // TODO: Calculate from DB
        
        // Faculty majors list for table
        request.setAttribute("facultyMajors", facultyMajors);
        
        // Recent news
        request.setAttribute("recentNews", recentNews);

        request.getRequestDispatcher("/admin/faculty/faculty-dashboard.jsp").forward(request, response);
    }
}
