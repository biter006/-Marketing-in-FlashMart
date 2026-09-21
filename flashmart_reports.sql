-- Báo cáo FlashMart: LEFT JOIN và Anti-Join
CREATE DATABASE IF NOT EXISTS flashmart_db;
USE flashmart_db;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    CONSTRAINT FK_Orders_Customers
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    CONSTRAINT FK_Orders_Products
        FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Customers (customer_id, name) VALUES
    (1, 'Alice'),
    (2, 'Bob'),
    (3, 'Charlie');

INSERT INTO Products (product_id, product_name) VALUES
    (101, 'Laptop'),
    (102, 'Mouse'),
    (103, 'Keyboard');

INSERT INTO Orders (order_id, customer_id, product_id) VALUES
    (1001, 1, 101),
    (1002, 1, 102),
    (1003, 2, 101);

-- Báo cáo Marketing: giữ cả khách hàng chưa có đơn hàng.
-- COUNT(o.order_id) trả về 0 khi không có đơn hàng tương ứng.
SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders
FROM Customers AS c
LEFT JOIN Orders AS o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY c.customer_id;

-- Báo cáo Kho vận: các sản phẩm chưa từng xuất hiện trong đơn hàng.
SELECT
    p.product_id,
    p.product_name
FROM Products AS p
LEFT JOIN Orders AS o ON p.product_id = o.product_id
WHERE o.order_id IS NULL
ORDER BY p.product_id;
