<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Admin Sidebar -->
<aside class="admin-sidebar" id="adminSidebar">
    <nav class="sidebar-nav">
        <!-- Dashboard -->
        <div class="sidebar-section">
            <a href="${pageContext.request.contextPath}/admin/dashboard" 
               class="sidebar-link ${pageContext.request.requestURI.contains('dashboard') ? 'active' : ''}">
                <i class="bi bi-speedometer2"></i>
                <span>Dashboard</span>
            </a>
        </div>

        <!-- Posts Management -->
        <div class="sidebar-section">
            <div class="sidebar-section-title">Quản lý nội dung</div>
            
            <a href="${pageContext.request.contextPath}/admin/posts" 
               class="sidebar-link ${pageContext.request.requestURI.contains('posts') && !pageContext.request.requestURI.contains('create') ? 'active' : ''}">
                <i class="bi bi-newspaper"></i>
                <span>Bài viết</span>
            </a>
            
            <a href="${pageContext.request.contextPath}/admin/posts/create" 
               class="sidebar-link ${pageContext.request.requestURI.contains('posts/create') ? 'active' : ''}">
                <i class="bi bi-plus-circle"></i>
                <span>Tạo bài viết mới</span>
            </a>
            
            <a href="${pageContext.request.contextPath}/admin/posts?status=draft" 
               class="sidebar-link">
                <i class="bi bi-file-earmark-text"></i>
                <span>Bài viết nháp</span>
                <c:if test="${draftCount > 0}">
                    <span class="badge bg-warning ms-auto">${draftCount}</span>
                </c:if>
            </a>
        </div>

        <!-- Super Admin Only Sections -->
        <c:if test="${sessionScope.admin.role == 'super_admin'}">
            <!-- Faculty Management -->
            <div class="sidebar-section">
                <div class="sidebar-section-title">Quản lý khoa</div>
                
                <a href="${pageContext.request.contextPath}/admin/faculties" 
                   class="sidebar-link ${pageContext.request.requestURI.contains('faculties') ? 'active' : ''}">
                    <i class="bi bi-building"></i>
                    <span>Danh sách khoa</span>
                </a>
                
                <a href="${pageContext.request.contextPath}/admin/faculties/create" 
                   class="sidebar-link ${pageContext.request.requestURI.contains('faculties/create') ? 'active' : ''}">
                    <i class="bi bi-plus-square"></i>
                    <span>Thêm khoa mới</span>
                </a>
            </div>

            <!-- Faculty Admin Management -->
            <div class="sidebar-section">
                <div class="sidebar-section-title">Quản lý admin khoa</div>
                
                <a href="${pageContext.request.contextPath}/admin/faculty-admins" 
                   class="sidebar-link ${pageContext.request.requestURI.contains('faculty-admins') && !pageContext.request.requestURI.contains('create') ? 'active' : ''}">
                    <i class="bi bi-people"></i>
                    <span>Danh sách admin</span>
                </a>
                
                <a href="${pageContext.request.contextPath}/admin/faculty-admins/create" 
                   class="sidebar-link ${pageContext.request.requestURI.contains('faculty-admins/create') ? 'active' : ''}">
                    <i class="bi bi-person-plus"></i>
                    <span>Thêm admin khoa</span>
                </a>
            </div>

            <!-- Reports -->
            <div class="sidebar-section">
                <div class="sidebar-section-title">Báo cáo & Thống kê</div>
                
                <a href="${pageContext.request.contextPath}/admin/reports/posts" 
                   class="sidebar-link">
                    <i class="bi bi-graph-up"></i>
                    <span>Báo cáo bài viết</span>
                </a>
                
                <a href="${pageContext.request.contextPath}/admin/reports/activities" 
                   class="sidebar-link">
                    <i class="bi bi-activity"></i>
                    <span>Hoạt động hệ thống</span>
                </a>
            </div>
        </c:if>

        <!-- Faculty Admin Only Sections -->
        <c:if test="${sessionScope.admin.role == 'faculty_admin'}">
            <!-- Major Management -->
            <div class="sidebar-section">
                <div class="sidebar-section-title">Quản lý ngành học</div>
                
                <a href="${pageContext.request.contextPath}/admin/majors" 
                   class="sidebar-link ${pageContext.request.requestURI.contains('majors') ? 'active' : ''}">
                    <i class="bi bi-mortarboard"></i>
                    <span>Danh sách ngành</span>
                </a>
                
                <a href="${pageContext.request.contextPath}/admin/majors/create" 
                   class="sidebar-link ${pageContext.request.requestURI.contains('majors/create') ? 'active' : ''}">
                    <i class="bi bi-plus-circle"></i>
                    <span>Thêm ngành mới</span>
                </a>
            </div>

            <!-- Faculty Info -->
            <div class="sidebar-section">
                <div class="sidebar-section-title">Thông tin khoa</div>
                
                <a href="${pageContext.request.contextPath}/admin/faculty/info" 
                   class="sidebar-link">
                    <i class="bi bi-info-circle"></i>
                    <span>Thông tin khoa</span>
                </a>
            </div>
        </c:if>

        <!-- Settings -->
        <div class="sidebar-section">
            <div class="sidebar-section-title">Hệ thống</div>
            
            <a href="${pageContext.request.contextPath}/admin/profile" 
               class="sidebar-link ${pageContext.request.requestURI.contains('profile') ? 'active' : ''}">
                <i class="bi bi-person-circle"></i>
                <span>Hồ sơ cá nhân</span>
            </a>
            
            <a href="${pageContext.request.contextPath}/admin/settings" 
               class="sidebar-link ${pageContext.request.requestURI.contains('settings') ? 'active' : ''}">
                <i class="bi bi-gear"></i>
                <span>Cài đặt</span>
            </a>
            
            <a href="${pageContext.request.contextPath}/" 
               class="sidebar-link" 
               target="_blank">
                <i class="bi bi-box-arrow-up-right"></i>
                <span>Xem trang chủ</span>
            </a>
            
            <a href="${pageContext.request.contextPath}/admin/logout" 
               class="sidebar-link text-danger">
                <i class="bi bi-box-arrow-right"></i>
                <span>Đăng xuất</span>
            </a>
        </div>
    </nav>

    <!-- Sidebar Footer -->
    <div class="sidebar-footer">
        <div class="sidebar-footer-info">
            <small class="text-muted d-block">DUT Admin Panel</small>
            <small class="text-muted">Version 1.0.0</small>
        </div>
    </div>
</aside>

<style>
.admin-sidebar {
    position: fixed;
    top: 70px;
    left: 0;
    bottom: 0;
    width: 260px;
    background: #ffffff;
    border-right: 1px solid #e0e0e0;
    overflow-y: auto;
    z-index: 1020;
    transition: transform 0.3s ease;
}

.admin-sidebar.collapsed {
    transform: translateX(-100%);
}

.sidebar-nav {
    padding: 1rem 0;
}

.sidebar-section {
    margin-bottom: 1.5rem;
}

.sidebar-section-title {
    padding: 0.5rem 1.5rem;
    font-size: 0.75rem;
    font-weight: 700;
    text-transform: uppercase;
    color: #6c757d;
    letter-spacing: 0.5px;
}

.sidebar-link {
    display: flex;
    align-items: center;
    padding: 0.75rem 1.5rem;
    color: #495057;
    text-decoration: none;
    transition: all 0.2s;
    position: relative;
}

.sidebar-link:hover {
    background: #f8f9fa;
    color: #005FB7;
}

.sidebar-link.active {
    background: linear-gradient(90deg, rgba(0, 95, 183, 0.1) 0%, transparent 100%);
    color: #005FB7;
    font-weight: 600;
    border-left: 3px solid #005FB7;
}

.sidebar-link.text-danger:hover {
    background: rgba(220, 53, 69, 0.1);
    color: #dc3545;
}

.sidebar-link i {
    width: 20px;
    margin-right: 0.75rem;
    font-size: 1.1rem;
}

.sidebar-link .badge {
    margin-left: auto;
    font-size: 0.7rem;
}

.sidebar-footer {
    position: sticky;
    bottom: 0;
    background: #f8f9fa;
    padding: 1rem 1.5rem;
    border-top: 1px solid #e0e0e0;
}

.sidebar-footer-info {
    text-align: center;
}

/* Scrollbar */
.admin-sidebar::-webkit-scrollbar {
    width: 6px;
}

.admin-sidebar::-webkit-scrollbar-track {
    background: #f1f1f1;
}

.admin-sidebar::-webkit-scrollbar-thumb {
    background: #888;
    border-radius: 3px;
}

.admin-sidebar::-webkit-scrollbar-thumb:hover {
    background: #555;
}

/* Responsive */
@media (max-width: 992px) {
    .admin-sidebar {
        transform: translateX(-100%);
    }
    
    .admin-sidebar.show {
        transform: translateX(0);
    }
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const sidebarToggle = document.getElementById('sidebarToggle');
    const adminSidebar = document.getElementById('adminSidebar');
    
    if (sidebarToggle && adminSidebar) {
        sidebarToggle.addEventListener('click', function() {
            if (window.innerWidth <= 992) {
                adminSidebar.classList.toggle('show');
            } else {
                adminSidebar.classList.toggle('collapsed');
                document.querySelector('.admin-content').classList.toggle('expanded');
            }
        });
    }
    
    // Close sidebar on mobile when clicking outside
    document.addEventListener('click', function(e) {
        if (window.innerWidth <= 992) {
            if (!adminSidebar.contains(e.target) && !sidebarToggle.contains(e.target)) {
                adminSidebar.classList.remove('show');
            }
        }
    });
});
</script>
