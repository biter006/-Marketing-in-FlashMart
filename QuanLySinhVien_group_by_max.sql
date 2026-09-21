-- Bài thực hành GROUP BY: giá trị lớn nhất và xếp hạng điểm trung bình
USE QuanLySinhVien;

-- 1. Toàn bộ thông tin các môn học có Credit lớn nhất
SELECT *
FROM Subject
WHERE Credit = (
    SELECT MAX(Credit)
    FROM Subject
);

-- 2. Thông tin môn học có điểm thi lớn nhất
SELECT DISTINCT Sub.*
FROM Subject AS Sub
JOIN Mark AS M ON M.SubID = Sub.SubID
WHERE M.Mark = (
    SELECT MAX(Mark)
    FROM Mark
);

-- 3. Thông tin sinh viên và điểm trung bình, xếp điểm giảm dần
SELECT
    S.StudentID,
    S.StudentName,
    S.Address,
    S.Phone,
    S.Status,
    S.ClassID,
    AVG(M.Mark) AS diem_trung_binh
FROM Student AS S
LEFT JOIN Mark AS M ON M.StudentID = S.StudentID
GROUP BY
    S.StudentID,
    S.StudentName,
    S.Address,
    S.Phone,
    S.Status,
    S.ClassID
ORDER BY diem_trung_binh DESC;
