--View

/*Tạo vw_DanhSachSanPham_HienTh hiển thị danh sách sản phẩm với đầy đủ tên thương hiệu,  loại sản phẩm và quốc gia*/
IF OBJECT_ID('vw_DanhSachSanPham_HienThi', 'V') IS NOT NULL
    DROP VIEW vw_DanhSachSanPham_HienThi;
GO

CREATE VIEW vw_DanhSachSanPham_HienThi AS
SELECT 
    SP.MaSP,
    SP.TenSP,
    L.TenLoai AS LoaiSanPham,
    TH.TenThuongHieu AS HangSanXuat,
    QG.TenQuocGia AS XuatXu,
    BG.GiaBan,
    SP.ThoiGianBaoHanhSP,
    SP.TrangThaiSP
FROM dbo.SANPHAM SP
JOIN dbo.LOAISANPHAM L ON SP.MaLoai = L.MaLoai
JOIN dbo.THUONGHIEU TH ON SP.MaThuongHieu = TH.MaThuongHieu
JOIN dbo.QUOCGIA QG ON SP.MaQuocGia = QG.MaQuocGia
-- Lấy giá bán mới nhất từ bảng Biến Động Giá
LEFT JOIN (
    SELECT MaSP, GiaBan 
    FROM dbo.BIENDONGGIA A 
    WHERE NgayApDung = (SELECT MAX(NgayApDung) FROM dbo.BIENDONGGIA B WHERE B.MaSP = A.MaSP)
) BG ON SP.MaSP = BG.MaSP;
GO

--Kiểm thử: Nhân viên tìm kiếm tất cả các Tivi của hãng Sony đang kinh doanh.
SELECT * FROM vw_DanhSachSanPham_HienThi
WHERE LoaiSanPham = N'Tivi' AND HangSanXuat = N'Sony';


/*Tạo vw_BaoCaoDoanhThu_Thang cung cấp số liệu tổng hợp về tình hình kinh doanh theo từng tháng/năm*/
IF OBJECT_ID('VIEW_BaoCaoDoanhThu_Thang', 'V') IS NOT NULL
    DROP VIEW VIEW_BaoCaoDoanhThu_Thang;
GO

CREATE VIEW VIEW_BaoCaoDoanhThu_Thang AS
SELECT 
    YEAR(hd.NgayLapHD) AS Nam,
    MONTH(hd.NgayLapHD) AS Thang,
    COUNT(DISTINCT hd.MaHoaDon) AS TongSoDonHang,

    -- Tổng tiền hàng lấy từ chi tiết hóa đơn
    SUM(ct.SoLuongMua * ct.DonGiaMua) AS TongTienHang,

    -- Thuế VAT tổng hợp từ bảng hóa đơn
    SUM(hd.ThueVAT) AS TongThueVAT,

    -- Tổng doanh thu (đã gồm VAT) từ hóa đơn
    SUM(ct.ThanhTienHD) AS TongDoanhThu
FROM HOADON hd
JOIN CHITIETHOADON ct 
    ON hd.MaHoaDon = ct.MaHoaDon
WHERE hd.TrangThaiHD = N'Đã thanh toán'
GROUP BY YEAR(hd.NgayLapHD), MONTH(hd.NgayLapHD);
GO

--Kiểm thử: Kế toán muốn xem doanh thu 3 tháng cuối năm 2023.

SELECT * FROM VIEW_BaoCaoDoanhThu_Thang
WHERE Nam = 2023 AND Thang IN (10, 11, 12)
ORDER BY Thang DESC;

--Tạo một khung nhìn chứa toàn bộ thông tin cần thiết để In hóa đơn cho khách hàng.
IF OBJECT_ID('vw_ChiTietHoaDon_DayDu', 'V') IS NOT NULL
    DROP VIEW vw_ChiTietHoaDon_DayDu;
GO

CREATE VIEW vw_ChiTietHoaDon_DayDu AS
SELECT 
    HD.MaHoaDon,
    HD.NgayLapHD,
    -- Lấy thông tin khách hàng từ bảng DONHANG
    KH.HoTenKH,
    KH.SoDienThoaiKH,
    -- Lấy thông tin nhân viên từ bảng DONHANG
    NV.HoTenNV AS NhanVienBan,
    -- Sản phẩm và chi tiết thanh toán
    SP.TenSP,
    CT.SoLuongMua,
    CT.DonGiaMua,
    CT.ThanhTienHD AS ThanhTienChiTiet,
    -- Khuyến mãi áp dụng
    KM.TenChuongTrinh AS KhuyenMaiApDung
FROM dbo.HOADON HD
JOIN dbo.DONHANG DH ON HD.MaDH = DH.MaDH
JOIN dbo.KHACHHANG KH ON DH.MaKH = KH.MaKH
JOIN dbo.NHANVIEN NV ON DH.MaNV = NV.MaNV
JOIN dbo.CHITIETHOADON CT ON HD.MaHoaDon = CT.MaHoaDon
JOIN dbo.SANPHAM SP ON CT.MaSP = SP.MaSP

LEFT JOIN dbo.KHUYENMAI KM ON HD.MaKhuyenMai = KM.MaKhuyenMai;
GO

--Kiểm thử: In chi tiết các món hàng của hóa đơn mã 'HD01'.
SELECT TenSP, SoLuongMua, DonGiaMua, ThanhTienChiTiet
FROM vw_ChiTietHoaDon_DayDu
WHERE MaHoaDon = 'HD01';

--Tạo vw_KhachHang_VIP để lọc ra danh sách "Khách hàng VIP" là những người có tổng chi tiêu trên 50.000.000 VNĐ.
--Tạo view nền
IF OBJECT_ID('vw_TongChiTieu_KhachHang', 'V') IS NOT NULL
    DROP VIEW vw_TongChiTieu_KhachHang;
GO

CREATE VIEW vw_TongChiTieu_KhachHang AS
SELECT 
    KH.MaKH,
    KH.HoTenKH,
    KH.SoDienThoaiKH,

    -- Tổng thành tiền của tất cả các chi tiết hóa đơn của khách hàng
    SUM(CT.ThanhTienHD) AS TongDaChi
FROM dbo.KHACHHANG KH
JOIN dbo.DONHANG DH ON KH.MaKH = DH.MaKH         -- KH liên kết Đơn hàng
JOIN dbo.HOADON HD ON DH.MaDH = HD.MaDH -- Đơn hàng → Hóa đơn
JOIN dbo.CHITIETHOADON CT ON HD.MaHoaDon = CT.MaHoaDon -- Hóa đơn → Chi tiết
WHERE HD.TrangThaiHD = N'Đã thanh toán'
GROUP BY KH.MaKH, KH.HoTenKH, KH.SoDienThoaiKH;
GO


--Tạo vw_KhachHang_VIP để lọc ra danh sách "Khách hàng VIP" là những người có tổng chi tiêu trên 50.000.000 VNĐ.
--Tạo view lồng
IF OBJECT_ID('vw_KhachHang_VIP', 'V') IS NOT NULL
    DROP VIEW VIEW_KhachHang_VIP;
GO

CREATE VIEW vw_KhachHang_VIP AS
SELECT 
    KH.MaKH,
    KH.HoTenKH,
    KH.SoDienThoaiKH,
    KH.TongDaChi,
    N'Khách hàng Kim Cương' AS XepHang
FROM vw_TongChiTieu_KhachHang KH
WHERE KH.TongDaChi >= 50000000;
GO

--Kiểm thử: Marketing cần danh sách VIP để gửi tin nhắn chúc mừng năm mới.
SELECT * FROM vw_KhachHang_VIP
ORDER BY TongDaChi DESC;