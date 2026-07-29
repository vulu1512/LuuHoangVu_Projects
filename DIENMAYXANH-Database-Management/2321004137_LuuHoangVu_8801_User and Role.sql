--User và Role

--Nhóm Quản lý 
-- 1. Tạo Login cấp Server (Mật khẩu sẽ được SQL Server tự động Mã hóa SHA)
IF NOT EXISTS (SELECT name FROM sys.server_principals WHERE name = 'QuanLy_DMX')
BEGIN
    CREATE LOGIN QuanLy_DMX WITH PASSWORD = 'DMX@123'; 
END
GO

-- 2. Tạo User trong Database (Map với Login trên)
IF NOT EXISTS (SELECT name FROM sys.database_principals WHERE name = 'Đinh Trung Nhật')
BEGIN
    CREATE USER DinhTrungNhat FOR LOGIN QuanLy_DMX;
END
GO

-- 3. Tạo Role (Vai trò) Quản lý
IF NOT EXISTS (SELECT name FROM sys.database_principals WHERE name = 'ROLE_QuanLy')
BEGIN
    CREATE ROLE ROLE_QuanLy;
END
GO

-- 4. Cấp quyền (GRANT) cho Role Quản lý
-- Quyền: Được làm tất cả (SELECT, INSERT, UPDATE, DELETE) trên lược đồ mặc định (dbo)
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::dbo TO ROLE_QuanLy;

-- Quyền: Được thực thi tất cả các Procedure
GRANT EXECUTE TO ROLE_QuanLy;

-- 5. Gán User vào Role
ALTER ROLE ROLE_QuanLy ADD MEMBER DinhTrungNhat;
GO


--Nhóm Nhân viên
-- 1. Tạo Login cho Nhân viên
IF NOT EXISTS (SELECT name FROM sys.server_principals WHERE name = 'NhanVien_DMX')
BEGIN
    CREATE LOGIN NhanVien_DMX WITH PASSWORD = 'NV@123';
END
GO

-- 2. Tạo User trong Database
IF NOT EXISTS (SELECT name FROM sys.database_principals WHERE name = 'Lê Hồng Quốc')
BEGIN
    CREATE USER LeHongQuoc FOR LOGIN NhanVien_DMX;
END
GO

-- 3. Tạo Role Nhân Viên
IF NOT EXISTS (SELECT name FROM sys.database_principals WHERE name = 'ROLE_NhanVien')
BEGIN
    CREATE ROLE ROLE_NhanVien;
END
GO

-- 4. Phân quyền chi tiết 

-- A. QUYỀN ĐƯỢC PHÉP (GRANT)
GRANT SELECT ON SANPHAM TO ROLE_NhanVien;     -- Được xem sản phẩm
GRANT SELECT ON KHACHHANG TO ROLE_NhanVien;   -- Được xem khách hàng
GRANT INSERT ON HOADON TO ROLE_NhanVien;      -- Được lập hóa đơn
GRANT INSERT ON CHITIETHOADON TO ROLE_NhanVien; -- Được bán hàng

-- B. QUYỀN BỊ CẤM (DENY)
DENY DELETE ON HOADON TO ROLE_NhanVien;       -- Cấm xóa hóa đơn
DENY UPDATE ON BIENDONGGIA TO ROLE_NhanVien;  -- Cấm sửa giá
DENY SELECT ON NHANVIEN TO ROLE_NhanVien;     -- Cấm soi thông tin đồng nghiệp
DENY SELECT ON LOG_HE_THONG TO ROLE_NhanVien; -- Cấm xem nhật ký hệ thống

-- 5. Gán User vào Role
ALTER ROLE ROLE_NhanVien ADD MEMBER LeHongQuoc;
GO
