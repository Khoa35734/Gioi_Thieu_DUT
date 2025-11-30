<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Admin Khoa - Super Admin Dashboard</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    
    <style>
        :root {
            --primary-color: #005FB7;
            --primary-dark: #004a94;
            --sidebar-width: 260px;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
        }
        
        /* Sidebar */
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100vh;
            width: var(--sidebar-width);
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-dark) 100%);
            color: white;
            padding: 0;
            z-index: 1000;
            box-shadow: 2px 0 10px rgba(0,0,0,0.1);
        }
        
        .sidebar .logo {
            padding: 1.5rem 1rem;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            text-align: center;
        }
        
        .sidebar .logo h4 {
            margin: 0;
            font-weight: 600;
            font-size: 1.2rem;
        }
        
        .sidebar .nav-item {
            margin: 0.25rem 0.75rem;
        }
        
        .sidebar .nav-link {
            color: rgba(255,255,255,0.8);
            padding: 0.75rem 1rem;
            border-radius: 8px;
            transition: all 0.3s;
            display: flex;
            align-items: center;
        }
        
        .sidebar .nav-link:hover {
            background-color: rgba(255,255,255,0.1);
            color: white;
        }
        
        .sidebar .nav-link.active {
            background-color: rgba(255,255,255,0.2);
            color: white;
            font-weight: 500;
        }
        
        .sidebar .nav-link i {
            margin-right: 0.75rem;
            font-size: 1.1rem;
        }
        
        /* Main content */
        .main-content {
            margin-left: var(--sidebar-width);
            padding: 0;
        }
        
        /* Top navbar */
        .top-navbar {
            background: white;
            padding: 1rem 2rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.08);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .user-info {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }
        
        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
        }
        
        /* Content area */
        .content-area {
            padding: 2rem;
        }
        
        .page-header {
            margin-bottom: 2rem;
        }
        
        .page-header h2 {
            color: #212529;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }
        
        .breadcrumb {
            background: none;
            padding: 0;
            margin: 0;
        }
        
        /* Card */
        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }
        
        .card-header {
            background: white;
            border-bottom: 1px solid #e9ecef;
            padding: 1.25rem 1.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .card-header h5 {
            margin: 0;
            font-weight: 600;
            color: #212529;
        }
        
        /* Table */
        .table thead th {
            background-color: #f8f9fa;
            border-bottom: 2px solid #dee2e6;
            color: #495057;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.75rem;
            padding: 1rem;
        }
        
        .table tbody tr:hover {
            background-color: #f8f9fa;
        }
        
        .table tbody td {
            padding: 1rem;
            vertical-align: middle;
        }
        
        /* Empty state */
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
        }
        
        .empty-state i {
            font-size: 4rem;
            color: #dee2e6;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="logo">
            <i class="bi bi-shield-check" style="font-size: 2rem;"></i>
            <h4>Super Admin</h4>
        </div>
        <ul class="nav flex-column mt-3">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard">
                    <i class="bi bi-speedometer2"></i> Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="${pageContext.request.contextPath}/admin/faculty-admins">
                    <i class="bi bi-people-fill"></i> Admin Khoa
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/news">
                    <i class="bi bi-newspaper"></i> Bài viết
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/faculty-list">
                    <i class="bi bi-building"></i> Khoa
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/major-list">
                    <i class="bi bi-book"></i> Ngành học
                </a>
            </li>
            <li class="nav-item mt-4">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/logout">
                    <i class="bi bi-box-arrow-right"></i> Đăng xuất
                </a>
            </li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Top Navbar -->
        <div class="top-navbar">
            <div>
                <h5 class="mb-0">Quản lý Admin Khoa</h5>
            </div>
            <div class="user-info">
                <div class="user-avatar">
                    <c:choose>
                        <c:when test="${not empty sessionScope.admin.fullName}">
                            ${sessionScope.admin.fullName.substring(0,1).toUpperCase()}
                        </c:when>
                        <c:otherwise>A</c:otherwise>
                    </c:choose>
                </div>
                <div>
                    <strong>${sessionScope.admin.fullName}</strong>
                    <div style="font-size: 0.875rem; color: #6c757d;">Super Admin</div>
                </div>
            </div>
        </div>

        <!-- Content Area -->
        <div class="content-area">
            <!-- Page Header -->
            <div class="page-header">
                <h2>Quản lý Admin Khoa</h2>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a></li>
                        <li class="breadcrumb-item active">Admin Khoa</li>
                    </ol>
                </nav>
            </div>

            <!-- Success/Error Messages -->
            <c:if test="${not empty sessionScope.successMessage}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="bi bi-check-circle me-2"></i>
                    ${sessionScope.successMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
                <c:remove var="successMessage" scope="session"/>
            </c:if>

            <c:if test="${not empty sessionScope.errorMessage}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="bi bi-exclamation-circle me-2"></i>
                    ${sessionScope.errorMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
                <c:remove var="errorMessage" scope="session"/>
            </c:if>

            <!-- Faculty Admins Card -->
            <div class="card">
                <div class="card-header">
                    <h5><i class="bi bi-people-fill me-2"></i>Danh sách Admin Khoa</h5>
                    <a href="${pageContext.request.contextPath}/admin/faculty-admins?action=new" class="btn btn-primary">
                        <i class="bi bi-plus-circle me-1"></i> Thêm Admin Khoa
                    </a>
                </div>
                <div class="card-body p-0">
                    <c:choose>
                        <c:when test="${empty facultyAdmins}">
                            <div class="empty-state">
                                <i class="bi bi-inbox"></i>
                                <h5>Chưa có Admin Khoa nào</h5>
                                <p>Hãy tạo Admin Khoa đầu tiên cho hệ thống</p>
                                <a href="${pageContext.request.contextPath}/admin/faculty-admins?action=new" class="btn btn-primary mt-3">
                                    <i class="bi bi-plus-circle me-1"></i> Tạo Admin Khoa
                                </a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="table-responsive">
                                <table class="table table-hover mb-0">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Username</th>
                                            <th>Họ tên</th>
                                            <th>Email</th>
                                            <th>Khoa</th>
                                            <th>Ngày tạo</th>
                                            <th class="text-end">Thao tác</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="admin" items="${facultyAdmins}">
                                            <tr>
                                                <td><strong>#${admin.id}</strong></td>
                                                <td>
                                                    <i class="bi bi-person-circle me-1"></i>
                                                    ${admin.username}
                                                </td>
                                                <td>${admin.fullName}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${not empty admin.email}">
                                                            <i class="bi bi-envelope me-1"></i>${admin.email}
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="text-muted">Chưa có</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <span class="badge bg-primary">
                                                        <i class="bi bi-building me-1"></i>
                                                        ${admin.facultyName}
                                                    </span>
                                                </td>
                                                <td>
                                                    <fmt:formatDate value="${admin.createdAt}" pattern="dd/MM/yyyy HH:mm"/>
                                                </td>
                                                <td class="text-end">
                                                    <a href="${pageContext.request.contextPath}/admin/faculty-admins?action=edit&id=${admin.id}" 
                                                       class="btn btn-sm btn-warning" title="Sửa">
                                                        <i class="bi bi-pencil"></i>
                                                    </a>
                                                    <button onclick="deleteAdmin(${admin.id})" 
                                                            class="btn btn-sm btn-danger" title="Xóa">
                                                        <i class="bi bi-trash"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        function deleteAdmin(id) {
            if (confirm('Bạn có chắc chắn muốn xóa Admin này?\n\nHành động này không thể hoàn tác!')) {
                window.location.href = '${pageContext.request.contextPath}/admin/faculty-admins?action=delete&id=' + id;
            }
        }
    </script>
</body>
</html>
