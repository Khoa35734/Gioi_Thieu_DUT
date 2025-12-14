<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="site-header">
    <div class="top-bar bg-primary text-white py-1">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <div class="d-flex align-items-center">
                        <i class="bi bi-envelope-fill me-2"></i>
                        <span class="small">dhbk@dut.udn.vn</span>
                        <span class="mx-3">|</span>

                        <i class="bi bi-telephone-fill me-2"></i>
                        <span class="small fw-bold">0236.3736.666</span>
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

    <nav class="navbar navbar-expand-lg navbar-dark bg-primary sticky-top shadow py-1">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center me-0" href="${pageContext.request.contextPath}/">
                <img src="${pageContext.request.contextPath}/assets/img/logo-dut.jpg"
                     alt="Logo DUT"
                     height="45"
                     class="me-2"
                     onerror="this.style.display='none'">
                <div class="logo-text lh-1">
                    <div class="small univ-name" style="font-size: 0.7rem;">ĐẠI HỌC ĐÀ NẴNG</div>
                    <div class="fw-bold school-name text-uppercase" style="font-size: 0.95rem;">Trường ĐH Bách Khoa</div>
                </div>
            </a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar"
                    aria-controls="mainNavbar" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="mainNavbar">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0 align-items-lg-center">
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/">Trang chủ</a></li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="introDrop" role="button" data-bs-toggle="dropdown">Giới thiệu</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Tầm nhìn & Sứ mệnh</a></li>
                            <li><a class="dropdown-item" href="#">Lịch sử phát triển</a></li>
                        </ul>
                    </li>

                    <li class="nav-item"><a class="nav-link" href="#">Tin tức</a></li>
                    <li class="nav-item"><a class="nav-link" href="#admission">Tuyển sinh</a></li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="trainDrop" role="button" data-bs-toggle="dropdown">Đào tạo</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Đại học</a></li>
                            <li><a class="dropdown-item" href="#">Sau đại học</a></li>
                        </ul>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="facultyDrop" role="button" data-bs-toggle="dropdown">Khoa - Viện</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">CNTT</a></li>
                            <li><a class="dropdown-item" href="#">Cơ khí</a></li>
                            <li><a class="dropdown-item" href="#">Điện</a></li>
                            <li><a class="dropdown-item" href="#">Xây dựng</a></li>
                        </ul>
                    </li>

                    <li class="nav-item"><a class="nav-link" href="#">Sinh viên</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Liên hệ</a></li>

                    <li class="nav-item ms-lg-3 d-flex align-items-center">

                        <form class="d-flex search-form-custom" role="search">
                            <div class="input-group input-group-sm search-group">
                                <input class="form-control form-control-sm search-input" type="search" placeholder="Tìm kiếm..." aria-label="Search">
                                <button class="btn btn-outline-secondary search-btn" type="submit">
                                    <i class="bi bi-search"></i>
                                </button>
                            </div>
                        </form>

                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<style>
    /* Global Reset */
    html, body { background: #ffffff !important; }
    .site-header { position: relative; font-family: system-ui, -apple-system, sans-serif; }

    /* Top Bar */
    .site-header .top-bar { background-color: #0B3D91 !important; color: #fff !important; font-size: 0.85rem; }
    .site-header .top-bar a { color: #fff !important; text-decoration: none; }
    .site-header .top-bar .social-links a:hover { color: #FDC32D !important; }

    /* Highlight Hotline in Top Bar */
    .site-header .top-bar .fw-bold {
        color: #FDC32D !important; /* Màu vàng nổi bật cho Hotline */
    }

    /* Navbar Config */
    .site-header .bg-primary { background-color: #ffffff !important; color: #000 !important; }

    /* Force top small bar to dark blue even if .bg-primary is used elsewhere */
    .site-header .top-bar.bg-primary {
        background-color: #072B6D !important; /* darker blue */
        color: #ffffff !important;
    }

    /* Logo Colors */
    .site-header .logo-text .univ-name { color: #7FC8FF !important; }
    .site-header .logo-text .school-name { color: #0B3D91 !important; }

    /* Menu Items */
    .site-header .nav-link {
        color: #333 !important;
        font-weight: 600;
        font-size: 13.5px !important; /* Font vừa phải */
        padding: 0.5rem 0.6rem !important;
        text-transform: uppercase;
        white-space: nowrap;
    }
    .site-header .nav-link:hover, .site-header .nav-link.active { color: #0B3D91 !important; }

    /* Dropdown */
    .site-header .dropdown-menu { border: none; box-shadow: 0 5px 15px rgba(0,0,0,0.1); padding: 0.5rem 0; }
    .site-header .dropdown-item { font-size: 13.5px; padding: 0.4rem 1rem; }
    .site-header .dropdown-item:hover { background-color: #f8f9fa; color: #0B3D91; }

    /* --- SEARCH BAR STYLES --- */

    .site-header .search-form-custom {
        width: 220px; /* Độ rộng vừa đủ */
        margin-left: 10px; /* Khoảng cách sau menu */
    }
    .site-header .search-input {
        border-radius: 20px 0 0 20px !important;
        border: 1px solid #ddd;
        border-right: none;
        font-size: 12px;
        padding-left: 12px;
        height: 28px;
    }
    .site-header .search-btn {
        border-radius: 0 20px 20px 0 !important;
        border: 1px solid #ddd;
        border-left: none;
        height: 28px;
        padding: 0 10px;
        display: flex; align-items: center;
    }
    .site-header .search-input:focus {
        border-color: #FDC32D; box-shadow: none;
    }
    .site-header .search-btn:hover { background: #FDC32D; border-color: #FDC32D; color: #fff; }

    /* Container của search bar */
    .site-header .navbar .navbar-nav > li.nav-item.ms-lg-3 {
        flex: 0 1 auto !important;
        width: auto !important;
        min-width: unset;
        display: block !important;
    }

    /* Responsive Logic */
    @media (max-width: 1199px) {
        .site-header .nav-link { padding: 0.5rem 0.3rem !important; font-size: 12px !important; }
        .site-header .search-form-custom { width: 180px; }
    }

    @media (max-width: 991px) {
        /* Mobile View Reset */
        .site-header .nav-item.ms-lg-3 {
            margin-top: 10px;
            margin-left: 0 !important;
        }
        .site-header .search-form-custom { width: 100%; }
    }

    /* 💥 QUY TẮC ĐỂ XÓA CÁC THANH MÀU/DECORATOR KHÔNG MONG MUỐN 💥 */
    .site-header::before,
    .site-header::after,
    .header-decorator,
    .top-decorator,
    .bottom-decorator {
        content: none !important;
        display: none !important;
        background: none !important;
        height: 0 !important;
    }

    /* === Remove any thin colored strip at the very top === */
    html, body {
        background: #ffffff !important;
        margin: 0 !important;
        padding: 0 !important;
    }

    /* Hide common decorator classes and pseudo-elements that may create a stripe */
    html::before, html::after,
    body::before, body::after,
    .site-header::before, .site-header::after,
    .top-bar::before, .top-bar::after,
    .header-strip, .top-strip, .page-top-strip, .stripe-top,
    .header-decorator, .top-decorator, .purple-strip {
        content: none !important;
        display: none !important;
        background: none !important;
        height: 0 !important;
        margin: 0 !important;
        padding: 0 !important;
    }

    /* Remove top borders/shadows that look like stripes */
    body, .site-header, .top-bar, .navbar {
        border-top: none !important;
        box-shadow: none !important;
    }

    /* If there is a tiny element stuck at top, make it invisible */
    body > div:first-child, body > header:first-child {
        background: transparent !important;
    }

    /* If a thin decorative stripe remains at the very top, cover it with a white overlay
       This is safe (pointer-events:none) and non-destructive — it just hides the visual strip. */
    .site-header::before {
        content: "" !important;
        position: fixed !important;
        top: 0 !important;
        left: 0 !important;
        right: 0 !important;
        height: 8px !important; /* adjust if stripe is taller */
        background: #ffffff !important;
        z-index: 2147483647 !important; /* on top of everything */
        pointer-events: none !important;
        box-shadow: none !important;
    }
</style>