-- Transaction 2

--Giám đốc
-- Thiết lập mức độ cô lập thấp nhất (Cho phép đọc dữ liệu chưa Commit)
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

BEGIN TRANSACTION;
    -- Truy vấn xem giá SP01 ngay lúc này
    SELECT MaSP, GiaBan 
    FROM BIENDONGGIA 
    WHERE MaSP = 'SP01';
COMMIT;