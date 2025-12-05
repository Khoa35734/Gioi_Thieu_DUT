-- =======================================
-- SCRIPT KIỂM TRA DATABASE - 14 KHOA DUT
-- =======================================

USE gioi_thieu_dut;

-- =======================================
-- 1. KIỂM TRA SỐ LƯỢNG
-- =======================================
SELECT
    'FACULTY' as table_name,
    COUNT(*) as total_count,
    CASE
        WHEN COUNT(*) = 14 THEN '✅ OK - Đủ 14 khoa'
        ELSE '❌ ERROR - Thiếu khoa'
    END as status
FROM faculty

UNION ALL

SELECT
    'ADMIN' as table_name,
    COUNT(*) as total_count,
    CASE
        WHEN COUNT(*) = 15 THEN '✅ OK - 1 super + 14 khoa'
        ELSE '❌ ERROR - Thiếu admin'
    END as status
FROM admin

UNION ALL

SELECT
    'MAJOR' as table_name,
    COUNT(*) as total_count,
    '✅ OK' as status
FROM major

UNION ALL

SELECT
    'NEWS' as table_name,
    COUNT(*) as total_count,
    '✅ OK' as status
FROM news;

-- =======================================
-- 2. DANH SÁCH 14 KHOA
-- =======================================
SELECT
    id,
    name as 'Tên Khoa',
    LEFT(description, 50) as 'Mô tả',
    created_at as 'Ngày tạo'
FROM faculty
ORDER BY id;

-- =======================================
-- 3. DANH SÁCH ADMIN THEO KHOA
-- =======================================
SELECT
    a.id,
    a.username as 'Username',
    a.full_name as 'Họ tên',
    a.role as 'Vai trò',
    COALESCE(f.name, 'SUPER ADMIN') as 'Khoa'
FROM admin a
LEFT JOIN faculty f ON a.faculty_id = f.id
ORDER BY a.id;

-- =======================================
-- 4. THỐNG KÊ NGÀNH THEO KHOA
-- =======================================
SELECT
    f.id,
    f.name as 'Khoa',
    COUNT(m.id) as 'Số ngành',
    GROUP_CONCAT(m.name SEPARATOR ', ') as 'Danh sách ngành'
FROM faculty f
LEFT JOIN major m ON f.id = m.faculty_id
GROUP BY f.id, f.name
ORDER BY f.id;

-- =======================================
-- 5. THỐNG KÊ BÀI VIẾT THEO KHOA
-- =======================================
SELECT
    COALESCE(f.name, 'TIN TỔNG HỢP') as 'Khoa',
    COUNT(n.id) as 'Số bài viết',
    GROUP_CONCAT(LEFT(n.title, 40) SEPARATOR ' | ') as 'Tiêu đề (40 ký tự đầu)'
FROM news n
LEFT JOIN faculty f ON n.faculty_id = f.id
GROUP BY f.name
ORDER BY f.id;

-- =======================================
-- 6. KIỂM TRA TÀI KHOẢN ADMIN
-- =======================================
-- Test login credentials
SELECT
    'SUPER ADMIN' as 'Loại tài khoản',
    username as 'Username',
    password as 'Password',
    'Đăng nhập vào dashboard super admin' as 'Mô tả'
FROM admin
WHERE role = 'super_admin'

UNION ALL

SELECT
    'FACULTY ADMIN' as 'Loại tài khoản',
    username as 'Username',
    'khoa123' as 'Password',
    CONCAT('Đăng nhập vào dashboard khoa: ', f.name) as 'Mô tả'
FROM admin a
JOIN faculty f ON a.faculty_id = f.id
WHERE role = 'faculty_admin'
ORDER BY username;

-- =======================================
-- 7. KIỂM TRA FACULTY_ID TRONG ADMIN
-- =======================================
-- Đảm bảo mỗi khoa có đúng 1 admin
SELECT
    f.id as 'ID Khoa',
    f.name as 'Tên Khoa',
    COUNT(a.id) as 'Số admin',
    CASE
        WHEN COUNT(a.id) = 1 THEN '✅ OK'
        WHEN COUNT(a.id) = 0 THEN '❌ THIẾU ADMIN'
        ELSE '⚠️ THỪA ADMIN'
    END as 'Trạng thái'
FROM faculty f
LEFT JOIN admin a ON f.id = a.faculty_id
GROUP BY f.id, f.name
ORDER BY f.id;

-- =======================================
-- 8. KIỂM TRA ORPHAN MAJORS
-- =======================================
-- Kiểm tra các ngành không thuộc khoa nào
SELECT
    m.id,
    m.major_code as 'Mã ngành',
    m.name as 'Tên ngành',
    m.faculty_id as 'ID Khoa',
    f.name as 'Tên khoa'
FROM major m
LEFT JOIN faculty f ON m.faculty_id = f.id
WHERE f.id IS NULL;

-- Nếu kết quả trống = OK
-- Nếu có dữ liệu = ERROR: có ngành không thuộc khoa nào

-- =======================================
-- 9. KIỂM TRA ORPHAN NEWS
-- =======================================
-- Kiểm tra các bài viết có faculty_id không hợp lệ
SELECT
    n.id,
    n.title as 'Tiêu đề',
    n.faculty_id as 'ID Khoa',
    f.name as 'Tên khoa'
FROM news n
LEFT JOIN faculty f ON n.faculty_id = f.id
WHERE n.faculty_id IS NOT NULL AND f.id IS NULL;

-- Nếu kết quả trống = OK
-- Nếu có dữ liệu = ERROR: có bài viết thuộc khoa không tồn tại

-- =======================================
-- 10. TỔNG KẾT KIỂM TRA
-- =======================================
SELECT
    '============================' as '============================',
    'TỔNG KẾT KIỂM TRA DATABASE' as 'TỔNG KẾT',
    '============================' as '============================';

SELECT
    'Tổng số khoa' as 'Tiêu chí',
    COUNT(*) as 'Giá trị',
    '14' as 'Mong đợi',
    CASE WHEN COUNT(*) = 14 THEN '✅ PASS' ELSE '❌ FAIL' END as 'Kết quả'
FROM faculty

UNION ALL

SELECT
    'Tổng số admin',
    COUNT(*),
    '15',
    CASE WHEN COUNT(*) = 15 THEN '✅ PASS' ELSE '❌ FAIL' END
FROM admin

UNION ALL

SELECT
    'Số khoa có admin',
    COUNT(DISTINCT a.faculty_id),
    '14',
    CASE WHEN COUNT(DISTINCT a.faculty_id) = 14 THEN '✅ PASS' ELSE '❌ FAIL' END
FROM admin a
WHERE a.faculty_id IS NOT NULL

UNION ALL

SELECT
    'Tổng số ngành',
    COUNT(*),
    '>= 10',
    CASE WHEN COUNT(*) >= 10 THEN '✅ PASS' ELSE '❌ FAIL' END
FROM major

UNION ALL

SELECT
    'Tổng số bài viết',
    COUNT(*),
    '>= 5',
    CASE WHEN COUNT(*) >= 5 THEN '✅ PASS' ELSE '❌ FAIL' END
FROM news;

-- =======================================
-- COMPLETED
-- =======================================

