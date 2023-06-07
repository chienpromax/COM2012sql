create database QuanLyDuAn

use QuanLyDuAn
create table Phong_Banx(
MaPB int identity(1,1) primary key,
TenPB varchar(50) null,
MaTP int not null
)
create table Nhan_Vienx(
MaNV int primary key,
HoNV nvarchar (30) not null,
TenNV nvarchar (30) ,--mac dinh laf null
NamSinh datetime null,
DiaChi Nvarchar (200),
GioiTinh bit not null,
Luong float null,
MaPB int 
)
create table Du_Anx(
MaDuAn nvarchar (5) primary key,
TenDA nvarchar (200) null,
NgayBatDau datetime null,
NgayKetThuc datetime null,
)
create table Quan_Li_DuAnx(
MaDuAn nvarchar(5) primary key not null,
MaNV int not null,
NgayThamGia datetime null,
NgayKetThuc datetime null,
SoGio int null,
VaiTro nvarchar (20)
)	