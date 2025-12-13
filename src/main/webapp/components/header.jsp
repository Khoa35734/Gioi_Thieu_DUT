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
                <img src="${pageContext.request.contextPath}/assets/img/logo-dut.jpg"
                     alt="Logo Đại học Bách Khoa Đà Nẵng"
                     height="50"
                     class="me-3"
                     onerror="this.style.display='none'">
                <div class="logo-text">
                    <div class="small univ-name">ĐẠI HỌC ĐÀ NẴNG</div>
                    <div class="fw-bold fs-5 school-name">TRƯỜNG ĐẠI HỌC BÁCH KHOA</div>
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
                    <!-- html -->
                    <li class="nav-item ms-lg-3">
                        <form class="d-flex" role="search">
                            <div class="input-group input-group-sm search-group rounded-pill overflow-hidden">
                                <input class="form-control form-control-sm search-input rounded-start" type="search" placeholder="Tìm kiếm..."
                                       aria-label="Search">
                                <button class="btn btn-warning rounded-end" type="submit" aria-label="Tìm kiếm">
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
    .site-header,
    .site-header a,
    .site-header .nav-link,
    .site-header .dropdown-item,
    .site-header .social-links a,
    .site-header .small,
    .site-header .logo-text,
    .site-header .navbar-brand,
    .site-header .btn-warning {
        color: #000 !important;
    }

    .site-header .bg-primary {
        background-color: #ffffff !important;
        color: #000 !important;
    }

    .site-header .nav-link {
        font-weight: 500;
        padding: 0.5rem 1rem;
        transition: all 0.3s ease;
        color: #000 !important;
    }

    .site-header .nav-link:hover {
        color: #000 !important;
        text-decoration: none;
    }

    .site-header .dropdown-menu {
        border: none;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    }

    .site-header .dropdown-item {
        color: #000 !important;
    }

    .site-header .dropdown-item:hover {
        background-color: #f1f1f1;
        color: #000 !important;
    }

    .site-header .btn-warning {
        background-color: #FDC32D;
        border-color: #FDC32D;
        color: #000 !important;
    }

    .site-header .btn-warning:hover {
        background-color: #e5b029;
        border-color: #e5b029;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        color: #000 !important;
    }

    .site-header .social-links a {
        font-size: 1.1rem;
        transition: opacity 0.3s;
        color: #000 !important;
    }

    .site-header .social-links a:hover {
        opacity: 0.8;
        color: #000 !important;
    }

    .site-header .logo-text .univ-name {
        color: #7FC8FF !important; /* light blue */
    }

    .site-header .logo-text .school-name {
        color: #0B3D91 !important; /* dark blue */
    }

/* CSS */
.site-header .search-group {
    display: flex;
    align-items: center;
    max-width: 220px;
    width: auto;
    /* allow child shadows and small transforms without being clipped */
    overflow: visible;          /* was overflow: hidden */
    border-radius: 1px;
    position: relative;
    z-index: 2;                 /* sit above neighboring hotline/button */
}

/* ensure input can shrink inside flex and its rounding stays intact */
.site-header .search-input {
    flex: 1 1 auto;
    min-width: 0;
    width: auto;
    background-clip: padding-box; /* prevents background bleeding at rounded corners */
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
}

/* keep button inside the pill and avoid shadows pushing it out */
.site-header .search-group .btn {
    flex: 0 0 auto;
    border-top-left-radius: 0;
    border-bottom-left-radius: 0;
    margin: 0;
    box-shadow: none;           /* avoid extra overflow from shadows */
    transform: none;            /* avoid translations that cause clipping */
}

    /* Combined responsive rules */
    @media (max-width: 991px) {
        .site-header .nav-item {
            margin: 0.25rem 0;
        }

        .site-header .btn-warning {
            margin-top: 0.5rem;
        }

        .site-header .search-group {
            max-width: 140px;
        }

        .site-header .search-input {
            width: 8rem;
        }
    }
    /* Add/replace in `src/main/webapp/components/header.jsp` inside the existing <style> block */
    .site-header .top-bar,
    .site-header .top-bar a,
    .site-header .top-bar .small {
        background-color: #0B3D91 !important; /* dark blue */
        color: #fff !important;               /* white text */
        padding: 0.35rem 0;
    }

    /* keep social icons white */
    .site-header .top-bar .social-links a {
        color: #fff !important;
    }

    /* container layout (optional, preserves alignment) */
    .site-header .top-bar .container {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    /* css - add inside `src/main/webapp/components/header.jsp` <style> block */
    /* force page background to white */
    html, body {
        background: #ffffff !important;
    }

    /* remove possible pseudo-element strips on the header */
    .site-header::before,
    .site-header::after {
        content: none !important;
        display: none !important;
    }

    /* remove background-image / gradient / top-bottom borders or shadows */
    .site-header,
    .header-wrapper,
    .header-strip-top,
    .header-strip-bottom {
        background-image: none !important;
        background: transparent !important;
        box-shadow: none !important;
        border-top: none !important;
        border-bottom: none !important;
    }

    /* safeguard: hide any small decorative bars if they use specific classes */
    .header-decorator,
    .top-decorator,
    .bottom-decorator {
        display: none !important;
    }
</style>

