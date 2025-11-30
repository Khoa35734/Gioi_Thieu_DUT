# ✅ SỬ DỤNG LẠI SERVLET CŨ - TRÁNH LỖI!

## 🎯 Đã làm gì?

Thay vì tạo servlet mới (dễ gây lỗi), tôi đã **SỬ DỤNG LẠI** các servlet sẵn có và chỉ cập nhật:
- ✅ Route
- ✅ Logic xử lý
- ✅ Tên JSP file

---

## 📝 Các thay đổi

### 1. **AdminFacultyServlet.java** (CRUD Admin Khoa)

#### Trước:
```java
@WebServlet("/admin/faculty-list")  // Route cũ
// Logic: CRUD Faculty (Khoa)
```

#### Sau:
```java
@WebServlet("/admin/faculty-admins")  // Route mới
// Logic: CRUD Admin Khoa
```

**Các thay đổi:**
- ✅ Đổi route: `/admin/faculty-list` → `/admin/faculty-admins`
- ✅ List: Hiển thị Admin Khoa (filter `role = 'faculty_admin'`)
- ✅ Create: Tạo Admin với role `faculty_admin`
- ✅ Edit: Cập nhật thông tin Admin + đổi password (optional)
- ✅ Delete: Xóa Admin
- ✅ JSP: `faculty-admins-list.jsp`, `faculty-admins-form.jsp`

---

### 2. **AdminNewsServlet.java** (CRUD Bài viết)

#### Trước:
```java
@WebServlet("/admin/news-list")  // Route cũ
// Role check: "FACULTY"
```

#### Sau:
```java
@WebServlet("/admin/news")  // Route mới
// Role check: "faculty_admin"
```

**Các thay đổi:**
- ✅ Đổi route: `/admin/news-list` → `/admin/news`
- ✅ Sửa role check: `"FACULTY"` → `"faculty_admin"` (đúng với DB)
- ✅ Sửa check `facultyId != 0` → `facultyId != null` (đúng kiểu dữ liệu)
- ✅ Thêm success message khi create/update/delete
- ✅ Redirect: `news-list` → `news`

---

## 🔗 Routes cuối cùng

### Super Admin:

| Chức năng | Route | Servlet |
|-----------|-------|---------|
| **Danh sách Admin Khoa** | `/admin/faculty-admins` | `AdminFacultyServlet` |
| **Tạo Admin Khoa** | `/admin/faculty-admins?action=new` | `AdminFacultyServlet` |
| **Sửa Admin Khoa** | `/admin/faculty-admins?action=edit&id=X` | `AdminFacultyServlet` |
| **Xóa Admin Khoa** | `/admin/faculty-admins?action=delete&id=X` | `AdminFacultyServlet` |
| | | |
| **Danh sách Bài viết** | `/admin/news` | `AdminNewsServlet` |
| **Tạo Bài viết** | `/admin/news?action=new` | `AdminNewsServlet` |
| **Sửa Bài viết** | `/admin/news?action=edit&id=X` | `AdminNewsServlet` |
| **Xóa Bài viết** | `/admin/news?action=delete&id=X` | `AdminNewsServlet` |

---

## ✅ Ưu điểm của cách làm này

1. **Không tạo servlet mới** → Không conflict với code cũ
2. **Sử dụng lại logic đã test** → Ít lỗi hơn
3. **Chỉ đổi route + một số logic** → Dễ maintain
4. **JSP file mới** → Giao diện đẹp hơn, không ảnh hưởng file cũ

---

## 🚀 Test ngay!

### Bước 1: Restart Tomcat
```
Ctrl + F5 trong IntelliJ
```

### Bước 2: Test CRUD Admin Khoa

#### ✅ Danh sách:
```
URL: http://localhost:8080/Gioi_Thieu_DUT_war_exploded/admin/faculty-admins
Login: superadmin / admin123
```

Kiểm tra:
- Có hiển thị danh sách Faculty Admins không?
- Có nút "Thêm Admin Khoa" không?

#### ✅ Tạo mới:
1. Click "Thêm Admin Khoa"
2. Điền:
   - Username: `admin_test`
   - Password: `test123`
   - Họ tên: `Admin Test`
   - Khoa: Chọn một khoa
3. Click "Tạo Admin"
4. Kiểm tra: Có thông báo "Tạo Admin Khoa thành công!" không?

#### ✅ Sửa:
1. Click nút "Sửa" (icon bút)
2. Đổi tên → "Admin Test Updated"
3. Để trống password (giữ nguyên)
4. Click "Cập nhật"
5. Kiểm tra: Có thông báo "Cập nhật Admin Khoa thành công!" không?

#### ✅ Xóa:
1. Click nút "Xóa" (icon thùng rác)
2. Xác nhận trong dialog
3. Kiểm tra: Có thông báo "Xóa Admin Khoa thành công!" không?

---

### Bước 3: Test CRUD Bài viết

#### ✅ Danh sách (Super Admin):
```
URL: http://localhost:8080/Gioi_Thieu_DUT_war_exploded/admin/news
```

Kiểm tra:
- Có hiển thị tất cả bài viết không?

#### ✅ Tạo/Sửa/Xóa:
- Tương tự như test Admin Khoa
- Kiểm tra success message sau mỗi action

---

### Bước 4: Test phân quyền Faculty Admin

#### ✅ Đăng nhập Faculty Admin:
```
URL: http://localhost:8080/Gioi_Thieu_DUT_war_exploded/admin/faculty/dashboard
Login: admin_cntt / khoa123
```

#### ✅ Xem bài viết:
- Click "Bài viết" trong sidebar
- Kiểm tra: Chỉ thấy bài viết của khoa CNTT?

---

## 📊 Tóm tắt

### Files đã sửa:
1. ✅ `AdminFacultyServlet.java` - Đổi route + logic CRUD Admin Khoa
2. ✅ `AdminNewsServlet.java` - Đổi route + fix role check

### Files đã tạo:
1. ✅ `faculty-admins-list.jsp` - Danh sách Admin Khoa
2. ✅ `faculty-admins-form.jsp` - Form Admin Khoa

### Files đã xóa:
1. ✅ `AdminFacultyAdminServlet.java` (không cần)
2. ✅ `AdminNewsManagementServlet.java` (không cần)

### Build:
- ✅ Compile thành công không lỗi

---

**Restart Tomcat và test ngay!** 🚀

Cách làm này an toàn hơn vì:
- Sử dụng lại code đã có
- Ít thay đổi hơn
- Dễ debug hơn
- Tránh conflict
