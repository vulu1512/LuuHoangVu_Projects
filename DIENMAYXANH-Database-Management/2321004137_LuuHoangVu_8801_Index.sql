--INDEX

-- Kiểm tra và xóa Index cũ nếu có
IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IDX_KhachHang_SDT')
    DROP INDEX IDX_KhachHang_SDT ON dbo.KHACHHANG;
GO

-- Tạo Index trên cột SoDienThoaiKH
CREATE INDEX IDX_KhachHang_SDT
ON dbo.KHACHHANG (SoDienThoaiKH)
GO


--Kiểm thử tốc độ (Tìm khách hàng để tích điểm)
SET STATISTICS IO ON;

--Kiểm tra khi có sử dụng INDEX
-- Tra cứu khách hàng theo SĐT
SELECT MaKH, HoTenKH, DiemTichLuy 
FROM KHACHHANG WITH (INDEX(IDX_KhachHang_SDT))
WHERE SoDienThoaiKH = '0901111111';

--Kiểm tra khi không sử dụng INDEX
SELECT MaKH, HoTenKH, DiemTichLuy 
FROM KHACHHANG 
WHERE SoDienThoaiKH = '0901111111';

-- Cố tình thêm một khách hàng mới với SĐT đã tồn tại ('0901111111')
INSERT INTO KHACHHANG (MAKH, HOTENKH, SODIENTHOAIKH, DIACHIKH)
VALUES ('KH_TEST_DUP', N'Khách Hàng Trùng', '0901111111', N'Hà Nội');

-- Kiểm tra và xóa nếu đã tồn tại
IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IDX_DonHang_KhachHang_NgayTao')
    DROP INDEX IDX_DonHang_KhachHang_NgayTao ON dbo.DONHANG;
GO

-- Tạo Composite Index trên 2 cột: MaKH (ưu tiên 1) và NgayTaoDH (ưu tiên 2)
CREATE INDEX IDX_DonHang_KhachHang_NgayTao
ON dbo.DONHANG (MaKH ASC, NgayTaoDH DESC)
GO

-- Tìm lịch sử mua hàng của khách KH01 trong tháng 10/2023
-- Khi có sử dụng INDEX
SELECT MaDH, NgayTaoDH, TrangThaiDH
FROM DONHANG WITH (INDEX(IDX_DonHang_KhachHang_NgayTao))
WHERE MaKH = 'KH01' 
  AND NgayTaoDH >= '2023-10-01' AND NgayTaoDH <= '2023-10-31';

-- Khi không sử dụng INDEX
SELECT MaDH, NgayTaoDH, TrangThaiDH
FROM DONHANG 
WHERE MaKH = 'KH01' 
  AND NgayTaoDH >= '2023-10-01' AND NgayTaoDH <= '2023-10-31';