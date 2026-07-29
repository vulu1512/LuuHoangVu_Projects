--Kiểm thử: Nhân viên cố tình xóa hóa đơn đã thanh toán(bị lỗi) và xem sản phẩm (thành công).

    -- 1. Thử xem danh sách sản phẩm 
    SELECT TOP 5 TenSP, GiaBan FROM vw_DanhSachSanPham_HienThi;
    
    -- 2. Thử xóa một hóa đơn bất kỳ 
    BEGIN TRY
        DELETE FROM HOADON WHERE MAHOADON = 'HD01';
    END TRY
    BEGIN CATCH
        PRINT N'Kết quả test: Hệ thống chặn xóa thành công! Thông báo lỗi: ' + ERROR_MESSAGE();
    END CATCH

    -- 3. Thử xem bảng Nhân viên 
    BEGIN TRY
        SELECT * FROM NHANVIEN;
    END TRY
    BEGIN CATCH
        PRINT N'Kết quả test: Hệ thống chặn xem nhân sự thành công! Thông báo lỗi: ' + ERROR_MESSAGE();
    END CATCH
