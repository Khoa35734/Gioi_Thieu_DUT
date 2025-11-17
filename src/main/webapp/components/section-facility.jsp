<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Facility Section -->
<section id="facility" class="facility-section py-5 bg-light">
    <div class="container">
        <div class="row mb-5">
            <div class="col-12 text-center">
                <h2 class="section-title fw-bold text-primary mb-3">CƠ SỞ VẬT CHẤT</h2>
                <p class="lead text-muted">Trang thiết bị hiện đại phục vụ đào tạo và nghiên cứu</p>
                <div class="title-divider mx-auto"></div>
            </div>
        </div>

        <!-- Facility Carousel -->
        <div class="row mb-5">
            <div class="col-12">
                <div id="facilityCarousel" class="carousel slide" data-bs-ride="carousel">
                    <!-- Indicators -->
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#facilityCarousel" data-bs-slide-to="0" 
                                class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#facilityCarousel" data-bs-slide-to="1" 
                                aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#facilityCarousel" data-bs-slide-to="2" 
                                aria-label="Slide 3"></button>
                        <button type="button" data-bs-target="#facilityCarousel" data-bs-slide-to="3" 
                                aria-label="Slide 4"></button>
                    </div>

                    <!-- Carousel Items -->
                    <div class="carousel-inner rounded shadow">
                        <!-- Slide 1 -->
                        <div class="carousel-item active">
                            <img src="${pageContext.request.contextPath}/assets/img/facility-1.jpg" 
                                 class="d-block w-100" 
                                 alt="Phòng thí nghiệm"
                                 loading="lazy"
                                 onerror="this.src='https://via.placeholder.com/1200x500/005FB7/ffffff?text=Phong+thi+nghiem'">
                            <div class="carousel-caption">
                                <div class="caption-content">
                                    <h3 class="fw-bold mb-2">Phòng thí nghiệm hiện đại</h3>
                                    <p class="mb-0">Trang bị đầy đủ thiết bị thí nghiệm theo chuẩn quốc tế, 
                                    phục vụ học tập và nghiên cứu khoa học</p>
                                </div>
                            </div>
                        </div>

                        <!-- Slide 2 -->
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/assets/img/facility-2.jpg" 
                                 class="d-block w-100" 
                                 alt="Thư viện"
                                 loading="lazy"
                                 onerror="this.src='https://via.placeholder.com/1200x500/FDC32D/005FB7?text=Thu+vien'">
                            <div class="carousel-caption">
                                <div class="caption-content">
                                    <h3 class="fw-bold mb-2">Thư viện số hiện đại</h3>
                                    <p class="mb-0">Hệ thống thư viện với hơn 100,000 đầu sách và tạp chí khoa học, 
                                    kết nối các cơ sở dữ liệu quốc tế</p>
                                </div>
                            </div>
                        </div>

                        <!-- Slide 3 -->
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/assets/img/facility-3.jpg" 
                                 class="d-block w-100" 
                                 alt="Phòng máy tính"
                                 loading="lazy"
                                 onerror="this.src='https://via.placeholder.com/1200x500/005FB7/ffffff?text=Phong+may+tinh'">
                            <div class="carousel-caption">
                                <div class="caption-content">
                                    <h3 class="fw-bold mb-2">Phòng máy tính chuẩn quốc tế</h3>
                                    <p class="mb-0">Phòng máy tính với cấu hình mạnh, cài đặt đầy đủ phần mềm 
                                    chuyên dụng phục vụ đào tạo</p>
                                </div>
                            </div>
                        </div>

                        <!-- Slide 4 -->
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/assets/img/facility-4.jpg" 
                                 class="d-block w-100" 
                                 alt="Khuôn viên"
                                 loading="lazy"
                                 onerror="this.src='https://via.placeholder.com/1200x500/FDC32D/005FB7?text=Khuon+vien'">
                            <div class="carousel-caption">
                                <div class="caption-content">
                                    <h3 class="fw-bold mb-2">Khuôn viên xanh - sạch - đẹp</h3>
                                    <p class="mb-0">Môi trường học tập trong lành với nhiều cây xanh, 
                                    sân chơi thể thao và khu vực sinh hoạt tập thể</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Controls -->
                    <button class="carousel-control-prev" type="button" data-bs-target="#facilityCarousel" 
                            data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#facilityCarousel" 
                            data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>

        <!-- Facility Highlights Grid -->
        <div class="row g-4">
            <!-- Highlight 1 -->
            <div class="col-lg-3 col-md-6">
                <div class="facility-card text-center h-100">
                    <div class="facility-icon mb-3">
                        <i class="bi bi-cpu"></i>
                    </div>
                    <h4 class="fw-bold mb-3 text-primary">Phòng Lab</h4>
                    <p class="text-muted mb-0">
                        30+ phòng thí nghiệm chuyên ngành với trang thiết bị hiện đại, 
                        đáp ứng đầy đủ yêu cầu thực hành
                    </p>
                </div>
            </div>

            <!-- Highlight 2 -->
            <div class="col-lg-3 col-md-6">
                <div class="facility-card text-center h-100">
                    <div class="facility-icon mb-3">
                        <i class="bi bi-book"></i>
                    </div>
                    <h4 class="fw-bold mb-3 text-primary">Thư viện</h4>
                    <p class="text-muted mb-0">
                        Thư viện hiện đại với diện tích 3,000m², phục vụ đọc, nghiên cứu 
                        và tra cứu tài liệu 24/7
                    </p>
                </div>
            </div>

            <!-- Highlight 3 -->
            <div class="col-lg-3 col-md-6">
                <div class="facility-card text-center h-100">
                    <div class="facility-icon mb-3">
                        <i class="bi bi-wifi"></i>
                    </div>
                    <h4 class="fw-bold mb-3 text-primary">Wi-Fi miễn phí</h4>
                    <p class="text-muted mb-0">
                        Hệ thống mạng Internet tốc độ cao phủ sóng toàn bộ khuôn viên trường, 
                        hỗ trợ học tập trực tuyến
                    </p>
                </div>
            </div>

            <!-- Highlight 4 -->
            <div class="col-lg-3 col-md-6">
                <div class="facility-card text-center h-100">
                    <div class="facility-icon mb-3">
                        <i class="bi bi-hospital"></i>
                    </div>
                    <h4 class="fw-bold mb-3 text-primary">Y tế</h4>
                    <p class="text-muted mb-0">
                        Trạm y tế đầy đủ trang thiết bị, bác sĩ thường trực, 
                        chăm sóc sức khỏe sinh viên tận tâm
                    </p>
                </div>
            </div>

            <!-- Highlight 5 -->
            <div class="col-lg-3 col-md-6">
                <div class="facility-card text-center h-100">
                    <div class="facility-icon mb-3">
                        <i class="bi bi-building"></i>
                    </div>
                    <h4 class="fw-bold mb-3 text-primary">Ký túc xá</h4>
                    <p class="text-muted mb-0">
                        Ký túc xá hiện đại, sạch sẽ, đầy đủ tiện nghi, 
                        an ninh nghiêm ngặt, phục vụ 2,000+ sinh viên
                    </p>
                </div>
            </div>

            <!-- Highlight 6 -->
            <div class="col-lg-3 col-md-6">
                <div class="facility-card text-center h-100">
                    <div class="facility-icon mb-3">
                        <i class="bi bi-egg-fried"></i>
                    </div>
                    <h4 class="fw-bold mb-3 text-primary">Căn tin</h4>
                    <p class="text-muted mb-0">
                        Hệ thống căn tin rộng rãi, thực đơn đa dạng, 
                        giá cả phải chăng, đảm bảo vệ sinh an toàn thực phẩm
                    </p>
                </div>
            </div>

            <!-- Highlight 7 -->
            <div class="col-lg-3 col-md-6">
                <div class="facility-card text-center h-100">
                    <div class="facility-icon mb-3">
                        <i class="bi bi-trophy"></i>
                    </div>
                    <h4 class="fw-bold mb-3 text-primary">Thể thao</h4>
                    <p class="text-muted mb-0">
                        Sân vận động đa năng, phòng gym, sân bóng đá, bóng chuyền, 
                        cầu lông phục vụ rèn luyện sức khỏe
                    </p>
                </div>
            </div>

            <!-- Highlight 8 -->
            <div class="col-lg-3 col-md-6">
                <div class="facility-card text-center h-100">
                    <div class="facility-icon mb-3">
                        <i class="bi bi-shield-check"></i>
                    </div>
                    <h4 class="fw-bold mb-3 text-primary">An ninh</h4>
                    <p class="text-muted mb-0">
                        Hệ thống camera giám sát 24/7, bảo vệ chuyên nghiệp, 
                        đảm bảo an toàn tuyệt đối cho sinh viên
                    </p>
                </div>
            </div>
        </div>

        <!-- Investment Info -->
        <div class="row mt-5">
            <div class="col-12">
                <div class="investment-info p-4 rounded shadow-sm">
                    <div class="row align-items-center">
                        <div class="col-md-2 text-center mb-3 mb-md-0">
                            <i class="bi bi-cash-stack display-1 text-warning"></i>
                        </div>
                        <div class="col-md-10">
                            <h4 class="fw-bold text-primary mb-3">Đầu tư cơ sở vật chất</h4>
                            <p class="mb-0 text-muted">
                                Trường Đại học Bách Khoa - Đại học Đà Nẵng không ngừng đầu tư nâng cấp 
                                cơ sở vật chất, trang thiết bị hiện đại để phục vụ tốt nhất cho công tác 
                                đào tạo và nghiên cứu khoa học. Trong 5 năm qua, nhà trường đã đầu tư 
                                hơn 200 tỷ đồng cho xây dựng và mua sắm thiết bị, đảm bảo chất lượng 
                                đào tạo đạt chuẩn quốc tế.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<style>
.facility-section {
    background: linear-gradient(135deg, #f8f9fa 0%, #ffffff 100%);
}

.facility-section .section-title {
    font-size: 2.5rem;
    color: #005FB7;
}

.facility-section .title-divider {
    width: 80px;
    height: 4px;
    background: linear-gradient(90deg, #005FB7 0%, #FDC32D 100%);
    margin-top: 1rem;
}

#facilityCarousel .carousel-item {
    height: 500px;
}

#facilityCarousel .carousel-item img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

#facilityCarousel .carousel-caption {
    background: linear-gradient(180deg, transparent 0%, rgba(0,0,0,0.8) 100%);
    bottom: 0;
    left: 0;
    right: 0;
    padding: 3rem 2rem 2rem;
}

#facilityCarousel .caption-content {
    max-width: 800px;
    margin: 0 auto;
}

#facilityCarousel .carousel-control-prev-icon,
#facilityCarousel .carousel-control-next-icon {
    width: 50px;
    height: 50px;
    background-color: rgba(253, 195, 45, 0.9);
    border-radius: 50%;
}

#facilityCarousel .carousel-indicators button {
    width: 12px;
    height: 12px;
    border-radius: 50%;
    background-color: rgba(255, 255, 255, 0.5);
    border: 2px solid #FDC32D;
}

#facilityCarousel .carousel-indicators button.active {
    background-color: #FDC32D;
    width: 40px;
    border-radius: 6px;
}

.facility-card {
    background: white;
    padding: 2rem;
    border-radius: 1rem;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    transition: all 0.3s ease;
}

.facility-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 12px 24px rgba(0,95,183,0.2);
}

.facility-icon {
    width: 80px;
    height: 80px;
    margin: 0 auto;
    border-radius: 50%;
    background: linear-gradient(135deg, #005FB7 0%, #003d82 100%);
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.3s ease;
}

.facility-card:hover .facility-icon {
    background: linear-gradient(135deg, #FDC32D 0%, #e5b029 100%);
    transform: rotate(360deg);
}

.facility-icon i {
    font-size: 2.5rem;
    color: #FDC32D;
}

.facility-card:hover .facility-icon i {
    color: #005FB7;
}

.investment-info {
    background: linear-gradient(135deg, #005FB7 0%, #003d82 100%);
    color: white;
}

.investment-info h4 {
    color: #FDC32D;
}

.investment-info p {
    color: rgba(255, 255, 255, 0.9) !important;
}

@media (max-width: 767px) {
    .facility-section .section-title {
        font-size: 2rem;
    }
    
    #facilityCarousel .carousel-item {
        height: 300px;
    }
    
    #facilityCarousel .carousel-caption {
        padding: 2rem 1rem 1rem;
    }
    
    #facilityCarousel .caption-content h3 {
        font-size: 1.2rem;
    }
    
    #facilityCarousel .caption-content p {
        font-size: 0.9rem;
    }
}
</style>
