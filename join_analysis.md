# Giải trình COUNT trong LEFT JOIN

Trong báo cáo Marketing, `Customers` là bảng gốc nên dùng `LEFT JOIN` để giữ lại cả khách hàng chưa mua hàng. Với Charlie, các cột của `Orders` sau khi nối đều là `NULL`.

`COUNT(o.order_id)` chỉ đếm giá trị không phải `NULL`, vì vậy Charlie có kết quả `0` đơn hàng. Ngược lại, `COUNT(*)` đếm mọi dòng kết quả của phép nối. `LEFT JOIN` vẫn tạo một dòng cho Charlie để giữ bản ghi khách hàng, nên `COUNT(*)` sẽ trả về `1` và làm sai báo cáo. Vì vậy cần đếm khóa chính của bảng phụ là `o.order_id`, không dùng `COUNT(*)`.
