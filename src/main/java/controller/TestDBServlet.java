package controller;

import utils.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

@WebServlet("/test-db")
public class TestDBServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<title>Test Database Connection</title>");
        out.println("<style>");
        out.println("body { font-family: Arial; padding: 40px; background: #f5f5f5; }");
        out.println(".success { color: green; background: #e8f5e9; padding: 20px; border-radius: 10px; }");
        out.println(".error { color: red; background: #ffebee; padding: 20px; border-radius: 10px; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>🔌 Test Database Connection</h1>");
        
        try {
            Connection conn = DBConnection.getConnection();
            if (conn != null && !conn.isClosed()) {
                out.println("<div class='success'>");
                out.println("<h2>✅ Kết nối DATABASE thành công!</h2>");
                out.println("<p><strong>Database URL:</strong> jdbc:mysql://localhost:3306/gioi_thieu_dut</p>");
                out.println("<p><strong>User:</strong> root</p>");
                out.println("<p><strong>Status:</strong> Connected</p>");
                out.println("</div>");
                conn.close();
            } else {
                out.println("<div class='error'>");
                out.println("<h2>❌ Kết nối thất bại!</h2>");
                out.println("<p>Connection is null or closed</p>");
                out.println("</div>");
            }
        } catch (Exception e) {
            out.println("<div class='error'>");
            out.println("<h2>❌ LỖI KẾT NỐI DATABASE!</h2>");
            out.println("<p><strong>Error:</strong> " + e.getClass().getName() + "</p>");
            out.println("<p><strong>Message:</strong> " + e.getMessage() + "</p>");
            out.println("<h3>💡 Giải pháp:</h3>");
            out.println("<ul>");
            out.println("<li>Kiểm tra MySQL đã start chưa</li>");
            out.println("<li>Kiểm tra database 'gioi_thieu_dut' đã tạo chưa</li>");
            out.println("<li>Kiểm tra username/password trong DBConnection.java</li>");
            out.println("<li>Kiểm tra MySQL đang chạy ở port 3306</li>");
            out.println("</ul>");
            out.println("</div>");
        }
        
        out.println("<hr>");
        out.println("<h2>🔗 Links Test:</h2>");
        out.println("<ul>");
        out.println("<li><a href='" + request.getContextPath() + "/test'>Test Servlet cơ bản</a></li>");
        out.println("<li><a href='" + request.getContextPath() + "/admin/'>Trang chọn Admin</a></li>");
        out.println("<li><a href='" + request.getContextPath() + "/admin/super/login'>Login Super Admin</a></li>");
        out.println("<li><a href='" + request.getContextPath() + "/admin/faculty/login'>Login Faculty Admin</a></li>");
        out.println("</ul>");
        
        out.println("</body>");
        out.println("</html>");
    }
}
