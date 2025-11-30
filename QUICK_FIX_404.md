# 🚀 SỬA LỖI 404 DASHBOARD - HƯỚNG DẪN NHANH

## ⚡ Làm theo 3 bước này:

### Bước 1: Rebuild Project
```cmd
cd E:\Gioi_Thieu_DUT
mvnw.cmd clean package
```
⏳ Đợi đến khi thấy **BUILD SUCCESS**

### Bước 2: Restart Tomcat trong IntelliJ
1. Nhấn nút **STOP** (hình vuông đỏ)
2. Nhấn nút **▶ Run** (mũi tên xanh)
3. Đợi Tomcat khởi động xong

### Bước 3: Test từng bước
Truy cập trang test chính:
```
http://localhost:8080/Gioi_Thieu_DUT_war_exploded/test-admin.jsp
```

Trang này có **5 nút test** theo thứ tự:
1. ✅ **Test Servlet** - Kiểm tra servlet cơ bản
2. 🔌 **Test Database** - Kiểm tra kết nối MySQL
3. 🏠 **Admin Portal** - Trang chọn loại admin
4. 🔵 **Login Super Admin** - Đăng nhập Super Admin
5. 🟡 **Login Faculty Admin** - Đăng nhập Faculty Admin

---

## 🔐 Tài khoản test

### Super Admin
- **Username**: `superadmin`
- **Password**: `admin123`
- **Sau login**: → `/admin/dashboard`

### Faculty Admin
- **Username**: `admin_cntt`
- **Password**: `khoa123`
- **Sau login**: → `/admin/faculty/dashboard`

---

## ❌ Nếu vẫn lỗi 404

### Kiểm tra 1: Servlet đã compile?
```cmd
dir target\classes\controller\DashboardServlet.class
```
✅ File phải tồn tại

### Kiểm tra 2: Database có dữ liệu?
```cmd
mysql -u root -pkhoakhoa04 gioi_thieu_dut -e "SELECT username FROM admin;"
```
✅ Phải thấy: superadmin, admin_cntt, v.v.

### Kiểm tra 3: MySQL có chạy?
```cmd
mysql -u root -pkhoakhoa04 -e "SELECT VERSION();"
```

---

## 📱 Liên hệ

Nếu vẫn không được, gửi cho tôi:
1. Screenshot lỗi trong browser
2. Screenshot Tomcat log trong IntelliJ (tab Console)
3. Kết quả của lệnh: `dir target\classes\controller\*.class`

---

**Lưu ý**: Nếu password MySQL của bạn **KHÔNG phải** `khoakhoa04`, sửa trong file:
```
src/main/java/utils/DBConnection.java
```
Dòng 12: `private static final String PASSWORD = "khoakhoa04";`

Thay `khoakhoa04` bằng password thật của bạn, sau đó rebuild lại (Bước 1).
