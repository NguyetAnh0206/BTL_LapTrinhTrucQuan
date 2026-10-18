-- =========================================================
-- DATABASE: QuanLyMyPham
-- Hệ thống quản lý website bán mỹ phẩm
-- SQL Server
-- BẢN CHUẨN DÙNG ĐỂ TẠO LẠI DATABASE TỪ ĐẦU (15 BẢNG)
-- =========================================================

USE master;
GO

IF DB_ID(N'QuanLyMyPham') IS NOT NULL
BEGIN
    ALTER DATABASE QuanLyMyPham
    SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE;

    DROP DATABASE QuanLyMyPham;
END
GO

CREATE DATABASE QuanLyMyPham;
GO

USE QuanLyMyPham;
GO

-- =========================================================
-- 1. TaiKhoan
-- =========================================================
CREATE TABLE TaiKhoan
(
    MaTK INT IDENTITY(1,1) PRIMARY KEY,
    TenDangNhap NVARCHAR(50) NOT NULL UNIQUE,
    MatKhau NVARCHAR(255) NOT NULL,
    VaiTro NVARCHAR(20) NOT NULL,
    TrangThai NVARCHAR(20) NOT NULL
        CONSTRAINT DF_TaiKhoan_TrangThai DEFAULT N'HoatDong',

    CONSTRAINT CK_TaiKhoan_VaiTro CHECK
    (
        VaiTro IN (N'KhachHang', N'QuanTriVien')
    ),

    CONSTRAINT CK_TaiKhoan_TrangThai CHECK
    (
        TrangThai IN (N'HoatDong', N'Khoa')
    )
);
GO

-- =========================================================
-- 2. KhachHang
-- =========================================================
CREATE TABLE KhachHang
(
    MaKH INT IDENTITY(1,1) PRIMARY KEY,
    MaTK INT NOT NULL UNIQUE,
    HoTen NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) NOT NULL UNIQUE,
    SoDienThoai VARCHAR(15) NOT NULL,
    DiaChi NVARCHAR(255) NULL,

    CONSTRAINT FK_KhachHang_TaiKhoan
        FOREIGN KEY (MaTK) REFERENCES TaiKhoan(MaTK)
);
GO

-- =========================================================
-- 3. DanhMuc
-- =========================================================
CREATE TABLE DanhMuc
(
    MaDM INT IDENTITY(1,1) PRIMARY KEY,
    TenDanhMuc NVARCHAR(100) NOT NULL UNIQUE,
    MoTa NVARCHAR(500) NULL
);
GO

-- =========================================================
-- 4. ThuongHieu
-- =========================================================
CREATE TABLE ThuongHieu
(
    MaTH INT IDENTITY(1,1) PRIMARY KEY,
    TenThuongHieu NVARCHAR(100) NOT NULL UNIQUE,
    MoTa NVARCHAR(MAX) NULL,
    HinhAnh NVARCHAR(255) NULL
);
GO

-- =========================================================
-- 5. SanPham
-- =========================================================
CREATE TABLE SanPham
(
    MaSP INT IDENTITY(1,1) PRIMARY KEY,
    MaDM INT NOT NULL,
    MaTH INT NOT NULL,
    TenSanPham NVARCHAR(200) NOT NULL,
    MoTa NVARCHAR(MAX) NULL,
    DonGia DECIMAL(18,2) NOT NULL,
    SoLuong INT NOT NULL,
    HinhAnh NVARCHAR(255) NULL,
    TrangThai NVARCHAR(30) NOT NULL
        CONSTRAINT DF_SanPham_TrangThai DEFAULT N'DangBan',

    CONSTRAINT CK_SanPham_DonGia CHECK (DonGia >= 0),
    CONSTRAINT CK_SanPham_SoLuong CHECK (SoLuong >= 0),

    CONSTRAINT CK_SanPham_TrangThai CHECK
    (
        TrangThai IN
        (
            N'DangBan',
            N'NgungBan',
            N'HetHang'
        )
    ),

    CONSTRAINT FK_SanPham_DanhMuc
        FOREIGN KEY (MaDM) REFERENCES DanhMuc(MaDM),

    CONSTRAINT FK_SanPham_ThuongHieu
        FOREIGN KEY (MaTH) REFERENCES ThuongHieu(MaTH)
);
GO

-- =========================================================
-- 6. AnhSanPham
-- =========================================================
CREATE TABLE AnhSanPham
(
    MaAnh INT IDENTITY(1,1) PRIMARY KEY,
    MaSP INT NOT NULL,
    DuongDanAnh NVARCHAR(255) NOT NULL,
    LaAnhChinh BIT NOT NULL
        CONSTRAINT DF_AnhSanPham_LaAnhChinh DEFAULT 0,

    CONSTRAINT FK_AnhSanPham_SanPham
        FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
        ON DELETE CASCADE
);
GO

-- Mỗi sản phẩm tối đa 1 ảnh chính
CREATE UNIQUE INDEX UX_AnhSanPham_AnhChinh
    ON AnhSanPham(MaSP)
    WHERE LaAnhChinh = 1;
GO

-- =========================================================
-- 7. GioHang
-- =========================================================
CREATE TABLE GioHang
(
    MaGH INT IDENTITY(1,1) PRIMARY KEY,
    MaKH INT NOT NULL UNIQUE,
    NgayTao DATETIME2 NOT NULL
        CONSTRAINT DF_GioHang_NgayTao DEFAULT SYSDATETIME(),

    CONSTRAINT FK_GioHang_KhachHang
        FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
);
GO

-- =========================================================
-- 8. ChiTietGioHang
-- =========================================================
CREATE TABLE ChiTietGioHang
(
    MaGH INT NOT NULL,
    MaSP INT NOT NULL,
    SoLuong INT NOT NULL,

    CONSTRAINT PK_ChiTietGioHang
        PRIMARY KEY (MaGH, MaSP),

    CONSTRAINT CK_ChiTietGioHang_SoLuong
        CHECK (SoLuong > 0),

    CONSTRAINT FK_ChiTietGioHang_GioHang
        FOREIGN KEY (MaGH) REFERENCES GioHang(MaGH)
        ON DELETE CASCADE,

    CONSTRAINT FK_ChiTietGioHang_SanPham
        FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
        ON DELETE CASCADE
);
GO

-- =========================================================
-- 9. KhuyenMai
-- =========================================================
CREATE TABLE KhuyenMai
(
    MaKM INT IDENTITY(1,1) PRIMARY KEY,
    MaCode NVARCHAR(30) NOT NULL UNIQUE,
    TenKhuyenMai NVARCHAR(150) NOT NULL,
    PhanTramGiam INT NOT NULL,
    DonToiThieu DECIMAL(18,2) NOT NULL
        CONSTRAINT DF_KhuyenMai_DonToiThieu DEFAULT 0,
    NgayBatDau DATETIME2 NOT NULL,
    NgayKetThuc DATETIME2 NOT NULL,
    TrangThai NVARCHAR(20) NOT NULL
        CONSTRAINT DF_KhuyenMai_TrangThai DEFAULT N'HoatDong',

    CONSTRAINT CK_KhuyenMai_PhanTramGiam
        CHECK (PhanTramGiam BETWEEN 1 AND 100),

    CONSTRAINT CK_KhuyenMai_DonToiThieu
        CHECK (DonToiThieu >= 0),

    CONSTRAINT CK_KhuyenMai_Ngay
        CHECK (NgayKetThuc > NgayBatDau),

    CONSTRAINT CK_KhuyenMai_TrangThai CHECK
    (
        TrangThai IN (N'HoatDong', N'NgungHoatDong')
    )
);
GO

-- =========================================================
-- 10. DonHang
-- TongTien = tổng ChiTietDonHang.ThanhTien - TienGiam
-- =========================================================
CREATE TABLE DonHang
(
    MaDH INT IDENTITY(1,1) PRIMARY KEY,
    MaKH INT NOT NULL,
    NgayDat DATETIME2 NOT NULL
        CONSTRAINT DF_DonHang_NgayDat DEFAULT SYSDATETIME(),
    TongTien DECIMAL(18,2) NOT NULL,
    TienGiam DECIMAL(18,2) NOT NULL
        CONSTRAINT DF_DonHang_TienGiam DEFAULT 0,
    MaKM INT NULL,
    TrangThai NVARCHAR(30) NOT NULL
        CONSTRAINT DF_DonHang_TrangThai DEFAULT N'ChoXacNhan',
    TenNguoiNhan NVARCHAR(100) NOT NULL,
    DiaChiGiaoHang NVARCHAR(255) NOT NULL,
    SoDienThoaiNhan VARCHAR(15) NOT NULL,

    CONSTRAINT CK_DonHang_TongTien CHECK (TongTien >= 0),
    CONSTRAINT CK_DonHang_TienGiam CHECK (TienGiam >= 0),

    CONSTRAINT CK_DonHang_TrangThai CHECK
    (
        TrangThai IN
        (
            N'ChoXacNhan',
            N'DaXacNhan',
            N'DangGiao',
            N'DaGiao',
            N'DaHuy'
        )
    ),

    CONSTRAINT FK_DonHang_KhachHang
        FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),

    CONSTRAINT FK_DonHang_KhuyenMai
        FOREIGN KEY (MaKM) REFERENCES KhuyenMai(MaKM)
);
GO

-- =========================================================
-- 11. ChiTietDonHang
-- =========================================================
CREATE TABLE ChiTietDonHang
(
    MaDH INT NOT NULL,
    MaSP INT NOT NULL,
    SoLuong INT NOT NULL,
    DonGia DECIMAL(18,2) NOT NULL,
    ThanhTien DECIMAL(18,2) NOT NULL,

    CONSTRAINT PK_ChiTietDonHang
        PRIMARY KEY (MaDH, MaSP),

    CONSTRAINT CK_ChiTietDonHang_SoLuong
        CHECK (SoLuong > 0),

    CONSTRAINT CK_ChiTietDonHang_DonGia
        CHECK (DonGia >= 0),

    CONSTRAINT CK_ChiTietDonHang_ThanhTien
        CHECK (ThanhTien >= 0),

    CONSTRAINT FK_ChiTietDonHang_DonHang
        FOREIGN KEY (MaDH) REFERENCES DonHang(MaDH),

    CONSTRAINT FK_ChiTietDonHang_SanPham
        FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);
GO

-- =========================================================
-- 12. PhuongThucThanhToan
-- =========================================================
CREATE TABLE PhuongThucThanhToan
(
    MaPTTT INT IDENTITY(1,1) PRIMARY KEY,
    TenPhuongThuc NVARCHAR(100) NOT NULL UNIQUE,
    MoTa NVARCHAR(500) NULL,
    TrangThai NVARCHAR(20) NOT NULL
        CONSTRAINT DF_PhuongThucThanhToan_TrangThai DEFAULT N'HoatDong',

    CONSTRAINT CK_PhuongThucThanhToan_TrangThai CHECK
    (
        TrangThai IN (N'HoatDong', N'NgungHoatDong')
    )
);
GO

-- =========================================================
-- 13. ThanhToan
-- =========================================================
CREATE TABLE ThanhToan
(
    MaTT INT IDENTITY(1,1) PRIMARY KEY,
    MaDH INT NOT NULL UNIQUE,
    MaPTTT INT NOT NULL,
    SoTien DECIMAL(18,2) NOT NULL,
    NgayThanhToan DATETIME2 NULL,
    TrangThai NVARCHAR(30) NOT NULL
        CONSTRAINT DF_ThanhToan_TrangThai DEFAULT N'ChuaThanhToan',
    MaGiaoDich NVARCHAR(100) NULL,

    CONSTRAINT CK_ThanhToan_SoTien
        CHECK (SoTien >= 0),

    CONSTRAINT CK_ThanhToan_TrangThai CHECK
    (
        TrangThai IN
        (
            N'ChuaThanhToan',
            N'DaThanhToan',
            N'ThatBai',
            N'HoanTien'
        )
    ),

    CONSTRAINT FK_ThanhToan_DonHang
        FOREIGN KEY (MaDH) REFERENCES DonHang(MaDH),

    CONSTRAINT FK_ThanhToan_PhuongThuc
        FOREIGN KEY (MaPTTT) REFERENCES PhuongThucThanhToan(MaPTTT)
);
GO

-- =========================================================
-- 14. KhieuNai
-- =========================================================
CREATE TABLE KhieuNai
(
    MaKN INT IDENTITY(1,1) PRIMARY KEY,
    MaKH INT NOT NULL,
    MaDH INT NOT NULL,
    MaNguoiXuLy INT NULL,
    NoiDung NVARCHAR(MAX) NOT NULL,
    NgayGui DATETIME2 NOT NULL
        CONSTRAINT DF_KhieuNai_NgayGui DEFAULT SYSDATETIME(),
    TrangThai NVARCHAR(30) NOT NULL
        CONSTRAINT DF_KhieuNai_TrangThai DEFAULT N'ChoXuLy',
    PhanHoi NVARCHAR(MAX) NULL,
    NgayPhanHoi DATETIME2 NULL,

    CONSTRAINT CK_KhieuNai_TrangThai CHECK
    (
        TrangThai IN
        (
            N'ChoXuLy',
            N'DangXuLy',
            N'DaXuLy',
            N'TuChoi'
        )
    ),

    CONSTRAINT FK_KhieuNai_KhachHang
        FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),

    CONSTRAINT FK_KhieuNai_DonHang
        FOREIGN KEY (MaDH) REFERENCES DonHang(MaDH),

    CONSTRAINT FK_KhieuNai_NguoiXuLy
        FOREIGN KEY (MaNguoiXuLy) REFERENCES TaiKhoan(MaTK)
);
GO

-- =========================================================
-- 15. DanhGia
-- =========================================================
CREATE TABLE DanhGia
(
    MaDG INT IDENTITY(1,1) PRIMARY KEY,
    MaKH INT NOT NULL,
    MaSP INT NOT NULL,
    SoSao INT NOT NULL,
    NoiDung NVARCHAR(1000) NULL,
    NgayDanhGia DATETIME2 NOT NULL
        CONSTRAINT DF_DanhGia_NgayDanhGia DEFAULT SYSDATETIME(),

    CONSTRAINT CK_DanhGia_SoSao
        CHECK (SoSao BETWEEN 1 AND 5),

    CONSTRAINT UQ_DanhGia_KhachHang_SanPham
        UNIQUE (MaKH, MaSP),

    CONSTRAINT FK_DanhGia_KhachHang
        FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),

    CONSTRAINT FK_DanhGia_SanPham
        FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);
GO

-- =========================================================
-- INDEX CHO CÁC KHÓA NGOẠI / TRUY VẤN THƯỜNG DÙNG
-- =========================================================
CREATE INDEX IX_SanPham_MaDM ON SanPham(MaDM);
GO
CREATE INDEX IX_SanPham_MaTH ON SanPham(MaTH);
GO
CREATE INDEX IX_AnhSanPham_MaSP ON AnhSanPham(MaSP);
GO
CREATE INDEX IX_ChiTietGioHang_MaSP ON ChiTietGioHang(MaSP);
GO
CREATE INDEX IX_DonHang_MaKH ON DonHang(MaKH);
GO
CREATE INDEX IX_DonHang_MaKM ON DonHang(MaKM);
GO
CREATE INDEX IX_ChiTietDonHang_MaSP ON ChiTietDonHang(MaSP);
GO
CREATE INDEX IX_ThanhToan_MaPTTT ON ThanhToan(MaPTTT);
GO
CREATE INDEX IX_KhieuNai_MaKH ON KhieuNai(MaKH);
GO
CREATE INDEX IX_KhieuNai_MaDH ON KhieuNai(MaDH);
GO
CREATE INDEX IX_KhieuNai_MaNguoiXuLy ON KhieuNai(MaNguoiXuLy);
GO
CREATE INDEX IX_DanhGia_MaSP ON DanhGia(MaSP);
GO

-- =========================================================
-- KIỂM TRA ĐỦ 15 BẢNG
-- =========================================================
SELECT TABLE_NAME AS TenBang
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
  AND TABLE_CATALOG = DB_NAME()
ORDER BY TABLE_NAME;
GO

-- =========================================================
-- KIỂM TRA KHÓA NGOẠI
-- =========================================================
SELECT
    fk.name AS TenKhoaNgoai,
    OBJECT_NAME(fk.parent_object_id) AS BangCon,
    OBJECT_NAME(fk.referenced_object_id) AS BangCha
FROM sys.foreign_keys fk
ORDER BY BangCon, TenKhoaNgoai;
GO

-- =========================================================
-- KIỂM TRA INDEX
-- =========================================================
SELECT
    t.name AS TenBang,
    i.name AS TenIndex,
    i.type_desc AS LoaiIndex,
    i.is_unique AS LaUnique
FROM sys.indexes i
INNER JOIN sys.tables t
    ON t.object_id = i.object_id
WHERE i.name IS NOT NULL
  AND t.is_ms_shipped = 0
ORDER BY t.name, i.name;
GO

-- =========================================================
-- KIỂM TRA CẤU TRÚC CỘT
-- =========================================================
SELECT
    TABLE_NAME AS TenBang,
    COLUMN_NAME AS TenCot,
    DATA_TYPE AS KieuDuLieu,
    CHARACTER_MAXIMUM_LENGTH AS DoDai,
    IS_NULLABLE AS ChoPhepNull
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_CATALOG = DB_NAME()
ORDER BY TABLE_NAME, ORDINAL_POSITION;
GO