<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Admin Dashboard - ${sessionScope.admin.facultyName}</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    
    <style>
        :root {
            --primary-color: #FDC32D;
            --primary-dark: #f5a623;
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
            color: #333;
            overflow-y: auto;
            z-index: 1000;
            box-shadow: 2px 0 10px rgba(0,0,0,0.1);
        }
        
        .sidebar-header {
            padding: 25px 20px;
            border-bottom: 1px solid rgba(0,0,0,0.1);
            background: rgba(255,255,255,0.1);
        }
        
        .sidebar-header h4 {
            margin: 0;
            font-size: 1.3rem;
            font-weight: 700;
            color: #333;
        }
        
        .sidebar-header small {
            color: #555;
        }
        
        .sidebar-menu {
            padding: 20px 0;
        }
        
        .menu-item {
            padding: 12px 25px;
            color: #333;
            text-decoration: none;
            display: flex;
            align-items: center;
            transition: all 0.3s;
            border-left: 3px solid transparent;
        }
        
        .menu-item:hover, .menu-item.active {
            background: rgba(255,255,255,0.2);
            border-left-color: #333;
            color: #000;
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
        
        .faculty-badge {
            background: var(--primary-color);
            color: #333;
            padding: 8px 20px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.95rem;
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
            color: #333;
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
        
        .icon-yellow { background: linear-gradient(135deg, #FDC32D, #ffce3d); color: #333; }
        .icon-orange { background: linear-gradient(135deg, #fa709a 0%, #fee140 100%); color: white; }
        .icon-blue { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; }
        .icon-green { background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%); color: #333; }
        
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
            color: var(--primary-dark);
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
            background: #fffbf0;
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
        
        .btn-faculty {
            background: var(--primary-color);
            border-color: var(--primary-color);
            color: #333;
            font-weight: 600;
        }
        
        .btn-faculty:hover {
            background: var(--primary-dark);
            border-color: var(--primary-dark);
            color: #000;
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
            <h4><i class="bi bi-building me-2"></i>FACULTY ADMIN</h4>
            <small>${sessionScope.admin.facultyName}</small>
        </div>
        
        <div class="sidebar-menu">
            <a href="${pageContext.request.contextPath}/admin/faculty/dashboard" class="menu-item active">
                <i class="bi bi-speedometer2"></i>
                <span>Dashboard</span>
            </a>
            <a href="${pageContext.request.contextPath}/admin/faculty/news" class="menu-item">
                <i class="bi bi-newspaper"></i>
                <span>Quản lý Bài viết</span>
            </a>
            <a href="${pageContext.request.contextPath}/admin/faculty/majors" class="menu-item">
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
            <div>
                <h2><i class="bi bi-speedometer2 me-2"></i>Dashboard - ${sessionScope.admin.facultyName}</h2>
            </div>
            <div class="user-info">
                <span class="faculty-badge">
                    <i class="bi bi-building me-2"></i>${sessionScope.admin.facultyName}
                </span>
                <div>
                    <strong>${sessionScope.admin.fullName}</strong><br>
                    <small class="text-muted">Faculty Administrator</small>
                </div>
                <div class="user-avatar">
                    <c:choose>
                        <c:when test="${not empty sessionScope.admin.fullName}">
                            ${sessionScope.admin.fullName.substring(0,1).toUpperCase()}
                        </c:when>
                        <c:otherwise>A</c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <!-- Content Area -->
        <div class="content-area">
            <!-- Statistics Cards -->
            <div class="row">
                <div class="col-md-6 col-lg-3">
                    <div class="stat-card">
                        <div class="icon icon-yellow">
                            <i class="bi bi-newspaper"></i>
                        </div>
                        <h3>${totalNews}</h3>
                        <p>Bài viết của khoa</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="stat-card">
                        <div class="icon icon-orange">
                            <i class="bi bi-book"></i>
                        </div>
                        <h3>${totalMajors}</h3>
                        <p>Ngành học</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="stat-card">
                        <div class="icon icon-blue">
                            <i class="bi bi-plus-circle"></i>
                        </div>
                        <h3>${newNewsThisMonth}</h3>
                        <p>Bài viết tháng này</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="stat-card">
                        <div class="icon icon-green">
                            <i class="bi bi-eye"></i>
                        </div>
                        <h3>${monthlyViews}</h3>
                        <p>Lượt xem tháng này</p>
                    </div>
                </div>
            </div>

            <!-- News Management -->
            <div class="data-table">
                <div class="table-header">
                    <h5><i class="bi bi-newspaper me-2"></i>Bài viết của khoa</h5>
                    <div class="quick-actions">
                        <a href="${pageContext.request.contextPath}/admin/faculty/news/create" class="btn btn-faculty">
                            <i class="bi bi-plus-circle me-2"></i>Thêm bài viết
                        </a>
                        <a href="${pageContext.request.contextPath}/admin/faculty/news" class="btn btn-outline-secondary">
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
                                <th>Tác giả</th>
                                <th>Ngày đăng</th>
                                <th>Lượt xem</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="news" items="${recentNews}">
                                <tr>
                                    <td>${news.id}</td>
                                    <td><strong>${news.title}</strong></td>
                                    <td>${news.authorName}</td>
                                    <td><fmt:formatDate value="${news.createdDate}" pattern="dd/MM/yyyy"/></td>
                                    <td><span class="badge bg-info">${news.views != null ? news.views : 0}</span></td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/faculty/news/edit?id=${news.id}" 
                                           class="btn btn-sm btn-warning btn-action" title="Sửa">
                                            <i class="bi bi-pencil-square"></i>
                                        </a>
                                        <button onclick="deleteNews(${news.id}, '${news.title}')" 
                                                class="btn btn-sm btn-danger btn-action" title="Xóa">
                                            <i class="bi bi-trash"></i>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty recentNews}">
                                <tr>
                                    <td colspan="6" class="text-center text-muted py-4">
                                        <i class="bi bi-inbox fs-1 d-block mb-2"></i>
                                        Chưa có bài viết nào. <a href="${pageContext.request.contextPath}/admin/faculty/news/create">Tạo bài viết đầu tiên</a>
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Majors Management -->
            <div class="data-table">
                <div class="table-header">
                    <h5><i class="bi bi-book me-2"></i>Ngành học của khoa</h5>
                    <div class="quick-actions">
                        <a href="${pageContext.request.contextPath}/admin/faculty/majors/create" class="btn btn-faculty">
                            <i class="bi bi-plus-circle me-2"></i>Thêm ngành học
                        </a>
                        <a href="${pageContext.request.contextPath}/admin/faculty/majors" class="btn btn-outline-secondary">
                            <i class="bi bi-eye me-2"></i>Xem tất cả
                        </a>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Mã ngành</th>
                                <th>Tên ngành</th>
                                <th>Mô tả</th>
                                <th>Người tạo</th>
                                <th>Ngày tạo</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="major" items="${facultyMajors}">
                                <tr>
                                    <td>${major.id}</td>
                                    <td><span class="badge bg-primary">${major.majorCode}</span></td>
                                    <td><strong>${major.name}</strong></td>
                                    <%-- Fixed: Replaced '+' with '.concat()' for string concatenation in EL --%>
                                    <td>${major.description != null ? (major.description.length() > 50 ? major.description.substring(0, 50).concat('...') : major.description) : ''}</td>
                                    <td>${major.creatorName}</td>
                                    <td><fmt:formatDate value="${major.createdAt}" pattern="dd/MM/yyyy"/></td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/faculty/majors/edit?id=${major.id}" 
                                           class="btn btn-sm btn-warning btn-action" title="Sửa">
                                            <i class="bi bi-pencil-square"></i>
                                        </a>
                                        <button onclick="deleteMajor(${major.id}, '${major.name}')" 
                                                class="btn btn-sm btn-danger btn-action" title="Xóa">
                                            <i class="bi bi-trash"></i>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty facultyMajors}">
                                <tr>
                                    <td colspan="7" class="text-center text-muted py-4">
                                        <i class="bi bi-inbox fs-1 d-block mb-2"></i>
                                        Chưa có ngành học nào. <a href="${pageContext.request.contextPath}/admin/faculty/majors/create">Tạo ngành học đầu tiên</a>
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function deleteNews(id, title) {
            if (confirm('Bạn có chắc muốn xóa bài viết "' + title + '"?\nHành động này không thể hoàn tác.')) {
                window.location.href = '${pageContext.request.contextPath}/admin/faculty/news/delete?id=' + id;
            }
        }
        
        function deleteMajor(id, name) {
            if (confirm('Bạn có chắc muốn xóa ngành "' + name + '"?\nHành động này không thể hoàn tác.')) {
                window.location.href = '${pageContext.request.contextPath}/admin/faculty/majors/delete?id=' + id;
            }
        }
    </script>
</body>
</html>
