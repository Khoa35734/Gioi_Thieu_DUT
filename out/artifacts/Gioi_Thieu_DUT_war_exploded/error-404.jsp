<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 - Không tìm thấy trang</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        body {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .error-container {
            max-width: 600px;
            background: white;
            border-radius: 20px;
            padding: 50px;
            text-align: center;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
        }
        .error-code {
            font-size: 120px;
            font-weight: bold;
            color: #f5576c;
            margin: 0;
        }
        .error-icon {
            font-size: 80px;
            color: #f5576c;
        }
        .debug-info {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
            margin-top: 20px;
            text-align: left;
        }
        .debug-info code {
            background: #e9ecef;
            padding: 2px 6px;
            border-radius: 4px;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <i class="bi bi-exclamation-triangle error-icon"></i>
        <h1 class="error-code">404</h1>
        <h2 class="mb-3">Không tìm thấy trang</h2>
        <p class="text-muted mb-4">
            Trang bạn đang tìm kiếm không tồn tại hoặc đã bị di chuyển.
        </p>

        <div class="debug-info">
            <h5><i class="bi bi-bug me-2"></i>Thông tin Debug:</h5>
            <ul class="list-unstyled mb-0">
                <li><strong>URL yêu cầu:</strong> <code>${pageContext.request.requestURL}</code></li>
                <li><strong>Context Path:</strong> <code>${pageContext.request.contextPath}</code></li>
                <li><strong>Servlet Path:</strong> <code>${pageContext.request.servletPath}</code></li>
            </ul>
        </div>

        <div class="mt-4">
            <a href="${pageContext.request.contextPath}/test-admin.jsp" class="btn btn-danger btn-lg me-2">
                <i class="bi bi-wrench me-2"></i>Trang Test System
            </a>
            <a href="${pageContext.request.contextPath}/" class="btn btn-secondary btn-lg">
                <i class="bi bi-house me-2"></i>Về trang chủ
            </a>
        </div>

        <div class="mt-4">
            <small class="text-muted">
                <strong>💡 Gợi ý:</strong> Nếu bạn đang cố truy cập Admin Dashboard, 
                hãy sử dụng <a href="${pageContext.request.contextPath}/test-admin.jsp">Trang Test</a> 
                để kiểm tra từng bước.
            </small>
        </div>
    </div>
</body>
</html>
