<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${major != null ? 'Sửa' : 'Thêm'} Ngành</title>
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
            <h2>${major != null ? 'Sửa' : 'Thêm'} Ngành</h2>

            <form method="post" action="major-list">
                <c:if test="${major != null}">
                    <input type="hidden" name="id" value="${major.id}">
                </c:if>

                <div class="form-group">
                    <label for="name">Tên Ngành:</label>
                    <input type="text" id="name" name="name" value="${major.name}" required>
                </div>

                <div class="form-group">
                    <label for="facultyId">Thuộc Khoa:</label>
                    <select id="facultyId" name="facultyId" required>
                        <option value="">-- Chọn Khoa --</option>
                        <c:forEach var="faculty" items="${faculties}">
                            <option value="${faculty.id}"
                                ${major != null && major.facultyId == faculty.id ? 'selected' : ''}>
                                ${faculty.name}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">Lưu</button>
                    <a href="major-list" class="btn btn-secondary">Hủy</a>
                </div>
            </form>
        </main>
    </div>
</body>
</html>

