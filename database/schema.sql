-- =======================================
-- DATABASE
-- =======================================

CREATE DATABASE IF NOT EXISTS gioi_thieu_dut
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE gioi_thieu_dut;

-- =======================================
-- 1. BẢNG KHOA (FACULTY)
-- =======================================
CREATE TABLE faculty (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         name VARCHAR(255) NOT NULL,
                         description TEXT,

                         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;


-- =======================================
-- 2. BẢNG ADMIN (SUPER ADMIN + ADMIN KHOA)
-- =======================================
CREATE TABLE admin (
                       id INT AUTO_INCREMENT PRIMARY KEY,

                       username VARCHAR(100) NOT NULL UNIQUE,
                       password VARCHAR(255) NOT NULL,

                       full_name VARCHAR(255),
                       email VARCHAR(255),

                       role ENUM('super_admin', 'faculty_admin') NOT NULL DEFAULT 'faculty_admin',

                       faculty_id INT DEFAULT NULL,             -- NULL = super admin
                       FOREIGN KEY (faculty_id) REFERENCES faculty(id)
                           ON DELETE SET NULL
                           ON UPDATE CASCADE,

                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;


-- =======================================
-- 3. BẢNG NGÀNH (MAJOR)
-- =======================================
CREATE TABLE major (
                       id INT AUTO_INCREMENT PRIMARY KEY,

                       faculty_id INT NOT NULL,                -- ngành thuộc khoa nào
                       major_code VARCHAR(50) NOT NULL UNIQUE, -- mã ngành
                       name VARCHAR(255) NOT NULL,
                       description TEXT,

                       created_by INT DEFAULT NULL,            -- người tạo ngành
                       FOREIGN KEY (created_by) REFERENCES admin(id)
                           ON DELETE SET NULL,

                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

                       FOREIGN KEY (faculty_id) REFERENCES faculty(id)
                           ON DELETE CASCADE
                           ON UPDATE CASCADE
) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;


-- =======================================
-- 4. BÀI VIẾT (NEWS)
-- =======================================
CREATE TABLE news (
                      id INT AUTO_INCREMENT PRIMARY KEY,

                      faculty_id INT DEFAULT NULL,            -- NULL = bài viết của super admin
                      author_id INT NOT NULL,                 -- admin viết bài

                      title VARCHAR(500) NOT NULL,
                      content LONGTEXT,
                      thumbnail VARCHAR(500),                 -- ảnh
                      created_date DATE NOT NULL,             -- thời gian đăng

                      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                      updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

                      FOREIGN KEY (faculty_id) REFERENCES faculty(id)
                          ON DELETE SET NULL
                          ON UPDATE CASCADE,

                      FOREIGN KEY (author_id) REFERENCES admin(id)
                          ON DELETE CASCADE
) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;


-- =======================================
-- INDEX TỐI ƯU
-- =======================================
CREATE INDEX idx_major_faculty ON major(faculty_id);
CREATE INDEX idx_major_code ON major(major_code);

CREATE INDEX idx_news_faculty ON news(faculty_id);
CREATE INDEX idx_news_date ON news(created_date);

CREATE INDEX idx_admin_username ON admin(username);
