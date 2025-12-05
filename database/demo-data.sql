-- =======================================
-- INSERT DEMO DATA
-- =======================================

USE gioi_thieu_dut;

-- =======================================
-- 1. INSERT FACULTIES (14 faculties - Based on DUT actual structure)
-- =======================================
INSERT INTO faculty (id, name, description) VALUES
(1, 'Công nghệ Thông tin', 'Khoa đào tạo các chuyên ngành về công nghệ thông tin, phần mềm, mạng máy tính, an toàn thông tin.'),
(2, 'Công nghệ Nhiệt - Điện lạnh', 'Khoa đào tạo kỹ sư nhiệt, điện lạnh, kỹ thuật năng lượng, hệ thống HVAC.'),
(3, 'Cơ khí', 'Khoa đào tạo các kỹ sư cơ khí, chế tạo máy, kỹ thuật ô tô, tự động hóa.'),
(4, 'Cơ khí Giao thông', 'Khoa đào tạo kỹ sư cơ khí giao thông, phương tiện vận tải, bảo dưỡng sửa chữa.'),
(5, 'Điện', 'Khoa đào tạo kỹ sư điện, hệ thống điện, trạm biến áp, lưới điện.'),
(6, 'Điện tử - Viễn thông', 'Khoa đào tạo kỹ sư điện tử, viễn thông, xử lý tín hiệu, mạng truyền thông.'),
(7, 'Hóa', 'Khoa đào tạo kỹ sư công nghệ hóa học, hóa dược, công nghệ thực phẩm.'),
(8, 'Khoa học Công nghệ tiên tiến', 'Khoa đào tạo về công nghệ tiên tiến, vật liệu mới, công nghệ nano.'),
(9, 'Kiến trúc', 'Khoa đào tạo kiến trúc sư, thiết kế công trình, quy hoạch đô thị.'),
(10, 'Môi trường', 'Khoa đào tạo kỹ sư môi trường, xử lý nước thải, quản lý chất thải công nghiệp.'),
(11, 'Quản lý Dự án', 'Khoa đào tạo quản lý dự án xây dựng, quản lý chi phí, lập kế hoạch thi công.'),
(12, 'Xây dựng Cầu - Đường', 'Khoa đào tạo kỹ sư thiết kế, thi công cầu, đường, hạ tầng giao thông.'),
(13, 'Xây dựng Công trình Thủy', 'Khoa đào tạo kỹ sư xây dựng công trình thủy lợi, đập, hệ thống tưới tiêu.'),
(14, 'Xây dựng Dân dụng & Công nghiệp', 'Khoa đào tạo kỹ sư xây dựng nhà ở, nhà máy, công trình dân dụng và công nghiệp.');

-- =======================================
-- 2. INSERT ADMINS (1 Super Admin + 14 Faculty Admins)
-- =======================================
-- Super Admin (password: admin123)
INSERT INTO admin (username, password, full_name, email, role, faculty_id) VALUES
('superadmin', 'admin123', 'Quản Trị Viên Tổng', 'superadmin@dut.edu.vn', 'super_admin', NULL);

-- Faculty Admins (password: khoa123)
INSERT INTO admin (username, password, full_name, email, role, faculty_id) VALUES
('admin_cntt', 'khoa123', 'Admin Công nghệ Thông tin', 'admin_cntt@dut.edu.vn', 'faculty_admin', 1),
('admin_nhiet', 'khoa123', 'Admin Công nghệ Nhiệt - Điện lạnh', 'admin_nhiet@dut.edu.vn', 'faculty_admin', 2),
('admin_cokhi', 'khoa123', 'Admin Cơ khí', 'admin_cokhi@dut.edu.vn', 'faculty_admin', 3),
('admin_cokhigt', 'khoa123', 'Admin Cơ khí Giao thông', 'admin_cokhigt@dut.edu.vn', 'faculty_admin', 4),
('admin_dien', 'khoa123', 'Admin Điện', 'admin_dien@dut.edu.vn', 'faculty_admin', 5),
('admin_dientu', 'khoa123', 'Admin Điện tử - Viễn thông', 'admin_dientu@dut.edu.vn', 'faculty_admin', 6),
('admin_hoa', 'khoa123', 'Admin Hóa', 'admin_hoa@dut.edu.vn', 'faculty_admin', 7),
('admin_khcntt', 'khoa123', 'Admin Khoa học Công nghệ tiên tiến', 'admin_khcntt@dut.edu.vn', 'faculty_admin', 8),
('admin_kientruc', 'khoa123', 'Admin Kiến trúc', 'admin_kientruc@dut.edu.vn', 'faculty_admin', 9),
('admin_moitruong', 'khoa123', 'Admin Môi trường', 'admin_moitruong@dut.edu.vn', 'faculty_admin', 10),
('admin_qlda', 'khoa123', 'Admin Quản lý Dự án', 'admin_qlda@dut.edu.vn', 'faculty_admin', 11),
('admin_cauduong', 'khoa123', 'Admin Xây dựng Cầu - Đường', 'admin_cauduong@dut.edu.vn', 'faculty_admin', 12),
('admin_thuy', 'khoa123', 'Admin Xây dựng Công trình Thủy', 'admin_thuy@dut.edu.vn', 'faculty_admin', 13),
('admin_xddd', 'khoa123', 'Admin Xây dựng Dân dụng & Công nghiệp', 'admin_xddd@dut.edu.vn', 'faculty_admin', 14);

-- =======================================
-- 3. INSERT MAJORS
-- =======================================
-- Majors for Công nghệ Thông tin
INSERT INTO major (faculty_id, major_code, name, description, created_by) VALUES
(1, 'CNTT01', 'Công Nghệ Phần Mềm', 'Đào tạo kỹ sư phần mềm, lập trình ứng dụng, phát triển web/mobile.', 2),
(1, 'CNTT02', 'Hệ Thống Thông Tin', 'Đào tạo chuyên gia phân tích, thiết kế hệ thống thông tin doanh nghiệp.', 2),
(1, 'CNTT03', 'Khoa Học Máy Tính', 'Đào tạo về thuật toán, trí tuệ nhân tạo, học máy, khoa học dữ liệu.', 2),
(1, 'CNTT04', 'An Toàn Thông Tin', 'Đào tạo chuyên gia bảo mật, an ninh mạng, mật mã học.', 2);

-- Majors for Công nghệ Nhiệt - Điện lạnh
INSERT INTO major (faculty_id, major_code, name, description, created_by) VALUES
(2, 'NHIET01', 'Kỹ Thuật Nhiệt', 'Đào tạo kỹ sư nhiệt, thiết kế hệ thống năng lượng nhiệt.', 3),
(2, 'NHIET02', 'Kỹ Thuật Điện Lạnh', 'Đào tạo kỹ sư điện lạnh, hệ thống HVAC, điều hòa không khí.', 3);

-- Majors for Cơ khí
INSERT INTO major (faculty_id, major_code, name, description, created_by) VALUES
(3, 'CK01', 'Cơ Khí Chế Tạo Máy', 'Đào tạo kỹ sư thiết kế, chế tạo máy móc, thiết bị công nghiệp.', 4),
(3, 'CK02', 'Cơ Điện Tử', 'Đào tạo kỹ sư tích hợp cơ khí và điện tử, robot công nghiệp.', 4);

-- Majors for Cơ khí Giao thông
INSERT INTO major (faculty_id, major_code, name, description, created_by) VALUES
(4, 'CKGT01', 'Kỹ Thuật Ô Tô', 'Đào tạo kỹ sư ô tô, sửa chữa, bảo dưỡng và cải tiến phương tiện.', 5),
(4, 'CKGT02', 'Công Nghệ Kỹ Thuật Giao Thông', 'Đào tạo kỹ sư về phương tiện và hệ thống giao thông.', 5);

-- Majors for Điện
INSERT INTO major (faculty_id, major_code, name, description, created_by) VALUES
(5, 'DIEN01', 'Kỹ Thuật Điện', 'Đào tạo kỹ sư về hệ thống điện, trạm biến áp, lưới điện.', 6),
(5, 'DIEN02', 'Tự Động Hóa', 'Đào tạo kỹ sư tự động hóa, điều khiển quá trình sản xuất.', 6);

-- Majors for Điện tử - Viễn thông
INSERT INTO major (faculty_id, major_code, name, description, created_by) VALUES
(6, 'DTVT01', 'Điện Tử Viễn Thông', 'Đào tạo kỹ sư điện tử, viễn thông, xử lý tín hiệu.', 7),
(6, 'DTVT02', 'Công Nghệ Đa Phương Tiện', 'Đào tạo kỹ sư xử lý âm thanh, hình ảnh, multimedia.', 7);

-- Majors for Xây dựng Cầu - Đường
INSERT INTO major (faculty_id, major_code, name, description, created_by) VALUES
(12, 'XD01', 'Kỹ Thuật Cầu Đường', 'Đào tạo kỹ sư thiết kế, thi công cầu, đường, hạ tầng giao thông.', 13);

-- Majors for Xây dựng Dân dụng & Công nghiệp
INSERT INTO major (faculty_id, major_code, name, description, created_by) VALUES
(14, 'XDDD01', 'Xây Dựng Dân Dụng', 'Đào tạo kỹ sư xây dựng nhà ở, công trình dân dụng.', 15),
(14, 'XDDD02', 'Xây Dựng Công Nghiệp', 'Đào tạo kỹ sư xây dựng nhà máy, kho tàng, công trình công nghiệp.', 15);

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

-- News from Công nghệ Thông tin
INSERT INTO news (faculty_id, author_id, title, content, thumbnail, created_date) VALUES
(1, 2, 'Sinh viên DUT đạt giải Nhất cuộc thi Lập trình ACM ICPC', 
'<h2>Thành tích xuất sắc tại ACM ICPC</h2>
<p>Đội tuyển sinh viên Khoa Công nghệ Thông tin Trường ĐH Bách Khoa - ĐH Đà Nẵng đã xuất sắc giành giải Nhất cuộc thi Lập trình ACM ICPC khu vực miền Trung.</p>
<p>Đội tuyển gồm 3 sinh viên: Nguyễn Văn A, Trần Văn B, Lê Văn C đã vượt qua 50 đội thi từ các trường đại học trong khu vực.</p>',
'uploads/news-content/acm-icpc.jpg', '2024-10-20'),

(1, 2, 'Hội thảo khoa học quốc tế về AI và Machine Learning', 
'<h2>Hội thảo AI & ML tại DUT</h2>
<p>Ngày 5/11/2024, Khoa Công nghệ Thông tin tổ chức hội thảo khoa học quốc tế về trí tuệ nhân tạo và học máy với sự tham gia của nhiều chuyên gia hàng đầu.</p>',
'uploads/news-content/ai-ml-workshop.jpg', '2024-11-05');

-- News from Công nghệ Nhiệt - Điện lạnh
INSERT INTO news (faculty_id, author_id, title, content, thumbnail, created_date) VALUES
(2, 3, 'Khoa Công nghệ Nhiệt - Điện lạnh ra mắt phòng thí nghiệm mới',
'<h2>Phòng thí nghiệm Điện lạnh hiện đại</h2>
<p>Khoa Công nghệ Nhiệt - Điện lạnh đã chính thức đưa vào hoạt động phòng thí nghiệm HVAC với trang thiết bị hiện đại từ Nhật Bản.</p>',
'uploads/news-content/lab-nhiet.jpg', '2024-10-15');

-- News from Cơ khí
INSERT INTO news (faculty_id, author_id, title, content, thumbnail, created_date) VALUES
(3, 4, 'Sinh viên Khoa Cơ khí giành giải Nhì cuộc thi Sáng tạo Kỹ thuật',
'<h2>Giải thưởng Sáng tạo Kỹ thuật 2024</h2>
<p>Đội sinh viên Khoa Cơ khí đã giành giải Nhì cuộc thi Sáng tạo Kỹ thuật toàn quốc với dự án "Robot hàn tự động".</p>',
'uploads/news-content/sang-tao-ky-thuat.jpg', '2024-10-25');

-- News from Điện
INSERT INTO news (faculty_id, author_id, title, content, thumbnail, created_date) VALUES
(5, 6, 'Khoa Điện kí kết hợp tác với Schneider Electric',
'<h2>Hợp tác chiến lược với Schneider Electric</h2>
<p>Ngày 1/11/2024, Khoa Điện đã ký kết thỏa thuận hợp tác với tập đoàn Schneider Electric về đào tạo và chuyển giao công nghệ.</p>',
'uploads/news-content/schneider.jpg', '2024-11-01');

-- News from Kiến trúc
INSERT INTO news (faculty_id, author_id, title, content, thumbnail, created_date) VALUES
(9, 10, 'Triển lãm đồ án Kiến trúc năm 2024',
'<h2>Triển lãm đồ án Kiến trúc</h2>
<p>Khoa Kiến trúc tổ chức triển lãm đồ án tốt nghiệp với hơn 50 dự án thiết kế sáng tạo từ sinh viên.</p>',
'uploads/news-content/kien-truc-2024.jpg', '2024-11-10');

-- =======================================
-- COMPLETED
-- =======================================
