
-- Bài 44
use master
go
create database QLSinhVien_HocDDL
go

-- Bài 45
use QLSinhVien_HocDDL
go
create table dbo.Khoa(
	MaKhoa nvarchar(8) NOT NULL,
	TenKhoa nvarchar(50) NULL,
	NgayThanhLap date NULL,
	GhiChu ntext NULL,
	PRIMARY KEY (MaKhoa)
)
go

-- Bài 46
use QLSinhVien_HocDDL
go
create table dbo.Lop(
	MaLop nvarchar(8) NOT NULL,
	TenLop nvarchar(50) NULL,
	GVCN nvarchar(100) NULL,
	MaKhoa nvarchar(8) NULL,
	GhiChu ntext NULL,
	PRIMARY KEY (MaLop),
	FOREIGN KEY(MaKhoa) REFERENCES dbo.Khoa (MaKhoa)
)
go

-- Bài 47
use QLSinhVien_HocDDL
go
create table dbo.SinhVien(
	MaSV nvarchar(10) NOT NULL,
	HoSV nvarchar(50) NULL,
	TenSV nvarchar(20) NULL,
	GioiTinh nvarchar(50) NULL,
	NgaySinh datetime NULL,
	DiaChi nvarchar(100) NULL,
	MaLop nvarchar(8) NULL,
	QueQuan nvarchar(50) NULL,
	DienThoaiDD nvarchar(12) NULL,
	GhiChu ntext NULL
	PRIMARY KEY (MaSV),
	FOREIGN KEY (MaLop) REFERENCES dbo.Lop (MaLop)
)
go

-- Bài 48
use QLSinhVien_HocDDL
go
create table dbo.MonHoc(
	MaMH int NOT NULL,
	TenMH nvarchar(50) NULL,
	SoTinChi float NULL,
	MaKhoaPhuTrach nvarchar(8) NULL,
	GhiChu ntext NULL,
	PRIMARY KEY (MaMH),
	FOREIGN KEY (MaKhoaPhuTrach) REFERENCES dbo.Khoa(MaKhoa)
)
go

-- Bài 49
use QLSinhVien_HocDDL
go
create table dbo.Hoc(
	MaMH int NOT NULL,
	MaSV nvarchar(10) NOT NULL,
	NgayDangKyMH date NOT NULL,
	DiemTrungBinhMH float NULL,
	GhiChu ntext NOT NULL,
	PRIMARY KEY (MaMH, MaSV, NgayDangKyMH),
	FOREIGN KEY (MaMH) REFERENCES dbo.MonHoc(MaMH),
	FOREIGN KEY (MaSV) REFERENCES dbo.SinhVien (MaSV)
)
go


-- Bài 50
use QLSinhVien_HocDDL
go
drop table dbo.Hoc
go
drop table dbo.SinhVien
go
drop table dbo.MonHoc
go
drop table dbo.Lop
go
drop table dbo.Khoa
go