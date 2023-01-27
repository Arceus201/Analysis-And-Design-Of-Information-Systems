create database thong_tin_mon_an;
use thong_tin_mon_an;
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

ALTER TABLE MonAnTrongComBo  WITH CHECK ADD  CONSTRAINT FK_MonAnTrongComBo_MonAn FOREIGN KEY(id)
REFERENCES MonAn (id)

ALTER TABLE MonAnTrongComBo  WITH CHECK ADD  CONSTRAINT FK_MonAnTrongComBo_ComBo FOREIGN KEY(id)
REFERENCES ComBo (id)

INSERT MonAn(id,ten,loai,gia,uudai,mota)
VALUES(001,N'cơm gà',N'1',50000,0,N'cidjdsjfd');
INSERT MonAn(id,ten,loai,gia,uudai,mota)
VALUES(002,N'cơm sườn',N'2',55000,0,N'cidjdsjfd');
INSERT MonAn(id,ten,loai,gia,uudai,mota)
VALUES(003,N'gà rán',N'1',80000,0,N'cidjdsjfd');
INSERT MonAn(id,ten,loai,gia,uudai,mota)
VALUES(004,N'gà nướng',N'3',100000,0,N'cidjdsjfd');
INSERT MonAn(id,ten,loai,gia,uudai,mota)
VALUES(005,N'sườn nướng',N'1',100000,0,N'cidjdsjfd');
INSERT MonAn(id,ten,loai,gia,uudai,mota)
VALUES(006,N'cơm gà quay',N'2',60000,0,N'cidjdsjfd');
INSERT MonAn(id,ten,loai,gia,uudai,mota)
VALUES(007,N'gà luộc',N'1',150000,0,N'cidjdsjfd');
INSERT MonAn(id,ten,loai,gia,uudai,mota)
VALUES(008,N'nộm gà',N'3',50000,0,N'cidjdsjfd');
INSERT MonAn(id,ten,loai,gia,uudai,mota)
VALUES(009,N'sườn xào cay',N'1',80000,0,N'cidjdsjfd');
INSERT MonAn(id,ten,loai,gia,uudai,mota)
VALUES(010,N'canh gà',N'3',50000,0,N'cidjdsjfd');

-- 001 - 010
INSERT ComBo(id,ten,loai,gia,uudai,mota)
VALUES(001,N'ComBo gà 1 người',N'3',80000,0,N'cidjdsjfd');
INSERT ComBo(id,ten,loai,gia,uudai,mota)
-- 2 001 - 1 010 - 1 008
VALUES(002,N'ComBo gà 2 người',N'3',200000,0,N'cidjdsjfd');
-- 4 001 + 1 007 + 1 008 + 1 010
INSERT ComBo(id,ten,loai,gia,uudai,mota)
VALUES(003,N'ComBo gà 4 người',N'3',400000,0,N'cidjdsjfd');

-- 002 009
INSERT ComBo(id,ten,loai,gia,uudai,mota)
VALUES(004,N'ComBo sườn 1 người',N'3',100000,0,N'cidjdsjfd');
INSERT ComBo(id,ten,loai,gia,uudai,mota)
-- 2 002 009 005
VALUES(005,N'ComBo sườn 2 người',N'3',240000,0,N'cidjdsjfd');



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

--  tìm các món ăn và combo với từ khóa là 'gà'
select id,ten
from MonAn 
where ten Like '%gà%';
select id,ten
from ComBo 
where ten Like '%gà%';

-- xem thong tin mon an
select * from MonAn where id = 001

-- xem thong tin combo
select * from ComBo where id =001
-- xem danh sách món ăn trong combo đó
select ma.id,ma.ten, x.soluong
from MonAn ma, MonAnTrongComBo x
where x.idcombo = 001 and x.idmonan = ma.id