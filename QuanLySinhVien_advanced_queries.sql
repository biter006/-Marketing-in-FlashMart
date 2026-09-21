-- Bài thực hành truy vấn nâng cao CSDL Quản lý sinh viên
USE QuanLySinhVien;

-- 1. Sinh viên có tên bắt đầu bằng ký tự h/H
SELECT *
FROM Student
WHERE StudentName LIKE 'h%';

-- 2. Lớp học có ngày bắt đầu vào tháng 12
SELECT *
FROM Class
WHERE MONTH(StartDate) = 12;

-- 3. Môn học có Credit từ 3 đến 5 (bao gồm 3 và 5)
SELECT *
FROM Subject
WHERE Credit BETWEEN 3 AND 5;

-- 4. Chuyển học viên Hung sang lớp có ClassID là 2
UPDATE Student
SET ClassID = 2
WHERE StudentName = 'Hung';

-- 5. Hiển thị điểm, sắp xếp điểm giảm dần rồi tên tăng dần
SELECT
    S.StudentName,
    Sub.SubName,
    M.Mark
FROM Student AS S
JOIN Mark AS M ON M.StudentID = S.StudentID
JOIN Subject AS Sub ON Sub.SubID = M.SubID
ORDER BY M.Mark DESC, S.StudentName ASC;
