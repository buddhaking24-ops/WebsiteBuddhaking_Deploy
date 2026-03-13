/*create database buddhaking_manager;*/

use buddhaking_manager;

create table nguoi_dung(
	ma_nguoi_dung varchar(100) primary key,
    mat_khau varchar(255) not null,
    ho_ten nvarchar(200) not null,
    email varchar(300) not null unique,
    so_dt varchar(50) not null unique,
    dia_chi nvarchar(500) not null,
    created_at datetime not null default current_timestamp,
    updated_at datetime not null default current_timestamp on update current_timestamp,
    trang_thai varchar(30) not null
);

create table vai_tro(
	ma_vai_tro varchar(10) primary key,
    ten_vai_tro nvarchar(100) not null
);

create table phan_quyen(
	id bigint auto_increment primary key,
    ma_nd varchar(100) not null,
    ma_vt varchar(10) not null,
    unique(ma_nd, ma_vt),
    foreign key (ma_nd) references nguoi_dung(ma_nguoi_dung),
    foreign key (ma_vt) references vai_tro(ma_vai_tro)
);

create table san_pham(
	ma_san_pham varchar(10) primary key,
    ten_san_pham nvarchar(300) not null,
    so_luong int not null check (so_luong >=0),
    gia_tien decimal(15,2) not null,
    mo_ta nvarchar(400),
    trang_thai varchar(30) not null,
    created_at datetime not null default current_timestamp,
    updated_at datetime not null default current_timestamp on update current_timestamp
);

create table don_hang(
	ma_don_hang bigint auto_increment primary key,
    ma_nd varchar(100) null,
    ho_ten nvarchar(200) not null,
    email varchar(300) null,
    so_dt varchar(50) not null,
    dia_chi_giao nvarchar(500) not null,
    trang_thai varchar(30) not null,
    tong_tien decimal(15,2) not null,
    created_at datetime not null default current_timestamp,
	updated_at datetime not null default current_timestamp on update current_timestamp,
    foreign key (ma_nd) references nguoi_dung(ma_nguoi_dung) on delete set null
);

create table don_hang_chi_tiet(
	id bigint auto_increment primary key,
    ma_sp varchar(10) not null,
    ma_dh bigint not null,
    unique(ma_sp,ma_dh),
    ten_sp nvarchar(300) not null,
    so_luong_mua int not null check(so_luong_mua>0),
    don_gia decimal(15,2) not null,
    foreign key(ma_sp) references san_pham(ma_san_pham),
    foreign key(ma_dh) references don_hang(ma_don_hang)
);

create table lien_he(
	id bigint auto_increment primary key,
    created_at datetime not null default current_timestamp,
    ho_ten nvarchar(400) not null,
    email varchar(200) not null,
    so_dt varchar(20) not null,
    loi_nhan nvarchar(500)
);

create index idx_don_hang_ma_nd on don_hang(ma_nd);
create index idx_ct_ma_dh on don_hang_chi_tiet(ma_dh);
create index idx_ct_ma_sp on don_hang_chi_tiet(ma_sp);

insert into vai_tro(ma_vai_tro, ten_vai_tro) values
('VT001', 'ADMIN'),
('VT002', 'CUSTOMER');

insert into nguoi_dung
(ma_nguoi_dung, mat_khau, ho_ten, email, so_dt, dia_chi, trang_thai)
values
('admin01', 'BuddhaKing', 'Nguyễn Văn Hoàng', 'admin@buddhaking.vn', '0909000001', 'TP.HCM', 'ACTIVE'),

('khach01', 'KhachVangLai', 'Trần Thị Mai', 'mai@gmail.com', '0909000002', 'Bình Thạnh, TP.HCM', 'ACTIVE');

insert into phan_quyen(ma_nd, ma_vt) values
('admin01', 'VT001'),
('khach01', 'VT002');

insert into san_pham
(ma_san_pham, ten_san_pham, so_luong, gia_tien, mo_ta, trang_thai)
values
('SP001',
 'Hương Nhang Thảo Mộc',
 500,
 120000.00,
 'Nhang sạch 100% thảo mộc tự nhiên, không hóa chất, hương thơm dịu nhẹ',
 'DANG_BAN');

insert into don_hang
(ma_nd, ho_ten, email, so_dt, dia_chi_giao, trang_thai, tong_tien)
values
('khach01',
 'Trần Thị Mai',
 'mai@gmail.com',
 '0909000002',
 'Bình Thạnh, TP.HCM',
 'CHO_XAC_NHAN',
 240000.00);
 
 insert into don_hang_chi_tiet
(ma_sp, ma_dh, ten_sp, so_luong_mua, don_gia)
values
('SP001',
 1,
 'Hương Nhang Thảo Mộc',
 2,
 120000.00);
 
 insert into don_hang
(ma_nd, ho_ten, email, so_dt, dia_chi_giao, trang_thai, tong_tien)
values
(null,
 'Lê Văn An',
 'anle@gmail.com',
 '0909000003',
 'Thủ Đức, TP.HCM',
 'CHO_XAC_NHAN',
 120000.00);
 
 insert into don_hang_chi_tiet
(ma_sp, ma_dh, ten_sp, so_luong_mua, don_gia)
values
('SP001',
 2,
 'Hương Nhang Thảo Mộc',
 1,
 120000.00);

insert into lien_he
(ho_ten, email, so_dt, loi_nhan)
values
('Phạm Quốc Huy',
 'huypham@gmail.com',
 '0909888888',
 'Nhang thơm dịu, cháy đều, nhưng mong có thêm loại cao cấp hơn');
 






