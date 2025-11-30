# Hệ thống quản trị website Trường ĐH Bách Khoa - ĐH Đà Nẵng

## Tổng quan
Hệ thống quản trị phân cấp với 2 loại tài khoản:
- **Super Admin**: Quản trị tổng hệ thống
- **Faculty Admin**: Quản trị theo khoa

## Cấu trúc Database

### Bảng `faculty` - Quản lý khoa
- `id`: ID khoa (PRIMARY KEY)
- `name`: Tên khoa
- `description`: Mô tả khoa
- `created_at`, `updated_at`: Thời gian tạo/cập nhật

### Bảng `admin` - Quản lý tài khoản admin
- `id`: ID admin (PRIMARY KEY)
- `username`: Tên đăng nhập (UNIQUE)
- `password`: Mật khẩu
- `full_name`: Họ và tên
- `email`: Email
- `role`: Vai trò (`super_admin` hoặc `faculty_admin`)
- `faculty_id`: ID khoa (NULL đối với super_admin)
- `created_at`: Thời gian tạo

### Bảng `major` - Quản lý ngành học
- `id`: ID ngành (PRIMARY KEY)
- `faculty_id`: ID khoa (FOREIGN KEY)
- `major_code`: Mã ngành (UNIQUE)
- `name`: Tên ngành
- `description`: Mô tả ngành
- `created_by`: ID admin tạo ngành
- `created_at`, `updated_at`: Thời gian tạo/cập nhật

### Bảng `news` - Quản lý bài viết
- `id`: ID bài viết (PRIMARY KEY)
- `faculty_id`: ID khoa (NULL = bài viết của super admin)
- `author_id`: ID admin viết bài (FOREIGN KEY)
- `title`: Tiêu đề
- `content`: Nội dung (HTML)
- `thumbnail`: Đường dẫn ảnh đại diện
- `created_date`: Ngày đăng
- `created_at`, `updated_at`: Thời gian tạo/cập nhật

## Phân quyền

### Super Admin
✅ Quản lý tất cả các khoa (CRUD)
✅ Quản lý tài khoản Faculty Admin (CRUD)
✅ Quản lý tất cả bài viết của mọi khoa (CRUD)
✅ Tạo bài viết không thuộc khoa nào (bài viết chung của trường)
✅ Xem báo cáo tổng hợp
❌ KHÔNG quản lý ngành học (do Faculty Admin quản lý)

### Faculty Admin
✅ Quản lý bài viết của khoa mình (CRUD)
✅ Quản lý ngành học của khoa mình (CRUD)
✅ Xem thông tin khoa của mình
❌ KHÔNG quản lý bài viết của khoa khác
❌ KHÔNG tạo/xóa khoa
❌ KHÔNG tạo/xóa Faculty Admin

## Cài đặt

### 1. Cấu hình Database
```bash
# Tạo database và bảng
mysql -u root -p < database/schema.sql

# Insert dữ liệu demo
mysql -u root -p < database/demo-data.sql
```

### 2. Cấu hình kết nối DB
Cập nhật file `src/main/java/utils/DBConnection.java`:
```java
private static final String URL = "jdbc:mysql://localhost:3306/gioi_thieu_dut";
private static final String USER = "root";
private static final String PASSWORD = "your_password";
```

### 3. Build và Deploy
```bash
# Build project
mvn clean package

# Deploy file WAR vào Tomcat
cp target/Gioi_Thieu_DUT-1.0-SNAPSHOT.war $TOMCAT_HOME/webapps/
```

## Tài khoản demo

### Super Admin
- **URL**: `http://localhost:8080/Gioi_Thieu_DUT/admin/super/login`
- **Username**: `superadmin`
- **Password**: `admin123`

### Faculty Admin - Khoa CNTT
- **URL**: `http://localhost:8080/Gioi_Thieu_DUT/admin/faculty/login`
- **Username**: `admin_cntt`
- **Password**: `khoa123`

### Faculty Admin - Khoa Cơ Khí
- **URL**: `http://localhost:8080/Gioi_Thieu_DUT/admin/faculty/login`
- **Username**: `admin_cokhi`
- **Password**: `khoa123`

### Faculty Admin - Khoa Điện
- **URL**: `http://localhost:8080/Gioi_Thieu_DUT/admin/faculty/login`
- **Username**: `admin_dien`
- **Password**: `khoa123`

### Faculty Admin - Khoa Xây Dựng
- **URL**: `http://localhost:8080/Gioi_Thieu_DUT/admin/faculty/login`
- **Username**: `admin_xaydung`
- **Password**: `khoa123`

## Giao diện

### Super Admin Dashboard
- Thống kê tổng quan toàn trường
- Quản lý khoa
- Quản lý Faculty Admin
- Quản lý tất cả bài viết
- Báo cáo & thống kê tổng hợp

### Faculty Admin Dashboard
- Thống kê khoa của mình
- Quản lý bài viết của khoa
- Quản lý ngành học của khoa
- Thông tin khoa

## Màu sắc
- **Super Admin**: Theme xanh dương (#005FB7) - Màu chính của trường
- **Faculty Admin**: Theme vàng (#FDC32D) - Màu phụ của trường

## API Endpoints

### Authentication
- `POST /admin/super/login` - Đăng nhập Super Admin
- `POST /admin/faculty/login` - Đăng nhập Faculty Admin
- `GET /admin/logout` - Đăng xuất

### Super Admin Only
- `GET/POST /admin/faculties` - Quản lý khoa
- `GET/POST /admin/faculty-admins` - Quản lý Faculty Admin

### Faculty Admin Only
- `GET/POST /admin/majors` - Quản lý ngành học
- `GET /admin/faculty/info` - Thông tin khoa

### Both Roles
- `GET /admin/dashboard` - Dashboard chung
- `GET/POST /admin/news` - Quản lý bài viết (với phân quyền)

## Bảo mật
- Session timeout: 30 phút
- Role-based access control (RBAC)
- Filter kiểm tra quyền truy cập
- Mã hóa mật khẩu (TODO: implement BCrypt)

## TODO
- [ ] Implement BCrypt cho mật khẩu
- [ ] Thêm WYSIWYG editor cho nội dung bài viết
- [ ] Upload và quản lý ảnh
- [ ] Phân trang cho danh sách
- [ ] Tìm kiếm và lọc nâng cao
- [ ] Export báo cáo Excel/PDF
- [ ] Email notification
- [ ] Activity logs
- [ ] Backup/Restore database

## Công nghệ sử dụng
- **Backend**: Java Servlet/JSP
- **Database**: MySQL 8.0
- **Frontend**: Bootstrap 5.3.2, Chart.js
- **Server**: Apache Tomcat 10.x

## Liên hệ
- **Email**: support@dut.edu.vn
- **Website**: https://dut.udn.vn
