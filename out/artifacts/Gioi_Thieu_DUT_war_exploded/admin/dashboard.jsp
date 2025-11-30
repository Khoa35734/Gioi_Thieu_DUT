<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Super Admin Dashboard - DUT</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    
    <style>
        :root {
            --primary-color: #005FB7;
            --primary-dark: #004a94;
            --sidebar-width: 260px;
        }
        
        * { margin: 0; padding: 0; box-sizing: border-box; }
        
        body {
            background: #f5f7fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            bottom: 0;
            width: var(--sidebar-width);
            background: linear-gradient(180deg, var(--primary-color), var(--primary-dark));
            color: white;
            overflow-y: auto;
            z-index: 1000;
            box-shadow: 2px 0 10px rgba(0,0,0,0.1);
        }
        
        .sidebar-header {
            padding: 25px 20px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }
        
        .sidebar-header h4 {
            margin: 0;
            font-size: 1.3rem;
            font-weight: 700;
        }
        
        .sidebar-menu {
            padding: 20px 0;
        }
        
        .menu-item {
            padding: 12px 25px;
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
            transition: all 0.3s;
            border-left: 3px solid transparent;
        }
        
        .menu-item:hover, .menu-item.active {
            background: rgba(255,255,255,0.1);
            border-left-color: white;
            color: white;
        }
        
        .menu-item i {
            width: 25px;
            margin-right: 10px;
            font-size: 1.1rem;
        }
        
        .main-content {
            margin-left: var(--sidebar-width);
            min-height: 100vh;
        }
        
        .top-navbar {
            background: white;
            padding: 15px 30px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.08);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .top-navbar h2 {
            margin: 0;
            font-size: 1.5rem;
            color: #333;
        }
        
        .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--primary-color);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
        }
        
        .content-area {
            padding: 30px;
        }
        
        .stat-card {
            background: white;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            transition: transform 0.3s, box-shadow 0.3s;
            margin-bottom: 20px;
            border: none;
            height: 100%;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 20px rgba(0,0,0,0.12);
        }
        
        .stat-card .icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
            margin-bottom: 15px;
        }
        
        .stat-card h3 {
            font-size: 2.2rem;
            font-weight: 700;
            margin: 10px 0 5px;
            color: #333;
        }
        
        .stat-card p {
            color: #6c757d;
            margin: 0;
            font-size: 0.95rem;
        }
        
        .icon-blue { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; }
        .icon-green { background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); color: white; }
        .icon-orange { background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); color: white; }
        .icon-purple { background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%); color: white; }
        
        .data-table {
            background: white;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            margin-bottom: 25px;
        }
        
        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .table-header h5 {
            margin: 0;
            font-weight: 700;
            color: var(--primary-color);
            font-size: 1.2rem;
        }
        
        .table {
            margin: 0;
        }
        
        .table th {
            border-top: none;
            border-bottom: 2px solid #dee2e6;
            font-weight: 600;
            color: #495057;
            background: #f8f9fa;
        }
        
        .table tbody tr:hover {
            background: #f8f9fa;
        }
        
        .btn-action {
            padding: 6px 14px;
            font-size: 0.875rem;
            border-radius: 6px;
            margin: 0 2px;
            transition: all 0.3s;
        }
        
        .btn-action:hover {
            transform: translateY(-2px);
        }
        
        .badge-role {
            padding: 6px 12px;
            border-radius: 6px;
            font-weight: 500;
            font-size: 0.85rem;
        }
        
        .quick-actions {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h4><i class="bi bi-shield-fill-check me-2"></i>SUPER ADMIN</h4>
            <small>Đại học Bách Khoa - Đà Nẵng</small>
        </div>
        
        <div class="sidebar-menu">
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="menu-item active">
                <i class="bi bi-speedometer2"></i>
                <span>Dashboard</span>
            </a>
            <a href="${pageContext.request.contextPath}/admin/faculty-admins" class="menu-item">
                <i class="bi bi-people-fill"></i>
                <span>Quản lý Admin Khoa</span>
            </a>
            <a href="${pageContext.request.contextPath}/admin/news" class="menu-item">
                <i class="bi bi-newspaper"></i>
                <span>Quản lý Bài viết</span>
            </a>
            <a href="${pageContext.request.contextPath}/admin/faculties" class="menu-item">
                <i class="bi bi-building"></i>
                <span>Quản lý Khoa</span>
            </a>
            <a href="${pageContext.request.contextPath}/admin/majors" class="menu-item">
                <i class="bi bi-book"></i>
                <span>Quản lý Ngành học</span>
            </a>
            <a href="${pageContext.request.contextPath}/admin/logout" class="menu-item">
                <i class="bi bi-box-arrow-right"></i>
                <span>Đăng xuất</span>
            </a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Top Navbar -->
        <div class="top-navbar">
            <h2><i class="bi bi-speedometer2 me-2"></i>Dashboard Tổng Quan</h2>
            <div class="user-info">
                <div>
                    <strong>${sessionScope.admin.fullName}</strong><br>
                    <small class="text-muted">Super Administrator</small>
                </div>
                <div class="user-avatar">
                    ${sessionScope.admin.fullName.substring(0,1).toUpperCase()}
                </div>
            </div>
        </div>

        <!-- Content Area -->
        <div class="content-area">
            <!-- Statistics Cards -->
            <div class="row">
                <div class="col-md-3">
                    <div class="stat-card">
                        <div class="icon icon-blue">
                            <i class="bi bi-people-fill"></i>
                        </div>
                        <h3>${totalFacultyAdmins}</h3>
                        <p>Admin Khoa</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stat-card">
                        <div class="icon icon-green">
                            <i class="bi bi-newspaper"></i>
                        </div>
                        <h3>${totalNews}</h3>
                        <p>Bài viết</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stat-card">
                        <div class="icon icon-orange">
                            <i class="bi bi-building"></i>
                        </div>
                        <h3>${totalFaculties}</h3>
                        <p>Khoa</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stat-card">
                        <div class="icon icon-purple">
                            <i class="bi bi-book"></i>
                        </div>
                        <h3>${totalMajors}</h3>
                        <p>Ngành học</p>
                    </div>
                </div>
            </div>

            <!-- Faculty Admins Table -->
            <div class="data-table">
                <div class="table-header">
                    <h5><i class="bi bi-people-fill me-2"></i>Danh sách Admin Khoa</h5>
                    <a href="${pageContext.request.contextPath}/admin/faculty-admins?action=new" class="btn btn-primary">
                        <i class="bi bi-plus-circle me-2"></i>Thêm Admin Khoa
                    </a>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên đăng nhập</th>
                                <th>Họ tên</th>
                                <th>Email</th>
                                <th>Khoa</th>
                                <th>Ngày tạo</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="admin" items="${facultyAdmins}" varStatus="status">
                                <tr>
                                    <td>${admin.id}</td>
                                    <td><strong>${admin.username}</strong></td>
                                    <td>${admin.fullName}</td>
                                    <td>${admin.email}</td>
                                    <td><span class="badge bg-info">${admin.facultyName}</span></td>
                                    <td><fmt:formatDate value="${admin.createdAt}" pattern="dd/MM/yyyy"/></td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/faculty-admins?action=edit&id=${admin.id}" 
                                           class="btn btn-sm btn-warning btn-action">
                                            <i class="bi bi-pencil-square"></i>
                                        </a>
                                        <button onclick="deleteAdmin(${admin.id}, '${admin.username}')" 
                                                class="btn btn-sm btn-danger btn-action">
                                            <i class="bi bi-trash"></i>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Recent News Table -->
            <div class="data-table">
                <div class="table-header">
                    <h5><i class="bi bi-newspaper me-2"></i>Bài viết gần đây</h5>
                    <div class="quick-actions">
                        <a href="${pageContext.request.contextPath}/admin/news?action=new" class="btn btn-success">
                            <i class="bi bi-plus-circle me-2"></i>Thêm bài viết
                        </a>
                        <a href="${pageContext.request.contextPath}/admin/news" class="btn btn-outline-primary">
                            <i class="bi bi-eye me-2"></i>Xem tất cả
                        </a>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tiêu đề</th>
                                <th>Khoa</th>
                                <th>Tác giả</th>
                                <th>Ngày đăng</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="news" items="${recentNews}">
                                <tr>
                                    <td>${news.id}</td>
                                    <td><strong>${news.title}</strong></td>
                                    <td>
                                        <c:if test="${not empty news.facultyName}">
                                            <span class="badge bg-info">${news.facultyName}</span>
                                        </c:if>
                                        <c:if test="${empty news.facultyName}">
                                            <span class="badge bg-primary">Chung</span>
                                        </c:if>
                                    </td>
                                    <td>${news.authorName}</td>
                                    <td><fmt:formatDate value="${news.createdDate}" pattern="dd/MM/yyyy"/></td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/news?action=edit&id=${news.id}" 
                                           class="btn btn-sm btn-warning btn-action">
                                            <i class="bi bi-pencil-square"></i>
                                        </a>
                                        <button onclick="deleteNews(${news.id}, '${news.title}')" 
                                                class="btn btn-sm btn-danger btn-action">
                                            <i class="bi bi-trash"></i>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function deleteAdmin(id, username) {
            if (confirm('Bạn có chắc muốn xóa admin "' + username + '"?')) {
                window.location.href = '${pageContext.request.contextPath}/admin/faculty-admins?action=delete&id=' + id;
            }
        }
        
        function deleteNews(id, title) {
            if (confirm('Bạn có chắc muốn xóa bài viết "' + title + '"?')) {
                window.location.href = '${pageContext.request.contextPath}/admin/news?action=delete&id=' + id;
            }
        }
    </script>
</body>
</html>
