-- Bài thực hành truy vấn CSDL Quản lý bán hàng
USE QuanLyBanHang;

-- 1. Dữ liệu khách hàng
INSERT INTO Customer (cID, cName, cAge) VALUES
    (1, 'Minh Quan', 10),
    (2, 'Ngoc Oanh', 20),
    (3, 'Hong Ha', 50);

-- 2. Dữ liệu hóa đơn
INSERT INTO `Order` (oID, cID, oDate, oTotalPrice) VALUES
    (1, 1, '2006-03-21', NULL),
    (2, 2, '2006-03-23', NULL),
    (3, 1, '2006-03-16', NULL);

-- 3. Dữ liệu sản phẩm
INSERT INTO Product (pID, pName, pPrice) VALUES
    (1, 'May Giat', 3),
    (2, 'Tu Lanh', 5),
    (3, 'Dieu Hoa', 7),
    (4, 'Quat', 1),
    (5, 'Bep Dien', 2);

-- 4. Dữ liệu chi tiết hóa đơn
INSERT INTO OrderDetail (oID, pID, odQTY) VALUES
    (1, 1, 3),
    (1, 3, 7),
    (1, 4, 2),
    (2, 1, 1),
    (3, 1, 8),
    (2, 5, 4),
    (2, 3, 3);

-- 5. Hiển thị mã, ngày và tổng tiền đang lưu của mọi hóa đơn
SELECT oID, oDate, oTotalPrice AS oPrice
FROM `Order`;

-- 6. Khách hàng đã mua hàng và các sản phẩm họ đã mua
SELECT DISTINCT
    C.cName AS customer_name,
    P.pName AS product_name
FROM Customer AS C
JOIN `Order` AS O ON O.cID = C.cID
JOIN OrderDetail AS OD ON OD.oID = O.oID
JOIN Product AS P ON P.pID = OD.pID
ORDER BY C.cName, P.pName;

-- 7. Khách hàng chưa mua bất kỳ sản phẩm nào
SELECT C.cName AS customer_name
FROM Customer AS C
LEFT JOIN `Order` AS O ON O.cID = C.cID
WHERE O.oID IS NULL;

-- 8. Mã hóa đơn, ngày bán và giá tính từ số lượng nhân đơn giá
SELECT
    O.oID,
    O.oDate,
    SUM(OD.odQTY * P.pPrice) AS oPrice
FROM `Order` AS O
JOIN OrderDetail AS OD ON OD.oID = O.oID
JOIN Product AS P ON P.pID = OD.pID
GROUP BY O.oID, O.oDate
ORDER BY O.oID;
