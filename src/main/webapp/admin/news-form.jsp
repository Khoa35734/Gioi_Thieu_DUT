<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${news != null ? 'Sửa' : 'Thêm'} Tin Tức</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
</head>
<body>
    <div class="admin-container">
        <aside class="admin-sidebar">
            <h3>Admin Panel</h3>
            <ul>
                <li><a href="faculty-list">Quản Lý Khoa</a></li>
                <li><a href="major-list">Quản Lý Ngành</a></li>
                <li><a href="news-list" class="active">Quản Lý Tin Tức</a></li>
                <li><a href="${pageContext.request.contextPath}/home">Xem Trang Chủ</a></li>
            </ul>
        </aside>

        <main class="admin-content">
            <h2>${news != null ? 'Sửa' : 'Thêm'} Tin Tức</h2>

            <form method="post" action="news-list">
                <c:if test="${news != null}">
                    <input type="hidden" name="id" value="${news.id}">
                </c:if>

                <div class="form-group">
                    <label for="title">Tiêu Đề:</label>
                    <input type="text" id="title" name="title" value="${news.title}" required>
                </div>

                <div class="form-group">
                    <label for="thumbnail">Ảnh Thumbnail (URL):</label>
                    <input type="text" id="thumbnail" name="thumbnail" value="${news.thumbnail}">
                </div>

                <div class="form-group">
                    <label for="content">Nội Dung:</label>
                    <textarea id="content" name="content" rows="10">${news.content}</textarea>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">Lưu</button>
                    <a href="news-list" class="btn btn-secondary">Hủy</a>
                </div>
            </form>
        </main>
    </div>

    <script>
        // Khởi tạo CKEditor
        CKEDITOR.replace('content', {
            height: 400,
            filebrowserUploadUrl: '${pageContext.request.contextPath}/upload-image',
            filebrowserUploadMethod: 'form',
            // Cấu hình toolbar
            toolbar: [
                { name: 'document', items: [ 'Source', '-', 'Save', 'NewPage', 'Preview', 'Print' ] },
                { name: 'clipboard', items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
                { name: 'editing', items: [ 'Find', 'Replace', '-', 'SelectAll' ] },
                '/',
                { name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat' ] },
                { name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote' ] },
                { name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
                { name: 'insert', items: [ 'Image', 'Table', 'HorizontalRule', 'SpecialChar' ] },
                '/',
                { name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
                { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
                { name: 'tools', items: [ 'Maximize', 'ShowBlocks' ] }
            ]
        });
    </script>
</body>
</html>

