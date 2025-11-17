<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Ngành</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>
    <div class="admin-container">
        <aside class="admin-sidebar">
            <h3>Admin Panel</h3>
            <ul>
                <li><a href="faculty-list">Quản Lý Khoa</a></li>
                <li><a href="major-list" class="active">Quản Lý Ngành</a></li>
                <li><a href="news-list">Quản Lý Tin Tức</a></li>
                <li><a href="${pageContext.request.contextPath}/home">Xem Trang Chủ</a></li>
            </ul>
        </aside>

        <main class="admin-content">
            <h2>Danh Sách Ngành</h2>

            <div class="admin-actions">
                <a href="major-list?action=new" class="btn btn-primary">+ Thêm Ngành Mới</a>
            </div>

            <table class="admin-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên Ngành</th>
                        <th>Thuộc Khoa</th>
                        <th>Hành Động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="major" items="${majors}">
                        <tr>
                            <td>${major.id}</td>
                            <td>${major.name}</td>
                            <td>${major.facultyName}</td>
                            <td>
                                <a href="major-list?action=edit&id=${major.id}" class="btn btn-sm btn-warning">Sửa</a>
                                <a href="major-list?action=delete&id=${major.id}" class="btn btn-sm btn-danger"
                                   onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </main>
    </div>
</body>
</html>

