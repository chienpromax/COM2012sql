-- thêm c0t dia ch?
alter table Phong_Ban
add DiaChi nvarchar (200)
alter table Nhan_Vien
add Email nvarchar(150)

--xóa cot dia ch?
alter table dbo.Phong_Ban
drop column DiaChi

alter table dbo.Nhan_Vien
add constraint Check_Salary_min
check (luong>=100)

--constraint rằng buộc
--Hiển thị 10 khách hàng đầu tiên trong bảng khách hàng bao gồm các cột: mã 
--khách hàng, họ và tên, email, số điện thoại
select top 10 MaKH, HoKH+' '+TenKH as'ho va ten',Email,SDT from Khach_Hang 
where MaKH <=10

--Hiển thị số lượng khách hàng có trong bảng khách hàng
select count(*) from Khach_Hang
--Hiển thị đơn giá lớn nhất trong bảng SanPham
select MAX(DonGia) from San_Pham
--Hiển thị số lượng sản phẩm thấp nhất trong bảng sản phẩm
select MIN(SoLuong) from San_Pham
--Hiển thị tổng tất cả số lượng sản phẩm có trong bảng sản phẩm
select SUM(SoLuong) from San_Pham
--Hiển thị 10% hàng đầu tiên trong bảng nhân viên
 SELECT TOP 5 PERCENT * FROM NHAN_VIEN


--Hiển thị maHoaDon, ngàyMuahang, tổng số tiền đã mua trong từng hoá đơn. Chỉ
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
--Mệnh đề HAVING đi kèm với GROUP BY giúp loại 
--bỏ các nhóm không thoã mãn điều kiện
--Ví dụ:
--SELECT MAX(LUONG) AS 'Luong cao nhat ', PHG
--as 'MA PHONG BAN' from NHAN_VIEN GROUP 
--BY PHG HAVING MAX(LUONG) >1000 ;

--Hiển thị tên sản phẩm có lượt đặt mua nhỏ hơn lượt mua trung bình các các sản 
--phẩm.
select * from San_Pham
where SoLuong<(select AVG(SoLuong) from San_Pham)

--Cập nhật lại thông tin số điện thoại của khách hàng có mã ‘KH002’ có giá trị mới 
--là ‘16267788989’
update Khach_Hang
set SDT = '16267788989'
where MaKH = '2'

