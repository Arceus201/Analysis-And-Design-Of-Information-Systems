create database thong_ke_mon_an_theo_doanh_thu;
use thong_ke_mon_an_theo_doanh_thu;
CREATE TABLE MonAn(
	id int NOT NULL,
	ten nvarchar(50) NOT NULL,
    loai nvarchar(50),
	gia int not null,
	uudai int,
	mota varchar(100),
	CONSTRAINT PK_MonAn PRIMARY KEY CLUSTERED (id ASC)
)

CREATE TABLE ComBo(
	id int NOT NULL,
	ten nvarchar(50) NOT NULL,
    loai nvarchar(50),
	gia int not null,
	uudai int,
	mota varchar(100),
	CONSTRAINT PK_ComBo PRIMARY KEY CLUSTERED (id ASC)
)

CREATE TABLE MonAnTrongComBo(
	id int NOT NULL,
	idmonan int not null,
	idcombo int not null,
	soluong int not null,
	CONSTRAINT PK_MonAnTrongComBo PRIMARY KEY CLUSTERED (id ASC)
)
CREATE TABLE MonAnDat(
	id int NOT NULL,
	soluong int not null,
	mota varchar(100),
	idmonan int not null,
	idbandat int not null,
	CONSTRAINT PK_MonAnDat PRIMARY KEY CLUSTERED (id ASC)
)

CREATE TABLE ComBoDat(
	id int NOT NULL,
	soluong int not null,
	mota varchar(100),
	idcombo int not null,
	idbandat int not null,
	CONSTRAINT PK_ComBoDat PRIMARY KEY CLUSTERED (id ASC)
)
CREATE TABLE BanDat(
	id int NOT NULL,
	idban int not null,
	idphieudatban int not null,
	thoigianbatdau datetime,
	thoigiankethuc datetime,
	ghichu  varchar(100),
	CONSTRAINT PK_BanDat PRIMARY KEY CLUSTERED (id ASC)
)

CREATE TABLE Ban(
	id int NOT NULL,
	vitri varchar(10) not null,
	giacoc int not null,
	sochongoi int,
	CONSTRAINT PK_Ban PRIMARY KEY CLUSTERED (id ASC)
)
CREATE TABLE PhieuDatBan(
	id int NOT NULL,
	ngaydat datetime,
	hinhthucdat int,
	CONSTRAINT Pk_PhieuDatBan PRIMARY KEY CLUSTERED (id ASC)
)

CREATE TABLE HoaDon(
	id int NOT NULL,
	thoigianthanhtoan datetime,
	tonggia int,
	uudai int,
	CONSTRAINT Pk_HoaDon PRIMARY KEY CLUSTERED (id ASC)
)

-- khoa ngoai bang MonAnTrongComBo
ALTER TABLE MonAnTrongComBo  WITH CHECK ADD  CONSTRAINT FK_MonAnTrongComBo_MonAn FOREIGN KEY(idmonan)
REFERENCES MonAn (id)

ALTER TABLE MonAnTrongComBo  WITH CHECK ADD  CONSTRAINT FK_MonAnTrongComBo_ComBo FOREIGN KEY(idcombo)
REFERENCES ComBo (id)

-- KhoaNgoaiBang MonAnDat
ALTER TABLE MonAnDat  WITH CHECK ADD  CONSTRAINT FK_MonAnDat_MonAn FOREIGN KEY(idmonan)
REFERENCES MonAn (id)

ALTER TABLE MonAnDat  WITH CHECK ADD  CONSTRAINT FK_MonAnDat_BanDat FOREIGN KEY(idbandat)
REFERENCES BanDat (id)

-- KhoaNgoaiBang ComBoDat
ALTER TABLE ComBoDat  WITH CHECK ADD  CONSTRAINT FK_ComBoDat_MonAn FOREIGN KEY(idcombo)
REFERENCES ComBo (id)

ALTER TABLE ComBoDat  WITH CHECK ADD  CONSTRAINT FK_ComBoDat_BanDat FOREIGN KEY(idbandat)
REFERENCES BanDat (id)

-- KhoaNgoaiBang BanDat
ALTER TABLE BanDat  WITH CHECK ADD  CONSTRAINT FK_BanDat_PhieuDatBan FOREIGN KEY(idphieudatban)
REFERENCES PhieuDatBan (id)

ALTER TABLE BanDat  WITH CHECK ADD  CONSTRAINT FK_BanDat_Ban FOREIGN KEY(idban)
REFERENCES Ban (id)

-- kho ke thua tron bang hoa don
ALTER TABLE HoaDon  WITH CHECK ADD  CONSTRAINT FK_HoaDon_PhieuDatBan FOREIGN KEY(id)
REFERENCES PhieuDatBan (id)
-- mon an

INSERT MonAn(id,ten,loai,gia,uudai,mota)
VALUES(001,N'com gà',N'1',50000,0,N'cidjdsjfd');
INSERT MonAn(id,ten,loai,gia,uudai,mota)
VALUES(002,N'com su?n',N'2',55000,0,N'cidjdsjfd');
INSERT MonAn(id,ten,loai,gia,uudai,mota)
VALUES(003,N'gà rán',N'1',80000,0,N'cidjdsjfd');
INSERT MonAn(id,ten,loai,gia,uudai,mota)
VALUES(004,N'gà nu?ng',N'3',100000,0,N'cidjdsjfd');
INSERT MonAn(id,ten,loai,gia,uudai,mota)
VALUES(005,N'su?n nu?ng',N'1',100000,0,N'cidjdsjfd');
INSERT MonAn(id,ten,loai,gia,uudai,mota)
VALUES(006,N'com gà quay',N'2',60000,0,N'cidjdsjfd');
INSERT MonAn(id,ten,loai,gia,uudai,mota)
VALUES(007,N'gà lu?c',N'1',150000,0,N'cidjdsjfd');
INSERT MonAn(id,ten,loai,gia,uudai,mota)
VALUES(008,N'n?m gà',N'3',50000,0,N'cidjdsjfd');
INSERT MonAn(id,ten,loai,gia,uudai,mota)
VALUES(009,N'su?n xào cay',N'1',80000,0,N'cidjdsjfd');
INSERT MonAn(id,ten,loai,gia,uudai,mota)
VALUES(010,N'canh gà',N'3',50000,0,N'cidjdsjfd');

-- combo
-- 001 - 010
INSERT ComBo(id,ten,loai,gia,uudai,mota)
VALUES(001,N'ComBo gà 1 ngu?i',N'3',80000,0,N'cidjdsjfd');
INSERT ComBo(id,ten,loai,gia,uudai,mota)
-- 2 001 - 1 010 - 1 008
VALUES(002,N'ComBo gà 2 ngu?i',N'3',200000,0,N'cidjdsjfd');
-- 4 001 + 1 007 + 1 008 + 1 010
INSERT ComBo(id,ten,loai,gia,uudai,mota)
VALUES(003,N'ComBo gà 4 ngu?i',N'3',400000,0,N'cidjdsjfd');

-- 002 009
INSERT ComBo(id,ten,loai,gia,uudai,mota)
VALUES(004,N'ComBo su?n 1 ngu?i',N'3',100000,0,N'cidjdsjfd');
INSERT ComBo(id,ten,loai,gia,uudai,mota)
-- 2 002 009 005
VALUES(005,N'ComBo su?n 2 ngu?i',N'3',240000,0,N'cidjdsjfd');


-- monan torng combo
INSERT MonAnTrongComBo(id,idmonan,idcombo,soluong)
VALUES(001,001,001,1);
INSERT MonAnTrongComBo(id,idmonan,idcombo,soluong)
VALUES(002,010,001,1);
INSERT MonAnTrongComBo(id,idmonan,idcombo,soluong)
VALUES(003,001,002,2);
INSERT MonAnTrongComBo(id,idmonan,idcombo,soluong)
VALUES(004,010,002,1);
INSERT MonAnTrongComBo(id,idmonan,idcombo,soluong)
VALUES(005,008,002,1);
INSERT MonAnTrongComBo(id,idmonan,idcombo,soluong)
VALUES(006,001,003,4);
INSERT MonAnTrongComBo(id,idmonan,idcombo,soluong)
VALUES(007,007,003,1);
INSERT MonAnTrongComBo(id,idmonan,idcombo,soluong)
VALUES(008,008,003,1);
INSERT MonAnTrongComBo(id,idmonan,idcombo,soluong)
VALUES(009,010,003,1);
INSERT MonAnTrongComBo(id,idmonan,idcombo,soluong)
VALUES(010,002,004,1);
INSERT MonAnTrongComBo(id,idmonan,idcombo,soluong)
VALUES(011,009,004,1);
INSERT MonAnTrongComBo(id,idmonan,idcombo,soluong)
VALUES(012,002,005,2);
INSERT MonAnTrongComBo(id,idmonan,idcombo,soluong)
VALUES(013,009,005,1);
INSERT MonAnTrongComBo(id,idmonan,idcombo,soluong)
VALUES(014,005,005,1);

-- ban
INSERT Ban(id,vitri,giacoc,sochongoi)
VALUES(001,'101',100,2);
INSERT Ban(id,vitri,giacoc,sochongoi)
VALUES(002,'102',100,2);
INSERT Ban(id,vitri,giacoc,sochongoi)
VALUES(003,'103',100,2);
INSERT Ban(id,vitri,giacoc,sochongoi)
VALUES(004,'104',100,2);
INSERT Ban(id,vitri,giacoc,sochongoi)
VALUES(005,'105',100,2);
INSERT Ban(id,vitri,giacoc,sochongoi)
VALUES(006,'106',150,4);
INSERT Ban(id,vitri,giacoc,sochongoi)
VALUES(007,'107',150,4);
INSERT Ban(id,vitri,giacoc,sochongoi)
VALUES(008,'108',150,4);
INSERT Ban(id,vitri,giacoc,sochongoi)
VALUES(009,'109',200,6);
INSERT Ban(id,vitri,giacoc,sochongoi)
VALUES(010,'110',200,6);
INSERT Ban(id,vitri,giacoc,sochongoi)
VALUES(011,'201',100,2);
INSERT Ban(id,vitri,giacoc,sochongoi)
VALUES(012,'202',100,2);
INSERT Ban(id,vitri,giacoc,sochongoi)
VALUES(013,'203',100,2);
INSERT Ban(id,vitri,giacoc,sochongoi)
VALUES(014,'204',100,2);
INSERT Ban(id,vitri,giacoc,sochongoi)
VALUES(015,'205',100,2);
INSERT Ban(id,vitri,giacoc,sochongoi)
VALUES(016,'206',150,4);
INSERT Ban(id,vitri,giacoc,sochongoi)
VALUES(017,'207',150,4);
INSERT Ban(id,vitri,giacoc,sochongoi)
VALUES(018,'208',200,6);
INSERT Ban(id,vitri,giacoc,sochongoi)
VALUES(019,'209',200,6);
INSERT Ban(id,vitri,giacoc,sochongoi)
VALUES(020,'210',200,6);

--- phieu dat ban
--2008-11-11 13:23:44
INSERT PhieuDatBan(id,ngaydat,hinhthucdat)
VALUES(001,'2022-11-24 08:00:00',1);
INSERT PhieuDatBan(id,ngaydat,hinhthucdat)
VALUES(002,'2022-11-24 09:00:00',2);
INSERT PhieuDatBan(id,ngaydat,hinhthucdat)
VALUES(003,'2022-11-24 10:00:00',1);
INSERT PhieuDatBan(id,ngaydat,hinhthucdat)
VALUES(004,'2022-11-24 11:00:00',2);
INSERT PhieuDatBan(id,ngaydat,hinhthucdat)
VALUES(005,'2022-11-24 12:00:00',1);
INSERT PhieuDatBan(id,ngaydat,hinhthucdat)
VALUES(006,'2022-11-25 08:00:00',2);
INSERT PhieuDatBan(id,ngaydat,hinhthucdat)
VALUES(007,'2022-11-25 09:00:00',1);
INSERT PhieuDatBan(id,ngaydat,hinhthucdat)
VALUES(008,'2022-11-25 10:00:00',2);
INSERT PhieuDatBan(id,ngaydat,hinhthucdat)
VALUES(009,'2022-11-25 11:00:00',1);
INSERT PhieuDatBan(id,ngaydat,hinhthucdat)
VALUES(010,'2022-11-25 12:00:00',2);

--- hoadon
--2008-11-11 13:23:44
INSERT HoaDon(id,thoigianthanhtoan,uudai)
VALUES(001,'2022-11-24 12:00:00',1);
INSERT HoaDon(id,thoigianthanhtoan,uudai)
VALUES(002,'2022-11-24 12:30:00',2);
INSERT HoaDon(id,thoigianthanhtoan,uudai)
VALUES(003,'2022-11-24 12:30:00',1);
INSERT HoaDon(id,thoigianthanhtoan,uudai)
VALUES(004,'2022-11-24 20:00:00',2);
INSERT HoaDon(id,thoigianthanhtoan,uudai)
VALUES(005,'2022-11-24 20:15:00',1);
INSERT HoaDon(id,thoigianthanhtoan,uudai)
VALUES(006,'2022-11-25 12:00:00',2);
INSERT HoaDon(id,thoigianthanhtoan,uudai)
VALUES(007,'2022-11-25 12:30:00',1);
INSERT HoaDon(id,thoigianthanhtoan,uudai)
VALUES(008,'2022-11-25 12:15:00',2);
INSERT HoaDon(id,thoigianthanhtoan,uudai)
VALUES(009,'2022-11-25 20:00:00',1);
INSERT HoaDon(id,thoigianthanhtoan,uudai)
VALUES(010,'2022-11-25 20:15:00:00',2);

-- bandat
INSERT BanDat(id,idban,idphieudatban,thoigianbatdau,thoigiankethuc,ghichu)
VALUES(001,001,001,'2022-11-24 11:00:00','2022-11-24 12:00:00',N'jsjaasakscas');
INSERT BanDat(id,idban,idphieudatban,thoigianbatdau,thoigiankethuc,ghichu)
VALUES(002,002,002,'2022-11-24 11:30:00','2022-11-24 12:30:00',N'jsjaasakscas');
INSERT BanDat(id,idban,idphieudatban,thoigianbatdau,thoigiankethuc,ghichu)
VALUES(003,007,003,'2022-11-24 11:00:00','2022-11-24 12:30:00',N'jsjaasakscas');
INSERT BanDat(id,idban,idphieudatban,thoigianbatdau,thoigiankethuc,ghichu)
VALUES(004,11,004,'2022-11-24 17:00:00','2022-11-24 20:00:00',N'jsjaasakscas');
INSERT BanDat(id,idban,idphieudatban,thoigianbatdau,thoigiankethuc,ghichu)
VALUES(005,19,005,'2022-11-24 17:00:00','2022-11-24 20:15:00',N'jsjaasakscas');
INSERT BanDat(id,idban,idphieudatban,thoigianbatdau,thoigiankethuc,ghichu)
VALUES(006,11,006,'2022-11-25 11:00:00','2022-11-25 12:00:00',N'jsjaasakscas');
INSERT BanDat(id,idban,idphieudatban,thoigianbatdau,thoigiankethuc,ghichu)
VALUES(007,001,007,'2022-11-25 11:00:00','2022-11-25 12:30:00',N'jsjaasakscas');
INSERT BanDat(id,idban,idphieudatban,thoigianbatdau,thoigiankethuc,ghichu)
VALUES(008,14,008,'2022-11-25 11:15:00','2022-11-25 12:15:00',N'jsjaasakscas');
INSERT BanDat(id,idban,idphieudatban,thoigianbatdau,thoigiankethuc,ghichu)
VALUES(009,7,009,'2022-11-25 18:30:00','2022-11-25 20:00:00',N'jsjaasakscas');
INSERT BanDat(id,idban,idphieudatban,thoigianbatdau,thoigiankethuc,ghichu)
VALUES(010,4,010,'2022-11-25 17:00:00','2022-11-25 20:15:00:00',N'jsjaasakscas');


-- MonDat---
INSERT MonAnDat(id,idmonan,idbandat,soluong,mota)
VALUES(001,1,1,1,N'jsjaasakscas');
INSERT MonAnDat(id,idmonan,idbandat,soluong,mota)
VALUES(002,10,1,1,N'jsjaasakscas');

INSERT MonAnDat(id,idmonan,idbandat,soluong,mota)
VALUES(003,2,2,2,N'jsjaasakscas');
INSERT MonAnDat(id,idmonan,idbandat,soluong,mota)
VALUES(004,8,2,1,N'jsjaasakscas');

INSERT MonAnDat(id,idmonan,idbandat,soluong,mota)
VALUES(005,4,4,1,N'jsjaasakscas');

INSERT MonAnDat(id,idmonan,idbandat,soluong,mota)
VALUES(006,6,6,2,N'jsjaasakscas');

INSERT MonAnDat(id,idmonan,idbandat,soluong,mota)
VALUES(007,3,7,2,N'jsjaasakscas');

INSERT MonAnDat(id,idmonan,idbandat,soluong,mota)
VALUES(008,6,8,2,N'jsjaasakscas');
INSERT MonAnDat(id,idmonan,idbandat,soluong,mota)
VALUES(009,7,8,1,N'jsjaasakscas');


INSERT MonAnDat(id,idmonan,idbandat,soluong,mota)
VALUES(010,2,10,2,N'jsjaasakscas');
INSERT MonAnDat(id,idmonan,idbandat,soluong,mota)
VALUES(011,9,10,1,N'jsjaasakscas');

-- combo dat

INSERT ComBoDat(id,idcombo,idbandat,soluong,mota)
VALUES(001,3,3,1,N'jsjaasakscas');

INSERT ComBoDat(id,idcombo,idbandat,soluong,mota)
VALUES(002,3,5,1,N'jsjaasakscas');

INSERT ComBoDat(id,idcombo,idbandat,soluong,mota)
VALUES(003,3,9,1,N'jsjaasakscas');

INSERT ComBoDat(id,idcombo,idbandat,soluong,mota)
VALUES(004,2,1,1,N'jsjaasakscas');

INSERT ComBoDat(id,idcombo,idbandat,soluong,mota)
VALUES(005,4,4,2,N'jsjaasakscas');

INSERT ComBoDat(id,idcombo,idbandat,soluong,mota)
VALUES(006,5,6,1,N'jsjaasakscas');


-- thong ke mon an theo doanh thu
-- start: 24/11/2022 - 25/11/2022 : thong ke trong ngay 24
select DISTINCT ma.id,ma.ten,sum(mad.soluong *(ma.gia-ma.uudai)) as doanh_thu_đ
from MonAn ma, MonAnDat mad,BanDat bd, HoaDon hd
where CONVERT(VARCHAR(25), hd.thoigianthanhtoan, 126) BETWEEN '2022-11-24%' AND '2022-11-26%'
and  bd.idphieudatban = hd.id 
and mad.idbandat = bd.id
and ma.id = mad.idmonan
group by ma.id,ma.ten
order by doanh_thu_đ DESC;

-- thong ke combo theo doanh thu
select DISTINCT cb.id,cb.ten,sum(cbd.soluong *(cb.gia-cb.uudai)) as doanh_thu_đ
from ComBo cb, ComBoDat cbd,BanDat bd, HoaDon hd
where CONVERT(VARCHAR(25), hd.thoigianthanhtoan, 126) BETWEEN '2022-11-24%' AND '2022-11-26%'
and  bd.idphieudatban = hd.id 
and cbd.idbandat = bd.id
and cb.id = cbd.idcombo
group by cb.id,cb.ten
order by doanh_thu_đ DESC;


-- xem cac lan mon duoc goi
select  hd.thoigianthanhtoan,ma.id,ma.ten,mad.soluong,hd.id as id_hoa_don
from MonAn ma, MonAnDat mad,BanDat bd, HoaDon hd
where CONVERT(VARCHAR(25), hd.thoigianthanhtoan, 126) BETWEEN '2022-11-24%' AND '2022-11-26%'
and  bd.idphieudatban = hd.id 
and mad.idbandat = bd.id
and mad.idmonan = ma.id
and ma.id =2;

-- xem cac lan combo duoc goi 
select  hd.thoigianthanhtoan,cb.id,cb.ten,cbd.soluong,hd.id as id_hoa_don
from ComBo cb, ComBoDat cbd,BanDat bd, HoaDon hd
where CONVERT(VARCHAR(25), hd.thoigianthanhtoan, 126) BETWEEN '2022-11-24%' AND '2022-11-26%'
and  bd.idphieudatban = hd.id 
and cbd.idbandat = bd.id
and cbd.idcombo = cb.id
and cb.id =3;

-- in ra hoa don tuong ưng
-- in thong tin trong hoa hon
select * from HoaDon where id = 3;
select * from PhieuDatBan where id = 3;
-- in danh sach monan trong hoadon

-- in danh sach combo  va mon an trong hoa don

select DISTINCT cb.id,cb.ten, (cb.gia -cb.uudai) as don_gia,sum(cbd.soluong) as so_luong,sum(cbd.soluong*(cb.gia -cb.uudai)) as thanh_tien
from ComBo cb, ComBoDat cbd,BanDat bd, HoaDon hd
where hd.id = 6
and  bd.idphieudatban = hd.id 
and cbd.idbandat = bd.id
and cbd.idcombo = cb.id
group by cb.id,cb.ten,cb.gia -cb.uudai
order by so_luong ASC;

select DISTINCT ma.id,ma.ten, (ma.gia -ma.uudai) as don_gia,sum(mad.soluong) as so_luong,sum(mad.soluong*(ma.gia -ma.uudai)) as thanh_tien
from MonAn ma, MonAnDat mad,BanDat bd, HoaDon hd
where hd.id = 6
and  bd.idphieudatban = hd.id 
and mad.idbandat = bd.id
and mad.idmonan = ma.id
group by ma.id,ma.ten,ma.gia -ma.uudai
order by so_luong ASC;

