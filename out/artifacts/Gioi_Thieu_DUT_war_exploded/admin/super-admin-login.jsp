<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Super Admin Login - DUT</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    
    <style>
        body {
            background: linear-gradient(135deg, #005FB7 0%, #003d7a 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .login-container {
            max-width: 450px;
            width: 100%;
            padding: 20px;
        }

        .login-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            overflow: hidden;
        }

        .login-header {
            background: linear-gradient(135deg, #005FB7, #0073e6);
            padding: 40px 30px;
            text-align: center;
            color: white;
        }

        .login-logo {
            width: 80px;
            height: 80px;
            background: white;
            border-radius: 50%;
            margin: 0 auto 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .login-logo i {
            font-size: 40px;
            color: #005FB7;
        }

        .login-header h1 {
            font-size: 24px;
            font-weight: 700;
            margin: 0 0 5px;
        }

        .login-header p {
            font-size: 14px;
            margin: 0;
            opacity: 0.9;
        }

        .login-body {
            padding: 40px 30px;
        }

        .form-control {
            padding: 12px 15px;
            border-radius: 10px;
            border: 2px solid #e0e0e0;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #005FB7;
            box-shadow: 0 0 0 0.2rem rgba(0, 95, 183, 0.15);
        }

        .input-group-text {
            background: #f8f9fa;
            border: 2px solid #e0e0e0;
            border-right: none;
            border-radius: 10px 0 0 10px;
        }

        .input-group .form-control {
            border-left: none;
            border-radius: 0 10px 10px 0;
        }

        .input-group:focus-within .input-group-text {
            border-color: #005FB7;
        }

        .btn-login {
            padding: 12px;
            border-radius: 10px;
            font-weight: 600;
            background: linear-gradient(135deg, #005FB7, #0073e6);
            border: none;
            color: white;
            transition: all 0.3s ease;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 95, 183, 0.3);
        }

        .remember-me {
            color: #666;
            font-size: 14px;
        }

        .form-check-input:checked {
            background-color: #005FB7;
            border-color: #005FB7;
        }

        .alert {
            border-radius: 10px;
            border: none;
        }

        .login-footer {
            text-align: center;
            padding: 20px;
            background: #f8f9fa;
            color: #666;
            font-size: 13px;
        }

        .login-footer a {
            color: #005FB7;
            text-decoration: none;
            font-weight: 600;
        }

        .login-footer a:hover {
            text-decoration: underline;
        }

        .badge-role {
            background: rgba(255, 255, 255, 0.2);
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-card">
            <div class="login-header">
                <div class="login-logo">
                    <i class="bi bi-shield-lock-fill"></i>
                </div>
                <h1>Super Admin</h1>
                <p>Hệ thống quản trị tổng</p>
                <span class="badge-role">SUPER ADMINISTRATOR</span>
            </div>

            <div class="login-body">
                <% if (request.getAttribute("error") != null) { %>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="bi bi-exclamation-circle me-2"></i>
                        <%= request.getAttribute("error") %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                <% } %>

                <form action="${pageContext.request.contextPath}/admin/super/login" method="post">
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Tên đăng nhập</label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-person-fill text-primary"></i>
                            </span>
                            <input type="text" 
                                   class="form-control" 
                                   name="username" 
                                   placeholder="Nhập tên đăng nhập"
                                   value="${username}"
                                   required 
                                   autofocus>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Mật khẩu</label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-lock-fill text-primary"></i>
                            </span>
                            <input type="password" 
                                   class="form-control" 
                                   name="password" 
                                   id="password"
                                   placeholder="Nhập mật khẩu"
                                   required>
                            <button class="btn btn-outline-secondary" 
                                    type="button" 
                                    id="togglePassword"
                                    style="border-radius: 0 10px 10px 0;">
                                <i class="bi bi-eye"></i>
                            </button>
                        </div>
                    </div>

                    <div class="mb-4 d-flex justify-content-between align-items-center">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="remember" id="remember">
                            <label class="form-check-label remember-me" for="remember">
                                Ghi nhớ đăng nhập
                            </label>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-login w-100">
                        <i class="bi bi-box-arrow-in-right me-2"></i>Đăng nhập
                    </button>
                </form>
            </div>

            <div class="login-footer">
                <p class="mb-2">Bạn là Admin Khoa? <a href="${pageContext.request.contextPath}/admin/faculty/login">Đăng nhập tại đây</a></p>
                <p class="mb-0">&copy; 2024 Trường Đại học Bách Khoa - Đại học Đà Nẵng</p>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Toggle password visibility
        document.getElementById('togglePassword').addEventListener('click', function() {
            const password = document.getElementById('password');
            const icon = this.querySelector('i');
            
            if (password.type === 'password') {
                password.type = 'text';
                icon.classList.replace('bi-eye', 'bi-eye-slash');
            } else {
                password.type = 'password';
                icon.classList.replace('bi-eye-slash', 'bi-eye');
            }
        });

        // Load saved username from cookie
        const cookies = document.cookie.split(';');
        for (let cookie of cookies) {
            const [name, value] = cookie.trim().split('=');
            if (name === 'adminUsername') {
                document.querySelector('input[name="username"]').value = decodeURIComponent(value);
                document.getElementById('remember').checked = true;
            }
        }
    </script>
</body>
</html>
