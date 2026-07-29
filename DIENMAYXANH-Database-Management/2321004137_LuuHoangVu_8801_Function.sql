--Function

--Tạo f_TinhTongChiTieuKhachHang để tính tổng số tiền mà một khách hàng cụ thể đã chi tiêu tại cửa hàng.
-- Kiểm tra và xóa nếu function đã tồn tại
IF OBJECT_ID('f_TinhTongChiTieuKhachHang', 'FN') IS NOT NULL
    DROP FUNCTION f_TinhTongChiTieuKhachHang;
GO

CREATE FUNCTION f_TinhTongChiTieuKhachHang (@MaKH CHAR(10))
RETURNS DECIMAL(18, 0)
AS
BEGIN
    DECLARE @TongTien DECIMAL(18, 0);

    SELECT @TongTien = SUM(CT.ThanhTienHD)
    FROM KHACHHANG KH
    JOIN DONHANG DH ON KH.MaKH = DH.MaKH
    JOIN HOADON HD ON DH.MaDH = HD.MaDH
    JOIN CHITIETHOADON CT ON HD.MaHoaDon = CT.MaHoaDon
    WHERE KH.MaKH = @MaKH
      AND HD.TrangThaiHD = N'Đã thanh toán';

    RETURN ISNULL(@TongTien, 0);
END;
GO

--Kiểm thử: Tính tổng tiền khách hàng có mã 'KH01' đã mua và so sánh với việc viết câu lệnh Select thủ công.
-- 1. Gọi hàm để lấy kết quả
SELECT dbo.f_TinhTongChiTieuKhachHang('KH01') AS TongTienDaMua;

-- 2. Ứng dụng thực tế: Hiển thị danh sách khách hàng kèm tổng chi tiêu
SELECT 
    MaKH, 
    HoTenKH, 
    dbo.f_TinhTongChiTieuKhachHang(MaKH) AS TongChiTieu
FROM KHACHHANG
ORDER BY TongChiTieu DESC;

/*Tạo  f_TraCuuLichSuGiaoDich để trả về danh sách chi tiết lịch sử mua hàng của một sản phẩm bất kỳ trong một khoảng thời gian nhất định.*/
-- Kiểm tra và xóa nếu function đã tồn tại
IF OBJECT_ID('f_TraCuuLichSuGiaoDich', 'IF') IS NOT NULL
    DROP FUNCTION f_TraCuuLichSuGiaoDich;
GO

CREATE FUNCTION f_TraCuuLichSuGiaoDich 
(
    @MaSP CHAR(10),
    @TuNgay DATETIME,
    @DenNgay DATETIME
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        HD.MaHoaDon,
        HD.NgayLapHD,
        KH.HoTenKH,
        CT.SoLuongMua,
        CT.DonGiaMua,
        CT.ThanhTienHD
    FROM CHITIETHOADON CT
    JOIN HOADON HD      ON CT.MaHoaDon = HD.MaHoaDon
    JOIN DONHANG DH     ON HD.MaDH = DH.MaDH
    JOIN KHACHHANG KH   ON DH.MaKH = KH.MaKH
    WHERE CT.MaSP = @MaSP 
      AND HD.NgayLapHD BETWEEN @TuNgay AND @DenNgay
);
GO

--Kiểm thử: Tìm lịch sử giao dịch của sản phẩm mã 'SP01' (iPhone 14 Pro Max) từ ngày 01/10/2023 đến 31/12/2023.
-- Gọi hàm và lấy dữ liệu như một bảng bình thường
SELECT * FROM dbo.f_TraCuuLichSuGiaoDich('SP01', '2023-10-01', '2023-12-31')
ORDER BY NgayLapHD DESC;


