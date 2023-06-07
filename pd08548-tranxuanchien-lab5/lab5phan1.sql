--a. Hiển thị tất cả thông tin có trong bảng khách hàng bao gồm tất cả các cột
select * from Khach_Hang 

--b. Hiển thị 10 khách hàng đầu tiên trong bảng khách hàng bao gồm các cột: mã 
--khách hàng, họ và tên, email, số điện thoại
select top 10 MaKH, HoKH+' '+TenKH as'ho va ten',Email,SDT from Khach_Hang 
where MaKH <=10

--c. Hiển thị thông tin từ bảng Sản phẩm gồm các cột: mã sản phẩm, tên sản phẩm, 
--tổng tiền tồn kho. Với tổng tiền tồn kho = đơn giá* số lượng
select MaSP,TenSP,DonGia*SoLuong as'tong tien ton kho' from San_Pham

--d. Hiển thị danh sách khách hàng có tên bắt đầu bởi kí tự ‘H’ gồm các cột: 
--maKhachHang, hoVaTen, diaChi. Trong đó cột hoVaTen ghép từ 2 cột 
--hoVaTenLot và Ten
select MaKH,DiaChi, HoKH+' '+TenKH as'ho va ten' from Khach_Hang
where TenKH like 'H%'

--e. Hiển thị tất cả thông tin các cột của khách hàng có địa chỉ chứa chuỗi ‘Đà Nẵng’
select MaKH, HoKH+' '+TenKH as'ho va ten',Email,SDT,DiaChi from Khach_Hang
where DiaChi like N'%Đà Nẵng%'


--f. Hiển thị các sản phẩm có số lượng nằm trong khoảng từ 100 đến 500.
select MaSP,TenSP,MoTa,DonGia,SoLuong from San_Pham
where SoLuong>=5 and SoLuong<=10

--g. Hiển thị danh sách các hoá hơn có trạng thái là chưa thanh toán và ngày mua hàng
--trong năm 2016
select NgayMuaHang,TrangThai from Hoa_Don
where TrangThai like N'Chưa thanh toán'


--h. Hiển thị các hoá đơn có mã Khách hàng thuộc 1 trong 3 mã sau:1, 3, 
--6
select * from Hoa_Don
where MaKH ='1' or MaKH ='3' or MaKH ='6'
