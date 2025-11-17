<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Tin Tức</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>
    <div class="admin-container">
        <aside class="admin-sidebar">
            <h3>Admin Panel</h3>
            <ul>
                <li><a href="faculty-list">Quản Lý Khoa</a></li>
                <li><a href="major-list">Quản Lý Ngành</a></li>
                <li><a href="news-list" class="active">Quản Lý Tin Tức</a></li>
                <li><a href="${pageContext.request.contextPath}/home">Xem Trang Chủ</a></li>
            </ul>
        </aside>

        <main class="admin-content">
            <h2>Danh Sách Tin Tức</h2>

            <div class="admin-actions">
                <a href="news-list?action=new" class="btn btn-primary">+ Thêm Tin Mới</a>
            </div>

            <table class="admin-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tiêu Đề</th>
                        <th>Ngày Đăng</th>
                        <th>Hành Động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="news" items="${newsList}">
                        <tr>
                            <td>${news.id}</td>
                            <td>${news.title}</td>
                            <td>${news.createdDate}</td>
                            <td>
                                <a href="news-list?action=edit&id=${news.id}" class="btn btn-sm btn-warning">Sửa</a>
                                <a href="news-list?action=delete&id=${news.id}" class="btn btn-sm btn-danger"
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

