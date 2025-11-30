<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${faculty != null ? 'Sửa' : 'Thêm'} Khoa</title>
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
            <h2>${faculty != null ? 'Sửa' : 'Thêm'} Khoa</h2>

            <form method="post" action="faculty-list">
                <c:if test="${faculty != null}">
                    <input type="hidden" name="id" value="${faculty.id}">
                </c:if>

                <div class="form-group">
                    <label for="name">Tên Khoa:</label>
                    <input type="text" id="name" name="name" value="${faculty.name}" required>
                </div>

                <div class="form-group">
                    <label for="description">Mô Tả:</label>
                    <textarea id="description" name="description" rows="5" required>${faculty.description}</textarea>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">Lưu</button>
                    <a href="faculty-list" class="btn btn-secondary">Hủy</a>
                </div>
            </form>
        </main>
    </div>
</body>
</html>

