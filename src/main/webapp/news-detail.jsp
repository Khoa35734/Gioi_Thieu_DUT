<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${news.title} - ĐH Duy Tân</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <header>
        <nav>
            <div class="container">
                <h1>Trường Đại Học Duy Tân</h1>
                <ul class="menu">
                    <li><a href="${pageContext.request.contextPath}/home">Trang Chủ</a></li>
                    <li><a href="${pageContext.request.contextPath}/about.jsp">Giới Thiệu</a></li>
                    <li><a href="${pageContext.request.contextPath}/faculty">Các Khoa</a></li>
                    <li><a href="${pageContext.request.contextPath}/major">Ngành Học</a></li>
                    <li><a href="${pageContext.request.contextPath}/news" class="active">Tin Tức</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/login">Admin</a></li>
                </ul>
            </div>
        </nav>
    </header>

    <main>
        <div class="container">
            <article class="news-detail">
                <h1>${news.title}</h1>
                <p class="news-date">Ngày đăng: ${news.createdDate}</p>

                <c:if test="${not empty news.thumbnail}">
                    <img src="${pageContext.request.contextPath}/${news.thumbnail}" alt="${news.title}" class="news-main-image">
                </c:if>

                <div class="news-body">
                    ${news.content}
                </div>

                <div class="news-actions">
                    <a href="${pageContext.request.contextPath}/news" class="btn">← Quay Lại Danh Sách</a>
                </div>
            </article>
        </div>
    </main>

    <footer>
        <div class="container">
            <p>&copy; 2024 Trường Đại Học Duy Tân. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>

