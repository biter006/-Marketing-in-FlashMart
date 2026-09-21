# Nhật ký trao đổi AI về JOIN

## INNER JOIN và LEFT JOIN

**Prompt:** Trong MySQL, `JOIN` không ghi rõ loại JOIN hoạt động như thế nào? Các bản ghi không khớp có được giữ lại không?

**Kết quả áp dụng:** `JOIN` mặc định là `INNER JOIN`; chỉ các dòng có khóa khớp ở cả hai bảng được trả về. Báo cáo Marketing cần giữ Charlie nên dùng `LEFT JOIN` với `Customers` ở bên trái.

## COUNT trong LEFT JOIN

**Prompt:** Khi dùng `LEFT JOIN`, tại sao nên dùng `COUNT(o.order_id)` thay vì `COUNT(*)` để đếm đơn hàng?

**Kết quả áp dụng:** `COUNT(o.order_id)` bỏ qua `NULL` nên khách hàng không có đơn hàng được đếm là 0. `COUNT(*)` đếm cả dòng NULL được giữ bởi `LEFT JOIN`, dẫn đến kết quả sai là 1.

## Anti Join

**Prompt:** Vì sao điều kiện `WHERE o.order_id IS NULL` phải đi cùng `LEFT JOIN` khi tìm sản phẩm chưa bán?

**Kết quả áp dụng:** `LEFT JOIN` tạo các dòng có phần `Orders` là `NULL` cho sản phẩm chưa bán. `WHERE o.order_id IS NULL` lọc chính xác các dòng đó. `INNER JOIN` đã loại các dòng không khớp trước khi mệnh đề `WHERE` được áp dụng.
