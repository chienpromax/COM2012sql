create database QLThuVien

create table SinhVien(
	MaSV nvarchar (10) not null,
	TenSV nvarchar (50) not null,
	NgayHH date not null,
	ChuyenNganh nvarchar (50) null,
	Email nvarchar (50) not null,
	SDT nvarchar (15) not null,
	primary key(MaSV)
)
create table LoaiSach(
MaLoai nvarchar (50) not null,
TenLoai nvarchar (50) not null,
primary key(MaLoai)
)

create table Sach(
MaSach nvarchar (10) not null,
TenSach nvarchar (50) not null,
NhaXuatBan nvarchar (50) not null,
TacGia varchar (50) not null,
SL int  not null,
GiaTien float not null,
NgayNhapKho date,
ViTri varchar(50) not null,
MaLoai varchar (10) not null,
SoTrang int ,
primary key(MaSach)
)
create table PhieuMuon(
MaPM nvarchar (10) not null,
NgayMuon date not null,
NgayTra date not null,
MaSV nvarchar (10) not null,
primary key(MaPM),
)
create table ChiTietPM(
MaPM nvarchar (10) not null,
MaSach nvarchar (10) not null,
GhiChu nvarchar (250),
primary key(MaPM,MaSach)
)

alter table Sach
add constraint Check_GiaTien_Min
check (GiaTien>=0)
alter table Sach
add constraint Check_SoLuong_Min
Check (SL=0)
alter table SinhVien
add constraint SinhVien_UNQ_Email
unique (Email)

--lien ket bang
alter table PhieuMuon
add constraint PhieuMuon_DEPT_FK1
foreign key (MaSV)
references SinhVien(MaSV)

alter table ChiTietPM
add constraint ChiTietPM_DEPT_FK2
foreign key (MaPM)
references PhieuMuon(MaPM)

alter table ChiTietPM
add constraint ChiTietPM_DEPT_FK2
foreign key (MaSach)
references Sach(MaSach)

alter table Sach
add constraint Sach_DEPT_FK2
foreign key (MaLoai)
references LoaiSach(MaLoai)
