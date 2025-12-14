<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- About Section -->
<section id="about" class="about-section py-5">
    <div class="container">
        <div class="row mb-5">
            <div class="col-12 text-center">
                <h2 class="section-title fw-bold text-primary mb-3">VỀ CHÚNG TÔI</h2>
                <p class="lead text-muted">Trường Đại học Bách Khoa - Đại học Đà Nẵng</p>
                <div class="title-divider mx-auto"></div>
            </div>
        </div>

        <div class="row">
            <!-- Sidebar Navigation -->
            <div class="col-lg-3 mb-4">
                <div class="about-sidebar sticky-top" style="top: 100px;">
                    <div class="list-group" role="tablist">
                        <button class="list-group-item list-group-item-action active" 
                                data-bs-toggle="tab" data-bs-target="#vision" 
                                type="button" role="tab" aria-controls="vision" aria-selected="true">
                            <i class="bi bi-eye me-2"></i>Tầm nhìn
                        </button>
                        <button class="list-group-item list-group-item-action" 
                                data-bs-toggle="tab" data-bs-target="#mission" 
                                type="button" role="tab" aria-controls="mission" aria-selected="false">
                            <i class="bi bi-compass me-2"></i>Sứ mệnh
                        </button>
                        <button class="list-group-item list-group-item-action" 
                                data-bs-toggle="tab" data-bs-target="#history" 
                                type="button" role="tab" aria-controls="history" aria-selected="false">
                            <i class="bi bi-clock-history me-2"></i>Lịch sử
                        </button>
                        <button class="list-group-item list-group-item-action" 
                                data-bs-toggle="tab" data-bs-target="#values" 
                                type="button" role="tab" aria-controls="values" aria-selected="false">
                            <i class="bi bi-gem me-2"></i>Giá trị cốt lõi
                        </button>
                        <button class="list-group-item list-group-item-action" 
                                data-bs-toggle="tab" data-bs-target="#team" 
                                type="button" role="tab" aria-controls="team" aria-selected="false">
                            <i class="bi bi-people me-2"></i>Đội ngũ
                        </button>
                        <button class="list-group-item list-group-item-action" 
                                data-bs-toggle="tab" data-bs-target="#cooperation" 
                                type="button" role="tab" aria-controls="cooperation" aria-selected="false">
                            <i class="bi bi-globe me-2"></i>Hợp tác quốc tế
                        </button>
                    </div>
                </div>
            </div>

            <!-- Content Area -->
            <div class="col-lg-9">
                <div class="tab-content about-content">
                    <!-- Vision Tab -->
                    <div class="tab-pane fade show active" id="vision" role="tabpanel">
                        <div class="row align-items-center">
                            <div class="col-md-7 mb-3">
                                <h3 class="mb-3 text-primary fw-bold">Tầm nhìn</h3>
                                <p class="text-justify">
                                    Trở thành trường đại học kỹ thuật hàng đầu khu vực, có uy tín quốc tế trong đào tạo, 
                                    nghiên cứu khoa học và chuyển giao công nghệ, góp phần phát triển kinh tế - xã hội 
                                    và hội nhập quốc tế của đất nước.
                                </p>
                                <p class="text-justify">
                                    Đến năm 2030, Trường Đại học Bách Khoa - Đại học Đà Nẵng phấn đấu trở thành một 
                                    trong những trung tâm đào tạo kỹ thuật công nghệ xuất sắc nhất Việt Nam, được công 
                                    nhận bởi các tổ chức uy tín quốc tế như ABET, AUN-QA.
                                </p>
                                <ul class="list-unstyled">
                                    <li class="mb-2"><i class="bi bi-check-circle-fill text-warning me-2"></i>
                                        Chất lượng đào tạo đạt chuẩn quốc tế</li>
                                    <li class="mb-2"><i class="bi bi-check-circle-fill text-warning me-2"></i>
                                        Nghiên cứu khoa học ứng dụng cao</li>
                                    <li class="mb-2"><i class="bi bi-check-circle-fill text-warning me-2"></i>
                                        Liên kết đào tạo với các trường ĐH danh tiếng thế giới</li>
                                </ul>
                            </div>
                            <div class="col-md-5 mb-3">
                                <img src="${pageContext.request.contextPath}/assets/img/about-vision.jpg" 
                                     class="img-fluid rounded shadow" 
                                     alt="Tầm nhìn"
                                     loading="lazy"
                                     onerror="this.src='https://via.placeholder.com/500x400/005FB7/ffffff?text=Tam+nhin'">
                            </div>
                        </div>
                    </div>

                    <!-- Mission Tab -->
                    <div class="tab-pane fade" id="mission" role="tabpanel">
                        <div class="row align-items-center">
                            <div class="col-md-7 mb-3">
                                <h3 class="mb-3 text-primary fw-bold">Sứ mệnh</h3>
                                <p class="text-justify">
                                    Là cơ sở giáo dục đại học cung cấp nguồn nhân lực chất lượng cao, có năng lực đổi mới,
                                    sáng tạo và khởi nghiệp trong lĩnh vực kỹ thuật – công nghệ; thực hiện nghiên cứu khoa học
                                    và chuyển giao công nghệ phục vụ sự phát triển bền vững kinh tế – xã hội của miền Trung – Tây Nguyên,
                                    trong nước và quốc tế.
                                </p>
                            </div>
                            <div class="col-md-5 mb-3">
                                <img src="${pageContext.request.contextPath}/assets/img/about-mission.jpg"
                                     class="img-fluid rounded shadow"
                                     alt="Sứ mệnh"
                                     loading="lazy"
                                     onerror="this.src='https://via.placeholder.com/500x400/005FB7/ffffff?text=Su+menh'">
                            </div>
                        </div>
                    </div>

                    <!-- History Tab -->
                    <div class="tab-pane fade" id="history" role="tabpanel">
                        <h3 class="text-center fw-bold text-primary mb-5">
                            Lịch sử hình thành và phát triển (1975 – 2025)
                        </h3>

                        <div class="vertical-timeline">

                            <!-- 1975 -->
                            <div class="timeline-item left">
                                <div class="timeline-content">
                                    <h4>1975</h4>
                                    <p>
                                        Thành lập Viện Đại học Đà Nẵng, gồm các khoa:
                                        Cơ khí, Điện, Kinh tế, Khoa học cơ bản.
                                    </p>
                                </div>
                                <span class="timeline-dot"></span>
                                <span class="timeline-line"></span>
                            </div>

                            <!-- 1976 -->
                            <div class="timeline-item right">
                                <div class="timeline-content">
                                    <h4>1976</h4>
                                    <p>Thành lập Khoa Xây dựng.</p>
                                </div>
                                <span class="timeline-dot"></span>
                                <span class="timeline-line"></span>
                            </div>

                            <!-- 1978 -->
                            <div class="timeline-item left">
                                <div class="timeline-content">
                                    <h4>1978</h4>
                                    <p>
                                        Thành lập Khoa Điện – hoàn thiện mô hình
                                        Trường Đại học Kỹ thuật trọng điểm.
                                    </p>
                                </div>
                                <span class="timeline-dot"></span>
                                <span class="timeline-line"></span>
                            </div>

                            <!-- 1987 -->
                            <div class="timeline-item right">
                                <div class="timeline-content">
                                    <h4>1987</h4>
                                    <p>Thành lập Khoa Công nghệ Nhiệt – Điện lạnh.</p>
                                </div>
                                <span class="timeline-dot"></span>
                                <span class="timeline-line"></span>
                            </div>

                            <!-- 1994 -->
                            <div class="timeline-item left">
                                <div class="timeline-content">
                                    <h4>1994</h4>
                                    <p>Thành lập Đại học Đà Nẵng.</p>
                                </div>
                                <span class="timeline-dot"></span>
                                <span class="timeline-line"></span>
                            </div>

                            <!-- 1996 -->
                            <div class="timeline-item right">
                                <div class="timeline-content">
                                    <h4>1996</h4>
                                    <p>
                                        Thành lập Khoa Công nghệ Thông tin và
                                        Khoa Xây dựng Cầu đường.
                                    </p>
                                </div>
                                <span class="timeline-dot"></span>
                                <span class="timeline-line"></span>
                            </div>

                            <!-- 2004 -->
                            <div class="timeline-item left">
                                <div class="timeline-content">
                                    <h4>2004</h4>
                                    <p>
                                        Quyết định đổi tên thành
                                        Trường Đại học Bách Khoa – Đại học Đà Nẵng.
                                    </p>
                                </div>
                                <span class="timeline-dot"></span>
                                <span class="timeline-line"></span>
                            </div>

                            <!-- 2005 -->
                            <div class="timeline-item right">
                                <div class="timeline-content">
                                    <h4>2005</h4>
                                    <p>
                                        Thành lập Khoa Cơ khí Giao thông và
                                        Khoa Điện tử – Viễn thông.
                                    </p>
                                </div>
                                <span class="timeline-dot"></span>
                                <span class="timeline-line"></span>
                            </div>

                            <!-- 2007 -->
                            <div class="timeline-item left">
                                <div class="timeline-content">
                                    <h4>2007</h4>
                                    <p>
                                        Thành lập Khoa Quản lý Dự án và
                                        Khoa Môi trường.
                                    </p>
                                </div>
                                <span class="timeline-dot"></span>
                                <span class="timeline-line"></span>
                            </div>

                            <!-- 2010 -->
                            <div class="timeline-item right">
                                <div class="timeline-content">
                                    <h4>2010</h4>
                                    <p>
                                        Chuyển mình phát triển thành
                                        Trường Đại học định hướng nghiên cứu.
                                    </p>
                                </div>
                                <span class="timeline-dot"></span>
                                <span class="timeline-line"></span>
                            </div>

                            <!-- 2012 -->
                            <div class="timeline-item left">
                                <div class="timeline-content">
                                    <h4>2012</h4>
                                    <p>Thành lập Khoa Kiến trúc.</p>
                                </div>
                                <span class="timeline-dot"></span>
                                <span class="timeline-line"></span>
                            </div>

                            <!-- 2017 -->
                            <div class="timeline-item right">
                                <div class="timeline-content">
                                    <h4>2017</h4>
                                    <p>
                                        Đạt chứng nhận cơ sở giáo dục đại học
                                        theo tiêu chuẩn HCERES.
                                    </p>
                                </div>
                                <span class="timeline-dot"></span>
                                <span class="timeline-line"></span>
                            </div>

                            <!-- 2018 -->
                            <div class="timeline-item left">
                                <div class="timeline-content">
                                    <h4>2018</h4>
                                    <p>
                                        Thành lập Khoa Khoa học Công nghệ Tiên tiến.
                                    </p>
                                </div>
                                <span class="timeline-dot"></span>
                                <span class="timeline-line"></span>
                            </div>

                            <!-- 2020 -->
                            <div class="timeline-item right">
                                <div class="timeline-content">
                                    <h4>2020</h4>
                                    <p>
                                        Đạt danh hiệu Anh hùng Lao động
                                        thời kỳ đổi mới.
                                    </p>
                                </div>
                                <span class="timeline-dot"></span>
                                <span class="timeline-line"></span>
                            </div>

                            <!-- 2022 -->
                            <div class="timeline-item left">
                                <div class="timeline-content">
                                    <h4>2022</h4>
                                    <p>
                                        Được trao tặng Huân chương Độc lập hạng Nhì.
                                    </p>
                                </div>
                                <span class="timeline-dot"></span>
                                <span class="timeline-line"></span>
                            </div>

                            <!-- 2025 -->
                            <div class="timeline-item right">
                                <div class="timeline-content">
                                    <h4>2025</h4>
                                    <p>
                                        Hình thành hệ sinh thái giáo dục nhân văn –
                                        đổi mới – sáng tạo, kỷ niệm 50 năm phát triển.
                                    </p>
                                </div>
                                <span class="timeline-dot"></span>
                                <span class="timeline-line"></span>
                            </div>

                        </div>
                    </div>





                    <!-- Values Tab -->
                    <div class="tab-pane fade" id="values" role="tabpanel">
                        <div class="row align-items-center">
                            <div class="col-md-7 mb-3">
                                <h3 class="mb-3 text-primary fw-bold">Giá trị cốt lõi</h3>
                                <div class="value-card mb-3 p-3 border-start border-warning border-5 bg-light">
                                    <h5 class="text-primary"><i class="bi bi-star-fill text-warning me-2"></i>Chất lượng</h5>
                                    <p class="mb-0">Cam kết mang lại chất lượng đào tạo và nghiên cứu xuất sắc, 
                                    đáp ứng tiêu chuẩn quốc tế.</p>
                                </div>
                                <div class="value-card mb-3 p-3 border-start border-warning border-5 bg-light">
                                    <h5 class="text-primary"><i class="bi bi-people-fill text-warning me-2"></i>Trách nhiệm</h5>
                                    <p class="mb-0">Đào tạo sinh viên có ý thức trách nhiệm cao đối với bản thân, 
                                    gia đình và xã hội.</p>
                                </div>
                                <div class="value-card mb-3 p-3 border-start border-warning border-5 bg-light">
                                    <h5 class="text-primary"><i class="bi bi-lightbulb-fill text-warning me-2"></i>Sáng tạo</h5>
                                    <p class="mb-0">Khuyến khích tinh thần đổi mới, sáng tạo trong học tập, 
                                    nghiên cứu và ứng dụng công nghệ.</p>
                                </div>
                                <div class="value-card mb-3 p-3 border-start border-warning border-5 bg-light">
                                    <h5 class="text-primary"><i class="bi bi-globe text-warning me-2"></i>Hội nhập</h5>
                                    <p class="mb-0">Hướng tới sự hội nhập quốc tế, hợp tác với các trường đại học 
                                    hàng đầu trên thế giới.</p>
                                </div>
                                <div class="value-card mb-3 p-3 border-start border-warning border-5 bg-light">
                                    <h5 class="text-primary"><i class="bi bi-heart-fill text-warning me-2"></i>Nhân văn</h5>
                                    <p class="mb-0">Xây dựng môi trường giáo dục nhân văn, tôn trọng và phát triển 
                                    toàn diện con người.</p>
                                </div>
                            </div>
                            <div class="col-md-5 mb-3">
                                <img src="${pageContext.request.contextPath}/assets/img/about-values.jpg" 
                                     class="img-fluid rounded shadow" 
                                     alt="Giá trị cốt lõi"
                                     loading="lazy"
                                     onerror="this.src='https://via.placeholder.com/500x400/005FB7/ffffff?text=Gia+tri+cot+loi'">
                            </div>
                        </div>
                    </div>

                    <!-- Team Tab -->
                    <div class="tab-pane fade" id="team" role="tabpanel">
                        <div class="row align-items-center">
                            <div class="col-md-7 mb-3">
                                <h3 class="mb-3 text-primary fw-bold">Đội ngũ giảng viên</h3>
                                <p class="text-justify">
                                    Trường Đại học Bách Khoa - Đại học Đà Nẵng tự hào sở hữu đội ngũ giảng viên 
                                    giàu kinh nghiệm, trình độ chuyên môn cao và tâm huyết với nghề.
                                </p>
                                <div class="row g-3 mb-3">
                                    <div class="col-6">
                                        <div class="stat-box text-center p-3 bg-primary text-white rounded">
                                            <h2 class="display-4 fw-bold mb-0">500+</h2>
                                            <p class="mb-0">Giảng viên</p>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="stat-box text-center p-3 bg-warning text-primary rounded">
                                            <h2 class="display-4 fw-bold mb-0">70%</h2>
                                            <p class="mb-0">Thạc sĩ, Tiến sĩ</p>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="stat-box text-center p-3 bg-warning text-primary rounded">
                                            <h2 class="display-4 fw-bold mb-0">100+</h2>
                                            <p class="mb-0">Giảng viên quốc tế</p>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="stat-box text-center p-3 bg-primary text-white rounded">
                                            <h2 class="display-4 fw-bold mb-0">20+</h2>
                                            <p class="mb-0">Năm kinh nghiệm TB</p>
                                        </div>
                                    </div>
                                </div>
                                <p class="text-justify">
                                    Nhiều giảng viên của trường đã từng học tập và làm việc tại các trường đại học 
                                    và tổ chức nghiên cứu hàng đầu thế giới, mang về những kiến thức và kinh nghiệm 
                                    quý báu để truyền đạt cho sinh viên.
                                </p>
                            </div>
                            <div class="col-md-5 mb-3">
                                <img src="${pageContext.request.contextPath}/assets/img/about-team.jpg" 
                                     class="img-fluid rounded shadow" 
                                     alt="Đội ngũ giảng viên"
                                     loading="lazy"
                                     onerror="this.src='https://via.placeholder.com/500x400/005FB7/ffffff?text=Doi+ngu+giang+vien'">
                            </div>
                        </div>
                    </div>

                    <!-- Cooperation Tab -->
                    <div class="tab-pane fade" id="cooperation" role="tabpanel">
                        <div class="row align-items-center">
                            <div class="col-md-7 mb-3">
                                <h3 class="mb-3 text-primary fw-bold">Hợp tác quốc tế</h3>
                                <p class="text-justify">
                                    Trường Đại học Bách Khoa - Đại học Đà Nẵng đã thiết lập quan hệ hợp tác với 
                                    hơn 100 trường đại học và tổ chức giáo dục uy tín trên thế giới.
                                </p>
                                <h5 class="text-primary mt-4 mb-3">Các hình thức hợp tác:</h5>
                                <ul class="cooperation-list">
                                    <li class="mb-2">
                                        <i class="bi bi-check2-circle text-warning me-2"></i>
                                        Trao đổi sinh viên và giảng viên
                                    </li>
                                    <li class="mb-2">
                                        <i class="bi bi-check2-circle text-warning me-2"></i>
                                        Chương trình đào tạo liên kết quốc tế
                                    </li>
                                    <li class="mb-2">
                                        <i class="bi bi-check2-circle text-warning me-2"></i>
                                        Nghiên cứu khoa học chung
                                    </li>
                                    <li class="mb-2">
                                        <i class="bi bi-check2-circle text-warning me-2"></i>
                                        Hội thảo và hội nghị khoa học quốc tế
                                    </li>
                                    <li class="mb-2">
                                        <i class="bi bi-check2-circle text-warning me-2"></i>
                                        Chương trình học bổng quốc tế
                                    </li>
                                </ul>
                                <h5 class="text-primary mt-4 mb-3">Đối tác tiêu biểu:</h5>
                                <p class="text-muted small">
                                    Hoa Kỳ, Canada, Úc, Nhật Bản, Hàn Quốc, Đức, Pháp, Anh, Singapore, 
                                    và nhiều quốc gia khác trong khu vực châu Á - Thái Bình Dương.
                                </p>
                            </div>
                            <div class="col-md-5 mb-3">
                                <img src="${pageContext.request.contextPath}/assets/img/about-cooperation.jpg" 
                                     class="img-fluid rounded shadow" 
                                     alt="Hợp tác quốc tế"
                                     loading="lazy"
                                     onerror="this.src='https://via.placeholder.com/500x400/005FB7/ffffff?text=Hop+tac+quoc+te'">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<style>
    /* ================= VERTICAL TIMELINE ================= */
    .vertical-timeline {
        position: relative;
        max-width: 1000px;
        margin: auto;
    }

    .vertical-timeline::before {
        content: '';
        position: absolute;
        left: 50%;
        top: 0;
        bottom: 0;
        width: 3px;
        background: #FDC32D;
        transform: translateX(-50%);
    }

    /* ========== ITEM ========== */
    .timeline-item {
        position: relative;
        width: 50%;
        padding: 30px 40px; /* Padding này tạo ra khoảng cách 40px giữa content và đường kẻ chính */
    }

    .timeline-item.left {
        left: 0;
        text-align: right;
    }

    .timeline-item.right {
        left: 50%;
        text-align: left;
    }

    /* ========== DOT & LINE (GOM CHUNG CĂN GIỮA) - ĐÃ SỬA ========== */
    .timeline-dot,
    .timeline-line {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
    }

    /* dot */
    .timeline-dot {
        width: 14px;
        height: 14px;
        background: #005FB7;
        border-radius: 50%;
        z-index: 2;
    }

    /* line */
    .timeline-line {
        height: 2px;
        background: #005FB7;
    }


    .timeline-item.left .timeline-dot {
        right: -7px;
    }

    .timeline-item.right .timeline-dot {
        left: -7px;
    }


    .timeline-item.left .timeline-line {
        right: 0;
        width: 40px;
    }

    .timeline-item.right .timeline-line {
        left: 0;
        width: 40px;
    }

    /* ========== CONTENT ========== */
    .timeline-content {
        background: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 3px 12px rgba(0,0,0,0.1);
    }

    .timeline-item.left .timeline-content {
        border-right: 4px solid #005FB7;
    }

    .timeline-item.right .timeline-content {
        border-left: 4px solid #005FB7;
    }

    .timeline-content h4 {
        font-weight: 700;
        color: #005FB7;
        margin-bottom: 10px;
    }

    /* ========== MOBILE ========== */
    @media (max-width: 768px) {
        .vertical-timeline::before {
            left: 20px;
        }

        .timeline-item {
            width: 100%;
            left: 0 !important;
            padding-left: 60px; /* Tăng padding để tạo khoảng trống cho dot/line */
            text-align: left !important;
        }

        .timeline-dot {
            left: 13px; /* Căn chỉnh chấm tròn so với đường dọc mới (20px) */
            right: auto;
        }

        /* Sửa line cho mobile */
        .timeline-line {
            left: 20px; /* Bắt đầu từ đường dọc chính */
            width: 30px; /* Chiều dài nối ra content */
        }

        /* Đảm bảo line và dot không bị dịch chuyển theo side */
        .timeline-item.left .timeline-line {
            right: auto;
        }

        .timeline-item.right .timeline-line {
            right: auto;
        }


        .timeline-content {
            border-left: 4px solid #005FB7;
            border-right: none;
        }
    }
</style>
