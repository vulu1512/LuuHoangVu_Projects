--Store Procedure

-- Tạo sp_ThemKhachHangMoi để thêm một hồ sơ khách hàng mới vào hệ thống khi họ đến mua hàng lần đầu.
IF OBJECT_ID('sp_ThemKhachHangMoi', 'P') IS NOT NULL
    DROP PROC sp_ThemKhachHangMoi;
GO

CREATE PROC sp_ThemKhachHangMoi
    @HoTen NVARCHAR(150),
    @SDT VARCHAR(15),
    @GioiTinh NVARCHAR(15),
    @DiaChi NVARCHAR(200)
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Kiểm tra trùng số điện thoại
    IF EXISTS (SELECT 1 FROM KHACHHANG WHERE SODIENTHOAIKH = @SDT)
    BEGIN
        PRINT N'Lỗi: Số điện thoại khách hàng này đã tồn tại!';
        RETURN;
    END

    -- 2. Sinh mã khách hàng tự động (Ví dụ đơn giản: KH + Random hoặc đếm số)
    -- Trong thực tế nên dùng Sequence, ở đây demo dùng hàm đếm
    DECLARE @MaKH CHAR(10);
    SELECT @MaKH = 'KH' + CAST((COUNT(*) + 100) AS VARCHAR(5)) FROM KHACHHANG;

    -- 3. Thêm mới
    INSERT INTO KHACHHANG (MAKH, HOTENKH, SODIENTHOAIKH, GIOITINHKH, DIACHIKH, DIEMTICHLUY)
    VALUES (@MaKH, @HoTen, @SDT, @GioiTinh, @DiaChi, 0);

    PRINT N'Thêm khách hàng thành công với Mã: ' + @MaKH;
END;
GO

--Kiểm thử
-- Test 1: Thêm khách hàng mới hợp lệ
EXEC sp_ThemKhachHangMoi N'Nguyễn Văn Nam', '0999999998', N'Nam', N'Hà Nội';

-- Test 2: Thêm lại SĐT trên (Sẽ báo lỗi)
EXEC sp_ThemKhachHangMoi N'Nguyễn Thị Huệ', '0999999998', N'Nữ', N'Huế';

--Tạo sp_ThemChiTietHoaDon để xử lý nghiệp vụ bán hàng.
IF OBJECT_ID('sp_ThemChiTietHoaDon', 'P') IS NOT NULL
    DROP PROC sp_ThemChiTietHoaDon;
GO

CREATE PROC sp_ThemChiTietHoaDon
    @MaHD CHAR(10),
    @MaSP CHAR(10),
    @SoLuong INT
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Lấy giá bán hiện tại
    DECLARE @DonGia DECIMAL(18,0);
    SELECT TOP 1 @DonGia = GiaBan 
    FROM BIENDONGGIA 
    WHERE MaSP = @MaSP AND NgayApDung <= GETDATE()
    ORDER BY NgayApDung DESC;

    IF @DonGia IS NULL
    BEGIN
        PRINT N'Lỗi: Sản phẩm chưa có giá bán!';
        RETURN;
    END

    -- 2. Kiểm tra tồn tại trong chi tiết
    IF EXISTS (SELECT 1 FROM CHITIETHOADON WHERE MAHOADON = @MaHD AND MASP = @MaSP)
    BEGIN
        -- Update tăng số lượng
        UPDATE CHITIETHOADON
        SET SOLUONGMUA = SOLUONGMUA + @SoLuong,
            THANHTIENHD = (SOLUONGMUA + @SoLuong) * DONGIAMUA
        WHERE MAHOADON = @MaHD AND MASP = @MaSP;
    END
    ELSE
    BEGIN
        -- Insert dòng mới
        INSERT INTO CHITIETHOADON (MAHOADON, MASP, SOLUONGMUA, DONGIAMUA, THANHTIENHD)
        VALUES (@MaHD, @MaSP, @SoLuong, @DonGia, @SoLuong * @DonGia);
    END
END;
GO

-- Giả sử đã có hóa đơn 'HD01'
-- Lần 1: Mua mới 2 cái SP01
EXEC sp_ThemChiTietHoaDon 'HD01', 'SP01', 2;

-- Lần 2: Mua thêm 3 cái SP01 nữa (Tổng sẽ là 5)
EXEC sp_ThemChiTietHoaDon 'HD01', 'SP01', 3;

-- Kiểm tra kết quả
SELECT * FROM CHITIETHOADON WHERE MAHOADON = 'HD01' AND MASP = 'SP01';


--Tạo sp_BaoCaoDoanhThuTheoNgay báo cáo thống kê.
IF OBJECT_ID('sp_BaoCaoDoanhThuTheoNgay', 'P') IS NOT NULL
    DROP PROC sp_BaoCaoDoanhThuTheoNgay;
GO

CREATE PROC sp_BaoCaoDoanhThuTheoNgay
    @TuNgay DATE,
    @DenNgay DATE
AS
BEGIN
    SELECT 
        COUNT(DISTINCT HD.MaHoaDon) AS TongSoDon,

        ISNULL(SUM(HD.TongTienHD), 0) AS TongTienHang,

        ISNULL(SUM(HD.ThueVAT), 0) AS TongThueVAT,

        ISNULL(SUM(CT.ThanhTienHD), 0) AS TongDoanhThuThucTe
    FROM HOADON HD
    JOIN CHITIETHOADON CT ON HD.MaHoaDon = CT.MaHoaDon
    WHERE HD.NgayLapHD BETWEEN @TuNgay AND @DenNgay
      AND HD.TrangThaiHD = N'Đã thanh toán';
END;
GO

-- Kiểm thử: Xem doanh thu tháng 10/2023
EXEC sp_BaoCaoDoanhThuTheoNgay '2023-10-01', '2023-10-31';

--Tạo sp_TimKiemSanPhamNangCao để tìm kiếm động.
IF OBJECT_ID('sp_TimKiemSanPhamNangCao', 'P') IS NOT NULL
    DROP PROC sp_TimKiemSanPhamNangCao;
GO

CREATE PROC sp_TimKiemSanPhamNangCao
    @TuKhoa NVARCHAR(100),
    @GiaTu DECIMAL(18,0),
    @GiaDen DECIMAL(18,0)
AS
BEGIN
    SELECT 
        SP.MASP, SP.TENSP, TH.TENTHUONGHIEU, BG.GIABAN
    FROM SANPHAM SP
    JOIN THUONGHIEU TH ON SP.MATHUONGHIEU = TH.MATHUONGHIEU
    -- Join bảng giá mới nhất
    JOIN (
        SELECT MASP, GIABAN 
        FROM BIENDONGGIA A 
        WHERE NGAYAPDUNG = (SELECT MAX(NGAYAPDUNG) FROM BIENDONGGIA B WHERE B.MASP = A.MASP)
    ) BG ON SP.MASP = BG.MASP
    WHERE SP.TENSP LIKE '%' + @TuKhoa + '%'
      AND BG.GIABAN >= @GiaTu 
      AND BG.GIABAN <= @GiaDen;
END;
GO

--Kiểm thử: Tìm các loại 'Tivi' có giá từ 10 triệu đến 20 triệu
EXEC sp_TimKiemSanPhamNangCao N'Tivi', 10000000, 20000000;

--Tạo sp_TopSanPhamBanChay để tìm ra danh sách các sản phẩm bán chạy nhất
IF OBJECT_ID('sp_TopSanPhamBanChay', 'P') IS NOT NULL
    DROP PROC sp_TopSanPhamBanChay;
GO

CREATE PROC sp_TopSanPhamBanChay
    @Thang INT,
    @Nam INT,
    @TopN INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Kiểm tra tham số đầu vào hợp lệ
    IF @Thang < 1 OR @Thang > 12
    BEGIN
        PRINT N'Lỗi: Tháng không hợp lệ!';
        RETURN;
    END

    SELECT TOP (@TopN)
        SP.MaSP,
        SP.TenSP,
        L.TenLoai AS LoaiSanPham,
        SUM(CT.SoLuongMua) AS TongSoLuongBan,
        SUM(CT.ThanhTienHD) AS TongDoanhThuMangLai
    FROM SANPHAM SP
    JOIN LOAISANPHAM L ON SP.MaLoai = L.MaLoai
    JOIN CHITIETHOADON CT ON SP.MaSP = CT.MaSP
    JOIN HOADON HD ON CT.MaHoaDon = HD.MaHoaDon
    WHERE MONTH(HD.NgayLapHD) = @Thang 
      AND YEAR(HD.NgayLapHD) = @Nam
      AND HD.TrangThaiHD = N'Đã thanh toán' -- Chỉ tính đơn thành công
    GROUP BY SP.MaSP, SP.TenSP, L.TenLoai
    ORDER BY TongSoLuongBan DESC; -- Sắp xếp bán nhiều nhất lên đầu
END;
GO


--Kiểm thử: Cửa hàng trưởng muốn xem Top 5 sản phẩm bán chạy nhất trong Tháng 10 năm 2023
-- Chạy thủ tục
EXEC sp_TopSanPhamBanChay @Thang = 10, @Nam = 2023, @TopN = 5;

--Tạo sp_XoaNhanVien để xóa nhân viên ra khỏi hệ thống
IF OBJECT_ID('sp_XoaNhanVien', 'P') IS NOT NULL
    DROP PROC sp_XoaNhanVien;
GO

CREATE PROC sp_XoaNhanVien
    @MaNV CHAR(10)
AS
BEGIN
    -- 1. Kiểm tra ràng buộc dựa trên ĐƠN HÀNG
    IF EXISTS (SELECT 1 FROM DONHANG WHERE MANV = @MaNV)
    BEGIN
        -- Nếu nhân viên đã phát sinh nghiệp vụ -> Soft Delete
        UPDATE NHANVIEN
        SET TRANGTHAINV = N'Đã nghỉ việc'
        WHERE MANV = @MaNV;

        PRINT N'Nhân viên đã phát sinh đơn hàng. Đã chuyển trạng thái sang "Đã nghỉ việc".';
    END
    ELSE
    BEGIN
        -- Nếu chưa phát sinh nghiệp vụ → Hard Delete
        DELETE FROM TAIKHOAN WHERE MANV = @MaNV;  -- Xóa tài khoản trước (nếu có FK)
        DELETE FROM NHANVIEN WHERE MANV = @MaNV;

        PRINT N'Đã xóa hoàn toàn nhân viên khỏi hệ thống.';
    END
END;
GO


--Kiểm thử
-- Test 1: Xóa NV02 (Người này đã lập đơn hàng -> Sẽ chỉ đổi trạng thái)
EXEC sp_XoaNhanVien 'NV02';

-- Test 2: Thêm 1 NV mới rồi xóa (Sẽ xóa hẳn)
INSERT INTO NHANVIEN (MANV, HOTENNV, MABOPHAN, MACHUCVU, SODIENTHOAINV, TRANGTHAINV) 
VALUES ('NV_TEST', 'Test', 'BP01', 'CV01', '000', 'Active');

EXEC sp_XoaNhanVien 'NV_TEST';