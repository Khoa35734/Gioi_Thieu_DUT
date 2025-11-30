# 🔧 HƯỚNG DẪN SỬA LỖI 404 - ADMIN DASHBOARD

## ⚠️ Vấn đề
Khi đăng nhập vào hệ thống admin, bị lỗi **HTTP ERROR 404** khi truy cập:
```
http://localhost:8080/Gioi_Thieu_DUT_war_exploded/admin/dashboard
```

## 🔍 Nguyên nhân
Các servlet đã được code nhưng **chưa được compile và deploy** vào Tomcat đúng cách.

## ✅ GIẢI PHÁP - Làm theo thứ tự

### Bước 1: Rebuild Project
```bash
# Mở Command Prompt tại thư mục dự án
cd E:\Gioi_Thieu_DUT

# Clean và build lại project
mvnw.cmd clean package
```

**Chờ đến khi thấy**: `BUILD SUCCESS`

### Bước 2: Kiểm tra file WAR đã tạo
```bash
# Kiểm tra file WAR
dir target\Gioi_Thieu_DUT-1.0-SNAPSHOT.war
```

### Bước 3: Dừng Tomcat
- Vào IntelliJ IDEA
- Nhấn nút **STOP** (hình vuông đỏ) ở tab Run
- Hoặc: Window > Show View > Servers > Click phải Tomcat > Stop

### Bước 4: Clean Tomcat Deployment
Xóa các file deploy cũ:
```bash
# Xóa thư mục deploy cũ
rmdir /s /q "C:\Users\Khoa\AppData\Local\JetBrains\IntelliJIdea2024.3\tomcat\Unnamed_Gioi_Thieu_DUT\work"
rmdir /s /q "C:\Users\Khoa\AppData\Local\JetBrains\IntelliJIdea2024.3\tomcat\Unnamed_Gioi_Thieu_DUT\webapps\Gioi_Thieu_DUT_war_exploded"
```

### Bước 5: Redeploy trong IntelliJ IDEA
1. **Run** > **Edit Configurations**
2. Chọn **Tomcat configuration**
3. Tab **Deployment**, nhấn nút **+** 
4. Chọn **Artifact** > `Gioi_Thieu_DUT:war exploded`
5. **Context path**: `/Gioi_Thieu_DUT_war_exploded`
6. Nhấn **OK**

### Bước 6: Start Tomcat
- Nhấn nút **▶ Run** (mũi tên xanh)
- Đợi Tomcat khởi động xong

### Bước 7: Test
Truy cập các URL sau để kiểm tra:

1. **Test Servlet cơ bản**:
   ```
   http://localhost:8080/Gioi_Thieu_DUT_war_exploded/test
   ```
   ✅ Phải thấy: "✅ Servlet hoạt động OK!"

2. **Trang chọn loại admin**:
   ```
   http://localhost:8080/Gioi_Thieu_DUT_war_exploded/admin/
   ```

3. **Login Super Admin**:
   ```
   http://localhost:8080/Gioi_Thieu_DUT_war_exploded/admin/super/login
   ```
   - Username: `superadmin`
   - Password: `admin123`

4. **Login Faculty Admin**:
   ```
   http://localhost:8080/Gioi_Thieu_DUT_war_exploded/admin/faculty/login
   ```
   - Username: `admin_cntt` (hoặc admin_cokhi, admin_dien, admin_xaydung)
   - Password: `khoa123`

---

## 🔐 Tài khoản Admin mẫu

### Super Admin (Quản trị tổng)
- **Username**: `superadmin`
- **Password**: `admin123`
- **Quyền**: Quản lý toàn bộ hệ thống

### Faculty Admin (Quản trị khoa)
- **Username**: `admin_cntt` | **Password**: `khoa123` | **Khoa**: Công nghệ Thông tin
- **Username**: `admin_cokhi` | **Password**: `khoa123` | **Khoa**: Cơ Khí
- **Username**: `admin_dien` | **Password**: `khoa123` | **Khoa**: Điện
- **Username**: `admin_xaydung` | **Password**: `khoa123` | **Khoa**: Xây Dựng

---

## 🐛 Nếu vẫn lỗi 404

### Kiểm tra 1: Servlet đã compile?
```bash
dir target\classes\controller\*.class
```
✅ Phải thấy các file: `DashboardServlet.class`, `SuperAdminLoginServlet.class`, v.v.

### Kiểm tra 2: Database đã import?
```bash
mysql -u root -pkhoakhoa04 gioi_thieu_dut -e "SELECT COUNT(*) FROM admin;"
```
✅ Phải thấy: `5` (1 super admin + 4 faculty admin)

### Kiểm tra 3: Tomcat logs
Xem file log:
```
C:\Users\Khoa\AppData\Local\JetBrains\IntelliJIdea2024.3\tomcat\Unnamed_Gioi_Thieu_DUT\logs\catalina.out
```

Tìm dòng có chữ `@WebServlet("/admin/dashboard")` hoặc lỗi `ClassNotFoundException`.

### Kiểm tra 4: MySQL đang chạy?
```bash
mysql -u root -pkhoakhoa04 -e "SELECT VERSION();"
```

---

## 📁 Cấu trúc URL Mapping

| Servlet | URL Path | Chức năng |
|---------|----------|-----------|
| `AdminLoginServlet` | `/admin/login` | Login chung (phân loại role) |
| `SuperAdminLoginServlet` | `/admin/super/login` | Login Super Admin |
| `FacultyAdminLoginServlet` | `/admin/faculty/login` | Login Faculty Admin |
| `DashboardServlet` | `/admin/dashboard` | Dashboard Super Admin |
| `FacultyDashboardServlet` | `/admin/faculty/dashboard` | Dashboard Faculty Admin |
| `AdminLogoutServlet` | `/admin/logout` | Đăng xuất |
| `TestServlet` | `/test` | Test servlet cơ bản |

---

## 🔄 Quy trình đăng nhập

### Super Admin:
1. Truy cập: `/admin/super/login`
2. Nhập: `superadmin` / `admin123`
3. Redirect: `/admin/dashboard` (Dashboard Super Admin)

### Faculty Admin:
1. Truy cập: `/admin/faculty/login`
2. Nhập: `admin_cntt` / `khoa123`
3. Redirect: `/admin/faculty/dashboard` (Dashboard Faculty Admin)

---

## 🎯 Checklist hoàn chỉnh

- [ ] Database `gioi_thieu_dut` đã tạo
- [ ] Import `schema.sql` thành công
- [ ] Import `demo-data.sql` thành công
- [ ] Chạy `mvnw.cmd clean package` thành công
- [ ] File WAR đã được tạo trong `target/`
- [ ] Tomcat đã stop và clean deployment
- [ ] Tomcat đã start lại
- [ ] Test servlet `/test` hoạt động
- [ ] Login Super Admin thành công
- [ ] Dashboard hiển thị đúng

---

## 💡 Lưu ý quan trọng

1. **Port MySQL**: Mặc định `3306`, nếu khác thì sửa trong `DBConnection.java`
2. **Password MySQL**: Hiện tại là `khoakhoa04`, sửa trong `DBConnection.java` nếu khác
3. **Tomcat Port**: Mặc định `8080`, nếu khác thì đổi URL
4. **Context Path**: Phải khớp với IntelliJ deployment settings

---

## 📞 Troubleshooting

### Lỗi: `ClassNotFoundException: com.mysql.cj.jdbc.Driver`
**Giải pháp**: Thêm dependency MySQL trong `pom.xml`:
```xml
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>8.0.33</version>
</dependency>
```

### Lỗi: `SQLException: Access denied for user 'root'`
**Giải pháp**: Kiểm tra lại password MySQL trong `DBConnection.java`

### Lỗi: `Cannot find admin in session`
**Giải pháp**: Clear browser cookies và đăng nhập lại

---

Chúc bạn fix lỗi thành công! 🎉
