<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Banner Section - Hero Slider -->
<section id="banner" class="banner-section">
    <div id="heroCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
        <!-- Indicators -->
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="0" class="active" 
                    aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>

        <!-- Carousel Items -->
        <div class="carousel-inner">
            <!-- Slide 1 -->
            <div class="carousel-item active">
                <img src="${pageContext.request.contextPath}/assets/img/banner-1.jpg" 
                     class="d-block w-100" 
                     alt="Trường Đại học Bách Khoa Đà Nẵng"
                     onerror="this.src='https://via.placeholder.com/1920x700/005FB7/ffffff?text=Dai+hoc+Bach+Khoa+Da+Nang'">
                <div class="carousel-caption">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-10">
                                <h1 class="display-3 fw-bold mb-3 animate__animated animate__fadeInDown">
                                    TRƯỜNG ĐẠI HỌC BÁCH KHOA
                                </h1>
                                <h2 class="h2 mb-4 animate__animated animate__fadeInUp">
                                    Đại học Đà Nẵng
                                </h2>
                                <p class="lead mb-4 animate__animated animate__fadeInUp animate__delay-1s">
                                    Nơi kiến tạo kỹ sư chất lượng cao - Hội nhập quốc tế
                                </p>
                                <div class="animate__animated animate__fadeInUp animate__delay-2s">
                                    <a href="#about" class="btn btn-warning btn-lg px-5 py-3 me-3 mb-2">
                                        <i class="bi bi-info-circle me-2"></i>Tìm hiểu thêm
                                    </a>
                                    <a href="#consult" class="btn btn-outline-light btn-lg px-5 py-3 mb-2">
                                        <i class="bi bi-envelope me-2"></i>Đăng ký tư vấn
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Slide 2 -->
            <div class="carousel-item">
                <img src="${pageContext.request.contextPath}/assets/img/banner-2.jpg" 
                     class="d-block w-100" 
                     alt="Đào tạo kỹ sư chất lượng cao"
                     onerror="this.src='https://via.placeholder.com/1920x700/003d82/ffffff?text=Dao+tao+chat+luong+cao'">
                <div class="carousel-caption">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-10">
                                <h2 class="display-4 fw-bold mb-3 animate__animated animate__fadeInDown">
                                    ĐÀO TẠO KỸ SƯ CHẤT LƯỢNG CAO
                                </h2>
                                <p class="lead mb-4 animate__animated animate__fadeInUp animate__delay-1s">
                                    Chương trình đào tạo tiên tiến theo chuẩn quốc tế ABET, AUN-QA
                                </p>
                                <div class="animate__animated animate__fadeInUp animate__delay-2s">
                                    <a href="#programs" class="btn btn-warning btn-lg px-5 py-3 me-3 mb-2">
                                        <i class="bi bi-book me-2"></i>Xem chương trình đào tạo
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Slide 3 -->
            <div class="carousel-item">
                <img src="${pageContext.request.contextPath}/assets/img/banner-3.jpg" 
                     class="d-block w-100" 
                     alt="Tuyển sinh 2025"
                     onerror="this.src='https://via.placeholder.com/1920x700/FDC32D/005FB7?text=Tuyen+sinh+2025'">
                <div class="carousel-caption">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-10">
                                <h2 class="display-4 fw-bold mb-3 animate__animated animate__fadeInDown">
                                    TUYỂN SINH ĐẠI HỌC 2025
                                </h2>
                                <p class="lead mb-4 animate__animated animate__fadeInUp animate__delay-1s">
                                    Nhiều phương thức xét tuyển linh hoạt - Học bổng hấp dẫn lên đến 100%
                                </p>
                                <div class="animate__animated animate__fadeInUp animate__delay-2s">
                                    <a href="#admission" class="btn btn-warning btn-lg px-5 py-3 me-3 mb-2">
                                        <i class="bi bi-pencil-square me-2"></i>Đăng ký xét tuyển
                                    </a>
                                    <a href="tel:02363736666" class="btn btn-outline-light btn-lg px-5 py-3 mb-2">
                                        <i class="bi bi-telephone me-2"></i>Hotline: 0236.3736.666
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</section>

<style>
.banner-section {
    position: relative;
    margin-top: 0;
}

.banner-section .carousel-item {
    height: 700px;
    position: relative;
}

.banner-section .carousel-item img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    object-position: center;
}

.banner-section .carousel-item::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(135deg, rgba(0, 95, 183, 0.85) 0%, rgba(0, 61, 130, 0.75) 100%);
    z-index: 1;
}

.banner-section .carousel-caption {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 100%;
    z-index: 2;
    text-align: center;
    padding: 2rem;
}

.banner-section .carousel-caption h1,
.banner-section .carousel-caption h2,
.banner-section .carousel-caption p {
    text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
}

.banner-section .carousel-caption h1 {
    color: #FDC32D;
    font-weight: 700;
    letter-spacing: 1px;
}

.banner-section .carousel-caption h2 {
    color: #ffffff;
    font-weight: 600;
}

.banner-section .carousel-caption .lead {
    color: #ffffff;
    font-size: 1.3rem;
}

.banner-section .btn-warning {
    background-color: #FDC32D;
    border-color: #FDC32D;
    color: #005FB7;
    font-weight: 600;
    transition: all 0.3s ease;
}

.banner-section .btn-warning:hover {
    background-color: #e5b029;
    border-color: #e5b029;
    transform: translateY(-3px);
    box-shadow: 0 8px 16px rgba(253, 195, 45, 0.4);
}

.banner-section .btn-outline-light {
    border: 2px solid #ffffff;
    color: #ffffff;
    font-weight: 600;
    transition: all 0.3s ease;
}

.banner-section .btn-outline-light:hover {
    background-color: #ffffff;
    color: #005FB7;
    transform: translateY(-3px);
    box-shadow: 0 8px 16px rgba(255, 255, 255, 0.3);
}

.banner-section .carousel-indicators button {
    width: 12px;
    height: 12px;
    border-radius: 50%;
    background-color: rgba(255, 255, 255, 0.5);
    border: 2px solid #FDC32D;
}

.banner-section .carousel-indicators button.active {
    background-color: #FDC32D;
    width: 40px;
    border-radius: 6px;
}

.banner-section .carousel-control-prev-icon,
.banner-section .carousel-control-next-icon {
    width: 50px;
    height: 50px;
    background-color: rgba(253, 195, 45, 0.8);
    border-radius: 50%;
}

.banner-section .carousel-control-prev:hover .carousel-control-prev-icon,
.banner-section .carousel-control-next:hover .carousel-control-next-icon {
    background-color: #FDC32D;
}

/* Responsive */
@media (max-width: 768px) {
    .banner-section .carousel-item {
        height: 500px;
    }
    
    .banner-section .carousel-caption h1 {
        font-size: 2rem;
    }
    
    .banner-section .carousel-caption h2 {
        font-size: 1.5rem;
    }
    
    .banner-section .carousel-caption .lead {
        font-size: 1rem;
    }
    
    .banner-section .btn-lg {
        padding: 0.75rem 2rem !important;
        font-size: 1rem;
    }
}

@media (max-width: 576px) {
    .banner-section .carousel-item {
        height: 400px;
    }
    
    .banner-section .carousel-caption h1 {
        font-size: 1.5rem;
    }
    
    .banner-section .carousel-caption h2 {
        font-size: 1.2rem;
    }
}
</style>
