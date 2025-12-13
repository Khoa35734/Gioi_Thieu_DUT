<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Training Programs Section -->
<section id="programs" class="programs-section py-5 bg-light">
    <div class="container">
        <div class="row mb-5">
            <div class="col-12 text-center">
                <h2 class="section-title fw-bold text-primary mb-3">CHƯƠNG TRÌNH ĐÀO TẠO</h2>
                <p class="lead text-muted">Đào tạo kỹ sư chất lượng cao theo chuẩn quốc tế</p>
                <div class="title-divider mx-auto"></div>
            </div>
        </div>

        <div class="row g-4">
            <!-- Program 1: Information Technology -->
            <div class="col-lg-3 col-md-6">
                <div class="program-card h-100">
                    <div class="program-image">
                        <img src="${pageContext.request.contextPath}/assets/img/program-it.jpg" 
                             class="card-img-top" 
                             alt="Công nghệ thông tin"
                             loading="lazy"
                             onerror="this.src='https://via.placeholder.com/400x300/005FB7/ffffff?text=CNTT'">
                        <div class="program-overlay">
                            <i class="bi bi-laptop display-1"></i>
                        </div>
                    </div>
                    <div class="card-body d-flex flex-column">
                        <div class="program-icon mb-3">
                            <i class="bi bi-laptop text-primary"></i>
                        </div>
                        <h4 class="card-title fw-bold text-primary mb-3">Công nghệ thông tin</h4>
                        <p class="card-text text-muted flex-grow-1">
                            Đào tạo kỹ sư CNTT có kiến thức vững vàng về lập trình, phát triển phần mềm, 
                            hệ thống thông tin, an ninh mạng và trí tuệ nhân tạo.
                        </p>
                        <ul class="program-highlights mb-3">
                            <li><i class="bi bi-check-circle-fill text-warning me-2"></i>Phát triển phần mềm</li>
                            <li><i class="bi bi-check-circle-fill text-warning me-2"></i>An ninh mạng</li>
                            <li><i class="bi bi-check-circle-fill text-warning me-2"></i>Trí tuệ nhân tạo</li>
                            <li><i class="bi bi-check-circle-fill text-warning me-2"></i>Khoa học dữ liệu</li>
                        </ul>
                        <div class="program-meta mb-3">
                            <span class="badge bg-primary me-2">
                                <i class="bi bi-clock me-1"></i>4 năm
                            </span>
                            <span class="badge bg-warning text-dark">
                                <i class="bi bi-award me-1"></i>Chuẩn ABET
                            </span>
                        </div>
                        <a href="#" class="btn btn-primary w-100 mt-auto">
                            <i class="bi bi-info-circle me-2"></i>Xem chi tiết
                        </a>
                    </div>
                </div>
            </div>

            <!-- Program 2: Mechanical Engineering -->
            <div class="col-lg-3 col-md-6">
                <div class="program-card h-100">
                    <div class="program-image">
                        <img src="${pageContext.request.contextPath}/assets/img/program-mechanical.jpg" 
                             class="card-img-top" 
                             alt="Cơ khí - Cơ điện tử"
                             loading="lazy"
                             onerror="this.src='https://via.placeholder.com/400x300/005FB7/ffffff?text=Co+khi'">
                        <div class="program-overlay">
                            <i class="bi bi-gear-fill display-1"></i>
                        </div>
                    </div>
                    <div class="card-body d-flex flex-column">
                        <div class="program-icon mb-3">
                            <i class="bi bi-gear-fill text-primary"></i>
                        </div>
                        <h4 class="card-title fw-bold text-primary mb-3">Cơ khí - Cơ điện tử</h4>
                        <p class="card-text text-muted flex-grow-1">
                            Đào tạo kỹ sư cơ khí có năng lực thiết kế, chế tạo và vận hành các hệ thống 
                            cơ khí, tự động hóa và robot công nghiệp.
                        </p>
                        <ul class="program-highlights mb-3">
                            <li><i class="bi bi-check-circle-fill text-warning me-2"></i>Thiết kế cơ khí</li>
                            <li><i class="bi bi-check-circle-fill text-warning me-2"></i>Chế tạo máy</li>
                            <li><i class="bi bi-check-circle-fill text-warning me-2"></i>Tự động hóa</li>
                            <li><i class="bi bi-check-circle-fill text-warning me-2"></i>Robot công nghiệp</li>
                        </ul>
                        <div class="program-meta mb-3">
                            <span class="badge bg-primary me-2">
                                <i class="bi bi-clock me-1"></i>4 năm
                            </span>
                            <span class="badge bg-warning text-dark">
                                <i class="bi bi-award me-1"></i>Chuẩn AUN-QA
                            </span>
                        </div>
                        <a href="#" class="btn btn-primary w-100 mt-auto">
                            <i class="bi bi-info-circle me-2"></i>Xem chi tiết
                        </a>
                    </div>
                </div>
            </div>

            <!-- language: html -->
            <!-- Program 3: Electrical / Electronics Engineering -->
            <div class="col-lg-3 col-md-6">
                <div class="program-card h-100">
                    <div class="program-image">
                        <img src="${pageContext.request.contextPath}/assets/img/program-electrical.jpg"
                             class="card-img-top"
                             alt="Điện - Điện tử"
                             loading="lazy"
                             onerror="this.src='https://via.placeholder.com/400x300/005FB7/ffffff?text=Dien+%2F+DT'">
                        <div class="program-overlay">
                            <i class="bi bi-lightning-charge-fill display-1"></i>
                        </div>
                    </div>
                    <div class="card-body d-flex flex-column">
                        <div class="program-icon mb-3">
                            <i class="bi bi-lightning-charge-fill text-primary"></i>
                        </div>
                        <h4 class="card-title fw-bold text-primary mb-3">Điện - Điện tử</h4>
                        <p class="card-text text-muted flex-grow-1">
                            Đào tạo kỹ sư Điện, Điện tử có năng lực thiết kế hệ thống điện, điều khiển, nhúng và truyền động.
                        </p>
                        <ul class="program-highlights mb-3">
                            <li><i class="bi bi-check-circle-fill text-warning me-2"></i>Hệ thống điện</li>
                            <li><i class="bi bi-check-circle-fill text-warning me-2"></i>Điều khiển và tự động hóa</li>
                            <li><i class="bi bi-check-circle-fill text-warning me-2"></i>Điện tử công suất</li>
                            <li><i class="bi bi-check-circle-fill text-warning me-2"></i>Hệ nhúng</li>
                        </ul>
                        <div class="program-meta mb-3">
                            <span class="badge bg-primary me-2">
                                <i class="bi bi-clock me-1"></i>4 năm
                            </span>
                            <span class="badge bg-warning text-dark">
                                <i class="bi bi-award me-1"></i>Chuẩn AUN-QA
                            </span>
                        </div>
                        <a href="#" class="btn btn-primary w-100 mt-auto">
                            <i class="bi bi-info-circle me-2"></i>Xem chi tiết
                        </a>
                    </div>
                </div>
            </div>

            <!-- Program 4: Civil Engineering -->
            <div class="col-lg-3 col-md-6">
                <div class="program-card h-100">
                    <div class="program-image">
                        <img src="${pageContext.request.contextPath}/assets/img/program-civil.jpg" 
                             class="card-img-top" 
                             alt="Xây dựng"
                             loading="lazy"
                             onerror="this.src='https://via.placeholder.com/400x300/005FB7/ffffff?text=Xay+dung'">
                        <div class="program-overlay">
                            <i class="bi bi-building display-1"></i>
                        </div>
                    </div>
                    <div class="card-body d-flex flex-column">
                        <div class="program-icon mb-3">
                            <i class="bi bi-building text-primary"></i>
                        </div>
                        <h4 class="card-title fw-bold text-primary mb-3">Kỹ thuật xây dựng</h4>
                        <p class="card-text text-muted flex-grow-1">
                            Đào tạo kỹ sư xây dựng có năng lực thiết kế, thi công và quản lý các công trình 
                            dân dụng, công nghiệp và hạ tầng.
                        </p>
                        <ul class="program-highlights mb-3">
                            <li><i class="bi bi-check-circle-fill text-warning me-2"></i>Thiết kế công trình</li>
                            <li><i class="bi bi-check-circle-fill text-warning me-2"></i>Kỹ thuật thi công</li>
                            <li><i class="bi bi-check-circle-fill text-warning me-2"></i>Quản lý dự án</li>
                            <li><i class="bi bi-check-circle-fill text-warning me-2"></i>Xây dựng bền vững</li>
                        </ul>
                        <div class="program-meta mb-3">
                            <span class="badge bg-primary me-2">
                                <i class="bi bi-clock me-1"></i>4 năm
                            </span>
                            <span class="badge bg-warning text-dark">
                                <i class="bi bi-award me-1"></i>Chuẩn AUN-QA
                            </span>
                        </div>
                        <a href="#" class="btn btn-primary w-100 mt-auto">
                            <i class="bi bi-info-circle me-2"></i>Xem chi tiết
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Additional Info -->
        <div class="row mt-5">
            <div class="col-12">
                <div class="alert alert-info border-0 shadow-sm" role="alert">
                    <div class="row align-items-center">
                        <div class="col-md-1 text-center">
                            <i class="bi bi-info-circle-fill display-4 text-primary"></i>
                        </div>
                        <div class="col-md-11">
                            <h5 class="alert-heading fw-bold">Cam kết chất lượng đào tạo</h5>
                            <p class="mb-0">
                                Tất cả các chương trình đào tạo của Trường Đại học Bách Khoa - Đại học Đà Nẵng 
                                đều được thiết kế theo chuẩn quốc tế, được kiểm định bởi các tổ chức uy tín như 
                                ABET, AUN-QA. Sinh viên tốt nghiệp có khả năng làm việc trong môi trường quốc tế 
                                và được các nhà tuyển dụng đánh giá cao.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Call to Action -->
        <div class="row mt-4">
            <div class="col-12 text-center">
                <a href="#consult" class="btn btn-warning btn-lg px-5 py-3">
                    <i class="bi bi-pencil-square me-2"></i>Đăng ký tư vấn ngay
                </a>
            </div>
        </div>
    </div>
</section>

<style>
.programs-section {
    background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
}

.programs-section .section-title {
    font-size: 2.5rem;
    color: #005FB7;
}

.programs-section .title-divider {
    width: 80px;
    height: 4px;
    background: linear-gradient(90deg, #005FB7 0%, #FDC32D 100%);
    margin-top: 1rem;
}

.program-card {
    background: white;
    border-radius: 1rem;
    overflow: hidden;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    transition: all 0.3s ease;
    border: none;
    display: flex;/* center cards and control spacing */
    .programs-section .row.g-4 {
        justify-content: center; /* center the group of columns */
        gap: 1.5rem;             /* consistent gap between cards (works with modern browsers) */
        flex-wrap: wrap;
    }

    /* make bootstrap columns stretch so cards have equal height and spacing */
    .programs-section .col-lg-3,
    .programs-section .col-md-6 {
        display: flex;
        align-items: stretch;
        justify-content: center;
    }

    /* keep cards full-width of their column and limit max width for nicer centering */
    .program-card {
        width: 100%;
        max-width: 320px; /* adjust as needed to control card size */
        margin: 0 auto;
        display: flex;
        flex-direction: column;
    }
}

.program-card .card-body {
    flex: 1 1 auto;
    flex-direction: column;
}
.program-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 12px 24px rgba(0,95,183,0.2);
}

.program-image {
    position: relative;
    overflow: hidden;
    height: 220px;
}

.program-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.3s ease;
}

.program-card:hover .program-image img {
    transform: scale(1.1);
}

.program-overlay {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;/* css */
    .programs-section {
        background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
    }

    .programs-section .section-title {
        font-size: 2.5rem;
        color: #005FB7;
    }

    .programs-section .title-divider {
        width: 80px;
        height: 4px;
        background: linear-gradient(90deg, #005FB7 0%, #FDC32D 100%);
        margin-top: 1rem;
    }

    /* center cards and control spacing */
    .programs-section .row.g-4 {
        justify-content: center;
        gap: 1.5rem;
        flex-wrap: wrap;
    }

    /* make bootstrap columns stretch so cards have equal height and spacing */
    .programs-section .col-lg-3,
    .programs-section .col-md-6 {
        display: flex;
        align-items: stretch;
        justify-content: center;
    }

    /* card layout: column flex so mt-auto on button pushes it to bottom */
    .program-card {
        background: white;
        border-radius: 1rem;
        overflow: hidden;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        transition: all 0.3s ease;
        border: none;
        display: flex;
        flex-direction: column;
        width: 100%;
        max-width: 320px;
        margin: 0 auto;
    }

    /* let card body grow and be a column so button with mt-auto sits at bottom */
    .program-card .card-body {
        flex: 1 1 auto;
        display: flex;
        flex-direction: column;
    }

    /* small visual tweaks */
    .program-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 12px 24px rgba(0,95,183,0.2);
    }

    .program-image {
        position: relative;
        overflow: hidden;
        height: 220px;
    }

    .program-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.3s ease;
    }

    .program-card:hover .program-image img {
        transform: scale(1.1);
    }

    .program-overlay {
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: linear-gradient(135deg, rgba(0,95,183,0.9) 0%, rgba(0,61,130,0.9) 100%);
        display: flex;
        align-items: center;
        justify-content: center;
        opacity: 0;
        transition: opacity 0.3s ease;
    }

    .program-card:hover .program-overlay {
        opacity: 1;
    }

    .program-overlay i {
        color: #FDC32D;
    }

    .program-icon {
        width: 60px;
        height: 60px;
        border-radius: 50%;
        background: linear-gradient(135deg, #005FB7 0%, #003d82 100%);
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .program-icon i {
        font-size: 1.8rem;
        color: #FDC32D;
    }

    .program-card .card-title {
        font-size: 1.3rem;
    }

    .program-highlights {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .program-highlights li {
        font-size: 0.9rem;
        margin-bottom: 0.5rem;
        color: #6c757d;
    }

    .program-meta .badge {
        font-size: 0.85rem;
        padding: 0.5rem 0.8rem;
        font-weight: 500;
    }

    .program-card .btn-primary {
        background-color: #005FB7;
        border-color: #005FB7;
        font-weight: 600;
        transition: all 0.3s ease;
    }

    .program-card .btn-primary:hover {
        background-color: #FDC32D;
        border-color: #FDC32D;
        color: #005FB7;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(253,195,45,0.4);
    }

    .programs-section .btn-warning {
        background-color: #FDC32D;
        border-color: #FDC32D;
        color: #005FB7;
        font-weight: 600;
        transition: all 0.3s ease;
    }

    .programs-section .btn-warning:hover {
        background-color: #005FB7;
        border-color: #005FB7;
        color: white;
        transform: translateY(-3px);
        box-shadow: 0 8px 16px rgba(0,95,183,0.3);
    }

    @media (max-width: 991px) {
        .program-card {
            margin-bottom: 1.5rem;
            max-width: none;
        }
    }

    @media (max-width: 767px) {
        .programs-section .section-title {
            font-size: 2rem;
        }
    }
    bottom: 0;
    background: linear-gradient(135deg, rgba(0,95,183,0.9) 0%, rgba(0,61,130,0.9) 100%);
    display: flex;
    align-items: center;
    justify-content: center;
    opacity: 0;
    transition: opacity 0.3s ease;
}

.program-card:hover .program-overlay {
    opacity: 1;
}

.program-overlay i {
    color: #FDC32D;
}

.program-icon {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    background: linear-gradient(135deg, #005FB7 0%, #003d82 100%);
    display: flex;
    align-items: center;
    justify-content: center;
}

.program-icon i {
    font-size: 1.8rem;
    color: #FDC32D;
}

.program-card .card-title {
    font-size: 1.3rem;
}

.program-highlights {
    list-style: none;
    padding: 0;
    margin: 0;
}

.program-highlights li {
    font-size: 0.9rem;
    margin-bottom: 0.5rem;
    color: #6c757d;
}

.program-meta .badge {
    font-size: 0.85rem;
    padding: 0.5rem 0.8rem;
    font-weight: 500;
}

.program-card .btn-primary {
    background-color: #005FB7;
    border-color: #005FB7;
    font-weight: 600;
    transition: all 0.3s ease;
}

.program-card .btn-primary:hover {
    background-color: #FDC32D;
    border-color: #FDC32D;
    color: #005FB7;
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(253,195,45,0.4);
}

.programs-section .btn-warning {
    background-color: #FDC32D;
    border-color: #FDC32D;
    color: #005FB7;
    font-weight: 600;
    transition: all 0.3s ease;
}

.programs-section .btn-warning:hover {
    background-color: #005FB7;
    border-color: #005FB7;
    color: white;
    transform: translateY(-3px);
    box-shadow: 0 8px 16px rgba(0,95,183,0.3);
}

@media (max-width: 991px) {
    .program-card {
        margin-bottom: 1.5rem;
    }
}

@media (max-width: 767px) {
    .programs-section .section-title {
        font-size: 2rem;
    }
}
</style>
