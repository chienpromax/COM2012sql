create table Van_Phong(
MaPB int identity(1,1),
TenPB varchar(50) null,
MaTP int not null
)
alter table Van_Phong
add constraint pri_VP
primary key (MaPB)