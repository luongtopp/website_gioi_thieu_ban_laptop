-- SHOW Procedure 
SELECT *
FROM sys.procedures
-- Xem nội dung của Procedure
-- sp_helptext
-- 'trg_huy_don_mua'


-- Tìm tài khoản quản trị tạo trong khoảng thời gian
GO
CREATE PROCEDURE proc_tim_kiem_tai_khoan_quan_tri_trong_khoang
    @ngay_bat_dau DATE,
    @ngay_ket_thuc DATE
AS
BEGIN
    SELECT *
    FROM tai_khoan tk
        JOIN phan_quyen pq ON tk.ma_tk = pq.ma_tk
    WHERE ngay_tao BETWEEN @ngay_bat_dau AND @ngay_ket_thuc
END

GO

-- Chạy proc_tim_kiem_tai_khoan_quan_tri_trong_khoang
EXECUTE proc_tim_kiem_tai_khoan_quan_tri_trong_khoang  '2019-12-12', '2022-12-12';

-- Tính tổng giá và hiện thị
GO
CREATE PROCEDURE tinh_tong_gia_va_hien_thi
    @ma_dm INT
AS
BEGIN
    SELECT dm.ma_dm, tk.ho_ten, dm.so_luong * lsg.gia_ban AS tong_gia
    FROM don_mua AS dm
        JOIN chi_tiet_san_pham AS ctsp ON dm.ma_ctsp = ctsp.ma_ctsp
        JOIN lich_su_gia_san_pham AS lsg ON ctsp.ma_ctsp = lsg.ma_ctsp
        JOIN tai_khoan AS tk ON dm.ma_tk = tk.ma_tk
    WHERE dm.ma_dm = @ma_dm
END

-- Chạy tinh_tong_gia_va_hien_thi
EXECUTE tinh_tong_gia_va_hien_thi 16

-- Tính tổng tiền trong giỏ hàng của mỗi khách hàng
GO
CREATE PROCEDURE proc_tinh_tong_tien_gio_hang
    @ma_tk INT
AS
BEGIN
    SELECT tk.ma_tk, tk.ho_ten, SUM(gh.so_luong * lsg.gia_ban) AS tong_tien_gio_hang
    FROM tai_khoan AS tk
        JOIN gio_hang AS gh ON tk.ma_tk = gh.ma_tk
        JOIN chi_tiet_san_pham AS ctsp ON gh.ma_ctsp = ctsp.ma_ctsp
        JOIN lich_su_gia_san_pham AS lsg ON ctsp.ma_ctsp = lsg.ma_ctsp
    WHERE tk.ma_tk = @ma_tk
    GROUP BY tk.ma_tk, tk.ho_ten
END

EXEC proc_tinh_tong_tien_gio_hang 5;

-- Lấy doanh thu theo khoảng thời gian
GO
CREATE PROCEDURE proc_lay_doanh_thu_theo_khoang_thoi_gian
    @ngay_bat_dau DATE,
    @ngay_ket_thuc DATE
AS
BEGIN
    SELECT ctsp.ma_ctsp AS 'Mã chi tiết sản phẩm', SUM(lsg.gia_ban * dm.so_luong) AS 'Tổng giá'
    FROM don_xuat dx
        JOIN don_mua dm ON dm.ma_dm = dx.ma_dm
        JOIN chi_tiet_san_pham ctsp ON ctsp.ma_ctsp = dm.ma_ctsp
        JOIN lich_su_gia_san_pham lsg ON lsg.ma_ctsp = ctsp.ma_ctsp
    WHERE dx.thoi_gian_xuat BETWEEN @ngay_bat_dau AND @ngay_ket_thuc
    GROUP BY(ctsp.ma_ctsp)
END
GO

-- Chạy proc_top_nam_san_pham_ban_chay
EXECUTE proc_lay_doanh_thu_theo_khoang_thoi_gian '2022-12-12', '2023-12-12'

-- Lấy top ? sản phẩm bán chạy trong khoảng ngày
GO
CREATE PROCEDURE proc_top_nam_san_pham_ban_chay
    @ngay_bat_dau DATE,
    @ngay_ket_thuc DATE,
    @top INT
AS
BEGIN

    SELECT TOP (@top)
        sp.ma_sp, sp.ten_sp, dm.so_luong
    FROM san_pham sp
        INNER JOIN chi_tiet_san_pham ctsp ON sp.ma_sp = ctsp.ma_sp
        INNER JOIN don_mua dm ON ctsp.ma_ctsp = dm.ma_ctsp
        INNER JOIN don_xuat dx ON dx.ma_dm = dm.ma_dm
    WHERE dx.thoi_gian_xuat BETWEEN @ngay_bat_dau AND @ngay_ket_thuc
    ORDER BY dm.so_luong DESC
END
-- Chạy proc_top_nam_san_pham_ban_chay
EXECUTE proc_top_nam_san_pham_ban_chay '2022-12-12', '2023-12-12', 2

GO
-- Procedure thêm đơn nhập
CREATE PROCEDURE proc_them_don_nhap
    @thoi_gian_nhap DATETIME,
    @ma_tk INT,
    @so_luong INT,
    @tong_gia FLOAT
AS
BEGIN
    INSERT INTO don_nhap
        (thoi_gian_nhap, ma_tk, so_luong, tong_gia)
    VALUES
        (@thoi_gian_nhap, @ma_tk, @so_luong, @tong_gia)
END
GO

-- Procedure sửa đơn nhập
CREATE PROCEDURE proc_sua_don_nhap
    @ma_dn INT,
    @thoi_gian_nhap DATETIME,
    @so_luong INT,
    @tong_gia FLOAT
AS
BEGIN
    UPDATE don_nhap 
    SET thoi_gian_nhap = @thoi_gian_nhap, so_luong = @so_luong, tong_gia = @tong_gia
    WHERE ma_dn = @ma_dn
END;
GO

-- Procedure xóa đơn nhập
CREATE PROCEDURE xoa_don_nhap
    @ma_dn INT
AS
BEGIN
    DELETE FROM don_nhap WHERE ma_dn = @ma_dn
END

-- Procedure thêm sản phẩm
GO
CREATE PROCEDURE proc_them_san_pham 
    @ten_sp NVARCHAR(100),
    @ma_dn int,
	@ma_ncc int,
	@ma_th int,
	@hinh_anh_1 nvarchar(200),
	@hinh_anh_2 nvarchar(200),
	@hinh_anh_3 nvarchar(200),
	@hinh_anh_4 nvarchar(200),
	@hinh_anh_5 nvarchar(200),
	@hinh_anh_6 nvarchar(200),
	@video nvarchar(200)
AS
BEGIN
    INSERT INTO san_pham(ten_sp,ma_dn ,ma_ncc,ma_th,hinh_anh_1,hinh_anh_2,hinh_anh_3,hinh_anh_4,hinh_anh_5,hinh_anh_6,video)
    VALUES (@ten_sp, @ma_dn,@ma_ncc,@ma_th,@hinh_anh_1,@hinh_anh_2,@hinh_anh_3,@hinh_anh_4,@hinh_anh_5,@hinh_anh_6,@video)
END

EXECUTE proc_them_san_pham 'LapTop', 1, 2, 3, 'hinhanh1','hinhanh2','hinhanh3','hinhanh4','hinhanh5','hinhanh6','video';

-- Procedure cập nhật sản phẩm
GO
CREATE PROCEDURE proc_cap_nhat_san_pham
    @ma_san_pham INT,
    @ten_sp NVARCHAR(100) = NULL,
	@hinh_anh_1 nvarchar(200) = NULL,
	@hinh_anh_2 nvarchar(200) = NULL,
	@hinh_anh_3 nvarchar(200) = NULL,
	@hinh_anh_4 nvarchar(200) = NULL,
	@hinh_anh_5 nvarchar(200) = NULL,
	@hinh_anh_6 nvarchar(200) = NULL,
	@video nvarchar(200) = NULL
AS
BEGIN
    UPDATE san_pham
    SET 
        ten_sp = COALESCE(@ten_sp, ten_sp),
        hinh_anh_1 = COALESCE(@hinh_anh_1, hinh_anh_1),
        hinh_anh_2 = COALESCE(@hinh_anh_2, hinh_anh_2),
        hinh_anh_3 = COALESCE(@hinh_anh_3, hinh_anh_3),
        hinh_anh_4 = COALESCE(@hinh_anh_4, hinh_anh_4),
        hinh_anh_5 = COALESCE(@hinh_anh_5, hinh_anh_5),
        hinh_anh_6 = COALESCE(@hinh_anh_6, hinh_anh_6),
		video = COALESCE(@video, video)
    WHERE ma_sp = @ma_san_pham
END

EXECUTE proc_cap_nhat_san_pham  16,'LapTop', 'hinhanh1','hinhanh2','hinhanh3','hinhanh4','hinhanh5','hinhanh6','video';


-- Procedure cập nhật sản phẩm
GO
CREATE PROCEDURE proc_xoa_san_pham 
    @ma_san_pham INT
AS
BEGIN
    DELETE FROM san_pham WHERE ma_sp = @ma_san_pham
END

EXECUTE proc_xoa_san_pham 16;



--1 hiển thị khách hàng thanh toán khi nhận hàng
GO
CREATE VIEW KhachHangNhanHang AS
SELECT tai_khoan.ma_tk, tai_khoan.ho_ten,phuong_thuc_thanh_toan.ten_pttt
FROM tai_khoan join don_xuat on tai_khoan.ma_tk=don_xuat.ma_tk join don_mua
on don_xuat.ma_tk=don_mua.ma_tk join phuong_thuc_thanh_toan on don_mua.ma_pttt = phuong_thuc_thanh_toan.ma_pttt
WHERE ten_pttt = N'Thanh toán khi nhận hàng'

--5 hiển thị 10 đơn mua theo thứ tự giảm dần
GO
CREATE VIEW don_mua_gan_nhat AS
SELECT TOP 10 *
FROM don_mua
ORDER BY thoi_gian_mua DESC;

--4 hiển thị sản phẩm còn hàng
GO
CREATE VIEW san_pham_con_hang AS
SELECT san_pham.ten_sp,chi_tiet_san_pham.so_luong
FROM san_pham inner join chi_tiet_san_pham on san_pham.ma_sp = chi_tiet_san_pham.ma_sp
WHERE so_luong > 0;

--7 hiển thị doanh thu theo tháng và năm
GO
CREATE VIEW doanh_thu_theo_thang AS
SELECT MONTH(thoi_gian_mua) as Tháng, YEAR(thoi_gian_mua) as Năm, SUM(gia_ban) as doanh_thu
FROM don_mua inner join chi_tiet_san_pham on don_mua.ma_ctsp= chi_tiet_san_pham.ma_ctsp inner join lich_su_gia_san_pham on chi_tiet_san_pham.ma_ctsp = lich_su_gia_san_pham.ma_ctsp
GROUP BY YEAR(thoi_gian_mua), MONTH(thoi_gian_mua);


--select
--Tìm Kiếm sản phẩm có giá tiền thấp nhất8
GO
SELECT san_pham.ten_sp, san_pham.hinh_anh_1,  gia_ban
FROM san_pham inner join chi_tiet_san_pham on san_pham.ma_sp = chi_tiet_san_pham.ma_sp inner join lich_su_gia_san_pham on chi_tiet_san_pham.ma_ctsp = lich_su_gia_san_pham.ma_ctsp
WHERE gia_ban = (SELECT MIN(gia_ban) FROM lich_su_gia_san_pham);

-- Tìm kiếm sản phẩm có Thương Hiệu là HP6
SELECT san_pham.ten_sp, thuong_hieu.ten_th, nha_cung_cap.ten_ncc, san_pham.gia_tien
FROM san_pham inner join thuong_hieu on san_pham.ma_th= thuong_hieu.ma_th inner join nha_cung_cap on nha_cung_cap.ma_ncc = san_pham.ma_ncc
WHERE ten_th = 'HP';

-- Tìm Kiếm sản phẩm đã bán đc từ lúc ra mắt7
SELECT ma_sp,ten_sp, COUNT(*) as SoLapTopDaBan 
FROM san_pham 
WHERE MONTH(ngay_ra_mat) = MONTH(getdate())
GROUP BY ma_sp, ten_sp 
ORDER BY SoLapTopDaBan DESC;
