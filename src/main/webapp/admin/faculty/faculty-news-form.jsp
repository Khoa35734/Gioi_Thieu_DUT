<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${empty news ? 'Thêm' : 'Sửa'} Bài viết - ${sessionScope.admin.facultyName}</title>
    
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
        
        .form-card {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }
        
        .form-card h5 {
            margin-bottom: 25px;
            font-weight: 700;
            color: var(--primary-dark);
        }
        
        .form-label {
            font-weight: 600;
            color: #333;
        }
        
        .form-control:focus, .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(253, 195, 45, 0.25);
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
        
        .thumbnail-preview {
            max-width: 300px;
            border-radius: 8px;
            margin-top: 10px;
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
            <a href="${pageContext.request.contextPath}/admin/faculty/dashboard" class="menu-item">
                <i class="bi bi-speedometer2"></i>
                <span>Dashboard</span>
            </a>
            <a href="${pageContext.request.contextPath}/admin/faculty/news" class="menu-item active">
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
                <h2>
                    <i class="bi bi-${empty news ? 'plus-circle' : 'pencil-square'} me-2"></i>
                    ${empty news ? 'Thêm' : 'Sửa'} Bài viết
                </h2>
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
            <!-- Error Message -->
            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="bi bi-exclamation-triangle me-2"></i>${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <!-- Form -->
            <div class="form-card">
                <h5><i class="bi bi-newspaper me-2"></i>${empty news ? 'Thêm Bài viết mới' : 'Chỉnh sửa Bài viết'}</h5>
                
                <form action="${pageContext.request.contextPath}/admin/faculty/news" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="action" value="${empty news ? 'create' : 'update'}">
                    <c:if test="${not empty news}">
                        <input type="hidden" name="id" value="${news.id}">
                    </c:if>
                    
                    <div class="mb-3">
                        <label for="title" class="form-label">Tiêu đề <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="title" name="title" 
                               value="${news.title}" required placeholder="Nhập tiêu đề bài viết">
                    </div>
                    
                    <div class="mb-3">
                        <label for="thumbnail" class="form-label">Ảnh đại diện</label>
                        <input type="file" class="form-control" id="thumbnail" name="thumbnail" 
                               accept="image/*" onchange="previewImage(this)">
                        <c:if test="${not empty news.thumbnail}">
                            <img src="${pageContext.request.contextPath}/${news.thumbnail}" 
                                 alt="Current thumbnail" class="thumbnail-preview" id="currentThumbnail">
                        </c:if>
                        <img id="thumbnailPreview" class="thumbnail-preview d-none" alt="Preview">
                    </div>
                    
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="createdDate" class="form-label">Ngày đăng</label>
                            <input type="date" class="form-control" id="createdDate" name="createdDate" 
                                   value="<fmt:formatDate value='${news.createdDate}' pattern='yyyy-MM-dd'/>">
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="content" class="form-label">Nội dung <span class="text-danger">*</span></label>
                        <textarea class="form-control" id="content" name="content" rows="15" 
                                  required placeholder="Nhập nội dung bài viết...">${news.content}</textarea>
                    </div>
                    
                    <div class="d-flex gap-2">
                        <button type="submit" class="btn btn-faculty">
                            <i class="bi bi-${empty news ? 'plus-circle' : 'check-circle'} me-2"></i>
                            ${empty news ? 'Tạo bài viết' : 'Cập nhật'}
                        </button>
                        <a href="${pageContext.request.contextPath}/admin/faculty/news" class="btn btn-secondary">
                            <i class="bi bi-arrow-left me-2"></i>Quay lại
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function previewImage(input) {
            const preview = document.getElementById('thumbnailPreview');
            const current = document.getElementById('currentThumbnail');
            
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    preview.src = e.target.result;
                    preview.classList.remove('d-none');
                    if (current) {
                        current.classList.add('d-none');
                    }
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</body>
</html>
