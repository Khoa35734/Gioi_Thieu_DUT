# Website Giới Thiệu Trường ĐH Duy Tân (DTU)

## Mô Tả Project
Website giới thiệu trường học sử dụng mô hình MVC với JSP/Servlet. Project mang tính chất DEMO với dữ liệu mock.

## Công Nghệ Sử Dụng
- **Backend**: Java Servlet, JSP
- **Database**: MySQL (demo)
- **Build Tool**: Maven
- **Web Server**: Apache Tomcat 10+ hoặc GlassFish
- **Frontend**: HTML, CSS, JavaScript
- **Editor**: CKEditor 4 (cho admin)

## Cấu Trúc Project

```
Gioi_thieu_DUT/
├── src/
│   └── main/
│       ├── java/
│       │   ├── controller/        # Các Servlet controllers
│       │   ├── dao/              # Data Access Objects (mock data)
│       │   ├── model/            # Model classes (POJO)
│       │   └── utils/            # Utilities (DBConnection)
│       └── webapp/
│           ├── index.jsp         # Trang chủ
│           ├── about.jsp         # Giới thiệu
│           ├── faculty.jsp       # Danh sách khoa
│           ├── major.jsp         # Danh sách ngành
│           ├── news.jsp          # Danh sách tin tức
│           ├── news-detail.jsp   # Chi tiết tin tức
│           ├── admin/            # Trang quản trị
│           │   ├── login.jsp
│           │   ├── faculty-list.jsp
│           │   ├── faculty-form.jsp
│           │   ├── major-list.jsp
│           │   ├── major-form.jsp
│           │   ├── news-list.jsp
│           │   └── news-form.jsp
│           ├── WEB-INF/
│           │   └── web.xml       # Deployment descriptor
│           ├── assets/
│           │   ├── css/          # Stylesheets
│           │   ├── js/           # JavaScript files
│           │   └── img/          # Images
│           └── uploads/
│               └── news-content/ # Upload folder cho CKEditor
├── database/
│   └── schema.sql                # Database schema
└── pom.xml                       # Maven configuration
```

## Các Tính Năng

### Phía User (Frontend)
- ✅ Trang chủ giới thiệu trường
- ✅ Danh sách các khoa
- ✅ Danh sách ngành học theo khoa
- ✅ Tin tức & sự kiện
- ✅ Chi tiết tin tức với nội dung HTML

### Phía Admin (Backend)
- ✅ Đăng nhập admin
- ✅ Quản lý khoa (CRUD)
- ✅ Quản lý ngành (CRUD)
- ✅ Quản lý tin tức (CRUD)
- ✅ Upload ảnh với CKEditor

## Hướng Dẫn Cài Đặt

### 1. Yêu Cầu Hệ Thống
- JDK 17 hoặc mới hơn
- Apache Tomcat 10+ hoặc GlassFish 7+
- Maven 3.6+
- MySQL 8.0+ (nếu muốn dùng DB thật)

### 2. Clone & Build Project
```bash
# Clone project (nếu từ git)
git clone <repository-url>
cd Gioi_Thieu_DUT

# Build với Maven
mvn clean install
```

### 3. Cấu Hình Database (Optional)
Project hiện tại sử dụng dữ liệu MOCK, không cần database thật.

Nếu muốn kết nối database thật:
```bash
# Import database
mysql -u root -p < database/schema.sql

# Cập nhật thông tin kết nối trong utils/DBConnection.java
```

### 4. Deploy & Run
```bash
# Deploy trên Tomcat
# Copy file WAR vào thư mục webapps của Tomcat
cp target/Gioi_Thieu_DUT-1.0-SNAPSHOT.war $TOMCAT_HOME/webapps/

# Start Tomcat
$TOMCAT_HOME/bin/catalina.sh run

# Hoặc chạy trực tiếp từ IDE (IntelliJ IDEA, Eclipse)
```

### 5. Truy Cập Ứng Dụng
- **Trang chủ**: http://localhost:8080/Gioi_Thieu_DUT/
- **Admin login**: http://localhost:8080/Gioi_Thieu_DUT/admin/login
  - Username: `admin`
  - Password: `admin123`

## Các URL Mapping

### Frontend URLs
- `/home` - Trang chủ
- `/about.jsp` - Giới thiệu
- `/faculty` - Danh sách khoa
- `/major` - Danh sách ngành
- `/major?facultyId=1` - Ngành theo khoa
- `/news` - Danh sách tin tức
- `/news?action=detail&id=1` - Chi tiết tin tức

### Admin URLs
- `/admin/login` - Đăng nhập admin
- `/admin/faculty-list` - Quản lý khoa
- `/admin/major-list` - Quản lý ngành
- `/admin/news-list` - Quản lý tin tức
- `/upload-image` - Upload ảnh cho CKEditor

## Dữ Liệu Demo

### Khoa (Faculty)
1. Khoa Công Nghệ Thông Tin
2. Khoa Cơ Khí
3. Khoa Điện - Điện Tử

### Ngành (Major)
1. Công Nghệ Phần Mềm (CNTT)
2. Hệ Thống Thông Tin (CNTT)
3. Khoa Học Máy Tính (CNTT)
4. Cơ Khí Chế Tạo Máy (Cơ Khí)
5. Kỹ Thuật Ô Tô (Cơ Khí)
6. Kỹ Thuật Điện (Điện - Điện Tử)

### Tin Tức (News)
1. Trường ĐH Duy Tân khai giảng năm học 2024-2025
2. Sinh viên DTU đạt giải Nhất cuộc thi Lập trình
3. Hội thảo khoa học quốc tế về AI và Machine Learning

### Admin Account
- Username: `admin`
- Password: `admin123`

## Tính Năng CKEditor
- Upload ảnh trực tiếp vào editor
- Ảnh được lưu vào thư mục `uploads/news-content/`
- Hỗ trợ định dạng văn bản phong phú
- Insert table, link, special characters

## Lưu Ý
⚠️ **Đây là project DEMO nên:**
- Dữ liệu lưu trong bộ nhớ (mock data), sẽ mất khi restart server
- Không có validation nghiêm ngặt
- Không có authentication filter cho admin
- Password không được mã hóa
- Không có phân trang cho danh sách

## Phát Triển Thêm
Để chuyển thành project thực tế, cần:
1. ✅ Kết nối database thật (bỏ mock data)
2. ✅ Thêm filter kiểm tra đăng nhập admin
3. ✅ Mã hóa password (BCrypt, SHA-256)
4. ✅ Thêm validation cho form
5. ✅ Thêm phân trang (pagination)
6. ✅ Thêm search & filter
7. ✅ Responsive design tốt hơn
8. ✅ Xử lý lỗi chuyên nghiệp
9. ✅ Logging system

## License
MIT License - Free for educational purposes

## Tác Giả
Project demo cho môn học Lập Trình Web - Trường ĐH Duy Tân

## Liên Hệ
- Website: https://duytan.edu.vn
- Email: support@dtu.edu.vn

