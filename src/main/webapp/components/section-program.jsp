<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<style>
    .faculty-showcase {
        background-color: #f8f9fa;
        padding: 60px 0;
    }
    .faculty-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 30px;
        align-items: center;
        min-height: 500px;
    }
    .faculty-logo-list {
        display: grid;
        /* Fixed 3-column grid as requested */
        grid-template-columns: repeat(3, 1fr);
        gap: 15px;
    }
    .faculty-logo-item {
        background: #ffffff;
        border: 1px solid #dee2e6;
        border-radius: 8px;
        padding: 15px;
        cursor: pointer;
        transition: all 0.3s ease;
        aspect-ratio: 1 / 1;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .faculty-logo-item:hover, .faculty-logo-item.active {
        transform: scale(1.05);
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        border-color: #005FB7;
    }
    .faculty-logo-item img {
        max-width: 100%;
        max-height: 100%;
        object-fit: contain;
    }
    .faculty-display {
        background: #ffffff;
        border-radius: 12px;
        padding: 30px;
        text-align: center;
        height: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
    }
    .faculty-display-logo {
        width: 200px;
        height: 200px;
        margin-bottom: 20px;
    }
    .faculty-display-logo img {
        width: 100%;
        height: 100%;
        object-fit: contain;
    }
    .faculty-display-name {
        font-size: 1.75rem;
        font-weight: 700;
        color: #005FB7;
        margin-bottom: 10px;
    }
    .faculty-display-link {
        font-weight: 500;
    }

    @media (max-width: 991px) {
        .faculty-grid {
            grid-template-columns: 1fr;
        }
        .faculty-logo-list {
            grid-template-columns: repeat(3, 1fr);
        }
    }
</style>

<section class="faculty-showcase">
    <div class="container">
        <div class="section-title text-center mb-5">
            <h2 class="fw-bold">Các Khoa - Viện Đào Tạo</h2>
            <p class="text-muted">Nơi quy tụ những tài năng và chuyên gia hàng đầu trong mọi lĩnh vực</p>
        </div>

        <div class="faculty-grid">
            <!-- Left Column: Logo List -->
            <div class="faculty-logo-list">
                <c:forEach var="faculty" items="${faculties}" varStatus="loop">
                    <%-- Logic to determine the correct image path --%>
                    <c:set var="rawLogo" value="${faculty.logoUrl}" />
                    <c:choose>
                        <c:when test="${empty rawLogo}">
                            <c:set var="displayLogo" value="assets/img/logo-placeholder.png" />
                        </c:when>
                        <c:when test="${fn:startsWith(rawLogo, 'assets/')}">
                            <c:set var="displayLogo" value="${rawLogo}" />
                        </c:when>
                        <c:otherwise>
                            <%-- Assume it's just a filename in assets/img/ --%>
                            <c:set var="displayLogo" value="assets/img/${rawLogo}" />
                        </c:otherwise>
                    </c:choose>

                    <div class="faculty-logo-item"
                         data-logo="${pageContext.request.contextPath}/${displayLogo}"
                         data-name="${faculty.name}"
                         data-link="${pageContext.request.contextPath}/faculty?id=${faculty.id}">
                        <img src="${pageContext.request.contextPath}/${displayLogo}" alt="Logo ${faculty.name}">
                    </div>
                </c:forEach>
            </div>

            <!-- Right Column: Display Area -->
            <div class="faculty-display">
                <div class="faculty-display-logo">
                    <img id="main-faculty-logo" src="${pageContext.request.contextPath}/assets/img/logo-placeholder.png" alt="Faculty Logo">
                </div>
                <h3 id="main-faculty-name" class="faculty-display-name">Chọn một khoa</h3>
                <a id="main-faculty-link" href="#" class="btn btn-primary faculty-display-link">Xem chi tiết <i class="bi bi-arrow-right-short"></i></a>
            </div>
        </div>
    </div>
</section>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const logoItems = document.querySelectorAll('.faculty-logo-item');
        const mainLogo = document.getElementById('main-faculty-logo');
        const mainName = document.getElementById('main-faculty-name');
        const mainLink = document.getElementById('main-faculty-link');

        if (logoItems.length > 0) {
            // Function to update the display
            function updateDisplay(item) {
                // Update active state
                logoItems.forEach(i => i.classList.remove('active'));
                item.classList.add('active');

                // Update display content
                mainLogo.src = item.dataset.logo;
                mainName.textContent = item.dataset.name;
                mainLink.href = item.dataset.link;
            }

            // Set initial display to the first faculty
            updateDisplay(logoItems[0]);

            // Add mouseover event listener to each logo item
            logoItems.forEach(item => {
                item.addEventListener('mouseover', function () {
                    updateDisplay(this);
                });
            });
        }
    });
</script>
