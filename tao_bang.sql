CREATE DATABASE website_ban_laptop COLLATE SQL_Latin1_General_CP1253_CI_AI;
GO
USE website_ban_laptop;
GO
-- drop database website_ban_laptop;
-- SELECT DATABASEPROPERTYEX('website_ban_laptop', 'Collation');
-- Tạo bảng tài khoản 
CREATE TABLE tai_khoan
(
    ma_tk INT NOT NULL IDENTITY(1,1),
    ho_ten NVARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL CONSTRAINT unq_taikhoan_email UNIQUE,
    sdt VARCHAR(10) NOT NULL CONSTRAINT unq_taikhoan_sdt UNIQUE,
    mat_khau VARCHAR(100) NOT NULL,
    ngay_sinh DATE NOT NULL,
    diem INT,
    ngay_tao DATETIME NOT NULL,
    CONSTRAINT pk_taikhoan PRIMARY KEY (ma_tk)
);

-- Tạo bảng địa chỉ tài khoản
CREATE TABLE dia_chi_tai_khoan
(
    ma_tk INT NOT NULL,
    tinh NVARCHAR(50) NOT NULL,
    quan_huyen NVARCHAR(50) NOT NULL,
    phuong_xa NVARCHAR(50) NOT NULL,
    chi_tiet NVARCHAR(100) NOT NULL,
    CONSTRAINT pk_diachitaikhoan PRIMARY KEY(ma_tk),
    CONSTRAINT fk_diachi_matk FOREIGN KEY (ma_tk) REFERENCES tai_khoan(ma_tk) ON DELETE CASCADE
);

-- Tạo bảng phân quyền
CREATE TABLE phan_quyen
(
    ma_tk INT NOT NULL,
    loai_tk NVARCHAR(30) NOT NULL,
    CONSTRAINT fk_phanquyen_matk FOREIGN KEY (ma_tk) REFERENCES tai_khoan(ma_tk) ON DELETE CASCADE
);

-- Tạo bảng đơn nhập
CREATE TABLE don_nhap
(
    ma_dn INT NOT NULL IDENTITY(1,1),
    thoi_gian_nhap DATETIME NOT NULL,
    ma_tk INT,
    so_luong INT NOT NULL,
    tong_gia FLOAT,
    CONSTRAINT pk_donnhap PRIMARY KEY (ma_dn),
    CONSTRAINT fk_donnhap_matk FOREIGN KEY (ma_tk) REFERENCES tai_khoan(ma_tk)
);

-- Tạo bảng nhà cung cấp
CREATE TABLE nha_cung_cap
(
    ma_ncc INT NOT NULL IDENTITY(1,1),
    ten_ncc NVARCHAR(100) NOT NULL,
    sdt NVARCHAR(10) NOT NULL CONSTRAINT unq_ncc_sdt UNIQUE,
    hinh_anh NVARCHAR(200) not null,
    CONSTRAINT pk_nhacungcap PRIMARY KEY (ma_ncc)
);

-- Tạo bảng địa chỉ nhà cung cấp
CREATE TABLE dia_chi_nha_cung_cap
(
    ma_ncc INT NOT NULL,
    tinh NVARCHAR(50) NOT NULL,
    quan_huyen NVARCHAR(50) NOT NULL,
    phuong_xa NVARCHAR(50) NOT NULL,
    chi_tiet NVARCHAR(100) NOT NULL,
    CONSTRAINT pk_diachinhacungcap PRIMARY KEY(ma_ncc),
    CONSTRAINT fk_diachinhacungcap_mancc FOREIGN KEY (ma_ncc) REFERENCES nha_cung_cap(ma_ncc)
);

-- Tạo bảng thương hiệu
CREATE TABLE thuong_hieu
(
    ma_th INT NOT NULL IDENTITY(1,1),
    ten_th VARCHAR(70) NOT NULL CONSTRAINT unq_thuonghieu_tenth UNIQUE,
    hinh_anh NVARCHAR(200) NOT NULL,
    CONSTRAINT pk_thuonghieu PRIMARY KEY (ma_th)
);

-- Tạo bảng sản phẩm
CREATE TABLE san_pham
(
    ma_sp INT NOT NULL IDENTITY(1,1),
    ten_sp NVARCHAR(300) NOT NULL,
    ma_dn INT NOT NULL,
    ma_ncc INT NOT NULL,
    ma_th INT NOT NULL,
    hinh_anh_1 NVARCHAR(200) NOT NULL,
    hinh_anh_2 NVARCHAR(200) NOT NULL,
    hinh_anh_3 NVARCHAR(200) NOT NULL,
    hinh_anh_4 NVARCHAR(200) NOT NULL,
    hinh_anh_5 NVARCHAR(200) NOT NULL,
    hinh_anh_6 NVARCHAR(200) NOT NULL,
    video NVARCHAR(200) NOT NULL,
    CONSTRAINT pk_losanpham PRIMARY KEY(ma_sp),
    CONSTRAINT fk_sanpham_madn FOREIGN KEY (ma_dn) REFERENCES don_nhap(ma_dn),
    CONSTRAINT fk_losanpham_mancc FOREIGN KEY (ma_ncc) REFERENCES nha_cung_cap(ma_ncc),
    CONSTRAINT fk_losanpham_math FOREIGN KEY (ma_th) REFERENCES thuong_hieu(ma_th)
);

-- Tạo bảng chi tiết sản phẩm
CREATE TABLE chi_tiet_danh_muc
(
    ma_ctdm INT NOT NULL IDENTITY(1,1),
    ten_ctdm NVARCHAR(100) NOT NULL,
    CONSTRAINT pk_chitietdanhmuc_mactdm PRIMARY KEY(ma_ctdm)
);

-- Tạo bảng danh mục
CREATE TABLE danh_muc
(
    ma_sp INT NOT NULL,
    ma_ctdm INT NOT NULL,
    CONSTRAINT fk_danhmuc_mactdm FOREIGN KEY (ma_ctdm) REFERENCES chi_tiet_danh_muc(ma_ctdm)
);

-- Tạo bảng chi tiết sản phẩm
CREATE TABLE chi_tiet_san_pham
(
    ma_ctsp INT NOT NULL IDENTITY(1,1),
    ma_sp INT NOT NULL,
    mau_sac NVARCHAR(50) NOT NULL,
    chip NVARCHAR(100) NOT NULL,
    ram NVARCHAR(100) NOT NULL,
    o_cung NVARCHAR(300) NOT NULL,
    card_do_hoa NVARCHAR(200) NOT NULL,
    cong_ket_noi NVARCHAR(200) NOT NULL,
    kich_thuoc_trong_luong NVARCHAR(100) NOT NULL,
    he_dieu_hanh NVARCHAR(100) NOT NULL,
    man_hinh NVARCHAR(100) NOT NULL,
    camera NVARCHAR(100) NOT NULL,
    thiet_ke NVARCHAR(100) NOT NULL,
    so_luong INT NOT NULL,
    thoi_diem_ra_mat  VARCHAR(4) NOT NULL,
    dac_biet NVARCHAR(100),
    CONSTRAINT pk_chitietsanpham PRIMARY KEY(ma_ctsp),
    CONSTRAINT fk_chitietsanpham_mactsp FOREIGN KEY (ma_sp) REFERENCES san_pham(ma_sp) ON DELETE CASCADE
);

-- Tạo bảng lịch sử giá
CREATE TABLE lich_su_gia_san_pham
(
    ma_gsp INT NOT NULL IDENTITY(1,1),
    ma_ctsp INT NOT NULL,
    gia_ban FLOAT NOT NULL,
    ngay_hieu_luc DATETIME NOT NULL,
    ngay_ket_thuc DATETIME,
    CONSTRAINT pk_lichsugiasanpham PRIMARY KEY(ma_gsp),
    CONSTRAINT fk_lichsugiasanpham_mactsp FOREIGN KEY (ma_ctsp) REFERENCES chi_tiet_san_pham(ma_ctsp)
);

-- Tạo bảng giỏ hàng
CREATE TABLE gio_hang
(
    ma_gh INT NOT NULL IDENTITY(1,1),
    ma_tk INT NOT NULL,
    ma_ctsp INT NOT NULL,
    so_luong INT NOT NULL,
    CONSTRAINT pk_giohang PRIMARY KEY(ma_gh),
    CONSTRAINT fk_giohang_matk FOREIGN KEY (ma_tk) REFERENCES tai_khoan(ma_tk),
    CONSTRAINT fk_giohang_mactsp FOREIGN KEY (ma_ctsp) REFERENCES chi_tiet_san_pham(ma_ctsp)
);

-- Tạo phương thức thanh toán
CREATE TABLE phuong_thuc_thanh_toan
(
    ma_pttt INT NOT NULL IDENTITY(1,1),
    ten_pttt NVARCHAR(300) NOT NULL,
    CONSTRAINT pk_phuongthucthanhtoan PRIMARY KEY(ma_pttt)
);

-- Tạo bảng đơn mua
CREATE TABLE don_mua
(
    ma_dm INT NOT NULL IDENTITY(1,1),
    ma_ctsp INT NOT NULL,
    so_luong INT NOT NULL,
    ma_tk INT NOT NULL,
    thoi_gian_mua DATETIME NOT NULL,
    ma_pttt INT NOT NULL,
    CONSTRAINT pk_donmua PRIMARY KEY(ma_dm),
    CONSTRAINT fk_donmua_mactsp FOREIGN KEY (ma_ctsp) REFERENCES chi_tiet_san_pham(ma_ctsp),
    CONSTRAINT fk_donmua_matk FOREIGN KEY (ma_tk) REFERENCES tai_khoan(ma_tk),
    CONSTRAINT fk_donmua_mapttt FOREIGN KEY (ma_pttt) REFERENCES phuong_thuc_thanh_toan(ma_pttt)
);

-- Tạo bảng đơn xuất
CREATE TABLE don_xuat
(
    ma_dx INT NOT NULL IDENTITY(1,1),
    thoi_gian_xuat DATETIME NOT NULL,
    ma_tk INT NOT NULL,
    ma_dm INT NOT NULL,
    trang_thai BIT,
    CONSTRAINT pk_donxuat PRIMARY KEY(ma_dx),
    CONSTRAINT fk_donxuat_madm FOREIGN KEY(ma_dm) REFERENCES don_mua(ma_dm) ON DELETE CASCADE
);


-- Tạo bảng hỏi đáp
CREATE TABLE hoi_dap
(
    ma_hd INT NOT NULL IDENTITY(1,1),
    ma_tk INT NOT NULL,
    ma_ctsp INT NOT NULL,
    CONSTRAINT pk_hoidap PRIMARY KEY(ma_hd),
    CONSTRAINT fk_hoidap_ma_tk FOREIGN KEY (ma_ctsp) REFERENCES tai_khoan(ma_tk),
    CONSTRAINT fk_hoidap_mactsp FOREIGN KEY (ma_ctsp) REFERENCES chi_tiet_san_pham(ma_ctsp)
);

-- Tạo bảng chi tiết hỏi đáp
CREATE TABLE chi_tiet_hoi_dap
(
    ma_cthd INT NOT NULL IDENTITY(1,1),
    ma_hd INT NOT NULL,
    ma_tk INT NOT NULL,
    thoi_gian DATETIME NOT NULL,
    noi_dung TEXT NOT NULL,
    CONSTRAINT pk_chitiethoidap PRIMARY KEY(ma_cthd),
    CONSTRAINT fk_chitiethoidap_mahd FOREIGN KEY (ma_hd) REFERENCES hoi_dap(ma_hd) ON DELETE CASCADE 
);




