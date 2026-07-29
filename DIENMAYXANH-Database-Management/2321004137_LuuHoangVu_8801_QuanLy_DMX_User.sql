--User QUANLY_DMX
    
    -- 1. Thử xem bảng Nhân Viên (Thành công)
    SELECT TOP 1 * FROM NHANVIEN;
    
    -- 2. Thử chạy thủ tục báo cáo (Thành công)
    -- (Giả sử thủ tục này đã tạo ở phần trước)
    EXEC sp_BaoCaoDoanhThuTheoNgay '2023-10-01', '2023-10-31';
