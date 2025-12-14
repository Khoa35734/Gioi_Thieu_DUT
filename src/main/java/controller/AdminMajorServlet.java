package controller;

import dao.MajorDAO;
import dao.FacultyDAO;
import model.Major;
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

@WebServlet("/admin/major-list")
public class AdminMajorServlet extends HttpServlet {

    private MajorDAO majorDAO = new MajorDAO();
    private FacultyDAO facultyDAO = new FacultyDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        HttpSession session = request.getSession(false);
        Admin currentAdmin = null;
        if (session != null) {
            currentAdmin = (Admin) session.getAttribute("admin");
        }

        // Lấy facultyId nếu có (khi quản lý ngành theo từng khoa)
        String facultyIdStr = request.getParameter("facultyId");
        Faculty faculty = null;
        Integer facultyId = null;
        if (facultyIdStr != null && !facultyIdStr.isEmpty()) {
            try {
                facultyId = Integer.parseInt(facultyIdStr);
                faculty = facultyDAO.getFacultyById(facultyId);
                request.setAttribute("faculty", faculty);
            } catch (NumberFormatException e) {
                // bỏ qua nếu không hợp lệ
            }
        }

        // Nếu admin hiện tại bị ràng buộc vào 1 khoa, ép facultyId theo admin
        if (currentAdmin != null && "FACULTY".equals(currentAdmin.getRole()) && currentAdmin.getFacultyId() > 0) {
            facultyId = currentAdmin.getFacultyId();
            faculty = facultyDAO.getFacultyById(facultyId);
            request.setAttribute("faculty", faculty);
        }

        if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Major major = majorDAO.getMajorById(id);
            // nếu admin bị ràng buộc khoa, không cho edit major của khoa khác
            if (currentAdmin != null && "FACULTY".equals(currentAdmin.getRole()) && major != null
                    && major.getFacultyId() != currentAdmin.getFacultyId()) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN, "Bạn không có quyền chỉnh sửa ngành này.");
                return;
            }
            List<Faculty> faculties = facultyDAO.getAllFaculties();
            request.setAttribute("major", major);
            request.setAttribute("faculties", faculties);
            // giữ context faculty nếu có
            request.getRequestDispatcher("/admin/major-form.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Major major = majorDAO.getMajorById(id);
            // kiểm tra quyền
            if (currentAdmin != null && "FACULTY".equals(currentAdmin.getRole())) {
                if (major != null && major.getFacultyId() != currentAdmin.getFacultyId()) {
                    response.sendError(HttpServletResponse.SC_FORBIDDEN, "Bạn không có quyền xóa ngành này.");
                    return;
                }
            }
            majorDAO.deleteMajor(id);
            // Quay lại danh sách, giữ facultyId nếu có
            if (facultyId != null) {
                response.sendRedirect("major-list?facultyId=" + facultyId);
            } else {
                response.sendRedirect("major-list");
            }
        } else if ("new".equals(action)) {
            List<Faculty> faculties = facultyDAO.getAllFaculties();
            request.setAttribute("faculties", faculties);
            // nếu truy cập từ 1 khoa cụ thể, faculty đã được set ở trên
            request.getRequestDispatcher("/admin/major-form.jsp").forward(request, response);
        } else {
            List<Major> majors;
            if (facultyId != null) {
                majors = majorDAO.getMajorsByFaculty(facultyId);
            } else {
                majors = majorDAO.getAllMajors();
            }
            request.setAttribute("majors", majors);
            request.getRequestDispatcher("/admin/major-list.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);
        Admin currentAdmin = null;
        if (session != null) {
            currentAdmin = (Admin) session.getAttribute("admin");
        }

        String idStr = request.getParameter("id");
        String name = request.getParameter("name");
        String facultyIdStr = request.getParameter("facultyId");
        int facultyId = 0;
        if (facultyIdStr != null && !facultyIdStr.isEmpty()) {
            try {
                facultyId = Integer.parseInt(facultyIdStr);
            } catch (NumberFormatException e) {
                facultyId = 0;
            }
        }

        // Nếu admin bị ràng buộc khoa, ép facultyId theo admin (không cho override)
        if (currentAdmin != null && "FACULTY".equals(currentAdmin.getRole()) && currentAdmin.getFacultyId() > 0) {
            facultyId = currentAdmin.getFacultyId();
        }

        Major major = new Major();
        major.setName(name);
        major.setFacultyId(facultyId);

        if (idStr != null && !idStr.isEmpty()) {
            major.setId(Integer.parseInt(idStr));
            // nếu admin bị ràng buộc khoa, đảm bảo major thuộc khoa đó
            if (currentAdmin != null && "FACULTY".equals(currentAdmin.getRole())) {
                Major existing = majorDAO.getMajorById(major.getId());
                if (existing != null && existing.getFacultyId() != currentAdmin.getFacultyId()) {
                    response.sendError(HttpServletResponse.SC_FORBIDDEN, "Bạn không có quyền cập nhật ngành này.");
                    return;
                }
            }
            majorDAO.updateMajor(major);
        } else {
            majorDAO.addMajor(major);
        }

        // Quay lại danh sách, giữ facultyId nếu tồn tại
        if (facultyId > 0) {
            response.sendRedirect("major-list?facultyId=" + facultyId);
        } else {
            response.sendRedirect("major-list");
        }
    }
}
