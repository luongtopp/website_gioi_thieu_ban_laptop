USE website_ban_laptop;
-- Thêm tài khoản
GO
INSERT tai_khoan
    (ho_ten, email, sdt, mat_khau, ngay_sinh, diem, ngay_tao)
VALUES(N'Trần Đức Lương', 'luongtopp@gmail.com', '0392109642', '1234', '2002-04-16', 0, '2020-04-16')
,
    (N'Nguyễn Tùng Dương', 'duong123@gmail.com', '0351692668', '1234', '1999-05-06', 0, GETDATE())
,
    (N'Mai Đức Anh', 'ducanh2345@gmail.com', '0933931368', '2002-08-08', '1234', 0, GETDATE())
,
    (N'Nguyễn Trung Văn', 'vantrungng2345@gmail.com', '0932721368', '1999-04-03', '1234', 0, GETDATE())
,
    (N'Trần Huyền Linh', 'linhlink456@gmail.com', '0933661368', '2003-07-03', '1234', 0, GETDATE())
,
    (N'Hoàng Như Quỳnh', 'quynhnhu567@gmail.com', '0932281368', '2004-05-03', '1234', 0, GETDATE())
-- Thêm địa chỉ tài khoản
INSERT dia_chi_tai_khoan
    (ma_tk, tinh, quan_huyen, phuong_xa, chi_tiet)
VALUES(1, N'Hà Nội', N'Thanh Xuân', N'Tân Triều', N'nhà số 4 ngách 73/51')
,
    (2, N'Hà Nội', N'Hoàng Mai', N'Tương Mai', N'Ng. 83 P. Nguyễn An Ninh')
,
    (3, N'Hà Nội', N'Đống Đa', N'Thịnh Quang', N'129 Ng. Thái Thịnh 1')
,
    (4, N'Hà Nội', N'Cầu Giấy', N'Trung Hoà', N'26 Ng 81 P. Trung Kính')
,
    (5, N'Hà Nội', N'Thanh Trì', N'Tân Triều', N'10-89 Ng. 111 Triều Khúc')
,
    (6, N'Hà Nội', N'Thanh Xuân', N'Nhân Chính', N'55-61 Ng. 213 P. Giáp Nhất');
-- Phân quyền tài khoản
INSERT phan_quyen
    (ma_tk, loai_tk)
VALUES(1, N'Quản lý')
,
    (2, N'Nhân viên')
,
    (3, N'Nhân viên');
-- Thêm nhà cung cấp
INSERT INTO nha_cung_cap
    (ten_ncc, sdt, hinh_anh)
VALUES(N'Công Ty TNHH Phát Triển Công Nghệ Cao Quyết Thắng', '0914585335', 'hinhanh1')
,
    (N'Thiết Bị Văn Phòng Silicom - Công Ty CP Công Nghệ Silicom', '19000132', 'hinhanh1')
,
    (N'Máy Vi Tính Nguyên Kim - Công Ty TNHH Vi Tính Nguyên Kim', '0282224626', 'hinhanh1');
-- Thêm địa chỉ nhà cung cấp
INSERT INTO dia_chi_nha_cung_cap
    (ma_ncc, tinh, quan_huyen, phuong_xa, chi_tiet)
VALUES(1, N'Thành phố Hồ Chí Minh', N'Gò Vấp', N'Phường 1', '39 Nguyễn Bỉnh Khiêm')
,
    (2, N'Thành phố Hồ Chí Minh', N'Quận Tân Bình', N'Phường 4', '58 Lê Bình')
,
    (3, N'Thành phố Hồ Chí Minh', N'Quận 1', N'Phường Tân Định', '245B Trần Quang Khải');
-- Thêm đơn nhập
INSERT INTO don_nhap
    (thoi_gian_nhap, ma_tk,so_luong, tong_gia)
VALUES(GETDATE(), 1, 300, 60000000000)
,
    (GETDATE(), 2, 500, 100000000000);
-- Thêm thương hiệu
INSERT INTO thuong_hieu
    (ten_th, hinh_anh)
VALUES('Apple', N'hinhanh1')
,
    ('HP', N'hinhanh1')
,
    ('Asus', 'hinhanh1')
,
    ('Dell', 'hinhanh1')
,
    ('MSI', 'hinhanh1')
,
    ('Lenovo', 'hinhanh1')
,
    ('Acer', 'hinhanh1')
,
    ('Razer', 'hinhanh1')
,
    ('Samsung', 'hinhanh1')
,
    ('Alienware', 'hinhanh1')
,
    ('Microsoft', 'hinhanh1')
,
    ('LG', 'hinhanh1');
-- Thêm sản phẩm
INSERT INTO san_pham
    (ten_sp, ma_dn, ma_ncc, ma_th, hinh_anh_1, hinh_anh_2, hinh_anh_3, hinh_anh_4, hinh_anh_5, hinh_anh_6, video)
VALUES(N'Laptop HP 15s fq5078TU i5 1235U/8GB/512GB/Win11 (6K798PA)', 1, 1, 2, N'hinhanh1', N'hinhanh2', N'hinhanh3', N'hinhanh4', N'hinhanh5', N'hinhanh6', N'video')
,
    (N'Laptop HP 240 G9 i5 1235U/8GB/256GB/Win11 (6L1Y1PA) ', 1, 1, 2, N'hinhanh1', N'hinhanh2', N'hinhanh3', N'hinhanh4', N'hinhanh5', N'hinhanh6', N'video')
,
    (N'Laptop HP Pavilion 15 ', 1, 1, 2, N'hinhanh1', N'hinhanh2', N'hinhanh3', N'hinhanh4', N'hinhanh5', N'hinhanh6', N'video')
,
    (N'Laptop HP 15s fq2716TU i3 1115G4/8GB/512GB/Win11 (7C0X3PA)', 1, 1, 2, N'hinhanh1', N'hinhanh2', N'hinhanh3', N'hinhanh4', N'hinhanh5', N'hinhanh6', N'video')
,
    (N'Laptop Apple MacBook Air M1 2020', 2, 3, 1, N'hinhanh1', N'hinhanh2', N'hinhanh3', N'hinhanh4', N'hinhanh5', N'hinhanh6', N'video')
,
    (N'Laptop Apple MacBook Air M2 2022', 2, 3, 1, N'hinhanh1', N'hinhanh2', N'hinhanh3', N'hinhanh4', N'hinhanh5', N'hinhanh6', N'video')
,
    (N'Laptop Asus TUF Gaming F15 FX506LHB i5 10300H/8GB/512GB/4GB GTX1650/144Hz/Win11 (HN188W)', 1, 3, 3, N'hinhanh1', N'hinhanh2', N'hinhanh3', N'hinhanh4', N'hinhanh5', N'hinhanh6', N'video')
,
    (N'Laptop Asus VivoBook 15X OLED A1503ZA i5 12500H/8GB/512GB/Win11 (L1290W)', 1, 3, 3, N'hinhanh1', N'hinhanh2', N'hinhanh3', N'hinhanh4', N'hinhanh5', N'hinhanh6', N'video')
,
    (N'Laptop Asus Gaming ROG Strix G15 G513IH R7 4800H/8GB/512GB/4GB GTX1650/144Hz/Win11 (HN015W)', 1, 3, 3, N'hinhanh1', N'hinhanh2', N'hinhanh3', N'hinhanh4', N'hinhanh5', N'hinhanh6', N'video')
,
    (N'Laptop Lenovo Ideapad 3 15IAU7 i3 1215U/8GB/256GB/Win11 (82RK005LVN)', 2, 3, 6, N'hinhanh1', N'hinhanh2', N'hinhanh3', N'hinhanh4', N'hinhanh5', N'hinhanh6', N'video')
,
    (N'Laptop Lenovo Ideapad 3 15IAU7 i3 1215U/8GB/512GB/Win11 (82RK001MVN)', 2, 3, 6, N'hinhanh1', N'hinhanh2', N'hinhanh3', N'hinhanh4', N'hinhanh5', N'hinhanh6', N'video')
,
    (N'Laptop Lenovo Ideapad 3 15ITL6 i5 1155G7/8GB/512GB/Win11 (82H803CVVN)', 2, 3, 6, N'hinhanh1', N'hinhanh2', N'hinhanh3', N'hinhanh4', N'hinhanh5', N'hinhanh6', N'video')
,
    (N'Laptop Surface Pro 9 i7 1255U/16GB/256GB/Touch/120Hz/Win11', 2, 3, 11, N'hinhanh1', N'hinhanh2', N'hinhanh3', N'hinhanh4', N'hinhanh5', N'hinhanh6', N'video')
,
    (N'Laptop Surface Pro 9 i5 1235U/8GB/256GB/Touch/120Hz/Win11', 2, 3, 11, N'hinhanh1', N'hinhanh2', N'hinhanh3', N'hinhanh4', N'hinhanh5', N'hinhanh6', N'video')
,
    (N'Microsoft 13.5″ Surface Laptop 5', 2, 3, 11, N'hinhanh1', N'hinhanh2', N'hinhanh3', N'hinhanh4', N'hinhanh5', N'hinhanh6', N'video');
-- Thêm chi tiết danh mục
INSERT INTO chi_tiet_danh_muc
    (ten_ctdm)
VALUES(N'Mỏng nhẹ')
,
    (N'Văn phòng')
,
    (N'Gamming')
,
    (N'Sang trọng')
,
    (N'Đồ họa')
,
    (N'Học sinh/Sinh viên');
-- Thêm danh mục cho sản phẩm
INSERT INTO danh_muc
    (ma_sp, ma_ctdm)
VALUES(1, 1)
,
    (2, 1)
,
    (3, 1)
,
    (4, 1)
,
    (1, 2)
,
    (2, 2)
,
    (3, 2)
,
    (4, 2)
,
    (1, 6)
,
    (2, 6)
,
    (3, 6)
,
    (4, 6)
,
    (5, 1)
,
    (6, 1)
,
    (5, 2)
,
    (6, 2)
,
    (5, 4)
,
    (6, 4)
,
    (7, 1)
,
    (8, 1)
,
    (9, 1)
,
    (7, 3)
,
    (8, 3)
,
    (9, 3)
,
    (7, 5)
,
    (8, 5)
,
    (9, 5)
,
    (10, 1)
,
    (11, 1)
,
    (12, 1)
,
    (10, 5)
,
    (11, 5)
,
    (12, 5)
,
    (10, 4)
,
    (11, 4)
,
    (12, 4)
,
    (13, 1)
,
    (14, 1)
,
    (13, 2)
,
    (14, 2)
,
    (13, 4)
,
    (14, 4)
,
    (15, 4);

-- Thêm chi tiết sản phẩm
INSERT INTO chi_tiet_san_pham
    (ma_sp, mau_sac, chip, ram, o_cung, man_hinh, card_do_hoa, cong_ket_noi, dac_biet, he_dieu_hanh, thiet_ke, kich_thuoc_trong_luong, thoi_diem_ra_mat, camera, so_luong)
VALUES(1, N'Bạc', N'i5, 1235U, 1.3GHz', N'8 GB, DDR4 2 khe (1 khe 4 GB + 1 khe 4 GB), 3200 MHz', N'512 GB SSD NVMe PCIe', N'15.6", Full HD (1920 x 1080)', N'Card tích hợp, Intel Iris Xe', N'USB Type-C, HDMI, Jack tai nghe 3.5 mm2 x USB 3.2', N'', N'Windows 11 Home SL', N'Vỏ nhựa', N'Dài 358.5 mm - Rộng 242 mm - Dày 17.9 mm - Nặng 1.69 kg', '2022', N'720p', 20)
,
    (2, N'Bạc', N'i5, 1235U, 1.3GHz', N'8 GB, DDR4 2 khe (1 khe 4 GB + 1 khe 4 GB), 3200 MHz', N'256 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)', N'14", Full HD (1920 x 1080)', N'Card tích hợp, Intel UHD', N'USB Type-C, HDMI, LAN (RJ45), Jack tai nghe 3.5 mm, 2x SuperSpeed USB A', N'', N'Windows 11 Home SL', N'Vỏ nhựa', N'Dài 324 mm - Rộng 225.9 mm - Dày 19.9 mm - Nặng 1.47 kg', '2022', N'720p', 15)
,
    (3, N'Bạc', N'i5, 1235U, 1.3GHz', N'8 GB, DDR4 2 khe (1 khe 4 GB + 1 khe 4 GB), 3200 MHz', N'256 GB SSD NVMe PCIe', N'15.6", Full HD (1920 x 1080)', N'Card tích hợp, Intel Iris Xe', N'USB Type-C, HDMI, Jack tai nghe 3.5 mm, 2 x USB 3.2', N'', N'Windows 11 Home SL', N'Vỏ nhựa - chiếu nghỉ tay bằng kim loại', N'Dài 360.2 mm - Rộng 234 mm - Dày 17.9 mm - Nặng 1.72 kg', '2022', N'720p', 15)
,
    (4, N'Bạc', N'i3,1115G4, 3GHz', N'8 GB, DDR4 2 khe (1 khe 4 GB + 1 khe 4 GB), 3200 MHz', N'512 GB SSD NVMe PCIe', N'15.6", Full HD (1920 x 1080)', N'Card tích hợp, Intel UHD', N'HDMI, Jack tai nghe 3.5 mm, 2x SuperSpeed USB A, 1x SuperSpeed USB Type-C', N'', N'Windows 11 Home SL', N'Vỏ nhựa', N'Dài 358.5 mm - Rộng 242 mm - Dày 17.9 mm - Nặng 1.7 kg', '2022', N'720p', 10)
,
    (5, N'Bạc', N'Apple M1', N'8 GB', N'256GB SSD', N'13.3", Retina (2560 x 1600)', N'Card tích hợp, 7 nhân GPU', N'Jack tai nghe 3.5 mm, 2 x Thunderbolt 3 (USB-C)', N'Có đèn bàn phím', N'Mac OS', N'Vỏ kim loại nguyên khối', N'Dài 304.1 mm - Rộng 212.4 mm - Dày 4.1 mm đến 16.1 mm - Nặng 1.29 kg', '2020', N'720p', 10)
,
    (5, N'Vàng đồng', N'Apple M1', N'8 GB', N'256GB SSD', N'13.3", Retina (2560 x 1600)', N'Card tích hợp, 7 nhân GPU', N'Jack tai nghe 3.5 mm, 2 x Thunderbolt 3 (USB-C)', N'Có đèn bàn phím', N'Mac OS', N'Vỏ kim loại nguyên khối', N'Dài 304.1 mm - Rộng 212.4 mm - Dày 4.1 mm đến 16.1 mm - Nặng 1.29 kg', '2020', N'720p', 10)
,
    (5, N'Xám', N'Apple M1', N'8 GB', N'256GB SSD', N'13.3", Retina (2560 x 1600)', N'Card tích hợp, 7 nhân GPU', N'Jack tai nghe 3.5 mm, 2 x Thunderbolt 3 (USB-C)', N'Có đèn bàn phím', N'Mac OS', N'Vỏ kim loại nguyên khối', N'Dài 304.1 mm - Rộng 212.4 mm - Dày 4.1 mm đến 16.1 mm - Nặng 1.29 kg', '2020', N'720p', 10)
,
    (5, N'Bạc', N'Apple M1', N'16 GB', N'512GB SSD', N'13.3", Retina (2560 x 1600)', N'Card tích hợp, 7 nhân GPU', N'Jack tai nghe 3.5 mm, 2 x Thunderbolt 3 (USB-C)', N'Có đèn bàn phím', N'Mac OS', N'Vỏ kim loại nguyên khối', N'Dài 304.1 mm - Rộng 212.4 mm - Dày 4.1 mm đến 16.1 mm - Nặng 1.29 kg', '2020', N'720p', 10)
,
    (5, N'Vàng đồng', N'Apple M1', N'16 GB', N'512GB SSD', N'13.3", Retina (2560 x 1600)', N'Card tích hợp, 7 nhân GPU', N'Jack tai nghe 3.5 mm, 2 x Thunderbolt 3 (USB-C)', N'Có đèn bàn phím', N'Mac OS', N'Vỏ kim loại nguyên khối', N'Dài 304.1 mm - Rộng 212.4 mm - Dày 4.1 mm đến 16.1 mm - Nặng 1.29 kg', '2020', N'720p', 10)
,
    (5, N'Xám', N'Apple M1', N'16 GB', N'512GB SSD', N'13.3", Retina (2560 x 1600)', N'Card tích hợp, 7 nhân GPU', N'Jack tai nghe 3.5 mm, 2 x Thunderbolt 3 (USB-C)', N'Có đèn bàn phím', N'Mac OS', N'Vỏ kim loại nguyên khối', N'Dài 304.1 mm - Rộng 212.4 mm - Dày 4.1 mm đến 16.1 mm - Nặng 1.29 kg', '2020', N'720p', 10)
,
    (6, N'Bạc', N'Apple M2', N'8 GB', N'256GB SSD', N'13.6", Liquid Retina (2560 x 1664)', N'Card tích hợp, 8 nhân GPU', N'Jack tai nghe 3.5 mm, MagSafe 3, 2 x Thunderbolt 3', N'Có đèn bàn phím', N'Mac OS', N'Vỏ kim loại nguyên khối', N'Dài 304.1 mm - Rộng 215 mm - Dày 11.3 mm - Nặng 1.24 kg', '2022', N'720p', 10)
,
    (6, N'Đen Xanh', N'Apple M2', N'8 GB', N'256GB SSD', N'13.6", Liquid Retina (2560 x 1664)', N'Card tích hợp, 8 nhân GPU', N'Jack tai nghe 3.5 mm, MagSafe 3, 2 x Thunderbolt 3', N'Có đèn bàn phím', N'Mac OS', N'Vỏ kim loại nguyên khối', N'Dài 304.1 mm - Rộng 215 mm - Dày 11.3 mm - Nặng 1.24 kg', '2022', N'720p', 10)
,
    (6, N'Xám', N'Apple M2', N'8 GB', N'256GB SSD', N'13.6", Liquid Retina (2560 x 1664)', N'Card tích hợp, 8 nhân GPU', N'Jack tai nghe 3.5 mm, MagSafe 3, 2 x Thunderbolt 3', N'Có đèn bàn phím', N'Mac OS', N'Vỏ kim loại nguyên khối', N'Dài 304.1 mm - Rộng 215 mm - Dày 11.3 mm - Nặng 1.24 kg', '2022', N'720p', 10)
,
    (6, N'Vàng', N'Apple M2', N'8 GB', N'256GB SSD', N'13.6", Liquid Retina (2560 x 1664)', N'Card tích hợp, 8 nhân GPU', N'Jack tai nghe 3.5 mm, MagSafe 3, 2 x Thunderbolt 3', N'Có đèn bàn phím', N'Mac OS', N'Vỏ kim loại nguyên khối', N'Dài 304.1 mm - Rộng 215 mm - Dày 11.3 mm - Nặng 1.24 kg', '2022', N'720p', 10)
,
    (6, N'Bạc', N'Apple M2, 100GB/s', N'8 GB', N'512 GB SSD', N'13.6", Liquid Retina (2560 x 1664)', N'Card tích hợp, 10 nhân GPU', N'Jack tai nghe 3.5 mm, MagSafe 3, 2 x Thunderbolt 3', N'Có đèn bàn phím', N'Mac OS', N'Vỏ kim loại nguyên khối', N'Dài 304.1 mm - Rộng 215 mm - Dày 11.3 mm - Nặng 1.24 kg', '2022', N'720p', 10)
,
    (6, N'Đen Xanh', N'Apple M2, 100GB/s', N'8 GB', N'512 GB SSD', N'13.6", Liquid Retina (2560 x 1664)', N'Card tích hợp, 10 nhân GPU', N'Jack tai nghe 3.5 mm, MagSafe 3, 2 x Thunderbolt 3', N'Có đèn bàn phím', N'Mac OS', N'Vỏ kim loại nguyên khối', N'Dài 304.1 mm - Rộng 215 mm - Dày 11.3 mm - Nặng 1.24 kg', '2022', N'720p', 10)
,
    (6, N'Xám', N'Apple M2, 100GB/s', N'8 GB', N'512 GB SSD', N'13.6", Liquid Retina (2560 x 1664)', N'Card tích hợp, 10 nhân GPU', N'Jack tai nghe 3.5 mm, MagSafe 3, 2 x Thunderbolt 3', N'Có đèn bàn phím', N'Mac OS', N'Vỏ kim loại nguyên khối', N'Dài 304.1 mm - Rộng 215 mm - Dày 11.3 mm - Nặng 1.24 kg', '2022', N'720p', 10)
,
    (6, N'Vàng', N'Apple M2, 100GB/s', N'8 GB', N'512 GB SSD', N'13.6", Liquid Retina (2560 x 1664)', N'Card tích hợp, 10 nhân GPU', N'Jack tai nghe 3.5 mm, MagSafe 3, 2 x Thunderbolt 3', N'Có đèn bàn phím', N'Mac OS', N'Vỏ kim loại nguyên khối', N'Dài 304.1 mm - Rộng 215 mm - Dày 11.3 mm - Nặng 1.24 kg', '2022', N'720p', 10)
,
    (7, N'Đen', N'i5, 10300H, 2.5GHz', N'8 GB, DDR4 2 khe (1 khe 8 GB + 1 khe rời), 2933 MHz', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)', N'15.6", Full HD (1920 x 1080), 144Hz', N'Card rời, GTX 1650 4GB', N'HDMI, LAN (RJ45), USB 2.0, Jack tai nghe 3.5 mm, 2 x USB 3.2, 1 x USB 3.2 Gen 2 Type-C (hỗ trợ DisplayPort, Power delivery, G-SYNC)', N'Có đèn bàn phím', N'Windows 11 Home SL', N'Vỏ nhựa', N'Dài 359 mm - Rộng 256 mm - Dày 24.9 mm - Nặng 2.3 kg', '2021', N'720p', 9)
,
    (8, N'Xanh', N'i5, 12500H, 2.5GHz', N'8 GB, DDR4 2 khe (1 khe 8 GB + 1 khe rời), 3200 MHz', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác không giới hạn dung lượng)', N'15.6", Full HD (1920 x 1080)OLED', N'Card tích hợp, Intel UHD', N'HDMI, USB Type-C, Jack tai nghe 3.5 mm, 2 x USB 3.2, 1 x USB 2.0', N'Có đèn bàn phím', N'Windows 11 Home SL', N'Vỏ nhựa', N'Dài 356.8 mm - Rộng 227.6 mm - Dày 19.9 mm - Nặng 1.7 kg', '2022', N'720p', 15)
,
    (9, N'Xám', N'Ryzen 7, 4800H, 2.9GHz', N'8 GB, DDR4 2 khe (1 khe 8 GB + 1 khe rời), 3200 MHz', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB), Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1 TB)', N'15.6", Full HD (1920 x 1080), 144Hz', N'Card rời GTX 1650 4GB', N'HDMI, LAN (RJ45), Jack tai nghe 3.5 mm, 3x Type-A USB 3.2 Gen 1, USB Type-C (hỗ trợ Power Delivery và DisplayPort)', N'Có đèn bàn phím', N'Windows 11 Home SL', N'Vỏ nhựa - nắp lưng bằng kim loại', N'Dài 354 mm - Rộng 259 mm - Dày 20.6 mm - Nặng 2.1 kg', '2021', N'720p', 10)
,
    (10, N'Xám', N'i3, 1215U, 1.2GHz', N'8 GB, DDR4 2 khe (1 khe 8 GB onboard + 1 khe trống), 3200 MHz', N'256 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)', N'15.6", Full HD (1920 x 1080)', N'Card tích hợp, Intel UHD', N'HDMI, Jack tai nghe 3.5 mm, 1 x USB 2.01 x USB 3.2, USB Type-C (hỗ trợ truyền dữ liệu, Power Delivery 3.0 và DisplayPort 1.2)', N'', N'Windows 11 Home SL', N'Vỏ nhựa', N'Dài 359.2 mm - Rộng 236.5 mm - Dày 19.9 mm - Nặng 1.63 kg', '2022', N'720p', 10)
,
    (11, N'Xám', N'i3, 1215U, 1.2GHz', N'8 GB, DDR4 2 khe (1 khe 8 GB onboard + 1 khe trống), 3200 MHz', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)', N'15.6", Full HD (1920 x 1080)', N'Card tích hợp, Intel UHD', N'HDMI, Jack tai nghe 3.5 mm, 1 x USB 2.01 x USB 3.2, USB Type-C (hỗ trợ truyền dữ liệu, Power Delivery 3.0 và DisplayPort 1.2)', N'', N'Windows 11 Home SL', N'Vỏ nhựa', N'Dài 359.2 mm - Rộng 236.5 mm - Dày 19.9 mm - Nặng 1.63 kg', '2022', N'720p', 10)
,
    (12, N'Xám', N'i5, 1155G7, 2.5GHz', N'8 GB, DDR4 2 khe (1 khe 8 GB onboard + 1 khe trống), 3200 MHz', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB (2280) / 512 GB (2242))', N'15.6", Full HD (1920 x 1080)', N'Card tích hợp, Intel Iris Xe', N'HDMI, Jack tai nghe 3.5 mm1 x USB 2.0, 1 x USB 3.2, 1 x USB Type-C (chỉ hỗ trợ truyền dữ liệu)', N'', N'Windows 11 Home SL', N'Vỏ nhựa', N'Dài 359.2 mm - Rộng 236.5 mm - Dày 19.9 mm - Nặng 1.65 kg', '2023', N'720p', 10)
,
    (13, N'Xám', N'i7, 1255U, 1.7GHz', N'16 GB, LPDDR5 (Onboard), 4800 MHz', N'256 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)', N'13", 2880 x 1920, 120Hz', N'Card tích hợp, Intel Iris Xe', N'1 x Surface Connect, 2 x USB-C with USB 4.0/ Thunderbolt 4', N'Có màn hình cảm ứng', N'Windows 11 Home SL', N'Vỏ kim loại nguyên khối', N'Dài 287 mm - Rộng 209 mm - Dày 9.3 mm - Nặng 0.879 kg', '2022', N'720p', 10)
,
    (14, N'Xám', N'i5, 1235U, 1.3GHz', N'8 GB, LPDDR5 (Onboard), 4800 MHz', N'256 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)', N'13", 2880 x 1920, 120Hz', N'Card tích hợp, Intel Iris Xe', N'1 x Surface Connect, 2 x USB-C with USB 4.0/ Thunderbolt 4', N'Có màn hình cảm ứng', N'Windows 11 Home SL', N'Vỏ kim loại nguyên khối', N'Dài 287 mm - Rộng 209 mm - Dày 9.3 mm - Nặng 0.879 kg', '2022', N'720p', 10)
,
    (15, N'Sage (Metal)', N'Intel 12th Gen Core i5-1235U (10 Core, 12 Thread, 8-E-core 3.4GHz, 2-P-core 4.4GHz, 12MB Cache)', N'8GB LPDDR5x memory', N'256GB', N' 13.5" PixelSense Display with 2256 x 1504 (201 PPI)', N' Intel Iris Xe  Graphics', N'USB-C hỗ trợ USB 4.0/ Thunderbolt 4, USB-A, SurfaceConnect, jack 3.5', N'Có màn hình cảm ứng', N'Windows 11 Home SL', N'Vỏ kim loại nguyên khối', N'Dài 287 mm - Rộng 209 mm - Dày 9.3 mm - Nặng 0.879 kg', '2022', N'720p', 5)

-- Thêm lịch sử giá sản phẩm
INSERT INTO lich_su_gia_san_pham
    (ma_ctsp, gia_ban, ngay_hieu_luc)
VALUES
    (1, 14490000, GETDATE())
,
    (2, 15490000, GETDATE())
,
    (3, 14590000, GETDATE())
,
    (4, 10990000, GETDATE())
,
    (5, 18590000, GETDATE())
,
    (6, 18590000, GETDATE())
,
    (7, 18590000, GETDATE())
,
    (8, 29990000, GETDATE())
,
    (9, 29990000, GETDATE())
,
    (10, 29990000, GETDATE())
,
    (11, 25990000, GETDATE())
,
    (12, 25990000, GETDATE())
,
    (13, 25990000, GETDATE())
,
    (14, 25990000, GETDATE())
,
    (15, 30990000, GETDATE())
,
    (16, 30990000, GETDATE())
,
    (17, 30990000, GETDATE())
,
    (18, 30990000, GETDATE())
,
    (19, 17490000, GETDATE())
,
    (20, 16990000, GETDATE())

select * from gio_hang
-- Thêm vào giỏ hàng
INSERT INTO gio_hang
    (ma_tk, ma_ctsp, so_luong)
VALUES
    (5, 1, 10),
    (5, 2, 10);
-- Thêm hỏi đáp
INSERT hoi_dap
    (ma_tk, ma_ctsp)
VALUES
    (6, 5),
    (7, 5);

-- Thêm chi tiết hỏi đáp
INSERT chi_tiet_hoi_dap
    (ma_hd,ma_tk,thoi_gian,noi_dung)
VALUES(1, 5, GETDATE(), N'MÁY NÀY CÀI AUTOCARD HOẶC PHẦN MỀM VẼ 3D ĐƯỢC KHÔNG Ạ')
 ,
    (1, 1, GETDATE(), N'Chào anh !Dạ trường hợp này thì máy cài được các ứng dụng trên anh nhé. Máy chạy trên Rosetta 2 anh nhé. Thông tin đến anh?');

INSERT chi_tiet_hoi_dap
    (ma_hd,ma_tk,thoi_gian,noi_dung)
VALUES(2, 6, GETDATE(), N'Máy này làm PowerPoint ok k ạ')
 ,
    (2, 2, GETDATE(), N'Chào anh! Dạ trường hợp này em thấy máy có thể đáp ứng như cầu làm PowerPoint  của mình rất tốt anh nhé Thông tin đến anh!')

-- Thêm dữ liệu vào phương thức thanh toán
-- Chúng ta có thể thêm một phương thức nữa là thanh toán tại cửa hàng nhưng cần có thêm địa chỉ của cửa hàng
-- nên nếu thêm cần tạo một bảng cửa hàng
INSERT phuong_thuc_thanh_toan
    (ten_pttt)
VALUES(N'Thẻ tín dụng'),
    (N'Thanh toán khi nhận hàng');
SELECT ma_ctsp, so_luong FROM chi_tiet_san_pham

select * from don_mua
-- Thêm đơn mua 
INSERT don_mua
    (ma_ctsp, so_luong, ma_tk, thoi_gian_mua, ma_pttt)
VALUES(5, 10, 3, GETDATE(), 2)

-- Thêm đơn xuất
INSERT don_xuat
    (thoi_gian_xuat, ma_tk, ma_dm, trang_thai)
VALUES(GETDATE(), 1, 19, 1),
    (GETDATE(), 1, 19, 1);


select don_mua.ma_dm, don_mua.ma_ctsp, don_mua.so_luong, don_xuat.ma_dx from don_xuat JOIN don_mua ON don_mua.ma_dm = don_xuat.ma_dm



SELECT ctsp.ma_ctsp AS 'Mã chi tiết sản phẩm',dm.so_luong, lsg.gia_ban  AS 'Tổng giá' FROM don_xuat dx 
JOIN don_mua dm ON dm.ma_dm = dx.ma_dm 
JOIN chi_tiet_san_pham ctsp ON ctsp.ma_ctsp = dm.ma_ctsp
JOIN lich_su_gia_san_pham lsg ON lsg.ma_ctsp = ctsp.ma_ctsp 



SELECT ctsp.ma_ctsp AS 'Mã chi tiết sản phẩm', SUM(lsg.gia_ban * dm.so_luong) AS 'Tổng giá' FROM don_xuat dx 
JOIN don_mua dm ON dm.ma_dm = dx.ma_dm 
JOIN chi_tiet_san_pham ctsp ON ctsp.ma_ctsp = dm.ma_ctsp
JOIN lich_su_gia_san_pham lsg ON lsg.ma_ctsp = ctsp.ma_ctsp 
WHERE dx.thoi_gian_xuat BETWEEN '2022-12-12' AND '2023-12-12' GROUP BY(ctsp.ma_ctsp)






