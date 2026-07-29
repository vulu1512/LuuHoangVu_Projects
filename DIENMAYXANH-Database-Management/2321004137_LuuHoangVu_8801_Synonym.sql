--SYNONYM

-- Kiểm tra nếu Synonym đã tồn tại thì xóa đi để tạo mới
IF EXISTS (SELECT * FROM sys.synonyms WHERE name = 'SP')
    DROP SYNONYM SP;
GO

-- Tạo Synonym SP tham chiếu tới bảng gốc SANPHAM
CREATE SYNONYM SP FOR dbo.SANPHAM;
GO

-- Truy vấn qua Synonym (Kết quả trả về y hệt bảng gốc)
SELECT * FROM SP

-- Tạo View để lọc khách hàng hạng Vàng
IF OBJECT_ID('VIEW_KhachHangVang', 'V') IS NOT NULL
    DROP VIEW VIEW_KhachHangVang;
GO

CREATE VIEW VIEW_KhachHangVang AS
SELECT 
    MAKH, 
    HOTENKH, 
    SODIENTHOAIKH, 
    HANGTHANHVIEN, 
    DIEMTICHLUY
FROM dbo.KHACHHANG
WHERE HANGTHANHVIEN = N'Vàng'; -- Điều kiện lọc hạng Vàng
GO

-- Xóa Synonym nếu đã tồn tại
IF EXISTS (SELECT * FROM sys.synonyms WHERE name = 'SKhachHangVang')
    DROP SYNONYM KhachHangVang;
GO

-- Tạo Synonym trỏ vào View
CREATE SYNONYM KhachHangVang FOR dbo.VIEW_KhachHangVang;
GO


-- Truy vấn kiểm thử qua Synonym
SELECT * FROM KhachHangVang;