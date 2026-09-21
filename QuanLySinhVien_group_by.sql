-- Bài thực hành hàm tổng hợp và GROUP BY
USE QuanLySinhVien;

-- 1. Số lượng học viên theo địa chỉ
SELECT
    Address,
    COUNT(StudentID) AS so_luong_hoc_vien
FROM Student
GROUP BY Address;

-- 2. Điểm trung bình các môn của mỗi học viên
SELECT
    S.StudentID,
    S.StudentName,
    AVG(M.Mark) AS diem_trung_binh
FROM Student AS S
JOIN Mark AS M ON M.StudentID = S.StudentID
GROUP BY S.StudentID, S.StudentName;

-- 3. Học viên có điểm trung bình lớn hơn 15
SELECT
    S.StudentID,
    S.StudentName,
    AVG(M.Mark) AS diem_trung_binh
FROM Student AS S
JOIN Mark AS M ON M.StudentID = S.StudentID
GROUP BY S.StudentID, S.StudentName
HAVING AVG(M.Mark) > 15;

-- 4. Học viên có điểm trung bình lớn nhất (bao gồm các trường hợp đồng điểm)
SELECT
    S.StudentID,
    S.StudentName,
    AVG(M.Mark) AS diem_trung_binh
FROM Student AS S
JOIN Mark AS M ON M.StudentID = S.StudentID
GROUP BY S.StudentID, S.StudentName
HAVING AVG(M.Mark) >= ALL (
    SELECT AVG(Mark)
    FROM Mark
    GROUP BY StudentID
);
