<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Footer Section -->
<footer class="site-footer bg-dark text-white pt-5 pb-3">
    <div class="container">
        <div class="row">
            <!-- About Column -->
            <div class="col-lg-4 col-md-6 mb-4">
                <h5 class="text-warning mb-3">TRƯỜNG ĐẠI HỌC BÁCH KHOA</h5>
                <h6 class="mb-3">Đại học Đà Nẵng</h6>
                <p class="small">
                    Trường Đại học Bách Khoa - Đại học Đà Nẵng là cơ sở đào tạo kỹ thuật công nghệ hàng đầu miền Trung, 
                    cam kết đào tạo nguồn nhân lực chất lượng cao, đáp ứng nhu cầu phát triển kinh tế - xã hội.
                </p>
                <div class="mt-3">
                    <a href="#" class="btn btn-outline-light btn-sm me-2 mb-2" aria-label="Facebook">
                        <i class="bi bi-facebook"></i> Facebook
                    </a>
                    <a href="#" class="btn btn-outline-light btn-sm me-2 mb-2" aria-label="YouTube">
                        <i class="bi bi-youtube"></i> YouTube
                    </a>
                    <a href="#" class="btn btn-outline-light btn-sm mb-2" aria-label="Zalo">
                        <i class="bi bi-chat-dots-fill"></i> Zalo
                    </a>
                </div>
            </div>

            <!-- Quick Links Column -->
            <div class="col-lg-2 col-md-6 mb-4">
                <h5 class="text-warning mb-3">Liên kết nhanh</h5>
                <ul class="list-unstyled footer-links">
                    <li><a href="${pageContext.request.contextPath}/" class="text-white-50">Trang chủ</a></li>
                    <li><a href="${pageContext.request.contextPath}/about.jsp" class="text-white-50">Giới thiệu</a></li>
                    <li><a href="${pageContext.request.contextPath}/news.jsp" class="text-white-50">Tin tức</a></li>
                    <li><a href="${pageContext.request.contextPath}/#admission" class="text-white-50">Tuyển sinh</a></li>
                    <li><a href="${pageContext.request.contextPath}/faculty" class="text-white-50">Khoa - Viện</a></li>
                    <li><a href="#contact" class="text-white-50">Liên hệ</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/login" class="text-white-50">Admin Login</a></li>
                </ul>
            </div>

            <!-- Training Programs Column -->
            <div class="col-lg-3 col-md-6 mb-4">
                <h5 class="text-warning mb-3">Đào tạo</h5>
                <ul class="list-unstyled footer-links">
                    <li><a href="#" class="text-white-50">Công nghệ thông tin</a></li>
                    <li><a href="#" class="text-white-50">Cơ khí - Cơ điện tử</a></li>
                    <li><a href="#" class="text-white-50">Điện - Điện tử</a></li>
                    <li><a href="#" class="text-white-50">Xây dựng</a></li>
                    <li><a href="#" class="text-white-50">Đào tạo sau đại học</a></li>
                    <li><a href="#" class="text-white-50">Hợp tác quốc tế</a></li>
                </ul>
            </div>

            <!-- Contact Info Column -->
            <div class="col-lg-3 col-md-6 mb-4">
                <h5 class="text-warning mb-3">Thông tin liên hệ</h5>
                <ul class="list-unstyled contact-info">
                    <li class="mb-2">
                        <i class="bi bi-geo-alt-fill text-warning me-2"></i>
                        <span class="small">54 Nguyễn Lương Bằng, Quận Liên Chiểu, Thành phố Đà Nẵng</span>
                    </li>
                    <li class="mb-2">
                        <i class="bi bi-telephone-fill text-warning me-2"></i>
                        <a href="tel:02363736666" class="text-white-50 small">0236.3736.666</a>
                    </li>
                    <li class="mb-2">
                        <i class="bi bi-envelope-fill text-warning me-2"></i>
                        <a href="mailto:dhbk@dut.udn.vn" class="text-white-50 small">dhbk@dut.udn.vn</a>
                    </li>
                    <li class="mb-2">
                        <i class="bi bi-globe text-warning me-2"></i>
                        <a href="https://dut.udn.vn" target="_blank" rel="noopener" class="text-white-50 small">dut.udn.vn</a>
                    </li>
                </ul>
            </div>
        </div>

        <!-- Google Maps Section -->
        <div class="row mt-4">
            <div class="col-12">
                <h5 class="text-warning mb-3">Bản đồ</h5>
                <div class="map-container">
                    <iframe 
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3835.8566088739814!2d108.14991931533156!3d16.073660388888395!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31421836b5f0b5d5%3A0x28e320d5e8d1b908!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBCw6FjaCBraG9hIC0gxJBIIMSQw6AgTuG6tW5n!5e0!3m2!1svi!2s!4v1637000000000!5m2!1svi!2s" 
                        width="100%" 
                        height="300" 
                        style="border:0;" 
                        allowfullscreen="" 
                        loading="lazy"
                        title="Bản đồ Trường Đại học Bách Khoa - Đại học Đà Nẵng">
                    </iframe>
                </div>
            </div>
        </div>

        <!-- Bottom Bar -->
        <div class="row mt-4 pt-4 border-top border-secondary">
            <div class="col-md-6 text-center text-md-start">
                <p class="small mb-0">
                    &copy; 2025 Trường Đại học Bách Khoa - Đại học Đà Nẵng. All rights reserved.
                </p>
            </div>
            <div class="col-md-6 text-center text-md-end">
                <p class="small mb-0">
                    Thiết kế bởi <span class="text-warning">DUT IT Department</span>
                </p>
            </div>
        </div>
    </div>
</footer>

<!-- Back to Top Button -->
<button id="backToTop" class="btn btn-warning back-to-top" aria-label="Về đầu trang">
    <i class="bi bi-arrow-up"></i>
</button>

<style>
.site-footer {
    background: linear-gradient(135deg, #003d82 0%, #005FB7 100%);
}

.site-footer .footer-links li {
    margin-bottom: 0.5rem;
}

.site-footer .footer-links a,
.site-footer .contact-info a {
    text-decoration: none;
    transition: all 0.3s ease;
}

.site-footer .footer-links a:hover,
.site-footer .contact-info a:hover {
    color: #FDC32D !important;
    padding-left: 5px;
}

.site-footer .btn-outline-light:hover {
    background-color: #FDC32D;
    border-color: #FDC32D;
    color: #005FB7;
}

.site-footer .map-container {
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 4px 6px rgba(0,0,0,0.3);
}

.site-footer .map-container iframe {
    display: block;
}

.back-to-top {
    position: fixed;
    bottom: 30px;
    right: 30px;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    display: none;
    align-items: center;
    justify-content: center;
    background-color: #FDC32D;
    border: none;
    box-shadow: 0 4px 8px rgba(0,0,0,0.3);
    z-index: 1000;
    transition: all 0.3s ease;
    padding: 0;
}

.back-to-top:hover {
    background-color: #005FB7;
    transform: translateY(-5px);
    box-shadow: 0 6px 12px rgba(0,0,0,0.4);
}

.back-to-top i {
    font-size: 1.5rem;
    color: #005FB7;
}

.back-to-top:hover i {
    color: #FDC32D;
}

@media (max-width: 768px) {
    .back-to-top {
        bottom: 20px;
        right: 20px;
        width: 45px;
        height: 45px;
    }
}
</style>

<script>
// Back to Top Button Functionality
document.addEventListener('DOMContentLoaded', function() {
    const backToTopButton = document.getElementById('backToTop');
    
    if (backToTopButton) {
        // Show button when scrolling down
        window.addEventListener('scroll', function() {
            if (window.pageYOffset > 300) {
                backToTopButton.style.display = 'flex';
            } else {
                backToTopButton.style.display = 'none';
            }
        });
        
        // Scroll to top when button is clicked
        backToTopButton.addEventListener('click', function() {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });
    }
});
</script>
