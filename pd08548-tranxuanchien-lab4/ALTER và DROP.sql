-- th�m c0t dia ch?
alter table dbo.Phong_Ban
add DiaChi nvarchar (200)

--x�a cot dia ch?
alter table dbo.Phong_Ban
drop column DiaChi

alter table Nhan_Vien
add Email nvarchar(150)

alter table dbo.Nhan_Vien
add constraint Check_Salary_min
check (luong>=100)