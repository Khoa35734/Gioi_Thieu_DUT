<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Portal - DUT</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .portal-container {
            max-width: 900px;
            width: 100%;
            padding: 20px;
        }

        .portal-header {
            text-align: center;
            color: white;
            margin-bottom: 40px;
        }

        .portal-header h1 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .portal-header p {
            font-size: 1.1rem;
            opacity: 0.9;
        }

        .login-options {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }

        .login-card {
            background: white;
            border-radius: 20px;
            padding: 40px;
            text-align: center;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            cursor: pointer;
        }

        .login-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 30px 80px rgba(0, 0, 0, 0.4);
        }

        .card-icon {
            width: 100px;
            height: 100px;
            margin: 0 auto 20px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 50px;
        }

        .card-icon.super-admin {
            background: linear-gradient(135deg, #005FB7, #0073e6);
            color: white;
        }

        .card-icon.faculty-admin {
            background: linear-gradient(135deg, #FDC32D, #ffce3d);
            color: #333;
        }

        .login-card h3 {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .login-card p {
            color: #666;
            margin-bottom: 25px;
        }

        .btn-login {
            padding: 12px 40px;
            border-radius: 25px;
            font-weight: 600;
            border: none;
            transition: all 0.3s ease;
        }

        .btn-super-admin {
            background: linear-gradient(135deg, #005FB7, #0073e6);
            color: white;
        }

        .btn-super-admin:hover {
            background: linear-gradient(135deg, #004a94, #005fb7);
            transform: scale(1.05);
        }

        .btn-faculty-admin {
            background: linear-gradient(135deg, #FDC32D, #ffce3d);
            color: #333;
        }

        .btn-faculty-admin:hover {
            background: linear-gradient(135deg, #f5a623, #fdc32d);
            transform: scale(1.05);
        }

        .portal-footer {
            text-align: center;
            color: white;
            margin-top: 40px;
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <div class="portal-container">
        <div class="portal-header">
            <h1><i class="bi bi-shield-lock-fill me-3"></i>Admin Portal</h1>
            <p>Trường Đại học Bách Khoa - Đại học Đà Nẵng</p>
        </div>

        <div class="login-options">
            <!-- Super Admin Card -->
            <div class="login-card" onclick="window.location.href='${pageContext.request.contextPath}/admin/super/login'">
                <div class="card-icon super-admin">
                    <i class="bi bi-shield-lock-fill"></i>
                </div>
                <h3>Super Admin</h3>
                <p>Quản trị tổng hệ thống<br>Quản lý khoa & Faculty Admins</p>
                <a href="${pageContext.request.contextPath}/admin/super/login" 
                   class="btn btn-super-admin btn-login">
                    Đăng nhập <i class="bi bi-arrow-right ms-2"></i>
                </a>
            </div>

            <!-- Faculty Admin Card -->
            <div class="login-card" onclick="window.location.href='${pageContext.request.contextPath}/admin/faculty/login'">
                <div class="card-icon faculty-admin">
                    <i class="bi bi-building"></i>
                </div>
                <h3>Faculty Admin</h3>
                <p>Quản trị khoa<br>Quản lý bài viết & ngành học</p>
                <a href="${pageContext.request.contextPath}/admin/faculty/login" 
                   class="btn btn-faculty-admin btn-login">
                    Đăng nhập <i class="bi bi-arrow-right ms-2"></i>
                </a>
            </div>
        </div>

        <div class="portal-footer">
            <p><i class="bi bi-globe me-2"></i><a href="${pageContext.request.contextPath}/" style="color: white; text-decoration: none;">Về trang chủ</a></p>
            <p>&copy; 2024 Trường Đại học Bách Khoa - Đại học Đà Nẵng</p>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
