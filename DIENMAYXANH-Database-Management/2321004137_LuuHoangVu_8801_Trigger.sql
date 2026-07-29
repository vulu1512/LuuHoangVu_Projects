--Trigger

--Tạo trg_CapNhatTongTienHD 
IF OBJECT_ID('trg_CapNhatTongTienHD', 'TR') IS NOT NULL
    DROP TRIGGER trg_CapNhatTongTienHD;
GO

CREATE TRIGGER trg_CapNhatTongTienHD
ON CHITIETHOADON
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Lấy danh sách hóa đơn bị ảnh hưởng
    DECLARE @DanhSachHD TABLE (MaHoaDon CHAR(10));

    INSERT INTO @DanhSachHD (MaHoaDon)
    SELECT DISTINCT MaHoaDon FROM inserted
    UNION
    SELECT DISTINCT MaHoaDon FROM deleted;

    -- 2. Cập nhật lại TỔNG TIỀN HÓA ĐƠN
    UPDATE HD
    SET HD.TongTienHD = ISNULL(T.TongTien, 0)
    FROM HOADON HD
    LEFT JOIN (
        SELECT 
            MaHoaDon,
            SUM(ThanhTienHD) AS TongTien
        FROM CHITIETHOADON
        WHERE MaHoaDon IN (SELECT MaHoaDon FROM @DanhSachHD)
        GROUP BY MaHoaDon
    ) T ON HD.MaHoaDon = T.MaHoaDon
    WHERE HD.MaHoaDon IN (SELECT MaHoaDon FROM @DanhSachHD);
END;
GO

--Kiểm thử
-- Bước 1: Tạo hóa đơn mẫu
INSERT INTO HOADON (MAHOADON, MADH, MAKHUYENMAI, NGAYLAPHD, HINHTHUCTHANHTOAN, TONGTIENHD, THUEVAT, TRANGTHAIHD)
VALUES ('HD21', 'DH21', 'KM01', GETDATE(), N'Tiền mặt', 0, 0, N'Mới');

-- Bước 2: Thêm chi tiết (Mua 1 cái SP01 giá 29tr) -> Trigger chạy
INSERT INTO CHITIETHOADON (MAHOADON, MASP, SOLUONGMUA, DONGIAMUA, THANHTIENHD)
VALUES ('HD21', 'SP01', 1, 29000000, 29000000);

-- Bước 3: Kiểm tra (TongTienHD phải = 29,000,000)
SELECT MaHoaDon, TongTienHD FROM HOADON WHERE MaHoaDon = 'HD21';

--Tạo trg_DongBoTrangThaiDonHang để tự động cập nhật trạng thái của đơn hàng
IF OBJECT_ID('trg_DongBoTrangThaiDonHang', 'TR') IS NOT NULL
    DROP TRIGGER trg_DongBoTrangThaiDonHang;
GO

CREATE TRIGGER trg_DongBoTrangThaiDonHang
ON HOADON
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Chỉ xử lý khi hóa đơn có trạng thái là 'Đã thanh toán'
    -- Cập nhật bảng DONHANG dựa trên liên kết MADH
    UPDATE d
    SET d.TRANGTHAIDH = N'Hoàn tất'
    FROM DONHANG d
    JOIN inserted i ON d.MADH = i.MADH
    WHERE i.TRANGTHAIHD = N'Đã thanh toán';
END;
GO

/*Kiểm thử: Tạo một đơn hàng mới đang ở trạng thái "Đang xử lý". Sau đó lập hóa đơn thanh toán cho đơn hàng đó và 
kiểm tra xem đơn hàng có tự động chuyển thành "Hoàn tất" không.*/
-- 1. Tạo đơn hàng (Trạng thái: Đang xử lý)
INSERT INTO DONHANG (MADH, MANV, MAKH, NGAYTAODH, NHUCAULAPDAT, TRANGTHAIDH, DIACHIGIAOHANG)
VALUES ('DH25', 'NV02', 'KH01', GETDATE(), N'Không', N'Đang xử lý', N'TP.HCM');

-- 2. Lập hóa đơn và thanh toán ngay (Trạng thái: Đã thanh toán)
INSERT INTO HOADON (MAHOADON, MADH, MAKHUYENMAI, NGAYLAPHD, HINHTHUCTHANHTOAN, TONGTIENHD, THUEVAT, TRANGTHAIHD)
VALUES ('HD25', 'DH25', 'KM04', GETDATE(), N'Tiền mặt', 1000000, 100000, N'Đã thanh toán');

-- 3. Kiểm tra lại bảng DONHANG (Kỳ vọng: TRANGTHAIDH phải là 'Hoàn tất')
SELECT MADH, TRANGTHAIDH FROM DONHANG WHERE MADH = 'DH25';

--Tạo trg_ChanXoaHoaDonDaThanhToan để ngăn chặn tuyệt đối hành vi xóa các hóa đơn có trạng thái "Đã thanh toán" khỏi hệ thống
IF OBJECT_ID('trg_ChanXoaHoaDonDaThanhToan', 'TR') IS NOT NULL
    DROP TRIGGER trg_ChanXoaHoaDonDaThanhToan;
GO

CREATE TRIGGER trg_ChanXoaHoaDonDaThanhToan
ON HOADON
FOR DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Kiểm tra trong danh sách các dòng bị xóa (deleted table)
    -- Nếu tồn tại bất kỳ hóa đơn nào đã thanh toán
    IF EXISTS (SELECT 1 FROM deleted WHERE TRANGTHAIHD = N'Đã thanh toán')
    BEGIN
        -- Báo lỗi đỏ và Rollback (hoàn tác) lệnh xóa
        RAISERROR(N'Lỗi: Không được phép xóa hóa đơn đã thanh toán! Vui lòng làm thủ tục hủy.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

/*Kiểm thử: Cố tình xóa hóa đơn HD25 (vừa tạo ở trên, đã thanh toán) xem hệ thống có chặn lại không. 
Sau đó thử xóa một hóa đơn nháp (chưa thanh toán) xem có được không.*/

-- Test 1: Cố tình xóa hóa đơn Đã thanh toán (Sẽ bị báo lỗi)
DELETE FROM HOADON WHERE MAHOADON = 'HD25';


-- Test 2: Tạo hóa đơn mới và xóa (Sẽ thành công)
INSERT INTO DONHANG (MADH, MANV, MAKH, NGAYTAODH, NHUCAULAPDAT, TRANGTHAIDH, DIACHIGIAOHANG)
VALUES ('DH26', 'NV02', 'KH01', GETDATE(), N'Không', N'Đang xử lý', N'TP.HCM');

INSERT INTO HOADON (MAHOADON, MADH, MAKHUYENMAI, NGAYLAPHD, HINHTHUCTHANHTOAN, TONGTIENHD, THUEVAT, TRANGTHAIHD)
VALUES ('HD26', 'DH26', 'KM04', GETDATE(), N'Tiền mặt', 1000000, 100000, N'Chưa thanh toán');

DELETE FROM HOADON WHERE MAHOADON = 'HD_NHAP';

--Tạo bảng LOG_HE_THONG
IF OBJECT_ID('LOG_HE_THONG', 'U') IS NOT NULL
    DROP TABLE LOG_HE_THONG;
GO

CREATE TABLE LOG_HE_THONG (
    LogID INT IDENTITY(1,1) PRIMARY KEY, -- Mã tự tăng
    TenBang VARCHAR(50),                 -- Tên bảng bị thay đổi
    HanhDong VARCHAR(20),                -- Loại thao tác (INSERT/UPDATE/DELETE)
    KhoaChinh NVARCHAR(50),              -- Mã dòng dữ liệu bị sửa (VD: Mã SP)
    DuLieuCu NVARCHAR(MAX),              -- Giá trị trước khi sửa
    DuLieuMoi NVARCHAR(MAX),             -- Giá trị sau khi sửa
    NguoiThucHien NVARCHAR(50),          -- Tên tài khoản thực hiện
    ThoiGian DATETIME DEFAULT GETDATE()  -- Thời điểm thực hiện
);
GO

--Tạo trg_GiamSat_ThayDoiGia để ghi lại nhật ký mỗi khi có người thay đổi giá bán sản phẩm
IF OBJECT_ID('trg_GiamSat_ThayDoiGia', 'TR') IS NOT NULL
    DROP TRIGGER trg_GiamSat_ThayDoiGia;
GO

CREATE TRIGGER trg_GiamSat_ThayDoiGia
ON BIENDONGGIA
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Chỉ ghi log khi GIABAN thực sự thay đổi
    INSERT INTO LOG_HE_THONG (TenBang, HanhDong, KhoaChinh, DuLieuCu, DuLieuMoi, NguoiThucHien, ThoiGian)
    SELECT 
        'BIENDONGGIA',
        'UPDATE',
        i.MASP,
        N'Giá cũ: ' + CAST(d.GIABAN AS NVARCHAR(20)),
        N'Giá mới: ' + CAST(i.GIABAN AS NVARCHAR(20)),
        SYSTEM_USER,
        GETDATE()
    FROM inserted i
    JOIN deleted d ON i.MASP = d.MASP AND i.NGAYAPDUNG = d.NGAYAPDUNG
    WHERE i.GIABAN <> d.GIABAN;
END;
GO

--Kiểm thử
-- Giả sử SP01 đang có giá 29tr, sửa thành 30tr
UPDATE BIENDONGGIA 
SET GIABAN = 30000000 
WHERE MASP = 'SP01' AND NGAYAPDUNG = '2023-10-01';

-- Kiểm tra bảng Log
SELECT * FROM LOG_HE_THONG WHERE TenBang = 'BIENDONGGIA' ORDER BY ThoiGian DESC;
