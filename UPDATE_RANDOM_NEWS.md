# ✅ CẬP NHẬT: HIỂN THỊ TIN TỨC NGẪU NHIÊN TỪ TẤT CẢ CÁC KHOA

## 🎯 YÊU CẦU

Ở mục **"HOẠT ĐỘNG NỔI BẬT"** trên trang chủ:
1. ✅ Hiển thị tin tức random ngẫu nhiên từ admin trường và admin các khoa
2. ✅ Nếu bài viết có ảnh thì hiển thị ảnh
3. ✅ Nếu không có ảnh thì ẩn phần ảnh, chỉ hiển thị nội dung

## 📝 CÁC THAY ĐỔI ĐÃ THỰC HIỆN

### 1. NewsDAO.java - Thêm phương thức lấy tin ngẫu nhiên

**File**: `E:\Gioi_Thieu_DUT\src\main\java\dao\NewsDAO.java`

```java
/**
 * Get random news from all faculties (for homepage featured section)
 * Randomly selects news from both super admin and faculty admins
 */
public List<News> getRandomNews(int limit) {
    List<News> newsList = new ArrayList<>();
    String sql = BASE_SELECT + "ORDER BY RAND() LIMIT ?";
    
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        
        stmt.setInt(1, limit);
        try (ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                newsList.add(extractNewsFromResultSet(rs));
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return newsList;
}
```

**Chức năng**:
- Lấy tin tức ngẫu nhiên từ database
- Sử dụng `ORDER BY RAND()` để random
- Lấy từ TẤT CẢ các khoa (faculty_admin) và tin trường (super_admin)

---

### 2. HomeServlet.java - Sử dụng random news

**File**: `E:\Gioi_Thieu_DUT\src\main\java\controller\HomeServlet.java`

```java
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    // Get random news from all faculties for featured section (limit 6)
    List<News> newsList = newsDAO.getRandomNews(6);
    request.setAttribute("newsList", newsList);
    
    // Get all faculties and set as attribute
    List<Faculty> faculties = facultyDAO.getAllFaculties();
    request.setAttribute("faculties", faculties);
    
    // Forward to the main index page
    request.getRequestDispatcher("/index.jsp").forward(request, response);
}
```

**Thay đổi**:
- Trước: `newsDAO.getAllNews()` → Lấy tất cả theo thứ tự mới nhất
- Sau: `newsDAO.getRandomNews(6)` → Lấy 6 tin ngẫu nhiên

---

### 3. section-news.jsp - Hiển thị linh hoạt theo có/không ảnh

**File**: `E:\Gioi_Thieu_DUT\src\main\webapp\components\section-news.jsp`

#### Thay đổi chính:

**a) Tăng số lượng hiển thị từ 3 → 6 tin**
```jsp
<c:forEach var="news" items="${newsList}" varStatus="loop" begin="0" end="5">
```

**b) Hiển thị ảnh chỉ khi có thumbnail**
```jsp
<!-- Show image only if thumbnail exists -->
<c:if test="${not empty news.thumbnail}">
    <div class="news-image">
        <img src="${pageContext.request.contextPath}/${news.thumbnail}"
             class="card-img-top"
             alt="${news.title}"
             loading="lazy"
             itemprop="image"
             onerror="this.parentElement.style.display='none'">
        <!-- ... badges ... -->
    </div>
</c:if>
```

**c) Hiển thị badge khoa khi không có ảnh**
```jsp
<!-- Faculty badge if no image -->
<c:if test="${empty news.thumbnail}">
    <div class="mb-2">
        <c:choose>
            <c:when test="${not empty news.facultyName}">
                <span class="badge bg-warning text-primary">
                    <i class="bi bi-building me-1"></i>${news.facultyName}
                </span>
            </c:when>
            <c:otherwise>
                <span class="badge bg-info text-white">
                    <i class="bi bi-megaphone me-1"></i>Tin Trường
                </span>
            </c:otherwise>
        </c:choose>
        <span class="badge bg-light text-dark ms-2">
            <i class="bi bi-calendar3 me-1"></i>${news.createdDate}
        </span>
    </div>
</c:if>
```

**d) Hiển thị tên khoa trên ảnh (nếu có ảnh)**
```jsp
<c:choose>
    <c:when test="${not empty news.facultyName}">
        <div class="news-category bg-warning text-primary">${news.facultyName}</div>
    </c:when>
    <c:otherwise>
        <div class="news-category bg-info text-white">Tin Trường</div>
    </c:otherwise>
</c:choose>
```

**e) Hiển thị tên tác giả thực**
```jsp
<span class="text-muted small">
    <i class="bi bi-person-circle me-1"></i>
    <span itemprop="author">
        <c:choose>
            <c:when test="${not empty news.authorName}">
                ${news.authorName}
            </c:when>
            <c:otherwise>
                Ban Truyền thông
            </c:otherwise>
        </c:choose>
    </span>
</span>
```

**f) Hiển thị lượt xem thực hoặc "Mới đăng"**
```jsp
<span class="text-muted small ms-3">
    <i class="bi bi-eye me-1"></i>
    <c:choose>
        <c:when test="${news.views > 0}">
            ${news.views} lượt xem
        </c:when>
        <c:otherwise>
            Mới đăng
        </c:otherwise>
    </c:choose>
</span>
```

**g) Xử lý nội dung ngắn an toàn**
```jsp
<p class="card-text text-muted flex-grow-1" itemprop="description">
    <c:choose>
        <c:when test="${news.content.length() > 150}">
            ${news.content.substring(0, 150)}...
        </c:when>
        <c:otherwise>
            ${news.content}
        </c:otherwise>
    </c:choose>
</p>
```

---

## 🎨 CẢI THIỆN GIAO DIỆN

### Style cho card không có ảnh:

```css
.news-card .card-body {
    padding: 1.5rem;
}

.news-card .card-title {
    font-size: 1.2rem;
    line-height: 1.4;
    min-height: 60px;
}

/* Style for cards without images */
.news-card .card-body .badge {
    font-size: 0.85rem;
    padding: 0.5rem 0.75rem;
}
```

---

## 📊 LOGIC HIỂN THỊ

### Trường hợp 1: Tin có ảnh
```
┌─────────────────────────┐
│   [Ảnh thumbnail]       │
│   Badge: Ngày           │
│   Badge: Tên Khoa       │
├─────────────────────────┤
│   Tiêu đề               │
│   Tác giả | Lượt xem    │
│   Nội dung tóm tắt...   │
│   [Đọc thêm]            │
└─────────────────────────┘
```

### Trường hợp 2: Tin không có ảnh
```
┌─────────────────────────┐
│ Badge Khoa | Badge Ngày │
│                         │
│   Tiêu đề               │
│   Tác giả | Lượt xem    │
│   Nội dung tóm tắt...   │
│   [Đọc thêm]            │
└─────────────────────────┘
```

---

## 🎯 KẾT QUẢ

### Trước khi cập nhật:
- ❌ Chỉ hiển thị 3 tin mới nhất (không random)
- ❌ Luôn hiển thị ảnh placeholder nếu không có ảnh
- ❌ Không hiển thị tên khoa
- ❌ Tác giả luôn là "Ban Truyền thông"

### Sau khi cập nhật:
- ✅ Hiển thị 6 tin ngẫu nhiên từ TẤT CẢ các khoa
- ✅ Chỉ hiển thị ảnh nếu bài viết có thumbnail
- ✅ Hiển thị tên khoa (nếu có) hoặc "Tin Trường"
- ✅ Hiển thị tên tác giả thực (admin đã tạo)
- ✅ Hiển thị lượt xem thực hoặc "Mới đăng"
- ✅ Giao diện responsive cho cả 2 trường hợp có/không ảnh

---

## 🔄 CÁC TIN TỨC ĐƯỢC HIỂN THỊ

### Nguồn tin:
1. **Super Admin (Admin Trường)**:
   - Tin chung của trường
   - `faculty_id = NULL`
   - Badge: "Tin Trường" (màu xanh info)

2. **Faculty Admin (Admin các Khoa)**:
   - Tin của từng khoa
   - `faculty_id` = ID của khoa
   - Badge: Tên khoa (màu vàng warning)

### Random Logic:
- Mỗi lần refresh trang → Tin hiển thị khác nhau
- SQL: `ORDER BY RAND()` → Database tự động random
- Hiển thị 6 tin ngẫu nhiên từ tất cả nguồn

---

## 🧪 KIỂM TRA

### Test Case 1: Tin có ảnh
```
1. Admin tạo tin có upload thumbnail
2. Vào trang chủ
3. Kiểm tra: Ảnh hiển thị, badge khoa hiển thị trên ảnh
```

### Test Case 2: Tin không có ảnh
```
1. Admin tạo tin KHÔNG upload thumbnail
2. Vào trang chủ
3. Kiểm tra: Không có ảnh, badge khoa hiển thị ở đầu card
```

### Test Case 3: Random
```
1. Refresh trang nhiều lần (Ctrl + F5)
2. Kiểm tra: Các tin hiển thị thay đổi ngẫu nhiên
3. Kiểm tra: Có tin từ nhiều khoa khác nhau
```

### Test Case 4: Mix tin trường + tin khoa
```
1. Super Admin tạo 2 tin
2. Admin CNTT tạo 2 tin
3. Admin Cơ Khí tạo 2 tin
4. Refresh trang chủ nhiều lần
5. Kiểm tra: Hiển thị mix từ cả 3 nguồn
```

---

## 📁 CÁC FILE ĐÃ THAY ĐỔI

```
✅ E:\Gioi_Thieu_DUT\src\main\java\dao\NewsDAO.java
   → Thêm method getRandomNews(int limit)

✅ E:\Gioi_Thieu_DUT\src\main\java\controller\HomeServlet.java
   → Sử dụng getRandomNews(6) thay vì getAllNews()

✅ E:\Gioi_Thieu_DUT\src\main\webapp\components\section-news.jsp
   → Hiển thị 6 tin (thay vì 3)
   → Logic hiển thị ảnh có điều kiện
   → Hiển thị tên khoa
   → Hiển thị tác giả thực
   → Hiển thị lượt xem thực
```

---

## 🚀 DEPLOY

### Bước 1: Rebuild
```bash
cd E:\Gioi_Thieu_DUT
mvnw.cmd clean compile
```
✅ **Status**: BUILD SUCCESS

### Bước 2: Restart Tomcat
1. Stop Tomcat server
2. Clean deployment folder
3. Rebuild project
4. Start Tomcat

### Bước 3: Clear Cache
```
Ctrl + Shift + Delete (Clear browser cache)
Ctrl + F5 (Hard refresh)
```

### Bước 4: Kiểm tra
```
http://localhost:8080/Gioi_Thieu_DUT_war_exploded/
→ Scroll xuống phần "HOẠT ĐỘNG NỔI BẬT"
→ Kiểm tra 6 tin random hiển thị
```

---

## 💡 LƯU Ý

1. **Random sẽ thay đổi mỗi lần refresh trang**
   - Người dùng mỗi lần vào sẽ thấy tin khác nhau
   - Tăng khả năng tiếp cận nhiều tin hơn

2. **Badge màu phân biệt**
   - 🟡 Màu vàng (warning) = Tin của Khoa
   - 🔵 Màu xanh (info) = Tin của Trường

3. **Responsive**
   - Desktop: 3 cột
   - Tablet: 2 cột  
   - Mobile: 1 cột

4. **Performance**
   - Limit 6 tin để tránh tải quá nhiều
   - Lazy loading ảnh
   - Optimize query với index

---

## 🎨 BADGE COLORS

```css
/* Tin của Khoa */
.badge.bg-warning.text-primary {
    background: #FDC32D !important;
    color: #005FB7 !important;
}

/* Tin của Trường */
.badge.bg-info.text-white {
    background: #0dcaf0 !important;
    color: white !important;
}

/* Ngày tháng */
.badge.bg-light.text-dark {
    background: #f8f9fa !important;
    color: #333 !important;
}
```

---

## ✅ HOÀN THÀNH

- [x] Thêm method `getRandomNews()` trong NewsDAO
- [x] Cập nhật HomeServlet sử dụng random news
- [x] Cập nhật section-news.jsp hiển thị có điều kiện
- [x] Hiển thị tên khoa/trường
- [x] Hiển thị tác giả thực
- [x] Hiển thị lượt xem thực
- [x] CSS cho card không có ảnh
- [x] Rebuild project thành công

---

**Ngày cập nhật**: 11/12/2025  
**Trạng thái**: ✅ HOÀN THÀNH - Ready to deploy

