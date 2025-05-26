create database du_an_ban_sach_module_3;
use du_an_ban_sach_module_3;
create table don_hang (
    ma_don_hang int auto_increment primary key,
    ma_nguoi_dung int,
    tong_tien decimal(10,2),
    trang_thai varchar(50), -- ví dụ: "cho_xu_ly", "dang_giao", "hoan_thanh"
    ngay_tao timestamp default current_timestamp
);
create table chi_tiet_don_hang (
    ma_chi_tiet int auto_increment primary key,
    ma_don_hang int,
    ma_sach int,
    so_luong int,
    gia decimal(10,2)
);
