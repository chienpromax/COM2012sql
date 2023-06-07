--a. Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột 
--sau: maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMua
select * from Hoa_Don
inner join Hoa_Don_Chi_Tiet
on Hoa_Don.MaHD = Hoa_Don_Chi_Tiet.MaHD

--b. Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột 
--sau: maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMua với 
--điều kiện maKhachHang = ‘KH001’
select Hoa_Don.MaHD,MaKH,TrangThai,MaSP,SoLuong,NgayMuaHang from Hoa_Don
inner join Hoa_Don_Chi_Tiet
on Hoa_Don.MaHD = Hoa_Don_Chi_Tiet.MaHD
where MaKH=1

--c. Hiển thị thông tin từ 3 bảng Hoá đơn, Hoá đơn chi tiết và Sản phẩm gồm các cột 
--sau: maHoaDon, ngayMua, tenSP, donGia, soLuong mua trong hoá đơn, thành 
--tiền. Với thành tiền= donGia* soLuong 
select Hoa_Don.MaHD,NgayMuaHang,TenSP,DonGia,San_Pham.SoLuong,
DonGia*San_Pham.SoLuong as N'thành tiền' from Hoa_Don
inner join Hoa_Don_Chi_Tiet
on Hoa_Don.MaHD = Hoa_Don_Chi_Tiet.MaHD
inner join San_Pham
on  San_Pham.MaSP = Hoa_Don_Chi_Tiet.MaSP

--d. Hiển thị thông tin từ bảng khách hàng, bảng hoá đơn, hoá đơn chi tiết gồm các 
--cột: họ và tên khách hàng, email, điện thoại, mã hoá đơn, trạng thái hoá đơn và 
--tổng tiền đã mua trong hoá đơn. Chỉ hiển thị thông tin các hoá đơn chưa thanh 
--toán.
select HoKH+' '+TenKH as 'ho va ten',Email,SDT,Hoa_Don.MaHD,TrangThai,
DonGia*San_Pham.SoLuong as N'thành tiền'from Khach_Hang
inner join Hoa_Don
on Khach_Hang.MaKH = Hoa_Don.MaKH
inner join Hoa_Don_Chi_Tiet
on Hoa_Don.MaHD = Hoa_Don_Chi_Tiet.MaHD
inner join San_Pham
on San_Pham.MaSP = Hoa_Don_Chi_Tiet.MaSP
where TrangThai like N'chưa%'

--e. Hiển thị maHoaDon, ngàyMuahang, tổng số tiền đã mua trong từng hoá đơn. Chỉ
--hiển thị những hóa đơn có tổng số tiền >=500.000 và sắp xếp theo thứ tự giảm dần 
--của cột tổng tiền.
select Hoa_Don.MaHD,NgayMuaHang,SUM(Hoa_Don_Chi_Tiet.SoLuong* DonGia) as 'TongTien' from Hoa_Don
inner join Hoa_Don_Chi_Tiet
on Hoa_Don.MaHD = Hoa_Don_Chi_Tiet.MaHD
inner join San_Pham
on Hoa_Don_Chi_Tiet.MaSP = San_Pham.MaSP
group by Hoa_Don.MaHD,NgayMuaHang
having SUM(Hoa_Don_Chi_Tiet.SoLuong* DonGia) >=50000
order by TongTien desc