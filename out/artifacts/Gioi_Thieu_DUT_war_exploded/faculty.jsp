<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Các Khoa - ĐH Duy Tân</title>
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
                    <li><a href="faculty" class="active">Các Khoa</a></li>
                    <li><a href="major">Ngành Học</a></li>
                    <li><a href="news">Tin Tức</a></li>
                    <li><a href="admin/login">Admin</a></li>
                </ul>
            </div>
        </nav>
    </header>

    <main>
        <div class="container">
            <h2>Các Khoa Đào Tạo</h2>

            <div class="faculty-list">
                <c:forEach var="faculty" items="${faculties}">
                    <div class="faculty-item">
                        <h3>${faculty.name}</h3>
                        <p>${faculty.description}</p>
                        <a href="major?facultyId=${faculty.id}" class="btn">Xem Ngành Học</a>
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

