<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- News Section -->
<section id="news" class="news-section py-5">
    <div class="container">
        <div class="row mb-5">
            <div class="col-12 text-center">
                <h2 class="section-title fw-bold text-primary mb-3">HOẠT ĐỘNG NỔI BẬT</h2>
                <p class="lead text-muted">Tin tức và sự kiện của trường</p>
                <div class="title-divider mx-auto"></div>
            </div>
        </div>

        <div class="row g-4">
            <c:forEach var="news" items="${newsList}" varStatus="loop" begin="0" end="2">
                <div class="col-lg-4 col-md-6">
                    <article class="news-card h-100" itemscope itemtype="https://schema.org/NewsArticle">
                        <div class="news-image">
                            <img src="${pageContext.request.contextPath}/${news.thumbnail}"
                                 class="card-img-top"
                                 alt="${news.title}"
                                 loading="lazy"
                                 itemprop="image"
                                 onerror="this.src='https://via.placeholder.com/400x300/005FB7/ffffff?text=Hinh+Anh'">
                            <div class="news-badge bg-primary text-white">
                                <i class="bi bi-calendar3 me-1"></i>${news.createdDate}
                            </div>
                            <div class="news-category bg-warning text-primary">Sự kiện</div>
                        </div>
                        <div class="card-body d-flex flex-column">
                            <h3 class="card-title fw-bold mb-3" itemprop="headline">
                                <a href="${pageContext.request.contextPath}/news-detail?id=${news.id}" class="text-decoration-none text-dark">
                                    ${news.title}
                                </a>
                            </h3>
                            <div class="news-meta mb-3">
                                <span class="text-muted small">
                                    <i class="bi bi-person-circle me-1"></i>
                                    <span itemprop="author">Ban Truyền thông</span>
                                </span>
                                <span class="text-muted small ms-3">
                                    <i class="bi bi-eye me-1"></i>1,234 lượt xem
                                </span>
                            </div>
                            <p class="card-text text-muted flex-grow-1" itemprop="description">
                                ${news.content.substring(0, 150)}...
                            </p>
                            <a href="${pageContext.request.contextPath}/news-detail?id=${news.id}"
                               class="btn btn-outline-primary mt-auto">
                                <i class="bi bi-arrow-right-circle me-2"></i>Đọc thêm
                            </a>
                        </div>
                        <meta itemprop="datePublished" content="${news.createdDate}">
                    </article>
                </div>
            </c:forEach>
        </div>

        <!-- Statistics Section -->
        <div class="row mt-5 pt-5">
            <div class="col-12">
                <div class="stats-wrapper p-5 rounded shadow-sm">
                    <div class="row g-4 text-center">
                        <div class="col-md-3 col-6">
                            <div class="stat-item">
                                <div class="stat-icon mb-3">
                                    <i class="bi bi-people-fill"></i>
                                </div>
                                <h3 class="stat-number fw-bold text-primary mb-2" data-target="15000">0</h3>
                                <p class="stat-label text-muted mb-0">Sinh viên</p>
                            </div>
                        </div>
                        <div class="col-md-3 col-6">
                            <div class="stat-item">
                                <div class="stat-icon mb-3">
                                    <i class="bi bi-mortarboard-fill"></i>
                                </div>
                                <h3 class="stat-number fw-bold text-primary mb-2" data-target="500">0</h3>
                                <p class="stat-label text-muted mb-0">Giảng viên</p>
                            </div>
                        </div>
                        <div class="col-md-3 col-6">
                            <div class="stat-item">
                                <div class="stat-icon mb-3">
                                    <i class="bi bi-book-fill"></i>
                                </div>
                                <h3 class="stat-number fw-bold text-primary mb-2" data-target="50">0</h3>
                                <p class="stat-label text-muted mb-0">Chương trình đào tạo</p>
                            </div>
                        </div>
                        <div class="col-md-3 col-6">
                            <div class="stat-item">
                                <div class="stat-icon mb-3">
                                    <i class="bi bi-globe"></i>
                                </div>
                                <h3 class="stat-number fw-bold text-primary mb-2" data-target="100">0</h3>
                                <p class="stat-label text-muted mb-0">Đối tác quốc tế</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- View All News Button -->
        <div class="row mt-4">
            <div class="col-12 text-center">
                <a href="${pageContext.request.contextPath}/news" class="btn btn-primary btn-lg px-5">
                    <i class="bi bi-newspaper me-2"></i>Xem tất cả tin tức
                </a>
            </div>
        </div>
    </div>
</section>

<style>
.news-section {
    background-color: #ffffff;
}

.news-section .section-title {
    font-size: 2.5rem;
    color: #005FB7;
}

.news-section .title-divider {
    width: 80px;
    height: 4px;
    background: linear-gradient(90deg, #005FB7 0%, #FDC32D 100%);
    margin-top: 1rem;
}

.news-card {
    background: white;
    border-radius: 1rem;
    overflow: hidden;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    transition: all 0.3s ease;
    border: none;
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

.news-card .card-title {
    font-size: 1.2rem;
    line-height: 1.4;
    min-height: 80px;
}

.news-card .card-title a {
    transition: color 0.3s ease;
}

.news-card .card-title a:hover {
    color: #005FB7 !important;
}

.news-meta {
    padding-top: 0.5rem;
    border-top: 1px solid #e9ecef;
}

.news-card .btn-outline-primary {
    border-color: #005FB7;
    color: #005FB7;
    font-weight: 600;
    transition: all 0.3s ease;
}

.news-card .btn-outline-primary:hover {
    background-color: #005FB7;
    border-color: #005FB7;
    color: white;
    transform: translateX(5px);
}

/* Statistics Section */
.stats-wrapper {
    background: linear-gradient(135deg, #005FB7 0%, #003d82 100%);
    position: relative;
    overflow: hidden;
}

.stats-wrapper::before {
    content: '';
    position: absolute;
    top: -50%;
    right: -10%;
    width: 400px;
    height: 400px;
    background: rgba(253, 195, 45, 0.1);
    border-radius: 50%;
}

.stat-item {
    position: relative;
    z-index: 1;
}

.stat-icon {
    font-size: 3rem;
    color: #FDC32D;
}

.stat-number {
    font-size: 3rem;
    color: #FDC32D;
}

.stat-label {
    font-size: 1.1rem;
    color: white !important;
    font-weight: 500;
}

.news-section .btn-primary {
    background-color: #005FB7;
    border-color: #005FB7;
    font-weight: 600;
    transition: all 0.3s ease;
}

.news-section .btn-primary:hover {
    background-color: #FDC32D;
    border-color: #FDC32D;
    color: #005FB7;
    transform: translateY(-3px);
    box-shadow: 0 8px 16px rgba(253,195,45,0.4);
}

@media (max-width: 767px) {
    .news-section .section-title {
        font-size: 2rem;
    }
    
    .news-card .card-title {
        font-size: 1.1rem;
        min-height: auto;
    }
    
    .stat-number {
        font-size: 2rem;
    }
    
    .stat-icon {
        font-size: 2rem;
    }
}
</style>

<script>
// Counter animation for statistics
document.addEventListener('DOMContentLoaded', function() {
    const animateCounter = (element) => {
        const target = parseInt(element.getAttribute('data-target'));
        const duration = 2000;
        const step = target / (duration / 16);
        let current = 0;
        
        const timer = setInterval(() => {
            current += step;
            if (current >= target) {
                element.textContent = target.toLocaleString();
                clearInterval(timer);
            } else {
                element.textContent = Math.floor(current).toLocaleString();
            }
        }, 16);
    };
    
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const counters = entry.target.querySelectorAll('.stat-number');
                counters.forEach(counter => {
                    if (counter.textContent === '0') {
                        animateCounter(counter);
                    }
                });
                observer.unobserve(entry.target);
            }
        });
    }, { threshold: 0.5 });
    
    const statsSection = document.querySelector('.stats-wrapper');
    if (statsSection) {
        observer.observe(statsSection);
    }
});
</script>
