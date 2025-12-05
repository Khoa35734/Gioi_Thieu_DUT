# ✅ CẬP NHẬT HEADER - LOGO VÀ TEXT LAYOUT

## 🎯 Thay đổi đã thực hiện

### 1. **Cập nhật cấu trúc Header**
✅ **File:** `src/main/webapp/components/header.jsp`

#### Thay đổi:
- ✅ **Đảo vị trí text:**
  - **Trước:** "TRƯỜNG ĐẠI HỌC BÁCH KHOA" (to) + "Đại học Đà Nẵng" (nhỏ)
  - **Sau:** "Đại học Đà Nẵng" (nhỏ, viết hoa) + "TRƯỜNG ĐẠI HỌC BÁCH KHOA" (to)

- ✅ **Tăng kích thước logo:**
  - **Trước:** height="50px"
  - **Sau:** height="60px"

- ✅ **Thêm styling CSS:**
  - Text "Đại học Đà Nẵng" có `text-uppercase` và `letter-spacing`
  - Logo có hiệu ứng hover (scale 1.05)
  - Điều chỉnh line-height và spacing

### 2. **Layout mới**

```
┌─────────────┬──────────────────────────────────────┐
│             │  Đại học Đà Nẵng (nhỏ, viết hoa)    │
│  LOGO 60px  │  TRƯỜNG ĐẠI HỌC BÁCH KHOA (to, đậm)│
│             │                                       │
└─────────────┴──────────────────────────────────────┘
```

### 3. **CSS đã thêm**

```css
.site-header .navbar-brand .logo-text {
    line-height: 1.2;
}

.site-header .navbar-brand .logo-text .small {
    font-size: 0.75rem;
    letter-spacing: 0.5px;
    opacity: 0.95;
}

.site-header .navbar-brand .logo-text .fs-5 {
    font-size: 1.1rem !important;
    letter-spacing: 0.5px;
}

.site-header .navbar-brand img {
    transition: transform 0.3s ease;
}

.site-header .navbar-brand:hover img {
    transform: scale(1.05);
}
```

---

## 📁 File Logo

### Vị trí
```
E:\Gioi_Thieu_DUT\src\main\webapp\assets\img\logo-dut.png
```

### Yêu cầu kỹ thuật
- **Tên file:** `logo-dut.png`
- **Định dạng:** PNG (nền trong suốt khuyến nghị) hoặc JPG
- **Kích thước:** 200x200px hoặc tỷ lệ vuông (1:1)
- **Dung lượng:** < 100KB
- **Nội dung:** Logo chính thức của Trường ĐH Bách Khoa - ĐH Đà Nẵng

### Lấy logo từ đâu?
1. **Website chính thức:** https://dut.udn.vn
2. **Phòng truyền thông** của trường
3. **Tài liệu nhận diện thương hiệu** của DUT

### Lưu ý
- Nếu chưa có file logo, header vẫn hoạt động bình thường (chỉ hiển thị text)
- Thuộc tính `onerror="this.style.display='none'"` sẽ tự động ẩn ảnh nếu không tìm thấy file

---

## 🧪 Kiểm tra sau khi cập nhật

### 1. Không có logo
- ✅ Header chỉ hiển thị text
- ✅ Layout vẫn đẹp, không bị lỗi

### 2. Có logo
- ✅ Logo hiển thị bên trái (60px cao)
- ✅ Text bên phải với:
  - Dòng 1: "Đại học Đà Nẵng" (nhỏ, viết hoa)
  - Dòng 2: "TRƯỜNG ĐẠI HỌC BÁCH KHOA" (to, đậm)
- ✅ Hover vào logo → phóng to nhẹ

### 3. Responsive
- ✅ Desktop: Logo + Text ngang hàng
- ✅ Mobile: Logo thu nhỏ, text vẫn rõ ràng

---

## 🚀 Áp dụng thay đổi

### Cách 1: Restart Tomcat (Khuyến nghị)
1. Stop Tomcat server
2. Start Tomcat server
3. Truy cập: `http://localhost:8080/Gioi_Thieu_DUT_war_exploded/`
4. Refresh page (F5 hoặc Ctrl+F5)

### Cách 2: Rebuild project
```bash
cd E:\Gioi_Thieu_DUT
mvnw.cmd clean package
```
Sau đó restart Tomcat

### Cách 3: Chỉ clear cache
- Truy cập trang web
- Nhấn `Ctrl + Shift + R` (hard refresh)
- Hoặc clear browser cache

---

## 📸 Kết quả mong đợi

### Trước khi cập nhật:
```
[LOGO] TRƯỜNG ĐẠI HỌC BÁCH KHOA
       Đại học Đà Nẵng
```

### Sau khi cập nhật:
```
[LOGO] Đại học Đà Nẵng
       TRƯỜNG ĐẠI HỌC BÁCH KHOA
```

---

## 📝 Ghi chú

### File đã cập nhật
1. ✅ `src/main/webapp/components/header.jsp` (source)
2. ✅ `out/artifacts/Gioi_Thieu_DUT_war_exploded/components/header.jsp` (deployed)
3. ✅ Tạo `assets/img/README_LOGO.md` (hướng dẫn logo)

### Tương thích
- ✅ Bootstrap 5.x
- ✅ Responsive trên mọi thiết bị
- ✅ Tương thích tất cả trình duyệt hiện đại

### Bước tiếp theo
1. **Thêm file logo** vào `assets/img/logo-dut.png`
2. **Restart Tomcat** để xem thay đổi
3. **Test responsive** trên mobile/tablet
4. **Kiểm tra hover effect** trên logo

---

## 🔧 Troubleshooting

### Logo không hiển thị
**Nguyên nhân:** File logo chưa tồn tại hoặc đường dẫn sai
**Giải pháp:**
1. Kiểm tra file `logo-dut.png` có trong `assets/img/` chưa
2. Đảm bảo tên file chính xác: `logo-dut.png` (không phải `logo-DUT.png`)
3. Kiểm tra quyền đọc file

### Text bị lệch
**Nguyên nhân:** CSS chưa được load
**Giải pháp:**
1. Hard refresh: `Ctrl + Shift + R`
2. Clear browser cache
3. Kiểm tra Console (F12) xem có lỗi CSS không

### Mobile hiển thị lỗi
**Nguyên nhân:** Logo quá to
**Giải pháp:**
1. Giảm `height="60"` xuống `height="50"` trong responsive CSS
2. Hoặc thêm media query để điều chỉnh kích thước logo trên mobile

---

**Cập nhật:** 5/12/2025  
**Status:** ✅ HOÀN TẤT  
**Version:** 1.0

