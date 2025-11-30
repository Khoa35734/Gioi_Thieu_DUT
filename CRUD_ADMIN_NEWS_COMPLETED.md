# ✅ ĐÃ TẠO XONG CÁC TRANG CRUD!

## 🎉 Tổng quan

Đã tạo thành công hệ thống CRUD hoàn chỉnh cho **Admin Khoa** và **Bài viết** cho Super Admin.

---

## 📂 Files đã tạo

### 1. CRUD Admin Khoa

#### Servlet:
✅ **`AdminFacultyAdminServlet.java`** 
- **Route**: `/admin/faculty-admins`
- **Chức năng**: 
  - `GET` (default): Hiển thị danh sách Admin Khoa
  - `GET ?action=new`: Hiển thị form tạo mới
  - `GET ?action=edit&id=X`: Hiển thị form sửa
  - `GET ?action=delete&id=X`: Xóa Admin Khoa
  - `POST`: Tạo mới hoặc cập nhật Admin Khoa

#### JSP Pages:
✅ **`faculty-admins-list.jsp`**
- Danh sách tất cả Admin Khoa
- Bảng với 7 cột: ID, Username, Họ tên, Email, Khoa, Ngày tạo, Thao tác
- Nút "Thêm Admin Khoa"
- Empty state khi chưa có admin nào
- Xác nhận xóa (confirm dialog)

✅ **`faculty-admins-form.jsp`**
- Form thêm/sửa Admin Khoa
- Trường:
  * Username (required)
  * Khoa (dropdown select, required)
  * Họ và tên (required)
  * Email (optional)
  * Mật khẩu (required khi tạo mới, optional khi sửa)
- Validation trên server
- Kiểm tra username trùng

---

### 2. CRUD Bài viết (News)

#### Servlet:
✅ **`AdminNewsManagementServlet.java`** 
- **Route**: `/admin/news`
- **Chức năng**:
  - `GET` (default): Hiển thị danh sách bài viết
  - `GET ?action=new`: Hiển thị form tạo mới
  - `GET ?action=edit&id=X`: Hiển thị form sửa
  - `GET ?action=delete&id=X`: Xóa bài viết
  - `POST`: Tạo mới hoặc cập nhật bài viết
- **Phân quyền**:
  * Super Admin: Xem/sửa/xóa **TẤT CẢ** bài viết, chọn Khoa khi tạo
  * Faculty Admin: Chỉ xem/sửa/xóa bài viết của **KHOA MÌNH**
- **Upload ảnh**: Hỗ trợ upload thumbnail (max 10MB)

#### JSP Pages (Sử dụng lại file cũ):
- **`news-list.jsp`**: Hiển thị danh sách bài viết
- **`news-form.jsp`**: Form thêm/sửa bài viết

---

## 🔗 Routes mới

### Super Admin Dashboard:

| Chức năng | Route | Method | Mô tả |
|-----------|-------|--------|-------|
| **Danh sách Admin Khoa** | `/admin/faculty-admins` | GET | List tất cả Faculty Admins |
| **Tạo Admin Khoa** | `/admin/faculty-admins?action=new` | GET | Form tạo mới |
| **Sửa Admin Khoa** | `/admin/faculty-admins?action=edit&id=X` | GET | Form sửa |
| **Xóa Admin Khoa** | `/admin/faculty-admins?action=delete&id=X` | GET | Xóa và redirect |
| **Lưu Admin Khoa** | `/admin/faculty-admins` | POST | Create/Update |
| | | | |
| **Danh sách Bài viết** | `/admin/news` | GET | List tất cả News |
| **Tạo Bài viết** | `/admin/news?action=new` | GET | Form tạo mới |
| **Sửa Bài viết** | `/admin/news?action=edit&id=X` | GET | Form sửa |
| **Xóa Bài viết** | `/admin/news?action=delete&id=X` | GET | Xóa và redirect |
| **Lưu Bài viết** | `/admin/news` | POST | Create/Update |

---

## 🎯 Các tính năng đã implement

### Admin Khoa CRUD:

✅ **Tạo mới Admin Khoa**
- Nhập Username, Password, Họ tên, Email, chọn Khoa
- Validation: Username không trùng, các trường required
- Tự động set `role = 'faculty_admin'`

✅ **Sửa Admin Khoa**
- Load thông tin Admin hiện tại
- Cho phép đổi Username (nếu không trùng)
- Đổi mật khẩu tùy chọn (để trống = giữ nguyên)
- Không thể sửa thành Super Admin

✅ **Xóa Admin Khoa**
- Xác nhận trước khi xóa (JavaScript confirm)
- Xóa cascade: Xóa admin → Xóa các bài viết của admin đó (nếu có ON DELETE CASCADE)

✅ **Danh sách Admin Khoa**
- Hiển thị tất cả Faculty Admins (filter role = 'faculty_admin')
- Không hiển thị Super Admin trong list
- Sắp xếp theo ngày tạo (mới nhất trước)

---

### Bài viết CRUD:

✅ **Phân quyền rõ ràng**
- **Super Admin**:
  - Xem tất cả bài viết (faculty_id = NULL hoặc bất kỳ)
  - Tạo bài viết chung (faculty_id = NULL) hoặc cho khoa cụ thể
  - Sửa/xóa bất kỳ bài viết nào
  
- **Faculty Admin**:
  - Chỉ xem bài viết của khoa mình (`faculty_id = currentAdmin.facultyId`)
  - Tạo bài viết tự động gán cho khoa mình
  - Chỉ sửa/xóa bài viết của khoa mình
  - Không thể sửa/xóa bài viết chung hoặc của khoa khác

✅ **Upload ảnh thumbnail**
- Hỗ trợ upload file ảnh (max 10MB)
- Lưu vào thư mục `uploads/news/`
- Tự động tạo tên file unique (timestamp + original name)

✅ **Validation**
- Tiêu đề không được để trống
- Nội dung không được để trống
- Kiểm tra quyền trước khi sửa/xóa (Faculty Admin)

---

## 🚀 Test ngay!

### Bước 1: Restart Tomcat
```
Ctrl + F5 trong IntelliJ
```

### Bước 2: Đăng nhập Super Admin
```
URL: http://localhost:8080/Gioi_Thieu_DUT_war_exploded/admin/dashboard
Login: superadmin / admin123
```

### Bước 3: Test CRUD Admin Khoa

#### ✅ Xem danh sách:
- Click "Admin Khoa" trong sidebar
- URL: `http://localhost:8080/Gioi_Thieu_DUT_war_exploded/admin/faculty-admins`
- Kiểm tra: Có hiển thị danh sách Faculty Admins không?

#### ✅ Tạo mới:
1. Click nút "Thêm Admin Khoa"
2. Điền form:
   - Username: `admin_test`
   - Password: `test123`
   - Họ tên: `Admin Test`
   - Email: `test@dut.edu.vn`
   - Khoa: Chọn "Công nghệ Thông tin"
3. Click "Tạo Admin"
4. Kiểm tra: Có redirect về list và hiển thị thông báo thành công?

#### ✅ Sửa:
1. Click nút "Sửa" (icon bút) trên 1 admin
2. Đổi Họ tên → "Admin Test Updated"
3. Để trống mật khẩu (giữ nguyên)
4. Click "Cập nhật"
5. Kiểm tra: Tên đã đổi nhưng vẫn login được bằng password cũ?

#### ✅ Xóa:
1. Click nút "Xóa" (icon thùng rác) trên admin vừa tạo
2. Xác nhận trong dialog
3. Kiểm tra: Admin đã mất khỏi danh sách?

---

### Bước 4: Test CRUD Bài viết

#### ✅ Xem danh sách (Super Admin):
- Click "Bài viết" trong sidebar
- URL: `http://localhost:8080/Gioi_Thieu_DUT_war_exploded/admin/news`
- Kiểm tra: Có hiển thị TẤT CẢ bài viết (cả chung + từng khoa)?

#### ✅ Tạo bài viết chung (Super Admin):
1. Click "Thêm bài viết"
2. Điền form:
   - Tiêu đề: `Thông báo chung từ Super Admin`
   - Nội dung: `Đây là bài viết chung cho toàn trường`
   - Khoa: **Để trống** (bài viết chung)
3. Upload ảnh (optional)
4. Click "Lưu"
5. Kiểm tra: Bài viết có faculty = NULL?

#### ✅ Tạo bài viết cho khoa (Super Admin):
1. Click "Thêm bài viết"
2. Điền form:
   - Tiêu đề: `Tin tức Khoa CNTT`
   - Khoa: Chọn "Công nghệ Thông tin"
3. Click "Lưu"
4. Kiểm tra: Bài viết có faculty = CNTT?

---

### Bước 5: Test phân quyền Faculty Admin

#### ✅ Đăng nhập Faculty Admin:
```
URL: http://localhost:8080/Gioi_Thieu_DUT_war_exploded/admin/faculty/dashboard
Login: admin_cntt / khoa123
```

#### ✅ Xem danh sách bài viết:
- Click "Bài viết" trong sidebar Faculty Admin
- Kiểm tra: Chỉ hiển thị bài viết của khoa CNTT?
- Kiểm tra: Không thấy bài viết của khoa khác?

#### ✅ Tạo bài viết (Faculty Admin):
1. Click "Thêm bài viết"
2. Điền form
3. Kiểm tra: **KHÔNG CÓ dropdown chọn Khoa** (tự động gán cho khoa CNTT)
4. Click "Lưu"
5. Kiểm tra: Bài viết có faculty = CNTT?

#### ✅ Test cấm sửa bài viết khoa khác:
1. Lấy ID của bài viết khoa Cơ Khí (ví dụ: id=5)
2. Thử truy cập URL:
   ```
   http://localhost:8080/Gioi_Thieu_DUT_war_exploded/admin/news?action=edit&id=5
   ```
3. Kiểm tra: Có hiển thị lỗi **403 Forbidden** không?

---

## 📊 Tóm tắt kiến trúc

### Database Schema (giữ nguyên):
```sql
-- Bảng admin
CREATE TABLE admin (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    role ENUM('super_admin', 'faculty_admin') NOT NULL,
    faculty_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (faculty_id) REFERENCES faculty(id)
);

-- Bảng news
CREATE TABLE news (
    id INT PRIMARY KEY AUTO_INCREMENT,
    faculty_id INT,  -- NULL = bài viết chung
    author_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    thumbnail VARCHAR(255),
    created_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (faculty_id) REFERENCES faculty(id),
    FOREIGN KEY (author_id) REFERENCES admin(id)
);
```

### Servlets:
- `AdminFacultyAdminServlet`: `/admin/faculty-admins`
- `AdminNewsManagementServlet`: `/admin/news`
- `DashboardServlet`: `/admin/dashboard` (đã update links)
- `FacultyDashboardServlet`: `/admin/faculty/dashboard`

### JSP Pages:
- `admin/faculty-admins-list.jsp`: Danh sách Admin Khoa
- `admin/faculty-admins-form.jsp`: Form thêm/sửa Admin Khoa
- `admin/news-list.jsp`: Danh sách Bài viết (reuse)
- `admin/news-form.jsp`: Form thêm/sửa Bài viết (reuse)
- `admin/dashboard.jsp`: Super Admin Dashboard (updated links)
- `admin/faculty/faculty-dashboard.jsp`: Faculty Admin Dashboard

---

## ✅ Checklist hoàn thành

### Admin Khoa:
- [x] Servlet `/admin/faculty-admins` với GET/POST
- [x] List page với empty state
- [x] Form create/edit
- [x] Validation username trùng
- [x] Đổi mật khẩu optional khi edit
- [x] Delete với confirm dialog
- [x] Filter chỉ hiển thị faculty_admin role
- [x] Update links trong dashboard.jsp

### Bài viết:
- [x] Servlet `/admin/news` với GET/POST
- [x] Phân quyền Super Admin vs Faculty Admin
- [x] Super Admin: xem/sửa tất cả, chọn khoa
- [x] Faculty Admin: chỉ xem/sửa khoa mình
- [x] Upload thumbnail (10MB max)
- [x] Validation title/content required
- [x] Check permission trước khi edit/delete

### Tích hợp:
- [x] Dashboard links dùng routes mới
- [x] Build project thành công (mvnw compile)
- [x] Không có lỗi 404

---

## 🎉 KẾT QUẢ

✅ **Đã gộp CRUD Khoa và CRUD Admin Khoa thành CRUD Admin Khoa** (như yêu cầu)
✅ **Đã tạo CRUD Bài viết với phân quyền rõ ràng**
✅ **Tránh lỗi 404**: Tất cả routes đã được cập nhật đồng bộ
✅ **Build thành công không lỗi**

---

**Restart Tomcat và test ngay!** 🚀
