<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${empty admin ? 'Thêm' : 'Sửa'} Admin Khoa - Super Admin</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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
            z-index: 1000;
            box-shadow: 2px 0 10px rgba(0,0,0,0.1);
        }
        
        .sidebar .logo {
            padding: 1.5rem 1rem;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            text-align: center;
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
        
        .sidebar .nav-link:hover, .sidebar .nav-link.active {
            background-color: rgba(255,255,255,0.2);
            color: white;
        }
        
        .sidebar .nav-link i {
            margin-right: 0.75rem;
            font-size: 1.1rem;
        }
        
        /* Main content */
        .main-content {
            margin-left: var(--sidebar-width);
        }
        
        .top-navbar {
            background: white;
            padding: 1rem 2rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.08);
        }
        
        .content-area {
            padding: 2rem;
        }
        
        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
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
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/logout">
                    <i class="bi bi-box-arrow-right"></i> Đăng xuất
                </a>
            </li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="top-navbar">
            <h5 class="mb-0">${empty admin ? 'Thêm' : 'Sửa'} Admin Khoa</h5>
        </div>

        <div class="content-area">
            <!-- Breadcrumb -->
            <nav aria-label="breadcrumb" class="mb-4">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a></li>
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/faculty-admins">Admin Khoa</a></li>
                    <li class="breadcrumb-item active">${empty admin ? 'Thêm mới' : 'Chỉnh sửa'}</li>
                </ol>
            </nav>

            <!-- Error Messages -->
            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show">
                    <i class="bi bi-exclamation-circle me-2"></i>${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <!-- Form Card -->
            <div class="card">
                <div class="card-body p-4">
                    <form action="${pageContext.request.contextPath}/admin/faculty-admins" method="post">
                        <c:if test="${not empty admin}">
                            <input type="hidden" name="id" value="${admin.id}">
                        </c:if>

                        <div class="row g-3">
                            <!-- Username -->
                            <div class="col-md-6">
                                <label for="username" class="form-label">Username <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="username" name="username" 
                                       value="${admin.username}" required>
                                <div class="form-text">Username để đăng nhập hệ thống</div>
                            </div>

                            <!-- Faculty -->
                            <div class="col-md-6">
                                <label for="facultyId" class="form-label">Khoa <span class="text-danger">*</span></label>
                                <select class="form-select" id="facultyId" name="facultyId" required>
                                    <option value="">-- Chọn khoa --</option>
                                    <c:forEach var="faculty" items="${faculties}">
                                        <option value="${faculty.id}" ${admin.facultyId == faculty.id ? 'selected' : ''}>
                                            ${faculty.name}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>

                            <!-- Full Name -->
                            <div class="col-md-6">
                                <label for="fullName" class="form-label">Họ và tên <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="fullName" name="fullName" 
                                       value="${admin.fullName}" required>
                            </div>

                            <!-- Email -->
                            <div class="col-md-6">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" 
                                       value="${admin.email}">
                            </div>

                            <!-- Password (only for new or if changing) -->
                            <c:choose>
                                <c:when test="${empty admin}">
                                    <div class="col-md-6">
                                        <label for="password" class="form-label">Mật khẩu <span class="text-danger">*</span></label>
                                        <input type="password" class="form-control" id="password" name="password" required>
                                        <div class="form-text">Mật khẩu phải có ít nhất 6 ký tự</div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="col-md-6">
                                        <label for="newPassword" class="form-label">Mật khẩu mới</label>
                                        <input type="password" class="form-control" id="newPassword" name="newPassword">
                                        <div class="form-text">Để trống nếu không đổi mật khẩu</div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <!-- Buttons -->
                        <div class="mt-4 d-flex gap-2">
                            <button type="submit" class="btn btn-primary">
                                <i class="bi bi-save me-1"></i> ${empty admin ? 'Tạo Admin' : 'Cập nhật'}
                            </button>
                            <a href="${pageContext.request.contextPath}/admin/faculty-admins" class="btn btn-secondary">
                                <i class="bi bi-x-circle me-1"></i> Hủy
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
