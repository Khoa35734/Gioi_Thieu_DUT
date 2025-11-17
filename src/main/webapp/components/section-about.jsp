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
                                    Đào tạo nguồn nhân lực kỹ thuật công nghệ chất lượng cao, có phẩm chất đạo đức, 
                                    trách nhiệm xã hội, năng lực chuyên môn vững vàng và kỹ năng thực hành tốt, 
                                    đáp ứng nhu cầu phát triển của xã hội.
                                </p>
                                <p class="text-justify">
                                    Thực hiện nghiên cứu khoa học và chuyển giao công nghệ, tạo ra những giá trị khoa học 
                                    và công nghệ phục vụ cộng đồng và đóng góp vào sự phát triển bền vững của đất nước.
                                </p>
                                <div class="alert alert-info" role="alert">
                                    <i class="bi bi-lightbulb me-2"></i>
                                    <strong>Cam kết:</strong> Mỗi sinh viên tốt nghiệp từ Trường Đại học Bách Khoa 
                                    đều được trang bị đầy đủ kiến thức, kỹ năng và phẩm chất cần thiết để thành công 
                                    trong sự nghiệp và cuộc sống.
                                </div>
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
                        <div class="row align-items-center">
                            <div class="col-md-7 mb-3">
                                <h3 class="mb-3 text-primary fw-bold">Lịch sử hình thành và phát triển</h3>
                                <div class="timeline">
                                    <div class="timeline-item mb-4">
                                        <div class="timeline-badge bg-warning">1975</div>
                                        <div class="timeline-content">
                                            <h5>Thành lập Trường</h5>
                                            <p>Trường Đại học Bách Khoa Đà Nẵng được thành lập, tiền thân là 
                                            Phân hiệu Đại học Bách Khoa Sài Gòn tại Đà Nẵng.</p>
                                        </div>
                                    </div>
                                    <div class="timeline-item mb-4">
                                        <div class="timeline-badge bg-warning">1994</div>
                                        <div class="timeline-content">
                                            <h5>Sáp nhập vào ĐHĐN</h5>
                                            <p>Trường chính thức trở thành thành viên của Đại học Đà Nẵng, 
                                            mở rộng quy mô đào tạo và nghiên cứu.</p>
                                        </div>
                                    </div>
                                    <div class="timeline-item mb-4">
                                        <div class="timeline-badge bg-warning">2005</div>
                                        <div class="timeline-content">
                                            <h5>Đạt chuẩn chất lượng</h5>
                                            <p>Trường đạt kiểm định chất lượng giáo dục theo tiêu chuẩn quốc gia, 
                                            khẳng định vị thế hàng đầu trong đào tạo kỹ thuật.</p>
                                        </div>
                                    </div>
                                    <div class="timeline-item mb-4">
                                        <div class="timeline-badge bg-warning">2015</div>
                                        <div class="timeline-content">
                                            <h5>Công nhận chuẩn quốc tế</h5>
                                            <p>Nhiều chương trình đào tạo được công nhận đạt chuẩn AUN-QA, 
                                            mở ra cơ hội hợp tác quốc tế rộng lớn.</p>
                                        </div>
                                    </div>
                                    <div class="timeline-item">
                                        <div class="timeline-badge bg-warning">2025</div>
                                        <div class="timeline-content">
                                            <h5>Phát triển toàn diện</h5>
                                            <p>Trường tiếp tục phát triển mạnh mẽ với cơ sở vật chất hiện đại, 
                                            đội ngũ giảng viên chất lượng cao và hợp tác quốc tế sâu rộng.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5 mb-3">
                                <img src="${pageContext.request.contextPath}/assets/img/about-history.jpg" 
                                     class="img-fluid rounded shadow mb-3" 
                                     alt="Lịch sử"
                                     loading="lazy"
                                     onerror="this.src='https://via.placeholder.com/500x400/005FB7/ffffff?text=Lich+su'">
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
.about-section {
    background-color: #f8f9fa;
}

.section-title {
    font-size: 2.5rem;
    color: #005FB7;
}

.title-divider {
    width: 80px;
    height: 4px;
    background: linear-gradient(90deg, #005FB7 0%, #FDC32D 100%);
    margin-top: 1rem;
}

.about-sidebar .list-group-item {
    border: none;
    border-left: 3px solid transparent;
    background-color: #ffffff;
    margin-bottom: 0.5rem;
    border-radius: 0.25rem;
    transition: all 0.3s ease;
}

.about-sidebar .list-group-item:hover {
    border-left-color: #FDC32D;
    background-color: #f0f8ff;
    padding-left: 1.5rem;
}

.about-sidebar .list-group-item.active {
    background-color: #005FB7;
    color: white;
    border-left-color: #FDC32D;
    font-weight: 600;
}

.about-content {
    background-color: #ffffff;
    padding: 2rem;
    border-radius: 0.5rem;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    min-height: 500px;
}

.timeline {
    position: relative;
    padding-left: 50px;
}

.timeline::before {
    content: '';
    position: absolute;
    left: 20px;
    top: 0;
    bottom: 0;
    width: 2px;
    background-color: #FDC32D;
}

.timeline-item {
    position: relative;
}

.timeline-badge {
    position: absolute;
    left: -38px;
    width: 60px;
    height: 60px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    color: #005FB7;
    font-size: 0.9rem;
    border: 3px solid #005FB7;
}

.timeline-content {
    padding: 1rem;
    background-color: #f8f9fa;
    border-radius: 0.5rem;
    border-left: 3px solid #005FB7;
}

.value-card {
    transition: all 0.3s ease;
}

.value-card:hover {
    transform: translateX(10px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

.stat-box {
    transition: all 0.3s ease;
}

.stat-box:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 12px rgba(0,0,0,0.2);
}

.cooperation-list {
    list-style: none;
    padding-left: 0;
}

@media (max-width: 991px) {
    .about-sidebar {
        position: relative !important;
        top: 0 !important;
    }
    
    .about-content {
        margin-top: 1rem;
    }
}
</style>
