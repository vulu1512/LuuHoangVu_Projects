--Transaction

--Giao dịch thanh toán đơn hàng an toàn
IF OBJECT_ID('sp_GiaoDichThanhToan_AnToan', 'P') IS NOT NULL
    DROP PROC sp_GiaoDichThanhToan_AnToan;
GO

CREATE PROC sp_GiaoDichThanhToan_AnToan
    @MaHoaDon CHAR(10)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;

    BEGIN TRY
        DECLARE @TongTien DECIMAL(18,0);
        DECLARE @ThueVAT DECIMAL(18,0);
        DECLARE @ThanhTien DECIMAL(18,0);
        DECLARE @MaKH CHAR(10);

        SELECT @TongTien = ISNULL(SUM(ThanhTienHD), 0)
        FROM CHITIETHOADON
        WHERE MaHoaDon = @MaHoaDon;

        SELECT 
            @ThueVAT = HD.ThueVAT,
            @MaKH = DH.MaKH
        FROM HOADON HD
        JOIN DONHANG DH ON HD.MaDH = DH.MaDH
        WHERE HD.MaHoaDon = @MaHoaDon;

        SET @ThanhTien = @TongTien + ISNULL(@ThueVAT, 0);

        UPDATE HOADON
        SET 
            TongTienHD = @TongTien,
            TrangThaiHD = N'Đã thanh toán'
        WHERE MaHoaDon = @MaHoaDon;
        SELECT 1/0;

        -- 4. Cộng điểm tích lũy (1 triệu = 1 điểm)
        UPDATE KHACHHANG
        SET DiemTichLuy = DiemTichLuy + (@ThanhTien / 1000000)
        WHERE MaKH = @MaKH;
   
        
        -- Nếu chạy đến đây không lỗi -> Xác nhận giao dịch
        COMMIT TRANSACTION;
        PRINT N'Thanh toán thành công – dữ liệu đã được cập nhật an toàn.';
    END TRY
    BEGIN CATCH
    -- Nếu có bất kỳ lỗi nào -> Hủy bỏ toàn bộ
        ROLLBACK TRANSACTION;
        PRINT N'Lỗi phát sinh – toàn bộ giao dịch đã được Rollback.';
        PRINT ERROR_MESSAGE();
    END CATCH
END;
GO

--Kiểm thử: Thực hiện thanh toán cho hóa đơn HD01. Lần 1 chạy bình thường. 
-- Kiểm thử: Chạy thủ tục
EXEC sp_GiaoDichThanhToan_AnToan 'HD01';

--Kiểm tra trạng thái hóa đơn
SELECT
    MaHoaDon,
    TongTienHD,
    ThueVAT,
    TrangThaiHD
FROM HOADON
WHERE MaHoaDon = 'HD01';

--Kiểm tra điểm tích lũy khách hàng
SELECT 
    KH.MaKH,
    KH.DiemTichLuy
FROM KHACHHANG KH
JOIN DONHANG DH ON KH.MaKH = DH.MaKH
JOIN HOADON HD ON DH.MaDH = HD.MaDH
WHERE HD.MaHoaDon = 'HD01';


--Lần 2 cố tình bỏ dòng SELECT 1/0 trong code để gây lỗi chia cho 0 và xem dữ liệu có bị hoàn tác không.
-- Kiểm thử: Chạy thủ tục
EXEC sp_GiaoDichThanhToan_AnToan 'HD01';

--Kiểm tra trạng thái hóa đơn
SELECT
    MaHoaDon,
    TongTienHD,
    ThueVAT,
    TrangThaiHD
FROM HOADON
WHERE MaHoaDon = 'HD01';

--Kiểm tra điểm tích lũy khách hàng
SELECT 
    KH.MaKH,
    KH.DiemTichLuy
FROM KHACHHANG KH
JOIN DONHANG DH ON KH.MaKH = DH.MaKH
JOIN HOADON HD ON DH.MaDH = HD.MaDH
WHERE HD.MaHoaDon = 'HD01';

-- Nhân viên thu ngân
BEGIN TRANSACTION;
    -- Đang sửa giá bán của SP01 từ 29 triệu lên 99 triệu
    UPDATE BIENDONGGIA 
    SET GiaBan = 99000000 
    WHERE MaSP = 'SP01' AND NgayApDung = '2023-10-01';

    -- Lưu ý: Chưa chạy lệnh COMMIT, đang treo giao dịch
    PRINT N'Đang cập nhật giá, chưa Commit...';
    -- Đợi 10 giây để qua Cửa sổ 2 test
    WAITFOR DELAY '00:00:15';
    
ROLLBACK; -- Sau khi test xong thì hoàn tác

