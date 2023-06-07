--a. Hiển thị danh sách các khách hàng chưa mua hàng lần nào kể từ tháng 1/1/2016
select * from Khach_Hang
inner join Hoa_Don
on Khach_Hang.MaKH = Hoa_Don.MaKH
where NgayMuaHang > '01-01-2023'
order by NgayMuaHang desc

--b. Hiển thị mã sản phẩm, tên sản phẩm có lượt mua nhiều nhất trong tháng 12/2016
select MaSP,TenSP,NgayMuaHang,MAX(SoLuong) from San_Pham
inner join Hoa_Don
on San_Pham.MaSP = Hoa_Don.MaHD
where NgayMuaHang >= '01-12-2023' 
and NgayMuaHang <= '31-12-2023' 
group by MaSP,TenSP,NgayMuaHang


--c. Hiển thị top 5 khách hàng có tổng số tiền mua hàng nhiều nhất trong năm 2023
select top 5 HoKH+''+TenKH as TenKhachHang, (San_Pham.DonGia* San_Pham.SoLuong) as TongTien from Khach_Hang 
inner join San_Pham  
on Khach_Hang.MaKH = San_Pham.MaSP
join  Hoa_Don
on Khach_Hang.MaKH = Hoa_Don.MaHD


--d. Hiển thị thông tin các khách hàng sống ở ‘Quảng Bình’ có mua sản phẩm có tên 
--“Iphone 7 32GB” trong tháng 12/2016
select TenKH, DiaChi, TenSP,NgayMuaHang from Khach_Hang
inner join San_Pham
on San_Pham.MaSP = Khach_Hang.MaKH
inner join Hoa_Don
on Hoa_Don.MaHD = San_Pham.MaSP
where DiaChi like N'Quản Bình%'
and TenSp like N'Intel%'
and NgayMuaHang >= '01-12-2023'
and NgayMuaHang <= '30-12-2023'

--e. Hiển thị tên sản phẩm có lượt đặt mua nhỏ hơn lượt mua trung bình các các sản 
--phẩm.
select * from San_Pham
where SoLuong<(select AVG(SoLuong) from San_Pham)


