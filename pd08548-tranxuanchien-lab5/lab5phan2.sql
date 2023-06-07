--a. Hiển thị số lượng khách hàng có trong bảng khách hàng
select count(*) from Khach_Hang

--b. Hiển thị đơn giá lớn nhất trong bảng SanPham
select MAX(DonGia) from San_Pham

--c. Hiển thị số lượng sản phẩm thấp nhất trong bảng sản phẩm
select MIN(SoLuong) from San_Pham

--d. Hiển thị tổng tất cả số lượng sản phẩm có trong bảng sản phẩm
select SUM(SoLuong) from San_Pham


--e. Hiển thị số hoá đơn đã xuất trong tháng 9/2023 và 12/2023 mà 
--có trạng thái chưa thanh toán
select * from Hoa_Don
where NgayMuaHang >='2023-9-1' and NgayMuaHang<='2023-12-31'
and TrangThai like N'Chưa%'

--f. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn.
select MaHD,MaSP from Hoa_Don_Chi_Tiet

--g. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn. Yêu cầu 
--chỉ hiển thị hàng nào có số loại sản phẩm được mua >=5.
select MaHD,MaSP from Hoa_Don_Chi_Tiet
where MaSP>=5

--h. Hiển thị thông tin bảng HoaDon gồm các cột maHoaDon, ngayMuaHang, 
--maKhachHang. Sắp xếp theo thứ tự giảm dần của ngayMuaHang
select MaHD,NgayMuaHang,MaKH from Hoa_Don
order by NgayMuaHang desc