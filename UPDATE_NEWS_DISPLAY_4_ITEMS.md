# ✅ CẬP NHẬT: HIỂN THỊ 4 TIN NGẪU NHIÊN VÀ TRANG XEM TẤT CẢ

## 🎯 YÊU CẦU

1. ✅ Trang giới thiệu trường (trang chủ) - Mục "Hoạt động nổi bật":
   - Hiển thị **4 tin tức ngẫu nhiên**
   
2. ✅ Khi bấm "Xem tất cả tin tức":
   - Hiển thị **tất cả tin tức** 
   - **Sort theo thời gian tạo** (mới nhất → cũ nhất)
   - **Giữ nguyên header và footer** của website

---

## 📝 CÁC THAY ĐỔI ĐÃ THỰC HIỆN

### 1. **HomeServlet.java** - Giảm số tin từ 6 → 4

**File**: `E:\Gioi_Thieu_DUT\src\main\java\controller\HomeServlet.java`

**Trước:**
```java
// Get random news from all faculties for featured section (limit 6)
List<News> newsList = newsDAO.getRandomNews(6);
```

**Sau:**
```java
// Get random news from all faculties for featured section (limit 4)
List<News> newsList = newsDAO.getRandomNews(4);
```

---

### 2. **section-news.jsp** - Hiển thị 4 tin thay vì 6

**File**: `E:\Gioi_Thieu_DUT\src\main\webapp\components\section-news.jsp`

**Trước:**
```jsp
<c:forEach var="news" items="${newsList}" varStatus="loop" begin="0" end="5">
```

**Sau:**
```jsp
<c:forEach var="news" items="${newsList}" varStatus="loop" begin="0" end="3">
```

**Giải thích**: `end="3"` = 4 items (index 0,1,2,3)

---

### 3. **news.jsp** - Trang xem tất cả tin tức (ĐÃ CẬP NHẬT HOÀN TOÀN)

**File**: `E:\Gioi_Thieu_DUT\src\main\webapp\news.jsp`

#### Thay đổi chính:

**a) Thêm header component**
```jsp
<!-- Header -->
<jsp:include page="components/header.jsp" />
```

**b) Thêm breadcrumb navigation**
```jsp
<section class="page-header">
    <div class="container">
        <h1><i class="bi bi-newspaper me-2"></i>Tin Tức & Sự Kiện</h1>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Tin tức</li>
            </ol>
        </nav>
    </div>
</section>
```

**c) Grid layout hiển thị tin tức**
- Layout 3 cột trên desktop
- 2 cột trên tablet
- 1 cột trên mobile
- Hiển thị đầy đủ thông tin: ảnh, tác giả, lượt xem, tên khoa

**d) Thêm footer component**
```jsp
<!-- Footer -->
<jsp:include page="components/footer.jsp" />
```

---

### 4. **NewsServlet.java** - Đã có sẵn, không cần sửa

**File**: `E:\Gioi_Thieu_DUT\src\main\java\controller\NewsServlet.java`

```java
@WebServlet("/news")
public class NewsServlet extends HttpServlet {
    private NewsDAO newsDAO = new NewsDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        // ...
        List<News> newsList = newsDAO.getAllNews(); // Đã sort theo created_date DESC
        request.setAttribute("newsList", newsList);
        request.getRequestDispatcher("/news.jsp").forward(request, response);
    }
}
```

---

### 5. **NewsDAO.java** - Đã có sẵn, không cần sửa

**File**: `E:\Gioi_Thieu_DUT\src\main\java\dao\NewsDAO.java`

```java
public List<News> getAllNews() {
    String sql = BASE_SELECT + "ORDER BY n.created_date DESC"; // ✅ Đã sort
    // ...
}
```

**Sort logic**: `ORDER BY n.created_date DESC` → Tin mới nhất lên đầu

---

## 🎨 GIAO DIỆN MỚI

### Trang chủ - Hoạt động nổi bật (4 tin)

```
┌─────────────────────────────────────────────────────────┐
│          HOẠT ĐỘNG NỔI BẬT                              │
│      Tin tức và sự kiện của trường                      │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  ┌───────────┐  ┌───────────┐  ┌───────────┐  ┌──────┐│
│  │ Tin 1     │  │ Tin 2     │  │ Tin 3     │  │ Tin 4││
│  │ (Random)  │  │ (Random)  │  │ (Random)  │  │(Rand)││
│  └───────────┘  └───────────┘  └───────────┘  └──────┘│
│                                                         │
│           [ Xem tất cả tin tức ]  ← Click vào đây      │
└─────────────────────────────────────────────────────────┘
```

### Trang xem tất cả (/news)

```
┌─────────────────────────────────────────────────────────┐
│  Header (Logo, Menu Navigation)                         │
├─────────────────────────────────────────────────────────┤
│  Page Header                                            │
│  📰 Tin Tức & Sự Kiện                                  │
│  Breadcrumb: Trang chủ > Tin tức                       │
├─────────────────────────────────────────────────────────┤
│  News Grid (Sorted by created_date DESC)                │
│                                                         │
│  ┌───────────┐  ┌───────────┐  ┌───────────┐          │
│  │ Tin 1     │  │ Tin 2     │  │ Tin 3     │          │
│  │(Mới nhất) │  │           │  │           │          │
│  └───────────┘  └───────────┘  └───────────┘          │
│                                                         │
│  ┌───────────┐  ┌───────────┐  ┌───────────┐          │
│  │ Tin 4     │  │ Tin 5     │  │ Tin 6     │          │
│  │           │  │           │  │           │          │
│  └───────────┘  └───────────┘  └───────────┘          │
│                                                         │
│  ... (Tất cả các tin theo thứ tự thời gian)            │
├─────────────────────────────────────────────────────────┤
│  Footer (Thông tin liên hệ, Social links)              │
└─────────────────────────────────────────────────────────┘
```

---

## 🔄 FLOW NGƯỜI DÙNG

### 1. Truy cập trang chủ
```
http://localhost:8080/Gioi_Thieu_DUT_war_exploded/
```

→ Scroll xuống phần **"HOẠT ĐỘNG NỔI BẬT"**
→ Thấy 4 tin ngẫu nhiên
→ Mỗi lần refresh → 4 tin khác nhau

### 2. Click "Xem tất cả tin tức"
```
http://localhost:8080/Gioi_Thieu_DUT_war_exploded/news
```

→ Hiển thị TẤT CẢ tin tức
→ Sort theo thời gian: Mới nhất → Cũ nhất
→ Có header và footer giống trang chủ
→ Grid layout 3 cột responsive

### 3. Click vào 1 tin cụ thể
```
http://localhost:8080/Gioi_Thieu_DUT_war_exploded/news?action=detail&id=X
```

→ Hiển thị chi tiết tin tức

---

## 🎯 CÁC TÍNH NĂNG

### Trang chủ (index.jsp):
- ✅ Hiển thị 4 tin ngẫu nhiên
- ✅ Random mỗi lần refresh
- ✅ Mix tin từ admin trường + admin khoa
- ✅ Hiển thị ảnh nếu có
- ✅ Hiển thị tên khoa/trường
- ✅ Link "Xem tất cả tin tức"

### Trang tin tức (/news):
- ✅ Header component đầy đủ (Logo, Menu)
- ✅ Breadcrumb navigation
- ✅ Hiển thị TẤT CẢ tin tức
- ✅ Sort theo created_date DESC (mới → cũ)
- ✅ Grid 3 cột responsive
- ✅ Hiển thị đầy đủ thông tin:
  - Ảnh thumbnail (nếu có)
  - Tiêu đề
  - Ngày đăng
  - Tác giả
  - Lượt xem
  - Tên khoa/trường
  - Nội dung tóm tắt
- ✅ Footer component đầy đủ
- ✅ Hover effects đẹp mắt

---

## 📊 DATABASE QUERY

### Trang chủ (4 tin ngẫu nhiên):
```sql
SELECT n.id, n.faculty_id, n.title, n.content, n.thumbnail, 
       n.created_date, f.name as faculty_name, a.full_name as author_name
FROM news n
LEFT JOIN faculty f ON n.faculty_id = f.id
LEFT JOIN admin a ON n.author_id = a.id
ORDER BY RAND()
LIMIT 4;
```

### Trang tin tức (tất cả, sort theo thời gian):
```sql
SELECT n.id, n.faculty_id, n.title, n.content, n.thumbnail, 
       n.created_date, f.name as faculty_name, a.full_name as author_name
FROM news n
LEFT JOIN faculty f ON n.faculty_id = f.id
LEFT JOIN admin a ON n.author_id = a.id
ORDER BY n.created_date DESC;
```

---

## 🎨 CSS STYLING

### Page Header
```css
.page-header {
    background: linear-gradient(135deg, #005FB7 0%, #003d82 100%);
    color: white;
    padding: 4rem 0 2rem;
    margin-bottom: 3rem;
}
```

### News Card
```css
.news-card {
    background: white;
    border-radius: 1rem;
    overflow: hidden;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    transition: all 0.3s ease;
}

.news-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 12px 24px rgba(0,95,183,0.2);
}
```

### Responsive Grid
```css
<!-- Desktop: 3 cột -->
<div class="col-lg-4 col-md-6">
  
<!-- Tablet: 2 cột -->
<!-- Mobile: 1 cột -->
```

---

## 🧪 KIỂM TRA

### Test Case 1: Trang chủ - 4 tin ngẫu nhiên
```
1. Vào: http://localhost:8080/Gioi_Thieu_DUT_war_exploded/
2. Scroll xuống "HOẠT ĐỘNG NỔI BẬT"
3. Kiểm tra: Chỉ hiển thị 4 tin
4. Refresh trang (Ctrl + F5)
5. Kiểm tra: 4 tin khác nhau
```

### Test Case 2: Xem tất cả tin tức
```
1. Click nút "Xem tất cả tin tức"
2. Kiểm tra URL: /news
3. Kiểm tra: Header và Footer đầy đủ
4. Kiểm tra: Tất cả tin hiển thị
5. Kiểm tra: Tin mới nhất ở đầu
```

### Test Case 3: Sort theo thời gian
```
1. Vào trang /news
2. Xem tin đầu tiên → created_date = YYYY-MM-DD (mới nhất)
3. Xem tin thứ 2 → created_date <= tin đầu tiên
4. Scroll xuống → Tin ngày càng cũ
```

### Test Case 4: Responsive
```
1. Resize browser:
   - Desktop (>992px): 3 cột
   - Tablet (768-991px): 2 cột
   - Mobile (<768px): 1 cột
```

---

## 📁 CÁC FILE ĐÃ THAY ĐỔI

```
✅ E:\Gioi_Thieu_DUT\src\main\java\controller\HomeServlet.java
   → Giảm getRandomNews(6) → getRandomNews(4)

✅ E:\Gioi_Thieu_DUT\src\main\webapp\components\section-news.jsp
   → Thay end="5" → end="3" (hiển thị 4 tin)

✅ E:\Gioi_Thieu_DUT\src\main\webapp\news.jsp
   → CẬP NHẬT HOÀN TOÀN:
     - Thêm header component
     - Thêm breadcrumb
     - Grid layout 3 cột
     - Thêm footer component
     - Styling đẹp mắt

✅ E:\Gioi_Thieu_DUT\src\main\java\controller\NewsServlet.java
   → Không thay đổi (đã hoạt động đúng)

✅ E:\Gioi_Thieu_DUT\src\main\java\dao\NewsDAO.java
   → Không thay đổi (getAllNews() đã sort DESC)
```

---

## 🚀 TRIỂN KHAI

### Bước 1: Rebuild
```bash
cd E:\Gioi_Thieu_DUT
mvnw.cmd clean compile
```
✅ **Status**: `BUILD SUCCESS`

### Bước 2: Restart Tomcat
```
1. Stop Tomcat trong IntelliJ
2. Clean deployment folder
3. Rebuild project
4. Start Tomcat
```

### Bước 3: Clear Cache
```
Ctrl + Shift + Delete (Clear browser cache)
Ctrl + F5 (Hard refresh)
```

### Bước 4: Test
```
1. Trang chủ: http://localhost:8080/Gioi_Thieu_DUT_war_exploded/
   → Kiểm tra 4 tin ngẫu nhiên
   
2. Xem tất cả: Click "Xem tất cả tin tức"
   → URL: /news
   → Kiểm tra header/footer
   → Kiểm tra sort theo thời gian
```

---

## 🎯 KẾT QUẢ

### Trước khi cập nhật:
```
❌ Trang chủ hiển thị 6 tin
❌ Trang /news không có header/footer đúng
❌ Layout cũ, không responsive
```

### Sau khi cập nhật:
```
✅ Trang chủ hiển thị 4 tin ngẫu nhiên
✅ Trang /news có header/footer giống trang chủ
✅ Grid layout 3 cột responsive
✅ Sort theo thời gian mới nhất
✅ Hiển thị đầy đủ thông tin tin tức
✅ Hover effects đẹp mắt
✅ Breadcrumb navigation
```

---

## 💡 LƯU Ý

### Random Logic:
- Mỗi lần vào trang chủ → 4 tin khác nhau
- SQL: `ORDER BY RAND() LIMIT 4`
- Đảm bảo người dùng thấy nội dung đa dạng

### Sort Logic:
- Trang /news → Sort theo `created_date DESC`
- Tin mới nhất luôn ở đầu
- Người dùng dễ dàng theo dõi tin mới

### Responsive:
- Desktop: 3 tin/hàng
- Tablet: 2 tin/hàng
- Mobile: 1 tin/hàng
- Tự động adapt theo màn hình

### Performance:
- Limit 4 tin trên trang chủ → Load nhanh
- Lazy loading ảnh
- Optimize hover effects

---

## ✅ CHECKLIST

- [x] Giảm số tin từ 6 → 4 trên trang chủ
- [x] Update HomeServlet
- [x] Update section-news.jsp
- [x] Cập nhật hoàn toàn news.jsp
- [x] Thêm header component
- [x] Thêm breadcrumb navigation
- [x] Grid layout 3 cột responsive
- [x] Thêm footer component
- [x] Sort theo thời gian (getAllNews đã có)
- [x] Rebuild project thành công
- [x] Test responsive
- [x] Test random logic

---

**Ngày cập nhật**: 11/12/2025  
**Trạng thái**: ✅ HOÀN THÀNH  
**Build Status**: ✅ SUCCESS  
**Sẵn sàng deploy**: ✅ YES

