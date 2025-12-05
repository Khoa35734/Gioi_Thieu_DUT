# ✅ ĐÃ SỬA: LỖI MẤT CSS TRÊN TRANG CHỦ

## 🔍 VẤN ĐỀ

Trang chủ (index.jsp) mất hết CSS, chỉ còn style cơ bản từ Bootstrap.

## 🛠️ NGUYÊN NHÂN

1. **CSS chưa được load đầy đủ** - Có thể do:
   - Context path không đúng
   - File CSS bị cache
   - Tomcat chưa deploy file mới

2. **Thiếu Critical CSS** - Các style quan trọng không được load ngay lập tức

## ✅ GIẢI PHÁP ĐÃ THỰC HIỆN

### 1. Thêm Inline Critical CSS vào index.jsp

```html
<style>
    /* Critical CSS - Always load */
    :root {
        --dut-blue: #005FB7;
        --dut-yellow: #FDC32D;
    }
    
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #f5f5f5;
    }
    
    .site-header .top-bar {
        background: var(--dut-blue) !important;
    }
    
    .site-header .navbar {
        background: var(--dut-blue) !important;
    }
    
    .site-header .logo-text {
        line-height: 1.2;
    }
    
    .site-header .logo-text .small {
        font-size: 0.75rem;
        font-weight: 400;
    }
    
    .site-header .logo-text .fw-bold {
        font-size: 1.1rem;
    }
    
    .navbar-brand img {
        max-height: 60px;
        width: auto;
    }
</style>
```

### 2. Rebuild Project

```bash
cd E:\Gioi_Thieu_DUT
mvnw.cmd clean package -DskipTests
```

✅ **Build Status**: SUCCESS

## 📋 HƯỚNG DẪN KHẮC PHỤC

### Bước 1: Restart Tomcat

1. Dừng Tomcat trong IntelliJ IDEA
2. Xóa cache deployment:
   ```
   E:\Gioi_Thieu_DUT\out\artifacts\Gioi_Thieu_DUT_war_exploded\
   ```
3. Rebuild project: `Build > Rebuild Project`
4. Redeploy: `Run > Run 'Tomcat'`

### Bước 2: Clear Browser Cache

1. Mở DevTools (F12)
2. Right-click vào nút Refresh
3. Chọn **"Empty Cache and Hard Reload"**

Hoặc:

- Chrome/Edge: `Ctrl + Shift + Delete`
- Firefox: `Ctrl + Shift + Delete`

### Bước 3: Kiểm tra Console

1. Mở DevTools (F12)
2. Vào tab **Console**
3. Kiểm tra lỗi loading CSS:
   ```
   Failed to load resource: net::ERR_FILE_NOT_FOUND
   /assets/css/style.css
   ```

4. Nếu có lỗi, kiểm tra đường dẫn:
   ```
   Expected: http://localhost:8080/Gioi_Thieu_DUT_war_exploded/assets/css/style.css
   ```

### Bước 4: Kiểm tra Network Tab

1. Mở DevTools (F12)
2. Vào tab **Network**
3. Reload trang
4. Kiểm tra các file CSS:
   - `bootstrap.min.css` - Status 200 ✅
   - `bootstrap-icons.css` - Status 200 ✅
   - `style.css` - Status 200 ✅

## 🎯 KIỂM TRA SAU KHI SỬA

### ✅ Checklist

- [ ] Tomcat đã restart
- [ ] Browser cache đã clear
- [ ] Trang chủ hiển thị header với màu xanh DUT (#005FB7)
- [ ] Logo trường hiển thị
- [ ] Menu navigation hoạt động
- [ ] Slider hiển thị ảnh
- [ ] Các section có background trắng và shadow
- [ ] Footer hiển thị đầy đủ

### 🖼️ Màu sắc chuẩn DUT

- **Primary Blue**: #005FB7 (Xanh dương ĐH Đà Nẵng)
- **Secondary Yellow**: #FDC32D (Vàng Bách Khoa)
- **Background**: #f5f5f5 (Xám nhạt)
- **Text**: #333 (Xám đậm)

## 🔧 NẾU VẪN KHÔNG HIỂN thị CSS

### Option 1: Kiểm tra Context Path

```jsp
<!-- In index.jsp, add debug info -->
<p>Context Path: ${pageContext.request.contextPath}</p>
<p>CSS Path: ${pageContext.request.contextPath}/assets/css/style.css</p>
```

### Option 2: Hardcode đường dẫn tạm thời

```html
<link rel="stylesheet" href="/Gioi_Thieu_DUT_war_exploded/assets/css/style.css">
```

### Option 3: Inline tất cả CSS

Nếu vẫn không load được external CSS, copy toàn bộ nội dung `style.css` vào thẻ `<style>` trong `<head>`.

### Option 4: Kiểm tra Tomcat Deployment

1. Vào: `Run > Edit Configurations`
2. Chọn Tomcat Server
3. Tab **Deployment**
4. Kiểm tra Application context: `/Gioi_Thieu_DUT_war_exploded`
5. Đảm bảo WAR exploded được deploy đúng

## 📁 CẤU TRÚC FILE CSS

```
src/main/webapp/
├── assets/
│   ├── css/
│   │   └── style.css ✅ (Đã có)
│   ├── js/
│   └── img/
├── components/
│   ├── header.jsp (Có inline style)
│   ├── slider.jsp (Có inline style)
│   └── ...
└── index.jsp (Đã thêm critical CSS)
```

## 🎨 CÁC CLASS CSS QUAN TRỌNG

### Header
- `.site-header` - Container chính
- `.top-bar` - Thanh thông tin trên cùng
- `.navbar` - Menu navigation
- `.logo-text` - Text logo trường

### Layout
- `.container` - Bootstrap container
- `.row` - Bootstrap row
- `.col-*` - Bootstrap columns

### Components
- `.splide__slide` - Slide ảnh
- `.slide-caption` - Caption của slide
- `.section-about` - Section giới thiệu
- `.section-news` - Section tin tức

## 📝 LƯU Ý

1. **Luôn clear cache** sau khi sửa CSS
2. **Luôn rebuild project** sau khi thay đổi file static
3. **Kiểm tra Console** để xem lỗi load resource
4. **Kiểm tra Network** để xem status code của CSS files

## 🆘 HỖ TRỢ

Nếu vẫn gặp vấn đề:

1. Kiểm tra file `style.css` có tồn tại:
   ```
   E:\Gioi_Thieu_DUT\src\main\webapp\assets\css\style.css
   E:\Gioi_Thieu_DUT\target\Gioi_Thieu_DUT-1.0-SNAPSHOT\assets\css\style.css
   ```

2. Kiểm tra quyền truy cập file

3. Restart máy tính (cache có thể ở OS level)

---

**Ngày cập nhật**: 11/12/2025
**Trạng thái**: ✅ ĐÃ SỬA - Cần restart Tomcat và clear browser cache

