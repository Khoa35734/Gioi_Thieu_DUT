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

            <!-- Nếu đang quản lý theo 1 khoa cụ thể, hiển thị thông tin khoa -->
            <c:if test="${not empty faculty}">
                <div class="info">
                    <strong>Quản lý ngành cho khoa:</strong> ${faculty.name}
                </div>
            </c:if>

            <div class="admin-actions">
                <c:choose>
                    <c:when test="${not empty faculty}">
                        <a href="major-list?action=new&facultyId=${faculty.id}" class="btn btn-primary">+ Thêm Ngành Mới</a>
                        <a href="major-list" class="btn btn-secondary">Xem Tất Cả Ngành</a>
                    </c:when>
                    <c:otherwise>
                        <a href="major-list?action=new" class="btn btn-primary">+ Thêm Ngành Mới</a>
                    </c:otherwise>
                </c:choose>
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
                                <c:choose>
                                    <c:when test="${not empty faculty}">
                                        <a href="major-list?action=edit&id=${major.id}&facultyId=${faculty.id}" class="btn btn-sm btn-warning">Sửa</a>
                                        <a href="major-list?action=delete&id=${major.id}&facultyId=${faculty.id}" class="btn btn-sm btn-danger"
                                           onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="major-list?action=edit&id=${major.id}" class="btn btn-sm btn-warning">Sửa</a>
                                        <a href="major-list?action=delete&id=${major.id}" class="btn btn-sm btn-danger"
                                           onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</a>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </main>
    </div>
</body>
</html>
