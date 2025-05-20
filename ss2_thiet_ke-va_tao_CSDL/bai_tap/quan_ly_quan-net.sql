create database cua_hang_internet;
use cua_hang_internet;
create table may_tinh(
	ma_may int primary key auto_increment,
    hang_sx varchar(50),
    vi_tri varchar(50)
);
create table loai_khach(
	id int primary key auto_increment,
    loai varchar(255)
);
create table khach_hang(
	ma_khach int primary key auto_increment,
    ten_khach varchar(50),
    email varchar (255),
    loai_khach_id int,
    foreign key (loai_khach_id) references loai_khach(id)
);
create table so_dien_thoai(
	sdt char(11),
    ma_khach int,
    foreign key(ma_khach) references khach_hang(ma_khach)
);
create table dich_vu(
	id int primary key auto_increment,
    loai_dich_vu varchar(255),
    gia float
);
create table quan_ly_su_dung(
	id int primary key auto_increment,
	thoi_gian_bat_dau datetime,
    thoi_gian_ket_thuc datetime,
    tong_tien float,
    ma_may int,
    ma_khach int,
    foreign key(ma_may) references may_tinh(ma_may),
    foreign key(ma_khach) references khach_hang(ma_khach)
);
create table chi_tiet_su_dung(
	dich_vu_id int,
    quan_ly_id int,
    primary key(dich_vu_id,quan_ly_id),
    foreign key(dich_vu_id) references dich_vu(id),
    foreign key(quan_ly_id) references quan_ly_su_dung(id)
);
