<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Tin Tức & Sự Kiện - Trường Đại học Bách Khoa - Đại học Đà Nẵng</title>
    <meta name="description" content="Tin tức và sự kiện của Trường Đại học Bách Khoa - Đại học Đà Nẵng">

    <!-- Favicon -->
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/favicon.png">

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

    <style>
        .page-header {
            background: linear-gradient(135deg, #005FB7 0%, #003d82 100%);
            color: white;
            padding: 4rem 0 2rem;
            margin-bottom: 3rem;
        }

        .page-header h1 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .breadcrumb {
            background: transparent;
            margin-bottom: 0;
            padding: 0;
        }

        .breadcrumb-item a {
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
        }

        .breadcrumb-item.active {
            color: white;
        }

        .news-grid {
            margin-bottom: 3rem;
        }

        .news-card {
            background: white;
            border-radius: 1rem;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            border: none;
            margin-bottom: 2rem;
            height: 100%;
        }

        .news-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 24px rgba(0,95,183,0.2);
        }

        .news-image {
            position: relative;
            height: 250px;
            overflow: hidden;
        }

        .news-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .news-card:hover .news-image img {
            transform: scale(1.1);
        }

        .news-badge {
            position: absolute;
            bottom: 15px;
            left: 15px;
            padding: 0.5rem 1rem;
            border-radius: 2rem;
            font-size: 0.85rem;
            font-weight: 600;
            z-index: 2;
            background: #005FB7;
            color: white;
        }

        .news-category {
            position: absolute;
            top: 15px;
            right: 15px;
            padding: 0.4rem 1rem;
            border-radius: 2rem;
            font-size: 0.8rem;
            font-weight: 600;
            z-index: 2;
        }

        .news-card .card-body {
            padding: 1.5rem;
        }

        .news-card .card-title {
            font-size: 1.2rem;
            line-height: 1.4;
            min-height: 60px;
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .news-card .card-title a {
            color: #333;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .news-card .card-title a:hover {
            color: #005FB7;
        }

        .news-meta {
            padding-top: 0.5rem;
            border-top: 1px solid #e9ecef;
            margin-bottom: 1rem;
        }

        .btn-read-more {
            border-color: #005FB7;
            color: #005FB7;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-read-more:hover {
            background-color: #005FB7;
            border-color: #005FB7;
            color: white;
            transform: translateX(5px);
        }
    </style>
</head>
<body>
    <!-- Header -->
    <jsp:include page="components/header.jsp" />

    <!-- Page Header -->
    <section class="page-header">
        <div class="container">
            <h1><i class="bi bi-newspaper me-2"></i>Tin Tức & Sự Kiện</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Tin tức</li>
                </ol>
            </nav>
        </div>
    </section>

    <!-- News List -->
    <section class="news-grid py-5">
        <div class="container">
            <div class="row g-4">
                <c:forEach var="news" items="${newsList}">
                    <div class="col-lg-4 col-md-6">
                        <article class="news-card h-100" itemscope itemtype="https://schema.org/NewsArticle">
                            <!-- Show image only if thumbnail exists -->
                            <c:if test="${not empty news.thumbnail}">
                                <div class="news-image">
                                    <img src="${pageContext.request.contextPath}/${news.thumbnail}"
                                         class="card-img-top"
                                         alt="${news.title}"
                                         loading="lazy"
                                         itemprop="image"
                                         onerror="this.parentElement.style.display='none'">
                                    <div class="news-badge">
                                        <i class="bi bi-calendar3 me-1"></i>${news.createdDate}
                                    </div>
                                    <c:choose>
                                        <c:when test="${not empty news.facultyName}">
                                            <div class="news-category bg-warning text-primary">${news.facultyName}</div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="news-category bg-info text-white">Tin Trường</div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </c:if>

                            <div class="card-body d-flex flex-column">
                                <!-- Faculty badge if no image -->
                                <c:if test="${empty news.thumbnail}">
                                    <div class="mb-2">
                                        <c:choose>
                                            <c:when test="${not empty news.facultyName}">
                                                <span class="badge bg-warning text-primary">
                                                    <i class="bi bi-building me-1"></i>${news.facultyName}
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-info text-white">
                                                    <i class="bi bi-megaphone me-1"></i>Tin Trường
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                        <span class="badge bg-light text-dark ms-2">
                                            <i class="bi bi-calendar3 me-1"></i>${news.createdDate}
                                        </span>
                                    </div>
                                </c:if>

                                <h3 class="card-title" itemprop="headline">
                                    <a href="${pageContext.request.contextPath}/news?action=detail&id=${news.id}">
                                        ${news.title}
                                    </a>
                                </h3>

                                <div class="news-meta mb-3">
                                    <span class="text-muted small">
                                        <i class="bi bi-person-circle me-1"></i>
                                        <span itemprop="author">
                                            <c:choose>
                                                <c:when test="${not empty news.authorName}">
                                                    ${news.authorName}
                                                </c:when>
                                                <c:otherwise>
                                                    Ban Truyền thông
                                                </c:otherwise>
                                            </c:choose>
                                        </span>
                                    </span>
                                    <span class="text-muted small ms-3">
                                        <i class="bi bi-eye me-1"></i>
                                        <c:choose>
                                            <c:when test="${news.views > 0}">
                                                ${news.views} lượt xem
                                            </c:when>
                                            <c:otherwise>
                                                Mới đăng
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>

                                <p class="card-text text-muted flex-grow-1" itemprop="description">
                                    <c:choose>
                                        <c:when test="${news.content.length() > 150}">
                                            ${news.content.substring(0, 150)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${news.content}
                                        </c:otherwise>
                                    </c:choose>
                                </p>

                                <a href="${pageContext.request.contextPath}/news?action=detail&id=${news.id}"
                                   class="btn btn-outline-primary mt-auto btn-read-more">
                                    <i class="bi bi-arrow-right-circle me-2"></i>Đọc thêm
                                </a>
                            </div>
                            <meta itemprop="datePublished" content="${news.createdDate}">
                        </article>
                    </div>
                </c:forEach>
            </div>

            <!-- No news message -->
            <c:if test="${empty newsList}">
                <div class="row">
                    <div class="col-12 text-center py-5">
                        <i class="bi bi-inbox display-1 text-muted"></i>
                        <h3 class="mt-3 text-muted">Chưa có tin tức nào</h3>
                        <p class="text-muted">Vui lòng quay lại sau!</p>
                    </div>
                </div>
            </c:if>
        </div>
    </section>

    <!-- Footer -->
    <jsp:include page="components/footer.jsp" />

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

