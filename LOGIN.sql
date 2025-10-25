--Tạo 3 tài khoản login :quantri,gv1,sv1
--tương ứng 3 tài khoản login trên tạo 3 user 
--Cấp quyền : 
--quantri toàn quyền trên các bảng , riêng bảng Diem toàn quyền trên cột Diemthi 
--Gv1 :INSERT , UPDATE , DELETE , SELECT , TRÊN CÁC  bảng : Diem(Masv , MaM , Ngyahoc , DiemCC, DiemGK )
--Sv1 : xem dữ liệu trên các bảng 



--Tạo 3 tài khoản login :quantri,gv1,sv1

create login quantri 
with password  ='quantri'

create login gv1 
with password ='gv1'

create login sv1 
with password ='sv1'

--tương ứng 3 tài khoản login trên tạo 3 user 

create user quantri for login quantri
create user gv1 for login gv1
create user sv1 for login sv1

--TEST :cấp quyền truy cập data 
USE QuanlythuvienTH1;
CREATE USER quantri FOR LOGIN quantri;
--tước quyền truy cập data
USE QuanlythuvienTH1;
DROP USER quantri;


--Cấp quyền : 
--quantri toàn quyền trên các bảng , riêng bảng Diem toàn quyền trên cột Diemthi 
GRANT all ON[dbo].[Khoa] TO quantri;
GRANT all ON [dbo].[Lop] TO quantri;
GRANT all ON [dbo].[Mon] TO quantri;
GRANT all ON [dbo].[SinhVien] TO quantri;

--
grant all on [dbo].[Diem](DiemThi) to quantri

--Gv1 :INSERT , UPDATE , DELETE , SELECT , TRÊN CÁC  bảng : Diem(Masv , MaM , Ngayhoc , DiemCC, DiemGK )
GRANT all ON[dbo].[Khoa] TO gv1;
GRANT all ON [dbo].[Lop] TO gv1;
GRANT all ON [dbo].[Mon] TO gv1;
GRANT all ON [dbo].[SinhVien] TO gv1;

GRANT SELECT (Masv, MaM, Ngayhoc, DiemCC, DiemGK) ON dbo.Diem TO gv1;
GRANT UPDATE (Masv, MaM, Ngayhoc, DiemCC, DiemGK) ON dbo.Diem TO gv1;
GRANT INSERT ON dbo.Diem TO gv1;
GRANT DELETE ON dbo.Diem TO gv1;

--Sv1 : xem dữ liệu trên các bảng 
GRANT Select ON[dbo].[Khoa] TO sv1;
GRANT Select ON [dbo].[Lop] TO sv1;
GRANT Select ON [dbo].[Mon] TO sv1;
GRANT Select ON [dbo].[SinhVien] TO sv1;
GRANT Select ON [dbo].[Diem] TO sv1;
--Kiểm tra login và thực thi các quyền 
--kiểm tra login và thực thi các quyền người dùng đã cấp 

--tạo role giangvien , sinhvien: cấp quyền cho role giangvien và sinhvien 
create role giangvien
create role sinhvien
--gianvien
GRANT all ON[dbo].[Khoa] TO  giangvien ;
GRANT all ON [dbo].[Lop] TO giangvien;
GRANT all ON [dbo].[Mon] TO giangvien;
GRANT all ON [dbo].[SinhVien] TO giangvien;

GRANT SELECT (Masv, MaM, Ngayhoc, DiemCC, DiemGK) ON dbo.Diem TO giangvien;
GRANT UPDATE (Masv, MaM, Ngayhoc, DiemCC, DiemGK) ON dbo.Diem TO giangvien;
GRANT INSERT ON dbo.Diem TO giangvien;
GRANT DELETE ON dbo.Diem TO giangvien;
--sinhvien
GRANT Select ON[dbo].[Khoa] TO sinhvien;
GRANT Select ON [dbo].[Lop] TO sinhvien;
GRANT Select ON [dbo].[Mon] TO sinhvien;
GRANT Select ON [dbo].[SinhVien] TO sinhvien;
GRANT Select ON [dbo].[Diem] TO sinhvien;


--tạo thêm gv2 , sv2 
create login gv2 
with password ='gv2'
create login sv2
with password ='sv2'

create user gv2 for login  gv2
create user sv2 for login sv2 

--thêm user gv1,gv2 vào role giangvien 
ALTER ROLE giangvien ADD MEMBER gv1
ALTER ROLE giangvien ADD MEMBER gv2

--đưa user sv1 ,sv2 vào role sinhvien
ALTER ROLE sinhvien ADD MEMBER sv1
ALTER ROLE sinhvien ADD MEMBER sv2
