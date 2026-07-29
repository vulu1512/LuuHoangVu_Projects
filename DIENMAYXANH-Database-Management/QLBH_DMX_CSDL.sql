/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     12/11/2025 12:52:30 PM                       */
/*==============================================================*/
create database QLBH_DMX_CSDL
go

use QLBH_DMX_CSDL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BIENDONGGIA') and o.name = 'FK_BIENDONG_BIENDONGG_SANPHAM')
alter table BIENDONGGIA
   drop constraint FK_BIENDONG_BIENDONGG_SANPHAM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIETDONHANG') and o.name = 'FK_CHITIETD_CHITIETDO_SANPHAM')
alter table CHITIETDONHANG
   drop constraint FK_CHITIETD_CHITIETDO_SANPHAM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIETDONHANG') and o.name = 'FK_CHITIETD_CHITIETDO_DONHANG')
alter table CHITIETDONHANG
   drop constraint FK_CHITIETD_CHITIETDO_DONHANG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIETHOADON') and o.name = 'FK_CHITIETH_CHITIETHO_SANPHAM')
alter table CHITIETHOADON
   drop constraint FK_CHITIETH_CHITIETHO_SANPHAM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIETHOADON') and o.name = 'FK_CHITIETH_CHITIETHO_HOADON')
alter table CHITIETHOADON
   drop constraint FK_CHITIETH_CHITIETHO_HOADON
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIETPHIEUNHAP') and o.name = 'FK_CHITIETP_CHITIETPH_PHIEUNHA')
alter table CHITIETPHIEUNHAP
   drop constraint FK_CHITIETP_CHITIETPH_PHIEUNHA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIETPHIEUNHAP') and o.name = 'FK_CHITIETP_CHITIETPH_SANPHAM')
alter table CHITIETPHIEUNHAP
   drop constraint FK_CHITIETP_CHITIETPH_SANPHAM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIETPHIEUXUAT') and o.name = 'FK_CHITIETP_CHITIETPH_PHIEUXUA')
alter table CHITIETPHIEUXUAT
   drop constraint FK_CHITIETP_CHITIETPH_PHIEUXUA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIETPHIEUXUAT') and o.name = 'FK_CHITIETP_FK_PHIEUX_SANPHAM')
alter table CHITIETPHIEUXUAT
   drop constraint FK_CHITIETP_FK_PHIEUX_SANPHAM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DOITUONG') and o.name = 'FK_DOITUONG_DOITUONG__LOAIDOIT')
alter table DOITUONG
   drop constraint FK_DOITUONG_DOITUONG__LOAIDOIT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DONHANG') and o.name = 'FK_DONHANG_KHACHHANG_KHACHHAN')
alter table DONHANG
   drop constraint FK_DONHANG_KHACHHANG_KHACHHAN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DONHANG') and o.name = 'FK_DONHANG_NHANVIEN__NHANVIEN')
alter table DONHANG
   drop constraint FK_DONHANG_NHANVIEN__NHANVIEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('HOADON') and o.name = 'FK_HOADON_DONHANG_H_DONHANG')
alter table HOADON
   drop constraint FK_HOADON_DONHANG_H_DONHANG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('HOADON') and o.name = 'FK_HOADON_KHUYENMAI_KHUYENMA')
alter table HOADON
   drop constraint FK_HOADON_KHUYENMAI_KHUYENMA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('KHUYENMAISANPHAM') and o.name = 'FK_KHUYENMA_KHUYENMAI_SANPHAM')
alter table KHUYENMAISANPHAM
   drop constraint FK_KHUYENMA_KHUYENMAI_SANPHAM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('KHUYENMAISANPHAM') and o.name = 'FK_KHUYENMA_KHUYENMAI_KHUYENMA')
alter table KHUYENMAISANPHAM
   drop constraint FK_KHUYENMA_KHUYENMAI_KHUYENMA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NHANVIEN') and o.name = 'FK_NHANVIEN_BOPHAN_NH_BOPHAN')
alter table NHANVIEN
   drop constraint FK_NHANVIEN_BOPHAN_NH_BOPHAN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NHANVIEN') and o.name = 'FK_NHANVIEN_NHANVIEN__CHUCVU')
alter table NHANVIEN
   drop constraint FK_NHANVIEN_NHANVIEN__CHUCVU
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHANQUYEN') and o.name = 'FK_PHANQUYE_PHANQUYEN_VAITRO')
alter table PHANQUYEN
   drop constraint FK_PHANQUYE_PHANQUYEN_VAITRO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHANQUYEN') and o.name = 'FK_PHANQUYE_PHANQUYEN_DOITUONG')
alter table PHANQUYEN
   drop constraint FK_PHANQUYE_PHANQUYEN_DOITUONG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHANQUYEN') and o.name = 'FK_PHANQUYE_PHANQUYEN_QUYEN')
alter table PHANQUYEN
   drop constraint FK_PHANQUYE_PHANQUYEN_QUYEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEUBAOHANH') and o.name = 'FK_PHIEUBAO_SANPHAM_P_SANPHAM')
alter table PHIEUBAOHANH
   drop constraint FK_PHIEUBAO_SANPHAM_P_SANPHAM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEUNHAP') and o.name = 'FK_PHIEUNHA_NHANVIEN__NHANVIEN')
alter table PHIEUNHAP
   drop constraint FK_PHIEUNHA_NHANVIEN__NHANVIEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEUXUAT') and o.name = 'FK_PHIEUXUA_NHANVIEN__NHANVIEN')
alter table PHIEUXUAT
   drop constraint FK_PHIEUXUA_NHANVIEN__NHANVIEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('QUYEN') and o.name = 'FK_QUYEN_QUYEN_LOA_LOAIQUYE')
alter table QUYEN
   drop constraint FK_QUYEN_QUYEN_LOA_LOAIQUYE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SANPHAM') and o.name = 'FK_SANPHAM_LOAISANPH_LOAISANP')
alter table SANPHAM
   drop constraint FK_SANPHAM_LOAISANPH_LOAISANP
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SANPHAM') and o.name = 'FK_SANPHAM_QUOCGIA_S_QUOCGIA')
alter table SANPHAM
   drop constraint FK_SANPHAM_QUOCGIA_S_QUOCGIA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SANPHAM') and o.name = 'FK_SANPHAM_THUONGHIE_THUONGHI')
alter table SANPHAM
   drop constraint FK_SANPHAM_THUONGHIE_THUONGHI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SANPHAM') and o.name = 'FK_SANPHAM_TONKHO_SA_TONKHO')
alter table SANPHAM
   drop constraint FK_SANPHAM_TONKHO_SA_TONKHO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TAIKHOAN') and o.name = 'FK_TAIKHOAN_NHANVIEN__NHANVIEN')
alter table TAIKHOAN
   drop constraint FK_TAIKHOAN_NHANVIEN__NHANVIEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TAIKHOAN') and o.name = 'FK_TAIKHOAN_TAIKHOAN__VAITRO')
alter table TAIKHOAN
   drop constraint FK_TAIKHOAN_TAIKHOAN__VAITRO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BIENDONGGIA')
            and   name  = 'BIENDONGGIA_SANPHAM_FK'
            and   indid > 0
            and   indid < 255)
   drop index BIENDONGGIA.BIENDONGGIA_SANPHAM_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BIENDONGGIA')
            and   type = 'U')
   drop table BIENDONGGIA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BOPHAN')
            and   type = 'U')
   drop table BOPHAN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHITIETDONHANG')
            and   name  = 'CHITIETDONHANG2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHITIETDONHANG.CHITIETDONHANG2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHITIETDONHANG')
            and   name  = 'CHITIETDONHANG_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHITIETDONHANG.CHITIETDONHANG_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHITIETDONHANG')
            and   type = 'U')
   drop table CHITIETDONHANG
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHITIETHOADON')
            and   name  = 'CHITIETHOADON2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHITIETHOADON.CHITIETHOADON2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHITIETHOADON')
            and   name  = 'CHITIETHOADON_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHITIETHOADON.CHITIETHOADON_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHITIETHOADON')
            and   type = 'U')
   drop table CHITIETHOADON
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHITIETPHIEUNHAP')
            and   name  = 'CHITIETPHIEUNHAP2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHITIETPHIEUNHAP.CHITIETPHIEUNHAP2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHITIETPHIEUNHAP')
            and   name  = 'CHITIETPHIEUNHAP_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHITIETPHIEUNHAP.CHITIETPHIEUNHAP_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHITIETPHIEUNHAP')
            and   type = 'U')
   drop table CHITIETPHIEUNHAP
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHITIETPHIEUXUAT')
            and   name  = 'CHITIETPHIEUXUAT2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHITIETPHIEUXUAT.CHITIETPHIEUXUAT2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHITIETPHIEUXUAT')
            and   name  = 'CHITIETPHIEUXUAT_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHITIETPHIEUXUAT.CHITIETPHIEUXUAT_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHITIETPHIEUXUAT')
            and   type = 'U')
   drop table CHITIETPHIEUXUAT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHUCVU')
            and   type = 'U')
   drop table CHUCVU
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DOITUONG')
            and   name  = 'DOITUONG_LOAIDOITUONG_FK'
            and   indid > 0
            and   indid < 255)
   drop index DOITUONG.DOITUONG_LOAIDOITUONG_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DOITUONG')
            and   type = 'U')
   drop table DOITUONG
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DONHANG')
            and   name  = 'NHANVIEN_DONHANG_FK'
            and   indid > 0
            and   indid < 255)
   drop index DONHANG.NHANVIEN_DONHANG_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DONHANG')
            and   name  = 'KHACHHANG_DONHANG_FK'
            and   indid > 0
            and   indid < 255)
   drop index DONHANG.KHACHHANG_DONHANG_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DONHANG')
            and   type = 'U')
   drop table DONHANG
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('HOADON')
            and   name  = 'KHUYENMAI_HOADON_FK'
            and   indid > 0
            and   indid < 255)
   drop index HOADON.KHUYENMAI_HOADON_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('HOADON')
            and   name  = 'DONHANG_HOADON_FK'
            and   indid > 0
            and   indid < 255)
   drop index HOADON.DONHANG_HOADON_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('HOADON')
            and   type = 'U')
   drop table HOADON
go

if exists (select 1
            from  sysobjects
           where  id = object_id('KHACHHANG')
            and   type = 'U')
   drop table KHACHHANG
go

if exists (select 1
            from  sysobjects
           where  id = object_id('KHUYENMAI')
            and   type = 'U')
   drop table KHUYENMAI
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('KHUYENMAISANPHAM')
            and   name  = 'KHUYENMAISANPHAM2_FK'
            and   indid > 0
            and   indid < 255)
   drop index KHUYENMAISANPHAM.KHUYENMAISANPHAM2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('KHUYENMAISANPHAM')
            and   name  = 'KHUYENMAISANPHAM_FK'
            and   indid > 0
            and   indid < 255)
   drop index KHUYENMAISANPHAM.KHUYENMAISANPHAM_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('KHUYENMAISANPHAM')
            and   type = 'U')
   drop table KHUYENMAISANPHAM
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LOAIDOITUONG')
            and   type = 'U')
   drop table LOAIDOITUONG
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LOAIQUYEN')
            and   type = 'U')
   drop table LOAIQUYEN
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LOAISANPHAM')
            and   type = 'U')
   drop table LOAISANPHAM
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NHANVIEN')
            and   name  = 'NHANVIEN_CHUCVU_FK'
            and   indid > 0
            and   indid < 255)
   drop index NHANVIEN.NHANVIEN_CHUCVU_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NHANVIEN')
            and   name  = 'BOPHAN_NHANVIEN_FK'
            and   indid > 0
            and   indid < 255)
   drop index NHANVIEN.BOPHAN_NHANVIEN_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NHANVIEN')
            and   type = 'U')
   drop table NHANVIEN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHANQUYEN')
            and   name  = 'PHANQUYEN3_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHANQUYEN.PHANQUYEN3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHANQUYEN')
            and   name  = 'PHANQUYEN2_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHANQUYEN.PHANQUYEN2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHANQUYEN')
            and   name  = 'PHANQUYEN_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHANQUYEN.PHANQUYEN_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHANQUYEN')
            and   type = 'U')
   drop table PHANQUYEN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHIEUBAOHANH')
            and   name  = 'SANPHAM_PHIEUBAOHANH2_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHIEUBAOHANH.SANPHAM_PHIEUBAOHANH2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHIEUBAOHANH')
            and   type = 'U')
   drop table PHIEUBAOHANH
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHIEUNHAP')
            and   name  = 'NHANVIEN_PHIEUNHAP_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHIEUNHAP.NHANVIEN_PHIEUNHAP_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHIEUNHAP')
            and   type = 'U')
   drop table PHIEUNHAP
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHIEUXUAT')
            and   name  = 'NHANVIEN_PHIEUXUAT_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHIEUXUAT.NHANVIEN_PHIEUXUAT_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHIEUXUAT')
            and   type = 'U')
   drop table PHIEUXUAT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('QUOCGIA')
            and   type = 'U')
   drop table QUOCGIA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('QUYEN')
            and   name  = 'QUYEN_LOAIQUYEN_FK'
            and   indid > 0
            and   indid < 255)
   drop index QUYEN.QUYEN_LOAIQUYEN_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('QUYEN')
            and   type = 'U')
   drop table QUYEN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SANPHAM')
            and   name  = 'TONKHO_SANPHAM_FK'
            and   indid > 0
            and   indid < 255)
   drop index SANPHAM.TONKHO_SANPHAM_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SANPHAM')
            and   name  = 'QUOCGIA_SANPHAM_FK'
            and   indid > 0
            and   indid < 255)
   drop index SANPHAM.QUOCGIA_SANPHAM_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SANPHAM')
            and   name  = 'THUONGHIEU_SANPHAM_FK'
            and   indid > 0
            and   indid < 255)
   drop index SANPHAM.THUONGHIEU_SANPHAM_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SANPHAM')
            and   name  = 'LOAISANPHAM_SANPHAM_FK'
            and   indid > 0
            and   indid < 255)
   drop index SANPHAM.LOAISANPHAM_SANPHAM_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SANPHAM')
            and   type = 'U')
   drop table SANPHAM
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TAIKHOAN')
            and   name  = 'NHANVIEN_TAIKHOAN2_FK'
            and   indid > 0
            and   indid < 255)
   drop index TAIKHOAN.NHANVIEN_TAIKHOAN2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TAIKHOAN')
            and   name  = 'TAIKHOAN_VAITRO_FK'
            and   indid > 0
            and   indid < 255)
   drop index TAIKHOAN.TAIKHOAN_VAITRO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TAIKHOAN')
            and   type = 'U')
   drop table TAIKHOAN
go

if exists (select 1
            from  sysobjects
           where  id = object_id('THUONGHIEU')
            and   type = 'U')
   drop table THUONGHIEU
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TONKHO')
            and   type = 'U')
   drop table TONKHO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('VAITRO')
            and   type = 'U')
   drop table VAITRO
go

/*==============================================================*/
/* Table: BIENDONGGIA                                           */
/*==============================================================*/
create table BIENDONGGIA (
   NGAYAPDUNG           datetime             not null,
   MASP                 char(10)             not null,
   GIABAN               decimal              not null,
   GHICHUDG             nvarchar(200)         null,
   constraint PK_BIENDONGGIA primary key nonclustered (NGAYAPDUNG)
)
go

/*==============================================================*/
/* Index: BIENDONGGIA_SANPHAM_FK                                */
/*==============================================================*/
create index BIENDONGGIA_SANPHAM_FK on BIENDONGGIA (
MASP ASC
)
go

/*==============================================================*/
/* Table: BOPHAN                                                */
/*==============================================================*/
create table BOPHAN (
   MABOPHAN             char(10)             not null,
   TENBOPHAN            nvarchar(150)         not null,
   EMAILBP              varchar(100)         not null,
   MOTABP               nvarchar(200)         null,
   constraint PK_BOPHAN primary key nonclustered (MABOPHAN)
)
go

/*==============================================================*/
/* Table: CHITIETDONHANG                                        */
/*==============================================================*/
create table CHITIETDONHANG (
   MASP                 char(10)             not null,
   MADH                 char(10)             not null,
   SOLUONGDH            int                  not null,
   TONGTIENCHUAGIAM     decimal              not null,
   TONGTIENDAGIAM       decimal              not null,
   constraint PK_CHITIETDONHANG primary key (MASP, MADH)
)
go

/*==============================================================*/
/* Index: CHITIETDONHANG_FK                                     */
/*==============================================================*/
create index CHITIETDONHANG_FK on CHITIETDONHANG (
MASP ASC
)
go

/*==============================================================*/
/* Index: CHITIETDONHANG2_FK                                    */
/*==============================================================*/
create index CHITIETDONHANG2_FK on CHITIETDONHANG (
MADH ASC
)
go

/*==============================================================*/
/* Table: CHITIETHOADON                                         */
/*==============================================================*/
create table CHITIETHOADON (
   MASP                 char(10)             not null,
   MAHOADON             char(10)             not null,
   SOLUONGMUA           int                  not null,
   DONGIAMUA            decimal              not null,
   THANHTIENHD          decimal              not null,
   constraint PK_CHITIETHOADON primary key (MASP, MAHOADON)
)
go

/*==============================================================*/
/* Index: CHITIETHOADON_FK                                      */
/*==============================================================*/
create index CHITIETHOADON_FK on CHITIETHOADON (
MASP ASC
)
go

/*==============================================================*/
/* Index: CHITIETHOADON2_FK                                     */
/*==============================================================*/
create index CHITIETHOADON2_FK on CHITIETHOADON (
MAHOADON ASC
)
go

/*==============================================================*/
/* Table: CHITIETPHIEUNHAP                                      */
/*==============================================================*/
create table CHITIETPHIEUNHAP (
   SOPN                 char(10)             not null,
   MASP                 char(10)             not null,
   SOLUONGNHAP          int                  not null,
   DONGIANHAP           decimal              not null,
   THANHTIENPN          decimal              not null,
   constraint PK_CHITIETPHIEUNHAP primary key (SOPN, MASP)
)
go

/*==============================================================*/
/* Index: CHITIETPHIEUNHAP_FK                                   */
/*==============================================================*/
create index CHITIETPHIEUNHAP_FK on CHITIETPHIEUNHAP (
SOPN ASC
)
go

/*==============================================================*/
/* Index: CHITIETPHIEUNHAP2_FK                                  */
/*==============================================================*/
create index CHITIETPHIEUNHAP2_FK on CHITIETPHIEUNHAP (
MASP ASC
)
go

/*==============================================================*/
/* Table: CHITIETPHIEUXUAT                                      */
/*==============================================================*/
create table CHITIETPHIEUXUAT (
   SOPX                 char(10)             not null,
   MASP                 char(10)             not null,
   SOLUONGXUAT          int                  not null,
   DONGIAXUAT           decimal              not null,
   THANHTIENPX          decimal              not null,
   constraint PK_CHITIETPHIEUXUAT primary key (SOPX, MASP)
)
go

/*==============================================================*/
/* Index: CHITIETPHIEUXUAT_FK                                   */
/*==============================================================*/
create index CHITIETPHIEUXUAT_FK on CHITIETPHIEUXUAT (
SOPX ASC
)
go

/*==============================================================*/
/* Index: CHITIETPHIEUXUAT2_FK                                  */
/*==============================================================*/
create index CHITIETPHIEUXUAT2_FK on CHITIETPHIEUXUAT (
MASP ASC
)
go

/*==============================================================*/
/* Table: CHUCVU                                                */
/*==============================================================*/
create table CHUCVU (
   MACHUCVU             char(10)             not null,
   TENCHUCVU            nvarchar(150)         not null,
   MOTACHUCVU           nvarchar(200)         null,
   constraint PK_CHUCVU primary key nonclustered (MACHUCVU)
)
go

/*==============================================================*/
/* Table: DOITUONG                                              */
/*==============================================================*/
create table DOITUONG (
   MADOITUONG           char(10)             not null,
   MALOAIDOITUONG       char(10)             not null,
   TENDOITUONG          nvarchar(150)         not null,
   MOTADOITUONG         nvarchar(200)         null,
   constraint PK_DOITUONG primary key nonclustered (MADOITUONG)
)
go

/*==============================================================*/
/* Index: DOITUONG_LOAIDOITUONG_FK                              */
/*==============================================================*/
create index DOITUONG_LOAIDOITUONG_FK on DOITUONG (
MALOAIDOITUONG ASC
)
go

/*==============================================================*/
/* Table: DONHANG                                               */
/*==============================================================*/
create table DONHANG (
   MADH                 char(10)             not null,
   MANV                 char(10)             not null,
   MAKH                 char(10)             not null,
   NGAYTAODH            datetime             not null,
   NHUCAULAPDAT         nvarchar(200)         not null,
   TRANGTHAIDH          nvarchar(200)         not null,
   DIACHIGIAOHANG       nvarchar(200)         not null,
   GHICHUDH             nvarchar(200)         null,
   constraint PK_DONHANG primary key nonclustered (MADH)
)
go

/*==============================================================*/
/* Index: KHACHHANG_DONHANG_FK                                  */
/*==============================================================*/
create index KHACHHANG_DONHANG_FK on DONHANG (
MAKH ASC
)
go

/*==============================================================*/
/* Index: NHANVIEN_DONHANG_FK                                   */
/*==============================================================*/
create index NHANVIEN_DONHANG_FK on DONHANG (
MANV ASC
)
go

/*==============================================================*/
/* Table: HOADON                                                */
/*==============================================================*/
create table HOADON (
   MAHOADON             char(10)             not null,
   MADH                 char(10)             not null,
   MAKHUYENMAI          char(10)             not null,
   NGAYLAPHD            datetime             not null,
   HINHTHUCTHANHTOAN    nvarchar(150)         not null,
   TONGTIENHD           decimal              not null,
   THUEVAT              decimal              not null,
   TRANGTHAIHD          nvarchar(200)         not null,
   constraint PK_HOADON primary key nonclustered (MAHOADON)
)
go

/*==============================================================*/
/* Index: DONHANG_HOADON_FK                                     */
/*==============================================================*/
create index DONHANG_HOADON_FK on HOADON (
MADH ASC
)
go

/*==============================================================*/
/* Index: KHUYENMAI_HOADON_FK                                   */
/*==============================================================*/
create index KHUYENMAI_HOADON_FK on HOADON (
MAKHUYENMAI ASC
)
go

/*==============================================================*/
/* Table: KHACHHANG                                             */
/*==============================================================*/
create table KHACHHANG (
   MAKH                 char(10)             not null,
   HOTENKH              nvarchar(150)         not null,
   SODIENTHOAIKH        varchar(15)          not null,
   EMAIKH               varchar(100)         null,
   GIOITINHKH           nvarchar(15)          null,
   DIACHIKH             nvarchar(200)         null,
   NGAYSINHKH           datetime             null,
   MASOTHUEKH           int                  null,
   HANGTHANHVIEN        nvarchar(100)         null,
   DIEMTICHLUY          int                  not null default 0,
   GHICHUKH             nvarchar(250)         null,
   constraint PK_KHACHHANG primary key nonclustered (MAKH)
)
go

/*==============================================================*/
/* Table: KHUYENMAI                                             */
/*==============================================================*/
create table KHUYENMAI (
   MAKHUYENMAI          char(10)             not null,
   TENCHUONGTRINH       nvarchar(200)         not null,
   NGAYBATDAUKM         datetime             not null,
   NGAYKETTHUCKM        datetime             not null,
   LOAIGIAMGIA          nvarchar(100)         not null,
   GIATRIGIAM           decimal              not null,
   MOTAKM               nvarchar(200)         null,
   constraint PK_KHUYENMAI primary key nonclustered (MAKHUYENMAI)
)
go

/*==============================================================*/
/* Table: KHUYENMAISANPHAM                                      */
/*==============================================================*/
create table KHUYENMAISANPHAM (
   MASP                 char(10)             not null,
   MAKHUYENMAI          char(10)             not null,
   DIEUKIENAPDUNG       nvarchar(200)         not null,
   TRANGTHAIKHUYENMAI   nvarchar(200)         not null,
   constraint PK_KHUYENMAISANPHAM primary key (MASP, MAKHUYENMAI)
)
go

/*==============================================================*/
/* Index: KHUYENMAISANPHAM_FK                                   */
/*==============================================================*/
create index KHUYENMAISANPHAM_FK on KHUYENMAISANPHAM (
MASP ASC
)
go

/*==============================================================*/
/* Index: KHUYENMAISANPHAM2_FK                                  */
/*==============================================================*/
create index KHUYENMAISANPHAM2_FK on KHUYENMAISANPHAM (
MAKHUYENMAI ASC
)
go

/*==============================================================*/
/* Table: LOAIDOITUONG                                          */
/*==============================================================*/
create table LOAIDOITUONG (
   MALOAIDOITUONG       char(10)             not null,
   TENLOAIDOITUONG      nvarchar(150)         not null,
   MOTALOAIDOITUONG     nvarchar(200)         null,
   constraint PK_LOAIDOITUONG primary key nonclustered (MALOAIDOITUONG)
)
go

/*==============================================================*/
/* Table: LOAIQUYEN                                             */
/*==============================================================*/
create table LOAIQUYEN (
   MALOAIQUYEN          char(10)             not null,
   TENLOAIQUYEN         nvarchar(150)         not null,
   MOTALOAIQUYEN        nvarchar(200)         null,
   constraint PK_LOAIQUYEN primary key nonclustered (MALOAIQUYEN)
)
go

/*==============================================================*/
/* Table: LOAISANPHAM                                           */
/*==============================================================*/
create table LOAISANPHAM (
   MALOAI               char(10)             not null,
   TENLOAI              nvarchar(100)         not null,
   MOTALOAI             nvarchar(200)         null,
   constraint PK_LOAISANPHAM primary key nonclustered (MALOAI)
)
go

/*==============================================================*/
/* Table: NHANVIEN                                              */
/*==============================================================*/
create table NHANVIEN (
   MANV                 char(10)             not null,
   MABOPHAN             char(10)             not null,
   MACHUCVU             char(10)             not null,
   HOTENNV              nvarchar(150)         not null,
   SODIENTHOAINV        varchar(15)          not null,
   EMAILNV              varchar(100)         null,
   TRANGTHAINV          nvarchar(150)         not null,
   constraint PK_NHANVIEN primary key nonclustered (MANV)
)
go

/*==============================================================*/
/* Index: BOPHAN_NHANVIEN_FK                                    */
/*==============================================================*/
create index BOPHAN_NHANVIEN_FK on NHANVIEN (
MABOPHAN ASC
)
go

/*==============================================================*/
/* Index: NHANVIEN_CHUCVU_FK                                    */
/*==============================================================*/
create index NHANVIEN_CHUCVU_FK on NHANVIEN (
MACHUCVU ASC
)
go

/*==============================================================*/
/* Table: PHANQUYEN                                             */
/*==============================================================*/
create table PHANQUYEN (
   MAVAITRO             char(10)             not null,
   MADOITUONG           char(10)             not null,
   MAQUYEN              char(10)             not null,
   NGAYCAPQUYEN         datetime             not null,
   NGUOICAPQUYEN        nvarchar(150)         not null,
   GHICHUCQ             nvarchar(200)         null,
   constraint PK_PHANQUYEN primary key (MAVAITRO, MADOITUONG, MAQUYEN)
)
go

/*==============================================================*/
/* Index: PHANQUYEN_FK                                          */
/*==============================================================*/
create index PHANQUYEN_FK on PHANQUYEN (
MAVAITRO ASC
)
go

/*==============================================================*/
/* Index: PHANQUYEN2_FK                                         */
/*==============================================================*/
create index PHANQUYEN2_FK on PHANQUYEN (
MADOITUONG ASC
)
go

/*==============================================================*/
/* Index: PHANQUYEN3_FK                                         */
/*==============================================================*/
create index PHANQUYEN3_FK on PHANQUYEN (
MAQUYEN ASC
)
go

/*==============================================================*/
/* Table: PHIEUBAOHANH                                          */
/*==============================================================*/
create table PHIEUBAOHANH (
   MAPHIEUBAOHANH       char(10)             not null,
   MASP                 char(10)             not null,
   NGAYBATDAUBH         datetime             not null,
   NGAYKETTHUCBH        datetime             not null,
   LOAIBAOHANH          nvarchar(150)         not null,
   THOIGIANBAOHANH      int                  not null,
   DONVIBAOHANH         nvarchar(150)         not null,
   TRANGTHAIBAOHANH     nvarchar(200)         not null,
   GHICHUBH             nvarchar(200)         null,
   constraint PK_PHIEUBAOHANH primary key nonclustered (MAPHIEUBAOHANH)
)
go

/*==============================================================*/
/* Index: SANPHAM_PHIEUBAOHANH2_FK                              */
/*==============================================================*/
create index SANPHAM_PHIEUBAOHANH2_FK on PHIEUBAOHANH (
MASP ASC
)
go

/*==============================================================*/
/* Table: PHIEUNHAP                                             */
/*==============================================================*/
create table PHIEUNHAP (
   SOPN                 char(10)             not null,
   MANV                 char(10)             not null,
   NGAYPN               datetime             not null,
   LYDONHAP             nvarchar(150)         not null,
   TRIGIANHAP           decimal              not null,
   GHICHUPN             nvarchar(200)         null,
   constraint PK_PHIEUNHAP primary key nonclustered (SOPN)
)
go

/*==============================================================*/
/* Index: NHANVIEN_PHIEUNHAP_FK                                 */
/*==============================================================*/
create index NHANVIEN_PHIEUNHAP_FK on PHIEUNHAP (
MANV ASC
)
go

/*==============================================================*/
/* Table: PHIEUXUAT                                             */
/*==============================================================*/
create table PHIEUXUAT (
   SOPX                 char(10)             not null,
   MANV                 char(10)             not null,
   NGAYPX               datetime             not null,
   LYDOXUAT             nvarchar(150)         not null,
   TRIGIAXUAT           decimal              not null,
   GHICHUPX             nvarchar(200)         null,
   constraint PK_PHIEUXUAT primary key nonclustered (SOPX)
)
go

/*==============================================================*/
/* Index: NHANVIEN_PHIEUXUAT_FK                                 */
/*==============================================================*/
create index NHANVIEN_PHIEUXUAT_FK on PHIEUXUAT (
MANV ASC
)
go

/*==============================================================*/
/* Table: QUOCGIA                                               */
/*==============================================================*/
create table QUOCGIA (
   MAQUOCGIA            varchar(10)          not null,
   TENQUOCGIA           nvarchar(150)         not null,
   HINHANHLACO          image                null,
   MOTAQG               nvarchar(200)         null,
   constraint PK_QUOCGIA primary key nonclustered (MAQUOCGIA)
)
go

/*==============================================================*/
/* Table: QUYEN                                                 */
/*==============================================================*/
create table QUYEN (
   MAQUYEN              char(10)             not null,
   MALOAIQUYEN          char(10)             not null,
   TENQUYEN             nvarchar(150)         not null,
   MOTAQUYEN            nvarchar(200)         null,
   constraint PK_QUYEN primary key nonclustered (MAQUYEN)
)
go

/*==============================================================*/
/* Index: QUYEN_LOAIQUYEN_FK                                    */
/*==============================================================*/
create index QUYEN_LOAIQUYEN_FK on QUYEN (
MALOAIQUYEN ASC
)
go

/*==============================================================*/
/* Table: SANPHAM                                               */
/*==============================================================*/
create table SANPHAM (
   MASP                 char(10)             not null,
   THANGTK              int                  not null,
   NAMTK                int                  not null,
   MAQUOCGIA            varchar(10)          not null,
   MATHUONGHIEU         char(10)             not null,
   MALOAI               char(10)             not null,
   TENSP                nvarchar(150)         not null,
   NGAYSANXUATSP        datetime             not null,
   MOTASP               nvarchar(200)         null,
   THOIGIANBAOHANHSP    int                  not null,
   TRANGTHAISP          nvarchar(200)         not null,
   constraint PK_SANPHAM primary key nonclustered (MASP)
)
go

/*==============================================================*/
/* Index: LOAISANPHAM_SANPHAM_FK                                */
/*==============================================================*/
create index LOAISANPHAM_SANPHAM_FK on SANPHAM (
MALOAI ASC
)
go

/*==============================================================*/
/* Index: THUONGHIEU_SANPHAM_FK                                 */
/*==============================================================*/
create index THUONGHIEU_SANPHAM_FK on SANPHAM (
MATHUONGHIEU ASC
)
go

/*==============================================================*/
/* Index: QUOCGIA_SANPHAM_FK                                    */
/*==============================================================*/
create index QUOCGIA_SANPHAM_FK on SANPHAM (
MAQUOCGIA ASC
)
go

/*==============================================================*/
/* Index: TONKHO_SANPHAM_FK                                     */
/*==============================================================*/
create index TONKHO_SANPHAM_FK on SANPHAM (
THANGTK ASC,
NAMTK ASC
)
go

/*==============================================================*/
/* Table: TAIKHOAN                                              */
/*==============================================================*/
create table TAIKHOAN (
   MATAIKHOAN           char(10)             not null,
   MANV                 char(10)             not null,
   MAVAITRO             char(10)             not null,
   TENTK                varchar(100)         not null,
   MATKHAUTK            varchar(100)         not null,
   TRANGTHAITK          nvarchar(100)         not null,
   constraint PK_TAIKHOAN primary key nonclustered (MATAIKHOAN)
)
go

/*==============================================================*/
/* Index: TAIKHOAN_VAITRO_FK                                    */
/*==============================================================*/
create index TAIKHOAN_VAITRO_FK on TAIKHOAN (
MAVAITRO ASC
)
go

/*==============================================================*/
/* Index: NHANVIEN_TAIKHOAN2_FK                                 */
/*==============================================================*/
create index NHANVIEN_TAIKHOAN2_FK on TAIKHOAN (
MANV ASC
)
go

/*==============================================================*/
/* Table: THUONGHIEU                                            */
/*==============================================================*/
create table THUONGHIEU (
   MATHUONGHIEU         char(10)             not null,
   TENTHUONGHIEU        nvarchar(150)         not null,
   MOTATHUONGHIEU       nvarchar(200)         null,
   constraint PK_THUONGHIEU primary key nonclustered (MATHUONGHIEU)
)
go

/*==============================================================*/
/* Table: TONKHO                                                */
/*==============================================================*/
create table TONKHO (
   THANGTK              int                  not null,
   NAMTK                int                  not null,
   TONDAUKY             int                  not null,
   TRIGIATONDK          decimal              not null,
   NHAPTRONGKY          int                  not null,
   TRIGIANHAPTK         decimal              not null,
   XUATTRONGKY          int                  not null,
   TRIGIAXUATTK         decimal              not null,
   TONCUOIKY            int                  not null,
   TRIGIATONCK          decimal              not null,
   constraint PK_TONKHO primary key nonclustered (THANGTK, NAMTK)
)
go

/*==============================================================*/
/* Table: VAITRO                                                */
/*==============================================================*/
create table VAITRO (
   MAVAITRO             char(10)             not null,
   TENVAITRO            nvarchar(150)         not null,
   MOTAVAITRO           nvarchar(200)         null,
   constraint PK_VAITRO primary key nonclustered (MAVAITRO)
)
go

alter table BIENDONGGIA
   add constraint FK_BIENDONG_BIENDONGG_SANPHAM foreign key (MASP)
      references SANPHAM (MASP)
go

alter table CHITIETDONHANG
   add constraint FK_CHITIETD_CHITIETDO_SANPHAM foreign key (MASP)
      references SANPHAM (MASP)
go

alter table CHITIETDONHANG
   add constraint FK_CHITIETD_CHITIETDO_DONHANG foreign key (MADH)
      references DONHANG (MADH)
go

alter table CHITIETHOADON
   add constraint FK_CHITIETH_CHITIETHO_SANPHAM foreign key (MASP)
      references SANPHAM (MASP)
go

alter table CHITIETHOADON
   add constraint FK_CHITIETH_CHITIETHO_HOADON foreign key (MAHOADON)
      references HOADON (MAHOADON)
go

alter table CHITIETPHIEUNHAP
   add constraint FK_CHITIETP_CHITIETPH_PHIEUNHA foreign key (SOPN)
      references PHIEUNHAP (SOPN)
go

alter table CHITIETPHIEUNHAP
   add constraint FK_CHITIETP_CHITIETPH_SANPHAM foreign key (MASP)
      references SANPHAM (MASP)
go

alter table CHITIETPHIEUXUAT
   add constraint FK_CHITIETP_CHITIETPH_PHIEUXUA foreign key (SOPX)
      references PHIEUXUAT (SOPX)
go

alter table CHITIETPHIEUXUAT
   add constraint FK_CHITIETP_FK_PHIEUX_SANPHAM foreign key (MASP)
      references SANPHAM (MASP)
go

alter table DOITUONG
   add constraint FK_DOITUONG_DOITUONG__LOAIDOIT foreign key (MALOAIDOITUONG)
      references LOAIDOITUONG (MALOAIDOITUONG)
go

alter table DONHANG
   add constraint FK_DONHANG_KHACHHANG_KHACHHAN foreign key (MAKH)
      references KHACHHANG (MAKH)
go

alter table DONHANG
   add constraint FK_DONHANG_NHANVIEN__NHANVIEN foreign key (MANV)
      references NHANVIEN (MANV)
go

alter table HOADON
   add constraint FK_HOADON_DONHANG_H_DONHANG foreign key (MADH)
      references DONHANG (MADH)
go

alter table HOADON
   add constraint FK_HOADON_KHUYENMAI_KHUYENMA foreign key (MAKHUYENMAI)
      references KHUYENMAI (MAKHUYENMAI)
go

alter table KHUYENMAISANPHAM
   add constraint FK_KHUYENMA_KHUYENMAI_SANPHAM foreign key (MASP)
      references SANPHAM (MASP)
go

alter table KHUYENMAISANPHAM
   add constraint FK_KHUYENMA_KHUYENMAI_KHUYENMA foreign key (MAKHUYENMAI)
      references KHUYENMAI (MAKHUYENMAI)
go

alter table NHANVIEN
   add constraint FK_NHANVIEN_BOPHAN_NH_BOPHAN foreign key (MABOPHAN)
      references BOPHAN (MABOPHAN)
go

alter table NHANVIEN
   add constraint FK_NHANVIEN_NHANVIEN__CHUCVU foreign key (MACHUCVU)
      references CHUCVU (MACHUCVU)
go

alter table PHANQUYEN
   add constraint FK_PHANQUYE_PHANQUYEN_VAITRO foreign key (MAVAITRO)
      references VAITRO (MAVAITRO)
go

alter table PHANQUYEN
   add constraint FK_PHANQUYE_PHANQUYEN_DOITUONG foreign key (MADOITUONG)
      references DOITUONG (MADOITUONG)
go

alter table PHANQUYEN
   add constraint FK_PHANQUYE_PHANQUYEN_QUYEN foreign key (MAQUYEN)
      references QUYEN (MAQUYEN)
go

alter table PHIEUBAOHANH
   add constraint FK_PHIEUBAO_SANPHAM_P_SANPHAM foreign key (MASP)
      references SANPHAM (MASP)
go

alter table PHIEUNHAP
   add constraint FK_PHIEUNHA_NHANVIEN__NHANVIEN foreign key (MANV)
      references NHANVIEN (MANV)
go

alter table PHIEUXUAT
   add constraint FK_PHIEUXUA_NHANVIEN__NHANVIEN foreign key (MANV)
      references NHANVIEN (MANV)
go

alter table QUYEN
   add constraint FK_QUYEN_QUYEN_LOA_LOAIQUYE foreign key (MALOAIQUYEN)
      references LOAIQUYEN (MALOAIQUYEN)
go

alter table SANPHAM
   add constraint FK_SANPHAM_LOAISANPH_LOAISANP foreign key (MALOAI)
      references LOAISANPHAM (MALOAI)
go

alter table SANPHAM
   add constraint FK_SANPHAM_QUOCGIA_S_QUOCGIA foreign key (MAQUOCGIA)
      references QUOCGIA (MAQUOCGIA)
go

alter table SANPHAM
   add constraint FK_SANPHAM_THUONGHIE_THUONGHI foreign key (MATHUONGHIEU)
      references THUONGHIEU (MATHUONGHIEU)
go

alter table SANPHAM
   add constraint FK_SANPHAM_TONKHO_SA_TONKHO foreign key (THANGTK, NAMTK)
      references TONKHO (THANGTK, NAMTK)
go

alter table TAIKHOAN
   add constraint FK_TAIKHOAN_NHANVIEN__NHANVIEN foreign key (MANV)
      references NHANVIEN (MANV)
go

alter table TAIKHOAN
   add constraint FK_TAIKHOAN_TAIKHOAN__VAITRO foreign key (MAVAITRO)
      references VAITRO (MAVAITRO)
go

-- 1. Bảng Quốc Gia
INSERT INTO QUOCGIA (MAQUOCGIA, TENQUOCGIA, HINHANHLACO, MOTAQG) VALUES 
('VN', N'Việt Nam', NULL, N'Hàng nội địa chất lượng cao'),
('US', N'Mỹ', NULL, N'Công nghệ tiên tiến'),
('JP', N'Nhật Bản', NULL, N'Bền bỉ, tiết kiệm'),
('KR', N'Hàn Quốc', NULL, N'Thiết kế đẹp, hiện đại'),
('CN', N'Trung Quốc', NULL, N'Giá thành hợp lý'),
('TH', N'Thái Lan', NULL, N'Lắp ráp điện tử, giá tốt'),
('DE', N'Đức', NULL, N'Tiêu chuẩn Châu Âu, siêu bền'),
('TW', N'Đài Loan', NULL, N'Linh kiện bán dẫn, chip'),
('SG', N'Singapore', NULL, N'Công nghệ cao, hiện đại'),
('UK', N'Anh', NULL, N'Tiêu chuẩn khắt khe, cao cấp');
-- 2. Bảng Thương Hiệu
INSERT INTO THUONGHIEU (MATHUONGHIEU, TENTHUONGHIEU, MOTATHUONGHIEU) VALUES 
('SS', N'Samsung', N'Tập đoàn điện tử Hàn Quốc'),
('AP', N'Apple', N'Hệ sinh thái iOS'),
('SN', N'Sony', N'Nét như Sony'),
('LG', N'LG Electronics', N'Life is Good'),
('PA', N'Panasonic', N'Thương hiệu Nhật Bản'),
('DE', N'Dell', N'Laptop bền bỉ'),
('AS', N'Asus', N'Gaming và văn phòng'),
('HP', N'HP', N'Máy tính & In ấn hàng đầu'),
('MI', N'Xiaomi', N'Hệ sinh thái thông minh giá rẻ'),
('EL', N'Electrolux', N'Thương hiệu Thụy Điển bền bỉ'),
('AC', N'Acer', N'Laptop Gaming và văn phòng'),
('CS', N'Casper', N'Chuẩn Thái Lan - Giá tiết kiệm');

-- 3. Bảng Loại Sản Phẩm
INSERT INTO LOAISANPHAM (MALOAI, TENLOAI, MOTALOAI) VALUES 
('DT', N'Điện thoại', N'Smartphone các loại'),
('LT', N'Laptop', N'Máy tính xách tay'),
('TV', N'Tivi', N'Smart TV, Android TV'),
('TL', N'Tủ lạnh', N'Tủ lạnh Inverter, Side by Side'),
('MG', N'Máy giặt', N'Cửa trước, cửa trên'),
('ML', N'Máy lạnh', N'Máy lạnh Inverter, tiết kiệm điện'),
('DH', N'Đồng hồ thông minh', N'Apple Watch, Galaxy Watch, dây đeo'),
('PK', N'Phụ kiện điện tử', N'Tai nghe, sạc dự phòng, cáp sạc'),
('GD', N'Gia dụng nhà bếp', N'Nồi cơm điện, lò vi sóng, máy xay'),
('TB', N'Máy tính bảng', N'iPad, Samsung Galaxy Tab, Kindle');

-- 4. Bảng Bộ Phận
INSERT INTO BOPHAN (MABOPHAN, TENBOPHAN, EMAILBP, MOTABP) VALUES 
('BP01', N'Ban Giám Đốc', 'bgd@dmx.com', N'Quản lý chung'),
('BP02', N'Kinh Doanh', 'sales@dmx.com', N'Bán hàng tại siêu thị'),
('BP03', N'Kế Toán', 'acc@dmx.com', N'Tài chính kế toán'),
('BP04', N'Kho Vận', 'kho@dmx.com', N'Quản lý xuất nhập tồn'),
('BP05', N'Kỹ Thuật', 'tech@dmx.com', N'Bảo hành và sửa chữa');

-- 5. Bảng Chức Vụ
INSERT INTO CHUCVU (MACHUCVU, TENCHUCVU, MOTACHUCVU) VALUES 
('CV01', N'Cửa hàng trưởng', N'Quản lý siêu thị'),
('CV02', N'Nhân viên bán hàng', N'Tư vấn bán hàng'),
('CV03', N'Thu ngân', N'Thanh toán'),
('CV04', N'Thủ kho', N'Quản lý kho'),
('CV05', N'Kỹ thuật viên', N'Lắp đặt bảo hành');

-- 6. Bảng Khách Hàng 
INSERT INTO KHACHHANG (MAKH, HOTENKH, SODIENTHOAIKH, EMAIKH, GIOITINHKH, DIACHIKH, NGAYSINHKH, DIEMTICHLUY) VALUES 
('KH01', N'Nguyễn Văn An', '0901111111', 'nva@gmail.com', N'Nam', N'TP.HCM', '1990-01-01', 100),
('KH02', N'Trần Thị Bích', '0901111112', 'ttb@gmail.com', N'Nữ', N'Hà Nội', '1995-05-05', 50),
('KH03', N'Lê Văn Cương', '0901111113', 'lvc@gmail.com', N'Nam', N'Đà Nẵng', '1988-12-12', 200),
('KH04', N'Phạm Thị Dung', '0901111114', 'ptd@gmail.com', N'Nữ', N'Cần Thơ', '2000-10-10', 0),
('KH05', N'Hoàng Văn Chiến', '0901111115', 'hve@gmail.com', N'Nam', N'Hải Phòng', '1992-02-28', 150),
('KH06', N'Vũ Thị Hạnh', '0901111116', NULL, N'Nữ', N'TP.HCM', '1998-07-07', 20),
('KH07', N'Đặng Văn Giang', '0901111117', NULL, N'Nam', N'Bình Dương', '1985-06-06', 300),
('KH08', N'Bùi Thị Hà', '0901111118', 'bth@gmail.com', N'Nữ', N'Đồng Nai', '1993-09-09', 80),
('KH09', N'Đỗ Văn Mười', '0901111119', 'dvi@gmail.com', N'Nam', N'Long An', '1991-11-20', 120),
('KH10', N'Hồ Thị Khuê', '0901111120', 'htk@gmail.com', N'Nữ', N'TP.HCM', '1997-03-15', 60),
('KH11', N'Ngô Văn Lâm', '0901111121', NULL, N'Nam', N'Tiền Giang', '1989-08-19', 40),
('KH12', N'Dương Thị Muồi', '0901111122', 'dtm@gmail.com', N'Nữ', N'Vũng Tàu', '1996-04-30', 90),
('KH13', N'Lý Văn Ngư', '0901111123', 'lvn@gmail.com', N'Nam', N'TP.HCM', '1994-12-25', 110),
('KH14', N'Vương Thị Oanh', '0901111124', NULL, N'Nữ', N'Hà Nội', '1999-01-01', 30),
('KH15', N'Trương Văn Phúc', '0901111125', 'tvp@gmail.com', N'Nam', N'TP.HCM', '1987-05-15', 500),
('KH16', N'Phan Thị Huệ', '0901111126', NULL, N'Nữ', N'Quảng Ninh', '2001-02-02', 10),
('KH17', N'Cao Văn Trung', '0901111127', 'cvr@gmail.com', N'Nam', N'Nghệ An', '1990-10-20', 70),
('KH18', N'Đinh Thị Sương', '0901111128', 'dts@gmail.com', N'Nữ', N'Thanh Hóa', '1995-11-11', 130),
('KH19', N'Lâm Văn Tú', '0901111129', NULL, N'Nam', N'TP.HCM', '1992-06-01', 45),
('KH20', N'Mai Thị Hồng Hạnh', '0901111130', 'mtu@gmail.com', N'Nữ', N'Bến Tre', '1998-09-02', 25);

-- 7. Bảng Khuyến mãi
INSERT INTO KHUYENMAI (MAKHUYENMAI, TENCHUONGTRINH, NGAYBATDAUKM, NGAYKETTHUCKM, LOAIGIAMGIA, GIATRIGIAM, MOTAKM) VALUES 
('KM01', N'Chào Hè Sôi Động', '2023-06-01', '2023-08-31', N'Trừ tiền', 200000, N'Giảm giá mùa hè'),
('KM02', N'Back to School', '2023-09-01', '2023-09-30', N'Phần trăm', 10, N'Giảm 10% cho Laptop'),
('KM03', N'Black Friday', '2023-11-24', '2023-11-26', N'Trừ tiền', 500000, N'Siêu sale'),
('KM04', N'Mừng Tết Nguyên Đán', '2024-01-01', '2024-02-15', N'Quà tặng', 0, N'Tặng bộ ly'),
('KM05', N'Xả kho cuối năm', '2023-12-01', '2023-12-31', N'Trừ tiền', 1000000, N'Giảm sâu Tivi'),
('KM06', N'Cyber Monday', '2023-11-27', '2023-11-27', N'Phần trăm', 15, N'Săn sale công nghệ'),
('KM07', N'Valentine Ngọt Ngào', '2024-02-10', '2024-02-14', N'Quà tặng', 0, N'Tặng quà cho cặp đôi'),
('KM08', N'Quốc Tế Phụ Nữ', '2024-03-01', '2024-03-08', N'Trừ tiền', 300000, N'Ưu đãi cho khách nữ'),
('KM09', N'Đại Lễ 30/4 - 1/5', '2024-04-25', '2024-05-02', N'Phần trăm', 20, N'Mừng ngày thống nhất'),
('KM10', N'Chào Hè 2024', '2024-06-01', '2024-07-31', N'Trừ tiền', 500000, N'Giảm giá máy lạnh/quạt');

-- 8. Bảng Vai trò
INSERT INTO VAITRO (MAVAITRO, TENVAITRO, MOTAVAITRO) VALUES 
('ADMIN', N'Quản trị viên', N'Quyền quản trị cao nhất, truy cập toàn bộ hệ thống'),
('MANAGER', N'Cửa hàng trưởng', N'Quản lý hoạt động, xem báo cáo, duyệt đơn'),
('STAFF', N'Nhân viên bán hàng', N'Tạo đơn hàng, tra cứu sản phẩm, xem tồn kho'),
('CASHIER', N'Thu ngân', N'Thanh toán hóa đơn, in hóa đơn, đóng ca'),
('WAREHOUSE', N'Thủ kho', N'Quản lý nhập xuất kho, kiểm kê hàng hóa');

-- 9. Bảng Loại đối tượng
INSERT INTO LOAIDOITUONG (MALOAIDOITUONG, TENLOAIDOITUONG, MOTALOAIDOITUONG) VALUES 
('FORM', N'Màn hình chức năng', N'Các giao diện nhập liệu và xử lý chính'),
('REP', N'Báo cáo thống kê', N'Các màn hình xem và xuất báo cáo'),
('SYS', N'Hệ thống', N'Các chức năng cấu hình, sao lưu, phục hồi'),
('CAT', N'Danh mục', N'Quản lý các danh mục dữ liệu nền'),
('DASH', N'Bảng điều khiển', N'Màn hình tổng quan Dashboard');

-- 10. Bảng Loại quyền
INSERT INTO LOAIQUYEN (MALOAIQUYEN, TENLOAIQUYEN, MOTALOAIQUYEN) VALUES 
('VIEW', N'Quyền Xem', N'Chỉ được phép xem dữ liệu, không thay đổi'),
('EDIT', N'Quyền Tác động', N'Thêm, xóa, sửa dữ liệu'),
('EXEC', N'Quyền Thực thi', N'Chạy các quy trình xử lý, in ấn'),
('APPR', N'Quyền Phê duyệt', N'Duyệt các phiếu, đơn hàng'),
('SYS', N'Quyền Hệ thống', N'Can thiệp cấu trúc dữ liệu');

-- 11. Bảng Tồn kho
INSERT INTO TONKHO (THANGTK, NAMTK, TONDAUKY, TRIGIATONDK, NHAPTRONGKY, TRIGIANHAPTK, XUATTRONGKY, TRIGIAXUATTK, TONCUOIKY, TRIGIATONCK) VALUES 
(1, 2023, 0, 0, 2000, 10000000000, 500, 2500000000, 1500, 7500000000),
(2, 2023, 1500, 7500000000, 500, 2500000000, 800, 4000000000, 1200, 6000000000),
(3, 2023, 1200, 6000000000, 600, 3000000000, 400, 2000000000, 1400, 7000000000),
(4, 2023, 1400, 7000000000, 300, 1500000000, 500, 2500000000, 1200, 6000000000),
(5, 2023, 1200, 6000000000, 800, 4000000000, 600, 3000000000, 1400, 7000000000),
(6, 2023, 1400, 7000000000, 1000, 5000000000, 900, 4500000000, 1500, 7500000000), 
(7, 2023, 1500, 7500000000, 200, 1000000000, 700, 3500000000, 1000, 5000000000),
(8, 2023, 1000, 5000000000, 500, 2500000000, 400, 2000000000, 1100, 5500000000),
(9, 2023, 1100, 5500000000, 1500, 7500000000, 1200, 6000000000, 1400, 7000000000),
(10, 2023, 1400, 7000000000, 1000, 5000000000, 800, 4000000000, 1600, 8000000000),
(11, 2023, 1600, 8000000000, 2000, 10000000000, 1500, 7500000000, 2100, 10500000000),
(12, 2023, 2100, 10500000000, 500, 2500000000, 1800, 9000000000, 800, 4000000000), 
(1, 2024, 800, 4000000000, 2500, 12500000000, 2000, 10000000000, 1300, 6500000000), 
(2, 2024, 1300, 6500000000, 200, 1000000000, 500, 2500000000, 1000, 5000000000),  
(3, 2024, 1000, 5000000000, 600, 3000000000, 400, 2000000000, 1200, 6000000000),
(4, 2024, 1200, 6000000000, 800, 4000000000, 600, 3000000000, 1400, 7000000000),
(5, 2024, 1400, 7000000000, 1200, 6000000000, 1000, 5000000000, 1600, 8000000000),
(6, 2024, 1600, 8000000000, 500, 2500000000, 800, 4000000000, 1300, 6500000000);

-- 12. Bảng Nhân Viên 
INSERT INTO NHANVIEN (MANV, MABOPHAN, MACHUCVU, HOTENNV, SODIENTHOAINV, EMAILNV, TRANGTHAINV) VALUES 
('NV01', 'BP01', 'CV01', N'Nguyễn Thị Hồng', '0912345678', 'ql@dmx.com', N'Đang làm việc'),
('NV02', 'BP02', 'CV02', N'Trần Văn Vương 1', '0912345679', 'bh1@dmx.com', N'Đang làm việc'),
('NV03', 'BP02', 'CV02', N'Lê Hồng Quốc 2', '0912345680', 'bh2@dmx.com', N'Đang làm việc'),
('NV04', 'BP02', 'CV02', N'Phạm Băng Băng 3', '0912345681', 'bh3@dmx.com', N'Đang làm việc'),
('NV05', 'BP02', 'CV02', N'Hoàng Thị Hồng 4', '0912345682', 'bh4@dmx.com', N'Đang làm việc'),
('NV06', 'BP02', 'CV03', N'Vũ Thu Ngân 1', '0912345683', 'tn1@dmx.com', N'Đang làm việc'),
('NV07', 'BP02', 'CV03', N'Đặng Thu Thảo 2', '0912345684', 'tn2@dmx.com', N'Đang làm việc'),
('NV08', 'BP04', 'CV04', N'Bùi Thủ Khoa 1', '0912345685', 'kho1@dmx.com', N'Đang làm việc'),
('NV09', 'BP04', 'CV04', N'Đỗ Văn Viết 2', '0912345686', 'kho2@dmx.com', N'Đang làm việc'),
('NV10', 'BP05', 'CV05', N'Hồ Trung Hậu 1', '0912345687', 'kt1@dmx.com', N'Đang làm việc'),
('NV11', 'BP05', 'CV05', N'Ngô Trung Kiên 2', '0912345688', 'kt2@dmx.com', N'Đang làm việc'),
('NV12', 'BP03', 'CV01', N'Dương Quốc Mỹ', '0912345689', 'kt@dmx.com', N'Đang làm việc'),
('NV13', 'BP02', 'CV02', N'Lý Thị Sương 5', '0912345690', 'bh5@dmx.com', N'Đang làm việc'),
('NV14', 'BP02', 'CV02', N'Vương Quý Bảo 6', '0912345691', 'bh6@dmx.com', N'Nghỉ phép'),
('NV15', 'BP04', 'CV04', N'Trương Thành Tiến', '0912345692', 'pk@dmx.com', N'Đang làm việc'),
('NV16', 'BP05', 'CV05', N'Phan Quốc Anh', '0912345693', 'bh@dmx.com', N'Đang làm việc'),
('NV17', 'BP02', 'CV02', N'Cao Thì Tiến', '0912345694', 'tt@dmx.com', N'Thử việc'),
('NV18', 'BP01', 'CV01', N'Đinh Trung Nhật', '0912345695', 'pql@dmx.com', N'Đang làm việc'),
('NV19', 'BP02', 'CV03', N'Lâm Hoàng Phương Tuyền 3', '0912345696', 'tn3@dmx.com', N'Đang làm việc'),
('NV20', 'BP05', 'CV05', N'Mai Ánh Sáng', '0912345697', 'ld@dmx.com', N'Đang làm việc');

-- 13. Chèn Sản Phẩm 
INSERT INTO SANPHAM (MASP, THANGTK, NAMTK, MAQUOCGIA, MATHUONGHIEU, MALOAI, TENSP, NGAYSANXUATSP, THOIGIANBAOHANHSP, TRANGTHAISP) VALUES 
('SP01', 10, 2023, 'US', 'AP', 'DT', N'iPhone 14 Pro Max', '2022-09-01', 12, N'Đang kinh doanh'),
('SP02', 10, 2023, 'US', 'AP', 'DT', N'iPhone 15', '2023-09-01', 12, N'Đang kinh doanh'),
('SP03', 10, 2023, 'KR', 'SS', 'DT', N'Samsung Galaxy S23 Ultra', '2023-02-01', 12, N'Đang kinh doanh'),
('SP04', 10, 2023, 'KR', 'SS', 'TV', N'Smart Tivi Samsung 4K 55 inch', '2023-01-01', 24, N'Đang kinh doanh'),
('SP05', 10, 2023, 'JP', 'SN', 'TV', N'Android Tivi Sony 4K 43 inch', '2022-12-01', 24, N'Đang kinh doanh'),
('SP06', 10, 2023, 'JP', 'SN', 'TV', N'Android Tivi Sony 8K 75 inch', '2023-05-01', 36, N'Hàng cao cấp'),
('SP07', 10, 2023, 'KR', 'LG', 'TL', N'Tủ lạnh LG Inverter 315 lít', '2023-03-01', 24, N'Đang kinh doanh'),
('SP08', 10, 2023, 'KR', 'LG', 'MG', N'Máy giặt LG AI DD 9kg', '2023-04-01', 24, N'Đang kinh doanh'),
('SP09', 10, 2023, 'JP', 'PA', 'TL', N'Tủ lạnh Panasonic 188 lít', '2022-11-01', 24, N'Đang kinh doanh'),
('SP10', 10, 2023, 'JP', 'PA', 'MG', N'Máy giặt Panasonic 10kg', '2023-01-15', 24, N'Đang kinh doanh'),
('SP11', 10, 2023, 'US', 'DE', 'LT', N'Laptop Dell Inspiron 15', '2023-06-01', 12, N'Đang kinh doanh'),
('SP12', 10, 2023, 'US', 'DE', 'LT', N'Laptop Dell XPS 13', '2023-07-01', 12, N'Đang kinh doanh'),
('SP13', 10, 2023, 'VN', 'AS', 'LT', N'Laptop Asus Vivobook', '2023-05-20', 24, N'Đang kinh doanh'),
('SP14', 10, 2023, 'VN', 'AS', 'LT', N'Laptop Asus TUF Gaming', '2023-08-01', 24, N'Đang kinh doanh'),
('SP15', 10, 2023, 'KR', 'SS', 'TL', N'Tủ lạnh Samsung Side by Side', '2023-02-15', 24, N'Đang kinh doanh'),
('SP16', 10, 2023, 'JP', 'SN', 'DT', N'Sony Xperia 1 V', '2023-06-01', 12, N'Ít hàng'),
('SP17', 10, 2023, 'US', 'AP', 'LT', N'MacBook Air M2', '2022-07-15', 12, N'Đang kinh doanh'),
('SP18', 10, 2023, 'US', 'AP', 'LT', N'MacBook Pro 14 inch', '2023-01-20', 12, N'Đang kinh doanh'),
('SP19', 10, 2023, 'KR', 'LG', 'TV', N'Smart Tivi LG OLED 55 inch', '2023-04-10', 24, N'Đang kinh doanh'),
('SP20', 10, 2023, 'JP', 'PA', 'MG', N'Máy giặt sấy Panasonic', '2023-03-30', 24, N'Đang kinh doanh'),
('SP21', 10, 2023, 'KR', 'LG', 'ML', N'Máy lạnh LG Inverter 1HP', '2023-05-20', 24, N'Đang kinh doanh'),
('SP22', 10, 2023, 'US', 'AP', 'DH', N'Apple Watch Series 9', '2023-09-15', 12, N'Hàng mới về'),
('SP23', 10, 2023, 'JP', 'SN', 'PK', N'Tai nghe Sony WH-1000XM5', '2023-02-10', 12, N'Đang kinh doanh'),
('SP24', 10, 2023, 'JP', 'PA', 'GD', N'Nồi cơm điện Panasonic', '2023-06-01', 12, N'Đang kinh doanh'),
('SP25', 10, 2023, 'US', 'AP', 'TB', N'iPad Pro M2 11 inch', '2022-11-20', 12, N'Đang kinh doanh'),
('SP26', 10, 2023, 'KR', 'SS', 'TB', N'Samsung Galaxy Tab S9', '2023-08-11', 12, N'Đang kinh doanh'),
('SP27', 10, 2023, 'KR', 'SS', 'PK', N'Sạc dự phòng Samsung 10Ah', '2023-01-15', 12, N'Đang kinh doanh'),
('SP28', 10, 2023, 'JP', 'PA', 'ML', N'Máy lạnh Panasonic Inverter', '2023-04-30', 24, N'Bán chạy'),
('SP29', 10, 2023, 'VN', 'AS', 'LT', N'Laptop Asus ROG Strix', '2023-07-20', 24, N'Đang kinh doanh'),
('SP30', 10, 2023, 'US', 'DE', 'PK', N'Chuột không dây Dell', '2023-03-10', 12, N'Đang kinh doanh');

-- 14. Bảng Đối tượng
INSERT INTO DOITUONG (MADOITUONG, MALOAIDOITUONG, TENDOITUONG, MOTADOITUONG) VALUES 
('FRM_BAN', 'FORM', N'Quản lý Bán hàng', N'Màn hình lập hóa đơn, tra cứu khách hàng'),
('FRM_NHAP', 'FORM', N'Quản lý Nhập kho', N'Màn hình lập phiếu nhập'),
('FRM_SP', 'CAT', N'Danh mục Sản phẩm', N'Quản lý thông tin hàng hóa'),
('FRM_KH', 'CAT', N'Danh mục Khách hàng', N'Quản lý hồ sơ khách hàng'),
('FRM_NV', 'CAT', N'Hồ sơ Nhân viên', N'Quản lý nhân sự'),
('RPT_DOANH', 'REP', N'Báo cáo Doanh thu', N'Thống kê doanh số theo ngày/tháng'),
('RPT_TON', 'REP', N'Báo cáo Tồn kho', N'Thống kê xuất nhập tồn'),
('SYS_USER', 'SYS', N'Quản lý Tài khoản', N'Cấp tài khoản và phân quyền'),
('FRM_BH', 'FORM', N'Quản lý Bảo hành', N'Tiếp nhận và trả bảo hành'),
('DASH_MAIN', 'DASH', N'Dashboard Quản lý', N'Xem biểu đồ tổng quan');

-- 15. Bảng quyền
INSERT INTO QUYEN (MAQUYEN, MALOAIQUYEN, TENQUYEN, MOTAQUYEN) VALUES 
('Q_VIEW', 'VIEW', N'Xem danh sách', N'Được xem dữ liệu dạng lưới'),
('Q_ADD', 'EDIT', N'Thêm mới', N'Tạo mới bản ghi'),
('Q_EDIT', 'EDIT', N'Chỉnh sửa', N'Cập nhật thông tin'),
('Q_DEL', 'EDIT', N'Xóa bỏ', N'Xóa bản ghi khỏi hệ thống'),
('Q_PRINT', 'EXEC', N'In ấn', N'In hóa đơn, báo cáo'),
('Q_EXPORT', 'EXEC', N'Xuất Excel', N'Kết xuất dữ liệu ra file'),
('Q_BACKUP', 'SYS', N'Sao lưu dữ liệu', N'Backup Database'),
('Q_APPROVE', 'APPR', N'Duyệt phiếu', N'Xác nhận phiếu nhập/xuất');


-- 16. Bảng Tài Khoản 
INSERT INTO TAIKHOAN (MATAIKHOAN, MANV, MAVAITRO, TENTK, MATKHAUTK, TRANGTHAITK) VALUES
('TK01', 'NV01', 'ADMIN', 'admin', '123456', 'Active'),
('TK02', 'NV02', 'STAFF', 'user1', '123456', 'Active'),
('TK03', 'NV03', 'STAFF', 'user2', '123456', 'Active'),
('TK04', 'NV06', 'STAFF', 'thungan1', '123456', 'Active'),
('TK05', 'NV08', 'STAFF', 'kho1', '123456', 'Active');


INSERT INTO TAIKHOAN (MATAIKHOAN, MANV, MAVAITRO, TENTK, MATKHAUTK, TRANGTHAITK) 
VALUES 
('TK06', 'NV09', 'STAFF', 'kho2', '123456', 'Active'),
('TK07', 'NV04', 'STAFF', 'thungan2', '123456', 'Active'),
('TK08', 'NV12', 'ADMIN', 'quanly1', '123456', 'Active'),
('TK09', 'NV10', 'STAFF', 'ketoan1', '123456', 'Active'),
('TK10', 'NV05', 'STAFF', 'user3', '123456', 'Locked'),
('TK06', 'NV09', 'STAFF', 'kho2', '123456', 'Active'),
('TK07', 'NV04', 'STAFF', 'thungan2', '123456', 'Active'),
('TK08', 'NV12', 'ADMIN', 'quanly1', '123456', 'Active'),
('TK09', 'NV10', 'STAFF', 'ketoan1', '123456', 'Active'),
('TK10', 'NV05', 'STAFF', 'user3', '123456', 'Locked'),
('TK11', 'NV07', 'STAFF', 'thungan3', '123456', 'Active'),
('TK12', 'NV11', 'STAFF', 'ketoan2', '123456', 'Active'),
('TK13', 'NV13', 'STAFF', 'sale01', '123456', 'Active'),
('TK14', 'NV14', 'STAFF', 'sale02', '123456', 'Locked'), -- Nhân viên đang nghỉ phép
('TK15', 'NV15', 'STAFF', 'kho3', '123456', 'Active'),
('TK16', 'NV16', 'STAFF', 'ketoan3', '123456', 'Active'),
('TK17', 'NV17', 'STAFF', 'sale03', '123456', 'Active'), -- Nhân viên thử việc
('TK18', 'NV18', 'ADMIN', 'quanly2', '123456', 'Active'), -- Sếp phó
('TK19', 'NV19', 'STAFF', 'thungan4', '123456', 'Active'),
('TK20', 'NV20', 'STAFF', 'ketoan4', '123456', 'Active');

-- 17. Bảng Biến Động Giá 
INSERT INTO BIENDONGGIA (NGAYAPDUNG, MASP, GIABAN, GHICHUDG) VALUES
('2023-10-01', 'SP01', 29000000, N'Giá niêm yết'),
('2023-10-01', 'SP02', 22000000, N'Giá niêm yết'),
('2023-10-01', 'SP03', 25000000, N'Giá niêm yết'),
('2023-10-01', 'SP04', 15000000, N'Giá niêm yết'),
('2023-10-01', 'SP05', 12000000, N'Giá niêm yết'),
('2023-10-01', 'SP06', 50000000, N'Giá niêm yết'),
('2023-10-01', 'SP07', 8000000, N'Giá niêm yết'),
('2023-10-01', 'SP08', 10000000, N'Giá niêm yết'),
('2023-10-01', 'SP09', 5000000, N'Giá niêm yết'),
('2023-10-01', 'SP10', 11000000, N'Giá niêm yết'),
('2023-10-01', 'SP11', 18000000, N'Giá niêm yết'),
('2023-10-01', 'SP12', 40000000, N'Giá niêm yết'),
('2023-10-01', 'SP13', 16000000, N'Giá niêm yết'),
('2023-10-01', 'SP14', 21000000, N'Giá niêm yết'),
('2023-10-01', 'SP15', 30000000, N'Giá niêm yết'),
('2023-10-01', 'SP16', 28000000, N'Giá niêm yết'),
('2023-10-01', 'SP17', 24000000, N'Giá niêm yết'),
('2023-10-01', 'SP18', 45000000, N'Giá niêm yết'),
('2023-10-01', 'SP19', 35000000, N'Giá niêm yết'),
('2023-10-01', 'SP20', 14000000, N'Giá niêm yết');


-- 18. Bảng Đơn Hàng 
INSERT INTO DONHANG (MADH, MANV, MAKH, NGAYTAODH, NHUCAULAPDAT, TRANGTHAIDH, DIACHIGIAOHANG, GHICHUDH) VALUES
('DH01', 'NV02', 'KH01', '2023-10-02', N'Không', N'Đã giao', N'TP.HCM', NULL),
('DH02', 'NV02', 'KH02', '2023-10-03', N'Có', N'Đã giao', N'Hà Nội', N'Giao giờ hành chính'),
('DH03', 'NV03', 'KH03', '2023-10-04', N'Không', N'Đã hủy', N'Đà Nẵng', N'Khách đổi ý'),
('DH04', 'NV04', 'KH04', '2023-10-05', N'Có', N'Đã giao', N'Cần Thơ', NULL),
('DH05', 'NV05', 'KH05', '2023-10-06', N'Không', N'Đã giao', N'Hải Phòng', NULL),
('DH06', 'NV02', 'KH06', '2023-10-07', N'Có', N'Đã giao', N'TP.HCM', NULL),
('DH07', 'NV03', 'KH07', '2023-10-08', N'Không', N'Đang xử lý', N'Bình Dương', NULL),
('DH08', 'NV04', 'KH08', '2023-10-09', N'Có', N'Đã giao', N'Đồng Nai', NULL),
('DH09', 'NV05', 'KH09', '2023-10-10', N'Không', N'Đã giao', N'Long An', NULL),
('DH10', 'NV02', 'KH10', '2023-10-11', N'Có', N'Đã giao', N'TP.HCM', NULL),
('DH11', 'NV03', 'KH11', '2023-10-12', N'Không', N'Đã giao', N'Tiền Giang', NULL),
('DH12', 'NV04', 'KH12', '2023-10-13', N'Có', N'Đã giao', N'Vũng Tàu', NULL),
('DH13', 'NV05', 'KH13', '2023-10-14', N'Không', N'Đã giao', N'TP.HCM', NULL),
('DH14', 'NV02', 'KH14', '2023-10-15', N'Có', N'Đã giao', N'Hà Nội', NULL),
('DH15', 'NV03', 'KH15', '2023-10-16', N'Không', N'Đã giao', N'TP.HCM', NULL),
('DH16', 'NV04', 'KH16', '2023-10-17', N'Có', N'Đã giao', N'Quảng Ninh', NULL),
('DH17', 'NV05', 'KH17', '2023-10-18', N'Không', N'Đã giao', N'Nghệ An', NULL),
('DH18', 'NV02', 'KH18', '2023-10-19', N'Có', N'Đã giao', N'Thanh Hóa', NULL),
('DH19', 'NV03', 'KH19', '2023-10-20', N'Không', N'Đã giao', N'TP.HCM', NULL),
('DH20', 'NV04', 'KH20', '2023-10-21', N'Có', N'Đã giao', N'Bến Tre', NULL);

-- 19. Bảng Phiếu Nhập
INSERT INTO PHIEUNHAP (SOPN, MANV, NGAYPN, LYDONHAP, TRIGIANHAP) VALUES
('PN01', 'NV08', '2023-09-25', N'Nhập hàng định kỳ', 500000000),
('PN02', 'NV09', '2023-09-30', N'Nhập bổ sung', 200000000),
('PN03', 'NV08', '2023-10-05', N'Nhập iPhone 15', 1000000000),
('PN04', 'NV09', '2023-10-10', N'Nhập Tivi', 400000000),
('PN05', 'NV08', '2023-10-15', N'Nhập Laptop', 300000000),
('PN06', 'NV09', '2023-10-20', N'Nhập Máy lạnh', 250000000),
('PN07', 'NV08', '2023-10-25', N'Nhập Tủ lạnh Samsung', 180000000),
('PN08', 'NV09', '2023-11-01', N'Nhập hàng Apple Watch', 120000000),
('PN09', 'NV08', '2023-11-05', N'Nhập Máy giặt', 90000000),
('PN10', 'NV09', '2023-11-10', N'Nhập hàng Tết', 600000000);

-- 20. Bảng Phiếu Xuất 
INSERT INTO PHIEUXUAT (SOPX, MANV, NGAYPX, LYDOXUAT, TRIGIAXUAT) VALUES
('PX01', 'NV08', '2023-10-01', N'Xuất trả NCC', 20000000),
('PX02', 'NV09', '2023-10-05', N'Xuất hủy', 5000000),
('PX03', 'NV08', '2023-10-10', N'Xuất chuyển kho', 50000000),
('PX04', 'NV09', '2023-10-15', N'Xuất bảo hành', 0),
('PX05', 'NV08', '2023-10-20', N'Xuất trả NCC', 15000000),
('PX06', 'NV09', '2023-10-25', N'Xuất bán đại lý', 85000000),
('PX07', 'NV08', '2023-10-31', N'Xuất trả NCC lỗi', 22000000),
('PX08', 'NV09', '2023-11-05', N'Xuất khuyến mãi', 0),
('PX09', 'NV08', '2023-11-10', N'Xuất chuyển kho', 60000000),
('PX10', 'NV09', '2023-11-15', N'Xuất thanh lý', 15000000);

-- 21. Bảng Hóa Đơn 
INSERT INTO HOADON (MAHOADON, MADH, MAKHUYENMAI, NGAYLAPHD, HINHTHUCTHANHTOAN, TONGTIENHD, THUEVAT, TRANGTHAIHD) VALUES
('HD01', 'DH01', 'KM01', '2023-10-02', N'Tiền mặt', 29000000, 2900000, N'Đã thanh toán'),
('HD02', 'DH02', 'KM02', '2023-10-03', N'Chuyển khoản', 22000000, 2200000, N'Đã thanh toán'),
('HD04', 'DH04', 'KM01', '2023-10-05', N'Thẻ tín dụng', 15000000, 1500000, N'Đã thanh toán'),
('HD05', 'DH05', 'KM01', '2023-10-06', N'Tiền mặt', 12000000, 1200000, N'Đã thanh toán'),
('HD06', 'DH06', 'KM01', '2023-10-07', N'Chuyển khoản', 50000000, 5000000, N'Đã thanh toán'),
('HD07', 'DH07', 'KM01', '2023-10-08', N'Tiền mặt', 8000000, 800000, N'Đã thanh toán'),
('HD08', 'DH08', 'KM01', '2023-10-09', N'Thẻ tín dụng', 10000000, 1000000, N'Đã thanh toán'),
('HD09', 'DH09', 'KM01', '2023-10-10', N'Tiền mặt', 5000000, 500000, N'Đã thanh toán'),
('HD10', 'DH10', 'KM01', '2023-10-11', N'Chuyển khoản', 11000000, 1100000, N'Đã thanh toán'),
('HD11', 'DH11', 'KM01', '2023-10-12', N'Tiền mặt', 18000000, 1800000, N'Đã thanh toán'),
('HD12', 'DH12', 'KM01', '2023-10-13', N'Thẻ tín dụng', 40000000, 4000000, N'Đã thanh toán'),
('HD13', 'DH13', 'KM01', '2023-10-14', N'Tiền mặt', 16000000, 1600000, N'Đã thanh toán'),
('HD14', 'DH14', 'KM01', '2023-10-15', N'Chuyển khoản', 21000000, 2100000, N'Đã thanh toán'),
('HD15', 'DH15', 'KM01', '2023-10-16', N'Tiền mặt', 30000000, 3000000, N'Đã thanh toán'),
('HD16', 'DH16', 'KM01', '2023-10-17', N'Thẻ tín dụng', 28000000, 2800000, N'Đã thanh toán'),
('HD17', 'DH17', 'KM01', '2023-10-18', N'Tiền mặt', 24000000, 2400000, N'Đã thanh toán'),
('HD18', 'DH18', 'KM01', '2023-10-19', N'Chuyển khoản', 45000000, 4500000, N'Đã thanh toán'),
('HD19', 'DH19', 'KM01', '2023-10-20', N'Tiền mặt', 35000000, 3500000, N'Đã thanh toán'),
('HD20', 'DH20', 'KM01', '2023-10-21', N'Thẻ tín dụng', 14000000, 1400000, N'Đã thanh toán');

-- 22. Bảng Chi Tiết Đơn Hàng
INSERT INTO CHITIETDONHANG (MASP, MADH, SOLUONGDH, TONGTIENCHUAGIAM, TONGTIENDAGIAM) VALUES
('SP01', 'DH01', 1, 29000000, 29000000),
('SP02', 'DH02', 1, 22000000, 22000000),
('SP04', 'DH04', 1, 15000000, 15000000),
('SP05', 'DH05', 1, 12000000, 12000000),
('SP06', 'DH06', 1, 50000000, 50000000),
('SP07', 'DH07', 1, 8000000, 8000000),
('SP08', 'DH08', 1, 10000000, 10000000),
('SP09', 'DH09', 1, 5000000, 5000000),
('SP10', 'DH10', 1, 11000000, 11000000),
('SP11', 'DH11', 1, 18000000, 18000000),
('SP12', 'DH12', 1, 40000000, 40000000),
('SP13', 'DH13', 1, 16000000, 16000000),
('SP14', 'DH14', 1, 21000000, 21000000),
('SP15', 'DH15', 1, 30000000, 30000000),
('SP16', 'DH16', 1, 28000000, 28000000),
('SP17', 'DH17', 1, 24000000, 24000000),
('SP18', 'DH18', 1, 45000000, 45000000),
('SP19', 'DH19', 1, 35000000, 35000000),
('SP20', 'DH20', 1, 14000000, 14000000);

-- 23. Bảng Chi Tiết Hóa Đơn 
INSERT INTO CHITIETHOADON (MASP, MAHOADON, SOLUONGMUA, DONGIAMUA, THANHTIENHD) VALUES
('SP01', 'HD01', 1, 29000000, 29000000),
('SP02', 'HD02', 1, 22000000, 22000000),
('SP04', 'HD04', 1, 15000000, 15000000),
('SP05', 'HD05', 1, 12000000, 12000000),
('SP06', 'HD06', 1, 50000000, 50000000),
('SP07', 'HD07', 1, 8000000, 8000000),
('SP08', 'HD08', 1, 10000000, 10000000),
('SP09', 'HD09', 1, 5000000, 5000000),
('SP10', 'HD10', 1, 11000000, 11000000),
('SP11', 'HD11', 1, 18000000, 18000000),
('SP12', 'HD12', 1, 40000000, 40000000),
('SP13', 'HD13', 1, 16000000, 16000000),
('SP14', 'HD14', 1, 21000000, 21000000),
('SP15', 'HD15', 1, 30000000, 30000000),
('SP16', 'HD16', 1, 28000000, 28000000),
('SP17', 'HD17', 1, 24000000, 24000000),
('SP18', 'HD18', 1, 45000000, 45000000),
('SP19', 'HD19', 1, 35000000, 35000000),
('SP20', 'HD20', 1, 14000000, 14000000);

-- 24. Bảng Chi Tiết Phiếu Nhập
INSERT INTO CHITIETPHIEUNHAP (SOPN, MASP, SOLUONGNHAP, DONGIANHAP, THANHTIENPN) VALUES
('PN01', 'SP01', 50, 25000000, 1250000000),
('PN01', 'SP02', 50, 19000000, 950000000),
('PN02', 'SP04', 20, 12000000, 240000000),
('PN03', 'SP02', 100, 19000000, 1900000000),
('PN04', 'SP05', 30, 10000000, 300000000),
('PN06', 'SP20', 25, 10000000, 250000000),
('PN07', 'SP18', 10, 18000000, 180000000),
('PN08', 'SP16', 15, 8000000, 120000000),
('PN09', 'SP15', 10, 9000000, 90000000),
('PN10', 'SP01', 20, 25000000, 500000000),
('PN10', 'SP05', 10, 10000000, 100000000);

-- 25. Bảng Chi Tiết Phiếu Xuất 
INSERT INTO CHITIETPHIEUXUAT (SOPX, MASP, SOLUONGXUAT, DONGIAXUAT, THANHTIENPX) VALUES
('PX01', 'SP01', 5, 25000000, 125000000), -- Xuất trả 5 iPhone lỗi
('PX01', 'SP05', 2, 10000000, 20000000),  -- Xuất trả 2 Tivi
('PX02', 'SP10', 1, 10000000, 10000000),  -- Xuất hủy 1 máy giặt hỏng
('PX03', 'SP04', 10, 14000000, 140000000),-- Chuyển kho 10 Tivi Samsung
('PX04', 'SP07', 1, 0, 0),                -- Xuất bảo hành (thường giá = 0 hoặc giá vốn)
('PX05', 'SP13', 5, 15000000, 75000000),  -- Xuất trả Laptop
('PX06', 'SP20', 5, 17000000, 85000000),
('PX07', 'SP04', 2, 11000000, 22000000),
('PX08', 'SP05', 5, 0, 0),
('PX09', 'SP05', 6, 10000000, 60000000),
('PX10', 'SP13', 3, 5000000, 15000000);

-- 26. Bảng Khuyến Mãi Sản Phẩm (Quy định SP nào được hưởng KM nào)
INSERT INTO KHUYENMAISANPHAM (MASP, MAKHUYENMAI, DIEUKIENAPDUNG, TRANGTHAIKHUYENMAI) VALUES
('SP07', 'KM01', N'Mua online giảm thêm', N'Đang áp dụng'),
('SP08', 'KM01', N'Không áp dụng cùng trả góp', N'Đang áp dụng'),
('SP09', 'KM01', N'Thành viên vàng', N'Đang áp dụng'),
('SP15', 'KM01', N'Mua combo', N'Đang áp dụng'),
('SP11', 'KM02', N'Sinh viên có thẻ SV', N'Đang áp dụng'),
('SP12', 'KM02', N'Sinh viên có thẻ SV', N'Đang áp dụng'),
('SP13', 'KM02', N'Sinh viên có thẻ SV', N'Đang áp dụng'),
('SP14', 'KM02', N'Sinh viên có thẻ SV', N'Đang áp dụng'),
('SP17', 'KM02', N'Giáo viên/Sinh viên', N'Đang áp dụng'),
('SP18', 'KM02', N'Giáo viên/Sinh viên', N'Đang áp dụng'),
('SP04', 'KM05', N'Thanh toán 100%', N'Đang áp dụng'),
('SP05', 'KM05', N'Thanh toán 100%', N'Đang áp dụng'),
('SP06', 'KM05', N'Hàng trưng bày', N'Đang áp dụng'),
('SP19', 'KM05', N'Hàng trưng bày', N'Đang áp dụng');

-- 27. Bảng Phiếu Bảo Hành 
INSERT INTO PHIEUBAOHANH (MAPHIEUBAOHANH, MASP, NGAYBATDAUBH, NGAYKETTHUCBH, LOAIBAOHANH, THOIGIANBAOHANH, DONVIBAOHANH, TRANGTHAIBAOHANH, GHICHUBH) VALUES
('PBH001', 'SP01', '2023-10-02', '2024-10-02', N'Bảo hành chính hãng', 12, N'Trung tâm Apple VN', N'Còn hạn', NULL),
('PBH002', 'SP02', '2023-10-03', '2024-10-03', N'Bảo hành chính hãng', 12, N'Trung tâm Apple VN', N'Còn hạn', NULL),
('PBH003', 'SP04', '2023-10-05', '2025-10-05', N'Bảo hành tại nhà', 24, N'Samsung Vina', N'Còn hạn', N'Kích hoạt điện tử'),
('PBH004', 'SP05', '2023-10-06', '2025-10-06', N'Bảo hành tại nhà', 24, N'Sony Electronics', N'Còn hạn', NULL),
('PBH005', 'SP06', '2023-10-07', '2026-10-07', N'Bảo hành tại nhà', 36, N'Sony Electronics', N'Còn hạn', N'VIP Service'),
('PBH006', 'SP07', '2023-10-08', '2025-10-08', N'Bảo hành tại nhà', 24, N'LG Việt Nam', N'Còn hạn', NULL),
('PBH007', 'SP08', '2023-10-09', '2025-10-09', N'Bảo hành tại nhà', 24, N'LG Việt Nam', N'Còn hạn', N'Bảo hành động cơ 10 năm'),
('PBH008', 'SP11', '2023-10-12', '2024-10-12', N'Bảo hành tận nơi', 12, N'Dell ProSupport', N'Còn hạn', NULL),
('PBH009', 'SP12', '2023-10-13', '2024-10-13', N'Bảo hành tận nơi', 12, N'Dell ProSupport', N'Còn hạn', NULL),
('PBH010', 'SP13', '2023-10-14', '2025-10-14', N'Bảo hành chính hãng', 24, N'Asus Việt Nam', N'Còn hạn', NULL);

-- 28. Bảng Phân Quyền 
-- Phân quyền cho CỬA HÀNG TRƯỞNG (MANAGER) - Full quyền xem báo cáo và quản lý
INSERT INTO PHANQUYEN (MAVAITRO, MADOITUONG, MAQUYEN, NGAYCAPQUYEN, NGUOICAPQUYEN, GHICHUCQ) VALUES
('MANAGER', 'RPT_DOANH', 'Q_VIEW', GETDATE(), 'admin', N'Xem báo cáo doanh thu'),
('MANAGER', 'RPT_DOANH', 'Q_PRINT', GETDATE(), 'admin', N'In báo cáo'),
('MANAGER', 'RPT_DOANH', 'Q_EXPORT', GETDATE(), 'admin', N'Xuất Excel'),
('MANAGER', 'FRM_NV', 'Q_VIEW', GETDATE(), 'admin', N'Quản lý nhân viên'),
('MANAGER', 'FRM_NV', 'Q_EDIT', GETDATE(), 'admin', N'Sửa thông tin NV'),
('MANAGER', 'DASH_MAIN', 'Q_VIEW', GETDATE(), 'admin', N'Xem Dashboard tổng quan'),
('MANAGER', 'FRM_SP', 'Q_EDIT', GETDATE(), 'admin', N'Điều chỉnh giá bán');

-- Phân quyền cho THỦ KHO (WAREHOUSE) - Chỉ làm việc với Kho
INSERT INTO PHANQUYEN (MAVAITRO, MADOITUONG, MAQUYEN, NGAYCAPQUYEN, NGUOICAPQUYEN, GHICHUCQ) VALUES
('WAREHOUSE', 'FRM_NHAP', 'Q_VIEW', GETDATE(), 'manager', NULL),
('WAREHOUSE', 'FRM_NHAP', 'Q_ADD', GETDATE(), 'manager', N'Tạo phiếu nhập'),
('WAREHOUSE', 'FRM_NHAP', 'Q_APPROVE', GETDATE(), 'manager', N'Duyệt nhập kho'),
('WAREHOUSE', 'RPT_TON', 'Q_VIEW', GETDATE(), 'manager', N'Xem báo cáo tồn'),
('WAREHOUSE', 'RPT_TON', 'Q_PRINT', GETDATE(), 'manager', NULL),
('WAREHOUSE', 'FRM_SP', 'Q_VIEW', GETDATE(), 'manager', N'Tra cứu mã hàng');

-- Phân quyền cho NHÂN VIÊN BÁN HÀNG (STAFF) - Làm việc với Bán hàng và KH
INSERT INTO PHANQUYEN (MAVAITRO, MADOITUONG, MAQUYEN, NGAYCAPQUYEN, NGUOICAPQUYEN, GHICHUCQ) VALUES
('STAFF', 'FRM_BAN', 'Q_VIEW', GETDATE(), 'manager', NULL),
('STAFF', 'FRM_BAN', 'Q_ADD', GETDATE(), 'manager', N'Lập hóa đơn'),
('STAFF', 'FRM_KH', 'Q_VIEW', GETDATE(), 'manager', NULL),
('STAFF', 'FRM_KH', 'Q_ADD', GETDATE(), 'manager', N'Thêm khách hàng mới'),
('STAFF', 'FRM_SP', 'Q_VIEW', GETDATE(), 'manager', N'Tra cứu giá và khuyến mãi'),
('STAFF', 'FRM_BH', 'Q_VIEW', GETDATE(), 'manager', N'Tra cứu bảo hành');

-- Phân quyền cho THU NGÂN (CASHIER) - Thanh toán
INSERT INTO PHANQUYEN (MAVAITRO, MADOITUONG, MAQUYEN, NGAYCAPQUYEN, NGUOICAPQUYEN, GHICHUCQ) VALUES
('CASHIER', 'FRM_BAN', 'Q_VIEW', GETDATE(), 'manager', NULL),
('CASHIER', 'FRM_BAN', 'Q_PRINT', GETDATE(), 'manager', N'In hóa đơn thanh toán'),
('CASHIER', 'RPT_DOANH', 'Q_VIEW', GETDATE(), 'manager', N'Xem doanh thu ca'),
('CASHIER', 'FRM_KH', 'Q_VIEW', GETDATE(), 'manager', NULL);

-- Phân quyền cho ADMIN (Hệ thống)
INSERT INTO PHANQUYEN (MAVAITRO, MADOITUONG, MAQUYEN, NGAYCAPQUYEN, NGUOICAPQUYEN, GHICHUCQ) VALUES
('ADMIN', 'SYS_USER', 'Q_ADD', GETDATE(), 'system', N'Tạo tài khoản'),
('ADMIN', 'SYS_USER', 'Q_EDIT', GETDATE(), 'system', N'Reset mật khẩu'),
('ADMIN', 'SYS_USER', 'Q_DEL', GETDATE(), 'system', N'Khóa tài khoản'),
('ADMIN', 'SYS_USER', 'Q_BACKUP', GETDATE(), 'system', N'Sao lưu hệ thống');