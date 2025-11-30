<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Khoa</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>
    <div class="admin-container">
        <aside class="admin-sidebar">
            <h3>Admin Panel</h3>
            <ul>
                <li><a href="faculty-list" class="active">Quản Lý Khoa</a></li>
                <li><a href="major-list">Quản Lý Ngành</a></li>
                <li><a href="news-list">Quản Lý Tin Tức</a></li>
                <li><a href="${pageContext.request.contextPath}/home">Xem Trang Chủ</a></li>
            </ul>
        </aside>

        <main class="admin-content">
            <h2>Danh Sách Khoa</h2>

            <!-- Hiển thị credentials admin vừa tạo (nếu có) -->
            <c:if test="${not empty sessionScope.newFacultyAdmin}">
                <div style="padding:12px; border:1px solid #4caf50; background:#f0fff4; margin-bottom:12px;">
                    <strong>Tài khoản admin khoa mới đã được tạo:</strong>
                    <p>Username: <b>${sessionScope.newFacultyAdmin.username}</b></p>
                    <p>Password: <b>${sessionScope.newFacultyAdmin.password}</b></p>
                    <p>Thuộc khoa: <b>${sessionScope.newFacultyAdmin.fullName}</b></p>
                </div>
                <%-- Xóa session attribute để chỉ hiển thị 1 lần --%>
                <%
                    session.removeAttribute("newFacultyAdmin");
                %>
            </c:if>

            <div class="admin-actions">
                <a href="faculty-list?action=new" class="btn btn-primary">+ Thêm Khoa Mới</a>
            </div>

            <table class="admin-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên Khoa</th>
                        <th>Mô Tả</th>
                        <th>Hành Động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="faculty" items="${faculties}">
                        <tr>
                            <td>${faculty.id}</td>
                            <td>${faculty.name}</td>
                            <td>${faculty.description}</td>
                            <td>
                                <a href="faculty-list?action=edit&id=${faculty.id}" class="btn btn-sm btn-warning">Sửa</a>
                                <a href="faculty-list?action=delete&id=${faculty.id}" class="btn btn-sm btn-danger"
                                   onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</a>
                                <!-- New: Manage majors for this faculty -->
                                <a href="major-list?facultyId=${faculty.id}" class="btn btn-sm btn-info">Quản Lý Ngành</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </main>
    </div>
</body>
</html>
