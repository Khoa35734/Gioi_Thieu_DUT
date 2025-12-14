package controller;

import dao.NewsDAO;
import dao.MajorDAO;
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
    private NewsDAO newsDAO;
    private MajorDAO majorDAO;

    @Override
    public void init() {
        newsDAO = new NewsDAO();
        majorDAO = new MajorDAO();
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

        // Get faculty statistics
        List<News> facultyNews = newsDAO.getNewsByFaculty(facultyId);
        List<Major> facultyMajors = majorDAO.getMajorsByFaculty(facultyId);
        
        request.setAttribute("totalNews", facultyNews.size());
        request.setAttribute("totalMajors", facultyMajors.size());
        request.setAttribute("newNewsThisMonth", 5); // TODO: Calculate from DB
        request.setAttribute("activeMajors", facultyMajors.size());
        request.setAttribute("monthlyViews", 1250); // TODO: Calculate from DB
        request.setAttribute("viewsGrowth", 15); // TODO: Calculate from DB
        request.setAttribute("pendingNews", 3); // TODO: Calculate from DB
        request.setAttribute("totalViews", 5420); // TODO: Calculate from DB
        
        // Faculty majors list for table
        request.setAttribute("facultyMajors", facultyMajors);
        
        // Recent news (limit to 5)
        int newsCount = Math.min(5, facultyNews.size());
        if (newsCount > 0) {
            request.setAttribute("recentNews", facultyNews.subList(0, newsCount));
        } else {
            request.setAttribute("recentNews", facultyNews);
        }

        request.getRequestDispatcher("/admin/faculty/faculty-dashboard.jsp").forward(request, response);
    }
}
