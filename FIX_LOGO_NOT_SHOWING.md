# 🔧 SỬA LỖI: LOGO KHÔNG HIỂN THỊ

## ✅ File logo đã có: `logo-dut.jpg`

Vị trí: `E:\Gioi_Thieu_DUT\src\main\webapp\assets\img\logo-dut.jpg`

---

## 🔍 CÁCH KIỂM TRA

### Bước 1: Test trực tiếp URL của logo

Mở trình duyệt và truy cập:
```
http://localhost:8080/Gioi_Thieu_DUT_war_exploded/assets/img/logo-dut.jpg
```

**KẾT QUẢ:**
- ✅ **Nếu hiển thị ảnh:** Logo OK, vấn đề là đường dẫn trong code
- ❌ **Nếu lỗi 404:** Logo chưa được deploy đúng

### Bước 2: Test trang kiểm tra

Truy cập trang test:
```
http://localhost:8080/Gioi_Thieu_DUT_war_exploded/test-logo.html
```

Trang này sẽ hiển thị logo với 3 cách đường dẫn khác nhau để kiểm tra.

---

## 🛠️ GIẢI PHÁP

### Giải pháp 1: Hard Refresh Browser (Thử đầu tiên)

**Windows:**
- Chrome/Edge: `Ctrl + Shift + R`
- Firefox: `Ctrl + F5`

**Mac:**
- Chrome/Edge: `Cmd + Shift + R`
- Firefox: `Cmd + Shift + R`

### Giải pháp 2: Clear Browser Cache

**Chrome/Edge:**
1. Nhấn `F12` để mở DevTools
2. Click chuột phải vào nút Reload
3. Chọn "Empty Cache and Hard Reload"

**Firefox:**
1. Nhấn `Ctrl + Shift + Delete`
2. Chọn "Cache"
3. Click "Clear Now"

### Giải pháp 3: Restart Tomcat

1. Stop Tomcat server trong IntelliJ IDEA
2. Chờ 5 giây
3. Start Tomcat server lại
4. Truy cập trang web
5. Hard refresh: `Ctrl + Shift + R`

### Giải pháp 4: Rebuild & Redeploy

```bash
cd E:\Gioi_Thieu_DUT
mvnw.cmd clean package
```

Sau đó:
1. Undeploy application trong Tomcat
2. Deploy lại
3. Restart Tomcat
4. Hard refresh browser

### Giải pháp 5: Kiểm tra Console

1. Nhấn `F12` để mở DevTools
2. Chọn tab "Console"
3. Refresh trang
4. Tìm lỗi liên quan đến logo (màu đỏ)

**Các lỗi thường gặp:**
- `404 Not Found` → File không tồn tại hoặc đường dẫn sai
- `403 Forbidden` → Không có quyền truy cập file
- `CORS error` → Vấn đề về cross-origin (ít gặp)

### Giải pháp 6: Kiểm tra file có bị lỗi không

Thử mở file `logo-dut.jpg` bằng Windows Photo Viewer hoặc Paint:
```
E:\Gioi_Thieu_DUT\src\main\webapp\assets\img\logo-dut.jpg
```

Nếu không mở được → File bị lỗi, cần tải lại.

---

## 🔍 DEBUG CHI TIẾT

### Kiểm tra Network Tab

1. Nhấn `F12`
2. Chọn tab "Network"
3. Refresh trang (`F5`)
4. Tìm request `logo-dut.jpg` trong danh sách
5. Click vào request đó

**Kiểm tra:**
- Status Code: Phải là `200 OK`
- Preview: Phải hiển thị ảnh
- Response Headers: Phải có `Content-Type: image/jpeg`

### Nếu Status Code = 404

**URL request là gì?**
- Click vào request `logo-dut.jpg`
- Xem "Request URL"

**So sánh với đường dẫn đúng:**
```
ĐÚNG: http://localhost:8080/Gioi_Thieu_DUT_war_exploded/assets/img/logo-dut.jpg
SAI:   http://localhost:8080/assets/img/logo-dut.jpg (thiếu context path)
```

### Nếu Status Code = 200 nhưng không hiển thị

**Vấn đề:** CSS hoặc HTML bị lỗi

**Kiểm tra trong DevTools:**
1. Tab "Elements"
2. Tìm thẻ `<img>` của logo
3. Xem style nào đang được áp dụng
4. Có thể CSS `display: none` hoặc `visibility: hidden`

---

## 🎯 KIỂM TRA NHANH

### Thử code này trong Console (F12)

```javascript
// Test 1: Kiểm tra ảnh có load được không
var img = new Image();
img.onload = function() {
    console.log("✅ Logo loaded successfully!");
    console.log("Width:", this.width, "Height:", this.height);
};
img.onerror = function() {
    console.log("❌ Logo failed to load!");
};
img.src = "/Gioi_Thieu_DUT_war_exploded/assets/img/logo-dut.jpg";

// Test 2: Kiểm tra context path
console.log("Context path:", "${pageContext.request.contextPath}");
```

---

## 📋 CHECKLIST

Đi qua từng bước:

- [ ] File `logo-dut.jpg` tồn tại trong `src/main/webapp/assets/img/`
- [ ] File `logo-dut.jpg` tồn tại trong `target/.../assets/img/`
- [ ] File `logo-dut.jpg` tồn tại trong `out/artifacts/.../assets/img/`
- [ ] Truy cập trực tiếp URL logo được (200 OK)
- [ ] Đã hard refresh browser (`Ctrl + Shift + R`)
- [ ] Đã clear browser cache
- [ ] Đã restart Tomcat
- [ ] Đã rebuild project
- [ ] Kiểm tra Console không có lỗi 404
- [ ] Kiểm tra Network tab thấy request logo

---

## 💡 NGUYÊN NHÂN THƯỜNG GẶP

### 1. Browser Cache (90% trường hợp)
**Triệu chứng:** Logo không hiển thị ngay cả khi URL trực tiếp OK  
**Giải pháp:** Hard refresh `Ctrl + Shift + R`

### 2. Tomcat chưa reload (5% trường hợp)
**Triệu chứng:** URL trực tiếp 404, nhưng file đã có  
**Giải pháp:** Restart Tomcat

### 3. File lỗi hoặc không đúng format (3% trường hợp)
**Triệu chứng:** Request 200 OK nhưng không hiển thị  
**Giải pháp:** Kiểm tra file bằng photo viewer, tải lại nếu cần

### 4. Context path sai (2% trường hợp)
**Triệu chứng:** 404 với URL path không đúng  
**Giải pháp:** Kiểm tra `${pageContext.request.contextPath}`

---

## 🚀 GIẢI PHÁP NHANH NHẤT

**Làm theo thứ tự này:**

1. **Hard refresh:** `Ctrl + Shift + R` (5 giây)
2. **Test URL trực tiếp:** http://localhost:8080/Gioi_Thieu_DUT_war_exploded/assets/img/logo-dut.jpg (10 giây)
3. **Restart Tomcat** (30 giây)
4. **Hard refresh lại** (5 giây)

**Tổng thời gian: < 1 phút**

Nếu vẫn không được, đọc phần Debug chi tiết ở trên.

---

**Cập nhật:** 5/12/2025 13:57  
**Build status:** ✅ SUCCESS  
**Logo file:** ✅ EXISTS

