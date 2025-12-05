# Hướng dẫn: Admin các khoa và Admin trường có thể CRUD bài viết

## ✅ HOÀN THÀNH

Đã cập nhật hệ thống để **CẢ 2 LOẠI ADMIN** (Super Admin và Faculty Admin) đều có thể **CRUD (Create, Read, Update, Delete) các bài viết**.

---

## 🔐 PHÂN QUYỀN

### 1. **Super Admin (Admin Trường)**
- **Role**: `super_admin`
- **Quyền truy cập**:
  - ✅ Xem TẤT CẢ bài viết của tất cả các khoa
  - ✅ Tạo bài viết mới cho bất kỳ khoa nào
  - ✅ Chỉnh sửa bất kỳ bài viết nào
  - ✅ Xóa bất kỳ bài viết nào
  - ✅ Truy cập: `/admin/news`
  - ✅ Dashboard: `/admin/dashboard`

### 2. **Faculty Admin (Admin các Khoa)**
- **Role**: `faculty_admin`
- **Quyền truy cập**:
  - ✅ Xem CHỈ các bài viết của khoa mình quản lý
  - ✅ Tạo bài viết mới cho khoa của mình
  - ✅ Chỉnh sửa CHỈ bài viết của khoa mình
  - ✅ Xóa CHỈ bài viết của khoa mình
  - ✅ Truy cập: `/admin/news` hoặc `/admin/faculty/news`
  - ✅ Dashboard: `/admin/faculty/dashboard`

---

## 📂 CẤU TRÚC ENDPOINT

### **Dành cho Super Admin**
```
GET  /admin/news               → Xem danh sách tất cả bài viết
GET  /admin/news?action=new    → Form tạo bài viết mới
GET  /admin/news?action=edit&id=X → Form chỉnh sửa bài viết
GET  /admin/news?action=delete&id=X → Xóa bài viết
POST /admin/news               → Tạo/cập nhật bài viết
```

### **Dành cho Faculty Admin**
```
GET  /admin/faculty/news                → Xem danh sách bài viết của khoa
GET  /admin/faculty/news?action=create  → Form tạo bài viết mới
GET  /admin/faculty/news?action=edit&id=X → Form chỉnh sửa bài viết
GET  /admin/faculty/news?action=delete&id=X → Xóa bài viết
POST /admin/faculty/news?action=create  → Tạo bài viết mới
POST /admin/faculty/news?action=update  → Cập nhật bài viết
```

**Lưu ý**: Faculty Admin cũng có thể truy cập `/admin/news` để xem/CRUD bài viết (hệ thống sẽ tự động lọc theo khoa).

---

## 🛠️ CÁC FILE ĐÃ CẬP NHẬT

### 1. **AdminAuthFilter.java**
- ✅ Cho phép `faculty_admin` truy cập `/admin/news`
- ✅ Cho phép `faculty_admin` truy cập `/admin/dashboard` (sẽ redirect đến `/admin/faculty/dashboard`)
- ✅ Cho phép truy cập `/upload-image` để upload ảnh cho CKEditor

```java
// Faculty Admin có thể truy cập:
- /admin/faculty/*
- /admin/news
- /admin/major
- /admin/dashboard
- /admin/upload-image
```

### 2. **DashboardServlet.java**
- ✅ Tự động redirect `faculty_admin` đến dashboard riêng của họ (`/admin/faculty/dashboard`)
- ✅ `super_admin` vẫn ở dashboard chính (`/admin/dashboard`)

### 3. **AdminNewsServlet.java**
- ✅ Xử lý CRUD cho CẢ 2 loại admin
- ✅ Tự động lọc bài viết theo `facultyId` nếu là `faculty_admin`
- ✅ Kiểm tra quyền sở hữu khi edit/delete

### 4. **FacultyNewsServlet.java**
- ✅ Xử lý CRUD riêng cho Faculty Admin
- ✅ Bảo mật: Chỉ cho phép thao tác với bài viết của khoa mình

### 5. **admin-sidebar.jsp**
- ✅ Cập nhật link "Bài viết" từ `/admin/posts` → `/admin/news`
- ✅ Hiển thị menu riêng cho từng loại admin

---

## 🚀 CÁCH SỬ DỤNG

### **Đối với Super Admin:**
1. Đăng nhập tại: `/admin/super/login`
   - Username: `super_admin`
   - Password: `admin123`

2. Sau khi đăng nhập, vào menu bên trái:
   - Click **"Bài viết"** → Xem tất cả bài viết
   - Click **"Tạo bài viết mới"** → Tạo bài viết

3. Có thể chọn khoa khi tạo/chỉnh sửa bài viết

### **Đối với Faculty Admin (Ví dụ: Khoa CNTT):**
1. Đăng nhập tại: `/admin/faculty/login`
   - Username: `cntt_admin`
   - Password: `cntt123`

2. Sau khi đăng nhập, vào menu bên trái:
   - Click **"Quản lý Bài viết"** → Xem bài viết của khoa CNTT
   - Click **"Tạo bài viết mới"** → Tạo bài viết cho khoa CNTT

3. Bài viết tự động gắn với khoa của admin đang đăng nhập

---

## 🔒 BẢO MẬT

### **Kiểm tra quyền tự động:**
1. Faculty Admin **KHÔNG THỂ**:
   - Xem bài viết của khoa khác
   - Chỉnh sửa bài viết của khoa khác
   - Xóa bài viết của khoa khác

2. Nếu cố tình truy cập bài viết không phải của mình:
   - Trả về lỗi 403 Forbidden

### **Ví dụ:**
```
Faculty Admin khoa CNTT (facultyId = 1) cố xóa bài viết của khoa Kế toán (facultyId = 4):
→ Hệ thống sẽ chặn và trả về lỗi 403
```

---

## 📊 DASHBOARD

### **Super Admin Dashboard:**
- Hiển thị thống kê tất cả bài viết
- Hiển thị tất cả các khoa
- Quản lý tất cả admin khoa

### **Faculty Admin Dashboard:**
- Hiển thị số bài viết của khoa
- Hiển thị số ngành của khoa
- Thống kê lượt xem bài viết của khoa

---

## 🎯 TEST THỬ

### **Test 1: Super Admin CRUD bài viết**
```
1. Đăng nhập: /admin/super/login (super_admin / admin123)
2. Vào: /admin/news
3. Click "Tạo bài viết mới"
4. Điền thông tin và chọn khoa → Submit
5. Kiểm tra danh sách bài viết
6. Chỉnh sửa và xóa bài viết
```

### **Test 2: Faculty Admin CRUD bài viết**
```
1. Đăng nhập: /admin/faculty/login (cntt_admin / cntt123)
2. Vào: /admin/faculty/news
3. Click "Tạo bài viết mới"
4. Điền thông tin → Submit (không cần chọn khoa, tự động gắn)
5. Kiểm tra danh sách bài viết (chỉ thấy bài của khoa CNTT)
6. Chỉnh sửa và xóa bài viết của khoa CNTT
```

### **Test 3: Faculty Admin cố truy cập bài viết khoa khác**
```
1. Đăng nhập với cntt_admin
2. Thử truy cập: /admin/news?action=edit&id=X (X là bài viết của khoa khác)
3. Kết quả mong đợi: Lỗi 403 hoặc redirect về danh sách
```

---

## ✅ CHECKLIST

- [x] Super Admin có thể xem tất cả bài viết
- [x] Super Admin có thể CRUD tất cả bài viết
- [x] Faculty Admin có thể xem bài viết của khoa mình
- [x] Faculty Admin có thể CRUD bài viết của khoa mình
- [x] Faculty Admin KHÔNG THỂ thao tác với bài viết của khoa khác
- [x] AuthFilter cho phép cả 2 loại admin truy cập `/admin/news`
- [x] Dashboard tự động redirect đúng theo role
- [x] Sidebar hiển thị đúng menu cho từng loại admin
- [x] Upload ảnh hoạt động cho cả 2 loại admin

---

## 📝 GHI CHÚ

- **Tất cả bài viết** đều có trường `facultyId` để xác định thuộc khoa nào
- Nếu `facultyId = NULL` → Bài viết chung của trường (chỉ Super Admin mới tạo được)
- Faculty Admin tự động có `facultyId` từ tài khoản của mình
- CKEditor và upload ảnh hoạt động bình thường cho cả 2 loại admin

---

## 🔧 NẾU GẶP LỖI

### Lỗi 404 khi truy cập `/admin/news`:
```bash
# Kiểm tra servlet mapping
- Đảm bảo AdminNewsServlet có @WebServlet("/admin/news")
- Rebuild project: mvnw.cmd clean compile
- Restart Tomcat
```

### Lỗi 403 Forbidden:
```bash
# Kiểm tra role và facultyId
- Faculty Admin phải có facultyId hợp lệ
- Bài viết phải thuộc khoa của admin
```

### Redirect loop:
```bash
# Kiểm tra filter
- AdminAuthFilter không được chặn các path cần thiết
- Dashboard servlet phải redirect đúng theo role
```

---

**Ngày cập nhật**: 11/12/2025
**Người thực hiện**: GitHub Copilot

