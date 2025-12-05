<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    <title>${news.title} - Trường Đại học Bách Khoa - Đại học Đà Nẵng</title>
    <meta name="description" content="${news.content.length() > 150 ? news.content.substring(0, 150) : news.content}">
    
    <!-- Favicon -->
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/favicon.png">
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    
    <style>
        .news-detail-wrapper {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 40px;
            margin: 40px 0;
        }
        
        .news-detail-title {
            color: #005FB7;
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 20px;
            line-height: 1.4;
        }
        
        .news-detail-meta {
            border-bottom: 2px solid #FDC32D;
            padding-bottom: 15px;
            margin-bottom: 30px;
        }
        
        .news-detail-meta span {
            margin-right: 20px;
            color: #666;
        }
        
        .news-detail-meta i {
            color: #005FB7;
        }
        
        .news-detail-image {
            width: 100%;
            max-width: 800px;
            height: auto;
            border-radius: 10px;
            margin: 30px auto;
            display: block;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        
        .news-detail-content {
            font-size: 1.1rem;
            line-height: 1.8;
            color: #333;
            text-align: justify;
        }
        
        .news-detail-content p {
            margin-bottom: 20px;
        }
        
        .breadcrumb-section {
            background: #f8f9fa;
            padding: 20px 0;
            margin-bottom: 20px;
        }
        
        .back-button {
            background: #005FB7;
            color: white;
            padding: 12px 30px;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            margin-top: 30px;
            transition: all 0.3s;
        }
        
        .back-button:hover {
            background: #004a94;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(0,95,183,0.3);
        }
    </style>
</head>
<body>
    <!-- Header -->
    <jsp:include page="components/header.jsp" />
    
    <!-- Breadcrumb -->
    <section class="breadcrumb-section">
        <div class="container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/news">Tin tức</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Chi tiết tin tức</li>
                </ol>
            </nav>
        </div>
    </section>

    <!-- Main Content -->
    <main>
        <div class="container">
            <div class="news-detail-wrapper">
                <article class="news-detail">
                    <h1 class="news-detail-title">${news.title}</h1>
                    
                    <div class="news-detail-meta">
                        <span>
                            <i class="bi bi-calendar3 me-1"></i>
                            <fmt:formatDate value="${news.createdDate}" pattern="dd/MM/yyyy"/>
                        </span>
                        <span>
                            <i class="bi bi-person-circle me-1"></i>
                            <c:choose>
                                <c:when test="${not empty news.authorName}">
                                    ${news.authorName}
                                </c:when>
                                <c:otherwise>
                                    Ban Truyền thông
                                </c:otherwise>
                            </c:choose>
                        </span>
                        <span>
                            <i class="bi bi-eye me-1"></i>
                            ${news.views != null ? news.views : 0} lượt xem
                        </span>
                        <c:if test="${not empty news.facultyName}">
                            <span>
                                <i class="bi bi-building me-1"></i>
                                ${news.facultyName}
                            </span>
                        </c:if>
                    </div>

                    <c:if test="${not empty news.thumbnail}">
                        <img src="${pageContext.request.contextPath}/${news.thumbnail}" 
                             alt="${news.title}" 
                             class="news-detail-image">
                    </c:if>

                    <div class="news-detail-content">
                        ${news.content}
                    </div>

                    <div class="text-center">
                        <a href="${pageContext.request.contextPath}/news" class="back-button">
                            <i class="bi bi-arrow-left me-2"></i>Quay lại danh sách tin tức
                        </a>
                    </div>
                </article>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <jsp:include page="components/footer.jsp" />
    
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

