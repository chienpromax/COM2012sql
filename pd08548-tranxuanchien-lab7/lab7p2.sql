--a. Cập nhật lại thông tin số điện thoại của khách hàng có mã ‘KH002’ có giá trị mới 
--là ‘16267788989’
update Khach_Hang
set SDT = '16267788989'
where MaKH = '2'

--b. Tăng số lượng mặt hàng có mã ‘3’ lên thêm ‘200’ đơn vị
update San_Pham
set SoLuong = SoLuong+200
where MaSP='3'

--c. Giảm giá cho tất cả sản phẩm giảm 5%
update San_Pham
set DonGia = DonGia * DonGia*0.05

--d. Tăng số lượng của mặt hàng bán chạy nhất trong tháng 12/2016 lên 100 đơn vị
select top 1 MaSP from Hoa_Don_Chi_Tiet
inner join Hoa_Don
on Hoa_Don.MaHD = Hoa_Don_Chi_Tiet.MaHD
where YEAR(NgayMuaHang)='2023' and MONTH (NgayMuaHang)='12'
group by MaSP
order by SUM(SoLuong) desc

update San_Pham
set SoLuong = SoLuong+100
where MaSP in(select top 1 MaSP from Hoa_Don_Chi_Tiet
inner join Hoa_Don
on Hoa_Don.MaHD = Hoa_Don_Chi_Tiet.MaHD
where YEAR(NgayMuaHang)='2023' and MONTH (NgayMuaHang)='12'
group by MaSP
order by SUM(SoLuong) desc)

--e. Giảm giá 10% cho 2 sản phẩm bán ít nhất trong năm 2016
select top 2 MaSP from Hoa_Don_Chi_Tiet
inner join Hoa_Don
on Hoa_Don.MaHD = Hoa_Don_Chi_Tiet.MaHD
where YEAR(NgayMuaHang)='2023'
group by MaSP
order by SUM(SoLuong) asc

update San_Pham
set SoLuong = SoLuong-SoLuong*0.1
where MaSP in (select top 2 MaSP from Hoa_Don_Chi_Tiet
inner join Hoa_Don
on Hoa_Don.MaHD = Hoa_Don_Chi_Tiet.MaHD
where YEAR(NgayMuaHang)='2023'
group by MaSP
order by SUM(SoLuong) asc)

--f. Cập nhật lại trạng thái “đã thanh toán” cho hoá đơn có mã 120956 
update Hoa_Don
set TrangThai = N'Đã Thanh Toán'
where MaHD='1'

--g. Xoá mặt hàng có mã sản phẩm là ‘2’ ra khỏi hoá đơn ‘120956’ và trạng thái là 
--chưa thanh toán.
delete from Hoa_Don_Chi_Tiet
where MaSP= '2' and MaHD in (
select Hoa_Don_Chi_Tiet.MaHD from Hoa_Don_Chi_Tiet
inner join Hoa_Don
on Hoa_Don.MaHD = Hoa_Don_Chi_Tiet.MaHD
where Hoa_Don_Chi_Tiet.MaHD='2' and TrangThai = N'Chưa Thanh Toán')

--h. Xoá khách hàng chưa từng mua hàng kể từ ngày “1-1-2023
delete from Khach_Hang
where MaKH not in (select Hoa_Don.MaKH from Hoa_Don
inner join Khach_Hang on Khach_Hang.MaKH = Hoa_Don.MaKH
where NgayMuaHang >= '2023-01-01')

select Hoa_Don.MaKH from Hoa_Don
inner join Khach_Hang on Khach_Hang.MaKH = Hoa_Don.MaKH
where NgayMuaHang >= '2023-01-01'
