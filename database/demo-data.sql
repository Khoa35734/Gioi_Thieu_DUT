-- =======================================
-- INSERT DEMO DATA
-- =======================================

USE gioi_thieu_dut;

-- =======================================
-- 1. INSERT FACULTIES
-- =======================================
INSERT INTO faculty (id, name, description) VALUES
(1, 'Khoa Công Nghệ Thông Tin', 'Khoa đào tạo các chuyên ngành về công nghệ thông tin, phần mềm, mạng máy tính, an toàn thông tin.'),
(2, 'Khoa Cơ Khí', 'Khoa đào tạo các kỹ sư cơ khí, chế tạo máy, kỹ thuật ô tô, tự động hóa.'),
(3, 'Khoa Điện - Điện Tử', 'Khoa đào tạo kỹ sư điện, tự động hóa, điện tử viễn thông, kỹ thuật điều khiển.'),
(4, 'Khoa Xây Dựng', 'Khoa đào tạo kỹ sư xây dựng dân dụng, công nghiệp, cầu đường, quản lý dự án.');

-- =======================================
-- 2. INSERT ADMINS
-- =======================================
-- Super Admin (password: admin123)
INSERT INTO admin (username, password, full_name, email, role, faculty_id) VALUES
('superadmin', 'admin123', 'Quản Trị Viên Tổng', 'superadmin@dut.edu.vn', 'super_admin', NULL);

-- Faculty Admins (password: khoa123)
INSERT INTO admin (username, password, full_name, email, role, faculty_id) VALUES
('admin_cntt', 'khoa123', 'Admin Khoa CNTT', 'admin_cntt@dut.edu.vn', 'faculty_admin', 1),
('admin_cokhi', 'khoa123', 'Admin Khoa Cơ Khí', 'admin_cokhi@dut.edu.vn', 'faculty_admin', 2),
('admin_dien', 'khoa123', 'Admin Khoa Điện', 'admin_dien@dut.edu.vn', 'faculty_admin', 3),
('admin_xaydung', 'khoa123', 'Admin Khoa Xây Dựng', 'admin_xaydung@dut.edu.vn', 'faculty_admin', 4);

-- =======================================
-- 3. INSERT MAJORS
-- =======================================
-- Majors for Khoa CNTT
INSERT INTO major (faculty_id, major_code, name, description, created_by) VALUES
(1, 'CNTT01', 'Công Nghệ Phần Mềm', 'Đào tạo kỹ sư phần mềm, lập trình ứng dụng, phát triển web/mobile.', 2),
(1, 'CNTT02', 'Hệ Thống Thông Tin', 'Đào tạo chuyên gia phân tích, thiết kế hệ thống thông tin doanh nghiệp.', 2),
(1, 'CNTT03', 'Khoa Học Máy Tính', 'Đào tạo về thuật toán, trí tuệ nhân tạo, học máy, khoa học dữ liệu.', 2),
(1, 'CNTT04', 'An Toàn Thông Tin', 'Đào tạo chuyên gia bảo mật, an ninh mạng, mật mã học.', 2);

-- Majors for Khoa Cơ Khí
INSERT INTO major (faculty_id, major_code, name, description, created_by) VALUES
(2, 'CK01', 'Cơ Khí Chế Tạo Máy', 'Đào tạo kỹ sư thiết kế, chế tạo máy móc, thiết bị công nghiệp.', 3),
(2, 'CK02', 'Kỹ Thuật Ô Tô', 'Đào tạo kỹ sư ô tô, sửa chữa, bảo dưỡng và cải tiến phương tiện.', 3),
(2, 'CK03', 'Cơ Điện Tử', 'Đào tạo kỹ sư tích hợp cơ khí và điện tử, robot công nghiệp.', 3);

-- Majors for Khoa Điện
INSERT INTO major (faculty_id, major_code, name, description, created_by) VALUES
(3, 'DIEN01', 'Kỹ Thuật Điện', 'Đào tạo kỹ sư về hệ thống điện, trạm biến áp, lưới điện.', 4),
(3, 'DIEN02', 'Tự Động Hóa', 'Đào tạo kỹ sư tự động hóa, điều khiển quá trình sản xuất.', 4),
(3, 'DIEN03', 'Điện Tử Viễn Thông', 'Đào tạo kỹ sư điện tử, viễn thông, xử lý tín hiệu.', 4);

-- Majors for Khoa Xây Dựng
INSERT INTO major (faculty_id, major_code, name, description, created_by) VALUES
(4, 'XD01', 'Xây Dựng Dân Dụng', 'Đào tạo kỹ sư xây dựng nhà ở, công trình dân dụng.', 5),
(4, 'XD02', 'Xây Dựng Công Nghiệp', 'Đào tạo kỹ sư xây dựng nhà máy, kho tàng, công trình công nghiệp.', 5),
(4, 'XD03', 'Kỹ Thuật Cầu Đường', 'Đào tạo kỹ sư thiết kế, thi công cầu, đường, hạ tầng giao thông.', 5);

-- =======================================
-- 4. INSERT NEWS
-- =======================================
-- News from Super Admin (global news)
INSERT INTO news (faculty_id, author_id, title, content, thumbnail, created_date) VALUES
(NULL, 1, 'Trường ĐH Bách Khoa - ĐH Đà Nẵng khai giảng năm học 2024-2025', 
'<h2>Lễ khai giảng năm học mới 2024-2025</h2>
<p>Sáng ngày 15/9/2024, Trường Đại học Bách Khoa - Đại học Đà Nẵng đã long trọng tổ chức lễ khai giảng năm học 2024-2025 với sự tham gia của hơn 5,000 sinh viên mới.</p>
<p>Phát biểu tại buổi lễ, GS.TS Rector đã nhấn mạnh tầm quan trọng của việc đào tạo nguồn nhân lực chất lượng cao phục vụ cho sự phát triển của đất nước.</p>', 
'uploads/news-content/khai-giang-2024.jpg', '2024-09-15'),

(NULL, 1, 'DUT đạt chứng nhận AUN-QA chu kỳ 2', 
'<h2>Trường ĐH Bách Khoa - ĐH Đà Nẵng đạt chứng nhận AUN-QA</h2>
<p>Ngày 10/10/2024, Trường Đại học Bách Khoa - Đại học Đà Nẵng chính thức nhận chứng nhận kiểm định chất lượng giáo dục AUN-QA chu kỳ 2.</p>
<p>Đây là minh chứng cho nỗ lực không ngừng của nhà trường trong việc nâng cao chất lượng đào tạo.</p>', 
'uploads/news-content/aun-qa.jpg', '2024-10-10');

-- News from Khoa CNTT
INSERT INTO news (faculty_id, author_id, title, content, thumbnail, created_date) VALUES
(1, 2, 'Sinh viên DUT đạt giải Nhất cuộc thi Lập trình ACM ICPC', 
'<h2>Thành tích xuất sắc tại ACM ICPC</h2>
<p>Đội tuyển sinh viên Khoa CNTT Trường ĐH Bách Khoa - ĐH Đà Nẵng đã xuất sắc giành giải Nhất cuộc thi Lập trình ACM ICPC khu vực miền Trung.</p>
<p>Đội tuyển gồm 3 sinh viên: Nguyễn Văn A, Trần Văn B, Lê Văn C đã vượt qua 50 đội thi từ các trường đại học trong khu vực.</p>', 
'uploads/news-content/acm-icpc.jpg', '2024-10-20'),

(1, 2, 'Hội thảo khoa học quốc tế về AI và Machine Learning', 
'<h2>Hội thảo AI & ML tại DUT</h2>
<p>Ngày 5/11/2024, Khoa CNTT tổ chức hội thảo khoa học quốc tế về trí tuệ nhân tạo và học máy với sự tham gia của nhiều chuyên gia hàng đầu.</p>', 
'uploads/news-content/ai-ml-workshop.jpg', '2024-11-05');

-- News from Khoa Cơ Khí
INSERT INTO news (faculty_id, author_id, title, content, thumbnail, created_date) VALUES
(2, 3, 'Sinh viên Khoa Cơ Khí giành giải Nhì cuộc thi Sáng tạo Kỹ thuật', 
'<h2>Giải thưởng Sáng tạo Kỹ thuật 2024</h2>
<p>Đội sinh viên Khoa Cơ Khí đã giành giải Nhì cuộc thi Sáng tạo Kỹ thuật toàn quốc với dự án "Robot hàn tự động".</p>', 
'uploads/news-content/sang-tao-ky-thuat.jpg', '2024-10-25');

-- News from Khoa Điện
INSERT INTO news (faculty_id, author_id, title, content, thumbnail, created_date) VALUES
(3, 4, 'Khoa Điện - Điện Tử kí kết hợp tác với Schneider Electric', 
'<h2>Hợp tác chiến lược với Schneider Electric</h2>
<p>Ngày 1/11/2024, Khoa Điện - Điện Tử đã ký kết thỏa thuận hợp tác với tập đoàn Schneider Electric về đào tạo và chuyển giao công nghệ.</p>', 
'uploads/news-content/schneider.jpg', '2024-11-01');

-- =======================================
-- COMPLETED
-- =======================================
