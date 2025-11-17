<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // Lấy danh sách admin từ AdminDAO (demo in-memory)
    dao.AdminDAO adminDAO = new dao.AdminDAO();
    java.util.List demoAdmins = adminDAO.getAllAdmins();
    request.setAttribute("demoAdmins", demoAdmins);
%>
<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2>
        <form action="${pageContext.request.contextPath}/admin/login" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <button type="submit">Login</button>
            </div>
            <% if (request.getAttribute("error") != null) { %>
                <p class="error"><%= request.getAttribute("error") %></p>
            <% } %>
        </form>

        <!-- Dynamic demo accounts for testing (no DB) -->
        <div class="demo-accounts" style="margin-top:20px; padding:12px; border:1px dashed #ccc; background:#fafafa;">
            <h4>Demo accounts (no DB) — dùng để test</h4>
            <p>Danh sách tài khoản hiện có (tài khoản mới tạo sẽ xuất hiện ở đây):</p>
            <table style="width:100%; border-collapse:collapse; font-size:14px;">
                <thead>
                    <tr>
                        <th style="text-align:left; padding:6px; border-bottom:1px solid #ddd">Username</th>
                        <th style="text-align:left; padding:6px; border-bottom:1px solid #ddd">Password</th>
                        <th style="text-align:left; padding:6px; border-bottom:1px solid #ddd">Quyền</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="adm" items="${demoAdmins}">
                        <tr>
                            <td style="padding:6px; border-bottom:1px solid #eee">${adm.username}</td>
                            <td style="padding:6px; border-bottom:1px solid #eee">${adm.password}</td>
                            <td style="padding:6px; border-bottom:1px solid #eee">${adm.role}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <p style="margin-top:8px; color:#666;">Ghi chú: những tài khoản này được lưu trong bộ nhớ ứng dụng (AdminDAO) cho mục đích demo.</p>
        </div>
    </div>
</body>
</html>