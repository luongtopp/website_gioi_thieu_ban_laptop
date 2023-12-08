USE website_ban_laptop;
GO
-- đổi tên cột: sp_rename 'chi_tiet_san_pham.kich_thuoc','kich_thuoc_trONg_luONg','COLUMN';

-- Tìm kiếm gần đúng tên sản phẩm có trong giỏ hàng
SELECT *
FROM san_pham
WHERE ten_sp = (SELECT TOP 1 sp.ten_sp
FROM gio_hang gh 
    JOIN chi_tiet_san_pham ctsp ON ctsp.ma_ctsp = gh.ma_ctsp
    JOIN san_pham sp ON sp.ma_sp = ctsp.ma_sp 
WHERE ten_sp ='Laptop HP 15s fq5078TU i5 1235U/8GB/512GB/Win11 (6K798PA)') 



-- Thống kê lãi và lỗ dựa trên doanh thu theo tháng
SELECT dn.tong_gia AS 'Tiền hàng nhập' , SUM(lsg.gia_ban * dm.so_luong) AS 'Tiền Bán', ( SUM(lsg.gia_ban * dm.so_luong) - dn.tong_gia) AS 'Lãi'
FROM don_nhap dn
    JOIN san_pham sp ON sp.ma_dn = dn.ma_dn
    JOIN chi_tiet_san_pham ctsp ON ctsp.ma_sp = ctsp.ma_sp
    JOIN lich_su_gia_san_pham lsg ON lsg.ma_ctsp = ctsp.ma_ctsp
    JOIN don_mua dm ON dm.ma_ctsp = ctsp.ma_ctsp
    JOIN don_xuat dx ON dx.ma_dm = dx.ma_dm
WHERE dx.thoi_gian_xuat BETWEEN dn.thoi_gian_nhap AND GETDATE()
GROUP BY dn.ma_dn, dn.tong_gia


-- In ra tên sản phẩm,tên thương hiệu, tên nhà cung cấp;
SELECT sp.ma_sp AS 'Mã sản phẩm', sp.ten_sp AS 'Tên sản phẩm', th.ten_th AS 'Tên thương hiệu', ncc.ten_ncc AS 'Tên nhà cung cấp'
FROM san_pham sp
    JOIN nha_cung_cap ncc ON sp.ma_ncc = ncc.ma_ncc
    JOIN thuong_hieu th ON th.ma_th = sp.ma_th

GO
-- In ra tên sản phẩm,tên thương hiệu, tên nhà cung cấp và giá bán để người mua có thể thấy
SELECT DISTINCT sp.ten_sp AS 'Tên sản phẩm', th.ten_th AS 'Tên thương hiệu', ncc.ten_ncc AS 'Tên nhà cung cấp', lsg.gia_ban
FROM san_pham sp
    JOIN nha_cung_cap ncc ON sp.ma_ncc = ncc.ma_ncc
    JOIN thuong_hieu th ON th.ma_th = sp.ma_th
    JOIN chi_tiet_san_pham ctsp ON ctsp.ma_sp = sp.ma_sp
    JOIN lich_su_gia_san_pham lsg ON lsg.ma_ctsp = ctsp.ma_ctsp

GO
-- In ra những sản phẩm giảm giá và giảm giá bao nhiêu trong ngày 16/04/2023
SET DATEFORMAT dmy;
SELECT sp.ma_sp AS 'Mã SP', ctsp.ma_ctsp AS 'Mã CTSP', sp.ten_sp AS 'Tên sản phẩm', ctsp.chip AS 'Tên chip', ctsp.ram AS 'Dung lượng ram', ctsp.o_cung AS 'Dung lượng ổ cứng', lsg.gia_ban AS 'Giá bán', (SELECT(
(SELECT TOP 1
            gia_ban
        FROM lich_su_gia_san_pham
        WHERE ngay_hieu_luc = '2023-09-04 10:31:48.140') -
(SELECT TOP 1
            gia_ban
        FROM lich_su_gia_san_pham
        WHERE ngay_hieu_luc = '2023-16-04 00:00:00') 
)) AS 'Giá được giảm'
FROM chi_tiet_san_pham ctsp JOIN san_pham sp ON sp.ma_sp = ctsp.ma_sp JOIN lich_su_gia_san_pham lsg ON lsg.ma_ctsp = ctsp.ma_ctsp

SELECT(
(SELECT TOP 1
        gia_ban
    FROM lich_su_gia_san_pham
    WHERE ngay_hieu_luc = '2023-09-04 10:31:48.140') -
(SELECT TOP 1
        gia_ban
    FROM lich_su_gia_san_pham
    WHERE ngay_hieu_luc = '2023-16-04 00:00:00') 
)

-- Hiển thị mã SP, mã CTSP, tên sản phẩm, tên chip, dung lượng ram, dung lượng ổ cứng để người quản lý có thể thấy sản phẩm nào đang tồn tại trONg kho
SELECT sp.ma_sp AS 'Mã SP', ctsp.ma_ctsp AS 'Mã CTSP', sp.ten_sp AS 'Tên sản phẩm', ctsp.chip AS 'Tên chip', ctsp.ram AS 'Dung lượng ram', ctsp.o_cung AS 'Dung lượng ổ cứng'
FROM chi_tiet_san_pham ctsp JOIN san_pham sp ON sp.ma_sp = ctsp.ma_sp

-- Hiển thị danh sách tài khoản theo ngày tạo mới nhất
SELECT tk.ma_tk AS 'Mã tài khoản', tk.ho_ten AS 'Họ tên', tk.email AS 'Email', tk.ngay_tao AS 'Ngày tạo'
FROM tai_khoan tk
ORDER BY tk.ngay_tao DESC

--  Hiển thị sản phẩm theo danh mục 'Mỏng nhẹ'
SELECT sp.*
FROM san_pham sp INNER JOIN danh_muc dm
    ON dm.ma_sp = sp.ma_sp
    INNER JOIN chi_tiet_danh_muc ctdm
    ON ctdm.ma_ctdm = dm.ma_ctdm
WHERE ctdm.ten_ctdm = N'Mỏng nhẹ';
GO

--Tìm tài khoản có tổng tiền đơn mua cao nhất
SELECT top 2
    tk.ma_tk, tk.ho_ten,
    SUM(dm.so_luong * lsp.gia_ban) AS tong_gia_tien
FROM don_mua dm
    JOIN tai_khoan tk ON dm.ma_tk = tk.ma_tk
    JOIN chi_tiet_san_pham ctsp ON dm.ma_ctsp = ctsp.ma_ctsp
    JOIN lich_su_gia_san_pham lsp ON ctsp.ma_ctsp = lsp.ma_ctsp
GROUP BY tk.ma_tk, tk.ho_ten
HAVING SUM(dm.so_luong * lsp.gia_ban) IS NOT NULL
ORDER BY SUM(dm.so_luong * lsp.gia_ban) DESC

--Tìm kiếm số lượng sản phẩm theo ngày nhập
SELECT sp.ten_sp,
    dn.thoi_gian_nhap,
    SUM(dn.so_luong) AS so_luong_nhap
FROM don_nhap dn
    JOIN san_pham sp ON dn.ma_dn = sp.ma_dn
WHERE dn.thoi_gian_nhap BETWEEN '2023-06-01' AND '2024-06-06'
GROUP BY sp.ten_sp, dn.thoi_gian_nhap
HAVING SUM(dn.so_luong) > 10
ORDER BY SUM(dn.so_luong) DESC;