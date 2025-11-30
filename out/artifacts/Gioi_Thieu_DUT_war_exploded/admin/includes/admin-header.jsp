<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header class="header">
    <div class="header-left">
        <a href="${pageContext.request.contextPath}/admin/dashboard" class="header-logo">
            <img src="${pageContext.request.contextPath}/assets/img/logo-dut.png" alt="DUT Logo">
            <span>DUT Admin</span>
        </a>
    </div>
    <div class="header-right">
        <div class="user-info-dropdown">
            <a href="#" class="user-info-handle" id="userInfoDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                <div class="user-avatar me-2">
                    <!-- Reverted: Removed avatar logic, showing a default icon -->
                    <i class="fas fa-user-circle fa-2x"></i> 
                </div>
                <span class="user-name d-none d-md-inline">${sessionScope.admin.fullName}</span>
            </a>
            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="userInfoDropdown">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/profile">
                    <i class="fas fa-user me-2"></i> Hồ sơ
                </a>
                <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/settings">
                    <i class="fas fa-cog me-2"></i> Cài đặt
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/logout">
                    <i class="fas fa-sign-out-alt me-2"></i> Đăng xuất
                </a>
            </div>
        </div>
    </div>
</header>
