create database QuanLiBanHang

use QuanliBanHang
create table Khach_Hang(
	MaKH nvarchar(30) primary key,
	HoKH nvarchar(30),--mac dinh null
	TenKH nvarchar(20),
	DiaChi nvarchar(200),
	Email nvarchar(200),
	SDT int
)
create table San_Pham(
	MaSP int primary key,
	MoTa nvarchar(300),--mac dinh null
	SoLuong int,
	DonGia int,
	TenSP nvarchar(200)
)
create table Hoa_Don(
	MaHD int primary key,
	NgayMuaHang date,
	MaKH nvarchar(20),
	TrangThai nvarchar(200)
)
create table Hoa_Don_Chi_Tiet(
	MaHDCT int primary key,
	MaSP int,
	SoLuong int,
	MaHD int 
)

insert into Khach_Hang(MaKH, HoKH, TenKH, DiaChi, Email, SDT)
values
('1',N'Nguyễn Hữu',N'Nam',N'Đà Nẵng','chien1@gmail.com','0375869871'),
('2',N'Nguyễn Hữu',N'Toàn',N'Đà Nẵng','chien2@gmail.com','0375869872'),
('3',N'Nguyễn Lương',N'Quang',N'Quảng Nam','chien3@gmail.com','0375869873'),
('4',N'Nguyễn Trọng',N'Sơn',N'Quảng Nam','chien4@gmail.com','0375869874'),
('5',N'Nguyễn Thanh',N'Hậu',N'Quảng Nam','chien5@gmail.com','0375869875'),
('6',N'Trần Văn',N'Quang',N'Huế','chien6@gmail.com','0375869876'),
('7',N'Nguyễn Cao',N'Cường',N'Huế','chien7@gmail.com','0375869877'),
('8',N'Huỳnh Phước',N'Thành',N'Huế','chien8@gmail.com','0375869878'),
('9',N'Đoàn Văn',N'Thành',N'Quảng Bình','chien9@gmail.com','0375869879'),
('10',N'Trịnh Văn',N'Hiếu',N'Quảng Trị','chien10@gmail.com','0375869815'),
('11',N'Trương Thế',N'Hiếu',N'Quảng Bình','chien11@gmail.com','0375869825'),
('12',N'Nguyễn Văn',N'Tùng',N'Quảng Bình','chien12@gmail.com','0375869835')

insert into San_Pham(MaSP,MoTa,SoLuong, DonGia, TenSP)
values
('1',N'Bàn phím cơ nhỏ','12','9871',N'keyboard Small'),
('2',N'Bàn phím cơ vừa','11','9872',N'keyboard medium'),
('3',N'Bàn phím cơ to','10','9873',N'keyboard big'),
('4',N'Chuột nhựa','9','9874',N'plastic mouse'),
('5',N'Chuột Sắt','8','9875',N'iron mouse'),
('6',N'Chuột nhôm','7','9876',N'aluminum mouse'),
('7',N'RTX1080','6','9877',N'Nvidia GeForce'),
('8',N'RTX2060','5','9878',N'Nvidia GeForce'),
('9',N'RTX2080','4','9879',N'Nvidia GeForce'),
('10',N'RTX3060','3','9815',N'Nvidia GeForce'),
('11',N'core i3','2','9825',N'Intel'),
('12',N'core i5','1','9835',N'Intel')

insert into Hoa_Don(MaHD,NgayMuaHang,MaKH,TrangThai)
values
('1','01-01-2023','1',N'Thanh toán'),
('2','02-01-2023','6',N'Chưa thanh toán'),
('3','03-01-2023','9',N'Thanh toán'),
('4','04-01-2023','12',N'Chưa thanh toán'),
('5','05-01-2023','5',N'Thanh toán'),
('6','06-01-2023','10',N'Chưa thanh toán'),
('7','07-01-2023','7',N'Thanh toán'),
('8','08-01-2023','11',N'Chưa thanh toán'),
('9','09-01-2023','8',N'Thanh toán'),
('10','10-01-2023','3',N'Chưa thanh toán'),
('11','11-01-2023','4',N'Thanh toán'),
('12','12-01-2023','2',N'Chưa thanh toán')


insert into Hoa_Don_Chi_Tiet(MaHD,MaSP,SoLuong,MaHDCT)
values
('1','12','3','1'),
('2','11','6','2'),
('3','10','9','3'),
('4','9','12','4'),
('5','8','5','5'),
('6','7','8','6'),
('7','6','11','7'),
('8','5','4','8'),
('9','4','7','9'),
('10','3','2','10'),
('11','2','2','11'),
('12','1','7','12')
