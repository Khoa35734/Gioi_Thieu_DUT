<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ngành Học - ĐH Duy Tân</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <header>
        <nav>
            <div class="container">
                <h1>Trường Đại Học Duy Tân</h1>
                <ul class="menu">
                    <li><a href="home">Trang Chủ</a></li>
                    <li><a href="about.jsp">Giới Thiệu</a></li>
                    <li><a href="faculty">Các Khoa</a></li>
                    <li><a href="major" class="active">Ngành Học</a></li>
                    <li><a href="news">Tin Tức</a></li>
                    <li><a href="admin/login">Admin</a></li>
                </ul>
            </div>
        </nav>
    </header>

    <main>
        <div class="container">
            <h2>Các Ngành Đào Tạo</h2>

            <div class="major-list">
                <c:forEach var="major" items="${majors}">
                    <div class="major-item">
                        <h3>${major.name}</h3>
                        <c:if test="${not empty major.facultyName}">
                            <p class="faculty-name">Thuộc: ${major.facultyName}</p>
                        </c:if>
                    </div>
                </c:forEach>
            </div>
        </div>
    </main>

    <footer>
        <div class="container">
            <p>&copy; 2024 Trường Đại Học Duy Tân. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>

