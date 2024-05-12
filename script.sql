CREATE DATABASE [Quản lý trường học]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Quản lý trường học', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Quản lý trường học.mdf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Quản lý trường học_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Quản lý trường học_log.ldf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
 WITH LEDGER = OFF
GO
ALTER DATABASE [Quản lý trường học] SET COMPATIBILITY_LEVEL = 160
GO
ALTER DATABASE [Quản lý trường học] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Quản lý trường học] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Quản lý trường học] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Quản lý trường học] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Quản lý trường học] SET ARITHABORT OFF 
GO
ALTER DATABASE [Quản lý trường học] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Quản lý trường học] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Quản lý trường học] SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF)
GO
ALTER DATABASE [Quản lý trường học] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Quản lý trường học] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Quản lý trường học] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Quản lý trường học] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Quản lý trường học] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Quản lý trường học] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Quản lý trường học] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Quản lý trường học] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Quản lý trường học] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Quản lý trường học] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Quản lý trường học] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Quản lý trường học] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Quản lý trường học] SET  READ_WRITE 
GO
ALTER DATABASE [Quản lý trường học] SET RECOVERY FULL 
GO
ALTER DATABASE [Quản lý trường học] SET  MULTI_USER 
GO
ALTER DATABASE [Quản lý trường học] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Quản lý trường học] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Quản lý trường học] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Quản lý trường học]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = On;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = Primary;
GO
USE [Quản lý trường học]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [Quản lý trường học] MODIFY FILEGROUP [PRIMARY] DEFAULT
GO

-- Tạo bảng học sinh
CREATE TABLE HOCSINH (
    MAHS VARCHAR(10) PRIMARY KEY,
    HOTEN VARCHAR(50) NOT NULL,
    GIOITINH VARCHAR(1) NOT NULL,
    NGSINH DATE NOT NULL,
    DIACHI VARCHAR(255)
);

-- Tạo bảng lớp học
CREATE TABLE LOPHOC (
    MALOP VARCHAR(10) PRIMARY KEY,
    SISO INT NOT NULL,
    NAMHOC INT NOT NULL
);

-- Tạo bảng giáo viên
CREATE TABLE GIAOVIEN (
    MAGV VARCHAR(10) PRIMARY KEY,
    HOTEN VARCHAR(50) NOT NULL,
    GIOITINH VARCHAR(1) NOT NULL,
    NGSINH DATE NOT NULL,
    SDT VARCHAR(20),
    HOCVI VARCHAR(50)
);

-- Tạo bảng môn học
CREATE TABLE MONHOC (
    MAMH VARCHAR(10) PRIMARY KEY,
    TENMH VARCHAR(50) NOT NULL,
    MOTA VARCHAR(255)
);

-- Tạo bảng điểm môn học
CREATE TABLE DIEMMONHOC (
    MAHS VARCHAR(10) NOT NULL,
    MALOP VARCHAR(10) NOT NULL,
    MAMH VARCHAR(10) NOT NULL,
    HOCKY INT NOT NULL,
    NAMHOC INT NOT NULL,
    DIEMHS1 DECIMAL(2,1) NOT NULL,
    DIEMHS2 DECIMAL(2,1) NOT NULL,
    DIEMHS3 DECIMAL(2,1) NOT NULL,
    DTBMH DECIMAL(2,1) NOT NULL,
    PRIMARY KEY (MAHS, MALOP, MAMH, HOCKY, NAMHOC),
    FOREIGN KEY (MAHS) REFERENCES HOCSINH(MAHS),
    FOREIGN KEY (MALOP) REFERENCES LOPHOC(MALOP),
    FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)
);

-- Tạo bảng hạnh kiểm
CREATE TABLE HANHKIEM (
    MAHS VARCHAR(10) NOT NULL,
    MALOP VARCHAR(10) NOT NULL,
    LOAIHK VARCHAR(1) NOT NULL,
    HOCKY INT NOT NULL,
    NAMHOC INT NOT NULL,
    PRIMARY KEY (MAHS, MALOP, LOAIHK, HOCKY, NAMHOC),
    FOREIGN KEY (MAHS) REFERENCES HOCSINH(MAHS),
    FOREIGN KEY (MALOP) REFERENCES LOPHOC(MALOP)
);

-- Tạo bảng học lực
CREATE TABLE HOCLUC (
    MAHS VARCHAR(10) NOT NULL,
    MALOP VARCHAR(10) NOT NULL,
    LOAIHL VARCHAR(1) NOT NULL,
    HOCKY INT NOT NULL,
    NAMHOC INT NOT NULL,
    PRIMARY KEY (MAHS, MALOP, LOAIHL, HOCKY, NAMHOC),
    FOREIGN KEY (MAHS) REFERENCES HOCSINH(MAHS),
    FOREIGN KEY (MALOP) REFERENCES LOPHOC(MALOP)
);

-- Tạo bảng phiếu điểm
CREATE TABLE PHIEUDIEM (
    MAHS VARCHAR(10) NOT NULL,
    MALOP VARCHAR(10) NOT NULL,
    NAMHOC INT NOT NULL,
    DTBNAM DECIMAL(2,1) NOT NULL,
    LOAIHL VARCHAR(1) NOT NULL,
    LOAIHK VARCHAR(1) NOT NULL,
    PRIMARY KEY (MAHS, MALOP, NAMHOC),
    FOREIGN KEY (MAHS) REFERENCES HOCSINH(MAHS),
    FOREIGN KEY (MALOP) REFERENCES LOPHOC(MALOP)
);


-- Khóa ngoại giữa bảng HOCSINH và LOPHOC
ALTER TABLE LOPHOC
ADD CONSTRAINT FK_LOPHOC_HOCSINH 
FOREIGN KEY (MAHS) REFERENCES HOCSINH(MAHS);


-- Khóa ngoại giữa bảng DIEMMONHOC và LOPHOC
ALTER TABLE DIEMMONHOC
ADD CONSTRAINT FK_DIEMMONHOC_LOPHOC 
FOREIGN KEY (MALOP) REFERENCES LOPHOC(MALOP);


-- Khóa ngoại giữa bảng DIEMMONHOC và MONHOC
ALTER TABLE DIEMMONHOC
ADD CONSTRAINT FK_DIEMMONHOC_MONHOC
FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH);


-- Khóa ngoại giữa bảng DIEMMONHOC và HOCSINH
ALTER TABLE DIEMMONHOC
ADD CONSTRAINT FK_DIEMMONHOC_HOCSINH
FOREIGN KEY (MAHS) REFERENCES HOCSINH(MAHS);


-- Khóa ngoại giữa bảng DIEMMONHOC và GIAOVIEN
ALTER TABLE DIEMMONHOC
ADD CONSTRAINT FK_DIEMMONHOC_GIAOVIEN 
FOREIGN KEY (MAGV) REFERENCES GIAOVIEN(MAGV);


-- Khóa ngoại giữa bảng HANHKIEM và GIAOVIEN
ALTER TABLE HANHKIEM
ADD CONSTRAINT FK_HANHKIEM_GIAOVIEN 
FOREIGN KEY (MAGV) REFERENCES GIAOVIEN(MAGV);


-- Khóa ngoại giữa bảng HANHKIEM và HOCSINH
ALTER TABLE HANHKIEM
ADD CONSTRAINT FK_HANHKIEM_HOCSINH
FOREIGN KEY (MAHS) REFERENCES HOCSINH(MAHS);
