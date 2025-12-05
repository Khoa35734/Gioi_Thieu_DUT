<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    <!-- SEO Meta Tags -->
    <title>Trường Đại học Bách Khoa - Đại học Đà Nẵng | Đào tạo kỹ sư chất lượng cao</title>
    <meta name="description" content="Trường Đại học Bách Khoa - Đại học Đà Nẵng là cơ sở đào tạo kỹ thuật công nghệ hàng đầu miền Trung. Chương trình đào tạo đạt chuẩn quốc tế ABET, AUN-QA. Tuyển sinh 2025.">
    <meta name="keywords" content="Đại học Bách Khoa Đà Nẵng, DUT, tuyển sinh đại học, đào tạo kỹ sư, CNTT, cơ khí, điện tử, xây dựng">
    <meta name="author" content="Trường Đại học Bách Khoa - ĐHĐN">
    <meta name="robots" content="index, follow">
    
    <!-- Open Graph Meta Tags -->
    <meta property="og:title" content="Trường Đại học Bách Khoa - Đại học Đà Nẵng">
    <meta property="og:description" content="Đào tạo kỹ sư chất lượng cao theo chuẩn quốc tế. Tuyển sinh 2025.">
    <meta property="og:image" content="${pageContext.request.contextPath}/assets/img/og-image.jpg">
    <meta property="og:url" content="https://dut.udn.vn">
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Đại học Bách Khoa - ĐHĐN">
    
    <!-- Twitter Card Meta Tags -->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="Trường Đại học Bách Khoa - Đại học Đà Nẵng">
    <meta name="twitter:description" content="Đào tạo kỹ sư chất lượng cao theo chuẩn quốc tế">
    <meta name="twitter:image" content="${pageContext.request.contextPath}/assets/img/og-image.jpg">
    
    <!-- Canonical URL -->
    <link rel="canonical" href="https://dut.udn.vn">
    
    <!-- Favicon -->
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/favicon.png">
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    
    <!-- Splide.js CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@4.1.4/dist/css/splide.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    
    <!-- JSON-LD Structured Data -->
    <script type="application/ld+json">
    {
        "@context": "https://schema.org",
        "@type": "CollegeOrUniversity",
        "name": "Trường Đại học Bách Khoa - Đại học Đà Nẵng",
        "alternateName": "DUT",
        "url": "https://dut.udn.vn",
        "logo": "${pageContext.request.contextPath}/assets/img/logo-dut.png",
        "image": "${pageContext.request.contextPath}/assets/img/campus.jpg",
        "description": "Trường Đại học Bách Khoa - Đại học Đà Nẵng là cơ sở đào tạo kỹ thuật công nghệ hàng đầu miền Trung",
        "address": {
            "@type": "PostalAddress",
            "streetAddress": "54 Nguyễn Lương Bằng, Quận Liên Chiểu",
            "addressLocality": "Đà Nẵng",
            "addressCountry": "VN"
        },
        "telephone": "+84-236-3736666",
        "email": "dhbk@dut.udn.vn",
        "sameAs": [
            "https://www.facebook.com/dhbkdn",
            "https://www.youtube.com/dhbkdn"
        ]
    }
    </script>
</head>
<body>
    <!-- Header -->
    <jsp:include page="components/header.jsp" />
    
    <!-- Slider Section -->
    <jsp:include page="components/slider.jsp" />
    
    <!-- Main Content -->
    <main>
        <!-- Banner Section (can be removed or repurposed) -->
        <%-- <jsp:include page="components/banner.jsp" /> --%>
        
        <!-- About Section -->
        <jsp:include page="components/section-about.jsp" />
        
        <!-- Programs Section -->
        <jsp:include page="components/section-program.jsp" />
        
        <!-- News Section -->
        <jsp:include page="components/section-news.jsp" />
        
        <!-- Facility Section -->
        <jsp:include page="components/section-facility.jsp" />
        
        <!-- Admission Section -->
        <jsp:include page="components/section-admission.jsp" />
        
        <!-- Consultation Form Section -->
        <jsp:include page="components/section-consult.jsp" />
    </main>
    
    <!-- Footer -->
    <jsp:include page="components/footer.jsp" />
    
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Splide.js JS -->
    <script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@4.1.4/dist/js/splide.min.js"></script>
    
    <!-- Custom JavaScript -->
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    
    <script>
        // Initialize the Splide slider
        document.addEventListener('DOMContentLoaded', function () {
            if (document.getElementById('image-slider')) {
                new Splide('#image-slider', {
                    type       : 'loop',
                    height     : '60vh',
                    perPage    : 1,
                    autoplay   : true,
                    interval   : 5000,
                    pauseOnHover: true,
                    arrows     : true,
                    pagination : true,
                    cover      : true,
                }).mount();
            }
        });
    </script>
</body>
</html>
