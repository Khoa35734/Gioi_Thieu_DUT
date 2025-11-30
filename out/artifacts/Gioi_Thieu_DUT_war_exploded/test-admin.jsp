<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Debug & Test - DUT Admin System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 40px 20px;
        }
        .test-container {
            max-width: 900px;
            margin: 0 auto;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            margin-bottom: 20px;
        }
        .card-header {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            font-weight: bold;
            border-radius: 15px 15px 0 0 !important;
        }
        .btn-test {
            margin: 5px;
            border-radius: 8px;
        }
        .status-badge {
            font-size: 0.9rem;
            padding: 5px 15px;
            border-radius: 20px;
        }
    </style>
</head>
<body>
    <div class="test-container">
        <div class="card">
            <div class="card-header">
                <h3 class="mb-0"><i class="bi bi-wrench me-2"></i>Debug & Test System</h3>
            </div>
            <div class="card-body">
                <h5><i class="bi bi-info-circle text-primary"></i> Hệ thống đang trong chế độ DEBUG</h5>
                <p class="text-muted">Sử dụng các link bên dưới để kiểm tra từng phần của hệ thống</p>
            </div>
        </div>

        <!-- Test Basic -->
        <div class="card">
            <div class="card-header">
                <i class="bi bi-check-circle me-2"></i>1. Kiểm tra Servlet cơ bản
            </div>
            <div class="card-body">
                <p><strong>Mục đích:</strong> Test xem Tomcat đã nhận diện @WebServlet chưa</p>
                <a href="${pageContext.request.contextPath}/test" 
                   class="btn btn-primary btn-test" target="_blank">
                    <i class="bi bi-play-circle me-2"></i>Test Servlet
                </a>
                <span class="status-badge bg-light text-dark">Phải thấy: "✅ Servlet hoạt động OK!"</span>
            </div>
        </div>

        <!-- Test Database -->
        <div class="card">
            <div class="card-header">
                <i class="bi bi-database me-2"></i>2. Kiểm tra Database Connection
            </div>
            <div class="card-body">
                <p><strong>Mục đích:</strong> Test kết nối MySQL, kiểm tra username/password</p>
                <a href="${pageContext.request.contextPath}/test-db" 
                   class="btn btn-success btn-test" target="_blank">
                    <i class="bi bi-hdd-network me-2"></i>Test Database
                </a>
                <span class="status-badge bg-light text-dark">Phải thấy: "✅ Kết nối DATABASE thành công!"</span>
            </div>
        </div>

        <!-- Admin Portal -->
        <div class="card">
            <div class="card-header">
                <i class="bi bi-shield-lock me-2"></i>3. Admin Portal
            </div>
            <div class="card-body">
                <p><strong>Mục đích:</strong> Truy cập trang chọn loại admin</p>
                <a href="${pageContext.request.contextPath}/admin/" 
                   class="btn btn-info btn-test text-white" target="_blank">
                    <i class="bi bi-door-open me-2"></i>Admin Portal
                </a>
                <span class="status-badge bg-light text-dark">Phải thấy: 2 card (Super Admin & Faculty Admin)</span>
            </div>
        </div>

        <!-- Super Admin Login -->
        <div class="card">
            <div class="card-header bg-primary">
                <i class="bi bi-shield-fill me-2"></i>4. Login Super Admin
            </div>
            <div class="card-body">
                <p><strong>Tài khoản test:</strong></p>
                <ul>
                    <li><strong>Username:</strong> <code>superadmin</code></li>
                    <li><strong>Password:</strong> <code>admin123</code></li>
                </ul>
                <a href="${pageContext.request.contextPath}/admin/super/login" 
                   class="btn btn-primary btn-test" target="_blank">
                    <i class="bi bi-box-arrow-in-right me-2"></i>Login Super Admin
                </a>
                <span class="status-badge bg-light text-dark">Sau khi login → /admin/dashboard</span>
            </div>
        </div>

        <!-- Faculty Admin Login -->
        <div class="card">
            <div class="card-header bg-warning">
                <i class="bi bi-building me-2"></i>5. Login Faculty Admin
            </div>
            <div class="card-body">
                <p><strong>Tài khoản test:</strong></p>
                <ul>
                    <li><strong>Username:</strong> <code>admin_cntt</code></li>
                    <li><strong>Password:</strong> <code>khoa123</code></li>
                </ul>
                <a href="${pageContext.request.contextPath}/admin/faculty/login" 
                   class="btn btn-warning btn-test" target="_blank">
                    <i class="bi bi-box-arrow-in-right me-2"></i>Login Faculty Admin
                </a>
                <span class="status-badge bg-light text-dark">Sau khi login → /admin/faculty/dashboard</span>
            </div>
        </div>

        <!-- System Info -->
        <div class="card">
            <div class="card-header bg-secondary">
                <i class="bi bi-info-square me-2"></i>Thông tin hệ thống
            </div>
            <div class="card-body">
                <table class="table table-sm">
                    <tr>
                        <th width="200">Context Path:</th>
                        <td><code>${pageContext.request.contextPath}</code></td>
                    </tr>
                    <tr>
                        <th>Server Info:</th>
                        <td><code>${pageContext.servletContext.serverInfo}</code></td>
                    </tr>
                    <tr>
                        <th>Servlet Version:</th>
                        <td><code>${pageContext.servletContext.majorVersion}.${pageContext.servletContext.minorVersion}</code></td>
                    </tr>
                    <tr>
                        <th>Session ID:</th>
                        <td><code>${pageContext.session.id}</code></td>
                    </tr>
                </table>
            </div>
        </div>

        <!-- Back to Home -->
        <div class="text-center mt-4">
            <a href="${pageContext.request.contextPath}/" class="btn btn-light btn-lg">
                <i class="bi bi-house me-2"></i>Về trang chủ
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
