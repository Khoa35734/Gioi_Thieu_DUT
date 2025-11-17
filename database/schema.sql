-- ===================================
-- DATABASE SCHEMA CHO GIOI THIEU DUT
-- ===================================

-- Tạo database
CREATE DATABASE IF NOT EXISTS gioi_thieu_dut CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE gioi_thieu_dut;

-- Bảng Faculty (Khoa)
CREATE TABLE IF NOT EXISTS faculty (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Bảng Major (Ngành học)
CREATE TABLE IF NOT EXISTS major (
    id INT AUTO_INCREMENT PRIMARY KEY,
    faculty_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (faculty_id) REFERENCES faculty(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Bảng News (Tin tức)
CREATE TABLE IF NOT EXISTS news (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(500) NOT NULL,
    content LONGTEXT,
    thumbnail VARCHAR(500),
    created_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Bảng Admin (Quản trị viên)
CREATE TABLE IF NOT EXISTS admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(255),
    email VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ===================================
-- DỮ LIỆU MẪU (DEMO)
-- ===================================

-- Insert Faculty demo data
INSERT INTO faculty (id, name, description) VALUES
(1, 'Khoa Công Nghệ Thông Tin', 'Đào tạo các chuyên ngành về CNTT, phần mềm, mạng máy tính'),
(2, 'Khoa Cơ Khí', 'Đào tạo kỹ sư cơ khí, chế tạo máy, ô tô'),
(3, 'Khoa Điện - Điện Tử', 'Đào tạo kỹ sư điện, tự động hóa, điện tử viễn thông');

-- Insert Major demo data
INSERT INTO major (id, faculty_id, name, description) VALUES
(1, 1, 'Công Nghệ Phần Mềm', 'Đào tạo kỹ sư phần mềm chuyên nghiệp'),
(2, 1, 'Hệ Thống Thông Tin', 'Đào tạo chuyên gia phân tích và quản trị hệ thống'),
(3, 1, 'Khoa Học Máy Tính', 'Đào tạo về thuật toán, AI, Machine Learning'),
(4, 2, 'Cơ Khí Chế Tạo Máy', 'Đào tạo kỹ sư thiết kế và chế tạo máy'),
(5, 2, 'Kỹ Thuật Ô Tô', 'Đào tạo kỹ sư chuyên ngành ô tô'),
(6, 3, 'Kỹ Thuật Điện', 'Đào tạo kỹ sư điện công nghiệp');

-- Insert News demo data
INSERT INTO news (id, title, content, thumbnail, created_date) VALUES
(1, 'Trường ĐH Duy Tân khai giảng năm học 2024-2025',
    '<h2>Lễ khai giảng năm học mới</h2><p>Sáng ngày 15/9/2024, Trường Đại học Duy Tân đã long trọng tổ chức lễ khai giảng năm học 2024-2025 với sự tham gia của toàn thể sinh viên, giảng viên và các đại biểu khách mời.</p><p>Trong bài phát biểu khai mạc, Hiệu trưởng nhấn mạnh tầm quan trọng của việc đổi mới giáo dục và ứng dụng công nghệ vào quá trình đào tạo.</p>',
    'assets/img/khai-giang.jpg',
    '2024-09-15'),
(2, 'Sinh viên DTU đạt giải Nhất cuộc thi Lập trình',
    '<h2>Thành tích xuất sắc</h2><p>Đội tuyển sinh viên Khoa CNTT Trường ĐH Duy Tân đã xuất sắc giành giải Nhất cuộc thi Lập trình toàn quốc năm 2024.</p><p>Đây là lần thứ 3 liên tiếp sinh viên DTU đạt được thành tích cao tại cuộc thi này, khẳng định chất lượng đào tạo của nhà trường.</p>',
    'assets/img/giai-thuong.jpg',
    '2024-10-20'),
(3, 'Hội thảo khoa học quốc tế về AI và Machine Learning',
    '<h2>Hội thảo khoa học</h2><p>Trường ĐH Duy Tân tổ chức hội thảo khoa học quốc tế về trí tuệ nhân tạo và học máy với sự tham gia của nhiều chuyên gia hàng đầu trong và ngoài nước.</p><p>Hội thảo là cơ hội tốt để sinh viên và giảng viên trao đổi kinh nghiệm, cập nhật kiến thức mới nhất về AI và ML.</p>',
    'assets/img/hoi-thao.jpg',
    '2024-11-10');

-- Insert Admin demo data (password: admin123 - trong thực tế nên hash)
INSERT INTO admin (id, username, password, full_name, email) VALUES
(1, 'admin', 'admin123', 'Quản Trị Viên', 'admin@dtu.edu.vn');

-- ===================================
-- INDEX ĐỂ TỐI ƯU PERFORMANCE
-- ===================================

CREATE INDEX idx_major_faculty ON major(faculty_id);
CREATE INDEX idx_news_date ON news(created_date);
CREATE INDEX idx_admin_username ON admin(username);

