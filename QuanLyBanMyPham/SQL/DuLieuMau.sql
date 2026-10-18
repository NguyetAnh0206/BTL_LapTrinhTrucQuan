CREATE DATABASE QuanLyMyPham;
GO

USE QuanLyMyPham;
GO

-- =========================================================
-- DỮ LIỆU MẪU WEBSITE BÁN MỸ PHẨM
-- Chạy SAU khi đã chạy QLBanMyPham_QuanLyMyPham.sql
-- =========================================================


-- =========================================================
-- 1. TAI KHOAN
-- =========================================================
-- Mật khẩu thực tế của các tài khoản mẫu: 123456
-- Nhưng DB lưu BCrypt hash, không lưu plaintext.
-- =========================================================

INSERT INTO TaiKhoan
(
    TenDangNhap,
    MatKhau,
    VaiTro,
    TrangThai
)
VALUES
(
    N'admin',
    N'$2b$11$oarwlHgbuRTiHtXzwi.CLeAFytvXInVmN4jJt.DuhJuD6AxucjXUu',
    N'QuanTriVien',
    N'HoatDong'
),
(
    N'quankh1',
    N'$2b$11$oarwlHgbuRTiHtXzwi.CLeAFytvXInVmN4jJt.DuhJuD6AxucjXUu',
    N'KhachHang',
    N'HoatDong'
),
(
    N'quankh2',
    N'$2b$11$oarwlHgbuRTiHtXzwi.CLeAFytvXInVmN4jJt.DuhJuD6AxucjXUu',
    N'KhachHang',
    N'HoatDong'
),
(
    N'quankh3',
    N'$2b$11$oarwlHgbuRTiHtXzwi.CLeAFytvXInVmN4jJt.DuhJuD6AxucjXUu',
    N'KhachHang',
    N'HoatDong'
),
(
    N'quankh4',
    N'$2b$11$oarwlHgbuRTiHtXzwi.CLeAFytvXInVmN4jJt.DuhJuD6AxucjXUu',
    N'KhachHang',
    N'HoatDong'
);
GO


-- =========================================================
-- 2. KHACH HANG
-- =========================================================

INSERT INTO KhachHang
(
    MaTK,
    HoTen,
    Email,
    SoDienThoai,
    DiaChi
)
VALUES
(
    2,
    N'Nguyễn Thị Mai',
    N'mai@gmail.com',
    '0901234567',
    N'Cầu Giấy, Hà Nội'
),
(
    3,
    N'Phạm Thu Trang',
    N'trang@gmail.com',
    '0912345678',
    N'Thanh Xuân, Hà Nội'
),
(
    4,
    N'Lê Minh Anh',
    N'minhanh@gmail.com',
    '0987654321',
    N'Đống Đa, Hà Nội'
),
(
    5,
    N'Hoàng Ngọc Lan',
    N'lan@gmail.com',
    '0978123456',
    N'Hà Đông, Hà Nội'
);
GO


-- =========================================================
-- 3. DANH MUC
-- =========================================================

INSERT INTO DanhMuc
(
    TenDanhMuc,
    MoTa
)
VALUES
(
    N'Chăm sóc da',
    N'Sản phẩm chăm sóc và dưỡng da'
),
(
    N'Trang điểm',
    N'Sản phẩm trang điểm cho khuôn mặt'
),
(
    N'Chăm sóc tóc',
    N'Sản phẩm chăm sóc và phục hồi tóc'
),
(
    N'Chống nắng',
    N'Sản phẩm chống nắng và bảo vệ da'
),
(
    N'Chăm sóc môi',
    N'Son môi và các sản phẩm dưỡng môi'
);
GO


-- =========================================================
-- 4. THUONG HIEU
-- =========================================================

INSERT INTO ThuongHieu
(
    TenThuongHieu,
    MoTa,
    HinhAnh
)
VALUES
(
    N'CeraVe',
    N'Thương hiệu chăm sóc da nổi tiếng',
    N'/images/brands/cerave.jpg'
),
(
    N'La Roche-Posay',
    N'Thương hiệu dược mỹ phẩm đến từ Pháp',
    N'/images/brands/larocheposay.jpg'
),
(
    N'Innisfree',
    N'Thương hiệu mỹ phẩm đến từ Hàn Quốc',
    N'/images/brands/innisfree.jpg'
),
(
    N'Maybelline',
    N'Thương hiệu mỹ phẩm trang điểm',
    N'/images/brands/maybelline.jpg'
),
(
    N'Anessa',
    N'Thương hiệu chuyên về sản phẩm chống nắng',
    N'/images/brands/anessa.jpg'
);
GO


-- =========================================================
-- 5. SAN PHAM
-- =========================================================

INSERT INTO SanPham
(
    MaDM,
    MaTH,
    TenSanPham,
    MoTa,
    DonGia,
    SoLuong,
    HinhAnh,
    TrangThai
)
VALUES
(
    1,
    1,
    N'Sữa rửa mặt CeraVe Foaming Cleanser',
    N'Sữa rửa mặt dành cho da thường đến da dầu',
    320000,
    50,
    N'/uploads/products/cerave-foaming.jpg',
    N'DangBan'
),
(
    1,
    1,
    N'Kem dưỡng ẩm CeraVe Moisturizing Cream',
    N'Kem dưỡng ẩm giúp phục hồi hàng rào bảo vệ da',
    450000,
    40,
    N'/uploads/products/cerave-moisturizing.jpg',
    N'DangBan'
),
(
    1,
    2,
    N'Effaclar Duo+',
    N'Kem dưỡng hỗ trợ chăm sóc làn da dầu mụn',
    390000,
    35,
    N'/uploads/products/effaclar-duo.jpg',
    N'DangBan'
),
(
    4,
    2,
    N'Anthelios UVMune 400 SPF50+',
    N'Kem chống nắng bảo vệ da trước tia UV',
    520000,
    30,
    N'/uploads/products/anthelios.jpg',
    N'DangBan'
),
(
    1,
    3,
    N'Innisfree Green Tea Seed Serum',
    N'Tinh chất dưỡng ẩm chiết xuất trà xanh',
    620000,
    25,
    N'/uploads/products/green-tea-serum.jpg',
    N'DangBan'
),
(
    1,
    3,
    N'Innisfree Bija Trouble Facial Foam',
    N'Sữa rửa mặt dành cho da dầu và da có khuyết điểm',
    280000,
    45,
    N'/uploads/products/bija-foam.jpg',
    N'DangBan'
),
(
    2,
    4,
    N'Maybelline Fit Me Foundation',
    N'Kem nền có độ che phủ tự nhiên',
    250000,
    60,
    N'/uploads/products/fit-me.jpg',
    N'DangBan'
),
(
    2,
    4,
    N'Maybelline SuperStay Matte Ink',
    N'Son kem lì lâu trôi',
    220000,
    55,
    N'/uploads/products/superstay.jpg',
    N'DangBan'
),
(
    4,
    5,
    N'Anessa Perfect UV Sunscreen',
    N'Kem chống nắng bảo vệ da SPF50+',
    680000,
    20,
    N'/uploads/products/anessa-perfect.jpg',
    N'DangBan'
),
(
    5,
    3,
    N'Innisfree Canola Honey Lip Balm',
    N'Son dưỡng môi giúp môi mềm mịn',
    190000,
    35,
    N'/uploads/products/lip-balm.jpg',
    N'DangBan'
),
(
    3,
    3,
    N'Innisfree Camellia Shampoo',
    N'Dầu gội chăm sóc tóc hằng ngày',
    350000,
    25,
    N'/uploads/products/camellia-shampoo.jpg',
    N'DangBan'
),
(
    1,
    2,
    N'Toleriane Sensitive Cream',
    N'Kem dưỡng dịu nhẹ dành cho da nhạy cảm',
    430000,
    0,
    N'/uploads/products/toleriane.jpg',
    N'HetHang'
);
GO


-- =========================================================
-- 6. ANH SAN PHAM
-- =========================================================

INSERT INTO AnhSanPham
(
    MaSP,
    DuongDanAnh,
    LaAnhChinh
)
VALUES

-- Sản phẩm 1
(1, N'/uploads/products/cerave-foaming-1.jpg', 1),
(1, N'/uploads/products/cerave-foaming-2.jpg', 0),
(1, N'/uploads/products/cerave-foaming-3.jpg', 0),

-- Sản phẩm 2
(2, N'/uploads/products/cerave-moisturizing-1.jpg', 1),
(2, N'/uploads/products/cerave-moisturizing-2.jpg', 0),

-- Sản phẩm 3
(3, N'/uploads/products/effaclar-duo-1.jpg', 1),
(3, N'/uploads/products/effaclar-duo-2.jpg', 0),

-- Sản phẩm 4
(4, N'/uploads/products/anthelios-1.jpg', 1),
(4, N'/uploads/products/anthelios-2.jpg', 0),

-- Sản phẩm 5
(5, N'/uploads/products/green-tea-serum-1.jpg', 1),
(5, N'/uploads/products/green-tea-serum-2.jpg', 0),

-- Sản phẩm 7
(7, N'/uploads/products/fit-me-1.jpg', 1),
(7, N'/uploads/products/fit-me-2.jpg', 0),

-- Sản phẩm 8
(8, N'/uploads/products/superstay-1.jpg', 1),
(8, N'/uploads/products/superstay-2.jpg', 0),

-- Sản phẩm 9
(9, N'/uploads/products/anessa-perfect-1.jpg', 1),
(9, N'/uploads/products/anessa-perfect-2.jpg', 0);
GO


-- =========================================================
-- 7. GIO HANG
-- =========================================================

INSERT INTO GioHang
(
    MaKH
)
VALUES
(1),
(2),
(3),
(4);
GO


-- =========================================================
-- 8. CHI TIET GIO HANG
-- =========================================================

INSERT INTO ChiTietGioHang
(
    MaGH,
    MaSP,
    SoLuong
)
VALUES
(1, 1, 2),
(1, 5, 1),
(1, 8, 2),

(2, 3, 1),
(2, 4, 1),

(3, 2, 1),
(3, 9, 1),

(4, 6, 2),
(4, 10, 1);
GO


-- =========================================================
-- 9. KHUYEN MAI
-- Có đủ trường hợp để test:
--   GIAM10 : còn hạn, không cần đơn tối thiểu
--   GIAM20 : còn hạn, đơn từ 500.000đ
--   SALE15 : đã hết hạn
--   VIP30  : đã tắt
-- =========================================================

INSERT INTO KhuyenMai
(
    MaCode,
    TenKhuyenMai,
    PhanTramGiam,
    DonToiThieu,
    NgayBatDau,
    NgayKetThuc,
    TrangThai
)
VALUES
(
    N'GIAM10',
    N'Giảm 10% mọi đơn hàng',
    10,
    0,
    '2026-09-01 00:00:00',
    '2026-12-31 23:59:59',
    N'HoatDong'
),
(
    N'GIAM20',
    N'Giảm 20% cho đơn từ 500.000đ',
    20,
    500000,
    '2026-10-01 00:00:00',
    '2026-10-31 23:59:59',
    N'HoatDong'
),
(
    N'SALE15',
    N'Giảm 15% mùa hè (đã hết hạn)',
    15,
    0,
    '2026-08-01 00:00:00',
    '2026-08-31 23:59:59',
    N'HoatDong'
),
(
    N'VIP30',
    N'Giảm 30% khách VIP (tạm tắt)',
    30,
    800000,
    '2026-09-01 00:00:00',
    '2026-12-31 23:59:59',
    N'NgungHoatDong'
);
GO


-- =========================================================
-- 10. DON HANG
-- TongTien = tổng chi tiết đơn - TienGiam
--   Đơn 1: dùng GIAM10 -> 1.080.000 - 108.000 = 972.000
--   Đơn 4: dùng GIAM20 ->   680.000 - 136.000 = 544.000
--   Các đơn còn lại không dùng khuyến mãi.
-- =========================================================

INSERT INTO DonHang
(
    MaKH,
    NgayDat,
    TongTien,
    TienGiam,
    MaKM,
    TrangThai,
    TenNguoiNhan,
    DiaChiGiaoHang,
    SoDienThoaiNhan
)
VALUES
(
    1,
    '2026-09-20 09:30:00',
    972000,
    108000,
    1,
    N'DaGiao',
    N'Nguyễn Thị Mai',
    N'Cầu Giấy, Hà Nội',
    '0901234567'
),
(
    2,
    '2026-09-25 14:20:00',
    910000,
    0,
    NULL,
    N'DangGiao',
    N'Phạm Thu Trang',
    N'Thanh Xuân, Hà Nội',
    '0912345678'
),
(
    3,
    '2026-09-28 10:15:00',
    920000,
    0,
    NULL,
    N'DaGiao',
    N'Lê Minh Anh',
    N'Đống Đa, Hà Nội',
    '0987654321'
),
(
    4,
    '2026-10-01 16:40:00',
    544000,
    136000,
    2,
    N'ChoXacNhan',
    N'Hoàng Ngọc Lan',
    N'Hà Đông, Hà Nội',
    '0978123456'
),
(
    1,
    '2026-10-03 08:50:00',
    520000,
    0,
    NULL,
    N'DaHuy',
    N'Nguyễn Thị Mai',
    N'Cầu Giấy, Hà Nội',
    '0901234567'
);
GO


-- =========================================================
-- 11. CHI TIET DON HANG
-- =========================================================

INSERT INTO ChiTietDonHang
(
    MaDH,
    MaSP,
    SoLuong,
    DonGia,
    ThanhTien
)
VALUES

-- Đơn hàng 1
(1, 1, 2, 320000, 640000),
(1, 8, 2, 220000, 440000),

-- Đơn hàng 2
(2, 3, 1, 390000, 390000),
(2, 4, 1, 520000, 520000),

-- Đơn hàng 3
(3, 2, 1, 450000, 450000),
(3, 6, 1, 280000, 280000),
(3, 10, 1, 190000, 190000),

-- Đơn hàng 4
(4, 9, 1, 680000, 680000),

-- Đơn hàng 5
(5, 4, 1, 520000, 520000);
GO


-- =========================================================
-- 12. PHUONG THUC THANH TOAN
-- =========================================================

INSERT INTO PhuongThucThanhToan
(
    TenPhuongThuc,
    MoTa,
    TrangThai
)
VALUES
(
    N'Thanh toán khi nhận hàng',
    N'Khách hàng thanh toán tiền mặt khi nhận hàng',
    N'HoatDong'
),
(
    N'Chuyển khoản ngân hàng',
    N'Thanh toán thông qua chuyển khoản ngân hàng',
    N'HoatDong'
),
(
    N'Ví điện tử',
    N'Thanh toán thông qua ví điện tử',
    N'HoatDong'
);
GO


-- =========================================================
-- 13. THANH TOAN
-- SoTien = DonHang.TongTien (đã trừ khuyến mãi)
-- =========================================================

INSERT INTO ThanhToan
(
    MaDH,
    MaPTTT,
    SoTien,
    NgayThanhToan,
    TrangThai,
    MaGiaoDich
)
VALUES
(
    1,
    1,
    972000,
    '2026-09-22 15:00:00',
    N'DaThanhToan',
    NULL
),
(
    2,
    2,
    910000,
    '2026-09-25 14:25:00',
    N'DaThanhToan',
    N'TXN20260925001'
),
(
    3,
    3,
    920000,
    '2026-09-28 10:20:00',
    N'DaThanhToan',
    N'TXN20260928001'
),
(
    4,
    1,
    544000,
    NULL,
    N'ChuaThanhToan',
    NULL
),
(
    5,
    1,
    520000,
    NULL,
    N'ChuaThanhToan',
    NULL
);
GO


-- =========================================================
-- 14. KHIEU NAI
-- =========================================================

INSERT INTO KhieuNai
(
    MaKH,
    MaDH,
    MaNguoiXuLy,
    NoiDung,
    NgayGui,
    TrangThai,
    PhanHoi,
    NgayPhanHoi
)
VALUES
(
    1,
    1,
    NULL,
    N'Sản phẩm giao đến bị móp hộp.',
    '2026-09-23 10:00:00',
    N'ChoXuLy',
    NULL,
    NULL
),
(
    2,
    2,
    1,
    N'Đơn hàng giao chậm hơn dự kiến.',
    '2026-09-27 09:30:00',
    N'DangXuLy',
    N'Admin đang kiểm tra tình trạng vận chuyển.',
    '2026-09-27 11:00:00'
),
(
    3,
    3,
    1,
    N'Sản phẩm nhận được không giống hình ảnh.',
    '2026-09-30 14:00:00',
    N'DaXuLy',
    N'Đã kiểm tra và hỗ trợ khách hàng đổi sản phẩm.',
    '2026-10-01 09:00:00'
);
GO


-- =========================================================
-- 15. DANH GIA
-- =========================================================
-- Chỉ đánh giá các sản phẩm thuộc đơn đã giao.
-- Đơn 2 còn DangGiao -> chưa đánh giá.
-- Đơn 4 còn ChoXacNhan -> chưa đánh giá.
-- =========================================================

INSERT INTO DanhGia
(
    MaKH,
    MaSP,
    SoSao,
    NoiDung,
    NgayDanhGia
)
VALUES
(
    1,
    1,
    5,
    N'Sản phẩm tốt, dùng rất ổn.',
    '2026-09-23 18:00:00'
),
(
    3,
    2,
    5,
    N'Kem dưỡng ẩm tốt, da mềm hơn.',
    '2026-09-30 19:30:00'
),
(
    1,
    8,
    4,
    N'Màu son đẹp và khá lâu trôi.',
    '2026-10-04 21:00:00'
);
GO


-- =========================================================
-- 16. KIỂM TRA SỐ LƯỢNG DỮ LIỆU (15 bảng)
-- =========================================================

SELECT
    N'TaiKhoan' AS TenBang,
    COUNT(*) AS SoLuong
FROM TaiKhoan

UNION ALL

SELECT N'KhachHang', COUNT(*) FROM KhachHang

UNION ALL

SELECT N'DanhMuc', COUNT(*) FROM DanhMuc

UNION ALL

SELECT N'ThuongHieu', COUNT(*) FROM ThuongHieu

UNION ALL

SELECT N'SanPham', COUNT(*) FROM SanPham

UNION ALL

SELECT N'AnhSanPham', COUNT(*) FROM AnhSanPham

UNION ALL

SELECT N'GioHang', COUNT(*) FROM GioHang

UNION ALL

SELECT N'ChiTietGioHang', COUNT(*) FROM ChiTietGioHang

UNION ALL

SELECT N'KhuyenMai', COUNT(*) FROM KhuyenMai

UNION ALL

SELECT N'DonHang', COUNT(*) FROM DonHang

UNION ALL

SELECT N'ChiTietDonHang', COUNT(*) FROM ChiTietDonHang

UNION ALL

SELECT N'PhuongThucThanhToan', COUNT(*) FROM PhuongThucThanhToan

UNION ALL

SELECT N'ThanhToan', COUNT(*) FROM ThanhToan

UNION ALL

SELECT N'KhieuNai', COUNT(*) FROM KhieuNai

UNION ALL

SELECT N'DanhGia', COUNT(*) FROM DanhGia;
GO


-- =========================================================
-- 17. KIỂM TRA TÀI KHOẢN
-- =========================================================

SELECT
    MaTK,
    TenDangNhap,
    VaiTro,
    TrangThai,
    MatKhau
FROM TaiKhoan
ORDER BY MaTK;
GO


-- =========================================================
-- 18. KIỂM TRA KHUYẾN MÃI
-- =========================================================

SELECT
    MaKM,
    MaCode,
    TenKhuyenMai,
    PhanTramGiam,
    DonToiThieu,
    NgayBatDau,
    NgayKetThuc,
    TrangThai
FROM KhuyenMai
ORDER BY MaKM;
GO


-- =========================================================
-- 19. KIỂM TRA ĐƠN HÀNG
-- =========================================================

SELECT
    MaDH,
    MaKH,
    TongTien,
    TienGiam,
    MaKM,
    TrangThai,
    TenNguoiNhan,
    DiaChiGiaoHang,
    SoDienThoaiNhan
FROM DonHang
ORDER BY MaDH;
GO


-- =========================================================
-- 20. KIỂM TRA TỔNG TIỀN ĐƠN HÀNG
-- TongTien phải = tổng chi tiết - TienGiam. Cột KetQua đều phải là 'Khop'.
-- =========================================================

SELECT
    d.MaDH,
    SUM(c.ThanhTien) AS TamTinh,
    d.TienGiam,
    d.TongTien,
    CASE
        WHEN d.TongTien = SUM(c.ThanhTien) - d.TienGiam THEN N'Khop'
        ELSE N'Lech'
    END AS KetQua
FROM DonHang d
INNER JOIN ChiTietDonHang c
    ON c.MaDH = d.MaDH
GROUP BY d.MaDH, d.TienGiam, d.TongTien
ORDER BY d.MaDH;
GO


-- =========================================================
-- 21. KIỂM TRA THANH TOÁN
-- =========================================================

SELECT
    MaTT,
    MaDH,
    MaPTTT,
    SoTien,
    NgayThanhToan,
    TrangThai,
    MaGiaoDich
FROM ThanhToan
ORDER BY MaDH;
GO


-- =========================================================
-- 22. KIỂM TRA ẢNH CHÍNH
-- Mỗi sản phẩm xuất hiện tối đa 1 lần.
-- =========================================================

SELECT
    MaSP,
    COUNT(*) AS SoAnhChinh
FROM AnhSanPham
WHERE LaAnhChinh = 1
GROUP BY MaSP
ORDER BY MaSP;
GO



USE QuanLyMyPham;
GO

-- 1. Kiểm tra số lượng bảng
SELECT COUNT(*) AS SoLuongBang
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';
GO

-- 2. Kiểm tra các mã khuyến mãi
SELECT
    MaKM,
    MaCode,
    PhanTramGiam,
    DonToiThieu,
    NgayBatDau,
    NgayKetThuc,
    TrangThai
FROM KhuyenMai
ORDER BY MaKM;
GO

-- 3. Kiểm tra đơn hàng và khuyến mãi
SELECT
    MaDH,
    MaKM,
    TongTien,
    TienGiam,
    TrangThai
FROM DonHang
ORDER BY MaDH;
GO

-- 4. Kiểm tra mật khẩu đã lưu dưới dạng hash
SELECT
    TenDangNhap,
    VaiTro,
    CASE
        WHEN MatKhau LIKE N'$2%$%'
            THEN N'Có dạng BCrypt hash'
        ELSE N'Cần kiểm tra mật khẩu'
    END AS KiemTraMatKhau
FROM TaiKhoan;
GO