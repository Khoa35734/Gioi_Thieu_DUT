<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Header Section -->
<header class="site-header">
    <!-- Top Bar -->
    <div class="top-bar bg-primary text-white py-2">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <div class="d-flex align-items-center">
                        <i class="bi bi-envelope-fill me-2"></i>
                        <span class="small">dhbk@dut.udn.vn</span>
                        <span class="mx-3">|</span>
                        <i class="bi bi-telephone-fill me-2"></i>
                        <span class="small">0236.3736.666</span>
                    </div>
                </div>
                <div class="col-md-6 text-end">
                    <div class="social-links">
                        <a href="#" class="text-white me-3" aria-label="Facebook"><i class="bi bi-facebook"></i></a>
                        <a href="#" class="text-white me-3" aria-label="YouTube"><i class="bi bi-youtube"></i></a>
                        <a href="#" class="text-white me-3" aria-label="Zalo"><i class="bi bi-chat-dots-fill"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Main Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary sticky-top shadow">
        <div class="container">
            <!-- Logo -->
            <a class="navbar-brand d-flex align-items-center" href="${pageContext.request.contextPath}/">
                <img src="${pageContext.request.contextPath}/assets/img/logo-dut.png" 
                     alt="Logo Đại học Bách Khoa Đà Nẵng" 
                     height="50" 
                     class="me-3"
                     onerror="this.style.display='none'">
                <div class="logo-text">
                    <div class="fw-bold fs-5">TRƯỜNG ĐẠI HỌC BÁCH KHOA</div>
                    <div class="small">Đại học Đà Nẵng</div>
                </div>
            </a>

            <!-- Mobile Toggle -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar" 
                    aria-controls="mainNavbar" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navigation Menu -->
            <div class="collapse navbar-collapse" id="mainNavbar">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0 align-items-lg-center">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/">Trang chủ</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownIntro" role="button" 
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Giới thiệu
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownIntro">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/about.jsp#vision">Tầm nhìn</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/about.jsp#mission">Sứ mệnh</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/about.jsp#history">Lịch sử</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/about.jsp#values">Giá trị cốt lõi</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/news.jsp">Tin tức</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/#admission">Tuyển sinh</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownTraining" role="button" 
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Đào tạo
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownTraining">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/#programs">Chương trình đào tạo</a></li>
                            <li><a class="dropdown-item" href="#">Sau đại học</a></li>
                            <li><a class="dropdown-item" href="#">Liên kết quốc tế</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownFaculty" role="button" 
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Khoa - Viện
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownFaculty">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/faculty">Công nghệ thông tin</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/faculty">Cơ khí</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/faculty">Điện - Điện tử</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/faculty">Xây dựng</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Sinh viên</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#contact">Liên hệ</a>
                    </li>
                    
                    <!-- Search Form -->
                    <li class="nav-item ms-lg-3">
                        <form class="d-flex" role="search">
                            <div class="input-group input-group-sm">
                                <input class="form-control form-control-sm" type="search" placeholder="Tìm kiếm..." 
                                       aria-label="Search" style="min-width: 150px;">
                                <button class="btn btn-warning" type="submit" aria-label="Tìm kiếm">
                                    <i class="bi bi-search"></i>
                                </button>
                            </div>
                        </form>
                    </li>
                    
                    <!-- Hotline Button -->
                    <li class="nav-item ms-lg-2">
                        <a href="tel:02363736666" class="btn btn-warning btn-sm fw-bold text-primary">
                            <i class="bi bi-telephone-fill me-1"></i>
                            Hotline: 0236.3736.666
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<style>
.site-header .bg-primary {
    background-color: #005FB7 !important;
}

.site-header .navbar-brand .logo-text {
    line-height: 1.3;
}

.site-header .nav-link {
    font-weight: 500;
    padding: 0.5rem 1rem;
    transition: all 0.3s ease;
}

.site-header .nav-link:hover {
    color: #FDC32D !important;
}

.site-header .dropdown-menu {
    border: none;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
}

.site-header .dropdown-item:hover {
    background-color: #005FB7;
    color: white;
}

.site-header .btn-warning {
    background-color: #FDC32D;
    border-color: #FDC32D;
    color: #005FB7;
}

.site-header .btn-warning:hover {
    background-color: #e5b029;
    border-color: #e5b029;
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
}

.site-header .social-links a {
    font-size: 1.1rem;
    transition: opacity 0.3s;
}

.site-header .social-links a:hover {
    opacity: 0.8;
}

@media (max-width: 991px) {
    .site-header .nav-item {
        margin: 0.25rem 0;
    }
    
    .site-header .btn-warning {
        margin-top: 0.5rem;
    }
}
</style>
