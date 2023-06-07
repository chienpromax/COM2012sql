--6.1 Liệt kê tất cả thông tin của các đầu sách gồm tên sách, mã sách, giá tiền , tác giả 
--thuộc loại sách có mã “IT”.
select TenSach,MaSach,GiaTien,TacGia,MaLoai from Sach
where MaLoai like 'IT'

--6.2 Liệt kê các phiếu mượn gồm các thông tin mã phiếu mượn, mã sách , ngày mượn, mã 
--sinh viên có ngày mượn trong tháng 05/2017.
select PhieuMuon.MaPM,MaSach,NgayMuon,MaSV from PhieuMuon
inner join ChiTietPM
on ChiTietPM.MaPM = PhieuMuon.MaPM
where NgayMuon >='2022-04-01' and NgayMuon <='2022-04-31'

--6.3 Liệt kê các phiếu mượn chưa trả sách cho thư viên theo thứ tự tăng dần của ngày 
--mượn sách.
select * from PhieuMuon
where TrangThai like N'Chưa Trả'
order by NgayMuon 

--6.4 Liệt kê tổng số đầu sách của mỗi loại sách ( gồm mã loại sách, tên loại sách, tổng số 
--lượng sách mỗi loại).
select Sach.MaLoai,TenLoai,COUNT(TenLoai)as N'Số Đầu Sách' from Sach
inner join LoaiSach
on LoaiSach.MaLoai = Sach.MaLoai
group by Sach.MaLoai,TenLoai

--6.5 Đếm xem có bao nhiêu lượt sinh viên đã mượn sách.
select MaSV,COUNT(MaSV)as N'Số Lượt Mượn' from PhieuMuon
group by MaSV

--6.6 Hiển thị tất cả các quyển sách có tiêu đề chứa từ khoá “SQL”.
select * from Sach
where TenSach like N'%Cơ Sở%'

--6.7 Hiển thị thông tin mượn sách gồm các thông tin: mã sinh viên, tên sinh viên, mã 
--phiếu mượn, tiêu đề sách, ngày mượn, ngày trả. Sắp xếp thứ tự theo ngày mượn sách.
select SinhVien.MaSV,TenSV,PhieuMuon.MaPM,NgayMuon,NgayTra from SinhVien
inner join PhieuMuon on SinhVien.MaSV = PhieuMuon.MaSV
inner join ChiTietPM on ChiTietPM.MaPM = PhieuMuon.MaPM
inner join Sach on Sach.MaSach = ChiTietPM.MaSach
order by NgayMuon

--6.8 Liệt kê các đầu sách có lượt mượn lớn hơn 1 lần.
select Sach.MaSach, COUNT(ChiTietPM.MaSach) from Sach
inner join ChiTietPM on ChiTietPM.MaSach = Sach.MaSach
group by Sach.MaSach
having COUNT(ChiTietPM.MaSach)>=1

--6.9 Viết câu lệnh cập nhật lại giá tiền của các quyển sách có ngày nhập kho trước năm 
--2014 giảm 30%.
select * from Sach

update Sach set GiaTien = GiaTien - GiaTien*0.3
where YEAR(NgayNhapKho) <='2022'
--6.10 Viết câu lệnh cập nhật lại trạng thái đã trả sách cho phiếu mượn của sinh viên có mã 
--sinh viên PD0122 (ví dụ).
select * from PhieuMuon

update PhieuMuon set TrangThai = N'Dẫ Trả'
where MaSV = 'PD0122'
--6.11 Lập danh sách các phiếu mượn quá hạn chưa trả gồm các thông tin: mã phiếu mượn, 
--tên sinh viên, email, danh sách các sách đã mượn, ngày mượn.
select PhieuMuon.MaPM,TenSV,Email,NgayMuon, NgayTra,TrangThai,
DATEDIFF(DAY,PhieuMuon.NgayTra,getdate()) as N'số ngày vượt'
from PhieuMuon
inner join SinhVien on SinhVien.MaSV = PhieuMuon.MaSV
where TrangThai like N'Chưa Trả%'
and DATEDIFF(DAY,PhieuMuon.NgayTra,getdate()) >=0

--6.12 Viết câu lệnh cập nhật lại số lượng bản sao tăng lên 5 đơn vị đối với các đầu sách có 
--lượt mượn lớn hơn 10
update Sach set SL = SL +5
where MaSach in (select Sach.MaSach from Sach
inner join ChiTietPM on ChiTietPM.MaSach = Sach.MaSach
group by Sach.MaSach
having COUNT(ChiTietPM.MaSach)>=1)
--6.13 Viết câu lệnh xoá các phiếu mượn có ngày mượn và ngày trả trước „1/1/2010‟delete PhieuMuonwhere MaPM = 'PM01'alter table ChiTietPMadd constraint FK_ChiTietPM_PhieuMuonforeign key (MaPM)references PhieuMuon(MaPM) on DELETE CASCADE 