
-- tao rang buoc unique
alter table Nhan_Vienx
add constraint Nhan_Vien_UND_Email
unique (Email);

-- lien ket bang
alter table Quan_Li_DuAnx
add constraint QLDA_DA_DEFT_FK
foreign key (MaDuAn)
references Du_Anx(MaDuAn)

alter table Quan_Li_DuAnx
add constraint QLDANV_DEFT_FK
foreign key (MaNV)
references Nhan_Vienx (MaNV)

alter table Nhan_Vienx
add constraint NVPB_DEPT_FK
foreign key(MaPB)
references Phong_Banx(MaPB)