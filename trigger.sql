-- SHOW TRIGGER
SELECT *
FROM sys.triggers
GO

/* Kiểm tra xem số lượng đặt mua có vượt quá số lượng máy có trong kho không?  */
CREATE TRIGGER trg_don_mua
ON don_mua
AFTER INSERT
AS
BEGIN
    DECLARE @so_luong_trong_kho INT
    DECLARE @so_luong_dat_mua INT
    SELECT @so_luong_dat_mua = SUM(dm.so_luong)
    FROM don_mua dm
    WHERE dm.ma_ctsp = (SELECT i.ma_ctsp
    FROM inserted i)
    GROUP BY (dm.ma_ctsp)

    SELECT @so_luong_trong_kho = ctsp.so_luong
    FROM chi_tiet_san_pham ctsp JOIN inserted i ON i.ma_ctsp = ctsp.ma_ctsp
    IF @so_luong_trong_kho < @so_luong_dat_mua
    BEGIN
        RAISERROR ('Đơn hàng vượt quá số lượng sản phẩm trong kho', 16, 1)
        ROLLBACK TRANSACTION
    END
END
GO

/* Cập nhật số lượng trong bảng chi_tiet_san_pham sau khi trạng thái đơn xuất là true */
CREATE TRIGGER trg_cap_nhat_so_luong_san_pham ON don_xuat 
FOR INSERT
AS 
BEGIN
    DECLARE @trang_tai BIT
    DECLARE @so_luong_mua INT
    SET @trang_tai = (SELECT i.trang_thai
    FROM inserted i)
    SET @so_luong_mua = (SELECT so_luong
    FROM don_mua dm JOIN inserted i ON i.ma_dm = dm.ma_dm)

    IF @trang_tai = 0 
    BEGIN
        PRINT N'Đơn mua không đạt yêu cầu'
    END
    IF @trang_tai = 1 
    BEGIN
        UPDATE chi_tiet_san_pham SET so_luong = ctsp.so_luong - @so_luong_mua
    FROM chi_tiet_san_pham ctsp JOIN don_mua dm ON dm.ma_ctsp = ctsp.ma_ctsp
    END
END
GO

/* Khi khách hàng hủy đơn mua sẽ tự động khôi phục số lượng trong bảng chi_tiet_san_pham */
CREATE TRIGGER trg_huy_don_mua ON don_mua 
FOR DELETE 
AS 
BEGIN
    UPDATE chi_tiet_san_pham SET so_luong = ctsp.so_luong + d.so_luong
    FROM chi_tiet_san_pham ctsp
        JOIN deleted d ON ctsp.ma_ctsp = d.ma_ctsp

    UPDATE don_xuat SET trang_thai = 0 FROM don_xuat dx JOIN deleted d ON dx.ma_dm = d.ma_dm
END
GO
/* Kiểm tra xem số lượng thêm vào giỏ hàng có vượt quá số lượng máy có trong kho không?  */
CREATE TRIGGER trg_gio_hang
ON gio_hang
AFTER INSERT
AS
BEGIN
    DECLARE @so_luong_trong_kho INT
    DECLARE @so_luong_them_vao_gio_hang INT
    SELECT @so_luong_trong_kho = ctsp.so_luong, @so_luong_them_vao_gio_hang = i.so_luong
    FROM chi_tiet_san_pham ctsp JOIN inserted i ON i.ma_ctsp = ctsp.ma_ctsp
    IF @so_luong_trong_kho < @so_luong_them_vao_gio_hang
    BEGIN
        RAISERROR ('Bạn đã thêm vượt quá số lượng sản phẩm trong kho', 16, 1)
        ROLLBACK TRANSACTION
    END
END
GO

/* Kiểm tra xem số lượng sản phẩm có vượt quá số lượng đơn nhập không? */
CREATE TRIGGER trg_chi_tiet_san_pham
ON chi_tiet_san_pham
AFTER INSERT
AS
BEGIN
    DECLARE @so_luong_trong_don_nhap INT
    DECLARE @so_luong_them_vao_kho INT
    SELECT @so_luong_trong_don_nhap = dn.so_luong
    FROM don_nhap dn JOIN san_pham sp ON sp.ma_dn = dn.ma_dn JOIN inserted i ON i.ma_sp = sp.ma_sp

    SELECT @so_luong_them_vao_kho = SUM(ctsp.so_luong)
    FROM chi_tiet_san_pham ctsp
        JOIN san_pham sp ON sp.ma_sp = ctsp.ma_sp
        JOIN don_nhap dn ON dn.ma_dn = sp.ma_dn
    WHERE dn.ma_dn = (SELECT dn.ma_dn
    FROM don_nhap dn
        JOIN san_pham sp ON sp.ma_dn = dn.ma_dn
        JOIN inserted i ON i.ma_sp = sp.ma_sp)
    GROUP BY(sp.ma_dn)

    SELECT @so_luong_trong_don_nhap as 'soluong trong don nhap'
    SELECT @so_luong_them_vao_kho as '@so_luong_them_vao_kho'

    IF @so_luong_them_vao_kho > @so_luong_trong_don_nhap
    BEGIN
        RAISERROR ('Bạn đã thêm vượt quá số lượng sản phẩm trong đơn nhập', 16, 1)
        ROLLBACK TRANSACTION
    END
END
GO

















