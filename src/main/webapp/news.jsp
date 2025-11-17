<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tin Tức - ĐH Duy Tân</title>
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
                    <li><a href="major">Ngành Học</a></li>
                    <li><a href="news" class="active">Tin Tức</a></li>
                    <li><a href="admin/login">Admin</a></li>
                </ul>
            </div>
        </nav>
    </header>

    <main>
        <div class="container">
            <h2>Tin Tức & Sự Kiện</h2>

            <div class="news-list">
                <c:forEach var="news" items="${newsList}">
                    <div class="news-item">
                        <c:if test="${not empty news.thumbnail}">
                            <img src="${news.thumbnail}" alt="${news.title}" class="news-thumbnail">
                        </c:if>
                        <div class="news-content">
                            <h3>${news.title}</h3>
                            <p class="news-date">${news.createdDate}</p>
                            <a href="news?action=detail&id=${news.id}" class="btn">Xem Chi Tiết</a>
                        </div>
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

