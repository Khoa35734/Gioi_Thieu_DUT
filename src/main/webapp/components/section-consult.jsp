<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Consultation Form Section -->
<section id="consult" class="consult-section py-5 bg-light">
    <div class="container">
        <div class="row mb-5">
            <div class="col-12 text-center">
                <h2 class="section-title fw-bold text-primary mb-3">ĐĂNG KÝ TƯ VẤN</h2>
                <p class="lead text-muted">Để lại thông tin, chúng tôi sẽ liên hệ tư vấn miễn phí</p>
                <div class="title-divider mx-auto"></div>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="consult-form-wrapper p-5 rounded shadow">
                    <form id="consultForm" action="${pageContext.request.contextPath}/register-consult" method="post" 
                          class="needs-validation" novalidate>
                        <div class="row g-4">
                            <!-- Full Name -->
                            <div class="col-md-6">
                                <label for="fullName" class="form-label fw-bold">
                                    Họ và tên <span class="text-danger">*</span>
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text bg-primary text-white">
                                        <i class="bi bi-person-fill"></i>
                                    </span>
                                    <input type="text" 
                                           class="form-control" 
                                           id="fullName" 
                                           name="fullName" 
                                           placeholder="Nhập họ và tên"
                                           required
                                           minlength="3"
                                           maxlength="100">
                                    <div class="invalid-feedback">
                                        Vui lòng nhập họ và tên (từ 3 ký tự).
                                    </div>
                                </div>
                            </div>

                            <!-- Phone Number -->
                            <div class="col-md-6">
                                <label for="phone" class="form-label fw-bold">
                                    Số điện thoại <span class="text-danger">*</span>
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text bg-primary text-white">
                                        <i class="bi bi-telephone-fill"></i>
                                    </span>
                                    <input type="tel" 
                                           class="form-control" 
                                           id="phone" 
                                           name="phone" 
                                           placeholder="Nhập số điện thoại"
                                           required
                                           pattern="[0-9]{10,11}">
                                    <div class="invalid-feedback">
                                        Vui lòng nhập số điện thoại hợp lệ (10-11 số).
                                    </div>
                                </div>
                            </div>

                            <!-- Email -->
                            <div class="col-md-6">
                                <label for="email" class="form-label fw-bold">
                                    Email <span class="text-danger">*</span>
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text bg-primary text-white">
                                        <i class="bi bi-envelope-fill"></i>
                                    </span>
                                    <input type="email" 
                                           class="form-control" 
                                           id="email" 
                                           name="email" 
                                           placeholder="Nhập địa chỉ email"
                                           required>
                                    <div class="invalid-feedback">
                                        Vui lòng nhập email hợp lệ.
                                    </div>
                                </div>
                            </div>

                            <!-- Program Interest -->
                            <div class="col-md-6">
                                <label for="program" class="form-label fw-bold">
                                    Chương trình quan tâm <span class="text-danger">*</span>
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text bg-primary text-white">
                                        <i class="bi bi-book-fill"></i>
                                    </span>
                                    <select class="form-select" id="program" name="program" required>
                                        <option value="" selected disabled>Chọn chương trình</option>
                                        <option value="cntt">Công nghệ thông tin</option>
                                        <option value="co-khi">Cơ khí - Cơ điện tử</option>
                                        <option value="dien">Điện - Điện tử</option>
                                        <option value="xay-dung">Kỹ thuật xây dựng</option>
                                        <option value="oto">Công nghệ kỹ thuật ô tô</option>
                                        <option value="hoa">Kỹ thuật hóa học</option>
                                        <option value="moi-truong">Kỹ thuật môi trường</option>
                                        <option value="khac">Chưa xác định</option>
                                    </select>
                                    <div class="invalid-feedback">
                                        Vui lòng chọn chương trình quan tâm.
                                    </div>
                                </div>
                            </div>

                            <!-- Province/City -->
                            <div class="col-md-6">
                                <label for="province" class="form-label fw-bold">
                                    Tỉnh/Thành phố
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text bg-primary text-white">
                                        <i class="bi bi-geo-alt-fill"></i>
                                    </span>
                                    <select class="form-select" id="province" name="province">
                                        <option value="" selected>Chọn tỉnh/thành phố</option>
                                        <option value="da-nang">Đà Nẵng</option>
                                        <option value="quang-nam">Quảng Nam</option>
                                        <option value="quang-ngai">Quảng Ngãi</option>
                                        <option value="thua-thien-hue">Thừa Thiên Huế</option>
                                        <option value="quang-tri">Quảng Trị</option>
                                        <option value="binh-dinh">Bình Định</option>
                                        <option value="khac">Tỉnh/thành phố khác</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Consultation Type -->
                            <div class="col-md-6">
                                <label for="consultType" class="form-label fw-bold">
                                    Loại tư vấn
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text bg-primary text-white">
                                        <i class="bi bi-chat-dots-fill"></i>
                                    </span>
                                    <select class="form-select" id="consultType" name="consultType">
                                        <option value="chuong-trinh" selected>Chương trình đào tạo</option>
                                        <option value="tuyen-sinh">Tuyển sinh</option>
                                        <option value="hoc-phi">Học phí</option>
                                        <option value="hoc-bong">Học bổng</option>
                                        <option value="co-so-vat-chat">Cơ sở vật chất</option>
                                        <option value="khac">Khác</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Notes -->
                            <div class="col-12">
                                <label for="notes" class="form-label fw-bold">
                                    Ghi chú thêm
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text bg-primary text-white align-items-start pt-2">
                                        <i class="bi bi-pencil-fill"></i>
                                    </span>
                                    <textarea class="form-control" 
                                              id="notes" 
                                              name="notes" 
                                              rows="4" 
                                              placeholder="Nhập các câu hỏi hoặc thông tin cần tư vấn..."></textarea>
                                </div>
                            </div>

                            <!-- Privacy Policy -->
                            <div class="col-12">
                                <div class="form-check">
                                    <input class="form-check-input" 
                                           type="checkbox" 
                                           id="agreePolicy" 
                                           required>
                                    <label class="form-check-label small" for="agreePolicy">
                                        Tôi đồng ý với 
                                        <a href="#" class="text-primary">chính sách bảo mật</a> 
                                        và cho phép nhà trường liên hệ tư vấn. <span class="text-danger">*</span>
                                    </label>
                                    <div class="invalid-feedback">
                                        Bạn cần đồng ý với chính sách bảo mật.
                                    </div>
                                </div>
                            </div>

                            <!-- Submit Button -->
                            <div class="col-12 text-center mt-4">
                                <button type="submit" class="btn btn-warning btn-lg px-5 py-3 w-100 w-md-auto">
                                    <i class="bi bi-send-fill me-2"></i>GỬI THÔNG TIN
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Success Message (Hidden by default) -->
                    <div id="successMessage" class="alert alert-success mt-4 d-none" role="alert">
                        <i class="bi bi-check-circle-fill me-2"></i>
                        <strong>Cảm ơn bạn!</strong> Chúng tôi đã nhận được thông tin đăng ký. 
                        Phòng tuyển sinh sẽ liên hệ với bạn trong thời gian sớm nhất.
                    </div>
                </div>
            </div>

            <!-- Contact Info Sidebar -->
            <div class="col-lg-4 mt-4 mt-lg-0">
                <div class="contact-sidebar">
                    <!-- Hotline Card -->
                    <div class="contact-card p-4 mb-4 rounded shadow-sm">
                        <div class="contact-icon mb-3">
                            <i class="bi bi-telephone-fill"></i>
                        </div>
                        <h5 class="fw-bold mb-3 text-primary">Hotline tư vấn</h5>
                        <p class="mb-2">
                            <a href="tel:02363736666" class="text-decoration-none text-dark fw-bold fs-4">
                                0236.3736.666
                            </a>
                        </p>
                        <p class="small text-muted mb-0">
                            <i class="bi bi-clock me-1"></i>
                            Thứ 2 - Thứ 7: 7:30 - 17:00
                        </p>
                    </div>

                    <!-- Email Card -->
                    <div class="contact-card p-4 mb-4 rounded shadow-sm">
                        <div class="contact-icon mb-3">
                            <i class="bi bi-envelope-fill"></i>
                        </div>
                        <h5 class="fw-bold mb-3 text-primary">Email tư vấn</h5>
                        <p class="mb-0">
                            <a href="mailto:tuyensinh@dut.udn.vn" class="text-decoration-none text-dark">
                                tuyensinh@dut.udn.vn
                            </a>
                        </p>
                    </div>

                    <!-- Address Card -->
                    <div class="contact-card p-4 mb-4 rounded shadow-sm">
                        <div class="contact-icon mb-3">
                            <i class="bi bi-geo-alt-fill"></i>
                        </div>
                        <h5 class="fw-bold mb-3 text-primary">Địa chỉ</h5>
                        <p class="mb-0 small">
                            54 Nguyễn Lương Bằng, Quận Liên Chiểu, Thành phố Đà Nẵng
                        </p>
                    </div>

                    <!-- Social Media Card -->
                    <div class="contact-card p-4 rounded shadow-sm">
                        <div class="contact-icon mb-3">
                            <i class="bi bi-share-fill"></i>
                        </div>
                        <h5 class="fw-bold mb-3 text-primary">Kết nối với chúng tôi</h5>
                        <div class="social-buttons">
                            <a href="#" class="btn btn-outline-primary me-2 mb-2">
                                <i class="bi bi-facebook"></i> Facebook
                            </a>
                            <a href="#" class="btn btn-outline-primary me-2 mb-2">
                                <i class="bi bi-youtube"></i> YouTube
                            </a>
                            <a href="#" class="btn btn-outline-primary mb-2">
                                <i class="bi bi-chat-dots-fill"></i> Zalo
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<style>
.consult-section {
    background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
}

.consult-section .section-title {
    font-size: 2.5rem;
    color: #005FB7;
}

.consult-section .title-divider {
    width: 80px;
    height: 4px;
    background: linear-gradient(90deg, #005FB7 0%, #FDC32D 100%);
    margin-top: 1rem;
}

.consult-form-wrapper {
    background: white;
}

.consult-form-wrapper .input-group-text {
    background-color: #005FB7;
    border-color: #005FB7;
}

.consult-form-wrapper .form-control:focus,
.consult-form-wrapper .form-select:focus {
    border-color: #FDC32D;
    box-shadow: 0 0 0 0.25rem rgba(253, 195, 45, 0.25);
}

.consult-form-wrapper .btn-warning {
    background-color: #FDC32D;
    border-color: #FDC32D;
    color: #005FB7;
    font-weight: 600;
    font-size: 1.1rem;
    transition: all 0.3s ease;
}

.consult-form-wrapper .btn-warning:hover {
    background-color: #005FB7;
    border-color: #005FB7;
    color: white;
    transform: translateY(-3px);
    box-shadow: 0 8px 16px rgba(0, 95, 183, 0.3);
}

.contact-card {
    background: white;
    transition: all 0.3s ease;
}

.contact-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15) !important;
}

.contact-icon {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    background: linear-gradient(135deg, #005FB7 0%, #003d82 100%);
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto;
}

.contact-icon i {
    font-size: 1.8rem;
    color: #FDC32D;
}

.contact-sidebar .btn-outline-primary {
    border-color: #005FB7;
    color: #005FB7;
    font-size: 0.9rem;
    transition: all 0.3s ease;
}

.contact-sidebar .btn-outline-primary:hover {
    background-color: #005FB7;
    border-color: #005FB7;
    color: white;
}

@media (max-width: 767px) {
    .consult-section .section-title {
        font-size: 2rem;
    }
    
    .consult-form-wrapper {
        padding: 2rem 1.5rem !important;
    }
}
</style>

<script>
// Form validation
(function () {
    'use strict';
    
    const form = document.getElementById('consultForm');
    
    if (form) {
        form.addEventListener('submit', function (event) {
            event.preventDefault();
            event.stopPropagation();
            
            if (form.checkValidity()) {
                // Here you would normally send the form data to the server
                // For demonstration, we'll just show the success message
                
                const successMessage = document.getElementById('successMessage');
                successMessage.classList.remove('d-none');
                
                // Scroll to success message
                successMessage.scrollIntoView({ behavior: 'smooth', block: 'center' });
                
                // Reset form
                form.reset();
                form.classList.remove('was-validated');
                
                // Hide success message after 5 seconds
                setTimeout(function() {
                    successMessage.classList.add('d-none');
                }, 5000);
            }
            
            form.classList.add('was-validated');
        }, false);
    }
})();
</script>
