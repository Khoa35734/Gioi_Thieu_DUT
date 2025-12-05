# CẬP NHẬT DATABASE - 14 KHOA ĐẠI HỌC BÁCH KHOA ĐÀ NẴNG

**Ngày cập nhật:** 5/12/2025

## DANH SÁCH 14 KHOA (Theo thứ tự hiển thị trên website)

### Lưới 7×2 (7 cột, 2 hàng)

#### Hàng 1:
1. **Công nghệ Thông tin**
2. **Công nghệ Nhiệt - Điện lạnh**
3. **Cơ khí**
4. **Cơ khí Giao thông**
5. **Điện**
6. **Điện tử - Viễn thông**
7. **Hóa**

#### Hàng 2:
8. **Khoa học Công nghệ tiên tiến**
9. **Kiến trúc**
10. **Môi trường**
11. **Quản lý Dự án**
12. **Xây dựng Cầu - Đường**
13. **Xây dựng Công trình Thủy**
14. **Xây dựng Dân dụng & Công nghiệp**

---

## TÀI KHOẢN ADMIN CHO 14 KHOA

**Mật khẩu chung:** `khoa123`

| STT | Username | Khoa | Email |
|-----|----------|------|-------|
| 1 | admin_cntt | Công nghệ Thông tin | admin_cntt@dut.edu.vn |
| 2 | admin_nhiet | Công nghệ Nhiệt - Điện lạnh | admin_nhiet@dut.edu.vn |
| 3 | admin_cokhi | Cơ khí | admin_cokhi@dut.edu.vn |
| 4 | admin_cokhigt | Cơ khí Giao thông | admin_cokhigt@dut.edu.vn |
| 5 | admin_dien | Điện | admin_dien@dut.edu.vn |
| 6 | admin_dientu | Điện tử - Viễn thông | admin_dientu@dut.edu.vn |
| 7 | admin_hoa | Hóa | admin_hoa@dut.edu.vn |
| 8 | admin_khcntt | Khoa học Công nghệ tiên tiến | admin_khcntt@dut.edu.vn |
| 9 | admin_kientruc | Kiến trúc | admin_kientruc@dut.edu.vn |
| 10 | admin_moitruong | Môi trường | admin_moitruong@dut.edu.vn |
| 11 | admin_qlda | Quản lý Dự án | admin_qlda@dut.edu.vn |
| 12 | admin_cauduong | Xây dựng Cầu - Đường | admin_cauduong@dut.edu.vn |
| 13 | admin_thuy | Xây dựng Công trình Thủy | admin_thuy@dut.edu.vn |
| 14 | admin_xddd | Xây dựng Dân duyng & Công nghiệp | admin_xddd@dut.edu.vn |

**Tài khoản Super Admin:**
- Username: `superadmin`
- Password: `admin123`
- Email: superadmin@dut.edu.vn

---

## NGÀNH HỌC DEMO (Một số khoa)

### 1. Công nghệ Thông tin (4 ngành)
- CNTT01: Công Nghệ Phần Mềm
- CNTT02: Hệ Thống Thông Tin
- CNTT03: Khoa Học Máy Tính
- CNTT04: An Toàn Thông Tin

### 2. Công nghệ Nhiệt - Điện lạnh (2 ngành)
- NHIET01: Kỹ Thuật Nhiệt
- NHIET02: Kỹ Thuật Điện Lạnh

### 3. Cơ khí (2 ngành)
- CK01: Cơ Khí Chế Tạo Máy
- CK02: Cơ Điện Tử

### 4. Cơ khí Giao thông (2 ngành)
- CKGT01: Kỹ Thuật Ô Tô
- CKGT02: Công Nghệ Kỹ Thuật Giao Thông

### 5. Điện (2 ngành)
- DIEN01: Kỹ Thuật Điện
- DIEN02: Tự Động Hóa

### 6. Điện tử - Viễn thông (2 ngành)
- DTVT01: Điện Tử Viễn Thông
- DTVT02: Công Nghệ Đa Phương Tiện

### 12. Xây dựng Cầu - Đường (1 ngành)
- XD01: Kỹ Thuật Cầu Đường

### 14. Xây dựng Dân dụng & Công nghiệp (2 ngành)
- XDDD01: Xây Dựng Dân Dụng
- XDDD02: Xây Dựng Công Nghiệp

---

## BÀI VIẾT TIN TỨC DEMO

### Tin tức toàn trường (2 bài)
1. Trường ĐH Bách Khoa - ĐH Đà Nẵng khai giảng năm học 2024-2025
2. DUT đạt chứng nhận AUN-QA chu kỳ 2

### Tin tức các khoa (6 bài)
1. **Công nghệ Thông tin:** Sinh viên đạt giải Nhất ACM ICPC
2. **Công nghệ Thông tin:** Hội thảo AI và Machine Learning
3. **Công nghệ Nhiệt - Điện lạnh:** Ra mắt phòng thí nghiệm mới
4. **Cơ khí:** Giành giải Nhì cuộc thi Sáng tạo Kỹ thuật
5. **Điện:** Kí kết hợp tác với Schneider Electric
6. **Kiến trúc:** Triển lãm đồ án Kiến trúc năm 2024

---

## HƯỚNG DẪN CẬP NHẬT DATABASE

### Bước 1: Backup database cũ (nếu cần)
```sql
mysqldump -u root -p gioi_thieu_dut > backup_old.sql
```

### Bước 2: Drop database cũ và tạo mới
```sql
DROP DATABASE IF EXISTS gioi_thieu_dut;
CREATE DATABASE gioi_thieu_dut 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;
```

### Bước 3: Chạy schema.sql
```bash
mysql -u root -p gioi_thieu_dut < E:\Gioi_Thieu_DUT\database\schema.sql
```

Hoặc trong MySQL Workbench:
```sql
SOURCE E:/Gioi_Thieu_DUT/database/schema.sql;
```

### Bước 4: Chạy demo-data.sql
```bash
mysql -u root -p gioi_thieu_dut < E:\Gioi_Thieu_DUT\database\demo-data.sql
```

Hoặc trong MySQL Workbench:
```sql
SOURCE E:/Gioi_Thieu_DUT/database/demo-data.sql;
```

### Bước 5: Kiểm tra dữ liệu
```sql
USE gioi_thieu_dut;

-- Kiểm tra số lượng khoa (phải có 14)
SELECT COUNT(*) FROM faculty;

-- Kiểm tra danh sách khoa
SELECT id, name FROM faculty ORDER BY id;

-- Kiểm tra số lượng admin (phải có 15: 1 super + 14 khoa)
SELECT COUNT(*) FROM admin;

-- Kiểm tra admin theo khoa
SELECT a.username, a.full_name, f.name as faculty_name
FROM admin a
LEFT JOIN faculty f ON a.faculty_id = f.id
ORDER BY a.id;
```

---

## TEST TÀI KHOẢN ĐĂNG NHẬP

### Test đăng nhập admin khoa
Đăng nhập với bất kỳ tài khoản nào trong 14 khoa:
- URL: `http://localhost:8080/Gioi_Thieu_DUT_war_exploded/admin/login.jsp`
- Username: `admin_cntt` (hoặc bất kỳ username khoa nào)
- Password: `khoa123`

**Kết quả mong đợi:**
- Đăng nhập thành công
- Chuyển đến dashboard của khoa
- Chỉ thấy các ngành và bài viết của khoa mình
- Có quyền CRUD ngành và bài viết của khoa

### Test đăng nhập super admin
- URL: `http://localhost:8080/Gioi_Thieu_DUT_war_exploded/admin/login.jsp`
- Username: `superadmin`
- Password: `admin123`

**Kết quả mong đợi:**
- Đăng nhập thành công
- Chuyển đến dashboard super admin
- Thấy tất cả dữ liệu của tất cả khoa
- Có quyền CRUD tất cả

---

## KIỂM TRA GIAO DIỆN TRANG CHỦ

Truy cập: `http://localhost:8080/Gioi_Thieu_DUT_war_exploded/`

**Kiểm tra phần "Các Khoa - Viện Đào Tạo":**
- ✅ Hiển thị lưới 7×2 (14 ô vuông)
- ✅ Mỗi ô là hình vuông (aspect ratio 1:1)
- ✅ Hover vào ô → phóng to + highlight
- ✅ Click/hover → hiển thị thông tin khoa bên phải
- ✅ Nút "Xem chi tiết" dẫn đến trang khoa

---

## CẤU TRÚC RESPONSIVE

### Desktop (≥ 992px)
- Lưới 7 cột × 2 hàng
- Hiển thị đầy đủ 14 khoa

### Tablet (< 992px)
- Lưới 4 cột × 4 hàng (hàng cuối 2 ô)
- Hiển thị đầy đủ 14 khoa

### Mobile (< 576px)
- Lưới 3 cột × 5 hàng (hàng cuối 2 ô)
- Hiển thị đầy đủ 14 khoa

---

## GHI CHÚ QUAN TRỌNG

### 1. Quyền truy cập
- **Super Admin:** Quản lý tất cả (CRUD khoa, admin, ngành, bài viết)
- **Faculty Admin:** Chỉ CRUD ngành và bài viết của khoa mình

### 2. Thêm khoa mới
Khi super admin thêm khoa mới:
- Tự động tạo tài khoản admin cho khoa đó
- Admin khoa có thể đăng nhập ngay

### 3. Logo khoa
- Mỗi khoa nên có logo riêng (file ảnh)
- Lưu tại: `uploads/faculty-logos/`
- Định dạng: PNG hoặc JPG
- Kích thước đề xuất: 200×200px

### 4. Màu sắc
- Primary color: #005FB7 (xanh dương DUT)
- Border color: #dee2e6
- Hover: transform scale(1.05)

---

## TROUBLESHOOTING

### Lỗi: Không hiển thị 14 khoa
**Nguyên nhân:** Database chưa được cập nhật
**Giải pháp:** 
1. Chạy lại schema.sql và demo-data.sql
2. Restart Tomcat
3. Clear browser cache

### Lỗi: Đăng nhập admin khoa bị 404
**Nguyên nhân:** Session hoặc routing không đúng
**Giải pháp:**
1. Kiểm tra AdminAuthFilter
2. Kiểm tra DashboardServlet mapping
3. Kiểm tra faculty_id trong session

### Lỗi: Layout không đúng (không phải 7×2)
**Nguyên nhân:** CSS chưa được cập nhật
**Giải pháp:**
1. Kiểm tra section-program.jsp
2. Xác nhận grid-template-columns: repeat(7, 1fr)
3. Clear browser cache và reload

---

## LIÊN HỆ HỖ TRỢ

Nếu gặp vấn đề khi cập nhật database, vui lòng kiểm tra:
1. MySQL service đang chạy
2. Database connection trong DBConnection.java
3. Quyền truy cập MySQL user
4. Character set: utf8mb4

---

**Cập nhật cuối:** 5/12/2025
**Phiên bản:** 2.0 - DUT 14 Faculties

