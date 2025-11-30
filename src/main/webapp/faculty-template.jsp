<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Khoa ${faculty.name} - Đại học Bách Khoa Đà Nẵng</title>
    <meta name="description" content="${faculty.description}">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    
    <style>
        .faculty-hero {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('${pageContext.request.contextPath}/assets/img/faculty-bg.jpg') no-repeat center center;
            background-size: cover;
            padding: 8rem 0;
            color: white;
            text-align: center;
        }
        .faculty-hero h1 {
            font-size: 3.5rem;
            font-weight: 700;
        }
        .faculty-hero p {
            font-size: 1.2rem;
            max-width: 700px;
            margin: 1rem auto 0;
        }
        .section-title {
            text-align: center;
            margin-bottom: 3rem;
            font-weight: 700;
            color: #005FB7;
        }
        .major-card {
            background: #fff;
            border: 1px solid #e9ecef;
            border-radius: 8px;
            padding: 2rem;
            margin-bottom: 1.5rem;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .major-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
        }
        .major-card h4 {
            color: #005FB7;
            font-weight: 600;
        }
        .news-card {
            display: flex;
            flex-direction: column;
            height: 100%;
            border: 1px solid #e9ecef;
            border-radius: 8px;
            overflow: hidden;
        }
        .news-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .news-card .card-body {
            flex-grow: 1;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <jsp:include page="components/header.jsp" />

    <!-- Faculty Hero Section -->
    <section class="faculty-hero">
        <div class="container">
            <h1 class="animate__animated animate__fadeInDown">Khoa ${faculty.name}</h1>
            <p class="animate__animated animate__fadeInUp">${faculty.description}</p>
        </div>
    </section>

    <main class="container py-5">
        <!-- Majors Section -->
        <section id="majors" class="mb-5">
            <h2 class="section-title">Các Ngành Đào Tạo</h2>
            <div class="row">
                <c:choose>
                    <c:when test="${not empty majors}">
                        <c:forEach var="major" items="${majors}">
                            <div class="col-md-6">
                                <div class="major-card">
                                    <h4><i class="bi bi-mortarboard-fill me-2"></i>${major.name}</h4>
                                    <p class="text-muted">Mã ngành: ${major.majorCode}</p>
                                    <p>${major.description}</p>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p class="text-center">Chưa có thông tin về các ngành đào tạo.</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>

        <!-- News Section -->
        <section id="news">
            <h2 class="section-title">Tin Tức & Sự Kiện</h2>
            <div class="row">
                <c:choose>
                    <c:when test="${not empty newsList}">
                        <c:forEach var="newsItem" items="${newsList}">
                            <div class="col-md-4 mb-4">
                                <div class="card news-card">
                                    <img src="${pageContext.request.contextPath}/${newsItem.thumbnail}" class="card-img-top" alt="${newsItem.title}">
                                    <div class="card-body">
                                        <h5 class="card-title">${newsItem.title}</h5>
                                        <p class="card-text text-muted">
                                            <small><i class="bi bi-calendar-event me-1"></i> <fmt:formatDate value="${newsItem.createdDate}" pattern="dd/MM/yyyy"/></small>
                                        </p>
                                        <a href="#" class="btn btn-primary">Đọc thêm</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p class="text-center">Chưa có bài viết nào cho khoa này.</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <jsp:include page="components/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
