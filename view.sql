USE website_ban_laptop;
GO
SELECT *
FROM sys.views
GO
-- View hiển thị phân quyền tài khoản
CREATE VIEW loai_tai_khoan
AS
    SELECT tk.ma_tk AS 'Mã tài khoản', tk.ho_ten AS 'Họ tên', tk.email AS 'Email', pk.loai_tk AS 'Loại tài khoản'
    FROM tai_khoan tk
        JOIN phan_quyen pk ON pk.ma_tk = tk.ma_tk
GO

-- View hiển thị sản phẩm mô tả trên trang chủ

CREATE VIEW san_pham_mo_ta_tren_trang_chu
AS
    SELECT sp.ten_sp AS 'Tên sản phẩm', ctsp.mau_sac AS 'Màu sắc', lsg.gia_ban AS 'Giá bán', sp.hinh_anh_1 AS 'Hình ảnh'
    FROM san_pham sp
        JOIN chi_tiet_san_pham ctsp ON ctsp.ma_sp = sp.ma_sp
        JOIN lich_su_gia_san_pham lsg ON ctsp.ma_ctsp = lsg.ma_ctsp
    
GO

-- View hiển thị sản phẩm bán chạy nhất
GO
CREATE VIEW san_pham_ban_chay_nhat
AS
    SELECT sp.ten_sp AS 'Tên sản phẩm', dm.so_luong AS 'Số lượng'
    FROM san_pham sp
        JOIN chi_tiet_san_pham ctsp ON ctsp.ma_sp = sp.ma_sp
        JOIN don_mua dm ON dm.ma_ctsp = ctsp.ma_ctsp
        JOIN don_xuat dx ON dx.ma_dm = dm.ma_dm
    ORDER BY dm.so_luong DESC

-- View hiển thị sản phẩm còn hàng
GO
CREATE VIEW san_pham_con_hang
AS
    SELECT san_pham.ten_sp, chi_tiet_san_pham.so_luong
    FROM san_pham INNER JOIN chi_tiet_san_pham on san_pham.ma_sp = chi_tiet_san_pham.ma_sp
    WHERE so_luong > 0;

-- View hiển thị doanh thu theo tháng và năm
GO
CREATE VIEW doanh_thu_theo_thang
AS
    SELECT MONTH(thoi_gian_xuat) AS Tháng, YEAR(thoi_gian_xuat) AS Năm, SUM(gia_ban) AS doanh_thu
    FROM don_xuat dx
        INNER JOIN don_mua dm ON  dx.ma_dm = dm.ma_dm
        INNER JOIN chi_tiet_san_pham ctsp ON dm.ma_ctsp= ctsp.ma_ctsp
        INNER JOIN lich_su_gia_san_pham lsg on ctsp.ma_ctsp = lsg.ma_ctsp
    GROUP BY YEAR(thoi_gian_xuat), MONTH(thoi_gian_xuat);
-- View hiển thị sản phẩm có trong giỏ hàng của tài khoản
GO
CREATE VIEW gio_hang_tai_khoan
AS
    SELECT gh.ma_ctsp AS 'Mã chi tiết sản phẩm', tk.ho_ten AS 'Họ tên', sp.ten_sp AS 'Tên sản phẩm', lsg.gia_ban AS 'Giá'
    FROM gio_hang gh
        JOIN tai_khoan tk ON tk.ma_tk = gh.ma_tk
        JOIN chi_tiet_san_pham ctsp ON ctsp.ma_ctsp = gh.ma_ctsp
        JOIN san_pham sp ON sp.ma_sp = ctsp.ma_sp
        JOIN lich_su_gia_san_pham lsg ON lsg.ma_ctsp = gh.ma_ctsp;
-- View in ra câu hỏi mà khách hàng hỏi sản phẩm
GO
CREATE VIEW cau_hoi_san_pham
AS
    SELECT hd.ma_hd, tk.ho_ten AS 'Họ tên', sp.ten_sp AS 'Tên sản phẩm', cthd.noi_dung AS 'Nội dung', cthd.thoi_gian AS 'Thời gian'
    FROM chi_tiet_hoi_dap cthd
        JOIN hoi_dap hd ON cthd.ma_hd = hd.ma_hd
        JOIN chi_tiet_san_pham ctsp ON hd.ma_ctsp = ctsp.ma_ctsp
        JOIN san_pham sp ON sp.ma_sp = ctsp.ma_sp
        JOIN tai_khoan tk ON tk.ma_tk = cthd.ma_tk

