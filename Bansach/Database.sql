USE [master]
GO
/****** Object:  Database [Bán Sách]    Script Date: 12/27/2021 8:32:23 PM ******/
CREATE DATABASE [Bán Sách]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bán Sách', FILENAME = N'C:\Program Files (x86)\Microsoft SQL SEVER\MSSQL15.MSSQLSERVER\MSSQL\DATA\Bán Sách.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bán Sách_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL SEVER\MSSQL15.MSSQLSERVER\MSSQL\DATA\Bán Sách_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Bán Sách] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bán Sách].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bán Sách] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bán Sách] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bán Sách] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bán Sách] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bán Sách] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bán Sách] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bán Sách] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bán Sách] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bán Sách] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bán Sách] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bán Sách] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bán Sách] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bán Sách] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bán Sách] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bán Sách] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bán Sách] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bán Sách] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bán Sách] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bán Sách] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bán Sách] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bán Sách] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bán Sách] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bán Sách] SET RECOVERY FULL 
GO
ALTER DATABASE [Bán Sách] SET  MULTI_USER 
GO
ALTER DATABASE [Bán Sách] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bán Sách] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bán Sách] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bán Sách] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bán Sách] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bán Sách] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Bán Sách', N'ON'
GO
ALTER DATABASE [Bán Sách] SET QUERY_STORE = OFF
GO
USE [Bán Sách]
GO
/****** Object:  Table [dbo].[CHITIETDATHANG]    Script Date: 12/27/2021 8:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDATHANG](
	[Idsach] [int] NOT NULL,
	[Idddh] [int] NOT NULL,
	[Soluong] [int] NULL,
	[Dongia] [nvarchar](50) NULL,
	[Thanhtien] [nvarchar](50) NULL,
 CONSTRAINT [PK_CHITIETDATHANG] PRIMARY KEY CLUSTERED 
(
	[Idsach] ASC,
	[Idddh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHITIETHDBL]    Script Date: 12/27/2021 8:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETHDBL](
	[Idsach] [int] NOT NULL,
	[Idhdbl] [int] NOT NULL,
	[Giaban] [nvarchar](50) NULL,
	[Soluong] [int] NULL,
	[Thanhtien] [nvarchar](50) NULL,
 CONSTRAINT [PK_CHITIETHDBL] PRIMARY KEY CLUSTERED 
(
	[Idsach] ASC,
	[Idhdbl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHITIETHOADON]    Script Date: 12/27/2021 8:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETHOADON](
	[Idhd] [int] NOT NULL,
	[Idsach] [int] NOT NULL,
	[Soluong] [int] NULL,
	[Dongia] [nvarchar](50) NULL,
	[Thanhtien] [nvarchar](50) NULL,
 CONSTRAINT [PK_CHITIETHOADON] PRIMARY KEY CLUSTERED 
(
	[Idhd] ASC,
	[Idsach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DANHGIA]    Script Date: 12/27/2021 8:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHGIA](
	[Iduser] [int] NOT NULL,
	[Idsach] [int] NOT NULL,
	[Noidung] [nvarchar](max) NULL,
	[Thoigian] [date] NULL,
 CONSTRAINT [PK_DANHGIA] PRIMARY KEY CLUSTERED 
(
	[Iduser] ASC,
	[Idsach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DANHMUC]    Script Date: 12/27/2021 8:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHMUC](
	[Iddanhmuc] [int] IDENTITY(1,1) NOT NULL,
	[Idloaisach] [int] NULL,
	[Tendanhmuc] [nvarchar](100) NULL,
 CONSTRAINT [PK_DANHMUC] PRIMARY KEY CLUSTERED 
(
	[Iddanhmuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 12/27/2021 8:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONDATHANG](
	[Idddh] [int] IDENTITY(1,1) NOT NULL,
	[Idnhanvien] [int] NULL,
	[Idnhacungcap] [int] NULL,
	[Ngaydat] [date] NULL,
	[Tongtien] [nvarchar](50) NULL,
	[Trangthai] [nvarchar](50) NULL,
 CONSTRAINT [PK_DONDATHANG] PRIMARY KEY CLUSTERED 
(
	[Idddh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 12/27/2021 8:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADON](
	[Idhd] [int] IDENTITY(1,1) NOT NULL,
	[Idnhanvien] [int] NULL,
	[Ngaygiao] [date] NULL,
	[Idddh] [int] NULL,
	[Tongtien] [nvarchar](50) NULL,
 CONSTRAINT [PK_HOADON] PRIMARY KEY CLUSTERED 
(
	[Idhd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOADONBANLE]    Script Date: 12/27/2021 8:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADONBANLE](
	[Idhdbl] [int] IDENTITY(1,1) NOT NULL,
	[Idnhanvien] [int] NULL,
	[Iduser] [int] NULL,
	[Ngaydat] [date] NULL,
	[Ngaygiao] [date] NULL,
	[Hotennguoinhan] [nvarchar](100) NULL,
	[Diachinhan] [nvarchar](200) NULL,
	[SDTnguoinhan] [nchar](10) NULL,
	[Trangthai] [nvarchar](50) NULL,
	[Tongtien] [nvarchar](50) NULL,
 CONSTRAINT [PK_HOADONBANLE] PRIMARY KEY CLUSTERED 
(
	[Idhdbl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIENHE]    Script Date: 12/27/2021 8:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIENHE](
	[Idlienhe] [int] IDENTITY(1,1) NOT NULL,
	[Ho] [nvarchar](50) NULL,
	[Ten] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[SDT] [nchar](10) NULL,
	[Noidung] [nvarchar](max) NULL,
 CONSTRAINT [PK_LIENHE] PRIMARY KEY CLUSTERED 
(
	[Idlienhe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAINV]    Script Date: 12/27/2021 8:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAINV](
	[Idloainhanvien] [int] IDENTITY(1,1) NOT NULL,
	[Tenloai] [nvarchar](100) NULL,
 CONSTRAINT [PK_LOAINV] PRIMARY KEY CLUSTERED 
(
	[Idloainhanvien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAISACH]    Script Date: 12/27/2021 8:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAISACH](
	[Idloaisach] [int] IDENTITY(1,1) NOT NULL,
	[Tenloaisach] [nvarchar](100) NULL,
 CONSTRAINT [PK_LOAISACH] PRIMARY KEY CLUSTERED 
(
	[Idloaisach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 12/27/2021 8:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHACUNGCAP](
	[IdNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](100) NULL,
	[Diachi] [nvarchar](200) NULL,
	[SDT] [int] NULL,
 CONSTRAINT [PK_NHACUNGCAP] PRIMARY KEY CLUSTERED 
(
	[IdNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 12/27/2021 8:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[Idnhanvien] [int] IDENTITY(1,1) NOT NULL,
	[Idloainhanvien] [int] NULL,
	[Hoten] [nvarchar](100) NULL,
	[Diachi] [nvarchar](200) NULL,
	[SDT] [int] NULL,
	[Tendangnhap] [nvarchar](50) NULL,
	[Matkhau] [nchar](20) NULL,
 CONSTRAINT [PK_NHANVIEN] PRIMARY KEY CLUSTERED 
(
	[Idnhanvien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHAXUATBAN]    Script Date: 12/27/2021 8:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHAXUATBAN](
	[IdNXB] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](100) NULL,
 CONSTRAINT [PK_NHAXUATBAN] PRIMARY KEY CLUSTERED 
(
	[IdNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHOMSACH]    Script Date: 12/27/2021 8:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHOMSACH](
	[Idnhomsach] [int] IDENTITY(1,1) NOT NULL,
	[Tennhomsach] [nvarchar](200) NULL,
 CONSTRAINT [PK_NHOMSACH] PRIMARY KEY CLUSTERED 
(
	[Idnhomsach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SACH]    Script Date: 12/27/2021 8:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SACH](
	[Idsach] [int] IDENTITY(1,1) NOT NULL,
	[IdNXB] [int] NULL,
	[Iddanhmuc] [int] NULL,
	[Soluong] [int] NULL,
	[Tuasach] [nvarchar](50) NULL,
	[Gioithieusach] [nvarchar](max) NULL,
	[Khoiluong] [int] NULL,
	[Ngayphathanh] [date] NULL,
	[Ngonngu] [nvarchar](50) NULL,
	[Nguoidich] [nvarchar](50) NULL,
	[Kichthuoc] [nvarchar](50) NULL,
	[Sotrang] [int] NULL,
	[Giagoc] [nvarchar](50) NULL,
	[Giamgia] [nvarchar](50) NULL,
	[Giaban] [nvarchar](50) NULL,
	[Motangan] [nvarchar](max) NULL,
	[Hinhanh] [nvarchar](50) NULL,
	[Masach] [nchar](20) NULL,
 CONSTRAINT [PK_SACH] PRIMARY KEY CLUSTERED 
(
	[Idsach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SACHTHUOCTACGIA]    Script Date: 12/27/2021 8:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SACHTHUOCTACGIA](
	[Idsach] [int] NOT NULL,
	[Idtacgia] [int] NOT NULL,
 CONSTRAINT [PK_SACHTHUOCTACGIA] PRIMARY KEY CLUSTERED 
(
	[Idsach] ASC,
	[Idtacgia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TACGIA]    Script Date: 12/27/2021 8:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TACGIA](
	[Idtacgia] [int] IDENTITY(1,1) NOT NULL,
	[Hoten] [nvarchar](100) NULL,
	[Mota] [nvarchar](max) NULL,
	[Hinhanh] [nchar](20) NULL,
 CONSTRAINT [PK_TACGIA] PRIMARY KEY CLUSTERED 
(
	[Idtacgia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TINTUC]    Script Date: 12/27/2021 8:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TINTUC](
	[Idtintuc] [int] IDENTITY(1,1) NOT NULL,
	[Tieude] [nvarchar](200) NULL,
	[Thoigiandang] [date] NULL,
	[Noidungtomtat] [nvarchar](max) NULL,
	[Hinhanh] [nchar](20) NULL,
 CONSTRAINT [PK_TINTUC] PRIMARY KEY CLUSTERED 
(
	[Idtintuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USER]    Script Date: 12/27/2021 8:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER](
	[Iduser] [int] IDENTITY(1,1) NOT NULL,
	[Matkhau] [nchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[Hoten] [nvarchar](100) NULL,
	[Gioitinh] [nchar](10) NULL,
	[Ngaysinh] [date] NULL,
	[Taikhoan] [nvarchar](50) NULL,
	[Diachi] [nvarchar](200) NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[Iduser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CHITIETDATHANG] ([Idsach], [Idddh], [Soluong], [Dongia], [Thanhtien]) VALUES (1, 1, 55, N'5555', N'555')
GO
INSERT [dbo].[DANHGIA] ([Iduser], [Idsach], [Noidung], [Thoigian]) VALUES (1, 1, N'sách hay', CAST(N'2021-12-19' AS Date))
INSERT [dbo].[DANHGIA] ([Iduser], [Idsach], [Noidung], [Thoigian]) VALUES (1, 5, NULL, NULL)
INSERT [dbo].[DANHGIA] ([Iduser], [Idsach], [Noidung], [Thoigian]) VALUES (2, 1, N'Sách này là cuốn sách hay nhất tôi từng đọc', CAST(N'2021-12-19' AS Date))
GO
SET IDENTITY_INSERT [dbo].[DANHMUC] ON 

INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (2, 1, N'Sách Bán Chạy Trong Tháng')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (3, 1, N'Sách Bán Chạy Của Năm')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (4, 1, N'Kho Sách Giảm Giá')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (5, 1, N'Sách Bán Chạy')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (6, 1, N'Sách Mới Phát Hành')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (7, 1, N'Sách Sắp Phát Hành')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (8, 1, N'Combo Ưu Đãi')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (9, 4, N'Romance')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (10, 4, N'Mystery, Thriller & Suspense')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (11, 4, N'Classics')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (12, 4, N'Contemporary')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (13, 4, N'Action & Adventure')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (14, 4, N'Short Stories')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (15, 4, N'Science Fiction & Fantasy')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (16, 4, N'Humor & Satire')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (17, 4, N'History')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (18, 4, N'Poetry')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (19, 4, N'Adventure Travel')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (20, 4, N'Travel Writing')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (21, 4, N'Animals')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (22, 4, N'Children''s Action & Adventure')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (23, 4, N'Children''s Classics')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (24, 4, N'Children''s Literature & Fiction')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (25, 4, N'Fairy Tales, Folk Tales & Myths')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (26, 4, N'Growing Up & Facts Of Life')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (27, 4, N'TOEIC')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (28, 4, N'TOEFL')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (29, 4, N'IELTS')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (30, 4, N'English Skills')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (31, 4, N'Dictionary')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (32, 4, N'English For Adults')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (33, 4, N'English Specific Purposes')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (34, 4, N'Oxford University Press')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (35, 4, N'Pearson Education')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (36, 4, N'Pearson')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (37, 4, N'McGraw-Hill')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (38, 4, N'Macmillan Education')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (39, 4, N'Cambridge University Press')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (40, 4, N'Prentice HallNational Geographic')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (41, 4, N'Heinle Cengage Learning')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (42, 5, N'Sách Blockchain')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (43, 6, N'Marketing – Bán Hàng')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (44, 6, N'Ngoại Thương')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (45, 6, N'Nhân Sự & Việc Làm')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (46, 6, N'Nhân Vật & Bài Học Kinh Doanh')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (47, 6, N'Phân Tích & Môi Trường Kinh Tế')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (48, 6, N'Quản Trị - Lãnh Đạo')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (49, 6, N'Tài Chính & Tiền Tệ')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (50, 6, N'Tài Chính – Kế Toán')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (51, 6, N'Văn Bản Luật')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (52, 6, N'Đầu Tư & Chứng Khoán')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (53, 7, N'Phê Bình Văn Học')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (54, 7, N'Phóng Sự, Ký Sự')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (55, 7, N'Sách Về Nhân Vật Văn HọcThơ Ca')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (56, 7, N'Tiểu Thuyết Lãng Mạn')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (57, 7, N'Tiểu Thuyết Lịch Sử')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (58, 7, N'Truyện & Thơ Ca Dân Gian')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (59, 7, N'Truyện Dài')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (60, 7, N'Truyện Giả Tưởng – Thần Bí')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (61, 7, N'Truyện Kiếm Hiệp')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (62, 7, N'Truyện Ngắn – Tản Văn')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (63, 7, N'Truyện Thiếu Nhi')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (64, 7, N'Truyện Trinh Thám, Vụ Án')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (65, 7, N'Tự Truyện - Hồi Ký')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (66, 8, N'Cổ Tích & Thần Thoại')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (67, 8, N'Phê Bình Văn Học')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (68, 8, N'Phóng Sự, Ký Sự')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (69, 8, N'Sách Về Nhân Vật Văn Học')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (70, 8, N'Thơ Ca')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (71, 8, N'Tiểu Thuyết Tình Yêu')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (72, 8, N'Truyện Kiếm Hiệp - Phiêu Lưu')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (73, 8, N'Truyện Lịch Sử')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (74, 8, N'Truyện Ngắn')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (75, 8, N'Truyện Thiếu Nhi')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (76, 8, N'Truyện Trinh Thám, Vụ Án')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (77, 8, N'Truyện Viễn Tưởng')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (78, 8, N'Tự Truyện - Hồi Ký')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (79, 8, N'Tiểu Thuyết Ngôn Tình')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (80, 8, N'Tiểu Thuyết Đam Mỹ')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (81, 9, N'Bí Quyết Làm Đẹp')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (82, 9, N'Hạnh Phúc Gia Đình')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (83, 9, N'Nữ Công Gia Chánh')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (84, 9, N'Nuôi Dạy Con')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (85, 9, N'Sách Nấu Ăn')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (86, 9, N'Cây, Cá Cảnh')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (87, 9, N'Vật Nuôi Trong Nhà')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (88, 9, N'Cẩm Nang Tuổi Mới Lớn')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (89, 9, N'Quan Hệ Giới Tính')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (90, 9, N'Sinh Lý Học')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (91, 10, N'Khoa Học Tự Nhiên')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (92, 10, N'Khoa Học Xã Hội')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (93, 10, N'Mỹ Thuật, Âm Nhạc')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (94, 10, N'Sách Ngoại Ngữ')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (95, 10, N'Truyện Tranh')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (96, 11, N'Sách Học Làm Người')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (97, 11, N'Danh Nhân Văn Hoá')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (98, 11, N'Hồi Ký')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (99, 11, N'Nhà Khoa HọcTriết Gia, Chính Trị Gia, Nhà Quân Sự')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (100, 12, N'Tiếng Anh')
GO
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (101, 12, N'Tiếng Hoa')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (102, 12, N'Từ Điển')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (103, 12, N'Từ Điển Chuyên Ngành')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (104, 12, N'Cơ Sở Dữ Liệu')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (105, 12, N'Hệ Điều Hành')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (106, 12, N'Internet & Mạng')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (107, 12, N'Lập Trình & Phần Mềm Ứng Dụng')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (108, 12, N'Lập Trình Web')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (109, 12, N'Tin Học Cơ Bản')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (110, 12, N'Tin Học Văn Phòng')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (111, 12, N'Đồ Họa')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (112, 13, N'Âm Nhạc')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (113, 13, N'Chính Trị, Triết Học')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (114, 13, N'Du Lịch')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (115, 13, N'Khoa Học Cơ Bản')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (116, 13, N'Khoa Học Kỹ Thuật')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (117, 13, N'Khoa Học Xã Hội')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (118, 13, N'Lịch Sử, Địa Lý')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (119, 13, N'Mỹ Thuật, Kiến Trúc')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (120, 13, N'Nông Lâm Nghiệp')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (121, 13, N'Pháp Luật')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (122, 13, N'Sách Tôn Giáo')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (123, 13, N'Thể Thao')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (124, 13, N'Văn Hoá Nghệ Thuật')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (125, 13, N'Y Học')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (126, 13, N'Nghiệp Vụ Báo Chí')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (127, 13, N'Các Chủ Đề Khác')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (128, 14, N'Cấp I')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (129, 14, N'Cấp II')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (130, 14, N'Cấp III')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (131, 14, N'Sách Tham Khảo Cấp I')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (132, 14, N'Sách Tham Khảo Cấp II')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (133, 14, N'Sách Tham Khảo Cấp III')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (134, 14, N'Đại Học')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (135, 15, N'Tạp Chí Sắp Phát Hành')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (136, 15, N'Thế Giới Vi Tính')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (137, 15, N'Forbes Việt Nam')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (138, 15, N'Tiếp Thị & Gia Đình')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (139, 15, N'Thế Giới Văn Hóa')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (140, 15, N'Người Thành Thị - Cosmopolitan')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (141, 15, N'Quý Ông - Esquire')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (142, 15, N'Phái Đẹp - Elle')
INSERT [dbo].[DANHMUC] ([Iddanhmuc], [Idloaisach], [Tendanhmuc]) VALUES (143, 15, N'Women''s Health - Phụ Nữ Khỏe Đẹp')
SET IDENTITY_INSERT [dbo].[DANHMUC] OFF
GO
SET IDENTITY_INSERT [dbo].[DONDATHANG] ON 

INSERT [dbo].[DONDATHANG] ([Idddh], [Idnhanvien], [Idnhacungcap], [Ngaydat], [Tongtien], [Trangthai]) VALUES (1, 1, 1, CAST(N'2021-04-07' AS Date), N'54', N'y')
SET IDENTITY_INSERT [dbo].[DONDATHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[LIENHE] ON 

INSERT [dbo].[LIENHE] ([Idlienhe], [Ho], [Ten], [Email], [SDT], [Noidung]) VALUES (1, N'Nguyễn', N'Bảo An', N'an@gmail.com', N'0852125478', N'Sách này có giảm giá ko ạ?')
INSERT [dbo].[LIENHE] ([Idlienhe], [Ho], [Ten], [Email], [SDT], [Noidung]) VALUES (2, N'Đào', N'Văn Nguyên', N'nguyen@gmail.com', N'0985645523', N'Giao hàng về tỉnh khoảng bao lâu vậy?')
SET IDENTITY_INSERT [dbo].[LIENHE] OFF
GO
SET IDENTITY_INSERT [dbo].[LOAINV] ON 

INSERT [dbo].[LOAINV] ([Idloainhanvien], [Tenloai]) VALUES (1, N'Admin')
INSERT [dbo].[LOAINV] ([Idloainhanvien], [Tenloai]) VALUES (2, N'Quản lý kho')
INSERT [dbo].[LOAINV] ([Idloainhanvien], [Tenloai]) VALUES (3, N'Quản lý khách hàng')
INSERT [dbo].[LOAINV] ([Idloainhanvien], [Tenloai]) VALUES (4, N'Kế toán')
SET IDENTITY_INSERT [dbo].[LOAINV] OFF
GO
SET IDENTITY_INSERT [dbo].[LOAISACH] ON 

INSERT [dbo].[LOAISACH] ([Idloaisach], [Tenloaisach]) VALUES (1, N'Sách bán chạy')
INSERT [dbo].[LOAISACH] ([Idloaisach], [Tenloaisach]) VALUES (4, N'Sách Ngoại Văn')
INSERT [dbo].[LOAISACH] ([Idloaisach], [Tenloaisach]) VALUES (5, N'Sách Blockchain')
INSERT [dbo].[LOAISACH] ([Idloaisach], [Tenloaisach]) VALUES (6, N'Sách Kinh Tế')
INSERT [dbo].[LOAISACH] ([Idloaisach], [Tenloaisach]) VALUES (7, N'Sách Văn Học Trong Nước')
INSERT [dbo].[LOAISACH] ([Idloaisach], [Tenloaisach]) VALUES (8, N'Sách Văn Học Nước Ngoài')
INSERT [dbo].[LOAISACH] ([Idloaisach], [Tenloaisach]) VALUES (9, N'Sách Thường Thức – Đời Sống')
INSERT [dbo].[LOAISACH] ([Idloaisach], [Tenloaisach]) VALUES (10, N'Sách Thiếu Nhi')
INSERT [dbo].[LOAISACH] ([Idloaisach], [Tenloaisach]) VALUES (11, N'Sách Phát Triển Bản Thân')
INSERT [dbo].[LOAISACH] ([Idloaisach], [Tenloaisach]) VALUES (12, N'Sách Tin Học - Ngoại Ngữ')
INSERT [dbo].[LOAISACH] ([Idloaisach], [Tenloaisach]) VALUES (13, N'Sách Chuyên Ngành')
INSERT [dbo].[LOAISACH] ([Idloaisach], [Tenloaisach]) VALUES (14, N'Sách Giáo Khoa - Giáo Trình')
INSERT [dbo].[LOAISACH] ([Idloaisach], [Tenloaisach]) VALUES (15, N'Tạp Chí')
SET IDENTITY_INSERT [dbo].[LOAISACH] OFF
GO
SET IDENTITY_INSERT [dbo].[NHACUNGCAP] ON 

INSERT [dbo].[NHACUNGCAP] ([IdNCC], [TenNCC], [Diachi], [SDT]) VALUES (1, N'Nhà Xuất Bản Thuận Hóa Huế', N'33 Chu Văn An, Phường Phú Hội, Thừa Thiên Huế', 847774910)
INSERT [dbo].[NHACUNGCAP] ([IdNCC], [TenNCC], [Diachi], [SDT]) VALUES (2, N'Công Ty Cổ Phần Phát Hành Sách Tp. HCM', N'60-62 Lê Lợi, P. Bến Nghé, Q. 1, Tp. Hồ Chí Minh (TPHCM)', 283225798)
INSERT [dbo].[NHACUNGCAP] ([IdNCC], [TenNCC], [Diachi], [SDT]) VALUES (3, N'Trí Tuệ - Công Ty Cổ Phần Sách & Thiết Bị Giáo Dục Trí Tuệ', N'187 Giảng Võ, Q. Đống Đa, Hà Nội', 243851567)
INSERT [dbo].[NHACUNGCAP] ([IdNCC], [TenNCC], [Diachi], [SDT]) VALUES (4, N'Công Ty TNHH Văn Hóa Việt Long', N'14/35, Đào Duy Anh, P.9, Q. Phú Nhuận, Tp. Hồ Chí Minh', 283845278)
INSERT [dbo].[NHACUNGCAP] ([IdNCC], [TenNCC], [Diachi], [SDT]) VALUES (5, N'Công Ty Cổ Phần Sách Giáo Dục Tại Thành Phố Hà Nội', N'289A Khuất Duy Tiến, P. Trung Hòa, Q. Cầu Giấy, Hà Nội', 246253424)
INSERT [dbo].[NHACUNGCAP] ([IdNCC], [TenNCC], [Diachi], [SDT]) VALUES (6, N'Công Ty Cổ Phần Sách Mcbooks', N'Lô 34E, Khu Đấu Giá 3ha, P. Phúc Diễm, Q. Bắc Từ Liêm, Hà Nội', 986066630)
INSERT [dbo].[NHACUNGCAP] ([IdNCC], [TenNCC], [Diachi], [SDT]) VALUES (7, N'Nhà Sách Trực Tuyến BOOKBUY.VN', N'147 Pasteur, P. 6, Q. 3, Tp. Hồ Chí Minh (TPHCM)', 288207153)
SET IDENTITY_INSERT [dbo].[NHACUNGCAP] OFF
GO
SET IDENTITY_INSERT [dbo].[NHANVIEN] ON 

INSERT [dbo].[NHANVIEN] ([Idnhanvien], [Idloainhanvien], [Hoten], [Diachi], [SDT], [Tendangnhap], [Matkhau]) VALUES (1, 1, N'Nguyễn A', N'TPHCM', 985236458, N'a', N'a                   ')
INSERT [dbo].[NHANVIEN] ([Idnhanvien], [Idloainhanvien], [Hoten], [Diachi], [SDT], [Tendangnhap], [Matkhau]) VALUES (2, 1, N'Nguyễn B', N'Bình Định', 852365255, N'b', N'b                   ')
INSERT [dbo].[NHANVIEN] ([Idnhanvien], [Idloainhanvien], [Hoten], [Diachi], [SDT], [Tendangnhap], [Matkhau]) VALUES (3, 2, N'Lê E', N'Hà Nội', 957451253, N'e', N'e                   ')
INSERT [dbo].[NHANVIEN] ([Idnhanvien], [Idloainhanvien], [Hoten], [Diachi], [SDT], [Tendangnhap], [Matkhau]) VALUES (4, 2, N'Võ K', N'Huế', 856321479, N'k', N'k                   ')
SET IDENTITY_INSERT [dbo].[NHANVIEN] OFF
GO
SET IDENTITY_INSERT [dbo].[NHAXUATBAN] ON 

INSERT [dbo].[NHAXUATBAN] ([IdNXB], [Ten]) VALUES (1, N'Grand Central Publishing')
INSERT [dbo].[NHAXUATBAN] ([IdNXB], [Ten]) VALUES (2, N'30 Hàn Thuyên')
INSERT [dbo].[NHAXUATBAN] ([IdNXB], [Ten]) VALUES (3, N'Grand Central Publishing')
INSERT [dbo].[NHAXUATBAN] ([IdNXB], [Ten]) VALUES (4, N'ArtBook')
INSERT [dbo].[NHAXUATBAN] ([IdNXB], [Ten]) VALUES (5, N'Scribner')
INSERT [dbo].[NHAXUATBAN] ([IdNXB], [Ten]) VALUES (6, N'Visionary World Ltd.')
INSERT [dbo].[NHAXUATBAN] ([IdNXB], [Ten]) VALUES (7, N'An Dương Vương')
INSERT [dbo].[NHAXUATBAN] ([IdNXB], [Ten]) VALUES (8, N'Anchor')
INSERT [dbo].[NHAXUATBAN] ([IdNXB], [Ten]) VALUES (9, N'Ánh Bình Minh')
INSERT [dbo].[NHAXUATBAN] ([IdNXB], [Ten]) VALUES (10, N'Arrow Books')
INSERT [dbo].[NHAXUATBAN] ([IdNXB], [Ten]) VALUES (11, N'Art Media Resources Ltd')
INSERT [dbo].[NHAXUATBAN] ([IdNXB], [Ten]) VALUES (12, N'Arteco')
INSERT [dbo].[NHAXUATBAN] ([IdNXB], [Ten]) VALUES (13, N'Audiobooks')
INSERT [dbo].[NHAXUATBAN] ([IdNXB], [Ten]) VALUES (14, N'AZ books')
INSERT [dbo].[NHAXUATBAN] ([IdNXB], [Ten]) VALUES (15, N'baby online')
INSERT [dbo].[NHAXUATBAN] ([IdNXB], [Ten]) VALUES (16, N'')
SET IDENTITY_INSERT [dbo].[NHAXUATBAN] OFF
GO
SET IDENTITY_INSERT [dbo].[SACH] ON 

INSERT [dbo].[SACH] ([Idsach], [IdNXB], [Iddanhmuc], [Soluong], [Tuasach], [Gioithieusach], [Khoiluong], [Ngayphathanh], [Ngonngu], [Nguoidich], [Kichthuoc], [Sotrang], [Giagoc], [Giamgia], [Giaban], [Motangan], [Hinhanh], [Masach]) VALUES (1, 1, 9, 11, N'At First Sight', N'There are a few things Jeremy Marsh was sure he''d never do: he''d never leave New York City; never give his heart away again after barely surviving one failed marriage; and, most of all, never become a parent. Now, Jeremy is living in the tiny town of Boone Creek, North Carolina, married to Lexie Darnell, the love of his life, and anticipating the birth of their daughter. But just as his life seems to be settling into a blissful pattern, an unsettling and mysterious message re-opens old wounds and sets off a chain of events that will forever change the course of this young couple''s marriage.

Dramatic, heartbreaking and surprising, this is a story about the love between a man and a woman and between a parent and a child. More than that, it is a story that beautifully portrays how the same emotion that can break your heart is also the one that will ultimately heal it.

While the novel picks up the tale of Lexie Darnell and Jeremy Marsh that started in True Believer and will delight fans of that novel, it stands on its own as one of Nicholas Sparks''s most deeply moving love stories.', 198, CAST(N'2013-06-01' AS Date), N'Tiếng Anh', NULL, N' 10.7 x 17.3 x 2.6 cm', 352, N'120.000 ₫
', N'0', N'120.000 ₫
', N'There are a few things Jeremy Marsh was sure he''d never do: he''d never leave New York City; never give his heart away again after barely surviving one failed marriage; and, most of all, never become a parent. Now, Jeremy is living in the tiny town of Boone Creek, North Carolina, married to Lexie Darnell, the love of', N'1.jpg', N'BL19198352          ')
INSERT [dbo].[SACH] ([Idsach], [IdNXB], [Iddanhmuc], [Soluong], [Tuasach], [Gioithieusach], [Khoiluong], [Ngayphathanh], [Ngonngu], [Nguoidich], [Kichthuoc], [Sotrang], [Giagoc], [Giamgia], [Giaban], [Motangan], [Hinhanh], [Masach]) VALUES (2, 2, 9, 5, N'The Wedding', N'With The Notebook, A Walk to Remember, and his other beloved novels, #1 New York Times bestselling author Nicholas Sparks has given voice to our deepest beliefs about the power of love. Now he brings us the long-awaited follow-up to The Notebook-a story of an ordinary man who goes to extraordinary lengths to win back the love of his life... After thirty years, Wilson Lewis is forced to face a painful truth: the romance has gone out of his marriage. His wife, Jane, has fallen out of love with him, and it is entirely his fault. Despite the shining example of his in-laws, Noah and Allie Calhoun, and their fifty-year love affair (originally recounted in The Notebook), Wilson himself is a man unable to express his true feelings. He has spent too little time at home and too much at the office, leaving the responsibility of raising their children to Jane. Now his daughter is about to marry, and his wife is thinking about leaving him. But if Wilson is sure of anything, it is this: His love for Jane has only grown over the years, and he will do everything he can to save their marriage. With the memories of Noah and Allie''s inspiring life together as his guide, he vows to find a way to make his wife fall in love with him...all over again. In this powerfully moving tale of love lost, rediscovered, and renewed, Nicholas Sparks once again brings readers his unique insight into the only emotion that ultimately really matters.', 142, CAST(N'2005-08-21' AS Date), N' Tiếng Anh', NULL, N'10.7 x 17.3 x 2.3 cm', 232, N'120.000 ₫
', N'10%', N'108.000 đ', N'With The Notebook, A Walk to Remember, and his other beloved novels, #1 New York Times bestselling author Nicholas Sparks has given voice to our deepest beliefs about the power of love. Now he brings us the long-awaited follow-up to The Notebook-a story of an ordinary man who goes to extraordinary lengths to win back ...', N'2.jpg', N'BL29142232          ')
INSERT [dbo].[SACH] ([Idsach], [IdNXB], [Iddanhmuc], [Soluong], [Tuasach], [Gioithieusach], [Khoiluong], [Ngayphathanh], [Ngonngu], [Nguoidich], [Kichthuoc], [Sotrang], [Giagoc], [Giamgia], [Giaban], [Motangan], [Hinhanh], [Masach]) VALUES (3, 3, 9, 2, N'The Rescue', N'The Rescue. One of America''s bestselling authors delivers a story about the greatest commitment of all: loving someone forever.

When confronted by raging fires or deadly accidents, volunteer fireman Taylor McAden feels compelled to take terrifying risks to save lives. But there is one leap of faith Taylor can''t bring himself to make: he can''t fall in love. For all his adult years, Taylor has sought out women who need to be rescued, women he leaves as soon as their crisis is over and the relationship starts to become truly intimate. When a raging storm hits his small Southern town, single mother Denise Holton''s car skids off the road. The young mom is with her four-year-old son Kyle, a boy with severe learning disabilities and for whom she has sacrificed everything. Taylor McAden finds her unconscious and bleeding, but does not find Kyle. When Denise wakes, the chilling truth becomes clear to both of them: Kyle is gone. During the search for Kyle, the connection between Taylor and Denise takes root. Taylor doesn''t know that this rescue will be different from all the others.', 258, CAST(N'2001-08-30' AS Date), N' Tiếng Anh', NULL, N'10.7 x 17.8 x 3.9 cm', 245, N'120.000 ₫
', N'0', N'120.000 ₫
', N'One of America''s bestselling authors delivers a story about the greatest commitment of all: loving someone forever. When confronted by raging fires or deadly accidents, volunteer fireman Taylor McAden feels compelled to take terrifying risks to save lives. But there is one leap of faith Taylor can''t bring himself to ... ', N'3.jpg', N'BL39258245          ')
INSERT [dbo].[SACH] ([Idsach], [IdNXB], [Iddanhmuc], [Soluong], [Tuasach], [Gioithieusach], [Khoiluong], [Ngayphathanh], [Ngonngu], [Nguoidich], [Kichthuoc], [Sotrang], [Giagoc], [Giamgia], [Giaban], [Motangan], [Hinhanh], [Masach]) VALUES (4, 4, 9, 25, N'Me Before You: A Novel (Movie Tie-In)', N'They had nothing in common until love gave them everything to lose . . .

Louisa Clark is an ordinary girl living an exceedingly ordinary life—steady boyfriend, close family—who has barely been farther afield than their tiny village. She takes a badly needed job working for ex–Master of the Universe Will Traynor, who is wheelchair bound after an accident. Will has always lived a huge life—big deals, extreme sports, worldwide travel—and now he’s pretty sure he cannot live the way he is.

Will is acerbic, moody, bossy—but Lou refuses to treat him with kid gloves, and soon his happiness means more to her than she expected. When she learns that Will has shocking plans of his own, she sets out to show him that life is still worth living.

A Love Story for this generation and perfect for fans of John Green’s The Fault in Our Stars, Me Before You brings to life two people who couldn’t have less in common—a heartbreakingly romantic novel that asks, What do you do when making the person you love happy also means breaking your own heart?', 374, CAST(N'2016-03-11' AS Date), N'Tiếng Anh', NULL, N'4.2 x 0.9 x 7.5 cm', 75, N'58.000 đ', N'0', N'58.000 đ', N'They had nothing in common until love gave them everything to lose . . .Louisa Clark is an ordinary girl living an exceedingly ordinary life—steady boyfriend, close family—who has barely been farther afield than their tiny village. She takes a badly needed job working for ex–Master of the Universe Will Traynor, ... ', N'4.jpg', N'BL4937475           ')
INSERT [dbo].[SACH] ([Idsach], [IdNXB], [Iddanhmuc], [Soluong], [Tuasach], [Gioithieusach], [Khoiluong], [Ngayphathanh], [Ngonngu], [Nguoidich], [Kichthuoc], [Sotrang], [Giagoc], [Giamgia], [Giaban], [Motangan], [Hinhanh], [Masach]) VALUES (5, 4, 9, 5, N'The Alchemist', N'Every few decades a book is published that changes the lives of its readers forever. This is such a book ? a magical fable about learning to listen to your heart, read the omens strewn along life?s path and, above, all follow your dreams.

This is the magical story of Santiago, an Andalusian shepherd boy who dreams of travelling the world in search of a worldly treasure as fabulous as any ever found. From his home in Spain he journeys to the markets of Tangiers, and from there into the Egyptian desert, where a fateful encounter with the alchemist awaits him

With Paulo?s visionary blend of spirituality, magical realism and folklore, The Alchemist is a story with the power to inspire nations and change people?s lives

Review: Like the one-time bestseller Jonathan Livingston Seagull, The Alchemist presents a simple fable, based on simple truths and places it in a highly unique situation. And though we may sense a bestselling formula, it is certainly not a new one: even the ancient tribal storytellers knew that this is the most successful method of entertaining an audience while slipping in a lesson or two. Brazilian storyteller Paulo Coehlo introduces Santiago, an Andalucian shepherd boy who one night dreams of a distant treasure in the Egyptian pyramids. And so he''s off: leaving Spain to literally follow his dream.

Along the way he meets many spiritual messengers, who come in unassuming forms such as a camel driver and a well-read Englishman. In one of the Englishman''s books, Santiago first learns about the alchemists--men who believed that if a metal were heated for many years, it would free itself of all its individual properties, and what was left would be the "Soul of the World." Of course he does eventually meet an alchemist, and the ensuing student-teacher relationship clarifies much of the boy''s misguided agenda, while also emboldening him to stay true to his dreams. "My heart is afraid that it will have to suffer," the boy confides to the alchemist one night as they look up at a moonless night.

"Tell your heart that the fear of suffering is worse than the suffering itself," the alchemist replies. "And that no heart has ever suffered when it goes in search of its dreams, because every second of the search is a second''s encounter with God and with eternity."

"About this title" may belong to another edition of this title.', 286, CAST(N'2015-04-08' AS Date), N'Tiếng Anh', NULL, N'20.1 x 13.5 x 1.5 cm', 321, N'210.000 đ', N'10%', N'189.000 đ', N'Every few decades a book is published that changes the lives of its readers forever. This is such a book ? a magical fable about learning to listen to your heart, read the omens strewn along life?s path and, above, all follow your dreams.This is the magical story of Santiago, an Andalusian shepherd boy who dreams of ... ', N'5.jpg', N'BL59286321          ')
INSERT [dbo].[SACH] ([Idsach], [IdNXB], [Iddanhmuc], [Soluong], [Tuasach], [Gioithieusach], [Khoiluong], [Ngayphathanh], [Ngonngu], [Nguoidich], [Kichthuoc], [Sotrang], [Giagoc], [Giamgia], [Giaban], [Motangan], [Hinhanh], [Masach]) VALUES (6, 5, 9, 10, N'The Sauvignon Secret', N'WHEN LUCIE MONTGOMERY FINDS the body of prominent wine merchant Paul Noble hanging from a beam in his art studio not far from her Virginia vineyard, she is unwittingly dragged into Noble’s murky past. Once a member of the secretive Mandrake Society, Noble might have aided in a cover-up of the deaths forty years ago of a disabled man and a beautiful young biochemist involved in classified government research.

A seemingly innocent favor for an old friend of her French grandfather sends Lucie to California, where she teams up with Quinn Santori, who walked out of Lucie’s life months earlier. Soon Lucie and Quinn are embroiled in a deadly cat-and-mouse game that takes them from glittering San Francisco to the legendary vineyards of Napa and Sonoma, and back home to Virginia, as they try to discover whether a killer may be seeking vengeance for the long-ago deaths. As Lucie and Quinn struggle to uncover the past, they must also decide whether they have a future together. Blending an intriguing mystery with an absorbing plot, vivid characters, and a richly evoked setting, The Sauvignon Secret should be savored like a glass of fine wine.', 250, CAST(N'2011-08-21' AS Date), N'Tiếng Anh', NULL, N' 14 x 21.4 x 2.8 cm', 209, N'135.000 đ', N'10%', N'121.500 đ', N'WHEN LUCIE MONTGOMERY FINDS the body of prominent wine merchant Paul Noble hanging from a beam in his art studio not far from her Virginia vineyard, she is unwittingly dragged into Noble’s murky past. Once a member of the secretive Mandrake Society, Noble might have aided in a cover-up of the deaths forty years ago ...', N'6.jpg', N'BL69250209          ')
INSERT [dbo].[SACH] ([Idsach], [IdNXB], [Iddanhmuc], [Soluong], [Tuasach], [Gioithieusach], [Khoiluong], [Ngayphathanh], [Ngonngu], [Nguoidich], [Kichthuoc], [Sotrang], [Giagoc], [Giamgia], [Giaban], [Motangan], [Hinhanh], [Masach]) VALUES (7, 6, 9, 10, N'The Choice', N'#1 New York Times bestseller Nicholas Sparks turns his unrivaled talents to a new tale about love found and lost, and the choices we hope we''ll never have to make.

Travis Parker has everything a man could want: a good job, loyal friends, even a waterfront home in small-town North Carolina. In full pursuit of the good life-- boating, swimming, and regular barbecues with his good-natured buddies--he holds the vague conviction that a serious relationship with a woman would only cramp his style. That is, until Gabby Holland moves in next door. Despite his attempts to be neighborly, the appealing redhead seems to have a chip on her shoulder about him . . . and the presence of her longtime boyfriend doesn''t help. Despite himself, Travis can''t stop trying to ingratiate himself with his new neighbor, and his persistent efforts lead them both to the doorstep of a journey that neither could have foreseen. Spanning the eventful years of young love, marriage and family, THE CHOICE ultimately confronts us with the most heartwrenching question of all: how far would you go to keep the hope of love alive?', 250, CAST(N'2009-04-22' AS Date), N'Tiếng Anh', NULL, N'10.7 x 17.8 x 2.3 cm', 221, N'120.000 đ', N'0', N'120.000 đ', N'#1 New York Times bestseller Nicholas Sparks turns his unrivaled talents to a new tale about love found and lost, and the choices we hope we''ll never have to make.Travis Parker has everything a man could want: a good job, loyal friends, even a waterfront home in small-town North Carolina. In full pursuit of the good ... ', N'7.jpg', N'BL79250221          ')
INSERT [dbo].[SACH] ([Idsach], [IdNXB], [Iddanhmuc], [Soluong], [Tuasach], [Gioithieusach], [Khoiluong], [Ngayphathanh], [Ngonngu], [Nguoidich], [Kichthuoc], [Sotrang], [Giagoc], [Giamgia], [Giaban], [Motangan], [Hinhanh], [Masach]) VALUES (8, NULL, 9, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SACH] ([Idsach], [IdNXB], [Iddanhmuc], [Soluong], [Tuasach], [Gioithieusach], [Khoiluong], [Ngayphathanh], [Ngonngu], [Nguoidich], [Kichthuoc], [Sotrang], [Giagoc], [Giamgia], [Giaban], [Motangan], [Hinhanh], [Masach]) VALUES (9, NULL, NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SACH] ([Idsach], [IdNXB], [Iddanhmuc], [Soluong], [Tuasach], [Gioithieusach], [Khoiluong], [Ngayphathanh], [Ngonngu], [Nguoidich], [Kichthuoc], [Sotrang], [Giagoc], [Giamgia], [Giaban], [Motangan], [Hinhanh], [Masach]) VALUES (10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SACH] ([Idsach], [IdNXB], [Iddanhmuc], [Soluong], [Tuasach], [Gioithieusach], [Khoiluong], [Ngayphathanh], [Ngonngu], [Nguoidich], [Kichthuoc], [Sotrang], [Giagoc], [Giamgia], [Giaban], [Motangan], [Hinhanh], [Masach]) VALUES (11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SACH] ([Idsach], [IdNXB], [Iddanhmuc], [Soluong], [Tuasach], [Gioithieusach], [Khoiluong], [Ngayphathanh], [Ngonngu], [Nguoidich], [Kichthuoc], [Sotrang], [Giagoc], [Giamgia], [Giaban], [Motangan], [Hinhanh], [Masach]) VALUES (12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SACH] ([Idsach], [IdNXB], [Iddanhmuc], [Soluong], [Tuasach], [Gioithieusach], [Khoiluong], [Ngayphathanh], [Ngonngu], [Nguoidich], [Kichthuoc], [Sotrang], [Giagoc], [Giamgia], [Giaban], [Motangan], [Hinhanh], [Masach]) VALUES (13, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SACH] OFF
GO
INSERT [dbo].[SACHTHUOCTACGIA] ([Idsach], [Idtacgia]) VALUES (1, 24)
INSERT [dbo].[SACHTHUOCTACGIA] ([Idsach], [Idtacgia]) VALUES (2, 24)
INSERT [dbo].[SACHTHUOCTACGIA] ([Idsach], [Idtacgia]) VALUES (3, 24)
INSERT [dbo].[SACHTHUOCTACGIA] ([Idsach], [Idtacgia]) VALUES (4, 27)
INSERT [dbo].[SACHTHUOCTACGIA] ([Idsach], [Idtacgia]) VALUES (5, 26)
INSERT [dbo].[SACHTHUOCTACGIA] ([Idsach], [Idtacgia]) VALUES (6, 25)
INSERT [dbo].[SACHTHUOCTACGIA] ([Idsach], [Idtacgia]) VALUES (7, 24)
GO
SET IDENTITY_INSERT [dbo].[TACGIA] ON 

INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (1, N'
Philip Kotler', N'Philip Kotler sinh ngày 27 tháng 5 năm 1931 tại Chicago, Hoa Kỳ; là Giáo sư Marketing nổi tiếng thế giới; “cha đẻ” của marketing hiện đại, được xem là huyền thoại duy nhất về marketing, ông tổ của tiếp thị hiện đại thế giới, một trong bốn “Nhà quản trị vĩ đại nhất mọi thời đại” cùng với Peter Drucker, Fack Welch và Bill Gates (theo bình chọn của Financial Times). Ông là giáo sư của Trường Đại học Northwestern, Hoa Kỳ; là chuyên gia hàng đầu của Tập đoàn tiếp thị Kotler trong lĩnh vực hoạch định chiến lược marketing, và là giáo sư tại các trường đại học như Johnson & son, Viện Marketing Kellogg. Ông đã từng tư vấn cho nhiều chính phủ và các công ty nổi tiếng trên thế giới như IBM, General Electric, AT&T, Honeywell, Bank of America, v.v... Những nguyên lý và phương pháp tiếp thị của ông được tiếp nhận, áp dụng rộng rãi trong giới kinh doanh toàn cầu.

Cái tên của Philip Kotler đã trở nên đồng nghĩa với tiếp thị, một chuyên gia hàng đầu của Kotler Marketing Group trong lĩnh vực hoạch định chiến lược marketing. Ông được hàng triệu người trên thế giới biết đến như một chuyên gia cừ khôi trong lĩnh vực marketing, một thuyết trình viên cao cấp, tác giả hoặc đồng tác giả của hơn 100 cuốn sách và bài báo chuyên về marketing và quản trị kinh doanh; trong đó có Marketing Management (ấn hành lần đầu năm 1967), một trong những cuốn sách kinh điển nhất của ngành tiếp thị và gối đầu giường giới quản trị kinh doanh thế giới. Những cuốn sách của ông đã được bán trên ba triệu bản bằng 20 thứ tiếng và được coi như kinh thánh về tiếp thị tại 58 quốc gia trên thế giới.', N'1.jpg               ')
INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (2, N'
Robert T. Kiyosaki', N'Một nhà doanh nghiệp trong lĩnh vực giáo dục, người sáng tạo trò chơi CASHFLOW, nhà sáng lập Công ty Rich Dad chuyên về giáo dục tài chính, và là tác giả bộ “Dạy Con Làm Giàu” - theo bình chọn của The New York Times.

Robert Kiyosaki được biết đến nhiều nhất trong vai trò tác giả của Dạy Con Làm Giàu – bộ sách tài chính cá nhân số 1 của mọi thời đại đã thách thức và thay đổi cách suy nghĩ về đồng tiền của hàng hiệu người trên thế giới. Chỉ từ năm 2001 đến 2008, các tựa sách Dạy Con Làm Giàu đã chiếm bốn trong số 10 vị trí đầu bảng xếp hạng doanh số Life-to-Date của Nielsen Bookscan. Robert cũng được mời đến những chương trình như Larry King Live, Oprah, The Doctors, Bloomberg International Television và CNN

Có những quan điễm mâu thuẫn với cách nghĩ thông thường về tiền bạc và đầu tư, Robert nổi tiếng qua những cuộc nói chuyện thẳng thắn, chính trực và can đảm. Quan điểm của ông (cho rằng lời khuyên tài chính thông thường - tìm một công việc tốt, tiết kiệm tiền, thoát khỏi nợ nần, đầu tư dài hạn và đa dạng hóa - là một lời khuyên lỗi thời) đã thách thức thực tế hiện nay. Khẳng định của ông rằng “ngôi nhà không phải là một tài sản“ đã khuấy động nhiều cuộc tranh cãi, nhưng nó đã được minh chứng chính xác trong tình hình khủng hoảng tài chính hiện nay của nền kinh tế.

Năm 2006, Robert cộng tác cùng Donald Trump viết cuốn sách Tại Sao Chúng Tôi Muốn Bạn Giàu – Hai Người Giàu – Một Thông Điệp. Cuốn sách vừa ra mắt đã nhảy lên vị trí số một trong danh sách bán chạy nhất của The New York Times.

Robert từng xuất hiện trên mục báo được ưa thích “10 Câu hỏi“ của tạp trí TIME, trong đó ông trả lời về nhiều vấn đề từ cách đầu tư với rất ít tài nguyên cho đến ảnh hưởng của giáo dục đối với thành công tài chính của một người.

Cuốn sách Âm Mưu của Người Giàu: 8 Quy Luật Mới của Đồng Tiền, đi tiên phong trong công nghệ sách trực tuyến cho phép tự do tương tác, với sự đóng góp của 1,1 triệu độc giả trên 167 quốc gia. Nhiều bài viết thường xuyên được cập nhật  trên website conspiracyoftherich.com.', N'2.jpg               ')
INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (3, N'
Napoleon Hill', N'Napoleon Hill (Sinh ngày 26 tháng 10 năm 1883 - mất ngày 8 tháng 11 năm 1970) là một tác gia người Mỹ, một trong những người sáng lập nên một thể loại văn học hiện đại đó là môn "thành công học" (là khoa học về sự thành công của cá nhân). Tác phẩm được cho là nổi tiếng nhất của ông có tên "Suy nghĩ và làm giàu" (Think and Grow Rich) là. một trong những cuốn sách bán chạy nhất mọi thời đại. Trong sự nghiệp của mình, ông cũng từng được trở thành một cố vấn cho Tổng thống Franklin D. Roosevelt. Câu nói nổi tiếng thể hiện tư tưởng của ông là "Điều gì mà tâm trí có thể nhận thức và tin tưởng thì tâm trí có thể hoàn thành".Napoleon Hill được xem là người có ảnh hưởng rộng rãi nhất, mạnh mẽ nhất trong lĩnh vực thành công cá nhân.Cuốn sách kinh điển suy nghĩ và làm giàu của ông đã giúp cho hàng triệu người trên thế giới thành công và nó có một ý nghĩa, vai trò vô cùng quan trọng trong cuộc đời của rất nhiều người thành công như W.Clement Stone, Og Mandino.', N'3.jpg               ')
INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (4, N'
Adam Khoo', N'Diễn giả Adam Khoo tên đầy đủ là Adam Khoo Yean Ann (sinh ngày 8/4/1974) là một doanh nhân thành đạt, là tác giả của những quyển sách bán chạy nhất và cũng là chuyên gia đào tạo hàng đầu. Là một triệu phú tự lập ở tuổi 26, ông là một trong những triệu phú trẻ tuổi nhất tại Singapore, sở hữu và quản lý một số doanh nghiệp trong ngành giáo dục, đào tạo, quản lý sự kiện, và quảng cáo, với doanh thu tổng cộng hàng năm vào khoảng S$30,000,000. 
Adam hiện là chủ tịch và chuyên gia đào tạo cao cấp của Tập đoàn giáo dục Adam Khoo Learning Technologies Group, chuyên tổ chức các khoá đào tạo và hội thảo cho các công ty đa quốc gia và cá nhân khắp Châu Á. Ngoài ra Adam cũng là một chuyên gia tư vấn hàng đầu trong lĩnh vực tài chính, tiếp thị, quản trị, lãnh đạo và phát huy tiềm năng con người.', N'4.jpg               ')
INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (5, N'
Nguyễn Nhật Ánh
', N'Nguyễn Nhật Ánh là tên và cũng là bút danh của một nhà văn Việt Nam chuyên viết cho tuổi mới lớn. Ông sinh ngày 7 tháng 5 năm 1955 tại huyện Thăng Bình, Quảng Nam. Năm 13 tuổi ông đăng báo bài thơ đầu tiên. Tác phẩm đầu tiên in thành sách là một tập thơ: Thành phố tháng tư (NXB Tác phẩm mới - 1984 - in chung với Lê Thị Kim). Truyện dài đầu tiên của ông là tác phẩm Trước vòng chung kết (NXB Măng Non, 1985).Hai mươi năm trở lại đây, ông tập trung viết văn xuôi, chuyên sáng tác về đề tài thanh thiếu niên.

Năm 2003, bộ truyện nhiều tập Kính vạn hoa được Trung ương Đoàn TNCS HCM trao huy chương Vì thế hệ trẻ và được Hội nhà văn Việt Nam trao tặng thưởng. Đến nay ông đã xuất bản gần 100 tác phẩm và từ lâu đã trở thành nhà văn thân thiết của các bạn đọc nhỏ tuổi ở Việt Nam. Năm 2008, Nguyễn Nhật Ánh xuất bản truyện có tên Cho tôi xin một vé đi tuổi thơ, tác phẩm này được báo Người Lao động bình chọn là tác phẩm hay nhất năm 2008. Đoạt giải thưởng văn học ASEAN năm 2010


Nguyễn Ngọc Thuần tốt nghiệp ĐH Mỹ thuật TP. HCM, sau khi ra trường anh đầu quân cho Báo Tuổi trẻ. Thế nhưng cơ duyên đã đưa anh họa sĩ trẻ tiếp cận văn chương và "cái tôi" nhà văn đã lấn lướt "cái tôi" họa sĩ. 


Nguyễn Ngọc Thuần bước lên đỉnh cao thành công của văn chương, với hàng loạt các giải thưởng như: Giăng giăng tơ nhện (giải thưởng Văn học tuổi hai mươi lần II); Vừa nhắm mắt vừa mở cửa sổ, NXB Trẻ 2000, giải nhất cuộc thi Văn học Thiếu nhi lần III, giải Peter Pan (giải thưởng của Thụy Điển dành cho tác phẩm thiếu nhi hay nhất; Một thiên nằm mộng - giải A cuộc vận động sáng tác văn học thiếu nhi của NXB Kim Đồng 2001-2002; Nhện ảo - giải A cuộc vận động sáng tác cho thiếu nhi 2003, giải B (không có giải A) cuộc thi sáng tác văn học cho tuổi trẻ do NXB Thanh niên phối hợp với NXB Văn nghệ tổ chức cho tác phẩm Trên đồi cao chăn bầy thiên sứ…


"Sự xuất hiện của anh trong làng văn, với Vừa nhắm mắt vừa mở cửa sổ, Một thiên nằm mộng đã tạo nên một thế giới tươi sáng, mơ hồ mà quyến rũ. Sự đẹp đẽ của những trang văn Nguyễn Ngọc Thuần đã "đánh gục" sự nghi ngờ của những nhà văn lão thành. Ngay cả những nhà phê bình khó tính nhất cũng chấm cho anh trên điểm 5 trong thang điểm 10.', N'5.jpg               ')
INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (6, N'
Hồ Anh Thái', N'Tác giả của hàng trăm truyện ngắn đã in trên báo chí và hơn ba mươi tập sách đã xuất bản, riêng phần truyện ngắn có các tập chính: Mảnh vỡ của đàn ông, Tiếng thở dài qua rừng kim tước, Tự sự 265 ngày, Bốn lối vào nhà cười, Sắp đặt và diễn, Người bên này trời bên ấy... Tác phẩm đã được dịch ra hơn mười thứ tiếng và ấn hành ở nhiều nước. Hồ Anh Thái hiện làm công tác ngoại giao ở nước ngoài.', N'6.jpg               ')
INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (7, N'
Nguyễn Ngọc Tư
', N'Nhà văn nữ Nguyễn Ngọc Tư là một nhà văn trẻ thuộc thế hệ hậu chiến (sinh năm 1976) tại tỉnh miền cuối nước Việt là Cà Mau, lớn lên ở đây, đi làm và viết văn cũng ở đây. Cô có sách được xuất bản rất sớm vì có tài viết truyện loại đồng quê cho nhi đồng và thiếu niên, và thường được coi như một thứ Hồ Biểu Chánh mới.

Cô được biết đến nhiều nhất bởi tập truyện gây tranh cãi mang tên Cánh đồng bất tận. Và nhiều tác phẩm nổi tiếng khác: Đong Tấm Lòng, Đảo, Yêu Người Ngóng Núi, Ngày Mai Của Những Ngày Mai...', N'7.jpg               ')
INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (8, N'Vũ Phương Thanh', N'Gào (Vũ Phương Thanh) sinh năm 1988, thuộc thế hệ những nhà văn cuối thời 8X. Trong vài ba năm trở lại đây, cái tên Gào đã gây được sự chú ý trên văn đàn, đặc biệt đối với giới trẻ tuổi teen yêu văn học. Cô là một blogger đính đám và được cộng đồng mạng phong danh là "nhà văn hotgirl".

Các tác phẩm nổi tiếng của Gào: Cho em gần anh thêm chút nữa, Nhật ký son môi, Tự sát, Yêu Anh Bằng Tất Cả Những Gì Em Có - Mất Anh Bởi Tất Cả Những Thứ Em Cho, Hoa Linh Lan..', N'8.jpg               ')
INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (9, N'
Anh Khang', N'Xuất thân là một học sinh chuyên Văn của Trường Trung học Phổ thông Chuyên Lê Hồng Phong Tp. Hồ Chí Minh, Quách Lê Anh Khang được nhiều bạn bè đồng trang lứa biết đến với các thành tích nổi bật như Huy chương vàng Olympics Truyền thống 30/4, Thủ khoa kỳ thi Học sinh Giỏi Thành phố, Giải III Học sinh Giỏi Quốc gia và được tuyển thẳng vào Đại học Khoa học Xã hội & Nhân văn. Trên nền tảng đó, Anh Khang đã tiếp tục rèn luyện ngòi bút trong những năm tháng là sinh viên khoa Báo chí và Truyền thông của trường bằng việc trở thành cộng tác viên thường xuyên cho nhiều tờ báo. Ngay từ khi còn trên ghế giảng đường, anh đã là cây bút quen thuộc với nhiều độc giả của báo Doanh nhân Sài Gòn Cuối tuần. Đây cũng là tờ báo anh đã công tác trong hơn 4 năm trước khi chuyển sang phụ trách biên tập cho tạp chí Her World hiện nay.

Vừa là phóng viên, vừa công tác trong lĩnh vực PR - Marketing, thỉnh thoảng Anh Khang còn lấn sân sang vai trò người dẫn chương trình và sáng tác nhạc. Vì “ôm đồm” nhiều việc như thế mà mọi người đã gọi tác giả trẻ này bằng biệt danh “Tắc kè đa tài” (như tên một bài báo từng viết về anh). Ngày trôi về phía cũ là tập tản văn đầu tay của Anh Khang. Sau quyển sách này, anh sẽ tiếp tục đến với độc giả qua một số truyện ngắn và tiểu thuyết, theo đuổi sự nghiệp sáng tác như một nhà văn thực sự - niềm đam mê từ thời niên thiếu của anh.', N'9.jpg               ')
INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (10, N'
Gia Đoàn', N'Gia Đoàn tên thật là Trần Nguyễn Đỗ Khanh, hiện làm Marketing manager MTV Việt Nam được biết đến như một chàng trai đa tài với nhiều kinh nghiệm hoạt động ở các lĩnh vực: Nhạc sĩ (Em, Tiệm bánh dâu tây, Xe buýt hai tầng…); Phóng viên tự do (2!, H2T, Teenager Singapore, Seventeen Singapore…); Script writer (Thần tượng, Người dưng ngược lối – Phạm Quỳnh Anh) và tham gia đóng phim (Ngôi nhà hạnh phúc – phiên bản Việt) và hiện tại anh đang làm Marketing manager MTV Việt Nam. 

Anh cũng được biết đến như một hot bloger với nhiều bài viết được đón nhận và hàng nghìn chia sẻ trên cộng đồng mạng từ những năm trào lưu blog nở rộ.', N'10.jpg              ')
INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (11, N'
Alexandre Dumas', N'Alexandre Dumas (1802 - 1870), còn được gọi Alexandre Dumas cha (để phân biệt với con trai ông cũng là một nhà văn) là một nhà văn có sức sáng tác mạnh mẽ. Ông để lại hàng trăm tác phẩm, trong đó có khoảng 100 tiểu thuyết, số còn lại là kịch, bút kí, phóng sự, hồi kí. Những tiểu thuyết nổi tiếng của ông như Ba người lính ngự lâm, Bá tước Monte Cristo,… giành được sự hâm mộ của độc giả khắp thế giới từ hơn một thế kỉ nay. ', N'11.jpg              ')
INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (12, N'
Rick Riordan', N'Rick Riordan là tác giả có sách bán chạy nhất do tờ New York Times bình chọn cho Series truyện dành cho trẻ em Percy Jackson và các vị thần trên đỉnh Olympus và Series Tiểu thuyết trinh thám dành cho người lớn Tres Navarre. Ông có mười lăm năm giảng dạy môn tiếng Anh và lịch sử ở các trường trung học cơ sở công và tư ở San Francisco Bay Area ở California và Texas, từng nhận giải thưởng Giáo viên Ưu tú đầu tiên của trường vào năm 2002 do Saint Mary''s Hall trao tặng. Ông hiện đang sống ở San Antonio, Texas cùng vợ và hai con trai, dành toàn bộ thời gian cho sáng tác.

Series Percy Jackson và các vị thần trên đỉnh Olympus đã bán được hơn 30 triệu bản trên toàn thế giới (tính tới ngày 1.3.2011), chiếm 153 tuần trong danh sách Sách bán chạy nhất trên New York Times cho thể loại sách thiếu nhi. Kẻ cắp tia chớp đã bán bản quyền cho 35 nước, đã được chuyển thể thành phim truyện nhựa cùng tên (đạo diễn: Chris Columbus, các diễn viên chính: Uma Thurman, Pierce Brosnan...) và video game.', N'12.jpg              ')
INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (13, N'Quỳnh Chi', N'Ngày sinh: 6/7/1991 

Một nàng Cự Giải điển hình. Nhạy cảm giữa muôn vàn lát cắt cuộc đời, buộc lòng mình với chơi vơi, lúc đơn côi thì xẻ đôi chặt ba con chữ mua vui, thực chất là để cố giấu đi những lần bước lùi mỏi mệt. 

Sách đã xuất bản: 

Ngược nắng để yêu em (2012) 
Đường yêu gấp khúc (2013)', N'13.jpg              ')
INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (14, N'
Fujiko.F.Fujio', N'Fujiko Fujio (Tiếng Nhật: 藤子 不二雄 ) là bút danh chung của hai nghệ sỹ manga Nhật Bản.

Fujiko F. Fujio (藤子・F・不二雄 Fujiko Efu Fujio) sinh ngày 1 tháng 12 năm 1933 - mất ngày 23 tháng 9 năm 1996. Tên thật của ông là Hiroshi Fujimoto (藤本 弘 Fujimoto Hiroshi). Fujiko Fujio (A) (藤子不二雄A Fujiko Fujio Ēi) sinh ngày 10 tháng 3 năm 1934. Tên thật của ông là Motoo Abiko (安孫子 素雄 Abiko Motoo).

Năm 1987, họ chia tay để theo đuổi con đường sáng tác riêng rẽ và trở thành "Fujiko F. Fujio" và "Fujiko Fujio (A)".

Trong số các tác phẩm của cả hai, tác phẩm được biết đến rộng rãi nhất là Đôrêmon. Ban đầu, khi bắt đầu sáng tác truyện tranh, cả hai ông đều vẽ cùng nhau dưới bút danh Ashizuka Fujio.', N'14.jpg              ')
INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (15, N'Dale Carnegie', N'Dale Breckenridge Carnegie (24/11/1888 – 1/11/1955) là một nhà văn và nhà thuyết trình Mỹ và là người phát triển các lớp tự giáo dục, nghệ thuật bán hàng, huấn luyện đoàn thể, nói trước công chúng và các kỹ năng giao tiếp giữa mọi người. 
Ra đời trong cảnh nghèo đói tại một trang trại ở Missouri, ông là tác giả cuốn Đắc Nhân Tâm, được xuất bản lần đầu năm 1936, một cuốn sách thuộc hàng bán chạy nhất và được biết đến nhiều nhất cho đến tận ngày nay. Ông cũng viết một cuốn tiểu sử Abraham Lincoln, với tựa đề Lincoln con người chưa biết, và nhiều cuốn sách khác. Carnegie là một trong những người đầu tiên đề xuất cái ngày nay được gọi là đảm đương trách nhiệm, dù nó chỉ được đề cập tỉ mỉ trong tác phẩm viết của ông. Một trong những ý tưởng chủ chốt trong những cuốn sách của ông là có thể thay đổi thái độ của người khác khi thay đổi sự đối xử của ta với họ.
', N'15.jpg              ')
INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (16, N'Tony Buzan', N'Anthony "Tony" Peter Buzan (sinh năm 1942) tại Luân Đôn (Anh) là một tác gia, nhà tâm lý và là cha đẻ của phương pháp tư duy Mind map (Sơ đồ tư duy Giản đồ ý). Ông hiện là tác giả của 92 đầu sách, được dịch ra trên 30 thứ tiếng, xuất bản trên 125 quốc gia.

Tony Buzzan là cố vấn cho một số tổ chức chính phủ và các công ty đa quốc gia hàng đầu thế giới như như Hewlett Packard, IBM, BP, Barclays International, EDS..., giảng viên thường xuyên của các đại học Oxford, Cambridge... Là một nhân vật truyền thông toàn cầu, ông đã xuất hiện trên 100 giờ ở các chương trình truyền hình, trên 1000 giờ ở các chương trình truyền thanh trong nước và trên thế giới với hơn 3 tỉ khán giả.

Và không chỉ nổi tiếng là một tác giả, diễn giả hàng đầu thế giới về não bộ và phương pháp học, cha đẻ của kĩ thuật Mindmap, Ông còn được biết đến là biên tập viên của tạp chí Mensa, tư vấn viên, cố vấn cho chính phủ của Anh, Tân Gia Ba, Mễ Tây Cơ..., một huấn luyện viên của Olympic, một vận động viên tài năng, một nhà thơ đã được nhận giải thưởng thi ca.

Website chính thức: www.tonybuzan.com', N'16.jpg              ')
INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (17, N'
Thích Nhất Hạnh', N'Thích Nhất Hạnh là một thiền sư, giảng viên, nhà văn, nhà thơ, nhà khảo cứu, nhà hoạt động xã hội, và người vận động cho hòa bình. Ông sinh ra ở Thừa Thiên Huế vào ngày 11/10/1926 xuất gia theo Thiền Tông năm 16 tuổi, trở thành một nhà sư vào năm 1949.

Ông là nhà lãnh đạo Phật giáo có ảnh hưởng lớn thứ hai ở phương Tây chỉ sau Đạt lại Lạt ma.', N'17.jpg              ')
INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (18, N'Trần Văn Sáu', NULL, N'                    ')
INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (19, N'Nhóm Sư Phạm VHP', NULL, N'                    ')
INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (20, N'Lê Văn Thông', NULL, N'                    ')
INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (21, N'Nguyễn Hải Châu', NULL, N'                    ')
INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (22, N'Trần Tước Nguyên', NULL, N'                    ')
INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (23, N'Nguyễn Xuân Lạc', NULL, N'                    ')
INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (24, N'Nicholas Sparks', N'Nicholas Sparks (sinh ngày 31/12/1965 tại Omaha, Nebraska, Mỹ) là nhà văn, nhà viết kịch bản và nhà sản xuất phim người Mỹ. Ông đã phát hành 17 tiểu thuyết  và 1 sách khác. Ông đã có 8 tiểu thuyết lãng mạn được dựng thành phim.

Có người từng ví vị trí của Nicholas Sparks tại Mỹ cũng giống như vị trí của Marc Levy tại Pháp, con gà đẻ trứng vàng của giới xuất bản.

Website chính thức: http://nicholassparks.com/', N'24.jpg              ')
INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (25, N'Ellen Crosby', NULL, NULL)
INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (26, N'Paulo Coelho', NULL, NULL)
INSERT [dbo].[TACGIA] ([Idtacgia], [Hoten], [Mota], [Hinhanh]) VALUES (27, N'Jojo Moyes', N'Cô sinh năm 1969. Năm 1992, cô nhận được học bổng cao học báo chí của tờ The Independent để theo học tại City University. Năm 1994, cô làm việc tại Hồng Kông cho tờ Sunday Morning Post. Jojo Moyes làm cho The Independentđược mười năm, từ trợ lý biên tập tin tức đến phóng viên mảng truyền thông và nghệ thuật. Từ năm 2002, cô theo đuổi nghề viết tiểu thuyết, với quyển đầu tiên Sheltering Rain. Với tác phẩm Bức thư tình cuối, cô được đông đảo bạn đọc biết đến và đã đoạt giải tiểu thuyết lãng mạn năm 2011 tại Anh.', N'27.jpg              ')
SET IDENTITY_INSERT [dbo].[TACGIA] OFF
GO
SET IDENTITY_INSERT [dbo].[TINTUC] ON 

INSERT [dbo].[TINTUC] ([Idtintuc], [Tieude], [Thoigiandang], [Noidungtomtat], [Hinhanh]) VALUES (1, N'Cởi Trói Linh Hồn - Quyển Sách Dành Cho Start-up Được Nữ Hoàng Truyền Thông Oprah Winfrey Khuyên Đọc', CAST(N'2021-12-12' AS Date), N'Tháng 9/2006, Oprah Winfrey được chọn bởi tạp chí Forbes để đưa vào danh sách 100 phụ nữ nhiều quyền lực nhất thế giới, với vị trí thứ 14. Nói về Cởi trói linh hồn, bà hoàng truyền thông Mỹ nhận xét: "Đây là cuốn sách yêu thích nhất của tôi và tôi đã tặng nó cho mỗi người bạn tham gia chương trình Super Soul Sunday".Oprah Gail Winfrey là người dẫn chương trình đối thoại trên truyền hình (talk show host) và là nhà xuất bản tạp chí, cũng từng đoạt giải Emmy dành cho người Mỹ gốc Phi. Winfrey là phụ nữ Mỹ gốc Phi đầu tiên có tên trong danh sách các tỉ phú và được xem là một trong những nhân vật có nhiều ảnh hưởng nhất trên thế giới.

Tác giả Michael A. Singer, thạc sĩ kinh tế tại Đại Học Florida, từng xuất hiện trong chương trình "Super Soul Sunday" của nữ hoàng truyền thông Mỹ Oprah Winfrey. Ông được trân trọng với vai trò là người thành lập trung tâm yoga và thiền định Temple of the Universe, hiện tại vẫn đang hoạt động. Đó là nơi mà mọi người thuộc bất kỳ tôn giáo hoặc tín ngưỡng nào đều có thể đến để cùng trải nghiệm bình an nội tại.', N'1.png               ')
INSERT [dbo].[TINTUC] ([Idtintuc], [Tieude], [Thoigiandang], [Noidungtomtat], [Hinhanh]) VALUES (2, N'7 cuốn sách không bao giờ cũ đối với người nhiều khát vọng làm giàu', CAST(N'2021-12-11' AS Date), N'Sách đóng vai trò quan trọng trong cuộc sống của các nhà đầu tư, nhà lãnh đạo và doanh nhân trên thế giới. Sau khi nghiên cứu và phỏng vấn hơn 100 triệu phú, John - chủ nhân của blog ESI Money đã tổng kết một danh sách những cuốn sách làm giàu đã làm thay đổi cuộc đời họ. Đó là những cuốn sách vô cùng nổi tiếng và có lẽ không bao giờ cũ đối với những người nhiều khát vọng đổi đời.

Chẳng có gì ngạc nhiên khi các doanh nhân đọc rộng và có nhiều sở thích. Sự đa dạng chung được nhận biết bởi những cuốn sách làm giàu ưa thích của họ. Câu chuyện của mỗi người minh họa những con đường khác nhau để trở thành tỷ phú.

Phỏng vấn 100 triệu phú thành công, John có được danh sách 56 cuốn sách được nhiều người khuyên đọc nhất. Đó là những cuốn sách thuộc các lĩnh vực đa dạng và mỗi triệu phú thích một vài cuốn sách nhất định.', N'2.png               ')
INSERT [dbo].[TINTUC] ([Idtintuc], [Tieude], [Thoigiandang], [Noidungtomtat], [Hinhanh]) VALUES (3, N'Bill Gates luôn mang theo một chiếc túi chứa đựng bí mật thành công của mình. Vậy bên trong đó có gì?', CAST(N'2021-12-15' AS Date), N'Sách là một thứ rất quan trọng trong cuộc đời của Bill Gates, nhờ đó mà chiếc túi xách cũng được nhận một vai diễn trong series phim mới của Netflix có tên là Inside Bill''s Brain (tạm dịch: Bên trong cái đầu của Bill). Cảnh mở đầu của bộ phim này diễn lại lúc Bill Gates cẩn thận đặt các quyển sách bìa cứng vào trong chiếc túi cho tới khi sách tràn ngang miệng túi. Có khoảng 15 quyển sách được ông cho vào túi, trong số ấy có cả những cuốn sách dày và nặng tới cả một kilogram.

Theo bạn bè thì Bill Gates rất "yêu thích đọc". Trợ tá của ông sẽ thay đổi các tựa sách trong chiếc túi ấy mỗi tuần và gói ghém cẩn thận cho mỗi chuyến đi. Trong một phân cảnh cửa bộ phim trên, người phụ tá của Bill Gates sẽ đọc hết tên của mỗi quyển sách trong khi chuẩn bị chiếc túi. Các tựa sách mà ông đọc trải dài từ những cuốn phi hư cấu như Measure What Matters, Bad Blood hay Educated tới những cuốn sách khoa học bao trùm những chủ đề như vắc-xin và cơ học lượng tử.

Một người bạn của Bill Gates còn kể rằng trong một kì nghỉ, ông mang theo tới 14 quyển sách. Người này nói: "Ông ấy không chỉ đọc một mà tới năm cuốn sách khác nhau về cùng một chủ đề, không phải ai cũng có thể hấp thụ được nội dung có trong số sách ấy. Bill luôn là người hiểu biết rộng hơn bất kì ai đang đối thoại với ông".', N'3.png               ')
INSERT [dbo].[TINTUC] ([Idtintuc], [Tieude], [Thoigiandang], [Noidungtomtat], [Hinhanh]) VALUES (4, N'Nếu không phải là một cái cây, lý gì bạn lại ở yên một chỗ?', CAST(N'2021-12-16' AS Date), N'Cách duy nhất là hãy biến từng phút giây bạn đang sống trở nên ý nghĩa hơn và giải pháp là không ngừng đặt bản thân vào tâm thế sẵn sàng trải nghiệm mọi thứ xảy ra xung quanh mình. Đừng ngại ngùng, đừng lười biếng, đừng sợ hãi nữa!
Có một câu nói về giá trị bản thân trong cuốn sách “7 thói quen của bạn trẻ thành đạt” mà Sean Covey đã viết: “Nếu như bạn có những thứ giúp chứng minh bạn là ai, thì khi những thứ đó mất đi, bạn là ai?” Chúng ta thường hay tìm kiếm những thứ bên ngoài để chứng minh bản thân mình: quần áo, điện thoại, hàng hiệu, xe cộ, nhà cửa, công việc, gia thế… Những thứ này là minh chứng hoàn hảo nói về một con người ở thì hiện tại nhưng tất cả chúng lại là những thứ có thể mất đi. Bạn dùng chúng để chứng tỏ mình, bạn có dám đảm bảo chúng sẽ tồn tại mãi mãi không? Một công việc tốt, một tình yêu đẹp, một gia đình hạnh phúc, một căn nhà tiện nghi… tất cả đều có thể biến mất. Và khi chúng mất hết rồi thì bạn là ai? Dùng vật chất để định nghĩa bản thân mình là điều ngốc nghếch mà tuổi trẻ rất thường hay mắc phải.

Vật chất nhiều đến mấy cũng có thể mất đi còn trải nghiệm của bạn thì sao? Hãy yên tâm rằng chúng là của bạn, luôn là của bạn, mãi mãi là của bạn, chúng sẽ không bao giờ mất đi. Hãy dùng những trải nghiệm để chứng tỏ giá trị bản thân, bạn sẽ nhận ra mình đặc biệt và quý giá hơn hết mọi vật phẩm trang trí bên ngoài.

Hãy luôn tâm niệm rằng, cuộc sống thực chất là một cuộc trải nghiệm lớn mà trong đó bạn phải đi tìm những mảnh ghép là những trải nghiệm nhỏ để từ đó ghép nên cuộc đời mình. Khi tâm niệm cuộc đời chỉ là cuộc trải nghiệm, bạn sẽ không bị áp lực với mọi sự lựa chọn của mình trong đời, đó là một cuộc chơi, không ai thắng và cũng không ai thua. Suy cho cùng, ai rồi cũng đến lúc phải giã từ cuộc sống, người may mắn hơn là người sống được nhiều hơn những người khác, sống nhiều hơn không có nghĩa là sống lâu hơn nhưng là sống được nhiều khoảnh khắc hơn trong đời, như Jean Jacques Rousseau nói: “Người sống nhiều nhất không phải người sống lâu năm nhất mà là người có nhiều trải nghiệm phong phú nhất.”Chúng ta thường hay tìm kiếm những thứ bên ngoài để chứng minh bản thân mình: quần áo, điện thoại, hàng hiệu, xe cộ, nhà cửa, công việc, gia thế… Những thứ này là minh chứng hoàn hảo nói về một con người ở thì hiện tại nhưng tất cả chúng lại là những thứ có thể mất đi. Bạn dùng chúng để chứng tỏ mình, bạn có dám đảm bảo chúng sẽ tồn tại mãi mãi không? Một công việc tốt, một tình yêu đẹp, một gia đình hạnh phúc, một căn nhà tiện nghi… tất cả đều có thể biến mất. Và khi chúng mất hết rồi thì bạn là ai? Dùng vật chất để định nghĩa bản thân mình là điều ngốc nghếch mà tuổi trẻ rất thường hay mắc phải.

Vật chất nhiều đến mấy cũng có thể mất đi còn trải nghiệm của bạn thì sao? Hãy yên tâm rằng chúng là của bạn, luôn là của bạn, mãi mãi là của bạn, chúng sẽ không bao giờ mất đi. Hãy dùng những trải nghiệm để chứng tỏ giá trị bản thân, bạn sẽ nhận ra mình đặc biệt và quý giá hơn hết mọi vật phẩm trang trí bên ngoài.

Hãy luôn tâm niệm rằng, cuộc sống thực chất là một cuộc trải nghiệm lớn mà trong đó bạn phải đi tìm những mảnh ghép là những trải nghiệm nhỏ để từ đó ghép nên cuộc đời mình. Khi tâm niệm cuộc đời chỉ là cuộc trải nghiệm, bạn sẽ không bị áp lực với mọi sự lựa chọn của mình trong đời, đó là một cuộc chơi, không ai thắng và cũng không ai thua. Suy cho cùng, ai rồi cũng đến lúc phải giã từ cuộc sống, người may mắn hơn là người sống được nhiều hơn những người khác, sống nhiều hơn không có nghĩa là sống lâu hơn nhưng là sống được nhiều khoảnh khắc hơn trong đời, như Jean Jacques Rousseau nói: “Người sống nhiều nhất không phải người sống lâu năm nhất mà là người có nhiều trải nghiệm phong phú nhất.”', N'4.png               ')
SET IDENTITY_INSERT [dbo].[TINTUC] OFF
GO
SET IDENTITY_INSERT [dbo].[USER] ON 

INSERT [dbo].[USER] ([Iduser], [Matkhau], [Email], [Hoten], [Gioitinh], [Ngaysinh], [Taikhoan], [Diachi]) VALUES (1, N'kieu                ', N'kieu@gmail.com', N'Kiều', N'Nữ        ', CAST(N'2000-09-06' AS Date), N'kieu', NULL)
INSERT [dbo].[USER] ([Iduser], [Matkhau], [Email], [Hoten], [Gioitinh], [Ngaysinh], [Taikhoan], [Diachi]) VALUES (2, N'kieuvo              ', N'kieuvo@gmail.com', N'Kiều Võ ', N'Nữ        ', CAST(N'1999-09-21' AS Date), N'kieuvo', NULL)
INSERT [dbo].[USER] ([Iduser], [Matkhau], [Email], [Hoten], [Gioitinh], [Ngaysinh], [Taikhoan], [Diachi]) VALUES (13, N'kieu12345           ', N'kieuvo@gmail.com', N'Thanh Kiều', N'a         ', CAST(N'2013-06-08' AS Date), N'kieu123', N'Bình Định')
INSERT [dbo].[USER] ([Iduser], [Matkhau], [Email], [Hoten], [Gioitinh], [Ngaysinh], [Taikhoan], [Diachi]) VALUES (21, N'kieu12345           ', N'thanhkieuvo@gmail.com', N'Thanh Kiều', NULL, NULL, N'kieuuu', NULL)
INSERT [dbo].[USER] ([Iduser], [Matkhau], [Email], [Hoten], [Gioitinh], [Ngaysinh], [Taikhoan], [Diachi]) VALUES (22, N'12345678            ', N'kieuvo69@gmail.com', N'Võ Thị Thanh Kiều', N'Nữ        ', CAST(N'2022-11-11' AS Date), N'kieuuuuu', N'Tân Bình')
INSERT [dbo].[USER] ([Iduser], [Matkhau], [Email], [Hoten], [Gioitinh], [Ngaysinh], [Taikhoan], [Diachi]) VALUES (23, N'kieu12345           ', N'thanhkieuvo0609@gmail.com', N'Thanh Kiều', N'Nam       ', CAST(N'2022-02-11' AS Date), N'kieuv', N'Bình Định')
SET IDENTITY_INSERT [dbo].[USER] OFF
GO
ALTER TABLE [dbo].[CHITIETDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETDATHANG_DONDATHANG] FOREIGN KEY([Idddh])
REFERENCES [dbo].[DONDATHANG] ([Idddh])
GO
ALTER TABLE [dbo].[CHITIETDATHANG] CHECK CONSTRAINT [FK_CHITIETDATHANG_DONDATHANG]
GO
ALTER TABLE [dbo].[CHITIETDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETDATHANG_SACH] FOREIGN KEY([Idsach])
REFERENCES [dbo].[SACH] ([Idsach])
GO
ALTER TABLE [dbo].[CHITIETDATHANG] CHECK CONSTRAINT [FK_CHITIETDATHANG_SACH]
GO
ALTER TABLE [dbo].[CHITIETHDBL]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETHDBL_HOADONBANLE] FOREIGN KEY([Idhdbl])
REFERENCES [dbo].[HOADONBANLE] ([Idhdbl])
GO
ALTER TABLE [dbo].[CHITIETHDBL] CHECK CONSTRAINT [FK_CHITIETHDBL_HOADONBANLE]
GO
ALTER TABLE [dbo].[CHITIETHDBL]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETHDBL_SACH] FOREIGN KEY([Idsach])
REFERENCES [dbo].[SACH] ([Idsach])
GO
ALTER TABLE [dbo].[CHITIETHDBL] CHECK CONSTRAINT [FK_CHITIETHDBL_SACH]
GO
ALTER TABLE [dbo].[CHITIETHOADON]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETHOADON_HOADON] FOREIGN KEY([Idhd])
REFERENCES [dbo].[HOADON] ([Idhd])
GO
ALTER TABLE [dbo].[CHITIETHOADON] CHECK CONSTRAINT [FK_CHITIETHOADON_HOADON]
GO
ALTER TABLE [dbo].[CHITIETHOADON]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETHOADON_SACH] FOREIGN KEY([Idsach])
REFERENCES [dbo].[SACH] ([Idsach])
GO
ALTER TABLE [dbo].[CHITIETHOADON] CHECK CONSTRAINT [FK_CHITIETHOADON_SACH]
GO
ALTER TABLE [dbo].[DANHGIA]  WITH CHECK ADD  CONSTRAINT [FK_DANHGIA_SACH] FOREIGN KEY([Idsach])
REFERENCES [dbo].[SACH] ([Idsach])
GO
ALTER TABLE [dbo].[DANHGIA] CHECK CONSTRAINT [FK_DANHGIA_SACH]
GO
ALTER TABLE [dbo].[DANHGIA]  WITH CHECK ADD  CONSTRAINT [FK_DANHGIA_USER] FOREIGN KEY([Iduser])
REFERENCES [dbo].[USER] ([Iduser])
GO
ALTER TABLE [dbo].[DANHGIA] CHECK CONSTRAINT [FK_DANHGIA_USER]
GO
ALTER TABLE [dbo].[DANHMUC]  WITH CHECK ADD  CONSTRAINT [FK_DANHMUC_LOAISACH] FOREIGN KEY([Idloaisach])
REFERENCES [dbo].[LOAISACH] ([Idloaisach])
GO
ALTER TABLE [dbo].[DANHMUC] CHECK CONSTRAINT [FK_DANHMUC_LOAISACH]
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONDATHANG_NHACUNGCAP] FOREIGN KEY([Idnhacungcap])
REFERENCES [dbo].[NHACUNGCAP] ([IdNCC])
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [FK_DONDATHANG_NHACUNGCAP]
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONDATHANG_NHANVIEN] FOREIGN KEY([Idnhanvien])
REFERENCES [dbo].[NHANVIEN] ([Idnhanvien])
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [FK_DONDATHANG_NHANVIEN]
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK_HOADON_DONDATHANG] FOREIGN KEY([Idddh])
REFERENCES [dbo].[DONDATHANG] ([Idddh])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK_HOADON_DONDATHANG]
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK_HOADON_NHANVIEN] FOREIGN KEY([Idnhanvien])
REFERENCES [dbo].[NHANVIEN] ([Idnhanvien])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK_HOADON_NHANVIEN]
GO
ALTER TABLE [dbo].[HOADONBANLE]  WITH CHECK ADD  CONSTRAINT [FK_HOADONBANLE_NHANVIEN] FOREIGN KEY([Idnhanvien])
REFERENCES [dbo].[NHANVIEN] ([Idnhanvien])
GO
ALTER TABLE [dbo].[HOADONBANLE] CHECK CONSTRAINT [FK_HOADONBANLE_NHANVIEN]
GO
ALTER TABLE [dbo].[HOADONBANLE]  WITH CHECK ADD  CONSTRAINT [FK_HOADONBANLE_USER] FOREIGN KEY([Iduser])
REFERENCES [dbo].[USER] ([Iduser])
GO
ALTER TABLE [dbo].[HOADONBANLE] CHECK CONSTRAINT [FK_HOADONBANLE_USER]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK_NHANVIEN_LOAINV] FOREIGN KEY([Idloainhanvien])
REFERENCES [dbo].[LOAINV] ([Idloainhanvien])
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK_NHANVIEN_LOAINV]
GO
ALTER TABLE [dbo].[SACH]  WITH CHECK ADD  CONSTRAINT [FK_SACH_DANHMUC] FOREIGN KEY([Iddanhmuc])
REFERENCES [dbo].[DANHMUC] ([Iddanhmuc])
GO
ALTER TABLE [dbo].[SACH] CHECK CONSTRAINT [FK_SACH_DANHMUC]
GO
ALTER TABLE [dbo].[SACH]  WITH CHECK ADD  CONSTRAINT [FK_SACH_NHAXUATBAN] FOREIGN KEY([IdNXB])
REFERENCES [dbo].[NHAXUATBAN] ([IdNXB])
GO
ALTER TABLE [dbo].[SACH] CHECK CONSTRAINT [FK_SACH_NHAXUATBAN]
GO
ALTER TABLE [dbo].[SACHTHUOCTACGIA]  WITH CHECK ADD  CONSTRAINT [FK_SACHTHUOCTACGIA_SACH] FOREIGN KEY([Idsach])
REFERENCES [dbo].[SACH] ([Idsach])
GO
ALTER TABLE [dbo].[SACHTHUOCTACGIA] CHECK CONSTRAINT [FK_SACHTHUOCTACGIA_SACH]
GO
ALTER TABLE [dbo].[SACHTHUOCTACGIA]  WITH CHECK ADD  CONSTRAINT [FK_SACHTHUOCTACGIA_TACGIA] FOREIGN KEY([Idtacgia])
REFERENCES [dbo].[TACGIA] ([Idtacgia])
GO
ALTER TABLE [dbo].[SACHTHUOCTACGIA] CHECK CONSTRAINT [FK_SACHTHUOCTACGIA_TACGIA]
GO
USE [master]
GO
ALTER DATABASE [Bán Sách] SET  READ_WRITE 
GO
