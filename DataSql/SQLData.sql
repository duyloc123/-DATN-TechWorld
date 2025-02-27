USE [master]
GO
/****** Object:  Database [TechWorld]    Script Date: 11/29/2024 2:47:54 PM ******/
CREATE DATABASE [TechWorld]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TechWorld', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TechWorld.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TechWorld_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TechWorld_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TechWorld] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TechWorld].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TechWorld] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TechWorld] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TechWorld] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TechWorld] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TechWorld] SET ARITHABORT OFF 
GO
ALTER DATABASE [TechWorld] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TechWorld] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TechWorld] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TechWorld] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TechWorld] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TechWorld] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TechWorld] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TechWorld] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TechWorld] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TechWorld] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TechWorld] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TechWorld] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TechWorld] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TechWorld] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TechWorld] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TechWorld] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TechWorld] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TechWorld] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TechWorld] SET  MULTI_USER 
GO
ALTER DATABASE [TechWorld] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TechWorld] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TechWorld] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TechWorld] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TechWorld] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TechWorld] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TechWorld] SET QUERY_STORE = ON
GO
ALTER DATABASE [TechWorld] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TechWorld]
GO
/****** Object:  Table [dbo].[AnhSP]    Script Date: 11/29/2024 2:47:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnhSP](
	[MaHinh] [int] IDENTITY(1,1) NOT NULL,
	[HinhAnh] [nvarchar](1000) NULL,
	[MASP] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 11/29/2024 2:47:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaDH] [varchar](10) NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[TongTien] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 11/29/2024 2:47:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDH] [varchar](10) NOT NULL,
	[NgayDat] [datetime] NULL,
	[TongTien] [float] NOT NULL,
	[PTThanhToan] [nvarchar](100) NULL,
	[TTDonHang] [nvarchar](50) NULL,
	[TTThanhToan] [nvarchar](50) NULL,
	[MAKH] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 11/29/2024 2:47:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](200) NULL,
	[SoDienThoai] [nvarchar](20) NULL,
	[MatKhau] [nvarchar](20) NOT NULL,
	[ChucVu] [nvarchar](20)
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiHang]    Script Date: 11/29/2024 2:47:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiHang](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](100) NOT NULL,
	[HinhAnh] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 11/29/2024 2:47:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](100) NOT NULL,
	[SoDienThoaiNCC] [nvarchar](20) NOT NULL,
	[DiaChiNCC] [nvarchar](200) NOT NULL,
	[HinhAnh] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 11/29/2024 2:47:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](100) NOT NULL,
	[NgayNhap] [date] NOT NULL,
	[GiaTien] [float] NOT NULL,
	[GiaTienDaKhuyenMai] [float] NULL,
	[SoLuong] [int] NOT NULL,
	[MoTa] [nvarchar](max) NOT NULL,
	[MoTaSanPham] [nvarchar](max) NOT NULL,
	[HinhAnh] [nvarchar](1000) NULL,
	[GiamGia] [nvarchar](10) NULL,
	[TinhTrangSP] [nvarchar](50) NULL,
	[MaLoai] [int] NULL,
	[MaNCC] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 11/29/2024 2:47:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[MaTin] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](255) NOT NULL,
	[NoiDung] [nvarchar](max) NULL,
	[NgayDang] [date] NOT NULL,
	[TacGia] [nvarchar](100) NULL,
	[HinhAnh] [nvarchar](1000) NULL,
	[TrangThai] [nvarchar](20) NULL,
	[TrangDang] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YeuThich]    Script Date: 11/29/2024 2:47:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YeuThich](
	[MaKH] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[NgayThemVao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AnhSP] ON 

INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (21, N'DataImageSql/mau-titan-sa-mac-iphone-16-pro-max (1).jpg', 7)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (22, N'DataImageSql/S24(1).jpg', 8)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (23, N'DataImageSql/dell-inspiron-15-(1).jpg', 11)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (24, N'DataImageSql/dell-inspiron-15-(2).jpg', 11)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (25, N'DataImageSql/dell-inspiron-15-(3).jpg', 11)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (26, N'DataImageSql/mac-m1-vang-2(2).png', 12)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (27, N'DataImageSql/mac-m1-vang-3(3).png', 12)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (28, N'DataImageSql/mac-m1-vang-4(4).png', 12)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (29, N'DataImageSql/Laptop Lenovo ThinkBook 14 (2).png', 13)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (30, N'DataImageSql/Laptop Lenovo ThinkBook 14 (3).png', 13)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (31, N'DataImageSql/Laptop Dell Latitude 3540 71038101(2).jpg', 14)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (32, N'DataImageSql/Laptop Dell Latitude 3540 71038101(3).jpg', 14)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (33, N'DataImageSql/Laptop Dell Latitude 3550 42LT355001(2).jpg', 15)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (34, N'DataImageSql/Laptop Dell Latitude 3550 42LT355001(3).jpg', 15)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (35, N'DataImageSql/Laptop Dell XPS 13 9340 71034922 (Intel Core Ultra 5(2).jpg', 16)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (36, N'DataImageSql/Laptop Dell XPS 13 9340 71034922 (Intel Core Ultra 5(3).jpg', 16)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (37, N'DataImageSql/hp_eEliteBook_640(2).jpg', 17)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (38, N'DataImageSql/hp_eEliteBook_640(3).jpg', 17)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (40, N'DataImageSql/hp_pavilion_x360(2).jpg', 18)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (41, N'DataImageSql/hp_pavilion_x360(3).jpg', 18)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (42, N'DataImageSql/hp_pavilion_15(2).jpg', 19)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (43, N'DataImageSql/hp_pavilion_15(3).jpg', 19)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (44, N'DataImageSql/hp_pavillon(2).jpg', 20)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (45, N'DataImageSql/hp_pavillon(3).jpg', 20)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (46, N'DataImageSql/hp_victus_16(2).jpg', 21)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (47, N'DataImageSql/hp_victus_16(3).jpg', 21)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (48, N'DataImageSql/Laptop Lenovo IdeaPad Slim 5 14IMH9 83DA001NVN(2).jpg', 22)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (49, N'DataImageSql/Laptop Lenovo IdeaPad Slim 5 14IMH9 83DA001NVN(3).jpg', 22)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (50, N'DataImageSql/Laptop Lenovo ThinkBook 14 (2).png', 23)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (51, N'DataImageSql/Laptop Lenovo ThinkBook 14 (3).png', 23)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (52, N'DataImageSql/Laptop Lenovo ThinkPad P16s Gen3 T 21KS0038VA(2).jpg', 24)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (53, N'DataImageSql/Laptop Lenovo ThinkPad P16s Gen3 T 21KS0038VA(3).jpg', 24)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (54, N'DataImageSql/Laptop Lenovo Yoga 9 2-in-1 14IMH9 83AC000SVN(2).jpg', 25)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (55, N'DataImageSql/Laptop Lenovo Yoga 9 2-in-1 14IMH9 83AC000SVN(3).jpg', 25)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (56, N'DataImageSql/Laptop Apple MacBook Air 13 inch M3(2).jpg', 26)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (57, N'DataImageSql/Laptop Apple MacBook Air 13 inch M3(3).jpg', 26)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (58, N'DataImageSql/Laptop Apple Macbook Air 13.6 inch M2(2).jpg', 27)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (59, N'DataImageSql/Laptop Apple Macbook Air 13.6 inch M2(3).jpg', 27)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (62, N'DataImageSql/MacBook Pro 16 M3 PRO(2).jpg', 29)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (63, N'DataImageSql/MacBook Pro 16 M3 PRO(3).jpg', 29)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (64, N'DataImageSql/Ghế game Corsair T3 RUSH Brown Tan(2).jpg', 30)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (65, N'DataImageSql/Ghế game Corsair T3 RUSH Brown Tan(3).jpg', 30)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (66, N'DataImageSql/Ghế game Corsair T3 RUSH Gray White(2).jpg', 31)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (67, N'DataImageSql/Ghế game Corsair T3 RUSH Gray White(3).jpg', 31)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (68, N'DataImageSql/Ghế game Corsair TC100 RELAXED Fabric Black(2).jpg', 32)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (69, N'DataImageSql/Ghế game Corsair TC100 RELAXED Fabric Black(3).jpg', 32)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (70, N'DataImageSql/Ghế game Corsair TC200 Fabric Light Grey White(2).jpg', 33)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (71, N'DataImageSql/Ghế game Corsair TC200 Fabric Light Grey White(3).jpg', 33)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (72, N'DataImageSql/Ghế game Corsair TC500 LUXE Frost(2).jpg', 34)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (73, N'DataImageSql/Ghế game Corsair TC500 LUXE Frost(3).jpg', 34)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (74, N'DataImageSql/Ghế game E-Dra Hunter EGC206 White(2).jpg', 36)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (75, N'DataImageSql/Ghế game E-Dra Hunter EGC206 White(3).jpg', 36)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (76, N'DataImageSql/Ghế game E-Dra LUX Champion EGC2022 Real Leather(2).jpg', 37)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (77, N'DataImageSql/Ghế game E-Dra LUX Champion EGC2022 Real Leather(3).jpg', 37)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (78, N'DataImageSql/Ghế game E-Dra Wisdom EGC231 Fabric(2).jpg', 38)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (79, N'DataImageSql/Ghế game E-Dra Wisdom EGC231 Fabric(3).jpg', 38)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (80, N'DataImageSql/Ghế game E-Dra Yummy EGC232 V2 Black Red(2).jpg', 39)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (81, N'DataImageSql/Ghế game E-Dra Yummy EGC232 V2 Black Red(3).jpg', 39)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (82, N'DataImageSql/Ghế WARRIOR lmmortal Series WGC225(2).jpg', 40)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (83, N'DataImageSql/Ghế WARRIOR lmmortal Series WGC225(3).jpg', 40)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (84, N'DataImageSql/Ghế WARRIOR Raider Series WGC203 Black(2).jpg', 41)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (85, N'DataImageSql/Ghế WARRIOR Raider Series WGC203 Black(3).jpg', 41)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (86, N'DataImageSql/Ghế WARRIOR Raider Series WGC206 White Pink(2).jpg', 42)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (87, N'DataImageSql/Ghế WARRIOR Raider Series WGC206 White Pink(3).jpg', 42)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (88, N'DataImageSql/Tai nghe Corsair HS35 V2 Carbon(2).jpg', 43)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (89, N'DataImageSql/Tai nghe Corsair HS35 V2 Carbon(3).jpg', 43)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (90, N'DataImageSql/Tai nghe Corsair HS55 Stereo White(2).jpg', 44)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (91, N'DataImageSql/Tai nghe Corsair HS55 Stereo White(3).jpg', 44)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (92, N'DataImageSql/Tai nghe Corsair HS70 Pro Wireless Carbon(2).png', 45)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (93, N'DataImageSql/Tai nghe Corsair HS70 Pro Wireless Carbon(3).png', 45)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (94, N'DataImageSql/Tai nghe Corsair HS80 MAX Wireless White(2).jpg', 46)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (95, N'DataImageSql/Tai nghe Corsair HS80 MAX Wireless White(3).jpg', 46)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (96, N'DataImageSql/Tai nghe Corsair Virtuoso Wireless Pearl(2).png', 47)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (97, N'DataImageSql/Tai nghe Corsair Virtuoso Wireless Pearl(3).png', 47)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (98, N'DataImageSql/Tai nghe HyperX Cloud III Wireless Black Red(2).jpg', 48)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (99, N'DataImageSql/Tai nghe HyperX Cloud III Wireless Black Red(3).jpg', 48)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (100, N'DataImageSql/Tai nghe HyperX Cloud Stinger 2(2).jpg', 49)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (101, N'DataImageSql/Tai nghe HyperX Cloud Stinger 2(3).jpg', 49)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (102, N'DataImageSql/razer_leaviathanV2_(2).jpg', 51)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (103, N'DataImageSql/razer_backshark(2).jpg', 52)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (104, N'DataImageSql/razer_backshark(3).jpg', 52)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (105, N'DataImageSql/iphone15PX_(2).png', 53)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (106, N'DataImageSql/iphone15PX_(3).png', 53)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (107, N'DataImageSql/iphone15PX_(4).png', 53)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (108, N'DataImageSql/iphone16Pro_(2).jpeg', 55)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (109, N'DataImageSql/iphone16Pro_(3).jpeg', 55)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (110, N'DataImageSql/nokia_105(2).jpg', 56)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (111, N'DataImageSql/nokia_105(3).jpg', 56)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (112, N'DataImageSql/nokia_105(4).jpg', 56)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (113, N'DataImageSql/nokia_220(2).jpg', 57)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (114, N'DataImageSql/nokia_220(3).jpg', 57)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (115, N'DataImageSql/galaxy_ZFold6_(2).jpg', 58)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (116, N'DataImageSql/galaxy_ZFold6_(3).jpg', 58)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (117, N'DataImageSql/galaxy_ZFold6_(4).jpg', 58)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (119, N'DataImageSql/galaxy_ZFlip6_(2).jpg', 59)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (120, N'DataImageSql/galaxy_ZFlip6_(3).jpg', 59)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (121, N'DataImageSql/CASE AIGO C218M WHITE(3).jpg', 60)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (122, N'DataImageSql/CASE AIGO C218M WHITE(2).jpg', 60)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (123, N'DataImageSql/CASE ASUS TUF GAMING GT302 ARGB BLACK(2).jpg', 61)
GO
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (124, N'DataImageSql/CASE ASUS TUF GAMING GT302 ARGB BLACK(3).jpg', 61)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (125, N'DataImageSql/CASE JONSBO D41 STD(2).jpg', 62)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (126, N'DataImageSql/CASE JONSBO D41 STD(3).jpg', 62)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (127, N'DataImageSql/CASE NZXT H7 FLOW RGB(2).jpg', 63)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (128, N'DataImageSql/CASE NZXT H7 FLOW RGB(3).jpg', 63)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (129, N'DataImageSql/CPU Intel Core i3 12100(2).jpg', 64)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (130, N'DataImageSql/Mainboard Asus B760M-AYW(2).jpg', 68)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (131, N'DataImageSql/Mainboard Asus B760M-AYW(3).jpg', 68)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (132, N'DataImageSql/Mainboard Asus TUF GAMING B760M-PLUS(2).jpg', 69)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (133, N'DataImageSql/Mainboard Asus TUF GAMING B760M-PLUS(3).jpg', 69)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (134, N'DataImageSql/Nguồn máy tính AIGO VK450 - 450W(2).png', 70)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (135, N'DataImageSql/Nguồn máy tính AIGO VK450 - 450W(3).png', 70)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (136, N'DataImageSql/Nguồn Máy Tính Asus ROG STRIX 1000W(2).jpg', 71)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (137, N'DataImageSql/Nguồn Máy Tính Asus ROG STRIX 1000W(3).jpg', 71)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (138, N'DataImageSql/VGA Asus PRIME RTX 4070 SUPER 12GB GDDR6X(2).jpg', 76)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (139, N'DataImageSql/VGA Asus PRIME RTX 4070 SUPER 12GB GDDR6X(3).jpg', 76)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (140, N'DataImageSql/VGA_Asus ROG Strix-RTX4090-OC 24GB(2).jpg', 77)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (141, N'DataImageSql/VGA_Asus ROG Strix-RTX4090-OC 24GB(3).jpg', 77)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (142, N'DataImageSql/VGA ASUS Dual GeForce RTX 3060 V2 OC 12GB GDDR6(2).png', 78)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (143, N'DataImageSql/VGA ASUS Dual GeForce RTX 3060 V2 OC 12GB GDDR6(3).png', 78)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (144, N'DataImageSql/Acer Nitro_ED270R-S3(2).jpg', 79)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (145, N'DataImageSql/Acer Nitro_ED270R-S3(3).jpg', 79)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (146, N'DataImageSql/Acer_B278U(2).jpg', 80)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (147, N'DataImageSql/Acer_B278U(3).jpg', 80)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (148, N'DataImageSql/Acer_ẸK251Q-E(2).jpg', 81)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (149, N'DataImageSql/Acer_ẸK251Q-E(3).jpg', 81)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (150, N'DataImageSql/Dell UltraSharp_U2724D(2).jpg', 82)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (151, N'DataImageSql/Dell UltraSharp_U2724D(3).jpg', 82)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (152, N'DataImageSql/Dell UltraSharp_U3425WE(2).jpg', 83)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (153, N'DataImageSql/Dell UltraSharp_U3425WE(3).jpg', 83)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (156, N'DataImageSql/lg_UltraGear 34GP63A-B(2).jpg', 85)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (157, N'DataImageSql/lg_UltraGear 34GP63A-B(3).jpg', 85)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (158, N'DataImageSql/lg_UltraWide 38WR85QC-W(2).jpg', 86)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (159, N'DataImageSql/lg_UltraWide 38WR85QC-W(3).jpg', 86)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (160, N'DataImageSql/corsairK100_(2).jpg', 87)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (161, N'DataImageSql/corsairK100_(3).jpg', 87)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (162, N'DataImageSql/corsairK70_(2).jpg', 88)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (163, N'DataImageSql/logitech_white_(2).jpg', 89)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (164, N'DataImageSql/logitech_g613(2).png', 90)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (165, N'DataImageSql/razer_black(2).jpg', 91)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (166, N'DataImageSql/razer_v4(2).png', 92)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (167, N'DataImageSql/chuot_corsair_(2).jpg', 93)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (168, N'DataImageSql/chuot_katar(2).jpg', 94)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (169, N'DataImageSql/logitech_g_pro(2).jpg', 95)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (170, N'DataImageSql/logitech_g_pro(3).jpg', 95)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (171, N'DataImageSql/logitech_gPro_(2).jpg', 96)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (172, N'DataImageSql/razer_viper_v3(1).jpg', 97)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (173, N'DataImageSql/razer_viper_v3(2).jpg', 97)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (174, N'DataImageSql/razer_deathadder_(2).jpg', 98)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (175, N'DataImageSql/Laptop Asus ROG Strix G16 G614JVR-N4162W(2).jpg', 99)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (176, N'DataImageSql/Laptop Asus ROG Strix G16 G614JVR-N4162W(3).jpg', 99)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (177, N'DataImageSql/Laptop ASUS ROG Zephyrus G16 GA605WI-QR156WS(2).jpg', 100)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (178, N'DataImageSql/Laptop ASUS ROG Zephyrus G16 GA605WI-QR156WS(3).jpg', 100)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (179, N'DataImageSql/Laptop MSI Cyborg 15 A12UCX-618VN(2).jpg', 101)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (180, N'DataImageSql/Laptop MSI Cyborg 15 A12UCX-618VN(3).jpg', 101)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (181, N'DataImageSql/Laptop MSI Sword 16 HX B14VFKG-460VN(2).jpg', 102)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (182, N'DataImageSql/Laptop MSI Sword 16 HX B14VFKG-460VN(3).jpg', 102)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (183, N'DataImageSql/gagibyte_g5_(2).jpg', 103)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (184, N'DataImageSql/gagibyte_g5_(3).jpg', 103)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (185, N'DataImageSql/gigabyte_16X_(2).jpg', 104)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (186, N'DataImageSql/gigabyte_16X_(3).jpg', 104)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (187, N'DataImageSql/rog_zephyrus_(2).jpg', 105)
INSERT [dbo].[AnhSP] ([MaHinh], [HinhAnh], [MASP]) VALUES (188, N'DataImageSql/rog_zephyrus_(3).jpg', 105)
SET IDENTITY_INSERT [dbo].[AnhSP] OFF
GO
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [TongTien]) VALUES (N'HD#2044', 13, 2, 26982000)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [TongTien]) VALUES (N'HD#2044', 79, 1, 4599080)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [TongTien]) VALUES (N'HD#2044', 80, 1, 10341000)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [TongTien]) VALUES (N'HD#2044', 82, 1, 12231000)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [TongTien]) VALUES (N'HD#2044', 85, 1, 10799100)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [TongTien]) VALUES (N'HD#2044', 86, 1, 29699100)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [TongTien]) VALUES (N'HD#2044', 87, 1, 5399100)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [TongTien]) VALUES (N'HD#2044', 89, 1, 34900000)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [TongTien]) VALUES (N'HD#2044', 92, 1, 4499000)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [TongTien]) VALUES (N'HD#2044', 93, 1, 1329050)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [TongTien]) VALUES (N'HD#2044', 94, 1, 389000)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [TongTien]) VALUES (N'HD#2044', 99, 1, 47691000)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [TongTien]) VALUES (N'HD#2044', 100, 1, 61191000)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [TongTien]) VALUES (N'HD#2044', 105, 1, 49491000)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [TongTien]) VALUES (N'HD#2856', 11, 1, 15665500)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [TongTien]) VALUES (N'HD#3513', 12, 1, 16615500)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [TongTien]) VALUES (N'HD#4517', 11, 1, 15665500)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [TongTien]) VALUES (N'HD#7376', 8, 2, 45000000)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [TongTien]) VALUES (N'HD#7376', 53, 2, 6838200)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [TongTien]) VALUES (N'HD#7376', 54, 2, 49381000)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [TongTien]) VALUES (N'HD#7376', 56, 2, 1360000)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [TongTien]) VALUES (N'HD#7376', 57, 2, 1980000)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSP], [SoLuong], [TongTien]) VALUES (N'HD#9854', 8, 1, 22500000)
GO
INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [TongTien], [PTThanhToan], [TTDonHang], [TTThanhToan], [MAKH]) VALUES (N'HD#2044', CAST(N'2024-11-29T13:47:30.210' AS DateTime), 299540430, N'COD', N'Chưa giao hàng', N'Chưa thanh toán', 2)
INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [TongTien], [PTThanhToan], [TTDonHang], [TTThanhToan], [MAKH]) VALUES (N'HD#2856', CAST(N'2024-11-29T14:24:55.140' AS DateTime), 15665500, N'Paypal', N'Chưa giao hàng', N'Chưa thanh toán', 2)
INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [TongTien], [PTThanhToan], [TTDonHang], [TTThanhToan], [MAKH]) VALUES (N'HD#3513', CAST(N'2024-11-29T14:32:49.240' AS DateTime), 16615500, N'Paypal', N'Chưa giao hàng', N'Chưa thanh toán', 2)
INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [TongTien], [PTThanhToan], [TTDonHang], [TTThanhToan], [MAKH]) VALUES (N'HD#4517', CAST(N'2024-11-29T14:30:27.707' AS DateTime), 15665500, N'Paypal', N'Chưa giao hàng', N'Đã thanh toán', 2)
INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [TongTien], [PTThanhToan], [TTDonHang], [TTThanhToan], [MAKH]) VALUES (N'HD#7376', CAST(N'2024-11-29T13:44:57.463' AS DateTime), 104559200, N'COD', N'Chưa giao hàng', N'Chưa thanh toán', 2)
INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [TongTien], [PTThanhToan], [TTDonHang], [TTThanhToan], [MAKH]) VALUES (N'HD#9854', CAST(N'2024-11-29T14:24:37.467' AS DateTime), 22500000, N'COD', N'Chưa giao hàng', N'Chưa thanh toán', 2)
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [Email], [DiaChi], [SoDienThoai], [MatKhau]) VALUES (2, N'Phan Duy Lộc', N'duyloc273@gmail.com', N'123', N'0938388445', N'Phuongchi123@')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiHang] ON 

INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai], [HinhAnh]) VALUES (2, N'Điện thoại', N'DataImageSql/Điện thoại.png')
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai], [HinhAnh]) VALUES (3, N'Laptop', N'DataImageSql/Laptop.png')
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai], [HinhAnh]) VALUES (4, N'Laptop Gaming', N'DataImageSql/Laptop Gaming.png')
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai], [HinhAnh]) VALUES (6, N'Gaming Chair', N'DataImageSql/Gaming Chair.png')
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai], [HinhAnh]) VALUES (7, N'Earphone', N'DataImageSql/Earphone.png')
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai], [HinhAnh]) VALUES (8, N'Case', N'DataImageSql/Case.png')
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai], [HinhAnh]) VALUES (9, N'Monitor', N'DataImageSql/monitor.png')
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai], [HinhAnh]) VALUES (10, N'Main', N'DataImageSql/Main.png')
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai], [HinhAnh]) VALUES (11, N'Nguồn/Tản', N'DataImageSql/Tản.png')
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai], [HinhAnh]) VALUES (12, N'CPU', N'DataImageSql/CPU.png')
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai], [HinhAnh]) VALUES (13, N'Case', N'DataImageSql/Case.png')
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai], [HinhAnh]) VALUES (14, N'Ổ cứng/Ram/Thẻ nhớ', N'DataImageSql/ram.png')
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai], [HinhAnh]) VALUES (15, N'VGA', N'DataImageSql/VGA.png')
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai], [HinhAnh]) VALUES (16, N'Keyboard', N'DataImageSql/Keyboard & Mouse.png')
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai], [HinhAnh]) VALUES (17, N'Mouse', N'DataImageSql/Keyboard & Mouse.png')
SET IDENTITY_INSERT [dbo].[LoaiHang] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDienThoaiNCC], [DiaChiNCC], [HinhAnh]) VALUES (2, N'Gigabyte', N'123', N'123', N'DataImageSql/Aorus.png')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDienThoaiNCC], [DiaChiNCC], [HinhAnh]) VALUES (3, N'Apple', N'123', N'123', N'DataImageSql/apple-logo.png')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDienThoaiNCC], [DiaChiNCC], [HinhAnh]) VALUES (4, N'Asus', N'123', N'123', N'DataImageSql/asus.png')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDienThoaiNCC], [DiaChiNCC], [HinhAnh]) VALUES (5, N'Computer Component', N'123', N'123', N'DataImageSql/computerComponent.png')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDienThoaiNCC], [DiaChiNCC], [HinhAnh]) VALUES (6, N'Corsair', N'123', N'123', N'DataImageSql/corsair.png')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDienThoaiNCC], [DiaChiNCC], [HinhAnh]) VALUES (7, N'Dell', N'123', N'123', N'DataImageSql/dell.png')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDienThoaiNCC], [DiaChiNCC], [HinhAnh]) VALUES (8, N'E-DRA', N'123', N'123', N'DataImageSql/e-dra.jpg')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDienThoaiNCC], [DiaChiNCC], [HinhAnh]) VALUES (9, N'HP', N'123', N'123', N'DataImageSql/hp.png')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDienThoaiNCC], [DiaChiNCC], [HinhAnh]) VALUES (10, N'HyperX', N'123', N'123', N'DataImageSql/hyper-x.jfif')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDienThoaiNCC], [DiaChiNCC], [HinhAnh]) VALUES (11, N'Lenovo', N'123', N'123', N'DataImageSql/lenovo.png')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDienThoaiNCC], [DiaChiNCC], [HinhAnh]) VALUES (12, N'Logitech', N'123', N'123', N'DataImageSql/logitech.png')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDienThoaiNCC], [DiaChiNCC], [HinhAnh]) VALUES (13, N'MSI', N'123', N'123', N'DataImageSql/MSI.png')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDienThoaiNCC], [DiaChiNCC], [HinhAnh]) VALUES (14, N'Nokia', N'123', N'123', N'DataImageSql/nokia.png')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDienThoaiNCC], [DiaChiNCC], [HinhAnh]) VALUES (15, N'Razer', N'123', N'123', N'DataImageSql/razer.png')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDienThoaiNCC], [DiaChiNCC], [HinhAnh]) VALUES (17, N'Samsung', N'123', N'123', N'DataImageSql/samsung.png')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDienThoaiNCC], [DiaChiNCC], [HinhAnh]) VALUES (18, N'Warrior', N'123', N'123', N'DataImageSql/warrior.jpg')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDienThoaiNCC], [DiaChiNCC], [HinhAnh]) VALUES (19, N'Macbook', N'123', N'123', N'DataImageSql/apple-logo.png')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDienThoaiNCC], [DiaChiNCC], [HinhAnh]) VALUES (20, N'Acer', N'123', N'123', N'DataImageSql/acer.jpg')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDienThoaiNCC], [DiaChiNCC], [HinhAnh]) VALUES (21, N'LG', N'123', N'123', N'DataImageSql/LG.png')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (7, N'Iphone 16 Pro Max 256GB', CAST(N'2024-11-27' AS Date), 30000000, 28500000, 10, N' Sở hữu thiết kế titan tuyệt đẹp. Điều Khiển Camera. 4K', N'<h2>Mạnh. Đẹp. Bằng Titan</h2>

<p><strong>&nbsp;iPhone 16 Pro Max. Sở hữu thiết kế titan tuyệt đẹp. Điều Khiển Camera.&nbsp;<a href="https://minhtuanmobile.com/tin-tuc/hd-full-hd-4k-chuan-quay-video-nao-phu-hop-voi-ban/#toc-4k" target="_blank">4K</a>&nbsp;<a href="https://minhtuanmobile.com/tin-tuc/dolby-vision-la-gi-dolby-vision-co-diem-gi-noi-bat/" target="_blank">Dolby Vision</a>&nbsp;tốc độ 120 fps. V&agrave; chip A18 Pro.</strong></p>

<p><img alt="iPhone 16 Pro Max 256GB" src="https://static.minhtuanmobile.com/uploads/editer/2024-10/28/images/iphone-16-pro-max-1.webp" style="height:660px; width:660px" /></p>

<h2>Cấu h&igrave;nh iPhone 16 Pro Max 256 GB</h2>

<h3>Th&ocirc;ng số kỹ thuật</h3>

<table cellspacing="0">
	<tbody>
		<tr>
			<td>
			<p>Th&ocirc;ng số</p>
			</td>
			<td>
			<p>Chi tiết</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước</p>
			</td>
			<td>
			<p>163mm x 77.6mm x 8.25mm</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Trọng lượng</p>
			</td>
			<td>
			<p>227g</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Khung</p>
			</td>
			<td>
			<p>Khung Titanium Cấp 5</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>SIM</p>
			</td>
			<td>
			<p>Nano-<a href="https://minhtuanmobile.com/tin-tuc/sim-thuong-micro-sim-nano-sim-esim-co-gi-khac-nhau/#nano-sim" target="_blank">SIM&nbsp;</a>v&agrave;&nbsp;<a href="https://minhtuanmobile.com/tin-tuc/sim-thuong-micro-sim-nano-sim-esim-co-gi-khac-nhau/#esim" target="_blank">eSIM</a>&nbsp;- Quốc tế</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Chống nước/bụi</p>
			</td>
			<td>
			<p><a href="https://minhtuanmobile.com/tin-tuc/tieu-chuan-chong-nuoc-ip-la-gi-cac-chuan-ip-hien-nay/#cac-tieu-chuan-ip-pho-bien-tren-smartphone" target="_blank">IP68</a>, kh&aacute;ng bụi v&agrave; nước (l&ecirc;n đến 6m trong 30 ph&uacute;t)</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>
			<p>Super Retina XDR&nbsp;<a href="https://minhtuanmobile.com/tin-tuc/man-hinh-oled-la-gi-co-nhung-uu-diem-gi-noi-bat-so-voi-cac-loai-khac/" target="_blank">OLED</a>, 120Hz, HDR10, Dolby Vision</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước m&agrave;n h&igrave;nh</p>
			</td>
			<td>
			<p>6.9 inch, 116.3 cm2&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải</p>
			</td>
			<td>
			<p>2868x1320 pixels (~460 ppi)</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Bảo vệ m&agrave;n h&igrave;nh</p>
			</td>
			<td>
			<p>K&iacute;nh Ceramic Shield</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Always-On Display</p>
			</td>
			<td>
			<p>C&oacute;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Hệ điều h&agrave;nh</p>
			</td>
			<td>
			<p>iOS 18</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Chipset</p>
			</td>
			<td>
			<p>Apple A18 Pro (3 nm)</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>CPU</p>
			</td>
			<td>
			<p>6 l&otilde;i với 2 l&otilde;i hiệu năng v&agrave; 4 l&otilde;i tiết kiệm điện</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>GPU</p>
			</td>
			<td>
			<p>Apple GPU (6 l&otilde;i)</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Bộ nhớ trong</p>
			</td>
			<td>
			<p>256GB</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Camera ch&iacute;nh</p>
			</td>
			<td>
			<p>48 MP, f/1.78 (g&oacute;c rộng)</p>

			<p>12 MP, f/2.8, 120mm (telephoto)</p>

			<p>48 MP, f/2.2 (g&oacute;c si&ecirc;u rộng)</p>

			<p>Zoom quang học 5x</p>

			<p>Zoom kỹ thuật số l&ecirc;n đến 25x</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>T&iacute;nh năng camera</p>
			</td>
			<td>
			<p>Đ&egrave;n flash k&eacute;p LED đa t&ocirc;ng, HDR (ảnh/<a href="https://minhtuanmobile.com/tin-tuc/cach-chup-anh-panorama-tren-dien-thoai-android-iphone/" target="_blank">panorama</a>)</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Quay video</p>
			</td>
			<td>
			<p>4K@24/25/30/60/100/120fps</p>

			<p>1080p@25/30/60/120fps, 10-bit HDR, Dolby Vision HDR, ProRes, Chế độ Cinematic (4K@30fps), ghi &acirc;m &acirc;m thanh stereo</p>

			<p>Chế độ h&agrave;nh động l&ecirc;n đến 2,8K ở tốc độ 60fps</p>

			<p>Quay video kh&ocirc;ng gian ở độ ph&acirc;n giải 1080p ở tốc độ 30fps</p>

			<p>Quay video ProRes l&ecirc;n đến 4K ở tốc độ 120fps với chức năng ghi ngo&agrave;i</p>

			<p>Quay video nhật k&yacute;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Camera selfie</p>
			</td>
			<td>
			<p>12 MP, f/1.9, 23mm (g&oacute;c rộng)</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>T&iacute;nh năng camera selfie</p>
			</td>
			<td>
			<p>HDR, Chế độ Cinematic (4K@24/30fps)</p>
			</td>
		</tr>
		<tr>
			<td>
			<p>Loa</p>
			</td>
			<td>
			<p>Loa to với &acirc;m thanh stereo</p>
			</td>
		</tr>
	</tbody>
</table>
', N'DataImageSql/iphone-16-pro-finish-select-202409-6-9inch-deserttitanium_FMT_WHH.jfif', N'5', N'Còn hàng', 2, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (8, N'Samsung Galaxy S24 Ultra', CAST(N'2024-11-27' AS Date), 25000000, 22500000, 10, N'Thiết kế sang trọng, đẳng cấp, khẳng định phong cách thời thượng.', N'<h2>Đặc điểm nổi bật của Samsung Galaxy S24 Ultra 12GB 256GB</h2>

<ul>
	<li>Trải nghiệm đỉnh cao với hiệu năng mạnh mẽ từ vi xử l&yacute; t&acirc;n tiến, kết hợp c&ugrave;ng RAM 12GB cho khả năng đa nhiệm mượt m&agrave;.</li>
	<li>Lưu trữ thoải m&aacute;i mọi ứng dụng, h&igrave;nh ảnh v&agrave; video với bộ nhớ trong 256GB.</li>
	<li>N&acirc;ng tầm nhiếp ảnh di động với hệ thống camera ti&ecirc;n tiến, cho ra đời những bức ảnh v&agrave; video chất lượng chuy&ecirc;n nghiệp.</li>
	<li>Thiết kế sang trọng, đẳng cấp, khẳng định phong c&aacute;ch thời thượng.</li>
</ul>

<blockquote>
<p><strong><a href="https://cellphones.com.vn/samsung-galaxy-s24-ultra.html" target="_blank" title="Samsung Galaxy S24 Ultra">Samsung S24 Ultra</a></strong>&nbsp;l&agrave; si&ecirc;u phẩm&nbsp;<strong>smartphone</strong>&nbsp;đỉnh cao mở đầu năm 2024 đến từ nh&agrave; Samsung với chip&nbsp;<strong>Snapdragon 8 Gen 3 For Galaxy</strong>&nbsp;mạnh mẽ, c&ocirc;ng nghệ tương lai&nbsp;<strong>Galaxy AI</strong>&nbsp;c&ugrave;ng&nbsp;<strong>khung viền Titan</strong>&nbsp;đẳng cấp hứa hẹn sẽ mang tới nhiều sự thay đổi lớn về mặt thiết kế v&agrave; cấu h&igrave;nh.&nbsp;<strong>SS&nbsp;Galaxy S24 bản Ultra</strong>&nbsp;sở hữu m&agrave;n h&igrave;nh&nbsp;<strong>6.8 inch</strong>&nbsp;<strong>Dynamic AMOLED 2X</strong>&nbsp;tần số qu&eacute;t&nbsp;<strong>120Hz</strong>. M&aacute;y cũng sở hữu&nbsp;<strong>camera ch&iacute;nh 200MP</strong>, camera zoom quang học 50MP, camera tele 10MP v&agrave; camera g&oacute;c si&ecirc;u rộng 12MP.</p>
</blockquote>
', N'DataImageSql/2_52711.jpg', N'10', N'Còn hàng', 2, 17)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (11, N'Laptop Dell Inspiron 15 ', CAST(N'2024-11-27' AS Date), 16490000, 15665500, 10, N'Laptop Dell Inspiron 15 3520 i5 1235U/16GB/512GB/120Hz/OfficeHS/Win11 (N5I5052W1)', N'<h3 style="text-align:center">Bộ vi xử l&yacute; Intel Core i5 chạy mượt c&aacute;c t&aacute;c vụ học tập, văn ph&ograve;ng</h3>

<p style="text-align:center"><a href="https://www.nguyenkim.com/laptop-dell-inspiron-15-3520-i5-1235u-n5i5052w1.html">Laptop Dell Inspiron 15 3520 i5-1235U (N5I5052W1)</a>&nbsp;được trao quyền năng bởi bộ vi xử l&yacute;&nbsp;<a href="https://www.nguyenkim.com/laptop-may-tinh-xach-tay/?features_hash=38-45147-247519">Intel Core i5</a>&nbsp;thế hệ thứ 12 (1235U), bộ nhớ đệm tới 12MB với 10 l&otilde;i, 12 luồng, c&ugrave;ng tốc độ CPU tối đa 4.4 GHz. Nhờ đ&oacute;, m&aacute;y đủ mạnh mẽ để xử l&yacute; mượt từ c&aacute;c ứng dụng học tập v&agrave; văn ph&ograve;ng như Excel, Word, Powerpoint,... đến c&aacute;c ứng dụng thiết kế v&agrave; những tựa game ở mức cấu h&igrave;nh vừa phải để bạn học tập, l&agrave;m việc năng suất v&agrave; giải tr&iacute; liền mạch.</p>

<p><img alt="Laptop Dell Inspiron 15 3520 i5-1235U/16GB/512GB/Win11 (N5I5052W1)" src="https://cdn.nguyenkimmall.com/images/companies/_1/Content/tin-hoc/laptop/dell/nspiron-15-3520-i5-1235u-n5i5052w1/laptop-dell-inspiron-15-3520-i5-1235u-n5i5052w1-1.jpg" style="width:100%" /></p>
', N'DataImageSql/dell-inspiron-15-(4).jpg', N'5', N'Còn hàng', 3, 7)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (12, N'MacBook Air M1 13 inch', CAST(N'2024-11-27' AS Date), 17490000, 16615500, 20, N'MacBook Air M1 13 inch', N'<h3 style="color:#333333; font-style:normal; text-align:justify">Thiết kế nhỏ gọn. M&agrave;n h&igrave;nh Retina sắc n&eacute;t</h3>

<p style="text-align:justify">&nbsp;</p>

<p style="text-align:justify"><span style="font-size:13px"><span style="color:#333333"><span style="font-family:-apple-system,BlinkMacSystemFont,Inter,sans-serif"><span style="background-color:#ffffff">L&agrave; một chiếc&nbsp;<em>ultrabook</em>&nbsp;cao cấp,&nbsp;<a href="https://hoanghamobile.com/laptop/macbook/macbook-air" style="text-decoration:none; color:#fd475a; cursor:pointer" target="_blank"><span style="color:#397b21">MacBook Air</span></a>&nbsp;mang tr&ecirc;n m&igrave;nh tất cả thẩm mỹ tinh tế của Apple trong thiết kế sản phẩm.&nbsp;<span style="color:#636363">MacBook Air&nbsp;M1</span>&nbsp;được ho&agrave;n thiện từ chất liệu nh&ocirc;m nguy&ecirc;n khối, kh&ocirc;ng chỉ nhẹ m&agrave; c&ograve;n rất sang trọng. Trọng lượng chỉ 1,29kg cũng gi&uacute;p người d&ugrave;ng tiện lợi mang đi sử dụng ở mọi nơi. Kh&aacute;ch h&agrave;ng c&oacute; thể lựa chọn ba phi&ecirc;n bản m&agrave;u kh&aacute;c nhau ph&ugrave; hợp với cả t&iacute;nh mỗi người, bao gồm x&aacute;m, bạc v&agrave; v&agrave;ng.</span></span></span></span></p>

<p style="text-align:center"><span style="font-size:13px"><span style="color:#333333"><span style="font-family:-apple-system,BlinkMacSystemFont,Inter,sans-serif"><span style="background-color:#ffffff"><img alt="Macbook air M1." src="https://cdn.hoanghamobile.com/i/content/Uploads/2024/09/09/2020-11-12-637407989603991120-mba-2020-silver-1.jpeg" style="max-width:100%" title="Macbook air M1." /></span></span></span></span></p>

<p style="text-align:justify">&nbsp;</p>

<p style="text-align:justify"><span style="font-size:13px"><span style="color:#333333"><span style="font-family:-apple-system,BlinkMacSystemFont,Inter,sans-serif"><span style="background-color:#ffffff">Cảm gi&aacute;c mở m&aacute;y bằng một tay vẫn giữ được sự mượt m&agrave;, cho thấy khả năng ho&agrave;n thiện bản lề cực tốt của Apple. Khi mở m&aacute;y ra, người d&ugrave;ng sẽ thấy b&agrave;n ph&iacute;m Magic Keyboard c&oacute; h&agrave;nh tr&igrave;nh ph&iacute;m 1mm, hỗ trợ đ&egrave;n nền v&agrave; TouchPad c&oacute; k&iacute;ch thước lớn, gi&uacute;p c&aacute;c thao t&aacute;c tr&ecirc;n m&aacute;y trở n&ecirc;n trơn tru v&agrave; c&oacute; phản hồi tốt. Hai dải loa stereo được bố trị b&ecirc;n cạnh b&agrave;n ph&iacute;m, c&oacute; &acirc;m lượng v&agrave; chất &acirc;m tốt, hỗ trợ người d&ugrave;ng mọi t&aacute;c vụ giải tr&iacute;. Đặc biệt, nhờ kh&ocirc;ng c&oacute; quạt gi&oacute; n&ecirc;n người d&ugrave;ng sẽ kh&ocirc;ng t&igrave;m thấy khe tản nhiệt tr&ecirc;n thiết bị n&agrave;y, tạo ra cảm gi&aacute;c thiết kế liền mạch cho sản phẩm.</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:13px"><span style="color:#333333"><span style="font-family:-apple-system,BlinkMacSystemFont,Inter,sans-serif"><span style="background-color:#ffffff"><a href="https://hoanghamobile.com/laptop/macbook/macbook-air" style="text-decoration:none; color:#fd475a; cursor:pointer" target="_blank"><span style="color:#397b21">MacBook Air</span></a>&nbsp;được trang bị m&agrave;n h&igrave;nh Retina k&iacute;ch thước 13,3 inch c&oacute; độ ph&acirc;n giải 2560x1600. M&agrave;n h&igrave;nh n&agrave;y hỗ trợ c&ocirc;ng nghệ True Tone, dải m&agrave;u rộng P3 v&agrave; c&oacute; độ s&aacute;ng l&ecirc;n tới 400 nit, đem lại m&agrave;u sắc v&agrave; độ tương phản tốt ngay cả khi l&agrave;m việc trong kh&ocirc;ng gian c&oacute; &aacute;nh s&aacute;ng mạnh như ngo&agrave;i trời nắng.</span></span></span></span></p>

<h3 style="color:#333333; font-style:normal; text-align:justify">Hiệu năng h&agrave;ng đầu. Thời lượng pin l&ecirc;n tới 18 tiếng</h3>

<p style="text-align:justify">&nbsp;</p>

<p style="text-align:justify"><span style="font-size:13px"><span style="color:#333333"><span style="font-family:-apple-system,BlinkMacSystemFont,Inter,sans-serif"><span style="background-color:#ffffff">Lần đầu ti&ecirc;n trong lịch sử d&ograve;ng MacBook, Apple chia tay Intel để sử dụng vi xử l&yacute; ri&ecirc;ng do ch&iacute;nh m&igrave;nh sản xuất mang t&ecirc;n M1. Sở hữu sức mạnh tối t&acirc;n, chip M1 gi&uacute;p MacBook Air c&oacute; hiệu năng vượt trội so với nhiều mẫu laptop hiện c&oacute; tr&ecirc;n thị trường. Chip M1 l&agrave; một SoC được t&iacute;ch hợp CPU, GPU, Neural Engine, I/O v&agrave; nhiều bộ phận xử l&yacute; kh&aacute;c tr&ecirc;n một con chip duy nhất. Đ&acirc;y l&agrave; con chip chạy tr&ecirc;n tiến tr&igrave;nh 5mm với 16 tỷ b&oacute;ng b&aacute;n dẫn, hứa hẹn đem lại hiệu năng nhanh hơn tới 3,5 lần v&agrave; khả năng xử l&yacute; đ&ograve; hoạ tốt hơn 5 lần so với thế hệ MacBook Air trước đ&acirc;y. Người d&ugrave;ng c&oacute; thể tự tin thực hiện mọi t&aacute;c vụ h&agrave;ng ng&agrave;y tr&ecirc;n chiếc m&aacute;y t&iacute;nh của m&igrave;nh, từ c&ocirc;ng việc văn ph&ograve;ng nhẹ nh&agrave;ng, cho đến xử l&yacute; video v&agrave; chơi game c&oacute; đồ hoạ cao m&agrave; kh&ocirc;ng l&agrave;m kh&oacute; được thiết bị n&agrave;y.</span></span></span></span></p>

<p style="text-align:center"><span style="font-size:13px"><span style="color:#333333"><span style="font-family:-apple-system,BlinkMacSystemFont,Inter,sans-serif"><span style="background-color:#ffffff"><img alt="Logo Apple." src="https://cdn.hoanghamobile.com/i/content/Uploads/2024/09/09/2020-11-12-637407989601607471-mba-2020-silver-5.jpeg" style="max-width:100%" title="Logo Apple." /></span></span></span></span></p>

<p style="text-align:justify">&nbsp;</p>

<p style="text-align:justify"><span style="font-size:13px"><span style="color:#333333"><span style="font-family:-apple-system,BlinkMacSystemFont,Inter,sans-serif"><span style="background-color:#ffffff">Chip M1 cũng c&oacute; khả năng tối ưu ho&aacute; cực tốt cho MacBook Air 2020. C&ugrave;ng sử dụng vi&ecirc;n pin dung lượng 49,9Wh như đời tiền nhiệm,&nbsp;<span style="color:#636363">MacBook Air M1</span>&nbsp;c&oacute; thời lượng pin d&agrave;i hơn 6 giờ, đem lại cho người d&ugrave;ng 15 tiếng lướt web v&agrave; 18 tiếng xem video chỉ với một lần sạc duy nhất. Với c&aacute;c t&aacute;c vụ h&agrave;ng ng&agrave;y, chiếc laptop n&agrave;y tự tin c&oacute; thể đem lại tới 2 ng&agrave;y l&agrave;m việc v&agrave; giải tr&iacute;. Đ&acirc;y l&agrave; một thời lượng sử dụng d&agrave;i chưa từng c&oacute; tr&ecirc;n một chiếc MacBook Air. Với thiết kế kh&ocirc;ng quạt gi&oacute;, người d&ugrave;ng sẽ kh&ocirc;ng bao giờ phải nghe thấy tiếng gi&oacute; tản nhiệt ph&aacute;t ra v&agrave; c&oacute; thể tận hưởng trải nghiệm ho&agrave;n to&agrave;n &ecirc;m &aacute;i.</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:13px"><span style="color:#333333"><span style="font-family:-apple-system,BlinkMacSystemFont,Inter,sans-serif"><span style="background-color:#ffffff">MacBook Air c&oacute; hai tuỳ chọn phi&ecirc;n bản bộ nhớ l&agrave; 256GB v&agrave; 512GB. Ổ cứng SSD c&oacute; tr&ecirc;n m&aacute;y cũng c&oacute; tốc độ gấp đ&ocirc;i. Dung lượng RAM 8GB l&agrave; một con số dư giả cho đa phần người d&ugrave;ng hiện tại.</span></span></span></span></p>

<h3 style="color:#333333; font-style:normal; text-align:justify">Hệ điều h&agrave;nh macOS tiện dụng. Khả năng kết nối bền bỉ</h3>

<p style="text-align:justify">&nbsp;</p>

<p style="text-align:justify"><span style="font-size:13px"><span style="color:#333333"><span style="font-family:-apple-system,BlinkMacSystemFont,Inter,sans-serif"><span style="background-color:#ffffff">Chiếc&nbsp;<span style="color:#636363">MacBook Air M1</span>&nbsp;2020 được c&agrave;i đặt sẵn macOS Big Sur mới nhất ngay khi được b&oacute;c hộp. Được thiết kế d&agrave;nh ri&ecirc;ng cho chip M1, macOS Big Sur biến ho&aacute; m&aacute;y t&iacute;nh Mac của bạn với hiệu suất tối ưu v&agrave; h&agrave;ng loạt t&iacute;nh năng hữu &iacute;ch. Giao diện người d&ugrave;ng đ&atilde; được thiết kế lại, vừa tối giản vừa dễ sử dụng. Người d&ugrave;ng sẽ được tận hưởng phần mềm tuyệt vời nhất tr&ecirc;n phần cứng t&acirc;n tiến nhất tới từ Apple. Nhờ khả năng tối ưu tốt, bạn c&oacute; thể sử dụng m&aacute;y t&iacute;nh của m&igrave;nh ngay khi mở m&aacute;y l&ecirc;n, thao t&aacute;c mở ứng dụng cũng diễn ra nhanh như một cơn gi&oacute;. Hệ điều h&agrave;nh macOS Big Sur đưa nhiều ứng dụng quen thuộc tr&ecirc;n điện thoại l&ecirc;n MacBook Air.</span></span></span></span></p>

<p style="text-align:center"><span style="font-size:13px"><span style="color:#333333"><span style="font-family:-apple-system,BlinkMacSystemFont,Inter,sans-serif"><span style="background-color:#ffffff"><img alt="Macbook Air M1 vàng." src="https://cdn.hoanghamobile.com/i/content/Uploads/2024/09/09/2020-11-12-637407967465159041-mba-2020-gold-5.jpeg" style="max-width:100%" title="Macbook Air M1 vàng." /></span></span></span></span></p>

<p style="text-align:justify">&nbsp;</p>

<p style="text-align:justify"><span style="font-size:13px"><span style="color:#333333"><span style="font-family:-apple-system,BlinkMacSystemFont,Inter,sans-serif"><span style="background-color:#ffffff">MacBook Air M1 sở hữu cảm biến v&acirc;n tay đặt tr&ecirc;n ph&iacute;m nguồn của m&aacute;y. Bảo mật v&acirc;n tay Touch ID kh&ocirc;ng chỉ tiện dụng khi mở m&aacute;y v&agrave; thanh to&aacute;n online, m&agrave; c&ograve;n bảo vệ tất cả c&aacute;c dữ liệu quan trọng của bạn c&oacute; tr&ecirc;n chiếc m&aacute;y t&iacute;nh n&agrave;y.</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:13px"><span style="color:#333333"><span style="font-family:-apple-system,BlinkMacSystemFont,Inter,sans-serif"><span style="background-color:#ffffff">Bạn c&oacute; thể sử dụng webcam c&oacute; sẵn tr&ecirc;n m&aacute;y để thực hiện c&aacute;c cuộc gọi FaceTime HD sắc n&eacute;t. MacBook Air được trang bị 2 cổng USB-C hỗ trợ Thunderbolt 3 c&ugrave;ng một cổng tai nghe 3.5mm. Với c&aacute;c cổng kết nối n&agrave;y, bạn c&oacute; thể sử dụng MacBook Air tr&ecirc;n m&agrave;n h&igrave;nh ngo&agrave;i, truyền tải dữ liệu với tốc độ ch&oacute;ng mặt tới 40GB/s.</span></span></span></span></p>

<h3 style="color:#333333; font-style:normal; text-align:justify">Tạm kết</h3>

<p style="text-align:justify">&nbsp;</p>

<p style="text-align:justify"><span style="font-size:13px"><span style="color:#333333"><span style="font-family:-apple-system,BlinkMacSystemFont,Inter,sans-serif"><span style="background-color:#ffffff"><span style="color:#636363">MacBook Air M1</span>&nbsp;thực sự l&agrave; một chiếc&nbsp;<em>ultrabook</em>&nbsp;đẹp v&agrave; mạnh mẽ của năm 2020. Đ&acirc;y chắc chắn sẽ l&agrave; c&ocirc;ng cụ hữu hiệu gi&uacute;p bạn thực hiện to&agrave;n bộ c&ocirc;ng việc trong ng&agrave;y của bạn v&agrave; đem lại những gi&acirc;y ph&uacute;t giải tr&iacute; cực đ&atilde;.</span></span></span></span></p>
', N'DataImageSql/mac-m1-vang-(1).png', N'5', N'Còn hàng', 3, 19)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (13, N'Laptop Lenovo ThinkBook 14', CAST(N'2024-11-27' AS Date), 14990000, 13491000, 10, N'Laptop Lenovo ThinkBook 14', N'<p dir="ltr">Laptop <a href="https://hoanghamobile.com/laptop/laptop-lenovo-thinkbook-14-g6-irl-21kg00rdvn">Lenovo ThinkBook 14 G6 IRL 21KG00RDVN</a> l&agrave; một trong những d&ograve;ng sản phẩm nổi bật từ Lenovo, kết hợp giữa hiệu năng mạnh mẽ Intel Core i5 v&agrave; thiết kế gọn nhẹ, tinh tế với m&agrave;n h&igrave;nh 14 inch. Sản phẩm n&agrave;y thuộc d&ograve;ng ThinkBook, vốn được thiết kế d&agrave;nh cho doanh nghiệp vừa v&agrave; nhỏ, nhằm hỗ trợ người d&ugrave;ng đạt được hiệu suất l&agrave;m việc tối ưu RAM 16GB c&ugrave;ng SSD 512GB. Với c&aacute;c t&iacute;nh năng vượt trội như bộ vi xử l&yacute; mạnh mẽ, dung lượng RAM cao, v&agrave; bộ nhớ lưu trữ linh hoạt, ThinkBook 14 G6 IRL hứa hẹn l&agrave; lựa chọn ho&agrave;n hảo cho những ai t&igrave;m kiếm một chiếc laptop chất lượng, đa năng v&agrave; c&oacute; độ bền cao.</p>

<p dir="ltr"><img alt="Lenovo ThinkBook 14 G6 IRL 21KG00RDVN." src="https://cdn.hoanghamobile.com/i/content/Uploads/2024/11/11/thinkbook-14-g6-irl-ct1-03.jpg" title="Lenovo ThinkBook 14 G6 IRL 21KG00RDVN." /></p>

<p dir="ltr">Đặc điểm nổi bật:</p>

<ul>
	<li dir="ltr">
	<p dir="ltr">Bộ vi xử l&yacute;: Vi xử l&yacute;&nbsp; Intel&reg; Core&trade; i5-13420H với 8 l&otilde;i v&agrave; 12 luồng, xung nhịp tối đa 4.6GHz</p>
	</li>
	<li dir="ltr">
	<p dir="ltr">Bộ nhớ RAM: Dung lượng RAM 16GB DDR5-5200, hỗ trợ tối đa 64GB</p>
	</li>
	<li dir="ltr">
	<p dir="ltr">Lưu trữ: Ổ cứng SSD 512GB, hỗ trợ mở rộng tới 2TB</p>
	</li>
	<li dir="ltr">
	<p dir="ltr">M&agrave;n h&igrave;nh: K&iacute;ch thước 14 inch WUXGA, độ s&aacute;ng 300 nits, chống ch&oacute;i</p>
	</li>
	<li dir="ltr">
	<p dir="ltr">Pin: Dung lượng pin 60Wh, thời gian sử dụng k&eacute;o d&agrave;i cả ng&agrave;y</p>
	</li>
</ul>

<h2 dir="ltr">Bảng chi tiết th&ocirc;ng số kỹ thuật Laptop Lenovo ThinkBook 14 G6 IRL 21KG00RDVN</h2>

<table>
	<tbody>
		<tr>
			<td>
			<p dir="ltr">Danh mục</p>
			</td>
			<td>
			<p dir="ltr">Chi tiết th&ocirc;ng số</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Bộ vi xử l&yacute;</p>
			</td>
			<td>
			<p dir="ltr">Intel&reg; Core&trade; i5-13420H, 8 nh&acirc;n (4 nh&acirc;n hiệu suất cao + 4 nh&acirc;n tiết kiệm năng lượng), 12 luồng</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Tần số CPU</p>
			</td>
			<td>
			<p dir="ltr">Nh&acirc;n hiệu suất cao: 2.1 - 4.6GHz, Nh&acirc;n tiết kiệm năng lượng: 1.5 - 3.4GHz</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Bộ nhớ đệm</p>
			</td>
			<td>
			<p dir="ltr">12MB</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Đồ họa</p>
			</td>
			<td>
			<p dir="ltr">Đồ họa t&iacute;ch hợp Intel&reg; UHD Graphics</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Chipset</p>
			</td>
			<td>
			<p dir="ltr">Intel&reg; SoC Platform</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Bộ nhớ RAM</p>
			</td>
			<td>
			<p dir="ltr">2x 8GB SO-DIMM DDR5-5200, hỗ trợ hai khe DDR5 SO-DIMM, tối đa 64GB</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Lưu trữ</p>
			</td>
			<td>
			<p dir="ltr">SSD 512GB M.2 2242 PCIe&reg; 4.0x4 NVMe&reg;</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Hỗ trợ lưu trữ</p>
			</td>
			<td>
			<p dir="ltr">Hỗ trợ tối đa hai ổ M.2 SSD: M.2 2242 SSD l&ecirc;n đến 1TB, M.2 2280 SSD l&ecirc;n đến 2TB</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Khe lưu trữ</p>
			</td>
			<td>
			<p dir="ltr">Hai khe M.2 2280 PCIe&reg; 4.0 x4</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Đầu đọc thẻ nhớ</p>
			</td>
			<td>
			<p dir="ltr">SD Card Reader</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">&Acirc;m thanh</p>
			</td>
			<td>
			<p dir="ltr">Realtek&reg; ALC3287 codec, &acirc;m thanh HD, Dolby Audio&trade;, loa stereo 2W x2</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Camera</p>
			</td>
			<td>
			<p dir="ltr">Camera FHD 1080p + IR Hybrid, c&oacute; m&agrave;n che bảo mật</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Microphone</p>
			</td>
			<td>
			<p dir="ltr">2 microArray</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Pin</p>
			</td>
			<td>
			<p dir="ltr">Dung lượng 60Wh</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Bộ sạc</p>
			</td>
			<td>
			<p dir="ltr">100W USB-C&reg; Slim (3-pin)</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">K&iacute;ch thước m&agrave;n h&igrave;nh</p>
			</td>
			<td>
			<p dir="ltr">14 inch, độ ph&acirc;n giải WUXGA (1920x1200), IPS, độ s&aacute;ng 300nits, chống ch&oacute;i, 45% NTSC</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Cảm ứng</p>
			</td>
			<td>
			<p dir="ltr">Kh&ocirc;ng hỗ trợ</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">B&agrave;n ph&iacute;m</p>
			</td>
			<td>
			<p dir="ltr">B&agrave;n ph&iacute;m c&oacute; đ&egrave;n nền, ng&ocirc;n ngữ tiếng Anh</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Touchpad</p>
			</td>
			<td>
			<p dir="ltr">Mylar&reg; kh&ocirc;ng c&oacute; n&uacute;t, hỗ trợ Precision TouchPad (PTP), k&iacute;ch thước 75 x 120 mm</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">M&agrave;u sắc</p>
			</td>
			<td>
			<p dir="ltr">Arctic Grey</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Vật liệu</p>
			</td>
			<td>
			<p dir="ltr">Nh&ocirc;m nguy&ecirc;n khối (Mặt tr&ecirc;n v&agrave; dưới)</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">K&iacute;ch thước (WxDxH)</p>
			</td>
			<td>
			<p dir="ltr">313.5 x 224 x 16.9 mm (12.34 x 8.82 x 0.67 inches)</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Trọng lượng</p>
			</td>
			<td>
			<p dir="ltr">1.38 kg (3.04 lbs)</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Hệ điều h&agrave;nh</p>
			</td>
			<td>
			<p dir="ltr">Windows&reg; 11 Home Single Language</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Phần mềm k&egrave;m theo</p>
			</td>
			<td>
			<p dir="ltr">Office Trial + Absolute Home &amp; Office Basic 1 năm</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Ethernet</p>
			</td>
			<td>
			<p dir="ltr">100/1000M (RJ-45)</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Wi-Fi &amp; Bluetooth</p>
			</td>
			<td>
			<p dir="ltr">Wi-Fi&reg; 6E, 802.11ax 2x2 + Bluetooth 5.3</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Cổng kết nối</p>
			</td>
			<td>
			<ul>
				<li dir="ltr">
				<p dir="ltr">1x USB 3.2 Gen 1,&nbsp;</p>
				</li>
				<li dir="ltr">
				<p dir="ltr">1x USB 3.2 Gen 1 (Always On),&nbsp;</p>
				</li>
				<li dir="ltr">
				<p dir="ltr">1x USB-C&reg; 3.2 Gen 2 (hỗ trợ Power Delivery 3.0 v&agrave; DisplayPort&trade; 1.4)</p>
				</li>
				<li dir="ltr">
				<p dir="ltr">1x Thunderbolt&trade; 4 / USB4&reg; 40Gbps</p>
				</li>
				<li dir="ltr">
				<p dir="ltr">1x HDMI&reg; 2.1</p>
				</li>
				<li dir="ltr">
				<p dir="ltr">1x Jack tai nghe / mic (3.5mm)</p>
				</li>
				<li dir="ltr">
				<p dir="ltr">1x Ethernet (RJ-45)</p>
				</li>
				<li dir="ltr">
				<p dir="ltr">1x đầu đọc thẻ SD</p>
				</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Chip bảo mật</p>
			</td>
			<td>
			<p dir="ltr">Firmware TPM 2.0</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Cảm biến v&acirc;n tay</p>
			</td>
			<td>
			<p dir="ltr">Cảm biến t&iacute;ch hợp v&agrave;o n&uacute;t nguồn</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Bảo mật kh&aacute;c</p>
			</td>
			<td>
			<p dir="ltr">Camera IR cho nhận diện khu&ocirc;n mặt Windows&reg; Hello, m&agrave;n che bảo mật</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Chứng nhận kh&aacute;c</p>
			</td>
			<td>
			<p dir="ltr">T&Uuml;V Rheinland&reg; giảm &aacute;nh s&aacute;ng xanh</p>
			</td>
		</tr>
		<tr>
			<td>
			<p dir="ltr">Ti&ecirc;u chuẩn qu&acirc;n sự</p>
			</td>
			<td>
			<p dir="ltr">MIL-STD-810H</p>
			</td>
		</tr>
	</tbody>
</table>

<h2 dir="ltr">Đ&aacute;nh gi&aacute; chi tiết tổng quan t&iacute;nh năng nổi bật Laptop Lenovo ThinkBook 14 G6 IRL 21KG00RDVN</h2>

<p dir="ltr"><a href="https://hoanghamobile.com/laptop/lenovo">Lenovo</a> ThinkBook 14 G6 IRL 21KG00RDVN được trang bị cấu h&igrave;nh mạnh mẽ đ&aacute;p ứng tốt nhu cầu của người d&ugrave;ng hiện đại. Với bộ vi xử l&yacute; Intel&reg; Core&trade; i5 thế hệ mới, bộ nhớ RAM lớn v&agrave; m&agrave;n h&igrave;nh độ ph&acirc;n giải cao, sản phẩm n&agrave;y kh&ocirc;ng chỉ gi&uacute;p thực hiện c&aacute;c t&aacute;c vụ văn ph&ograve;ng m&agrave; c&ograve;n c&oacute; khả năng xử l&yacute; đồ họa cơ bản v&agrave; c&aacute;c c&ocirc;ng việc đa nhiệm phức tạp.</p>

<h3 dir="ltr">Bộ vi xử l&yacute; Intel Core I5-13420H mạnh mẽ xử l&yacute; đa nhiệm, đa t&aacute;c vụ c&ocirc;ng việc</h3>

<p dir="ltr"><a href="https://hoanghamobile.com/laptop">Laptop</a> Lenovo ThinkBook 14 G6 IRL được trang bị bộ vi xử l&yacute; Intel&reg; Core&trade; i5-13420H, một lựa chọn mạnh mẽ của d&ograve;ng Intel H-Series nổi tiếng với hiệu năng cao v&agrave; khả năng xử l&yacute; đa nhiệm vượt trội. Chip n&agrave;y bao gồm 8 nh&acirc;n, được chia th&agrave;nh 4 nh&acirc;n hiệu suất cao (P-core) v&agrave; 4 nh&acirc;n tiết kiệm năng lượng (E-core), c&ugrave;ng với 12 luồng xử l&yacute;, gi&uacute;p tối ưu h&oacute;a hiệu suất khi thực hiện c&aacute;c t&aacute;c vụ nặng như đồ họa, video, v&agrave; phần mềm kỹ thuật phức tạp.</p>

<p dir="ltr">C&aacute;c nh&acirc;n hiệu suất cao (P-core) c&oacute; tốc độ từ 2.1GHz đến 4.6GHz, gi&uacute;p xử l&yacute; nhanh ch&oacute;ng c&aacute;c t&aacute;c vụ nặng. Trong khi đ&oacute;, c&aacute;c nh&acirc;n tiết kiệm năng lượng (E-core) c&oacute; tốc độ từ 1.5GHz đến 3.4GHz, chuy&ecirc;n dụng cho c&aacute;c t&aacute;c vụ nhẹ v&agrave; tiết kiệm pin, gi&uacute;p c&acirc;n bằng giữa hiệu suất v&agrave; hiệu quả năng lượng. Nhờ kiến tr&uacute;c tối ưu n&agrave;y, m&aacute;y c&oacute; thể hoạt động mượt m&agrave; trong nhiều giờ m&agrave; kh&ocirc;ng bị n&oacute;ng hay giảm hiệu năng.</p>

<p dir="ltr"><img alt="Bộ vi xử lý Intel Core I5-13420H." src="https://cdn.hoanghamobile.com/i/content/Uploads/2024/11/11/thinkbook-14-g6-irl-ct1-01.jpg" title="Bộ vi xử lý Intel Core I5-13420H." /></p>

<p dir="ltr">B&ecirc;n cạnh đ&oacute;, vi xử l&yacute; Intel Core i5-13420H c&ograve;n t&iacute;ch hợp c&aacute;c c&ocirc;ng nghệ ti&ecirc;n tiến của Intel như Hyper-Threading (đa luồng), Turbo Boost v&agrave; Intel&reg; Smart Cache (bộ nhớ đệm th&ocirc;ng minh 12MB), gi&uacute;p tối ưu h&oacute;a tốc độ xử l&yacute; v&agrave; tăng khả năng phản hồi nhanh của m&aacute;y ngay cả khi thực hiện c&aacute;c t&aacute;c vụ đ&ograve;i hỏi cao về t&agrave;i nguy&ecirc;n. Đ&acirc;y l&agrave; điểm cộng lớn cho những ai cần một chiếc laptop đa năng, đ&aacute;p ứng cả c&ocirc;ng việc văn ph&ograve;ng lẫn nhu cầu giải tr&iacute;.</p>

<h3 dir="ltr">Laptop Lenovo ThinkBook 14 G6 IRL 21KG00RDVN trang bị dung lượng lớn, xử l&yacute; đa dạng ứng dụng</h3>

<p dir="ltr">ThinkBook 14 G6 IRL được trang bị 16GB RAM DDR5 với tốc độ bus 5200MHz. So với thế hệ DDR4, DDR5 cải thiện tốc độ xử l&yacute; l&ecirc;n đ&aacute;ng kể, gi&uacute;p tăng hiệu suất v&agrave; giảm thời gian chờ khi mở c&aacute;c ứng dụng nặng hoặc nhiều ứng dụng c&ugrave;ng l&uacute;c. DDR5 c&ograve;n c&oacute; hiệu suất năng lượng tốt hơn, cho ph&eacute;p ti&ecirc;u thụ &iacute;t điện năng hơn trong khi duy tr&igrave; tốc độ cao, ph&ugrave; hợp cho người d&ugrave;ng cần một thiết bị hoạt động bền bỉ suốt ng&agrave;y d&agrave;i.</p>

<p dir="ltr">Laptop n&agrave;y hỗ trợ hai khe cắm SO-DIMM với khả năng n&acirc;ng cấp RAM l&ecirc;n đến 64GB. Đối với những ai l&agrave;m việc trong c&aacute;c lĩnh vực s&aacute;ng tạo như thiết kế đồ họa, dựng phim hoặc ph&aacute;t triển phần mềm, khả năng n&acirc;ng cấp RAM l&ecirc;n mức cao n&agrave;y đảm bảo m&aacute;y đ&aacute;p ứng tốt ngay cả khi nhu cầu về t&agrave;i nguy&ecirc;n tăng cao trong tương lai. Việc hỗ trợ k&ecirc;nh đ&ocirc;i (dual-channel) cũng gi&uacute;p tối ưu h&oacute;a băng th&ocirc;ng dữ liệu, cải thiện đ&aacute;ng kể hiệu năng tổng thể của m&aacute;y khi xử l&yacute; c&aacute;c t&aacute;c vụ đa nhiệm.</p>

<p dir="ltr"><img alt="Xử lý đa dạng ứng dụng." src="https://cdn.hoanghamobile.com/i/content/Uploads/2024/11/11/thinkbook-14-g6-irl-ct1-02.jpg" title="Xử lý đa dạng ứng dụng." /></p>

<p dir="ltr">Đặc biệt, với 16GB RAM DDR5 ban đầu, người d&ugrave;ng c&oacute; thể y&ecirc;n t&acirc;m về khả năng vận h&agrave;nh mượt m&agrave; của m&aacute;y. ThinkBook 14 G6 IRL kh&ocirc;ng chỉ mang đến trải nghiệm sử dụng tốt cho c&aacute;c t&aacute;c vụ văn ph&ograve;ng v&agrave; giải tr&iacute; h&agrave;ng ng&agrave;y m&agrave; c&ograve;n hỗ trợ tốt cho c&aacute;c ứng dụng phức tạp, như chỉnh sửa h&igrave;nh ảnh v&agrave; video, m&agrave; kh&ocirc;ng g&acirc;y ra hiện tượng giật lag.</p>

<h3 dir="ltr">Khả năng dung lượng lưu trữ dữ liệu lớn</h3>

<p dir="ltr">Laptop Lenovo ThinkBook 14 G6 IRL 21KG00RDVN đi k&egrave;m ổ SSD M.2 2242 512GB PCIe&reg; 4.0x4 NVMe&reg;, gi&uacute;p n&acirc;ng cao đ&aacute;ng kể tốc độ truy xuất dữ liệu so với c&aacute;c d&ograve;ng ổ cứng truyền thống. SSD PCIe 4.0x4 cung cấp băng th&ocirc;ng cao gấp đ&ocirc;i so với PCIe 3.0, mang lại khả năng khởi động hệ điều h&agrave;nh v&agrave; c&aacute;c ứng dụng nhanh ch&oacute;ng chỉ trong v&agrave;i gi&acirc;y. Với SSD, người d&ugrave;ng kh&ocirc;ng chỉ tiết kiệm thời gian khi mở m&aacute;y m&agrave; c&ograve;n c&oacute; trải nghiệm nhanh nhạy khi chuyển đổi giữa c&aacute;c ứng dụng v&agrave; mở c&aacute;c tệp dữ liệu lớn.</p>

<p dir="ltr"><img alt="Kưu trữ dữ liệu lớn." src="https://cdn.hoanghamobile.com/i/content/Uploads/2024/11/11/thinkbook-14-g6-irl-ct1-04.jpg" title="Kưu trữ dữ liệu lớn." /></p>

<p dir="ltr">ThinkBook 14 G6 IRL c&ograve;n c&oacute; khả năng mở rộng dung lượng lưu trữ với hai khe cắm M.2, hỗ trợ:</p>

<ul>
	<li dir="ltr">
	<p dir="ltr">M.2 2242 SSD l&ecirc;n đến 1TB</p>
	</li>
	<li dir="ltr">
	<p dir="ltr">M.2 2280 SSD l&ecirc;n đến 2TB</p>
	</li>
</ul>

<p dir="ltr">Sự linh hoạt trong khả năng mở rộng lưu trữ gi&uacute;p người d&ugrave;ng dễ d&agrave;ng bổ sung kh&ocirc;ng gian cho c&aacute;c tệp dữ liệu lớn, như dự &aacute;n đồ họa, tệp đa phương tiện chất lượng cao, hay t&agrave;i liệu c&ocirc;ng việc. Điều n&agrave;y đặc biệt hữu &iacute;ch cho những ai thường xuy&ecirc;n lưu trữ dữ liệu nội bộ v&agrave; cần kh&ocirc;ng gian lưu trữ lớn m&agrave; kh&ocirc;ng muốn phụ thuộc v&agrave;o c&aacute;c giải ph&aacute;p đ&aacute;m m&acirc;y.</p>

<h3 dir="ltr">Thiết kế m&agrave;n h&igrave;nh rộng r&atilde;i sắc n&eacute;t, cải thiện hiển thị h&igrave;nh ảnh trung thực</h3>

<p dir="ltr">Laptop Lenovo ThinkBook 14 G6 IRL 21KG00RDVN sở hữu m&agrave;n h&igrave;nh 14 inch với độ ph&acirc;n giải WUXGA (1920x1200), mang lại kh&ocirc;ng gian hiển thị rộng r&atilde;i. Độ ph&acirc;n giải WUXGA cho h&igrave;nh ảnh sắc n&eacute;t v&agrave; chi tiết, ph&ugrave; hợp cho c&aacute;c t&aacute;c vụ văn ph&ograve;ng cũng như giải tr&iacute; đa phương tiện.</p>

<p dir="ltr">Tấm nền IPS gi&uacute;p m&agrave;n h&igrave;nh c&oacute; g&oacute;c nh&igrave;n rộng v&agrave; khả năng hiển thị m&agrave;u sắc trung thực. Với độ s&aacute;ng 300 nits v&agrave; t&iacute;nh năng chống ch&oacute;i, người d&ugrave;ng c&oacute; thể l&agrave;m việc thoải m&aacute;i trong nhiều điều kiện &aacute;nh s&aacute;ng kh&aacute;c nhau, kể cả khi l&agrave;m việc ngo&agrave;i trời. Độ phủ m&agrave;u 45% NTSC tuy kh&ocirc;ng qu&aacute; xuất sắc nhưng vẫn đảm bảo m&agrave;u sắc hiển thị tương đối ch&iacute;nh x&aacute;c, đủ đ&aacute;p ứng cho c&aacute;c c&ocirc;ng việc văn ph&ograve;ng v&agrave; giải tr&iacute; cơ bản.</p>

<p dir="ltr"><img alt="Thiết kế màn hình rộng rãi sắc nét." src="https://cdn.hoanghamobile.com/i/content/Uploads/2024/11/11/thinkbook-14-g6-irl-ct1-05.jpg" title="Thiết kế màn hình rộng rãi sắc nét." /></p>

<p dir="ltr">Về đồ họa, m&aacute;y được trang bị Intel&reg; UHD Graphics t&iacute;ch hợp, gi&uacute;p xử l&yacute; c&aacute;c t&aacute;c vụ đồ họa nhẹ nh&agrave;ng v&agrave; cung cấp trải nghiệm giải tr&iacute; tốt khi xem video độ ph&acirc;n giải cao hoặc chơi c&aacute;c game nhẹ. Mặc d&ugrave; kh&ocirc;ng thể so s&aacute;nh với c&aacute;c d&ograve;ng m&aacute;y c&oacute; card đồ họa rời, nhưng Intel UHD Graphics vẫn đủ sức xử l&yacute; c&aacute;c t&aacute;c vụ cơ bản v&agrave; một số phần mềm đồ họa ở mức thiết lập thấp, ph&ugrave; hợp với đối tượng người d&ugrave;ng văn ph&ograve;ng v&agrave; sinh vi&ecirc;n.</p>
', N'DataImageSql/Laptop Lenovo ThinkBook 14 (1).png', N'10', N'Còn hàng', 3, 11)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (14, N'Laptop Dell Latitude 3540', CAST(N'2024-11-27' AS Date), 19390000, 19002200, 10, N'Laptop Dell Latitude 3540', N'<p>L&agrave; một biểu tượng của sự độc đ&aacute;o trong d&ograve;ng laptop Latitude của Dell, chiếc&nbsp;<a href="https://phongvu.vn/c/laptop-dell-latitude" rel="noopener noreferrer" target="_blank">Dell Latitude</a>&nbsp;3540 - 71021487 kh&ocirc;ng chỉ đ&aacute;p ứng nhu cầu về hiệu suất m&agrave; c&ograve;n l&agrave; một tuyệt t&aacute;c về thiết kế gọn nhẹ. Được thiết kế để đối mặt với những th&aacute;ch thức c&ocirc;ng việc đa dạng, laptop n&agrave;y tự h&agrave;o mang đến một trải nghiệm l&agrave;m việc mượt m&agrave; v&agrave; hiệu quả.</p>

<h2><strong>Kiểu d&aacute;ng nhỏ gọn thanh lịch với Dell Latitude 3540 - 71021487</strong></h2>

<p><img alt="Dell Latitude 3540 - 71021487 với kiểu dáng thanh lịch" src="https://storage.googleapis.com/teko-gae.appspot.com/media/image/2024/3/6/bb5a319c-0d78-4e34-9ffc-fa522174edd6/image.png" /></p>

<p>Dell Latitude 3540 - 71021487 với kiểu d&aacute;ng thanh lịch</p>

<p>Sự chắc chắn v&agrave; bền bỉ l&agrave; điểm gi&uacute;p&nbsp;<a href="https://phongvu.vn/c/laptop-dell">Dell Laptop</a>&nbsp;trở th&agrave;nh thương hiệu nổi tiếng, được mọi người quan t&acirc;m v&agrave; sử dụng.&nbsp;Với k&iacute;ch thước<strong>&nbsp;35.9 x 23.9 x 2 cm</strong>&nbsp;v&agrave; trọng lượng chỉ&nbsp;<strong>1.8 kg</strong>, chiếc laptop n&agrave;y được thiết kế với sự di động cao, l&agrave; lựa chọn l&yacute; tưởng cho những người di chuyển nhiều. Do đ&oacute; bạn c&oacute; thể dễ d&agrave;ng mang m&aacute;y đến bất cứ đ&acirc;u.</p>

<h2><strong>Thiết kế đơn giản, đẹp mắt - M&agrave;n h&igrave;nh 15.6 inch Full cho h&igrave;nh ảnh sống động</strong></h2>

<p><img alt="Màn hình 15.6 inch Full cho hình ảnh sống động" src="https://storage.googleapis.com/teko-gae.appspot.com/media/image/2024/3/6/a86764a6-39b4-4f2a-b39b-163fde86fa28/image.png" /></p>

<p>M&agrave;n h&igrave;nh 15.6 inch Full cho h&igrave;nh ảnh sống động</p>

<p>M&agrave;n h&igrave;nh&nbsp;<strong>15.6 inch Full HD WVA</strong>&nbsp;kh&ocirc;ng cảm ứng gi&uacute;p tạo ra h&igrave;nh ảnh chất lượng cao với độ sắc n&eacute;t v&agrave; g&oacute;c nh&igrave;n rộng. Tấm nền&nbsp;<strong>WVA&nbsp;</strong>hỗ trợ c&ocirc;ng việc đa nhiệm v&agrave; xem h&igrave;nh ảnh từ mọi g&oacute;c độ.</p>

<h2><strong>Hiệu suất mạnh mẽ với CPU Intel Core i5-1335U</strong></h2>

<p><a href="https://phongvu.vn/c/laptop" rel="noopener noreferrer" target="_blank">Laptop</a>&nbsp;n&agrave;y sở hữu CPU<strong>&nbsp;Intel Core i5-1335U</strong>&nbsp;thế hệ thứ 13 với 10 nh&acirc;n v&agrave; 12 luồng, gi&uacute;p đ&aacute;p ứng tốt với mọi nhu cầu xử l&yacute;. Đồng thời, chip đồ họa t&iacute;ch hợp Intel Iris Xe Graphics mang lại trải nghiệm h&igrave;nh ảnh mượt m&agrave;.</p>

<h2><strong>Dung lượng lưu trữ 256GB v&agrave; RAM 8GB cho khả năng đa nhiệm mượt m&agrave;</strong></h2>

<p>Kh&ocirc;ng chỉ đơn giản v&agrave; đẹp, Dell Laptop c&ograve;n t&iacute;ch hợp với&nbsp;<strong>8GB RAM DDR4 3200MHz</strong>, hỗ trợ mượt m&agrave; c&aacute;c t&aacute;c vụ đa nhiệm v&agrave; xử l&yacute; dữ liệu lớn. Ổ SSD M.2 NVMe dung lượng&nbsp;<strong>256GB&nbsp;</strong>gi&uacute;p khởi động nhanh ch&oacute;ng v&agrave; truy cập dữ liệu nhanh nhẹn.tạo cho bạn một kh&ocirc;ng gian đủ rộng để lưu trữ dữ liệu.</p>

<h2><strong>Hỗ trợ nhiều cổng kết nối phổ biến</strong></h2>

<p>Laptop n&agrave;y trang bị đầy đủ cổng kết nối với HDMI, USB Type C, v&agrave; Thunderbolt 3, đ&aacute;p ứng mọi nhu cầu kết nối của người d&ugrave;ng. Kết nối kh&ocirc;ng d&acirc;y qua WiFi 802.11ax v&agrave; Bluetooth 5.3 gi&uacute;p tối ưu h&oacute;a trải nghiệm kết nối.</p>

<h2><strong>Fedora v&agrave; b&agrave;n ph&iacute;m nhạy, dễ nh&igrave;n</strong></h2>
', N'DataImageSql/Laptop Dell Latitude 3540 71038101(1).jpg', N'2', N'Còn hàng', 3, 7)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (15, N'Laptop Dell Latitude 3550', CAST(N'2024-11-27' AS Date), 18900000, 17010000, 10, N'Laptop Dell Latitude 3550', N'<h2><strong>Laptop Dell Latitude 3550 42LT355001</strong></h2>

<p><strong><a href="https://www.anphatpc.com.vn/laptop-dell-latitude-3550-42lt355001.html" target="_blank">Laptop Dell Latitude 3550 42LT355001</a></strong>&nbsp;l&agrave; một lựa chọn l&yacute; tưởng d&agrave;nh cho người d&ugrave;ng doanh nghiệp hoặc c&aacute; nh&acirc;n cần một thiết bị l&agrave;m việc mạnh mẽ, bền bỉ v&agrave; đa nhiệm. Với cấu h&igrave;nh mạnh mẽ từ vi xử l&yacute; Intel Core i5 thế hệ 13, m&agrave;n h&igrave;nh FHD sắc n&eacute;t v&agrave; thiết kế chắc chắn, sản phẩm n&agrave;y đ&aacute;p ứng mọi nhu cầu l&agrave;m việc h&agrave;ng ng&agrave;y v&agrave; giải tr&iacute; cơ bản.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/22-10-2024/laptop-dell-latitude-3550-42lt355001-1.jpg" /></p>

<h3><strong>Hiệu suất mạnh mẽ với Intel Core i5-1335U</strong></h3>

<p><strong><a href="https://www.anphatpc.com.vn/laptop-dell-latitude_dm1619.html" target="_blank">Dell Latitude</a></strong>&nbsp;3550 được trang bị bộ vi xử l&yacute; Intel Core i5-1335U thế hệ 13, c&oacute; 10 nh&acirc;n v&agrave; 12 luồng, với tốc độ xung nhịp tối đa 4.60 GHz. Điều n&agrave;y gi&uacute;p m&aacute;y c&oacute; thể xử l&yacute; c&aacute;c t&aacute;c vụ đa nhiệm, từ l&agrave;m việc văn ph&ograve;ng, duyệt web, chỉnh sửa t&agrave;i liệu đến chạy c&aacute;c ứng dụng y&ecirc;u cầu nhiều t&agrave;i nguy&ecirc;n. Bộ nhớ đệm 12MB gi&uacute;p tăng tốc độ phản hồi, giảm thiểu độ trễ trong qu&aacute; tr&igrave;nh sử dụng.</p>

<h3><strong>RAM DDR5 v&agrave; ổ cứng SSD tốc độ cao</strong></h3>

<p>M&aacute;y được trang bị 8GB RAM DDR5 với tốc độ 5600 MT/s, mang đến khả năng đa nhiệm mượt m&agrave;. RAM DDR5 kh&ocirc;ng chỉ tăng tốc độ xử l&yacute; m&agrave; c&ograve;n cải thiện hiệu suất năng lượng, gi&uacute;p m&aacute;y hoạt động ổn định hơn, đặc biệt trong m&ocirc;i trường l&agrave;m việc y&ecirc;u cầu mở nhiều ứng dụng c&ugrave;ng l&uacute;c. Ổ cứng 512GB M.2 PCIe Gen 4 NVMe SSD đảm bảo khả năng truy xuất dữ liệu nhanh ch&oacute;ng, gi&uacute;p khởi động hệ điều h&agrave;nh v&agrave; c&aacute;c ứng dụng một c&aacute;ch nhanh ch&oacute;ng v&agrave; hiệu quả.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/22-10-2024/laptop-dell-latitude-3550-42lt355001.jpg" /></p>

<h3><strong>Đồ họa v&agrave; m&agrave;n h&igrave;nh chất lượng cao</strong></h3>

<p><strong><a href="https://www.anphatpc.com.vn/laptop-dell_dm1012.html" target="_blank">Laptop Dell</a></strong>&nbsp;Latitude 3550 sử dụng đồ họa t&iacute;ch hợp Intel UHD Graphics, ph&ugrave; hợp cho c&aacute;c t&aacute;c vụ văn ph&ograve;ng h&agrave;ng ng&agrave;y như duyệt web, xem video v&agrave; l&agrave;m việc với t&agrave;i liệu. M&agrave;n h&igrave;nh 15.6 inch FHD (1920x1080) cung cấp độ ph&acirc;n giải sắc n&eacute;t, hiển thị h&igrave;nh ảnh r&otilde; r&agrave;ng v&agrave; chi tiết. C&ocirc;ng nghệ IPS đảm bảo g&oacute;c nh&igrave;n rộng, trong khi lớp chống ch&oacute;i (AG) gi&uacute;p giảm hiện tượng l&oacute;a mắt khi l&agrave;m việc dưới &aacute;nh s&aacute;ng mạnh, mang lại trải nghiệm thoải m&aacute;i khi l&agrave;m việc cả ng&agrave;y d&agrave;i.</p>
', N'DataImageSql/Laptop Dell Latitude 3550 42LT355001(1).jpg', N'10', N'Còn hàng', 3, 7)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (16, N'Laptop Dell XPS 13', CAST(N'2024-11-27' AS Date), 52990000, 50340500, 10, N'Laptop Dell XPS 13', N'<h2><strong>Laptop Dell XPS 13 9340 71034922</strong></h2>

<p><strong><a href="https://www.anphatpc.com.vn/laptop-dell-xps-13-9340-71034922.html" target="_blank" title="Laptop Dell XPS 13 9340 71034922">Laptop Dell XPS 13 9340 71034922</a></strong>&nbsp;l&agrave; một trong những sản phẩm cao cấp của Dell d&agrave;nh cho người d&ugrave;ng chuy&ecirc;n nghiệp v&agrave; y&ecirc;u c&ocirc;ng nghệ. Với cấu h&igrave;nh mạnh mẽ v&agrave; thiết kế đẹp mắt, chiếc&nbsp;<a href="https://www.anphatpc.com.vn/laptop-dell_dm1012.html" target="_blank" title="laptop Dell">laptop Dell</a>&nbsp;n&agrave;y hứa hẹn mang lại trải nghiệm tuyệt vời trong c&ocirc;ng việc v&agrave; giải tr&iacute;.&nbsp;</p>

<h3><strong>Thiết kế sang trọng</strong></h3>

<p><strong>Laptop Dell XPS 13 9340 71034922</strong>&nbsp;c&oacute; thiết kế v&ocirc; c&ugrave;ng sang trọng v&agrave; hiện đại với viền m&agrave;n h&igrave;nh si&ecirc;u mỏng v&agrave; chất liệu hợp kim nh&ocirc;m cao cấp.</p>

<p>Khung nh&ocirc;m được gia c&ocirc;ng bằng m&aacute;y c&oacute; độ ch&iacute;nh x&aacute;c cao tạo n&ecirc;n một thiết kế trang nh&atilde;, bền bỉ v&agrave; chắc chắn v&agrave; đồng thời cũng mang tới trọng lượng cực kỳ tối ưu. K&iacute;ch thước 13 Inch mang lại cho chiếc Laptop n&agrave;y sự nhỏ gọn v&agrave; linh hoạt trong mọi trường hợp.&nbsp;<a href="https://www.anphatpc.com.vn/laptop-dell-xps_dm1621.html" target="_blank"><strong>Laptop Dell XPS</strong></a>&nbsp;n&agrave;y&nbsp;chỉ nặng 1.19 kg, gi&uacute;p bạn dễ d&agrave;ng mang theo mọi l&uacute;c, mọi nơi m&agrave; kh&ocirc;ng cảm thấy nặng nề.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/22-05-2024/dell_xps_13_9340_71034922_1.jpg" /></p>

<h3><strong>Hiển thị sắc n&eacute;t</strong></h3>

<p>M&agrave;n h&igrave;nh l&agrave; một phần quan trọng v&agrave; cần được ch&uacute; &yacute; khi chọn mua&nbsp;<strong><a href="https://www.anphatpc.com.vn/may-tinh-xach-tay-laptop.html" target="_blank">laptop</a></strong>, v&agrave;&nbsp;<strong>Laptop Dell XPS 13 9340 71034922</strong>&nbsp;sở hữu m&agrave;n h&igrave;nh 13,4Inch với độ ph&acirc;n giải Full HD+ sắc n&eacute;t. D&ugrave; k&iacute;ch thước nhỏ, nhưng m&agrave;n h&igrave;nh tr&ecirc;n chiếc Dell XPS n&agrave;y vẫn đảm bảo chất lượng h&igrave;nh ảnh đẹp v&agrave; sắc n&eacute;t cho mọi t&aacute;c vụ bạn cần tới. Tỉ lệ m&agrave;n h&igrave;nh 16:10 cho ph&eacute;p hiển thị nhiều chi tiết tr&ecirc;n m&agrave;n h&igrave;nh hơn m&agrave; kh&ocirc;ng cần phải cuộn chuột.</p>

<h2>&nbsp;<img alt="" src="https://anphat.com.vn/media/lib/22-05-2024/dell_xps_13_9340_71034922_0.jpg" /></h2>

<h3><strong>Hiệu suất mạnh mẽ</strong></h3>

<p><strong>Laptop Dell XPS 13 9340 71034922</strong>&nbsp;được trang bị bộ vi xử l&yacute; Intel Core Ultra 5 125H mới nhất v&agrave; mạnh mẽ nhất hiện nay. Hoạt động với 14 nh&acirc;n 18 luồng, tốc độ tối đa l&ecirc;n đến 4.5Ghz GHz v&agrave; bộ nhớ cache lớn 18MB, laptop n&agrave;y đủ sức đ&aacute;p ứng mọi nhu cầu c&ocirc;ng việc v&agrave; giải tr&iacute; của bạn một c&aacute;ch mượt m&agrave; v&agrave; nhanh ch&oacute;ng. D&ograve;ng Core Ultra thế hệ mới được t&iacute;ch hợp nh&acirc;n NPU v&agrave; sử dụng sức mạnh của ch&iacute; tuệ nh&acirc;n tạo để n&acirc;ng hiệu năng xử l&yacute; v&agrave; sử dụng điện năng của m&aacute;y l&ecirc;n một tầm cao mới. Tr&ecirc;n Core Ulrta 5 125H cũng được t&iacute;ch hợp th&ecirc;m cả GPU Intel ARC thế hệ mới hỗ trợ khả năng sử dụng AI để tăng cường xử l&yacute; đồ họa cho c&aacute;c t&aacute;c vụ của bạn.</p>
', N'DataImageSql/Laptop Dell XPS 13 9340 71034922 (Intel Core Ultra 5(1).jpg', N'5', N'Còn hàng', 3, 7)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (17, N'Laptop HP EliteBook 640', CAST(N'2024-11-27' AS Date), 23490000, 21141000, 20, N'Laptop HP EliteBook 640', N'<h2><strong>Laptop HP EliteBook 640 G10 873G2PA</strong></h2>

<p>Đẳng cấp v&agrave; ấn tượng hơn bao giờ hết c&ugrave;ng&nbsp;<strong><a href="https://www.anphatpc.com.vn/laptop-hp-elitebook-640-g10-873g2pa.html">HP EliteBook 640 G10 873G2PA</a></strong>&nbsp;với thiết kế sang trọng, gọn nhẹ, chuẩn doanh nh&acirc;n c&ugrave;ng khả năng vận h&agrave;nh v&agrave; xử l&yacute; mọi t&aacute;c vụ mạnh mẽ mang đến những trải nghiệm trọn vẹn, kh&oacute; qu&ecirc;n cho người d&ugrave;ng. Chiếc&nbsp;<strong><a href="https://www.anphatpc.com.vn/laptop-hp_dm1013.html">laptop HP</a></strong>&nbsp;n&agrave;y sở hữu nhiều ưu điểm vượt tầm gi&aacute;, hứa hẹn sẽ l&agrave; mẫu&nbsp;<strong><a href="https://www.anphatpc.com.vn/laptop-hp-elitebook_dm1629.html">HP Elitebook</a></strong>&nbsp;đ&aacute;ng mua nhất hiện nay!</p>

<p><strong>HP EliteBook 640 G10 873G2PA</strong>&nbsp;được trang bị vi xử l&yacute;&nbsp;Intel Core i5-1335U&nbsp;với tốc độ xung nhịp tối đa l&ecirc;n đến&nbsp;4.6GHz&nbsp;v&agrave; card&nbsp;Intel Iris Xe Graphics, cung cấp hiệu suất mạnh mẽ để xử l&yacute; c&aacute;c t&aacute;c vụ đa nhiệm, vận h&agrave;nh hiệu quả từ c&aacute;c c&ocirc;ng việc văn ph&ograve;ng đến chạy coding, l&agrave;m đồ hoạ, chơi game v&agrave; xem video 4K.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/09-11-2023/45445454.png" /></p>

<p>Bộ nhớ&nbsp;RAM 8GB&nbsp;đủ để chạy đa nhiệm, xử l&yacute; c&aacute;c t&aacute;c vụ nặng v&agrave; mở đồng thời nhiều ứng dụng, kh&ocirc;ng lo bị giật lag hay đơ m&aacute;y. Ổ cứng&nbsp;SSD 512GB NVMe PCIe&nbsp;gi&uacute;p giảm thời gian chờ đợi khi truy xuất dữ liệu v&agrave; khởi động ứng dụng, dung lượng đủ để bạn c&oacute; thể lưu trữ lượng t&agrave;i liệu lớn.</p>

<p>M&agrave;n h&igrave;nh&nbsp;laptop HP&nbsp;c&oacute; k&iacute;ch thước&nbsp;14inch&nbsp;với tấm nền&nbsp;IPS&nbsp;v&agrave; độ ph&acirc;n giải&nbsp;Full HD (1920 x 1080)&nbsp;hỗ trợ h&igrave;nh ảnh r&otilde; n&eacute;t v&agrave; chi tiết, g&oacute;c nh&igrave;n bao qu&aacute;t c&ugrave;ng kh&ocirc;ng gian hiển thị đủ lớn để bạn c&oacute; thể chia đ&ocirc;i cửa sổ l&agrave;m việc.&nbsp;Độ s&aacute;ng m&agrave;n h&igrave;nh ấn tượng đến 250 nits đem đến khung h&igrave;nh ch&acirc;n thật, r&otilde; n&eacute;t dưới mọi điều kiện &aacute;nh s&aacute;ng từ thấp đến cao, từ trong ph&ograve;ng đến ngo&agrave;i trời nắng gắt.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/09-11-2023/735453.png" /></p>

<p>Thư gi&atilde;n thoải m&aacute;i với &acirc;m nhạc v&agrave; phim ảnh qua chất &acirc;m sống động, c&oacute; c&aacute;c dải &acirc;m trầm cao nhờ c&ocirc;ng nghệ &acirc;m thanh&nbsp;Realtek High Definition Audio.&nbsp;</p>

<p>HD webcam&nbsp;t&iacute;ch hợp sẵn hỗ trợ l&agrave;m việc trực tuyến hiệu quả hơn, ngo&agrave;i ra bạn cũng c&oacute; thể đ&oacute;ng mở thủ c&ocirc;ng webcam khi kh&ocirc;ng d&ugrave;ng với&nbsp;c&ocirc;ng tắc kho&aacute; camera. Th&ecirc;m nữa, t&iacute;nh năng&nbsp;bảo mật v&acirc;n tay&nbsp;cũng mang đến t&iacute;nh tiện lợi v&agrave; an to&agrave;n hơn khi truy cập thiết bị.</p>
', N'DataImageSql/hp_eEliteBook_640(1).jpg', N'10', N'Còn hàng', 3, 9)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (18, N'Laptop HP Pavilion X360', CAST(N'2024-11-27' AS Date), 24290000, 21861000, 10, N'Laptop HP Pavilion X360', N'<h2><strong>Cấu h&igrave;nh mạnh mẽ, đa nhiệm hiệu quả</strong></h2>

<p>Với k&iacute;ch thước kh&aacute; mỏng nhẹ nhưng chiếc<strong>&nbsp;Laptop HP Pavilion X360 14-ek1049TU 80R27PA</strong>&nbsp;lại sở hữu cấu h&igrave;nh&nbsp;kh&aacute; mạnh với bộ vi xử l&yacute; Intel Core i5-1335U 10 nh&acirc;n 12 luồng mức xung nhịp cao 4.60 GHz sẵn s&agrave;ng thực hiện mọi c&ocirc;ng việc văn ph&ograve;ng cũng như mọi ứng dụng học tập kh&aacute;c mượt m&agrave;. Kh&ocirc;ng chỉ như vậy, dung lượng RAM của m&aacute;y được trang bị sẵn tới 16GB RAM để bạn thoải m&aacute;i lướt web, chuyển nhiều ứng dụng qua lại c&ugrave;ng l&uacute;c m&agrave; hầu như kh&ocirc;ng bao giờ gặp phải t&igrave;nh trạng giật, đơ m&aacute;y. Tuy đ&acirc;y l&agrave; kiểu RAM onboard h&agrave;n thẳng v&agrave;o mạch v&agrave; sẽ kh&ocirc;ng n&acirc;ng cấp được sau n&agrave;y nhưng với dung lượng kh&aacute; dư dả như vậy chắc chắn bạn sẽ y&ecirc;n t&acirc;m sử dụng l&acirc;u d&agrave;i trong nhiều năm tới.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/22-11-2023/laptophppavilionx36014-ek1049tu80r27pa.jpg" style="width:700px" /></p>

<p>Ổ cứng của m&aacute;y c&oacute; dung lượng 512GB v&agrave; sử dụng&nbsp;<strong><a href="https://www.anphatpc.com.vn/o-cung-ssd-m2-pcie_dm2310.html" target="_blank">SSD NVMe</a></strong>&nbsp;cho tốc độ đọc/ghi l&ecirc;n cao sẵn s&agrave;ng đ&aacute;p ứng vượt mong đợi của bạn khi mở, khởi động Windows v&agrave; nhiều ứng dụng kh&aacute;c khi m&agrave; thời gian l&uacute;c n&agrave;y sẽ chỉ được t&iacute;nh bằng gi&acirc;y.&nbsp;Pin của m&aacute;y c&oacute; dung lượng 43Wh - kh&ocirc;ng qu&aacute; nhiều tuy nhi&ecirc;n cũng đủ d&ugrave;ng cho khoảng 3-4 giờ l&agrave;m việc kh&ocirc;ng cần đến sạc chủ yếu bởi CPU của m&aacute;y thuộc d&ograve;ng U si&ecirc;u tiết kiệm điện năng.</p>

<h2><strong>M&agrave;n h&igrave;nh cảm ứng chất lượng cao c&ugrave;ng &acirc;m thanh chuẩn</strong></h2>

<p><strong>Laptop HP Pavilion X360 14-ek1049TU 80R27PA</strong>&nbsp;được trang bị m&agrave;n h&igrave;nh 14 inch Full HD sử dụng tấm nền IPS đem lại chất lượng m&agrave;u sắc sống động. Viền m&agrave;n h&igrave;nh 2 b&ecirc;n kh&aacute; mỏng đem lại trải nghiệm rộng liền mạch khi sử dụng m&aacute;y cho mục đ&iacute;ch giải tr&iacute;. Với t&iacute;nh năng l&agrave; một chiếc m&agrave;n h&igrave;nh cảm ứng c&oacute; độ s&aacute;ng 250nits, bạn ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m sử dụng chiếc m&agrave;n h&igrave;nh n&agrave;y tại nhiều m&ocirc;i trường &aacute;nh s&aacute;ng kh&aacute;c nhau m&agrave; kh&ocirc;ng lo bị ch&oacute;i s&aacute;ng.&nbsp;</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/22-11-2023/laptophppavilionx36014-ek1049tu80r27pa_1.jpg" style="width:700px" /></p>

<p>Để hỗ trợ tốt nhất cho việc sử dụng cảm ứng, HP đ&atilde; đ&iacute;nh k&egrave;m sản phẩm n&agrave;y một chiếc b&uacute;t - một c&ocirc;ng cụ rất đắc lực nếu như bạn l&agrave; người s&aacute;ng tạo nội dung hay l&agrave; người c&oacute; th&oacute;i quen ghi ch&eacute;p mọi thứ cần ghi nhớ. Chiếc b&uacute;t n&agrave;y c&oacute; thể gắn gọn g&agrave;ng ở cạnh m&agrave;n h&igrave;nh bằng nam ch&acirc;m. &Acirc;m thanh của chiếc laptop n&agrave;y kh&aacute; ấn tượng khi đ&acirc;y sử dụng loa gắn trong đến từ h&atilde;ng &acirc;m thanh nổi tiếng thế giới Bang &amp; Olufsen.&nbsp;&nbsp;</p>

<h2><strong>Kết nối tương th&iacute;ch đa dạng</strong></h2>

<p><img alt="" src="https://anphat.com.vn/media/lib/22-11-2023/laptophppavilionx36014-ek1049tu80r27pa_2.jpg" /></p>

<p>Chiếc laptop n&agrave;y sử dụng kết hợp c&aacute;c cổng kết nối th&ocirc;ng dụng nhất hiện nay bao gồm 1 cổng USB Type C (xuất h&igrave;nh DisplayPort 1.4, cấp điện), 2 cổng USB Type A để kết nối c&aacute;c thiết bị ngoại vi như b&agrave;n ph&iacute;m, chuột hay USB, ổ cứng di động. Cổng HDMI 2.1 cũng được trang bị ở cạnh tr&aacute;i để xuất h&igrave;nh chất lượng cao ph&ugrave; hợp tr&igrave;nh chiếu. Đặc biệt với những người c&oacute; l&agrave;m việc về media sẽ thấy kh&aacute; thuận lợi với cổng cắm thẻ nhớ Micro SD ngay ph&iacute;a b&ecirc;n cạnh phải.</p>
', N'DataImageSql/hp_pavilion_15(1).jpg', N'10', N'Còn hàng', 3, 9)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (19, N'Laptop HP Pavilion 15', CAST(N'2024-11-27' AS Date), 19900000, 16517000, 10, N'Laptop HP Pavilion 15', N'<h2><strong>Laptop HP Pavilion 15-eg3095TU 8C5L6PA</strong></h2>

<p><strong><a href="https://www.anphatpc.com.vn/laptop-hp-pavilion-15-eg3095tu-8c5l6pa.html" target="_blank">Laptop HP Pavilion 15-eg3095TU 8C5L6PA</a></strong>&nbsp;ch&iacute;nh l&agrave; chiếc&nbsp;<strong><a href="https://www.anphatpc.com.vn/may-tinh-xach-tay-laptop.html" target="_blank">Laptop</a></strong>&nbsp;đang cực k&igrave; được y&ecirc;u th&iacute;ch ở thời điểm hiện tại nhờ v&agrave;o diện mạo sang trọng, thiết kế gọn nhẹ trẻ trung nhưng vẫn đảm bảo cho c&aacute;c bạn một hiệu năng mạnh mẽ vượt bậc.&nbsp;Chiếc&nbsp;<strong><a href="https://www.anphatpc.com.vn/laptop-hp-pavilion_dm1626.html" target="_blank">HP Pavilion</a></strong>&nbsp;n&agrave;y&nbsp;chắc chắn l&agrave; một sự lựa chọn tuyệt vời để c&oacute; thể đ&aacute;p ứng một c&aacute;ch ho&agrave;n hảo nhu cầu của c&aacute;c kh&aacute;ch h&agrave;ng l&agrave; học sinh, sinh vi&ecirc;n hay nh&acirc;n vi&ecirc;n văn ph&ograve;ng&hellip;</p>

<p>Vậy chiếc&nbsp;Laptop HP&nbsp;n&agrave;y ấn tượng đến nhường n&agrave;o? Kh&ocirc;ng khiến c&aacute;c bạn phải chờ đợi th&ecirc;m l&acirc;u nữa, ch&uacute;ng ta h&atilde;y c&ugrave;ng t&igrave;m hiểu chi tiết hơn về chiếc&nbsp;<strong>Laptop HP Pavilion 15-eg3095TU 8C5L6PA</strong>&nbsp;ngay th&ocirc;i n&agrave;o!</p>

<h2><strong>Thiết kế trẻ trung sang trọng</strong></h2>

<p>Chiếc<strong>&nbsp;HP Pavilion 15-eg3095TU 8C5L6PA&nbsp;</strong>kế thừa phong c&aacute;ch tối giản nhưng đầy sang trọng&nbsp;đặc trưng của c&aacute;c d&ograve;ng m&aacute;y đến từ nh&agrave; HP n&oacute;i chung v&agrave; series Pavilion n&oacute;i ri&ecirc;ng.&nbsp;<strong>HP Pavilion 15&nbsp;</strong>l&agrave; sự kết hợp ho&agrave;n hảo của c&aacute;c đường n&eacute;t vu&ocirc;ng vức, đơn giản m&agrave; mạnh mẽ với sự mềm mại đến từ những đường v&aacute;t m&eacute;p cong nhẹ nh&agrave;ng. HP cũng v&ocirc; c&ugrave;ng kh&eacute;o l&eacute;o khi đặt một Logo s&aacute;ng b&oacute;ng nổi bật ở vị tr&iacute; ch&iacute;nh giữa của nắp m&aacute;y, vừa tạo điểm nhấn thương hiệu, vừa gi&uacute;p tổng thể thiết kế của chiếc laptop kh&ocirc;ng qu&aacute; đơn điệu.&nbsp;</p>

<p><img alt="" src="https://anphat.com.vn/media/product/45796_laptop_hp_pavilion_15_eg3095tu_8c5l6pa__3_.jpg" style="width:700px" /></p>

<p>L&agrave; chiếc m&aacute;y hướng đến những học sinh, sinh vi&ecirc;n v&agrave; nh&acirc;n vi&ecirc;n văn ph&ograve;ng n&ecirc;n&nbsp;<strong>HP Pavilion 15-eg3094TU 8C5L5PA</strong>&nbsp;đặc biệt ch&uacute; trọng tới t&iacute;nh di động với k&iacute;ch thước tổng thể v&agrave; trọng lượng chỉ 1.74kg.</p>

<h2><strong>M&agrave;n h&igrave;nh hiển thị chất lượng</strong></h2>

<p>Chiếc<strong>&nbsp;<a href="https://www.anphatpc.com.vn/laptop-hp_dm1013.html" target="_blank" title="mua laptop HP giá rẻ nhất ">laptop&nbsp;HP</a>&nbsp;Pavilion 15-eg3095TU 8C5L6PA&nbsp;</strong>được HP trang bị một m&agrave;n h&igrave;nh với k&iacute;ch thước 15.6 inch, độ ph&acirc;n giải Full HD (1920 x 1080) mang đến chất lượng h&igrave;nh ảnh sắc n&eacute;t, sống động để bạn được tận hưởng m&agrave;n h&igrave;nh lớn v&ocirc; c&ugrave;ng &ldquo;đ&atilde; mắt&rdquo;, đảm bảo những giờ ph&uacute;t giải tr&iacute; ho&agrave;n to&agrave;n đắm ch&igrave;m trong c&aacute;c bộ phim hay tựa game y&ecirc;u th&iacute;ch.</p>

<p>Độ s&aacute;ng m&agrave;n h&igrave;nh 250 nits l&agrave; vừa đủ để c&oacute; thể đ&aacute;p ứng ho&agrave;n to&agrave;n nhu cầu hiển thị trong những kh&ocirc;ng gian quen thuộc như khi ở nh&agrave;, lớp học, văn ph&ograve;ng, qu&aacute;n cafe ...</p>

<p><img alt="" src="https://anphat.com.vn/media/product/45796_laptop_hp_pavilion_15_eg3095tu_8c5l6pa.jpg" style="width:700px" /></p>

<p>Thiết kế viền m&agrave;n h&igrave;nh si&ecirc;u mỏng (micro-edge) của chiếc laptop&nbsp;<strong>HP Pavilion 15-eg3095TU 8C5L6PA&nbsp;</strong>cho ph&eacute;p bạn gia tăng sự tập trung v&agrave; ho&agrave;n to&agrave;n đắm ch&igrave;m v&agrave;o từng khung h&igrave;nh hiển thị. Đồng thời, n&oacute; cũng gi&uacute;p đảm bảo k&iacute;ch thước m&aacute;y được nhỏ gọn, sang trọng trong khi người d&ugrave;ng vẫn được tận hưởng m&agrave;n h&igrave;nh lớn đến 15.6 inch.</p>

<p>Ở cạnh tr&ecirc;n của m&agrave;n h&igrave;nh c&ograve;n được bố tr&iacute; đầy đủ Webcam t&iacute;ch hợp Micro để đ&aacute;p ứng c&aacute;c nhu cầu Video Call với c&aacute;c ứng dụng quen thuộc như: Facebook, Zalo, Skype, ... hay tham gia c&aacute;c lớp học v&agrave; c&aacute;c buổi học hay hội họp trực tuyến của c&aacute;c bạn.</p>

<h2><strong>Hiệu năng mạnh mẽ</strong></h2>

<p>Chiếc m&aacute;y t&iacute;nh x&aacute;ch tay&nbsp;<strong>HP Pavilion 15-eg3095TU 8C5L6PA</strong>&nbsp;được trang bị bộ vi xử l&yacute; Intel thế hệ thứ 13 mới nhất&nbsp;Intel Core i5-1335U cực k&igrave; mạnh mẽ với 10 nh&acirc;n 12 luồng, xung nhịp tối đa l&ecirc;n đến 4.6GHz. Chiếc&nbsp;Intel Core i5-1335U c&oacute; thể đ&aacute;p ứng tốt c&aacute;c t&aacute;c vụ học tập v&agrave; l&agrave;m việc từ bộ c&ocirc;ng cụ Office cơ bản tới những t&aacute;c vụ chỉnh sửa h&igrave;nh ảnh th&ocirc;ng dụng m&agrave; người d&ugrave;ng sẽ sử dụng.</p>
', N'DataImageSql/hp_pavilion_15(1).jpg', N'17', N'Còn hàng', 3, 9)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (20, N'Laptop HP Pavilion ', CAST(N'2024-11-27' AS Date), 15000000, 15000000, 10, N'Laptop HP Pavilion ', N'<h2><strong>Laptop HP Pavilion 15-eg3111TU 8U6L8PA</strong></h2>

<p><strong><a href="https://www.anphatpc.com.vn/laptop-hp-pavilion-15-eg3111tu-8u6l8pa.html" target="_blank" title="Laptop HP Pavilion 15-eg3111TU 8U6L8PA ">Laptop HP Pavilion 15-eg3111TU 8U6L8PA&nbsp;</a></strong>l&agrave; một lựa chọn tuyệt vời cho người d&ugrave;ng cần một chiếc&nbsp;<a href="https://www.anphatpc.com.vn/laptop-van-phong-gia-re_dm1613.html" target="_blank" title="laptop văn phòng">laptop văn ph&ograve;ng</a>&nbsp;mạnh mẽ, đ&aacute;p ứng tốt c&aacute;c nhu cầu từ c&ocirc;ng việc đến giải tr&iacute;. Với sự kết hợp giữa cấu h&igrave;nh mạnh mẽ, thiết kế tinh tế v&agrave; c&aacute;c t&iacute;nh năng hiện đại,&nbsp;<a href="https://www.anphatpc.com.vn/laptop-hp_dm1013.html" target="_blank" title="Laptop HP">Laptop HP</a>&nbsp;n&agrave;y sẽ l&agrave; trợ thủ đắc lực cho bạn trong mọi t&aacute;c vụ h&agrave;ng ng&agrave;y.</p>

<h3><strong>Hiệu Năng Mạnh Mẽ Với CPU Intel Core i5-1335U</strong></h3>

<p><strong>HP Pavilion 15-eg3111TU</strong>&nbsp;được trang bị bộ vi xử l&yacute; Intel Core i5-1335U thế hệ thứ 13, mang đến sức mạnh xử l&yacute; vượt trội với 10 nh&acirc;n v&agrave; 12 luồng, c&oacute; khả năng tăng tốc xung nhịp l&ecirc;n đến 4.60 GHz. Với bộ nhớ đệm 12MB, chiếc laptop n&agrave;y c&oacute; thể xử l&yacute; mượt m&agrave; c&aacute;c t&aacute;c vụ đa nhiệm, từ c&ocirc;ng việc văn ph&ograve;ng đến c&aacute;c ứng dụng đ&ograve;i hỏi hiệu suất cao hơn như chỉnh sửa ảnh v&agrave; video nhẹ.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/26-08-2024/laptop-hp-pavilion-15-eg3111tu-8u6l8pa-0.jpg" /></p>

<h3><strong>Đa Nhiệm V&agrave; Lưu Trữ Thoải M&aacute;i</strong></h3>

<p>Với 16GB RAM DDR4 3200MHz được cấu h&igrave;nh dưới dạng 2 khe (8GBx2), m&aacute;y đảm bảo khả năng đa nhiệm tuyệt vời, gi&uacute;p bạn chuyển đổi giữa c&aacute;c ứng dụng một c&aacute;ch nhanh ch&oacute;ng v&agrave; hiệu quả. Ổ cứng SSD PCIe&reg; NVMe&trade; M.2 dung lượng 512GB kh&ocirc;ng chỉ cung cấp kh&ocirc;ng gian lưu trữ lớn m&agrave; c&ograve;n gi&uacute;p tăng tốc độ khởi động hệ điều h&agrave;nh v&agrave; truy xuất dữ liệu, mang lại trải nghiệm người d&ugrave;ng mượt m&agrave;.</p>

<h3><strong>Đồ Họa Intel Iris Xe Graphics</strong></h3>

<p>Được t&iacute;ch hợp đồ họa Intel Iris Xe Graphics,&nbsp;<strong>HP Pavilion 15-eg3111TU</strong>&nbsp;hỗ trợ tốt cho c&aacute;c t&aacute;c vụ đồ họa cơ bản v&agrave; c&aacute;c tựa game nhẹ. D&ugrave; kh&ocirc;ng phải l&agrave; laptop chuy&ecirc;n về đồ họa hay chơi game, nhưng với Iris Xe Graphics, bạn vẫn c&oacute; thể trải nghiệm c&aacute;c ứng dụng đồ họa v&agrave; chơi game nhẹ một c&aacute;ch mượt m&agrave;.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/26-08-2024/laptop-hp-pavilion-15-eg3111tu-8u6l8pa-2.jpg" /></p>

<h3><strong>M&agrave;n H&igrave;nh 15.6 Inch FHD IPS Sắc N&eacute;t</strong></h3>

<p>M&agrave;n h&igrave;nh của&nbsp;<strong>HP Pavilion 15-eg3111TU</strong>&nbsp;c&oacute; k&iacute;ch thước 15.6 inch, độ ph&acirc;n giải FHD (1920x1080), mang lại h&igrave;nh ảnh r&otilde; n&eacute;t v&agrave; chi tiết. Tấm nền IPS gi&uacute;p g&oacute;c nh&igrave;n rộng, kết hợp với c&ocirc;ng nghệ BrightView cho độ s&aacute;ng 250 nits v&agrave; độ phủ m&agrave;u 45% NTSC, mang đến trải nghiệm thị gi&aacute;c sống động, ph&ugrave; hợp cho cả c&ocirc;ng việc lẫn giải tr&iacute;.</p>
', N'DataImageSql/hp_pavillon(1).jpg', N'0', N'Còn hàng', 3, 9)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (21, N'Laptop HP VICTUS', CAST(N'2024-11-27' AS Date), 21900000, 20805000, 10, N'Laptop HP VICTUS', N'<h3><strong>Hiệu Năng Mạnh Mẽ&nbsp;</strong></h3>

<p>Nh&igrave;n chung với một chiếc Laptop ở tầm gi&aacute; khoảng 18 triệu đồng, mục ti&ecirc;u của những chiếc Laptop Gaming ở tầm gi&aacute; n&agrave;y l&agrave; chơi tốt những tựa Game Online th&ocirc;ng dụng ở độ ph&acirc;n giải FullHD, c&ugrave;ng với đ&oacute; l&agrave; cũng c&oacute; thể cho bạn trải nghiệm ổn với những tựa Game nặng tại mức thiết lập đồ họa từ Thấp - Trung b&igrave;nh.<strong>&nbsp;Laptop HP VICTUS 15-fa1155TX 952R1PA_16G</strong>&nbsp;c&oacute; thể đảm bảo đ&aacute;p ứng tốt cho nhu cầu đ&oacute; với cấu h&igrave;nh<strong>&nbsp;Intel Core i5-12450H - RTX 2050 4GB - 16GB RAM - 512GB SSD</strong>.</p>

<p><img alt="" src="https://www.anphatpc.com.vn/media/news/3009_Laptop-HP-VICTUS-15-fa1155TX-952R1PA-16G-4.jpg" style="height:563px; width:1000px" /></p>

<p>Đầu ti&ecirc;n n&oacute;i về CPU, HP Victus 15 trang bị CPU Intel Core i5-12450H 8 nh&acirc;n 12 luồng với tốc độ xung nhịp tối đa l&ecirc;n đến 4.40GHz v&agrave; bộ nhớ đệm 12MB. Cho thử nghiệm chiếc CPU n&agrave;y với phần mềm Cinebench R23 cho kết quả rất ổn với 8878 điểm c&ugrave;ng với mức nhiệt độ trung b&igrave;nh khoảng 74 độ - kh&aacute; ổn cho một mẫu CPU tầm trung.</p>

<p><img alt="" src="https://www.anphatpc.com.vn/media/news/3009_Laptop-HP-VICTUS-15-fa1155TX-952R1PA-16G-R23.jpg" style="height:563px; width:1000px" /></p>

<p>Đi cặp c&ugrave;ng con chip i5 thế hệ thứ 12 l&agrave; RTX 2050 cũng l&agrave; một mẫu Card đồ họa cực kỳ ngon d&agrave;nh cho những chiếc Laptop Gaming tầm trung. Với 4GB VRAM th&igrave; RTX 2050 vẫn c&oacute; thể đ&aacute;p ứng tốt đa số những tựa Game ở thời điểm hiện tại. Thử nghiệm cho chạy Furmark trong khoảng 8 ph&uacute;t tại độ ph&acirc;n giải FullHD 1920 x 1080, RTX 2050 lu&ocirc;n duy tr&igrave; khoảng tr&ecirc;n 40fps trong khi chạy Benchmark. Nhiệt độ tại Hotspot l&agrave; 78 độ khi chạy Benchmark vẫn nằm trong mức rất ổn định để đảm bảo hoạt động tốt ngay cả khi bạn sử dụng m&aacute;y trong thời gian d&agrave;i.</p>

<p><img alt="" src="https://www.anphatpc.com.vn/media/news/3009_Laptop-HP-VICTUS-15-fa1155TX-952R1PA-16G-Furmark.jpg" style="height:563px; width:1000px" /></p>

<p>M&igrave;nh cũng tiến h&agrave;nh kiểm tra RAM v&agrave; SSD của m&aacute;y.&nbsp;<strong>HP VICTUS 15-fa1155TX 952R1PA_16G</strong>&nbsp;c&oacute; RAM thực l&agrave; 15.6GB, thử với nhu cầu sử dụng hằng ng&agrave;y khi vừa chơi Li&ecirc;n Minh Huyền Thoại, vừa chạy khoảng hơn 20Tabs Chrome th&igrave; m&aacute;y chỉ ăn khoảng hơn 11GB RAM, vẫn c&ograve;n tr&ocirc;ng rất nhiều dung lượng để bạn c&oacute; thể sử dụng th&ecirc;m những t&aacute;c vụ kh&aacute;c m&agrave; kh&ocirc;ng hề xảy ra hiện tượng giật Lag.</p>

<p><img alt="" src="https://www.anphatpc.com.vn/media/news/3009_Laptop-HP-VICTUS-15-fa1155TX-952R1PA-16G-RAM.jpg" style="height:563px; width:1000px" /></p>

<p>Một điểm cộng lớn tr&ecirc;n chiếc Victus n&agrave;y l&agrave; n&oacute; được trang bị 1 chiếc ổ cứng SSD cực kỳ ngon tới từ SAMSUNG. Dung lượng 512GB c&ugrave;ng với đ&oacute; l&agrave; tốc độ đọc ghi ấn tượng l&ecirc;n tới 6000Mb/s gi&uacute;p từ tốc độ mở t&agrave;i liệu, tốc độ khoải động Windows, tốc độ Load cảnh trong Game, tốc độ copy t&agrave;i liệu đều cực kỳ nhanh ch&oacute;ng.</p>
', N'DataImageSql/hp_victus_16(1).jpg', N'5', N'Còn hàng', 3, 9)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (22, N'Laptop Lenovo IdeaPad Slim 5', CAST(N'2024-11-27' AS Date), 22690000, 21555500, 10, N'Laptop Lenovo IdeaPad Slim 5', N'<h2><strong>Laptop Lenovo IdeaPad Slim 5 14IMH9 83DA001NVN</strong></h2>

<p><strong><img alt="" src="https://anphat.com.vn/media/lib/15-06-2024/lenovo_ideapad_slim5_14imh9_reviews_13.jpg" /></strong></p>

<p>&nbsp;</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/15-06-2024/lenovo_ideapad_slim5_14imh9_reviews_8.jpg" /></p>

<p><strong><a href="https://www.anphatpc.com.vn/laptop-lenovo-ideapad-slim-5-14imh9-83da001nvn.html" target="_blank" title="Laptop Lenovo IdeaPad Slim 5 14IMH9 83DA001NVN">Laptop Lenovo IdeaPad Slim 5 14IMH9 83DA001NVN</a></strong>&nbsp;l&agrave; một chiếc laptop sẽ ph&ugrave; hợp với phong c&aacute;ch tối giản đang phổ biến ng&agrave;y nay trong giới sinh vi&ecirc;n v&agrave; văn ph&ograve;ng. C&ugrave;ng t&igrave;m hiểu ngay về chiếc Laptop Lenovo cực ngon n&agrave;y qua b&agrave;i viết dưới đ&acirc;y cua An Ph&aacute;t Computer.</p>

<p>&nbsp;</p>

<h3><strong>Thiết kế đẹp mắt</strong></h3>

<p><strong><img alt="" src="https://anphat.com.vn/media/lib/15-06-2024/lenovo_ideapad_slim5_14imh9_reviews_1.jpg" /></strong></p>

<p>&nbsp;</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/15-06-2024/lenovo_ideapad_slim5_14imh9_reviews_2.jpg" /></p>

<p>&nbsp;</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/15-06-2024/lenovo_ideapad_slim5_14imh9_reviews_3.jpg" /></p>

<p><img alt="" src="https://anphat.com.vn/media/lib/15-06-2024/lenovo_ideapad_slim5_14imh9_reviews_4.jpg" /></p>

<p><strong>Laptop Lenovo IdeaPad Slim 5 14IMH9 83DA001NVN</strong>&nbsp;vẫn sở hữu thiết kế sang trọng đặc trưng của d&ograve;ng IdeaPad với Tone m&agrave;u x&aacute;m lạnh lịch l&atilde;m. Thiết kế bo tr&ograve;n rất nhỏ ở 4 g&oacute;c&nbsp;ph&ugrave; hợp cho&nbsp;c&aacute;c&nbsp;giới t&iacute;nh. Đ&uacute;ng với c&aacute;i t&ecirc;n Slim, phần th&acirc;n m&aacute;y được v&aacute;t dốc về ph&iacute;a chiếu nghỉ l&agrave;m cho m&aacute;y c&oacute; phần mỏng v&agrave; gọn hơn.</p>
', N'DataImageSql/Laptop Lenovo IdeaPad Slim 5 14IMH9 83DA001NVN(1).jpg', N'5', N'Còn hàng', 3, 11)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (23, N'Laptop Lenovo ThinkBook 16', CAST(N'2024-11-27' AS Date), 20900000, 18810000, 10, N'Laptop Lenovo ThinkBook 16', N'<h2><strong>Laptop Lenovo ThinkBook 16 G6 ABP 21KK0061VN</strong></h2>

<p>L&agrave; một trong những &quot;&ocirc;ng ho&agrave;ng&quot; của giới c&ocirc;ng nghệ với xuất th&acirc;n từ Bắc Kinh, Trung Quốc,&nbsp;<a href="https://www.anphatpc.com.vn/laptop-lenovo_dm1059.html" target="_blank">Laptop Lenovo</a>&nbsp;lu&ocirc;n l&agrave; một trong những d&ograve;ng&nbsp;<a href="https://www.anphatpc.com.vn/laptop-van-phong-gia-re_dm1613.html" target="_blank">Laptop văn ph&ograve;ng</a>&nbsp;được người d&ugrave;ng y&ecirc;u th&iacute;ch h&agrave;ng đầu. Thuộc v&agrave;o d&ograve;ng sản phẩm&nbsp;<a href="https://www.anphatpc.com.vn/laptop-lenovo-thinkbook_dm1762.html" target="_blank">Lenovo ThinkBook</a>&nbsp;đ&igrave;nh đ&aacute;m,<strong>&nbsp;Lenovo ThinkBook 16 G6 ABP 21KK0061VN</strong>&nbsp;hội tụ mọi ti&ecirc;u ch&iacute; cần c&oacute; của một mẫu Laptop cao cấp, hiện đại. C&ugrave;ng t&igrave;m hiểu ngay về&nbsp;<strong><a href="https://www.anphatpc.com.vn/laptop-lenovo-thinkbook-16-g6-abp-21kk0061vn.html" target="_blank" title="Lenovo ThinkBook 16 G6 ABP 21KK0061VN">Lenovo ThinkBook 16 G6 ABP 21KK0061VN</a></strong>&nbsp;qua b&agrave;i viết ngay dưới đ&acirc;y của An Ph&aacute;t Computer.</p>

<h3><strong>Thiết kế</strong></h3>

<p>Với t&ocirc;ng m&agrave;u x&aacute;m quen thuộc tuy đơn giản vẫn mang tới vẻ lịch l&atilde;m sang trọng cho&nbsp;<strong>Lenovo ThinkBook 16 G6 ABP 21KK0061VN</strong>. Kh&ocirc;ng chỉ vậy, người d&ugrave;ng sẽ bất ngờ trước sự vượt trội về độ nhỏ gọn của sản phẩm nh&agrave; Lenovo đ&atilde; cho tr&igrave;nh l&agrave;ng. K&iacute;ch thước 356 x 253.5 x 17.5 mm&nbsp;c&ugrave;ng trọng lượng 1.7kg đ&atilde; mang đến sự thuận lợi tối ưu, đặc biệt ph&ugrave; hợp với người d&ugrave;ng thường xuy&ecirc;n di chuyển.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/27-05-2024/laptop_lenovo_thinkbook_16_g6_abp_21kk0061vn_1.jpg" /></p>

<h3><strong>M&agrave;n h&igrave;nh hiển thị</strong></h3>

<p>Được trang bị m&agrave;n h&igrave;nh với k&iacute;ch thước 16 inch độ ph&acirc;n giải WUXGA(2560x1600)&nbsp;,&nbsp;<strong>Lenovo ThinkBook 16 G6 ABP 21KK0061VN</strong>&nbsp;mang tới cho người d&ugrave;ng c&oacute; trải nghiệm thoải m&aacute;i nhất với những h&igrave;nh ảnh v&ocirc; c&ugrave;ng ch&acirc;n thực. Tấm nền IPS với độ bao phủ m&agrave;u đạt tới 100% sRGB cho h&igrave;nh ảnh ấn tượng tr&ecirc;n từng khung h&igrave;nh. Với độ bao phủ m&agrave;u 100% sRGB, m&agrave;u sắc được t&aacute;i tạo ch&iacute;nh x&aacute;c cho ph&eacute;p bạn thực hiện những t&aacute;c vụ l&agrave;m việc li&ecirc;n quan tới đồ họa v&agrave; cho ra sản phẩm với độ chuẩn x&aacute;c cao.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/27-05-2024/laptop_lenovo_thinkbook_16_g6_abp_21kk0061vn_0.jpg" /></p>

<h3><strong>B&agrave;n ph&iacute;m v&agrave; Touchpad</strong></h3>

<p><strong>Lenovo ThinkBook 16 G6 ABP 21KK0061VN</strong>&nbsp;sở hữu bố cục hợp l&yacute;, k&iacute;ch thước ph&iacute;m ph&ugrave; hợp với người chơi, h&agrave;nh tr&igrave;nh ph&iacute;m d&agrave;i tạo cảm gi&aacute;c &ecirc;m v&agrave; nhanh hơn khi sử dụng. Kh&ocirc;ng chỉ vậy, dải đ&egrave;n nền được trang bị cho sản phẩm gi&uacute;p chiếc m&aacute;y t&iacute;nh của bạn trở n&ecirc;n bắt mắt hơn, kết hợp c&ugrave;ng với touchpad được hỗ trợ cảm ứng đa điểm, tăng khả năng linh hoạt khi sử dụng v&agrave; dễ d&agrave;ng điều khiển con trỏ chuột ngay cả khi kh&ocirc;ng c&oacute; sự hỗ trợ của chuột m&aacute;y t&iacute;nh rời.</p>

<h3><strong>Hiệu năng mạnh mẽ</strong></h3>

<p><strong>Lenovo ThinkBook 16 G6 ABP 21KK0061VN</strong>&nbsp;được trang bị bộ vi xử l&yacute;&nbsp;AMD Ryzen 7 7730U cực mạnh mẽ với 8 nh&acirc;n 16 luồng, xung nhịp 4.5Ghz. Hiệu năng ấn tượng của con Chip n&agrave;y cho ph&eacute;p xử l&yacute; nhanh gọn c&aacute;c t&aacute;c vụ của nh&acirc;n vi&ecirc;n văn ph&ograve;ng, xử l&yacute; c&aacute;c th&ocirc;ng tin lưu trữ nặng, sử dụng đa nhiệm hay download song song nhiều th&ocirc;ng tin dữ liệu c&ugrave;ng l&uacute;c.&nbsp;</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/27-05-2024/laptop_lenovo_thinkbook_16_g6_abp_21kk0061vn_2.jpg" /></p>

<p>Nhờ RAM 16GB DDR4,&nbsp;<strong>Lenovo ThinkBook 16 G6 ABP 21KK0061VN</strong>&nbsp;c&oacute; thể hoạt động đa nhiệm cực kỳ mượt m&agrave; v&agrave; trơn tru để bạn thoải m&aacute;i mở h&agrave;ng chục Tabs&nbsp;Browser, l&agrave;m việc với nhiều ứng dụng, thay đổi giữa c&aacute;c cửa sổ m&agrave; kh&ocirc;ng xảy ra t&igrave;nh trạng giật lag kh&oacute; chịu.</p>

<p>512GB SSD l&agrave; qu&aacute; thoải m&aacute;i để bạn lưu trữ những t&agrave;i liệu quan trọng cũng như h&igrave;nh ảnh, video v&agrave; những b&agrave;i h&aacute;t y&ecirc;u th&iacute;ch của m&igrave;nh. Thế hệ ổ cứng&nbsp;PCIe&reg; 4.0x4 NVMe&reg; mới cho tốc độ đọc ghi vượt trội, tăng cường tốc độ mở tệp v&agrave; ứng dụng, giảm thời gian copy tệp v&agrave; khiến thời gian khởi động m&aacute;y t&iacute;nh chỉ c&ograve;n vỏn vẹn v&agrave;i gi&acirc;y.</p>
', N'DataImageSql/Laptop Lenovo ThinkBook 14 (1).png', N'10', N'Còn hàng', 3, 11)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (24, N'Laptop Lenovo ThinkPad P16s Gen3', CAST(N'2024-11-27' AS Date), 41850000, 37665000, 10, N'Laptop Lenovo ThinkPad P16s Gen3', N'<h2><strong>Laptop Lenovo ThinkPad P16s Gen3 T 21KS0038VA&nbsp;</strong></h2>

<p><strong><a href="https://www.anphatpc.com.vn/laptop-lenovo-thinkpad-p16s-gen3-t-21ks0038va.html" target="_blank" title="Laptop Lenovo ThinkPad P16s Gen3 T 21KS0038VA">Laptop Lenovo ThinkPad P16s Gen3 T 21KS0038VA</a>&nbsp;</strong>l&agrave; một sản phẩm thuộc d&ograve;ng&nbsp;<a href="https://www.anphatpc.com.vn/laptop-do-hoa.html" target="_blank" title="laptop đồ họa">laptop đồ họa</a>&nbsp;chuy&ecirc;n nghiệp, được thiết kế d&agrave;nh ri&ecirc;ng cho c&aacute;c chuy&ecirc;n gia đ&ograve;i hỏi hiệu suất cao v&agrave; t&iacute;nh ổn định trong c&ocirc;ng việc h&agrave;ng ng&agrave;y. Với c&aacute;c th&agrave;nh phần phần cứng mạnh mẽ v&agrave; thiết kế chắc chắn, chiếc&nbsp;<a href="https://www.anphatpc.com.vn/laptop-lenovo_dm1059.html" target="_blank" title="laptop Lenovo">laptop Lenovo</a>&nbsp;n&agrave;y đ&aacute;p ứng tốt nhu cầu từ c&ocirc;ng việc văn ph&ograve;ng đến c&aacute;c ứng dụng đồ họa chuy&ecirc;n s&acirc;u.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/28-08-2024/laptop-lenovo-thinkpad-p16s-gen3-t21ks0039va-0.jpg" /></p>

<h3><strong>Hiệu Năng Mạnh Mẽ Với CPU Intel Core Ultra 5</strong></h3>

<p>Tr&aacute;i tim của&nbsp;<strong>ThinkPad P16s Gen3</strong>&nbsp;l&agrave; bộ vi xử l&yacute; Intel&reg; Core&trade; Ultra 5 125H với cấu tr&uacute;c 14 l&otilde;i (4 l&otilde;i hiệu năng cao, 8 l&otilde;i tiết kiệm điện, v&agrave; 2 l&otilde;i tiết kiệm năng lượng). Với tốc độ xung nhịp tối đa l&ecirc;n đến 4.5GHz v&agrave; bộ nhớ đệm 18MB, CPU n&agrave;y đảm bảo khả năng xử l&yacute; nhanh ch&oacute;ng v&agrave; mượt m&agrave; cho mọi t&aacute;c vụ, từ đa nhiệm đến xử l&yacute; dữ liệu lớn. Điều n&agrave;y gi&uacute;p người d&ugrave;ng dễ d&agrave;ng quản l&yacute; c&aacute;c dự &aacute;n phức tạp m&agrave; kh&ocirc;ng gặp bất kỳ hiện tượng giật lag n&agrave;o.</p>

<h3><strong>Hiệu Suất Đồ Họa Ưu Việt Với NVIDIA RTX 500 Ada Generation</strong></h3>

<p>Để hỗ trợ c&aacute;c t&aacute;c vụ đồ họa chuy&ecirc;n s&acirc;u,&nbsp;<strong>ThinkPad P16s Gen3</strong>&nbsp;được trang bị card đồ họa NVIDIA&reg; RTX 500 Ada Generation với 4GB GDDR6. Card đồ họa n&agrave;y cung cấp hiệu suất mạnh mẽ, ph&ugrave; hợp cho c&aacute;c c&ocirc;ng việc li&ecirc;n quan đến thiết kế đồ họa, render video, hoặc sử dụng c&aacute;c ứng dụng m&ocirc; phỏng 3D. Sự kết hợp giữa CPU mạnh mẽ v&agrave; GPU cao cấp biến chiếc laptop n&agrave;y th&agrave;nh c&ocirc;ng cụ l&yacute; tưởng cho c&aacute;c nh&agrave; thiết kế, kỹ sư v&agrave; những người l&agrave;m trong lĩnh vực s&aacute;ng tạo.</p>

<h3><strong>M&agrave;n H&igrave;nh Sắc N&eacute;t v&agrave; Đầy Đủ Chi Tiết</strong></h3>

<p><strong>ThinkPad P16s Gen3</strong>&nbsp;sở hữu m&agrave;n h&igrave;nh 16 inch WUXGA (1920x1200) với tấm nền IPS, độ s&aacute;ng 300 nits v&agrave; lớp phủ chống ch&oacute;i. M&agrave;n h&igrave;nh n&agrave;y mang lại h&igrave;nh ảnh sắc n&eacute;t, r&otilde; r&agrave;ng v&agrave; chi tiết, đồng thời giảm thiểu hiện tượng ch&oacute;i s&aacute;ng khi l&agrave;m việc trong m&ocirc;i trường nhiều &aacute;nh s&aacute;ng. Với độ bao phủ m&agrave;u 45% NTSC, m&agrave;n h&igrave;nh đủ để đ&aacute;p ứng c&aacute;c nhu cầu c&ocirc;ng việc h&agrave;ng ng&agrave;y v&agrave; giải tr&iacute;, d&ugrave; kh&ocirc;ng chuy&ecirc;n s&acirc;u về m&agrave;u sắc.</p>

<h3><strong>Bộ Nhớ V&agrave; Lưu Trữ Tối Ưu</strong></h3>

<p>Được trang bị 32GB RAM DDR5-5600,&nbsp;<strong>Lenovo ThinkPad P16s Gen3</strong>&nbsp;mang lại khả năng đa nhiệm tuyệt vời, gi&uacute;p bạn chuyển đổi giữa c&aacute;c ứng dụng m&agrave; kh&ocirc;ng gặp t&igrave;nh trạng chậm trễ. Ổ cứng SSD 1TB PCIe 4.0x4 NVMe kh&ocirc;ng chỉ cung cấp kh&ocirc;ng gian lưu trữ rộng r&atilde;i m&agrave; c&ograve;n đảm bảo tốc độ truy xuất dữ liệu nhanh ch&oacute;ng, gi&uacute;p tăng hiệu suất l&agrave;m việc v&agrave; giảm thời gian chờ.</p>

<h3><strong>Thiết Kế Bền Bỉ V&agrave; Di Động</strong></h3>

<p><strong>ThinkPad P16s Gen3</strong>&nbsp;c&oacute; thiết kế với vỏ nh&ocirc;m chắc chắn, mang lại độ bền cao v&agrave; khả năng chống chịu va đập tốt. Với trọng lượng chỉ 1.82 kg v&agrave; k&iacute;ch thước 361.5 x 248.6 x 21.13 mm, laptop n&agrave;y rất dễ d&agrave;ng mang theo khi di chuyển, ph&ugrave; hợp cho những người l&agrave;m việc thường xuy&ecirc;n phải di chuyển hoặc l&agrave;m việc từ xa. Pin dung lượng 75Wh đảm bảo thời gian sử dụng l&acirc;u d&agrave;i, gi&uacute;p bạn y&ecirc;n t&acirc;m l&agrave;m việc m&agrave; kh&ocirc;ng cần lo lắng về vấn đề sạc pin li&ecirc;n tục.</p>
', N'DataImageSql/Laptop Lenovo ThinkPad P16s Gen3 T 21KS0038VA(1).jpg', N'10', N'Còn hàng', 3, 11)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (25, N'Laptop Lenovo Yoga Book 9', CAST(N'2024-11-27' AS Date), 66990000, 60291000, 10, N'Laptop Lenovo Yoga Book 9', N'<p><strong><a href="https://www.anphatpc.com.vn/laptop-lenovo-yoga-book-9-13imu9-83ff001svn.html" target="_blank" title="Laptop Lenovo Yoga Book 9 13IMU9 83FF001SVN">Laptop Lenovo Yoga Book 9 13IMU9 83FF001SVN</a></strong>&nbsp;l&agrave; một thiết bị đột ph&aacute; trong ng&agrave;nh c&ocirc;ng nghệ, đặc biệt l&agrave; trong ph&acirc;n kh&uacute;c laptop cao cấp, nổi bật với khả năng hỗ trợ tr&iacute; tuệ nh&acirc;n tạo (AI) ti&ecirc;n tiến. Mẫu laptop n&agrave;y trang bị CPU Intel Core Ultra 7 155U, kh&ocirc;ng chỉ c&oacute; tốc độ xử l&yacute; ấn tượng l&ecirc;n đến 4.80GHz v&agrave; bộ nhớ đệm 24MB, m&agrave; c&ograve;n được t&iacute;ch hợp NPU (Neural Processing Unit), tăng cường khả năng xử l&yacute; c&aacute;c t&aacute;c vụ li&ecirc;n quan đến AI một c&aacute;ch mượt m&agrave; v&agrave; hiệu quả.</p>

<p><img alt="lenovo-yoga-book-9-13IMU9-83FF001SVN-1" src="https://anphat.com.vn/media/lib/03-05-2024/lnv_yoga9_83ff001svn_1.png" style="height:590px; width:600px" /></p>

<p>RAM của m&aacute;y l&agrave; 32GB LPDDR5x tốc độ 7467MHz, kh&ocirc;ng hỗ trợ n&acirc;ng cấp, nhưng đ&atilde; sẵn s&agrave;ng đ&aacute;p ứng hầu hết c&aacute;c nhu cầu l&agrave;m việc nặng như chỉnh sửa video, đồ họa, v&agrave; c&aacute;c t&aacute;c vụ đa nhiệm kh&aacute;c. Về lưu trữ, Lenovo Yoga Book 9 sở hữu ổ cứng SSD 1TB M.2 2242 PCIe&reg; 4.0x4 NVMe&reg; với khả năng n&acirc;ng cấp thay thế tối đa l&ecirc;n đến 2TB, mang lại kh&ocirc;ng gian lưu trữ rộng r&atilde;i v&agrave; tốc độ truyền tải dữ liệu cực nhanh.</p>

<p><img alt="lenovo-yoga-book-9-13IMU9-83FF001SVN-2" src="https://anphat.com.vn/media/lib/03-05-2024/lnv_yoga9_83ff001svn_2.png" style="height:568px; width:600px" /></p>

<p>Điểm nổi bật của m&aacute;y ch&iacute;nh l&agrave; m&agrave;n h&igrave;nh OLED 13.3 inch, độ ph&acirc;n giải 2.8K (2880x1800), cung cấp độ s&aacute;ng l&ecirc;n đến 400 nits v&agrave; dải m&agrave;u 100% DCI-P3, hỗ trợ Eyesafe&reg;, Dolby&reg; Vision&trade;, v&agrave; DisplayHDR&trade; True Black 500. M&agrave;n h&igrave;nh cảm ứng đa điểm n&agrave;y kh&ocirc;ng chỉ mang lại h&igrave;nh ảnh sắc n&eacute;t, m&agrave;u sắc trung thực m&agrave; c&ograve;n đảm bảo an to&agrave;n cho mắt người d&ugrave;ng, ph&ugrave; hợp với những người d&agrave;nh nhiều giờ l&agrave;m việc trước m&agrave;n h&igrave;nh.</p>

<p>Về bảo mật,&nbsp;<strong><a href="https://www.anphatpc.com.vn/laptop-lenovo_dm1059.html" target="_blank" title="Laptop Lenovo">Laptop Lenovo</a></strong>&nbsp;Yoga Book 9 trang bị camera hồng ngoại 5MP hỗ trợ Windows Hello, cho ph&eacute;p đăng nhập bảo mật qua nhận diện khu&ocirc;n mặt, v&agrave; kh&oacute;a đ&oacute;ng mở camera điện tử, bảo vệ quyền ri&ecirc;ng tư của người d&ugrave;ng một c&aacute;ch tối ưu. Cổng kết nối của m&aacute;y bao gồm 3 cổng USB-C&reg; hỗ trợ Thunderbolt&trade; 4 v&agrave; USB4&reg; 40Gbps, với khả năng sạc USB PD 3.0 v&agrave; DisplayPort&trade; 2.1, mang lại sự linh hoạt cao trong việc kết nối với c&aacute;c thiết bị ngoại vi.</p>

<p><img alt="lenovo-yoga-book-9-13IMU9-83FF001SVN-3" src="https://anphat.com.vn/media/lib/03-05-2024/lnv_yoga9_83ff001svn_3.png" style="height:581px; width:600px" /></p>

<p>M&agrave;u sắc TIDAL TEAL của m&aacute;y c&ugrave;ng thiết kế mỏng nhẹ với trọng lượng chỉ 1.34 kg l&agrave;m tăng th&ecirc;m vẻ ngo&agrave;i thời trang v&agrave; năng động cho sản phẩm. Lenovo Yoga Book 9 kh&ocirc;ng chỉ l&agrave; một c&ocirc;ng cụ l&agrave;m việc mạnh mẽ m&agrave; c&ograve;n l&agrave; một phụ kiện c&ocirc;ng nghệ tinh tế, thể hiện gu thẩm mỹ cao của người d&ugrave;ng.</p>
', N'DataImageSql/Laptop Lenovo Yoga 9 2-in-1 14IMH9 83AC000SVN(1).jpg', N'10', N'Còn hàng', 3, 11)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (26, N'MacBook Air M1 13 inch', CAST(N'2024-11-28' AS Date), 28890000, 21667500, 10, N'MacBook Air M1 13 inch', N'<h2><strong>Laptop Apple Macbook Air 13.3 inch MGND3SA/A Gold</strong></h2>

<h2><strong>ĐẲNG CẤP C&Ocirc;NG NGHỆ V&Agrave; THỜI TRANG</strong></h2>

<p><img alt="" src="https://anphat.com.vn/media/lib/22-04-2022/mac-air-2020.jpg" style="width:700px" /></p>

<p>Trong c&ugrave;ng 1 năm&nbsp;<strong>MacBook Air 2020</strong>&nbsp;mới đ&atilde; được Apple n&acirc;ng cấp v&agrave; cho ra mắt sau sự xuất hiện của con Chip Apple M1 được ph&aacute;t triển&nbsp;dựa tr&ecirc;n&nbsp;kiến tr&uacute;c ARM mới, nhanh hơn 98% so với c&aacute;c d&ograve;ng PC, thời gian sử dụng pin 18 giờ. Đ&acirc;y ch&iacute;nh l&agrave; chiếc&nbsp;<strong><a href="https://www.anphatpc.com.vn/macbook-air_dm2217.html" target="_blank">MacBook Air</a></strong>&nbsp;đầu ti&ecirc;n, cũng như l&agrave; chiếc m&aacute;y Mac đầu ti&ecirc;n của&nbsp;<strong><a href="https://www.anphatpc.com.vn/apple_dm1064.html-1" target="_blank">Apple</a></strong>&nbsp;trong việc chuyển dịch sang hệ chip ARM.</p>

<p>Theo th&ocirc;ng tin được tiết lộ&nbsp;<strong>MacBook Air 2020</strong>&nbsp; sử dụng&nbsp;con chip M1 mới cho hiệu năng v&agrave; khả năng ti&ecirc;u thụ năng lượng hiệu quả hơn chip Intel. Trong b&agrave;i viết n&agrave;y An Ph&aacute;t sẽ giới thiệu&nbsp;<strong>Laptop Apple Macbook Air 13.3 inch MGND3SA/A Gold</strong>&nbsp;với&nbsp;<strong>3 m&agrave;u</strong>&nbsp;cực sang trọng!&nbsp;</p>

<h3><em><strong>Thiết kế đẳng cấp</strong></em></h3>

<p><strong>Laptop Apple Macbook Air 13.3 inch MGND3SA/A Gold</strong>&nbsp;nổi tiếng với phong c&aacute;ch thiết kế&nbsp;mỏng nhẹ, sang trọng v&agrave; tinh tế đ&atilde; thu h&uacute;t được đ&ocirc;ng đảo người d&ugrave;ng y&ecirc;u th&iacute;ch v&agrave; lựa chọn, c&oacute; t&ugrave;y chọn m&agrave;u sắc&nbsp;<strong>Gold</strong>,&nbsp;<strong>Siliver</strong>&nbsp;v&agrave;&nbsp;<strong>Grey</strong>&nbsp;ph&ugrave; hợp với sở th&iacute;ch của người d&ugrave;ng.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/22-04-2022/7d94efd3c6f11d5153f0c50205af5454_800x800q1001.jpg" style="width:700px" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>Sự đẳng cấp được thể hiện trong thiết kế&nbsp;<a href="https://www.anphatpc.com.vn/may-tinh-xach-tay-laptop.html" target="_blank">laptop&nbsp;</a>được thể hiện chất liệu lớp kim loại nguy&ecirc;n khối, vỏ m&aacute;y được t&aacute;c chế từ nguy&ecirc;n liệu nh&ocirc;m t&aacute;i chế 100% vừa cho độ bền cao vừa g&oacute;p phần bảo vệ m&ocirc;i trường, người d&ugrave;ng c&oacute; thể y&ecirc;n t&acirc;m chiếc m&aacute;y của m&igrave;nh c&oacute; khả năng&nbsp; chịu va đập tốt, c&aacute;c linh kiện b&ecirc;n trong an to&agrave;n lu&ocirc;n được bảo vệ nếu c&oacute; xảy ra va chạm mạnh.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/22-04-2022/mac1.png" style="width:700px" /></p>

<p>B&ecirc;n cạnh đ&oacute;, Mac cũng đề cao t&iacute;nh di động v&agrave; tiện &iacute;ch cho người d&ugrave;ng khi thiết kế m&aacute;y với trọng lượng kh&aacute; nhẹ chỉ 1.29 kg, độ mỏng 16.1 mm c&oacute; thể dễ d&agrave;ng mang theo, hứa hẹn&nbsp;<strong>Laptop Apple Macbook Air 13.3 inch MGND3SA/A Gold</strong>&nbsp;&nbsp;sẽ l&agrave; người bạn đồng h&agrave;nh của bạn mọi l&uacute;c mọi nơi, tr&ecirc;n mọi h&agrave;nh tr&igrave;nh d&ugrave; gần d&ugrave; xa.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/22-04-2022/apple-macbook-air-2020.jpg" style="width:700px" /></p>

<h3><em><strong>&nbsp;Kết nối si&ecirc;u tốc</strong></em></h3>

<p><strong>Laptop Apple Macbook Air 13.3 inch MGND3SA/A Gold</strong>&nbsp;được trang bị 2 cổng kết nối&nbsp;<strong>Thunderbolt 3&nbsp;</strong>hiện đại được&nbsp; sử dụng phổ biến hiện nay cho tốc độ truyền tải nhanh gấp 2 lần so với thế hệ Thunderbolt 2 trước đ&acirc;y,&nbsp;&nbsp;tốc độ truyền tải l&ecirc;n đến&nbsp;<strong>40 Gb/s.</strong></p>

<p><strong><img alt="" src="https://anphat.com.vn/media/lib/22-04-2022/53016_1.jpg" style="width:700px" /></strong></p>

<p>B&ecirc;n cạnh Thunderbolt 3, với một chiếc m&aacute;y t&iacute;nh hiện đại như MAc kh&ocirc;ng thể thiếu kết nối&nbsp; kh&ocirc;ng d&acirc;y l&agrave;&nbsp;<strong>Wi-Fi 6&nbsp;</strong>tốt h&agrave;ng đầu hiện nay, so với&nbsp;Wi-Fi 5 chỉ c&oacute;&nbsp;<strong>7.000 Mbps&nbsp;</strong>th&igrave; wifi 6 cho tốc độ cao hơn r&otilde; r&agrave;ng<strong>,&nbsp;</strong>&nbsp;tốc độ truyền tải dữ liệu nhanh ch&oacute;ng l&ecirc;n đến&nbsp;<strong>10.000 Mbps.&nbsp;</strong>Ngo&agrave;i ra,&nbsp;&nbsp;<strong>Bluetooth v5.0&nbsp;</strong>c&oacute; tốc độ tối đa l&agrave;&nbsp;<strong>50 Mbps</strong>&nbsp;cho bạn trải nghiệm mượt m&agrave;, mang tới khả năng kết nối nhanh v&agrave; ổn định hơn nhiều so với c&aacute;c thiết bị Bluetooth thế hệ trước đ&oacute;.</p>
', N'DataImageSql/Laptop Apple MacBook Air 13 inch M3(1).jpg', N'25', N'Còn hàng', 3, 19)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (27, N'Macbook Air 13.6 inch', CAST(N'2024-11-28' AS Date), 31900000, 25520000, 10, N'Macbook Air 13.6 inch', N'<h2><strong>Laptop Apple Macbook Air 13.6 inch MLY33SA/A</strong></h2>

<h2><strong>Sang Trọng Tinh Tế - Hiệu Năng Vượt Bậc - Chứng Minh Đẳng Cấp</strong></h2>

<p><img alt="" src="https://anphat.com.vn/media/lib/13-08-2022/nbap0118-1.jpg" /></p>

<p>Sau th&agrave;nh c&ocirc;ng vang dội từ thế hệ&nbsp;<a href="https://www.anphatpc.com.vn/may-tinh-xach-tay-laptop.html" target="_blank">laptop - m&aacute;y t&iacute;nh x&aacute;ch tay</a>&nbsp;sử dụng bộ vi xử l&yacute; M1 đầu ti&ecirc;n của m&igrave;nh,&nbsp;<a href="https://www.anphatpc.com.vn/apple_dm1064.html-1" target="_blank">Apple</a>&nbsp;c&ugrave;ng đội ngũ kỹ sư c&ocirc;ng nghệ h&agrave;ng đầu của m&igrave;nh đ&atilde; kh&ocirc;ng ngừng nghi&ecirc;n cứu, ph&aacute;t triển v&agrave; cho ra mắt d&ograve;ng sản phẩm&nbsp;<a href="https://www.anphatpc.com.vn/macbook-air_dm2217.html" target="_blank">Macbook Air</a>&nbsp;mới nhất của m&igrave;nh. Mẫu laptop đ&atilde; kế thừa ho&agrave;n to&agrave;n những ưu điểm của thế hệ tiền nhiệm k&egrave;m theo những cải tiến về ngoại h&igrave;nh c&ugrave;ng sự n&acirc;ng cấp vượt bậc về hiệu năng với bộ vi xử l&yacute; Apple M2. C&ugrave;ng t&igrave;m hiểu chi tiết hơn về mẫu&nbsp;<strong><a href="https://www.anphatpc.com.vn/laptop-apple-macbook-air-13.3-inch-mly33sa-a-xanh-den-apple-m2.html" target="_blank">Apple&nbsp;Macbook Air 13.6 inch MLY33SA/A</a></strong>&nbsp;ngay th&ocirc;i n&agrave;o!</p>

<p>&nbsp;</p>

<h2><strong>Thiết Kế&nbsp;Tinh Tế Sang Trọng V&agrave; Đẳng Cấp</strong></h2>

<p><img alt="" src="https://anphat.com.vn/media/lib/13-08-2022/nbap0118-2.jpg" /></p>

<p>Những chiếc Laptop Macbook Air lu&ocirc;n nổi tiếng với phong c&aacute;ch thiết kế mỏng nhẹ tinh tế c&ugrave;ng một vẻ ngo&agrave;i sang trọng m&agrave; c&aacute;c bạn chắc chắn sẽ kh&ocirc;ng t&igrave;m thấy ở bất cứ d&ograve;ng laptop n&agrave;o kh&aacute;c. V&agrave; chắc chắn rồi, chiếc Laptop&nbsp;<strong>Apple Macbook Air 13.6 inch MLY33SA/A</strong>&nbsp;mới vừa được Apple ra mắt cũng kh&ocirc;ng phải ngoại lệ. Laptop Apple Macbook Air M2 sở hữu thiết kế si&ecirc;u mỏng nhẹ với trọng lượng chỉ 1.24 kg c&ugrave;ng độ mỏng 1.13 cm. Chiếc Laptop mới nhất đến từ Apple n&agrave;y sẽ l&agrave; người bạn đồng h&agrave;nh tuyệt vời, đồng h&agrave;nh c&ugrave;ng c&aacute;c bạn mọi l&uacute;c mọi nơi, lu&ocirc;n sẵn s&agrave;ng hỗ trợ c&aacute;c bạn mỗi khi cần.</p>

<p>Kh&ocirc;ng dừng lại ở đ&oacute;, to&agrave;n bộ phần vỏ ngo&agrave;i của chiếc laptop&nbsp;<strong>Apple Macbook Air 13.6 inch MLY33SA/A</strong>&nbsp;được l&agrave;m ho&agrave;n từ chất liệu nh&ocirc;m cao cấp bền bỉ. Đ&acirc;y l&agrave; loại chất liệu tuyệt vời, vừa gi&uacute;p n&acirc;ng tầm vẻ sang trọng cho tổng thể thiết kế, vừa gi&uacute;p bảo vệ chiếc laptop tốt hơn trước những va đập trong qu&aacute; tr&igrave;nh sử dụng. Đặc biệt, chất liệu nh&ocirc;m c&ograve;n mang tới khả năng tản nhiệt ấn tượng cho chiếc laptop, từ đ&oacute; đem đến cho người d&ugrave;ng sự ổn định khi sử dụng cũng như gia tăng đ&aacute;ng kể độ bền cho linh kiện b&ecirc;n trong.</p>

<p>&nbsp;</p>

<h2><strong>Hiệu Năng&nbsp;Si&ecirc;u Mạnh Mẽ Từ&nbsp;Chip M2</strong></h2>

<p><img alt="" src="https://anphat.com.vn/media/lib/13-08-2022/nbap0118-3.jpg" /></p>

<p>Chip M2 ch&iacute;nh l&agrave; thế hệ bộ vi xử l&yacute; tiếp theo của Apple, sở hữu tốc độ c&ugrave;ng hiệu suất năng lượng cao hơn thế hệ tiền nhiệm M1 v&agrave; cũng l&agrave; điểm nhấn ấn tượng nhất tr&ecirc;n laptop&nbsp;<strong>Apple Macbook Air 13.6 inch MLY33SA/A</strong>. Với Chip M2, c&aacute;c bạn sẽ c&oacute; tới 8 nh&acirc;n CPU, 10 nh&acirc;n GPU, 16 nh&acirc;n Neural Engine, tiến tr&igrave;nh 5nm với số lượng b&oacute;ng b&aacute;n dẫn l&ecirc;n tới hơn 20 tỉ (Nhiều hơn 25% khi so s&aacute;nh với M1). Apple cũng sử dụng c&aacute;c l&otilde;i hiệu suất mới tr&ecirc;n M2, c&ugrave;ng với băng th&ocirc;ng bộ nhớ 100 Gbps v&agrave; hỗ trợ l&ecirc;n đến 24 GB RAM LPDDR5 (Nhiều hơn 50% băng th&ocirc;ng so với M1).</p>

<p>Với hiệu năng tuyệt vời, laptop&nbsp;<strong>Apple Macbook Air 13.6 inch MLY33SA/A</strong>&nbsp;sẽ gi&uacute;p c&aacute;c bạn c&oacute; thể ph&aacute;t v&agrave; chỉnh sửa nhiều luồng video 4K v&agrave; 8K ProRes (Bao gồm cả quay video 4K ProRes tr&ecirc;n Iphone 13 Pro). Đứa con cưng từ Apple sẽ l&agrave; sự lựa chọn tuyệt vời, đảm bảo cho c&aacute;c bạn c&oacute; thể thoải m&aacute;i học tập, giải tr&iacute; hay l&agrave;m những c&ocirc;ng việc s&aacute;ng tạo nội dung với hiệu suất tuyệt vời. C&aacute;c bạn c&oacute; thể thoải m&aacute;i sử dụng chiếc laptop Chip M2 n&agrave;y cả ng&agrave;y lẫn đ&ecirc;m nhờ thời lượng pin c&oacute; thể l&ecirc;n tới 18 giờ đồng hồ.</p>

<p>Laptop&nbsp;<strong>Apple Macbook Air 13.6 inch MLY33SA/A</strong>&nbsp;A được trang bị l&ecirc;n tới RAM 8GB, mang tới khả năng đa nhiệm vượt trội, gi&uacute;p c&aacute;c bạn mở c&ugrave;ng l&uacute;c nhiều tab, mở nhiều ứng dụng để phục vụ cho c&ocirc;ng việc, giải tr&iacute; của m&igrave;nh kh&ocirc;ng cần lo lắng vấn đề về giật lag. B&ecirc;n cạnh đ&oacute;, Với ổ SSD si&ecirc;u nhanh l&ecirc;n đến 256GB, MacBook Air cho tốc độ xử l&yacute; nhanh ch&oacute;ng v&agrave; đem đến kh&ocirc;ng gian lưu trữ rộng r&atilde;i để c&aacute;c bạn c&oacute; thể thoải m&aacute;i sử dụng.</p>

<p>&nbsp;</p>

<h2><strong>M&agrave;n H&igrave;nh Retina Lỏng Tuyệt Đẹp</strong></h2>

<p><img alt="" src="https://anphat.com.vn/media/lib/13-08-2022/nbap0118-4.jpg" /></p>

<p>Laptop&nbsp;<strong>Apple Macbook Air 13.6 inch MLY33SA/A</strong>&nbsp;sở hữu m&agrave;n h&igrave;nh Liquid Retina 13,6 inch ngoạn mục, đ&acirc;y cũng l&agrave; m&agrave;n h&igrave;nh với k&iacute;ch thước lớn nhất, s&aacute;ng nhất v&agrave; chưa từng c&oacute; tr&ecirc;n MacBook Air. Chiếc laptop Apple mang tới từng khung h&igrave;nh với chất lượng hiển thị vượt bậc, văn bản si&ecirc;u n&eacute;t, ảnh phim rực rỡ v&agrave; sống động hơn, với độ tương phản phong ph&uacute;, chi tiết, sắc n&eacute;t.</p>

<p>M&agrave;n h&igrave;nh tr&ecirc;n chiếc Macbook Air M2 n&agrave;y c&ograve;n hỗ trợ khả năng hiển thị hơn 1 tỷ m&agrave;u. Điều n&agrave;y lại một lần nữa chứng minh tại sao Macbook lu&ocirc;n l&agrave; d&ograve;ng laptop được c&aacute;c nh&agrave; thiết kế, s&aacute;ng tạo nội dung, editor ưa chuộng v&agrave; tin tưởng lựa chọn nhiều đến vậy.</p>
', N'DataImageSql/Laptop Apple Macbook Air 13.6 inch M2(1).jpg', N'20', N'Còn hàng', 3, 19)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (29, N'MacBook Pro 16 M3 PRO', CAST(N'2024-11-28' AS Date), 63990000, 63990000, 5, N'MacBook Pro 16 M3 PRO', N'<h2><strong>MacBook Pro 16 M3 PRO (12C CPU - 18C GPU - 18GB - 512B SSD) ĐEN (SPACE BLACK) MRW13SA/A</strong></h2>

<p>L&agrave; một nh&agrave; cung cấp h&agrave;ng loạt c&aacute;c đồ c&ocirc;ng nghệ như tai nghe, m&aacute;y t&iacute;nh, điện thoại &hellip; nổi danh khắp thế giới từ rất l&acirc;u - <strong><a href="https://www.anphatpc.com.vn/apple_dm1064.html-1">Apple</a></strong> lu&ocirc;n sẵn s&agrave;ng đem lại cho người d&ugrave;ng những trải nghiệm tuyệt vời nhất khi sử dụng những sản phẩm tinh xảo của họ. Một trong những d&ograve;ng sản phẩm nổi bật ấy, ch&uacute;ng ta kh&ocirc;ng thể kh&ocirc;ng nhắc đến Macbook v&agrave; tại lần ra mắt mới n&agrave;y, Apple đ&atilde; cho tr&igrave;nh l&agrave;ng <strong>MacBook Pro 16 M3 PRO (12C CPU - 18C GPU - 18GB - 512B SSD) ĐEN (SPACE BLACK) MRW13SA/A</strong>, chắc chắn sẽ cung cấp những t&aacute;c vụ v&agrave; linh kiện hiện đại hơn rất nhiều so với những đời Macbook trước đ&acirc;y.&nbsp;</p>

<p><strong><strong><img alt="" src="https://anphat.com.vn/media/lib/16-12-2023/47262_macbook_pro_14_m3_max__14c_cpu___30c_gpu___36gb___1tb____en__space_black__mrx53saa__1_.jpg" style="width:700px" /></strong></strong></p>

<p>Với c&acirc;n nặng, k&iacute;ch thước lần lượt l&agrave; 2.14 kg v&agrave; 35.57cm x 24.81cm x 1.68cm cho thấy sự nhỏ gọn đặc trưng của d&ograve;ng <strong><a href="https://www.anphatpc.com.vn/macbook-pro_dm2218.html">Macbook Pro</a></strong>, ph&ugrave; hợp với mọi người v&agrave; hỗ trợ người d&ugrave;ng dễ d&agrave;ng mang theo b&ecirc;n m&igrave;nh. B&ecirc;n cạnh đ&oacute;, sản phẩm xuất hiện với m&agrave;n h&igrave;nh 16.2 inches (3456 x 2234) được trang bị c&ocirc;ng nghệ True tone, dải m&agrave;u rộng (P3) v&agrave; độ s&aacute;ng đỉnh l&ecirc;n tới 1600 nit hứa hẹn cung cấp cho người d&ugrave;ng những h&igrave;nh ảnh với m&agrave;u sắc ch&acirc;n thực, sống động v&agrave; cảm gi&aacute;c mắt sẽ thoải m&aacute;i hơn. Chiếc Macbook n&agrave;y bao gồm camera 1080p FaceTime HD khiến cho mọi t&aacute;c vụ video call hay chụp ảnh đều ch&acirc;n thực v&agrave; sắc n&eacute;t, hạn chế tối đa hiện tượng mờ, nh&ograve;e v&agrave; vỡ ảnh.&nbsp;</p>

<p>Kiểu b&agrave;n ph&iacute;m Backlit Magic với c&aacute;c ph&iacute;m chức năng, h&agrave;nh tr&igrave;nh ph&iacute;m d&agrave;i, mượt kết hợp c&ugrave;ng cảm biến &aacute;nh s&aacute;ng xung quanh lần lượt tăng sự thu h&uacute;t về ngoại h&igrave;nh, vừa mang lại cảm gi&aacute;c thoải m&aacute;i khi sử dụng b&agrave;n ph&iacute;m. Kh&ocirc;ng chỉ vậy, touchpad cũng được trang bị v&ocirc; c&ugrave;ng đa năng khi c&oacute; thể thực hiện một loạt c&aacute;c thao t&aacute;c kh&aacute;c nhau thay thế cho chuột rời, hỗ trợ người d&ugrave;ng sử dụng Macbook một c&aacute;ch linh hoạt hơn rất nhiều.&nbsp;</p>

<p><strong><strong><img alt="" src="https://anphat.com.vn/media/lib/16-12-2023/47262_macbook_pro_14_m3_max__14c_cpu___30c_gpu___36gb___1tb____en__space_black__mrx53saa__2_.jpg" style="width:700px" /></strong></strong></p>

<p>Với hệ điều h&agrave;nh ri&ecirc;ng MacOS nổi danh từ l&acirc;u vốn cung cấp cho người sử dụng khả năng kết nối với c&aacute;c dữ liệu v&agrave; d&ograve;ng game hiện đại kh&ocirc;ng kh&aacute;c những hệ điều h&agrave;nh Window mới nhất hiện nay, hỗ trợ người d&ugrave;ng trở n&ecirc;n dễ d&agrave;ng hơn trong việc xử l&yacute; đa dạng c&aacute;c t&aacute;c vụ.</p>

<p><strong>MacBook Pro 16 M3 Pro</strong> n&agrave;y được sử dụng d&ograve;ng Apple M3 Pro chip with 12-core <strong><a href="https://www.anphatpc.com.vn/cpu-desktop.html">CPU</a></strong> - một trong những bộ vi xử l&iacute; hiện đại nhất của Apple, tăng khả năng xử l&yacute; h&agrave;ng loạt c&aacute;c dữ liệu đầu v&agrave;o một c&aacute;ch nhanh ch&oacute;ng v&agrave; li&ecirc;n tục, hạn chế độ trễ trong qu&aacute; tr&igrave;nh giải quyết c&aacute;c th&ocirc;ng tin. Kh&ocirc;ng chỉ vậy, Ram 18GB v&agrave; ổ cứng 512GB SSD được nh&agrave; sản xuất sử dụng trong chiếc m&aacute;y t&iacute;nh n&agrave;y l&agrave; minh chứng cho khả năng lưu trữ vừa đủ, người d&ugrave;ng c&oacute; thể thoải m&aacute;i sao lưu c&aacute;c văn bản, h&igrave;nh ảnh, &acirc;m thanh &hellip; hoặc giải tr&iacute; với d&ograve;ng game c&oacute; đồ họa hiện đại vừa phải. 18-core GPU l&agrave; loại card m&agrave;n h&igrave;nh cực k&igrave; hiện đại được sử dụng, sẵn s&agrave;ng mang lại cho người sử dụng những h&igrave;nh ảnh sống động, mượt m&agrave;, tuyệt vời nhất.&nbsp;</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/16-12-2023/47262_macbook_pro_14_m3_max__14c_cpu___30c_gpu___36gb___1tb____en__space_black__mrx53saa__4_.jpg" style="width:700px" /></p>

<p>Với khả năng kết nối USB gồm Charging, DisplayPort, Thunderbolt 4 (up to 40Gb/s), USB 4 (up to 40Gb/s) gi&uacute;p người dũng dễ d&agrave;ng kết nối với c&aacute;c bộ chuyển đổi hay linh kiện b&ecirc;n ngo&agrave;i với m&aacute;y t&iacute;nh, tăng khả năng đa nhiệm của macbook.&nbsp;</p>
', N'DataImageSql/MacBook Pro 16 M3 PRO(1).jpg', N'0', N'Còn hàng', 3, 19)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (30, N'Ghế game Corsair T3 ', CAST(N'2024-11-29' AS Date), 7990000, 7590500, 10, N'Ghế game Corsair T3 RUSH Brown Tan 2023', N'<h2>TI&Ecirc;N PHONG TRONG VIỆC SỬ DỤNG VẬT LIỆU MỚI</h2>

<p>Khi m&agrave; hầu hết c&aacute;c loại&nbsp;<strong><a href="https://www.anphatpc.com.vn/ghe-choi-game_dm1434.html">ghế gaming</a></strong>&nbsp;cao cấp tr&ecirc;n thị trường sử dụng vật liệu bọc ngo&agrave;i l&agrave; da PU, th&igrave;&nbsp;<strong><a href="https://www.anphatpc.com.vn/ghe-corsair_dm1518.html">ghế&nbsp;</a><strong><a href="https://www.anphatpc.com.vn/ghe-corsair_dm1518.html">Corsair</a></strong>&nbsp;T3 Rush</strong>&nbsp;sử dụng&nbsp;<strong>vật liệu vải cao cấp</strong>. Điều n&agrave;y c&oacute; được l&agrave; do sau nhiều năm nghi&ecirc;n cứu feedback của game thủ,&nbsp;<strong>Corsair T3 Rush</strong>&nbsp;được chế tạo để phục vụ cho c&aacute;c kh&aacute;ch h&agrave;ng c&oacute; nhu cầu t&igrave;m một chiếc ghế gaming c&oacute; độ th&ocirc;ng tho&aacute;ng tốt nhất. Loại vải bọc tr&ecirc;n&nbsp;<strong>Corsair T3 Rush</strong>&nbsp;l&agrave;&nbsp;<strong>vải Polyester</strong>&nbsp;c&oacute; chất lượng cực tốt,&nbsp;<strong>mềm, cực kỳ th&ocirc;ng tho&aacute;ng, kh&aacute;ng khuẩn tốt v&agrave; si&ecirc;u bền, kh&oacute; bị thủng - r&aacute;ch hơn nhiều lần so với da PU.&nbsp;</strong><br />
<br />
<img alt="Corsair T3 Rush" src="https://anphat.com.vn/media/lib/34491_corsair-t3-rush1.jpg" style="height:800px; width:533px" /></p>

<h2><br />
THIẾT KẾ LƯNG EGONOMIC (C&Ocirc;NG TH&Aacute;I HỌC)</h2>

<p>Đ&acirc;y cũng l&agrave; một thiết kế &quot;th&ocirc;ng minh&quot; của&nbsp;<strong>Corsair T3 Rush</strong>, được thừa hưởng từ phi&ecirc;n bản T1. Về k&iacute;ch thước ghế, ch&uacute;ng t&ocirc;i nhận thấy&nbsp;<strong>Corsair T3 Rush</strong>&nbsp;c&oacute;&nbsp;<strong>k&iacute;ch thước trung b&igrave;nh, ph&ugrave; hợp với người dưới 80Kg</strong>&nbsp;v&agrave; c&oacute; phần lưng ghế uống cong rất đẹp về thẩm mỹ v&agrave;&nbsp;<strong>hiệu quả cao về độ &quot;FIT&quot;</strong>. Trong qu&aacute; tr&igrave;nh trải nghiệm, ch&uacute;ng t&ocirc;i thấy rằng phần lưng ghế của&nbsp;<strong>Corsair T3 Rush</strong>&nbsp;thực sự rất &quot;&ocirc;m&quot; v&agrave; cho cảm gi&aacute;c rất dễ chịu thoải m&aacute;i.<br />
<br />
<img alt="Corsair T3 Rush" src="https://anphat.com.vn/media/lib/34491_corsair-t3-rush2.jpg" style="height:800px; width:533px" /></p>

<h2><br />
KHUNG FULL 100% KIM LOẠI SI&Ecirc;U BỀN</h2>

<p>Qua h&igrave;nh ảnh bộ khung gầm dưới đ&acirc;y, ch&uacute;ng ta c&oacute; thể chắc chắn rằng&nbsp;<strong>Corair T3 Rush</strong>&nbsp;sử dụng 100% kim loại cho bộ khung ghế, với đẳng cấp chất lượng v&agrave; thương hiệu đ&atilde; được khẳng định, ch&uacute;ng ta&nbsp;<strong>ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m về độ bền c&ugrave;ng sự ổn định l&acirc;u d&agrave;i của sản phẩm.</strong><br />
<br />
<img alt="Corsair T3 Rush" src="https://anphat.com.vn/media/lib/34491_corsair-t3-rush6.jpg" style="height:533px; width:800px" /></p>

<h2><br />
GỐI MEMORY FOAM TH&Ocirc;NG MINH</h2>

<p>Ch&uacute;ng t&ocirc;i đang nhắc tới phần gối lưng của&nbsp;<strong>Corsair T3 Rush</strong>, n&oacute; thực sự chất lượng với vật liệu&nbsp;<strong>cao su non bọc nhung</strong>, Rất mềm rất &ecirc;m v&agrave; thiết kế của n&oacute;<strong>&nbsp;vừa vặn để cố định v&agrave;o lưng ghế m&agrave; kh&ocirc;ng cần tới d&acirc;y đai</strong>&nbsp;như c&aacute;c loại ghế gaming kh&aacute;c. Về phần gối đầu, tuy kh&ocirc;ng l&agrave;m bằng cao su non nhưng cũng kh&aacute; &ecirc;m v&agrave; k&iacute;ch thước vừa đủ.<br />
<br />
<img alt="Corsair T3 Rush" src="https://anphat.com.vn/media/lib/34491_corsair-t3-rush7.jpg" style="height:533px; width:800px" /></p>
', N'DataImageSql/Ghế game Corsair T3 RUSH Brown Tan(1).jpg', N'5', N'Còn hàng', 6, 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (31, N'Ghế game Corsair T3 RUSH Gray White', CAST(N'2024-11-28' AS Date), 7990000, 7191000, 10, N'Ghế game Corsair T3 RUSH Gray White', N'<h2>TI&Ecirc;N PHONG TRONG VIỆC SỬ DỤNG VẬT LIỆU MỚI</h2>

<p>Khi m&agrave; hầu hết c&aacute;c loại&nbsp;<strong><a href="https://www.anphatpc.com.vn/ghe-choi-game_dm1434.html">ghế gaming</a></strong>&nbsp;cao cấp tr&ecirc;n thị trường sử dụng vật liệu bọc ngo&agrave;i l&agrave; da PU, th&igrave;&nbsp;<strong><a href="https://www.anphatpc.com.vn/ghe-corsair_dm1518.html">ghế&nbsp;</a><strong><a href="https://www.anphatpc.com.vn/ghe-corsair_dm1518.html">Corsair</a></strong>&nbsp;T3 Rush</strong>&nbsp;sử dụng&nbsp;<strong>vật liệu vải cao cấp</strong>. Điều n&agrave;y c&oacute; được l&agrave; do sau nhiều năm nghi&ecirc;n cứu feedback của game thủ,&nbsp;<strong>Corsair T3 Rush</strong>&nbsp;được chế tạo để phục vụ cho c&aacute;c kh&aacute;ch h&agrave;ng c&oacute; nhu cầu t&igrave;m một chiếc ghế gaming c&oacute; độ th&ocirc;ng tho&aacute;ng tốt nhất. Loại vải bọc tr&ecirc;n&nbsp;<strong>Corsair T3 Rush</strong>&nbsp;l&agrave;&nbsp;<strong>vải Polyester</strong>&nbsp;c&oacute; chất lượng cực tốt,&nbsp;<strong>mềm, cực kỳ th&ocirc;ng tho&aacute;ng, kh&aacute;ng khuẩn tốt v&agrave; si&ecirc;u bền, kh&oacute; bị thủng - r&aacute;ch hơn nhiều lần so với da PU.&nbsp;</strong><br />
<br />
<img alt="Corsair T3 Rush" src="https://anphat.com.vn/media/lib/34491_corsair-t3-rush1.jpg" style="height:800px; width:533px" /></p>

<h2><br />
THIẾT KẾ LƯNG EGONOMIC (C&Ocirc;NG TH&Aacute;I HỌC)</h2>

<p>Đ&acirc;y cũng l&agrave; một thiết kế &quot;th&ocirc;ng minh&quot; của&nbsp;<strong>Corsair T3 Rush</strong>, được thừa hưởng từ phi&ecirc;n bản T1. Về k&iacute;ch thước ghế, ch&uacute;ng t&ocirc;i nhận thấy&nbsp;<strong>Corsair T3 Rush</strong>&nbsp;c&oacute;&nbsp;<strong>k&iacute;ch thước trung b&igrave;nh, ph&ugrave; hợp với người dưới 80Kg</strong>&nbsp;v&agrave; c&oacute; phần lưng ghế uống cong rất đẹp về thẩm mỹ v&agrave;&nbsp;<strong>hiệu quả cao về độ &quot;FIT&quot;</strong>. Trong qu&aacute; tr&igrave;nh trải nghiệm, ch&uacute;ng t&ocirc;i thấy rằng phần lưng ghế của&nbsp;<strong>Corsair T3 Rush</strong>&nbsp;thực sự rất &quot;&ocirc;m&quot; v&agrave; cho cảm gi&aacute;c rất dễ chịu thoải m&aacute;i.<br />
<br />
<img alt="Corsair T3 Rush" src="https://anphat.com.vn/media/lib/34491_corsair-t3-rush2.jpg" style="height:800px; width:533px" /></p>

<h2><br />
KHUNG FULL 100% KIM LOẠI SI&Ecirc;U BỀN</h2>

<p>Qua h&igrave;nh ảnh bộ khung gầm dưới đ&acirc;y, ch&uacute;ng ta c&oacute; thể chắc chắn rằng&nbsp;<strong>Corair T3 Rush</strong>&nbsp;sử dụng 100% kim loại cho bộ khung ghế, với đẳng cấp chất lượng v&agrave; thương hiệu đ&atilde; được khẳng định, ch&uacute;ng ta&nbsp;<strong>ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m về độ bền c&ugrave;ng sự ổn định l&acirc;u d&agrave;i của sản phẩm.</strong><br />
<br />
<img alt="Corsair T3 Rush" src="https://anphat.com.vn/media/lib/34491_corsair-t3-rush6.jpg" style="height:533px; width:800px" /></p>

<h2><br />
GỐI MEMORY FOAM TH&Ocirc;NG MINH</h2>

<p>Ch&uacute;ng t&ocirc;i đang nhắc tới phần gối lưng của&nbsp;<strong>Corsair T3 Rush</strong>, n&oacute; thực sự chất lượng với vật liệu&nbsp;<strong>cao su non bọc nhung</strong>, Rất mềm rất &ecirc;m v&agrave; thiết kế của n&oacute;<strong>&nbsp;vừa vặn để cố định v&agrave;o lưng ghế m&agrave; kh&ocirc;ng cần tới d&acirc;y đai</strong>&nbsp;như c&aacute;c loại ghế gaming kh&aacute;c. Về phần gối đầu, tuy kh&ocirc;ng l&agrave;m bằng cao su non nhưng cũng kh&aacute; &ecirc;m v&agrave; k&iacute;ch thước vừa đủ.</p>
', N'DataImageSql/Ghế game Corsair T3 RUSH Gray White(1).jpg', N'10', N'Còn hàng', 6, 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (32, N'Ghế game Corsair TC100 RELAXED Fabric Black', CAST(N'2024-11-28' AS Date), 5490000, 5215500, 10, N'Ghế game Corsair TC100 RELAXED Fabric Black', N'<h1>Ghế game Corsair TC100 RELAXED Fabric Black</h1>
', N'DataImageSql/Ghế game Corsair TC100 RELAXED Fabric Black(1).jpg', N'5', N'Còn hàng', 6, 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (33, N'Ghế game Corsair TC200 Fabric Light Grey White', CAST(N'2024-11-28' AS Date), 8990000, 8540500, 10, N'Ghế game Corsair TC200 Fabric Light Grey White', N'<h1>Ghế game Corsair TC200 Fabric Light Grey White</h1>
', N'DataImageSql/Ghế game Corsair TC200 Fabric Light Grey White(1).jpg', N'5', N'Còn hàng', 6, 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (34, N'Ghế game Corsair TC500 LUXE Frost', CAST(N'2024-11-28' AS Date), 11890000, 11890000, 10, N'Ghế game Corsair TC500 LUXE Frost', N'<p>Ghế game Corsair TC500 LUXE Frost</p>
', N'DataImageSql/Ghế game Corsair TC500 LUXE Frost(1).jpg', N'0', N'Còn hàng', 6, 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (35, N'Ghế game E-Dra Hercules EGC203 V2 Black ', CAST(N'2024-11-28' AS Date), 4199000, 3989050, 10, N'Ghế game E-Dra Hercules EGC203 V2 Black (chân thép)', N'<h1>Ghế game E-Dra Hercules EGC203 V2 Black (ch&acirc;n th&eacute;p)</h1>
', N'DataImageSql/Ghế game E-Dra Hercules EGC203 V2 Black(1).jpg', N'5', N'Còn hàng', 6, 8)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (36, N'Ghế game E-Dra Hunter EGC206 White(', CAST(N'2024-11-28' AS Date), 5990000, 5391000, 5, N'Ghế game E-Dra Hunter EGC206 White(', N'<p>Ghế game E-Dra Hunter EGC206 White(</p>
', N'DataImageSql/Ghế game E-Dra Hunter EGC206 White(1).jpg', N'10', N'Còn hàng', 6, 8)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (37, N'Ghế game E-Dra LUX Champion EGC2022', CAST(N'2024-11-28' AS Date), 6900000, 6555000, 10, N'Ghế game E-Dra LUX Champion EGC2022', N'<h1>Ghế game E-Dra LUX Champion EGC2022</h1>
', N'DataImageSql/Ghế game E-Dra LUX Champion EGC2022 Real Leather(1).jpg', N'5', N'Còn hàng', 6, 8)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (38, N'Ghế game E-Dra Wisdom EGC231 Fabric', CAST(N'2024-11-28' AS Date), 3989000, 3989000, 10, N'Ghế game E-Dra Wisdom EGC231 Fabric', N'<h1>Ghế game E-Dra Wisdom EGC231 Fabric</h1>
', N'DataImageSql/Ghế game E-Dra Wisdom EGC231 Fabric(1).jpg', N'0', N'Còn hàng', 6, 8)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (39, N'Ghế game E-Dra Yummy EGC232 V2 Black Red', CAST(N'2024-11-28' AS Date), 1790000, 1700500, 10, N'Ghế game E-Dra Yummy EGC232 V2 Black Red', N'<h1>Ghế game E-Dra Yummy EGC232 V2 Black Red</h1>
', N'DataImageSql/Ghế game E-Dra Yummy EGC232 V2 Black Red(1).jpg', N'5', N'Còn hàng', 6, 8)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (40, N'Ghế WARRIOR lmmortal Series WGC225', CAST(N'2024-11-28' AS Date), 3890000, 3695500, 10, N'Ghế WARRIOR lmmortal Series WGC225', N'<p>Ghế WARRIOR lmmortal Series WGC225</p>
', N'DataImageSql/Ghế WARRIOR lmmortal Series WGC225(1).jpg', N'5', N'Còn hàng', 6, 18)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (41, N'Ghế WARRIOR Raider Series WGC203 Black', CAST(N'2024-11-28' AS Date), 2590000, 2460500, 10, N'Ghế WARRIOR Raider Series WGC203 Black', N'<h1>Ghế WARRIOR Raider Series WGC203 Black</h1>
', N'DataImageSql/Ghế WARRIOR Raider Series WGC203 Black(1).jpg', N'5', N'Còn hàng', 6, 18)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (42, N'Ghế WARRIOR Raider Series WGC206 White Pink', CAST(N'2024-11-28' AS Date), 3490000, 3315500, 10, N'Ghế WARRIOR Raider Series WGC206 White Pink', N'<h1>Ghế WARRIOR Raider Series WGC206 White Pink</h1>
', N'DataImageSql/Ghế WARRIOR Raider Series WGC206 White Pink(1).jpg', N'5', N'Còn hàng', 6, 18)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (43, N'Tai nghe Corsair HS35 V2 Carbon', CAST(N'2024-11-28' AS Date), 1299000, 1169100, 10, N'Tai nghe Corsair HS35 V2 Carbon', N'<p>Tai nghe Corsair HS35 V2 Carbon</p>
', N'DataImageSql/Tai nghe Corsair HS35 V2 Carbon(1).jpg', N'10', N'Còn hàng', 7, 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (44, N'Tai nghe Corsair HS55 Stereo White', CAST(N'2024-11-28' AS Date), 1299000, 1169100, 10, N'Tai nghe Corsair HS55 Stereo White', N'<h1>Tai nghe Corsair HS55 Stereo White</h1>
', N'DataImageSql/Tai nghe Corsair HS55 Stereo White(1).jpg', N'10', N'Còn hàng', 7, 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (45, N'Tai nghe Corsair HS70 Pro Wireless Carbon', CAST(N'2024-11-28' AS Date), 2790000, 2511000, 10, N'Tai nghe Corsair HS70 Pro Wireless Carbon', N'<p>Tai nghe Corsair HS70 Pro Wireless Carbon</p>
', N'DataImageSql/Tai nghe Corsair HS70 Pro Wireless Carbon(1).png', N'10', N'Còn hàng', 7, 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (46, N'Tai nghe Corsair HS80 MAX Wireless White', CAST(N'2024-11-28' AS Date), 3999000, 3599100, 10, N'Tai nghe Corsair HS80 MAX Wireless White', N'<p>Tai nghe Corsair HS80 MAX Wireless White</p>
', N'DataImageSql/Tai nghe Corsair HS80 MAX Wireless White(1).jpg', N'10', N'Còn hàng', 7, 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (47, N'Tai nghe Corsair Virtuoso Wireless Pearl', CAST(N'2024-11-28' AS Date), 5490000, 5490000, 10, N'Tai nghe Corsair Virtuoso Wireless Pearl', N'<p>Tai nghe Corsair Virtuoso Wireless Pearl</p>
', N'DataImageSql/Tai nghe Corsair Virtuoso Wireless Pearl(1).png', N'0', N'Còn hàng', 7, 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (48, N'Tai nghe HyperX Cloud III Wireless Black Red', CAST(N'2024-11-29' AS Date), 4590000, 4131000, 10, N'Tai nghe HyperX Cloud III Wireless Black Red', N'<p>Tai nghe HyperX Cloud III Wireless Black Red</p>
', N'DataImageSql/Tai nghe HyperX Cloud III Wireless Black Red(1).jpg', N'10', N'Còn hàng', 7, 10)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (49, N'Tai nghe HyperX Cloud Stinger 2', CAST(N'2024-11-28' AS Date), 1490000, 1341000, 10, N'Tai nghe HyperX Cloud Stinger 2', N'<p>Tai nghe HyperX Cloud Stinger 2</p>
', N'DataImageSql/Tai nghe HyperX Cloud Stinger 2(1).jpg', N'10', N'Còn hàng', 7, 10)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (50, N'Tai nghe Razer Barracuda X Wireless 2022', CAST(N'2024-11-29' AS Date), 2590000, 2460500, 10, N'Tai nghe Razer Barracuda X Wireless 2022', N'<h1>Tai nghe Razer Barracuda X Wireless 2022</h1>
', N'DataImageSql/razer_baracdaX_(1).jpg', N'5', N'Còn hàng', 7, 15)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (51, N'Loa máy tính Razer Leviathan V2', CAST(N'2024-11-28' AS Date), 6999000, 6299100, 10, N'Loa máy tính Razer Leviathan V2', N'<h1>Loa m&aacute;y t&iacute;nh Razer Leviathan V2</h1>
', N'DataImageSql/razer_leaviathanV2_(1).jpg', N'10', N'Còn hàng', 7, 15)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (52, N'Tai nghe Razer BlackShark V2 X White', CAST(N'2024-11-29' AS Date), 1790000, 1700500, 10, N'Tai nghe Razer BlackShark V2 X White', N'<h1>Tai nghe Razer BlackShark V2 X White</h1>
', N'DataImageSql/razer_backshark(1).jpg', N'5', N'Còn hàng', 7, 15)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (53, N'iPhone 15 Pro Max 256GB', CAST(N'2024-11-28' AS Date), 3799000, 3419100, 10, N'iPhone 15 Pro Max 256GB', N'<p><img alt="thiết kế iPhone 15 Pro Max" src="https://shopdunk.com/images/uploaded/Webp/1.jpeg" style="height:auto; width:67%" /><img alt="thiết kế iPhone 15 Pro Max" src="https://shopdunk.com/images/uploaded/Webp/2.jpeg" style="height:auto; width:67%" /><img alt="iPhone 15 Pro Max" src="https://shopdunk.com/images/uploaded/Webp/3.jpeg" style="height:auto; width:67%" /><img alt="iPhone 15 Pro Max" src="https://shopdunk.com/images/uploaded/Webp/4.jpeg" style="height:auto; width:67%" /></p>
', N'DataImageSql/iphone15PX_(1).png', N'10', N'Còn hàng', 2, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (54, N'iPhone 16 Plus 128GB', CAST(N'2024-11-29' AS Date), 25990000, 24690500, 15, N'iPhone 16 Plus 128GB', N'<p><img alt="" src="https://shopdunk.com/images/uploaded/banner/banner%202024/Thang_9/thang9_2/Html%20iphone%2016%20sr/iphone16.4.jpg" style="width:100%" /></p>
', N'DataImageSql/iphone16Plus_(1).jpeg', N'5', N'Còn hàng', 2, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (55, N'iPhone 16 Pro 256GB', CAST(N'2024-11-28' AS Date), 31900000, 30305000, 15, N'iPhone 16 Pro 256GB', N'<p><img alt="" src="https://shopdunk.com/images/uploaded/banner/banner%202024/Thang_9/thang9_2/Html%20iphone%2016%20sr/16prm1.jpg" style="width:100%" /></p>
', N'DataImageSql/iphone16Pro_(1).jpeg', N'5', N'Còn hàng', 7, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (56, N'Điện thoại Nokia 105 4G Pro', CAST(N'2024-11-29' AS Date), 680000, 680000, 10, N'Điện thoại Nokia 105 4G Pro', N'<p>Điện thoại Nokia 105 4G Pro</p>
', N'DataImageSql/nokia_105(1).jpg', N'0', N'Còn hàng', 2, 14)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (57, N'Điện thoại Nokia 220 4G', CAST(N'2024-11-29' AS Date), 990000, 990000, 10, N'Điện thoại Nokia 220 4G', N'<p>Điện thoại Nokia 220 4G</p>
', N'DataImageSql/nokia_220(1).jpg', N'0', N'Còn hàng', 2, 14)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (58, N'Điện thoại Samsung Galaxy Z Fold6 5G 12GB/256GB', CAST(N'2024-11-28' AS Date), 43990000, 42230400, 10, N'Điện thoại Samsung Galaxy Z Fold6 5G 12GB/256GB', N'<p><img alt="Samsung Galaxy Z Fold6 5G 12GB/256GB" src="https://cdn.tgdd.vn/Products/Images/42/320721/Kit/samsung-galaxy-z-fold6-note.jpg" /></p>

<h3><a href="javascript:;">Cấu h&igrave;nh &amp; Bộ nhớ</a></h3>

<ul>
	<li>
	<p><a href="https://www.thegioididong.com/hoi-dap/he-dieu-hanh-la-gi-804907#hmenuid1" target="_blank">Hệ điều h&agrave;nh:</a></p>

	<p>Android 14</p>
	</li>
	<li>
	<p><strong>Chip xử l&yacute; (CPU):</strong></p>

	<p>Snapdragon 8 Gen 3 for Galaxy</p>
	</li>
	<li>
	<p><a href="https://www.thegioididong.com/hoi-dap/toc-do-cpu-la-gi-co-y-nghia-gi-trong-cac-thiet-bi-dien-tu-1299483" target="_blank">Tốc độ CPU:</a></p>

	<p>3.39 GHz</p>
	</li>
	<li>
	<p><strong>Chip đồ họa (GPU):</strong></p>

	<p>Adreno 750</p>
	</li>
	<li>
	<p><a href="https://www.thegioididong.com/hoi-dap/ram-la-gi-co-y-nghia-gi-trong-cac-thiet-bi-dien-t-1216259" target="_blank">RAM:</a></p>

	<p>12 GB</p>
	</li>
	<li>
	<p><strong>Dung lượng lưu trữ:</strong></p>

	<p>256 GB</p>
	</li>
	<li>
	<p><strong>Dung lượng c&ograve;n lại (khả dụng) khoảng:</strong></p>

	<p>216.1 GB</p>
	</li>
	<li>
	<p><strong>Danh bạ:</strong></p>

	<p>Kh&ocirc;ng giới hạn</p>
	</li>
</ul>
', N'DataImageSql/galaxy_ZFold6_(1).jpg', N'4', N'Còn hàng', 2, 17)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (59, N'Điện thoại Samsung Galaxy Z Flip6 5G 12GB/256GB', CAST(N'2024-11-29' AS Date), 26990000, 21052200, 10, N'Điện thoại Samsung Galaxy Z Flip6 5G 12GB/256GB', N'<p><img alt="Samsung Galaxy Z Flip6 5G 12GB/256GB" src="https://cdn.tgdd.vn/Products/Images/42/320722/Kit/samsung-galaxy-z-flip6-note-2.jpg" /></p>

<h3><a href="javascript:;">Cấu h&igrave;nh &amp; Bộ nhớ</a></h3>

<ul>
	<li>
	<p><a href="https://www.thegioididong.com/hoi-dap/he-dieu-hanh-la-gi-804907#hmenuid1" target="_blank">Hệ điều h&agrave;nh:</a></p>

	<p>Android 14</p>
	</li>
	<li>
	<p><strong>Chip xử l&yacute; (CPU):</strong></p>

	<p>Snapdragon 8 Gen 3 for Galaxy</p>
	</li>
	<li>
	<p><a href="https://www.thegioididong.com/hoi-dap/toc-do-cpu-la-gi-co-y-nghia-gi-trong-cac-thiet-bi-dien-tu-1299483" target="_blank">Tốc độ CPU:</a></p>

	<p>3.39 GHz</p>
	</li>
	<li>
	<p><strong>Chip đồ họa (GPU):</strong></p>

	<p>Adreno 750</p>
	</li>
	<li>
	<p><a href="https://www.thegioididong.com/hoi-dap/ram-la-gi-co-y-nghia-gi-trong-cac-thiet-bi-dien-t-1216259" target="_blank">RAM:</a></p>

	<p>12 GB</p>
	</li>
	<li>
	<p><strong>Dung lượng lưu trữ:</strong></p>

	<p>256 GB</p>
	</li>
	<li>
	<p><strong>Dung lượng c&ograve;n lại (khả dụng) khoảng:</strong></p>

	<p>216.6 GB</p>
	</li>
	<li>
	<p><strong>Danh bạ:</strong></p>

	<p>Kh&ocirc;ng giới hạn</p>
	</li>
</ul>
', N'DataImageSql/galaxy_ZFlip6_(1).jpg', N'22', N'Còn hàng', 2, 17)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (60, N'CASE AIGO C218M WHITE', CAST(N'2024-11-28' AS Date), 1000000, 950000, 5, N'CASE AIGO C218M WHITE', N'<p>CASE AIGO C218M WHITE</p>
', N'DataImageSql/CASE AIGO C218M WHITE(1).jpg', N'5', N'Còn hàng', 8, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (61, N'CASE ASUS TUF GAMING GT302 ARGB BLACK', CAST(N'2024-11-28' AS Date), 1500000, 1500000, 10, N'CASE ASUS TUF GAMING GT302 ARGB BLACK(1)', N'<p>CASE ASUS TUF GAMING GT302 ARGB BLACK(1)</p>
', N'DataImageSql/CASE ASUS TUF GAMING GT302 ARGB BLACK(1).jpg', N'0', N'Còn hàng', 8, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (62, N'CASE JONSBO D41 STD', CAST(N'2024-11-28' AS Date), 800000, 800000, 10, N'CASE JONSBO D41 STD', N'<p>CASE JONSBO D41 STD</p>
', N'DataImageSql/CASE JONSBO D41 STD(1).jpg', N'0', N'Còn hàng', 8, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (63, N'CASE NZXT H7 FLOW RGB', CAST(N'2024-11-28' AS Date), 1000000, 950000, 10, N'CASE NZXT H7 FLOW RGB', N'<p>CASE NZXT H7 FLOW RGB</p>
', N'DataImageSql/CASE NZXT H7 FLOW RGB(1).jpg', N'5', N'Còn hàng', 8, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (64, N'CPU Intel Core i3 12100', CAST(N'2024-11-29' AS Date), 5000000, 5000000, 10, N'CPU Intel Core i3 12100', N'<p>CPU Intel Core i3 12100</p>
', N'DataImageSql/CPU Intel Core i3 12100(1).jpg', N'0', N'Còn hàng', 12, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (65, N'CPU Intel Core i7 14700F', CAST(N'2024-11-28' AS Date), 8900000, 8455000, 10, N'CPU Intel Core i7 14700F', N'<p>CPU Intel Core i7 14700F</p>
', N'DataImageSql/CPU Intel Core i7 14700F(1).jpg', N'5', N'Còn hàng', 12, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (66, N'CPU Intel Core i9 14900K', CAST(N'2024-11-28' AS Date), 15000000, 14250000, 10, N'CPU Intel Core i9 14900K', N'<p>CPU Intel Core i9 14900K</p>
', N'DataImageSql/CPU Intel Core i9 14900K(1).jpg', N'5', N'Còn hàng', 12, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (67, N'CPU Intel Core Ultra 5 245K', CAST(N'2024-11-29' AS Date), 5000000, 5000000, 10, N'CPU Intel Core Ultra 5 245K(1)', N'<p>CPU Intel Core Ultra 5 245K(1)</p>
', N'DataImageSql/CPU Intel Core Ultra 5 245K(1).jpg', N'0', N'Còn hàng', 12, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (68, N'Mainboard Asus B760M-AYW', CAST(N'2024-11-28' AS Date), 8900000, 8455000, 10, N'Mainboard Asus B760M-AYW', N'<p>Mainboard Asus B760M-AYW</p>
', N'DataImageSql/Mainboard Asus B760M-AYW(1).jpg', N'5', N'Còn hàng', 10, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (69, N'Mainboard Asus TUF GAMING B760M-PLUS', CAST(N'2024-11-29' AS Date), 7800000, 7410000, 10, N'Mainboard Asus TUF GAMING B760M-PLUS', N'<p>Mainboard Asus TUF GAMING B760M-PLUS</p>
', N'DataImageSql/Mainboard Asus TUF GAMING B760M-PLUS(1).jpg', N'5', N'Còn hàng', 10, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (70, N'Nguồn máy tính AIGO VK450 - 450W(', CAST(N'2024-11-28' AS Date), 8000000, 8000000, 10, N'Nguồn máy tính AIGO VK450 - 450W(', N'<p>Nguồn m&aacute;y t&iacute;nh AIGO VK450 - 450W(</p>
', N'DataImageSql/Nguồn máy tính AIGO VK450 - 450W(1).jpg', N'0', N'Còn hàng', 11, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (71, N'Nguồn Máy Tính Asus ROG STRIX 1000W', CAST(N'2024-11-29' AS Date), 8000000, 7600000, 10, N'Nguồn Máy Tính Asus ROG STRIX 1000W', N'<p>Nguồn M&aacute;y T&iacute;nh Asus ROG STRIX 1000W</p>
', N'DataImageSql/Nguồn Máy Tính Asus ROG STRIX 1000W(1).jpg', N'5', N'Còn hàng', 11, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (72, N'Ổ cứng HPE SSD 240GB', CAST(N'2024-11-28' AS Date), 800000, 760000, 10, N'Ổ cứng HPE SSD 240GB', N'<p>Ổ cứng HPE SSD 240GB</p>
', N'DataImageSql/Ổ cứng HPE SSD 240GB(1).png', N'5', N'Còn hàng', 14, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (73, N'RAM CORSAIR VENGEANCE® RGB 32GB', CAST(N'2024-11-28' AS Date), 2000000, 1900000, 10, N'RAM CORSAIR VENGEANCE® RGB 32GB', N'<p>RAM CORSAIR VENGEANCE&reg; RGB 32GB</p>
', N'DataImageSql/RAM CORSAIR VENGEANCE® RGB 32GB(1).jpg', N'5', N'Còn hàng', 14, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (74, N'Ram TEAMGROUP T-Force DELTA RGB 8GB', CAST(N'2024-11-28' AS Date), 1800000, 1710000, 10, N'Ram TEAMGROUP T-Force DELTA RGB 8GB', N'<p>Ram TEAMGROUP T-Force DELTA RGB 8GB</p>
', N'DataImageSql/Ram TEAMGROUP T-Force DELTA RGB 8GB(1).jpg', N'5', N'Còn hàng', 14, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (75, N'Ram Kingston Fury Beast 32GB', CAST(N'2024-11-29' AS Date), 1000000, 1000000, 10, N'Ram Kingston Fury Beast 32GB', N'<p>Ram Kingston Fury Beast 32GB</p>
', N'DataImageSql/Ram Kingston Fury Beast 32GB(1).jpg', N'0', N'Còn hàng', 14, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (76, N'VGA Asus PRIME RTX 4070 SUPER 12GB GDDR6X', CAST(N'2024-11-28' AS Date), 1500000, 1500000, 10, N'VGA Asus PRIME RTX 4070 SUPER 12GB GDDR6X', N'<p>VGA Asus PRIME RTX 4070 SUPER 12GB GDDR6X</p>
', N'DataImageSql/VGA Asus PRIME RTX 4070 SUPER 12GB GDDR6X(1).jpg', N'0', N'Còn hàng', 15, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (77, N'VGA_Asus ROG Strix-RTX4090-OC 24GB', CAST(N'2024-11-28' AS Date), 1800000, 1710000, 10, N'VGA_Asus ROG Strix-RTX4090-OC 24GB', N'<p>VGA_Asus ROG Strix-RTX4090-OC 24GB</p>
', N'DataImageSql/VGA_Asus ROG Strix-RTX4090-OC 24GB(1).jpg', N'5', N'Còn hàng', 15, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (78, N'VGA ASUS Dual GeForce RTX 3060 V2 OC 12GB GDDR6', CAST(N'2024-11-28' AS Date), 8900000, 8900000, 10, N'VGA ASUS Dual GeForce RTX 3060 V2 OC 12GB GDDR6', N'<p>VGA ASUS Dual GeForce RTX 3060 V2 OC 12GB GDDR6</p>
', N'DataImageSql/VGA ASUS Dual GeForce RTX 3060 V2 OC 12GB GDDR6(1).png', N'0', N'Còn hàng', 15, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (79, N'Màn hình Acer Nitro ED270R S3 UM.HE0SV.301 27 inch FHD 180Hz cong', CAST(N'2024-11-28' AS Date), 4999000, 4599080, 10, N'Màn hình Acer Nitro ED270R S3 UM.HE0SV.301 27 inch FHD 180Hz cong', N'<h2><strong>M&agrave;n h&igrave;nh m&aacute;y t&iacute;nh Acer Nitro ED270R S UM.HE0AA.S02</strong></h2>

<p>Acer Nitro ED0 l&agrave; d&ograve;ng sản phẩm m&agrave;n h&igrave;nh cong Gaming mới nhất m&agrave; Acer ra mắt trong năm 2023. Nằm trong Series n&agrave;y,&nbsp;Acer Nitro ED270R S l&agrave; một trong những sản phẩm chủ đạo của Acer tr&ecirc;n thị trường m&agrave;n h&igrave;nh m&aacute;y t&iacute;nh. C&ugrave;ng An Ph&aacute;t Computer điểm qua xem chiếc m&agrave;n h&igrave;nh n&agrave;y c&oacute; g&igrave; tốt qua b&agrave;i viết dưới đ&acirc;y.</p>

<h2><strong>Si&ecirc;u nhanh - si&ecirc;u tốc độ</strong></h2>

<p>Acer Nitro ED270R S sở hữu tần số qu&eacute;t l&ecirc;n đến 180Hz kết hợp tốc độ phản hồi si&ecirc;u tốc 1ms (VRB) &ndash; 5ms (GtG) , tha hồ cho Gamers tận hưởng c&aacute;c tựa game (đặc biệt c&aacute;c tựa game Esport, FPS) m&agrave; m&igrave;nh y&ecirc;u th&iacute;ch một c&aacute;ch liền mạch, kh&ocirc;ng gi&aacute;n đoạn v&agrave; kh&ocirc;ng bỏ lỡ bất cứ một khoảnh khắc n&agrave;o.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/05-06-2023/1msvrm.jpg" style="width:700px" /></p>

<h2><strong>C&ocirc;ng nghệ ADAPTIVE SYNC</strong></h2>

<p>Tạm biệt t&igrave;nh trạng x&eacute; h&igrave;nh g&acirc;y kh&oacute; chịu với&nbsp;ADAPTIVE SYNC v&agrave; tốc độ l&agrave;m mới m&agrave;n h&igrave;nh 180Hz. Những khung h&igrave;nh tr&ecirc;n m&agrave;n sẽ được đồng nhất v&agrave; mang lại trải nghiệm chơi Game nhanh nhất. mượt m&agrave; nhất.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/05-06-2023/adaptivesyc.jpg" style="width:700px" /></p>

<h2><strong>Đối đa kh&ocirc;ng gian hiển thị</strong></h2>

<p>Thiết kế gần như kh&ocirc;ng viền, Acer Nitro ED270R&nbsp;đem đến kh&ocirc;ng gian hiển thị h&igrave;nh ảnh rộng lớn hơn. Đồng thời, c&ocirc;ng nghệ ZeroFrame cho ph&eacute;p người d&ugrave;ng gh&eacute;p nhiều m&agrave;n h&igrave;nh cạnh nhau để c&oacute; chế độ xem to&agrave;n cảnh liền mạch, kh&ocirc;ng gi&aacute;n đoạn.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/05-06-2023/acered01.jpg" style="width:700px" /></p>

<h2><strong>Bảo vệ thị lực</strong></h2>

<p>C&ocirc;ng nghệ Acer BlueLightShield&trade; v&agrave; Flickerless&trade; bảo vệ đ&ocirc;i mắt của bạn khỏi những căng thẳng trong thời gian l&agrave;m việc. Với ED270R&nbsp;, Gamers thoải m&aacute;i sử dụng m&agrave;n h&igrave;nh trong thời gian l&acirc;u hơn khi độ mỏi mắt đ&atilde; được giảm đ&aacute;ng kể nhờ c&ocirc;ng nghệ Acer ComfyView&trade; v&agrave; Low Dimming&trade;.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/05-06-2023/bvemat.jpg" style="width:700px" /></p>

<p>Nếu bạn quan t&acirc;m đến sản phẩm hoặc c&oacute; bất kỳ thắc mắc mua h&agrave;ng n&agrave;o, vui l&ograve;ng li&ecirc;n hệ&nbsp;<strong>Hotline 1900.0323 ph&iacute;m 6</strong>&nbsp;để đội ngũ&nbsp;<strong><a href="https://www.anphatpc.com.vn/" target="_blank">An Ph&aacute;t Computer</a></strong>&nbsp;c&oacute; thể tư vấn v&agrave; hỗ trợ bạn sớm nhất!</p>
', N'DataImageSql/Acer Nitro_ED270R-S3(1).jpg', N'8', N'Còn hàng', 9, 20)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (80, N'Màn hình Acer B278U UM.HB8SV.001 (27 inch - 2K - IPS - 75Hz - 4ms)', CAST(N'2024-11-28' AS Date), 11490000, 10341000, 10, N'Màn hình Acer B278U UM.HB8SV.001 (27 inch - 2K - IPS - 75Hz - 4ms)', N'<h1>M&agrave;n h&igrave;nh Acer B278U UM.HB8SV.001 (27 inch - 2K - IPS - 75Hz - 4ms)</h1>
', N'DataImageSql/Acer_B278U(1).jpg', N'10', N'Còn hàng', 9, 20)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (81, N'Màn hình ACER EK251Q E UM.KE1SV.E01 (24.5 inch - FHD - IPS - 100Hz - 1ms)', CAST(N'2024-11-28' AS Date), 2690000, 2690000, 10, N'Màn hình ACER EK251Q E UM.KE1SV.E01 (24.5 inch - FHD - IPS - 100Hz - 1ms)', N'<h2><strong>M&agrave;n h&igrave;nh ACER EK251Q E UM.KE1SV.E01</strong></h2>

<p><strong><a href="https://www.anphatpc.com.vn/man-hinh-acer-ek251q-e-um.ke1sv.e01.html" target="_blank">M&agrave;n h&igrave;nh ACER EK251Q E UM.KE1SV.E01</a></strong>&nbsp;l&agrave; một sản phẩm ấn tượng với thiết kế phẳng hiện đại, ph&ugrave; hợp cho mọi kh&ocirc;ng gian l&agrave;m việc v&agrave; giải tr&iacute;. Với k&iacute;ch thước 24.5 inch v&agrave; độ ph&acirc;n giải FHD (1920 x 1080), m&agrave;n h&igrave;nh n&agrave;y mang đến h&igrave;nh ảnh sắc n&eacute;t v&agrave; chi tiết, gi&uacute;p n&acirc;ng cao trải nghiệm người d&ugrave;ng. C&ocirc;ng nghệ tấm nền IPS cho ph&eacute;p g&oacute;c nh&igrave;n rộng l&ecirc;n đến 178 độ v&agrave; khả năng t&aacute;i tạo m&agrave;u sắc ch&iacute;nh x&aacute;c, đảm bảo chất lượng hiển thị tuyệt vời từ mọi g&oacute;c độ.</p>

<p><img alt="Màn hình ACER EK251Q E UM.KE1SV.E01" src="https://anphat.com.vn/media/lib/05-08-2024/man-hinh-acer-ek251q-e-umke1sve01.jpg" style="height:511px; width:800px" /></p>

<p>Tần số qu&eacute;t 100 Hz c&ugrave;ng với thời gian đ&aacute;p ứng nhanh 4ms (GtG) v&agrave; 1ms VRB gi&uacute;p giảm thiểu hiện tượng giật lag v&agrave; b&oacute;ng mờ, l&yacute; tưởng cho c&aacute;c game thủ v&agrave; người d&ugrave;ng l&agrave;m việc với video. Chỉ số m&agrave;u sắc của m&agrave;n h&igrave;nh đạt 16.7 triệu m&agrave;u, độ phủ m&agrave;u 72% NTSC v&agrave; 99% sRGB, mang lại khả năng hiển thị m&agrave;u sắc phong ph&uacute; v&agrave; ch&acirc;n thực, rất ph&ugrave; hợp cho c&aacute;c c&ocirc;ng việc y&ecirc;u cầu độ ch&iacute;nh x&aacute;c cao về m&agrave;u sắc như thiết kế đồ họa hay chỉnh sửa ảnh.</p>

<p><img alt="Màn hình ACER EK251Q E UM.KE1SV.E01" src="https://anphat.com.vn/media/lib/05-08-2024/man-hinh-acer-ek251q-e-umke1sve01-2.jpg" style="height:511px; width:800px" /></p>

<p><strong><a href="https://www.anphatpc.com.vn/man-hinh-acer_dm1433.html" target="_blank">M&agrave;n h&igrave;nh ACER</a></strong>&nbsp;EK251Q E c&ograve;n được trang bị nhiều c&ocirc;ng nghệ ti&ecirc;n tiến như FreeSync, gi&uacute;p giảm hiện tượng x&eacute; h&igrave;nh v&agrave; giật lag khi chơi game, v&agrave; c&aacute;c t&iacute;nh năng bảo vệ mắt người d&ugrave;ng như Acer BluelightShield v&agrave; Flicker-less, gi&uacute;p giảm thiểu &aacute;nh s&aacute;ng xanh c&oacute; hại v&agrave; hiện tượng nhấp nh&aacute;y, mang lại sự thoải m&aacute;i khi sử dụng trong thời gian d&agrave;i. C&ocirc;ng nghệ Comfy View gi&uacute;p giảm thiểu độ ch&oacute;i v&agrave; phản chiếu, cho ph&eacute;p sử dụng m&agrave;n h&igrave;nh trong c&aacute;c m&ocirc;i trường &aacute;nh s&aacute;ng mạnh m&agrave; kh&ocirc;ng g&acirc;y kh&oacute; chịu.</p>

<p><img alt="Màn hình ACER EK251Q E UM.KE1SV.E01" src="https://anphat.com.vn/media/lib/05-08-2024/man-hinh-acer-ek251q-e-umke1sve01-3.jpg" style="height:511px; width:800px" /></p>

<p>Về kết nối,&nbsp;<strong><a href="https://www.anphatpc.com.vn/man-hinh-may-tinh.html-1" target="_blank">m&agrave;n h&igrave;nh m&aacute;y t&iacute;nh</a></strong>&nbsp;được trang bị c&aacute;c cổng kết nối đa dạng như 1x VGA v&agrave; 1x HDMI (1.4), gi&uacute;p dễ d&agrave;ng kết nối với c&aacute;c thiết bị kh&aacute;c nhau như m&aacute;y t&iacute;nh, laptop v&agrave; c&aacute;c thiết bị giải tr&iacute; kh&aacute;c. M&agrave;n h&igrave;nh cũng hỗ trợ ti&ecirc;u chuẩn VESA (100 mm x 100 mm), cho ph&eacute;p lắp đặt linh hoạt tr&ecirc;n gi&aacute; đỡ tường hoặc c&aacute;c c&aacute;nh tay đỡ m&agrave;n h&igrave;nh chuẩn VESA, tạo sự linh hoạt trong kh&ocirc;ng gian l&agrave;m việc. Sản phẩm đi k&egrave;m với c&aacute;c phụ kiện cần thiết như d&acirc;y nguồn v&agrave; d&acirc;y HDMI, gi&uacute;p người d&ugrave;ng c&oacute; thể dễ d&agrave;ng sử dụng ngay khi mở hộp.</p>

<p><img alt="Màn hình ACER EK251Q E UM.KE1SV.E01" src="https://anphat.com.vn/media/lib/05-08-2024/man-hinh-acer-ek251q-e-umke1sve01-4.jpg" style="height:195px; width:800px" /></p>

<p>Với tất cả c&aacute;c t&iacute;nh năng v&agrave; c&ocirc;ng nghệ ti&ecirc;n tiến, m&agrave;n h&igrave;nh ACER EK251Q E UM.KE1SV.E01 l&agrave; một lựa chọn ho&agrave;n hảo cho những ai t&igrave;m kiếm một m&agrave;n h&igrave;nh chất lượng cao, đa năng v&agrave; đ&aacute;ng tin cậy.</p>
', N'DataImageSql/Acer_ẸK251Q-E(1).jpg', N'0', N'Còn hàng', 9, 20)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (82, N'Màn Hình Dell UltraSharp U2724DE', CAST(N'2024-11-28' AS Date), 13590000, 12231000, 10, N'Màn Hình Dell UltraSharp U2724DE', N'<p><em><a href="https://www.anphatpc.com.vn/man-hinh-may-tinh.html-1">M&agrave;n h&igrave;nh&nbsp;m&aacute;y t&iacute;nh</a>&nbsp;được chứng nhận 5 sao đầu ti&ecirc;n tr&ecirc;n thế giới về sự thoải m&aacute;i cho mắt*</em></p>

<p><em>*Dựa tr&ecirc;n chứng nhận T&Uuml;V Rheinland&reg; Eye Comfort, th&aacute;ng 8 năm 2023.</em></p>

<p>&nbsp;</p>

<p><strong>Sự Thoải M&aacute;i Về Thị Gi&aacute;c V&ocirc; Song</strong></p>

<p><strong><img alt="" src="https://anphat.com.vn/media/lib/05-01-2024/dell_ultrasharp_u2724de_2.jpg" /></strong></p>

<p><strong>Cảm biến &aacute;nh s&aacute;ng xung quanh</strong>: Cảm biến &aacute;nh s&aacute;ng xung quanh t&iacute;ch hợp sẽ tối ưu h&oacute;a độ s&aacute;ng v&agrave; nhiệt độ m&agrave;u một c&aacute;ch th&ocirc;ng minh dựa tr&ecirc;n m&ocirc;i trường xung quanh bạn.</p>

<p><strong>ComfortView Plus được cải tiến</strong>: Giảm lượng ph&aacute;t thải &aacute;nh s&aacute;ng xanh c&oacute; hại xuống &lt;35%, mang lại sự thoải m&aacute;i cả ng&agrave;y m&agrave; kh&ocirc;ng l&agrave;m giảm độ ch&iacute;nh x&aacute;c của m&agrave;u sắc.</p>

<p><strong>Trải nghiệm h&igrave;nh ảnh mượt m&agrave; hơn</strong>: Tốc độ l&agrave;m mới của&nbsp;<a href="https://www.anphatpc.com.vn/man-hinh-may-tinh-120hz_dm1712.html">m&agrave;n h&igrave;nh 120Hz</a>&nbsp;n&agrave;y mang lại &iacute;t nhấp nh&aacute;y hơn, cuộn liền mạch hơn v&agrave; chuyển động mượt m&agrave; hơn so với m&agrave;n h&igrave;nh 60Hz.</p>

<p>&nbsp;</p>

<p><strong>L&agrave;m Việc S&ocirc;i Nổi</strong></p>

<p><strong><img alt="" src="https://anphat.com.vn/media/lib/05-01-2024/dell_ultrasharp_u2724de_3.jpg" /></strong></p>

<p>Chất lượng h&igrave;nh ảnh vượt trội: M&agrave;n h&igrave;nh c&ocirc;ng nghệ bảng điều khiển IPS Black n&agrave;y c&oacute; m&agrave;u đen s&acirc;u hơn v&agrave; độ ch&iacute;nh x&aacute;c của mức m&agrave;u x&aacute;m cao hơn, mang lại độ tương phản vượt trội (2000:1) tr&ecirc;n g&oacute;c nh&igrave;n rộng.</p>

<p>M&agrave;u sắc sống động như thật: Tận hưởng 1,07 tỷ m&agrave;u v&agrave; độ phủ m&agrave;u rộng theo ti&ecirc;u chuẩn ng&agrave;nh, bao gồm 98% DCI-P3, 98% Display P3, 100% sRGB v&agrave; 100% BT.709. Nhận độ ch&iacute;nh x&aacute;c hiệu chỉnh m&agrave;u của Delta E &lt; 2 (trung b&igrave;nh) (sRGB, BT.709, Display P3, DCI-P3).</p>

<p>&nbsp;</p>

<p><strong>Kết Nối Với Năng Suất</strong></p>

<p><strong><img alt="" src="https://anphat.com.vn/media/lib/05-01-2024/dell_ultrasharp_u2724de_4.jpg" /></strong></p>

<p>&nbsp;</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/05-01-2024/dell_ultrasharp_u2724de_5.jpg" /></p>

<p><img alt="" src="https://anphat.com.vn/media/lib/05-01-2024/dell_ultrasharp_u2724de_6.jpg" /></p>

<p><img alt="" src="https://anphat.com.vn/media/lib/05-01-2024/dell_ultrasharp_u2724de_7.jpg" /></p>

<p>Tiện lợi bằng c&aacute;p đơn: Thunderbolt 4 truyền dữ liệu v&agrave; t&iacute;n hiệu video ở tốc độ l&ecirc;n tới 40Gbps v&agrave; cung cấp c&ocirc;ng suất l&ecirc;n tới 90W cho PC của bạn.</p>

<p>Kết nối ổn định: K&iacute;ch hoạt Ethernet nhanh với tốc độ l&ecirc;n tới 2,5GbE.</p>

<p>Đạt năng suất cao nhất: Kết nối với hai nguồn PC v&agrave; Auto KVM sẽ chuyển đổi liền mạch c&aacute;c điều khiển sang PC được kết nối thứ hai. Sử dụng c&aacute;c t&iacute;nh năng KVM (b&agrave;n ph&iacute;m, video v&agrave; chuột) để điều khiển cả hai PC bằng một b&agrave;n ph&iacute;m v&agrave; chuột.</p>

<p>Xem th&ecirc;m tr&ecirc;n một m&agrave;n h&igrave;nh: Xem nội dung từ hai nguồn PC với Picture-in-Picture (PiP) v&agrave; Picture-by-Picture (PbP).</p>

<p>Mở rộng kết nối của bạn: Kết nối nhiều hơn với DisplayPort 1.4, HDMI (HDCP 1.4) (hỗ trợ l&ecirc;n đến QHD 2560 x 1440 120Hz TMDS, VRR như được chỉ định trong HDMI 2.1), cổng USB-A v&agrave; USB-C cung cấp tốc độ l&ecirc;n tới 10Gbps .</p>

<p>Kết nối dễ d&agrave;ng: Chỉ cần cắm c&aacute;c phụ kiện v&agrave; thiết bị c&oacute; cổng USB-A truy cập nhanh v&agrave; cổng USB-C cung cấp c&ocirc;ng suất l&ecirc;n tới 15W.</p>
', N'DataImageSql/Dell UltraSharp_U2724D(1).jpg', N'10', N'Còn hàng', 9, 7)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (83, N'Màn Hình Dell UltraSharp U3425WE', CAST(N'2024-11-29' AS Date), 27999000, 25199100, 10, N'Màn Hình Dell UltraSharp U3425WE', N'<p><strong>Trải nghiệm h&igrave;nh ảnh mượt m&agrave; hơn</strong></p>

<p><strong><img alt="" src="https://anphat.com.vn/media/lib/11-06-2024/dell_ultrasharp_3425we_1.jpg" /></strong></p>

<p>Tốc độ l&agrave;m mới 120Hz mang lại &iacute;t nhấp nh&aacute;y hơn, cuộn liền mạch hơn v&agrave; chuyển động mượt m&agrave; hơn so với m&agrave;n h&igrave;nh 60Hz.</p>

<p>&nbsp;</p>

<p><strong>Cảm biến &aacute;nh s&aacute;ng xung quanh</strong></p>

<p><strong><img alt="" src="https://anphat.com.vn/media/lib/11-06-2024/dell_ultrasharp_3425we_2.jpg" /></strong></p>

<p>Cảm biến &aacute;nh s&aacute;ng xung quanh t&iacute;ch hợp sẽ tối ưu h&oacute;a độ s&aacute;ng v&agrave; nhiệt độ m&agrave;u một c&aacute;ch th&ocirc;ng minh dựa tr&ecirc;n m&ocirc;i trường xung quanh bạn.</p>

<p>&nbsp;</p>

<p><strong>ComfortView Plus được cải tiến</strong></p>

<p><strong><img alt="" src="https://anphat.com.vn/media/lib/11-06-2024/dell_ultrasharp_3425we_3.jpg" /></strong></p>

<p>C&aacute;c m&agrave;n h&igrave;nh mới nhất của ch&uacute;ng t&ocirc;i giảm lượng ph&aacute;t thải &aacute;nh s&aacute;ng xanh c&oacute; hại xuống &lt;35%, so với &lt;50% của thế hệ trước, mang lại sự thoải m&aacute;i cho mắt cả ng&agrave;y m&agrave; kh&ocirc;ng l&agrave;m giảm độ ch&iacute;nh x&aacute;c của m&agrave;u sắc.</p>

<p>&nbsp;</p>

<p><strong>Xem chi tiết hơn bao giờ hết</strong></p>

<p><strong><img alt="" src="https://anphat.com.vn/media/lib/11-06-2024/dell_ultrasharp_3425we_4.jpg" /></strong></p>

<p><strong>WQHD</strong></p>

<p>Cải thiện trường nh&igrave;n của bạn v&agrave; lấy n&eacute;t h&igrave;nh ảnh gần như đồng nhất với m&agrave;n h&igrave;nh cong si&ecirc;u rộng n&agrave;y.</p>

<p><strong>98%</strong></p>

<p>Độ phủ m&agrave;u DCI-P3 v&agrave; Display P3.</p>

<p><strong>IPS đen</strong></p>

<p>Trải nghiệm m&agrave;u đen s&acirc;u hơn với tỷ lệ tương phản 2000:1.</p>

<p>&nbsp;</p>

<p><strong>Vận chuyển đa luồng nội bộ (iMST)</strong></p>

<p><strong><img alt="" src="https://anphat.com.vn/media/lib/11-06-2024/dell_ultrasharp_3425we_5.jpg" /></strong></p>

<p>Ph&acirc;n v&ugrave;ng m&agrave;n h&igrave;nh của bạn như thể c&oacute; hai m&agrave;n h&igrave;nh vật l&yacute; 1720x1440 thay v&igrave; một. Kh&ocirc;ng cần phần mềm b&ecirc;n ngo&agrave;i hoặc bộ chia DisplayPort.</p>

<p><strong>Thunderbolt&trade; 4</strong></p>

<p>Cấp nguồn cho thiết bị của bạn bằng một kết nối c&aacute;p duy nhất với c&ocirc;ng suất cung cấp l&ecirc;n tới 90W.</p>

<p><strong>Kết nối mở rộng</strong></p>

<p>Kết nối tất cả c&aacute;c thiết bị của bạn với hơn chục cổng, bao gồm cả cổng truy cập nhanh.</p>

<p><strong>Ổn định trực tuyến</strong></p>

<p>Kết nối với Ethernet bằng cổng RJ45 t&iacute;ch hợp l&ecirc;n tới 2,5GbE.</p>
', N'DataImageSql/Dell UltraSharp_U3425WE(1).jpg', N'10', N'Còn hàng', 9, 7)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (85, N'Màn Hình Gaming UltraWide LG UltraGear 34GP63A-B', CAST(N'2024-11-28' AS Date), 11999000, 10799100, 10, N'Màn Hình Gaming UltraWide LG UltraGear 34GP63A-B', N'<h3><a href="https://www.anphatpc.com.vn/man-hinh-may-tinh-chuyen-gaming_dm1694.html">M&agrave;n H&igrave;nh Gaming</a>&nbsp;UltraWide LG UltraGear 34GP63A-B</h3>

<p><strong>DISPLAY</strong></p>

<p><strong>Mỗi Khoảnh Khắc Đều C&oacute; Gi&aacute; Trị</strong></p>

<p><strong><img alt="" src="https://anphat.com.vn/media/lib/21-03-2024/lg_ultragear_34gp63a_b_1.jpg" /></strong></p>

<p>Với MBR 1ms, xem c&aacute;c chuyển động mượt m&agrave; hơn v&agrave; &iacute;t độ trễ hơn để bạn c&oacute; thể phản ứng nhanh với c&aacute;c chuyển động, gi&uacute;p bạn dẫn đầu tr&ograve; chơi.</p>

<p>&nbsp;</p>

<p><strong>H&igrave;nh Ảnh Nổi Bật</strong></p>

<p><strong><img alt="" src="https://anphat.com.vn/media/lib/21-03-2024/lg_ultragear_34gp63a_b_2.jpg" /></strong></p>

<p>Đắm ch&igrave;m trong thế giới m&agrave;u sắc rực rỡ với&nbsp;<strong>HDR10</strong>&nbsp;gi&uacute;p cải thiện chất lượng h&igrave;nh ảnh v&agrave; dải m&agrave;u sRGB 99% (Điển h&igrave;nh) 98% (Tối thiểu) gi&uacute;p tr&ograve; chơi trở n&ecirc;n nổi bật.</p>

<p>&nbsp;</p>

<p><strong>Lối Chơi Kh&ocirc;ng Bao Giờ Trong B&oacute;ng Tối</strong></p>

<p><strong><img alt="" src="https://anphat.com.vn/media/lib/21-03-2024/lg_ultragear_34gp63a_b_3.jpg" /></strong></p>

<p>Black Stabilizer l&agrave; đồng minh của bạn để tấn c&ocirc;ng hoặc ph&ograve;ng thủ trước kẻ th&ugrave; ẩn nấp trong b&oacute;ng tối. Mang lại trải nghiệm chơi game ở đẳng cấp chuy&ecirc;n nghiệp bằng c&aacute;ch chiếu s&aacute;ng c&aacute;c cảnh tối để cải thiện tầm nh&igrave;n v&agrave; mang lại lợi thế so với đối thủ.</p>

<p>&nbsp;</p>

<p><strong>PERFORMANCE &amp; TECHNOLOGY</strong></p>

<p><strong>Kh&ocirc;ng Chỉ Nhanh M&agrave; C&ograve;n Si&ecirc;u Nhanh</strong></p>

<p><strong><img alt="" src="https://anphat.com.vn/media/lib/21-03-2024/lg_ultragear_34gp63a_b_4.jpg" /></strong></p>

<p>Kh&ocirc;ng bao giờ bỏ lỡ một gi&acirc;y ngay cả khi chơi c&aacute;c tr&ograve; chơi c&oacute; nhịp độ nhanh nhờ tốc độ l&agrave;m mới 160Hz.</p>

<p>&nbsp;</p>

<p><strong>H&agrave;nh Động Khi N&oacute; Xảy Ra</strong></p>

<p><strong><img alt="" src="https://anphat.com.vn/media/lib/21-03-2024/lg_ultragear_34gp63a_b_5.jpg" /></strong></p>

<p>C&oacute; được điều gần gũi nhất với tr&ograve; chơi thời gian thực.&nbsp;<strong>Dynamic Action Sync&reg;</strong>&nbsp;n&acirc;ng cao lối chơi của bạn để c&oacute; trải nghiệm ở cấp độ chuy&ecirc;n nghiệp. Phản ứng với h&agrave;nh động, đối thủ v&agrave; mọi khoảnh khắc với độ trễ đầu v&agrave;o giảm v&agrave; hiệu suất đ&aacute;ng kinh ngạc.</p>

<p>&nbsp;</p>

<p><strong>T&iacute;nh Năng Crosshair Mang Lại Lợi Thế Về Độ Ch&iacute;nh X&aacute;c</strong></p>

<p><strong><img alt="" src="https://anphat.com.vn/media/lib/21-03-2024/lg_ultragear_34gp63a_b_6.jpg" /></strong></p>

<p>Độ ch&iacute;nh x&aacute;c l&agrave; trọng t&acirc;m trong lối chơi của bạn với t&iacute;nh năng&nbsp;<strong>Crosshair</strong>. H&igrave;nh chữ thập ở m&agrave;n h&igrave;nh trung t&acirc;m gi&uacute;p n&acirc;ng cao tầm nh&igrave;n v&agrave; độ ch&iacute;nh x&aacute;c ở cấp độ chuy&ecirc;n nghiệp để tăng độ ch&iacute;nh x&aacute;c trong c&aacute;c tr&ograve; chơi bắn s&uacute;ng g&oacute;c nh&igrave;n thứ nhất.</p>

<p>&nbsp;</p>

<p><strong>DESIGN &amp; PORTS</strong></p>

<p><strong>Nhiều Kh&ocirc;ng Gian Hơn Cho Đa T&aacute;c Vụ</strong></p>

<p><strong><img alt="" src="https://anphat.com.vn/media/lib/21-03-2024/lg_ultragear_34gp63a_b_7.jpg" /></strong></p>

<p>M&agrave;n h&igrave;nh 21:9 UltraWide&trade; QHD (3440 x 1440) rất l&yacute; tưởng cho c&ocirc;ng việc. M&agrave;n h&igrave;nh rộng cho ph&eacute;p bạn xem mọi thứ bạn đang l&agrave;m việc, với nhiều cửa sổ đang mở, tất cả tr&ecirc;n một m&agrave;n h&igrave;nh.</p>
', N'DataImageSql/lg_UltraGear 34GP63A-B(1).jpg', N'10', N'Còn hàng', 9, 21)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (86, N'Màn Hình LG UltraWide 38WR85QC-W', CAST(N'2024-11-28' AS Date), 32999000, 29699100, 10, N'Màn Hình LG UltraWide 38WR85QC-W', N'<h2><strong>M&agrave;n H&igrave;nh LG UltraWide 38WR85QC-W</strong></h2>

<h3>Giới thiệu</h3>

<p><a href="https://www.anphatpc.com.vn/man-hinh-lg-ultrawide-38wr85qc-w.html" target="_blank">M&agrave;n H&igrave;nh LG UltraWide 38WR85QC-W</a>&nbsp;l&agrave; sự lựa chọn ho&agrave;n hảo cho những ai đang t&igrave;m kiếm một trải nghiệm l&agrave;m việc v&agrave; giải tr&iacute; đỉnh cao. Với k&iacute;ch thước lớn 37.5 inch, độ ph&acirc;n giải 4K, tần số qu&eacute;t 144Hz v&agrave; thời gian phản hồi 1ms, chiếc&nbsp;<a href="https://www.anphatpc.com.vn/man-hinh-lg_dm1354.html" target="_blank">m&agrave;n h&igrave;nh LG</a>&nbsp;n&agrave;y mang lại chất lượng h&igrave;nh ảnh tuyệt vời v&agrave; khả năng hiển thị mượt m&agrave;.</p>

<h3><img alt="" src="https://anphat.com.vn/media/lib/13-07-2024/mnhnhlgultrawide38wr85qc-w1.png" /></h3>

<h3>Đặc điểm nổi bật</h3>

<ol>
	<li>
	<p><strong>K&iacute;ch thước m&agrave;n h&igrave;nh lớn 37.5 inch UltraWide</strong>: Với tỷ lệ 21:9, m&agrave;n h&igrave;nh rộng gi&uacute;p mở rộng kh&ocirc;ng gian l&agrave;m việc v&agrave; giải tr&iacute;, cho ph&eacute;p bạn đa nhiệm một c&aacute;ch hiệu quả m&agrave; kh&ocirc;ng cần sử dụng nhiều m&agrave;n h&igrave;nh.</p>
	</li>
	<li>
	<p><strong>Độ ph&acirc;n giải 4K UHD</strong>: M&agrave;n h&igrave;nh 38WR85QC-W c&oacute; độ ph&acirc;n giải 4K (3840 x 1600) mang lại h&igrave;nh ảnh sắc n&eacute;t, chi tiết v&agrave; ch&acirc;n thực, l&yacute; tưởng cho việc chỉnh sửa video, thiết kế đồ họa, v&agrave; chơi game.</p>
	</li>
	<li>
	<p><strong>Tấm nền IPS</strong>: Tấm nền IPS cung cấp g&oacute;c nh&igrave;n rộng l&ecirc;n đến 178 độ, gi&uacute;p hiển thị m&agrave;u sắc ch&iacute;nh x&aacute;c v&agrave; nhất qu&aacute;n từ mọi g&oacute;c nh&igrave;n. Điều n&agrave;y đặc biệt quan trọng đối với c&aacute;c c&ocirc;ng việc y&ecirc;u cầu độ ch&iacute;nh x&aacute;c m&agrave;u cao.</p>
	</li>
	<li>
	<p><strong>Tần số qu&eacute;t 144Hz v&agrave; thời gian phản hồi 1ms</strong>: Tần số qu&eacute;t cao 144Hz v&agrave; thời gian phản hồi nhanh 1ms đảm bảo trải nghiệm chơi game mượt m&agrave;, giảm thiểu hiện tượng x&eacute; h&igrave;nh v&agrave; b&oacute;ng ma, mang lại lợi thế cho c&aacute;c game thủ.</p>
	</li>
	<li>
	<p><strong>Hỗ trợ HDR10</strong>: C&ocirc;ng nghệ HDR10 cải thiện độ tương phản v&agrave; độ s&aacute;ng, mang lại trải nghiệm h&igrave;nh ảnh sống động v&agrave; sắc n&eacute;t hơn, ph&ugrave; hợp cho cả c&ocirc;ng việc s&aacute;ng tạo v&agrave; giải tr&iacute;.</p>
	</li>
	<li>
	<p><strong>Kết nối đa dạng</strong>: M&agrave;n h&igrave;nh n&agrave;y được trang bị c&aacute;c cổng kết nối hiện đại như HDMI, DisplayPort, v&agrave; USB-C, cho ph&eacute;p kết nối linh hoạt với nhiều thiết bị kh&aacute;c nhau, bao gồm cả m&aacute;y t&iacute;nh x&aacute;ch tay, PC, v&agrave; c&aacute;c thiết bị di động.</p>
	</li>
	<li>
	<p><strong>Thiết kế hiện đại v&agrave; tiện &iacute;ch</strong>: Với thiết kế viền mỏng, ch&acirc;n đế c&oacute; thể điều chỉnh độ cao, xoay v&agrave; nghi&ecirc;ng, m&agrave;n h&igrave;nh 38WR85QC-W mang lại sự tiện lợi v&agrave; thoải m&aacute;i tối đa trong qu&aacute; tr&igrave;nh sử dụng.</p>
	</li>
</ol>

<h3><img alt="" src="https://anphat.com.vn/media/lib/13-07-2024/mnhnhlgultrawide38wr85qc-w2.png" /></h3>

<h3>Sự kh&aacute;c biệt</h3>

<ul>
	<li>
	<p><strong>Kh&ocirc;ng gian l&agrave;m việc mở rộng</strong>: Kh&aacute;c biệt lớn nhất của m&agrave;n h&igrave;nh LG UltraWide 38WR85QC-W so với c&aacute;c m&agrave;n h&igrave;nh th&ocirc;ng thường l&agrave; khả năng cung cấp kh&ocirc;ng gian l&agrave;m việc rộng lớn hơn. Điều n&agrave;y gi&uacute;p người d&ugrave;ng c&oacute; thể mở nhiều cửa sổ c&ugrave;ng l&uacute;c, tăng cường hiệu suất l&agrave;m việc v&agrave; giảm thiểu thời gian chuyển đổi giữa c&aacute;c ứng dụng.</p>
	</li>
	<li>
	<p><strong>Hiệu suất vượt trội cho mọi nhu cầu</strong>: Từ chỉnh sửa video 4K, thiết kế đồ họa đến chơi game tốc độ cao, m&agrave;n h&igrave;nh 38WR85QC-W đ&aacute;p ứng tất cả c&aacute;c nhu cầu n&agrave;y với chất lượng h&igrave;nh ảnh v&agrave; hiệu suất tối ưu. Đặc biệt, tần số qu&eacute;t cao v&agrave; thời gian phản hồi nhanh mang lại trải nghiệm chơi game kh&ocirc;ng giật lag, tạo lợi thế cho c&aacute;c game thủ chuy&ecirc;n nghiệp.</p>
	</li>
</ul>

<h3><img alt="" src="https://anphat.com.vn/media/lib/13-07-2024/mnhnhlgultrawide38wr85qc-w3.png" /></h3>

<h3>Kết luận</h3>

<p>M&agrave;n H&igrave;nh LG UltraWide 38WR85QC-W (37.5 inch - IPS - 4K - 144Hz - 1ms) l&agrave; lựa chọn ho&agrave;n hảo cho những ai đang t&igrave;m kiếm một m&agrave;n h&igrave;nh đa năng, chất lượng cao. Với k&iacute;ch thước rộng, độ ph&acirc;n giải 4K, tần số qu&eacute;t 144Hz v&agrave; thời gian phản hồi 1ms, m&agrave;n h&igrave;nh n&agrave;y kh&ocirc;ng chỉ mang lại trải nghiệm h&igrave;nh ảnh xuất sắc m&agrave; c&ograve;n gi&uacute;p n&acirc;ng cao hiệu suất l&agrave;m việc v&agrave; giải tr&iacute; của bạn. Trang bị ngay m&agrave;n h&igrave;nh LG UltraWide 38WR85QC-W để tận hưởng những c&ocirc;ng nghệ ti&ecirc;n tiến nhất trong một thiết kế hiện đại v&agrave; tiện &iacute;ch.</p>
', N'DataImageSql/lg_UltraWide 38WR85QC-W(1).jpg', N'10', N'Còn hàng', 9, 21)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (87, N'Bàn phím cơ Corsair K100 RGB OPX switch', CAST(N'2024-11-28' AS Date), 5999000, 5399100, 10, N'Bàn phím cơ Corsair K100 RGB OPX switch', N'<h2><a href="https://www.anphatpc.com.vn/ban-phim-co-choi-game_dm1257.html">B&Agrave;N PH&Iacute;M CƠ</a>&nbsp;CAO CẤP NHẤT CỦA H&Atilde;NG</h2>

<p><strong><a href="https://www.anphatpc.com.vn/ban-phim-corsair_dm1362.html">B&agrave;n ph&iacute;m Corsair</a>&nbsp;K100 RGB</strong>&nbsp;ch&iacute;nh l&agrave; mẫu b&agrave;n&nbsp;<strong>ph&iacute;m cơ mới nhất, cao cấp nhất</strong>&nbsp;của Corsair. Khi m&agrave; ph&iacute;m hội tụ đầy đủ nhất, những c&ocirc;ng nghệ ti&ecirc;n tiến c&ugrave;ng vật liệu cao cấp c&ugrave;ng thiết kế, gia c&ocirc;ng đỉnh cao nhất.</p>

<p><img alt="Corsair K100 RGB" src="https://anphat.com.vn/media/product/34957_corsair_k100_rgb__18_.jpg" style="height:800px; width:800px" /></p>

<p>&nbsp;</p>

<h2>C&Ocirc;NG NGHỆ SI&Ecirc;U XỬ L&Yacute; CORSAIR AXON&nbsp;</h2>

<p>Điều khiến&nbsp;<strong>Corsair K100 RGB</strong>&nbsp;trở n&ecirc;n đặc biệt so với tất cả c&aacute;c loại ph&iacute;m gaming kh&aacute;c, c&oacute; lẽ phải nhắc tới đầu ti&ecirc;n đ&oacute; l&agrave;&nbsp;<strong>c&ocirc;ng nghệ &quot;si&ecirc;u xử l&yacute;&quot; Corsari AXON</strong>. Nằm trong chiếc b&agrave;n ph&iacute;m cơ n&agrave;y l&agrave; hệ thống xử l&yacute;&nbsp;<strong>cho ph&eacute;p &quot;qu&eacute;t&quot; c&aacute;c thao t&aacute;c của người d&ugrave;ng ở tần số l&ecirc;n tới 4000Hz</strong>, gi&uacute;p cho c&aacute;c thao t&aacute;c bấm ph&iacute;m của game thủ được xử l&yacute; với&nbsp;<strong>độ trễ chỉ 0,5 ms, tức nhanh gấp 4 lần so với c&aacute;c loại ph&iacute;m gaming đắt tiền kh&aacute;c</strong>, v&agrave; nhanh gấp 16 lần so với b&agrave;n ph&iacute;m th&ocirc;ng thường. Người d&ugrave;ng sẽ được trải nghiệm chiếc ph&iacute;m cơ c&oacute; tốc độ cao chưa từng thấy.</p>

<p>&nbsp;<img alt="Corsair K100 RGB" src="https://anphat.com.vn/media/product/34957_corsair_k100_rgb__19_.jpg" style="height:800px; width:800px" /></p>

<p>&nbsp;</p>

<h2>KH&Ocirc;NG GIỚI HẠN C&Aacute;C THIẾT LẬP VỀ LED</h2>

<p>LED RGB 16.8 triệu m&agrave;u l&agrave; chuyện thường, nhưng với&nbsp;<strong>Corsair K100 RGB</strong>&nbsp;l&agrave; ở đẳng cấp ho&agrave;n to&agrave;n mới. Với&nbsp;<strong>LED viền l&ecirc;n tới 44 v&ugrave;ng s&aacute;ng ri&ecirc;ng biệt</strong>&nbsp;c&ugrave;ng với bộ xử l&yacute;&nbsp;<strong>Corsair AXON 20 lớp LED</strong>&nbsp;cho ph&eacute;p game thủ c&oacute; thể t&ugrave;y biến v&ocirc; hạn về &aacute;nh s&aacute;ng tr&ecirc;n&nbsp;<strong>Corsair K100 RGB</strong>&nbsp;th&ocirc;ng qua phần mềm iCUE.<br />
<br />
<img alt="Corsair K100 RGB" src="https://anphat.com.vn/media/lib/34957_corsair-k100-rgb21.jpg" style="height:800px; width:800px" /></p>

<p>&nbsp;</p>

<h2>SWITCH&nbsp;CORSAIR OPX OPTICAL TỐC ĐỘ NHANH NHẤT</h2>

<p><strong>Corsair K100 RGB</strong>&nbsp;c&oacute; hai phi&ecirc;n bản, ở phi&ecirc;n bản sử dụng switch Corsair OPX, ch&uacute;ng ta c&oacute; được chiếc b&agrave;n ph&iacute;m cơ c&oacute;&nbsp;<strong>tốc độ đỉnh cao</strong>&nbsp;với&nbsp;<strong>điểm nhận t&iacute;n hiệu chỉ l&agrave; 1 mm</strong>. Đ&acirc;y l&agrave; loại&nbsp;<strong>switch Quang Cơ</strong>&nbsp;ho&agrave;n to&agrave;n kh&aacute;c biệt với switch truyền thống với độ bền v&agrave; tốc độ &quot;kinh ho&agrave;ng&quot;, khiến cho&nbsp;<strong>Corsair K100 RGB</strong>&nbsp;phi&ecirc;n bản OPX trở th&agrave;nh một trong những ph&iacute;m cơ c&oacute;&nbsp;<strong>tốc độ nhanh nhất thế giới</strong>.</p>
', N'DataImageSql/corsairK100_(1).jpg', N'10', N'Còn hàng', 16, 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (88, N'Bàn phím cơ Corsair K70 Pro Mini RGB Wireless', CAST(N'2024-11-28' AS Date), 4489000, 4489000, 10, N'Bàn phím cơ Corsair K70 Pro Mini RGB Wireless', N'<h2><strong>B&agrave;n ph&iacute;m cơ Corsair K70 RGB Pro</strong></h2>

<p><strong>Sự Kế Thừa Ho&agrave;n Hảo Cho Một Huyền Thoại</strong></p>

<p><img alt="" src="https://www.anphatpc.com.vn/media/news/1106_CorsairK70RGBProReview-111.jpg" style="height:466px; width:700px" /></p>

<p>Sau th&agrave;nh c&ocirc;ng cực k&igrave; vang dội của phi&ecirc;n bản K70 MK2, với t&ocirc;n chỉ kh&ocirc;ng ngừng n&acirc;ng cấp cải tiến để c&oacute; thể mang lại cho người d&ugrave;ng một trải nghiệm g&otilde; ph&iacute;m ho&agrave;n hảo nhất, Corsair c&ugrave;ng đội ngũ nh&acirc;n sự chuy&ecirc;n nghiệp của m&igrave;nh đ&atilde; nghi&ecirc;n cứu, ph&aacute;t triển v&agrave; cho ra mắt chiếc&nbsp;<a href="https://www.anphatpc.com.vn/ban-phim-co-choi-game.html" target="_blank">b&agrave;n ph&iacute;m cơ</a>&nbsp;Corsair K70 RGB Pro. Chiếc b&agrave;n ph&iacute;m cơ gaming vừa kế thừa những yếu tố mang t&iacute;nh biểu tượng, vừa sở hữu th&ecirc;m cực k&igrave; nhiều sự n&acirc;ng cấp ấn tượng so với phi&ecirc;n bản tiền nhiệm. Kh&ocirc;ng l&agrave;m c&aacute;c bạn phải mong chờ l&acirc;u th&ecirc;m nữa, c&ugrave;ng m&igrave;nh mở hộp v&agrave; t&igrave;m hiểu chi tiết hơn về chiếc b&agrave;n ph&iacute;m cơ si&ecirc;u phẩm n&agrave;y ngay th&ocirc;i n&agrave;o!</p>

<p>&nbsp;</p>

<h3><strong>I. Thiết Kế Sang Trọng Những Vẫn Cực K&igrave; C&aacute; T&iacute;nh</strong></h3>

<p><img alt="" src="https://www.anphatpc.com.vn/media/news/1106_CorsairK70RGBProReview-112.jpg" style="height:466px; width:700px" /></p>

<p>Ngay khi mở hộp sản phẩm, điểm thay đổi đầu ti&ecirc;n tr&ecirc;n chiếc&nbsp;<a href="https://www.anphatpc.com.vn/ban-phim-corsair.html" target="_blank">b&agrave;n ph&iacute;m cơ Corsair</a>&nbsp;K70 RGB Pro so với thế hệ tiền nhiệm m&agrave; ch&uacute;ng ta c&oacute; thể ngay lập tức nhận ra đ&oacute; ch&iacute;nh l&agrave; thiết kế. Corsair c&ugrave;ng đội ngũ thiết kế của m&igrave;nh đ&atilde; v&ocirc; c&ugrave;ng kh&eacute;o l&eacute;o khi đem đến cho K70 RGB Pro một thiết kế c&acirc;n bằng ho&agrave;n hảo giữa vẻ sang trọng cao cấp với phong c&aacute;ch c&aacute; t&iacute;nh đậm chất gaming. Lấy sự liền mạch, thống nhất v&agrave; ho&agrave;n thiện l&agrave;m t&ocirc;n chỉ cho tổng thể thiết kế, Corsair K70 RGB Pro bằng một c&aacute;ch trực tiếp nhất đ&atilde; minh chứng cho ph&acirc;n kh&uacute;c m&agrave; sản phẩm n&agrave;y thuộc về, một chiếc b&agrave;n ph&iacute;m cơ gaming hi-end đ&uacute;ng nghĩa.</p>

<p>&nbsp;</p>

<p><img alt="" src="https://www.anphatpc.com.vn/media/news/1106_CorsairK70RGBProReview-1.jpg" style="height:466px; width:700px" /></p>

<p>Ở phi&ecirc;n bản K70 RGB Pro của năm nay, Corsair đ&atilde; mở rộng khu vực hiển thị logo nhưng lại loại bỏ chữ &ldquo;Corsair&rdquo; v&agrave; chỉ giữ lại biểu tượng c&aacute;nh buồm huyền thoại của h&atilde;ng ở ch&iacute;nh giữa. C&acirc;n đối, đơn giản v&agrave; cực k&igrave; tinh tế, việc cắt giảm n&agrave;y kh&ocirc;ng l&agrave;m ảnh hưởng tới nhận diện thương hiệu m&agrave; phần n&agrave;o c&ograve;n gi&uacute;p logo n&agrave;y trở n&ecirc;n v&ocirc; c&ugrave;ng nổi bật. Phần top plate d&ugrave; l&agrave;m nền nhưng lại kh&ocirc;ng bị nhạt nh&ograve;a đi ch&uacute;t n&agrave;o. Nhờ được l&agrave;m ho&agrave;n to&agrave;n từ hợp kim nh&ocirc;m cao cấp với bề mặt họa tiết phay xước, phần plate n&agrave;y vừa gi&uacute;p t&ocirc;n th&ecirc;m vẻ sang trọng cho chiếc b&agrave;n ph&iacute;m, vừa gi&uacute;p tăng cảm gi&aacute;c đầm tay, g&oacute;p phần ho&agrave;n thiện trải nghiệm g&otilde; ph&iacute;m tuyệt vời m&agrave; Corsair K70 RGB Pro c&oacute; thể mang lại.</p>
', N'DataImageSql/corsairK70_(1).jpg', N'0', N'Còn hàng', 16, 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (89, N'Bàn phím cơ Logitech G515 LightSpeed TKL Wireless White', CAST(N'2024-11-28' AS Date), 34900000, 34900000, 10, N'Bàn phím cơ Logitech G515 LightSpeed TKL Wireless White', N'<h1>B&agrave;n ph&iacute;m cơ Logitech G515 LightSpeed TKL Wireless White</h1>
', N'DataImageSql/logitech_white_(1).jpg', N'0', N'Còn hàng', 16, 12)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (90, N'Bàn phím cơ Logitech G613 Wireless', CAST(N'2024-11-28' AS Date), 1990000, 1990000, 10, N'Bàn phím cơ Logitech G613 Wireless', N'<h1>B&agrave;n ph&iacute;m cơ Logitech G613 Wireless</h1>
', N'DataImageSql/logitech_g613(1).png', N'0', N'Còn hàng', 16, 12)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (91, N'Bàn phím cơ Razer Blackwidow V3 Tenkeyless', CAST(N'2024-11-28' AS Date), 2999000, 2699100, 10, N'Bàn phím cơ Razer Blackwidow V3 Tenkeyless', N'<h1>B&agrave;n ph&iacute;m cơ Razer Blackwidow V3 Tenkeyless</h1>
', N'DataImageSql/razer_black(1).jpg', N'10', N'Còn hàng', 16, 15)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (92, N'Bàn phím cơ Razer Blackwidow V4', CAST(N'2024-11-28' AS Date), 4499000, 4499000, 10, N'Bàn phím cơ Razer Blackwidow V4', N'<h1>B&agrave;n ph&iacute;m cơ Razer Blackwidow V4</h1>
', N'DataImageSql/razer_v4(1).png', N'0', N'Còn hàng', 16, 15)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (93, N'Chuột Corsair Harpoon Pro RGB Wireless', CAST(N'2024-11-28' AS Date), 1399000, 1329050, 10, N'Chuột Corsair Harpoon Pro RGB Wireless', N'<h1>Chuột Corsair Harpoon Pro RGB Wireless</h1>
', N'DataImageSql/chuot_corsair_(1).jpg', N'5', N'Còn hàng', 17, 15)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (94, N'Chuột Corsair Katar Pro Ultra Light', CAST(N'2024-11-28' AS Date), 389000, 389000, 10, N'Chuột Corsair Katar Pro Ultra Light', N'<h1>Chuột Corsair Katar Pro Ultra Light</h1>
', N'DataImageSql/chuot_katar(1).jpg', N'0', N'Còn hàng', 17, 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (95, N'Chuột Logitech G Pro 2 LightSpeed White', CAST(N'2024-11-28' AS Date), 3299000, 2969100, 10, N'Chuột Logitech G Pro 2 LightSpeed White', N'<h2><strong>Chuột Logitech G Pro 2 LightSpeed</strong></h2>

<p>Sau một khoảng thời gian, d&ograve;ng sản phẩm G Pro Wireless đ&atilde; ch&iacute;nh thức t&aacute;i xuất với mẫu&nbsp;<strong><a href="https://www.anphatpc.com.vn/chuot-logitech-g-pro-2-lightspeed-black.html" target="_blank" title="Chuột Logitech G Pro 2 LightSpeed">Chuột Logitech G Pro 2 LightSpeed</a></strong>&nbsp;vừa được Logitech cho ra mắt. L&agrave; phi&ecirc;n bản tiếp theo của si&ecirc;u phẩm&nbsp;<a href="https://www.anphatpc.com.vn/chuot-choi-game.html" target="_blank" title="chuột Gaming">chuột Gaming</a>&nbsp;G Pro Wireless, mẫu chuột n&agrave;y được cải tiến với nhiều c&ocirc;ng nghệ mới chắc chắn sẽ l&agrave; một sự lựa chọn đ&aacute;ng để anh em Game thủ để t&acirc;m tới. C&ugrave;ng t&igrave;m hiểu ngay về mẫu&nbsp;<a href="https://www.anphatpc.com.vn/chuot-logitech.html" target="_blank" title="chuột Logitech">chuột Logitech</a>&nbsp;n&agrave;y ngay qua b&agrave;i viết dưới đ&acirc;y của An Ph&aacute;t Computer.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/19-09-2024/logitech-g-pro-superlight-2.jpg" /></p>

<h3><strong>Ph&ugrave; hợp cho mọi đối tượng sử dụng</strong></h3>

<p>Hợp t&aacute;c v&agrave; lắng nghe &yacute; kiến của những vận động vi&ecirc;n eSport h&agrave;ng đầu thế giới,&nbsp;<strong>Logitech G Pro 2 LightSpeed</strong>&nbsp;cung cấp khả năng t&ugrave;y chỉnh to&agrave;n diện để ph&ugrave; hợp với mọi đối tượng sử dụng. Sở hữu thiết kế đối xứng, mẫu chuột n&agrave;y ho&agrave;n to&agrave;n c&oacute; thể sử dụng bởi cả người d&ugrave;ng thuận tay tr&aacute;i v&agrave; tay phải.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/19-09-2024/logitech-g-pro-lightspeed-2-4.jpg" /></p>

<h3><strong>Kết nối LIGHTSPEED cao cấp</strong></h3>

<p>Một n&acirc;ng cấp cực kỳ đ&aacute;ng để ch&uacute; &yacute; so với phi&ecirc;n bản trước nằm ở phần kết nối. Logitech G Pro 2 LightSpeed nay đ&atilde; được trang bị kết nối LIGHTSPEED độc quyền từ Logitech để mang lại tốc độ phản hồi si&ecirc;u tốc, độ trễ cực thấp v&agrave; hoạt động ổn định ngay cả trong những m&ocirc;i trường kh&oacute; khăn.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/19-09-2024/logitech-g-pro-lightspeed-2-2.jpg" /></p>

<h3><strong>Cảm biến HERO 2 cực ch&iacute;nh x&aacute;c</strong></h3>

<p><strong>Logitech G Pro 2 LightSpeed</strong>&nbsp;được trang bị cảm biến HERO 2 t&acirc;n tiến nhất, mang lại độ ch&iacute;nh x&aacute;c để sử dụng ở m&ocirc;i trường chơi Game chuy&ecirc;n nghiệp với&nbsp;32K DPI, theo d&otilde;i tốc độ hơn 500+ IPS, gia tốc &gt;40G v&agrave; Polling Rate 1000hz.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/19-09-2024/logitech-g-pro-lightspeed-2-1.jpg" /></p>

<h3><strong>Switch LIGHTFORCE hiện đại</strong></h3>

<p>C&ocirc;ng tắc LIGHTFORCE kết hợp tốc độ v&agrave; độ tin cậy của c&ocirc;ng tắc quang học với tiếng k&ecirc;u l&aacute;ch c&aacute;ch dễ chịu của c&ocirc;ng tắc cơ học để mang tới trải nghiệm sử dụng ho&agrave;n hảo ở mọi phương diện tr&ecirc;n<strong>&nbsp;Logitech G Pro 2 LightSpeed</strong>.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/19-09-2024/logitech-g-pro-lightspeed-2-3.jpg" /></p>

<h3><strong>Thời lượng Pin tới 90 giờ</strong></h3>

<p><strong>Logitech G Pro 2 LightSpeed</strong>&nbsp;c&oacute; thể bền bỉ l&ecirc;n tới 90 giờ hoạt động ở chế độ kh&ocirc;ng LED hoặc 60 giờ khi bật đ&egrave;n LED. Chuột c&oacute; thể sạc nhanh th&ocirc;ng qua cổng USB Type C hoặc tương th&iacute;ch với bộ sạc POWERPLAY độc quyền từ Logitech để bạn trải nghiệm kết nối kh&ocirc;ng d&acirc;y to&agrave;n diện.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/19-09-2024/logitech-g-pro-lightspeed-2-5.jpg" /></p>
', N'DataImageSql/logitech_g_pro(1).jpg', N'10', N'Còn hàng', 17, 12)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (96, N'Chuột Logitech G Pro X Superlight 2 Wireless White', CAST(N'2024-11-29' AS Date), 3899000, 3587080, 10, N'Chuột Logitech G Pro X Superlight 2 Wireless White', N'<h2><strong>Chuột Logitech G Pro X Superlight 2 Wireless</strong></h2>

<p>Tiếp nối sự th&agrave;nh c&ocirc;ng vang dội của si&ecirc;u phẩm G Pro X Superlight, phi&ecirc;n bản tiếp theo của d&ograve;ng&nbsp;<a href="https://www.anphatpc.com.vn/chuot-logitech.html" target="_blank">chuột Logitech</a>&nbsp;đ&igrave;nh đ&aacute;m n&agrave;y đ&atilde; ch&iacute;nh thực được ra mắt với t&ecirc;n gọi&nbsp;<strong>Logitech G Pro X Superlight 2 Wireless</strong>. Nhanh hơn, nhẹ hơn, ch&iacute;nh x&aacute;c hơn, bền bỉ hơn, kh&ocirc;ng qu&aacute; khi khẳng định&nbsp;<strong>Logitech G Pro X Superlight 2 Wireless</strong>&nbsp;ch&iacute;nh l&agrave; mẫu&nbsp;<a href="https://www.anphatpc.com.vn/chuot-choi-game.html" target="_blank">chuột Gaming</a>&nbsp;số 1 hiện tại. C&ugrave;ng t&igrave;m hiểu ngay về si&ecirc;u phẩm n&agrave;y qua b&agrave;i viết dưới đ&acirc;y.</p>

<h2><strong>Trọng lượng 57 gram - Chuột Gaming nhẹ nhất thế giới</strong></h2>

<p>Vượt qua trọng lượng 60 Gram của phi&ecirc;n bản tiền nhiệm,&nbsp;<strong>Logitech G Pro X Superlight 2 Wireless</strong>&nbsp;trở th&agrave;nh mẫu chuột Gaming nhẹ nhất thế giới ở thời điểm hiện tại với trọng lượng chỉ 57 gram.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/06-09-2023/pro-x-superlight-2-4.jpg" /></p>

<h2><strong>Cảm biến HERO 2 ti&ecirc;n tiến</strong></h2>

<p>Mắt đọc, hay cảm biến l&agrave; những thứ quan trọng h&agrave;ng đầu với một mẫu chuột Gaming. N&oacute; quyết định sự ch&iacute;nh x&aacute;c trong từng thao t&aacute;c, l&agrave; ch&igrave;a kh&oacute;a để mang tới chiến thắng.&nbsp;<strong>Logitech G Pro X Superlight 2 Wireless</strong>&nbsp;trang bị cảm biến HERO 2 ti&ecirc;n tiến nhất với độ ch&iacute;nh x&aacute;c ở cấp độ chuy&ecirc;n nghiệp. Bạn sẽ dược trải nghiệm độ tin cậy tuyệt đối của việc theo d&otilde;i tr&ecirc;n 500+ IPS v&agrave; l&ecirc;n tới 32.000 DPI từ cảm biến HERO 2.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/06-09-2023/pro-x-superlight-2-1.jpg" /></p>

<h2><strong>C&ocirc;ng nghệ&nbsp;LIGHTSPEED si&ecirc;u tốc</strong></h2>

<p>C&ocirc;ng nghệ LIGHTSPEED với độ tin cậy cao v&agrave; tốc độ si&ecirc;u tốc nay được cải tiến để mang tới&nbsp;kết nối Wireless c&oacute; độ phản hồi nhanh hơn, k&eacute;o độ trễ xuống mức thấp nhất. Tần số gửi t&iacute;n hiệu tối đa l&ecirc;n tới 2000Hz cho độ trễ gần như bằng 0.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/06-09-2023/pro-x-superlight-2-2.jpg" /></p>

<h2><strong>Switch HYBRID LIGHTFORCE h&agrave;ng đầu</strong></h2>

<p>Sự kết hợp ho&agrave;n hảo giữa c&ocirc;ng nghệ ph&iacute;m quang học v&agrave; cơ học độc quyền từ Logitech mang tới tốc độ v&agrave; độ tin cậy ấn tượng cho&nbsp;<strong>Logitech G Pro X Superlight 2 Wireless</strong>. Switch quang học với mức ti&ecirc;u thụ điện năng thấp cộng k&egrave;m c&ugrave;ng cảm gi&aacute;c click chuột thỏa m&atilde;n từ&nbsp;micro witch điện truyền thống khiến&nbsp;<strong>Logitech G Pro X Superlight 2 Wireless</strong>&nbsp;sở hữu hiệu suất m&agrave; c&aacute;c tuyển thủ chuy&ecirc;n nghiệp cần tới m&agrave; kh&ocirc;ng ảnh hưởng đến thời lượng Pin.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/06-09-2023/pro-x-superlight-2-0.jpg" /></p>

<h2><strong>Feet PTFE si&ecirc;u bền bỉ</strong></h2>

<p>Thoải m&aacute;i, &ecirc;m &aacute;i, trơn tru, Feet chuột PTFE kh&ocirc;ng pha tạp chất mang lại cho người d&ugrave;ng cảm gi&aacute;c lướt &ecirc;m &aacute;i, tạo ra kết nối mượt m&agrave; v&agrave; ch&iacute;nh x&aacute;c nhất trong tr&ograve; chơi.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/06-09-2023/pro-x-superlight-2-3.jpg" /></p>

<h2><strong>C&ocirc;ng nghệ hiện đại - Pin si&ecirc;u bền bỉ</strong></h2>

<p><strong>Logitech G Pro X Superlight 2 Wireless</strong>&nbsp;l&agrave; con chuột h&agrave;ng đầu eSport, được tinh chỉnh v&agrave; sở hữu những c&ocirc;ng nghệ đỉnh cao nhất với t&iacute;nh năng thăm d&ograve; 2K, USB-C, thời lượng pin 95 giờ hay khả năng tương th&iacute;ch với sạc kh&ocirc;ng d&acirc;y POWERPLAY.</p>
', N'DataImageSql/logitech_gPro_(1).jpg', N'8', N'Còn hàng', 17, 12)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (97, N'Chuột Razer Viper V3 Pro Wireless Black', CAST(N'2024-11-29' AS Date), 4490000, 4265500, 10, N'Chuột Razer Viper V3 Pro Wireless Black', N'<h3><strong>2 chế độ kết nối</strong></h3>

<p>Được tạo ra để trở th&agrave;nh sự lựa chọn h&agrave;ng đầu cho Game thủ,&nbsp;<strong>Razer Viper V3 Pro Wireless</strong>&nbsp;kết hợp tốc độ phản hồi si&ecirc;u tốc v&agrave; sự tiện nghi tối đa trong 2 Mode kết nối: Wireless HyperSpeed v&agrave; kết nối USB. Kết nối kh&ocirc;ng d&acirc;y Razer HyperSpeed h&agrave;ng đầu thế giới đ&atilde; qu&aacute; nổi tiếng mang tới cho bạn trải nghiệm sử dụng Wireless si&ecirc;u tốc kh&ocirc;ng độ trễ.&nbsp;</p>

<p>Với&nbsp;Razer HyperSpeed Wireless, giờ đ&acirc;y, c&aacute;c bạn c&oacute; thể ho&agrave;n to&agrave;n tận hưởng khoảng thời gian giải tr&iacute; tuyệt vời với tốc độ phản hồi nhanh hơn tới 25% khi so s&aacute;nh với c&aacute;c c&ocirc;ng nghệ kết nối kh&ocirc;ng d&acirc;y kh&aacute;c. B&ecirc;n cạnh đ&oacute;, Razer HyperSpeed cho ph&eacute;p bạn kết n&oacute;i nhiều thiết bị Gaming Gear của Razer c&oacute; hỗ trợ c&ocirc;ng nghệ n&agrave;y th&ocirc;ng qua một USB Receiver duy nhất.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/03-05-2024/chuot_razer_viper_v3_pro_wireless.jpg" /></p>

<p>Kết nối&nbsp;th&ocirc;ng qua d&acirc;y USB truyền thống l&agrave; kh&ocirc;ng thể thiếu, ngo&agrave;i mang lại tốc độ phản hồi nhanh nhất, kết nối d&acirc;y cũng cho ph&eacute;p&nbsp;bạn vừa sử dụng&nbsp;Razer Viper V3 Pro Wireless vừa c&oacute; thể sạc đầy Pin.</p>

<h3><strong>Cảm biến Razer Focus Pro 35K Gen-2 h&agrave;ng đầu</strong></h3>

<p>Hợp t&aacute;c với Pixart, c&ocirc;ng ty h&agrave;ng đầu trong ng&agrave;nh về c&aacute;c giải ph&aacute;p cảm biến th&ocirc;ng minh, cảm biến quang học&nbsp;Razer Focus Pro 35K Gen-2 mới nhất mang tới độ ch&iacute;nh x&aacute;c tuyệt đối, theo s&aacute;t từng chuyển động của Game thủ. Sở hữu cảm biến tốt nhất thế giới,&nbsp;<strong>Razer Viper V3 Pro Wireless</strong>&nbsp;c&oacute;&nbsp;DPI tối đa l&ecirc;n tới 35.000, tốc độ lướt tối đa 750IPS v&agrave; gia tốc chịu đựng tối đa l&ecirc;n tới 70G v&agrave; đạt độ ch&iacute;nh x&aacute;c gần như tuyệt đối với 99,8%.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/03-05-2024/chuot_razer_viper_v3_pro_wireless_5.jpg" /></p>

<p>Cảm biến&nbsp;Razer Focus Pro 35K Gen-2 được trang bị tr&ecirc;n&nbsp;<strong>Razer Viper V3 Pro Wireless</strong>&nbsp;vẫn hội tụ những ưu điểm của thế hệ trước v&agrave; mang tới nhiều cải tiến mới so với cảm biến Razer Focus Pro 30K được trang bị tr&ecirc;n Razer Viper V2 Pro Wireless.</p>

<p><strong>T&iacute;nh năng&nbsp;1-DPI Step Adjustments:</strong>&nbsp;Cho ph&eacute;p điều chỉnh độ nhạy chuột kh&ocirc;ng giới hạn, ch&iacute;nh x&aacute;c tới từng đơn vị để ph&ugrave; hợp nhất với từng người d&ugrave;ng.</p>

<p><strong>T&iacute;nh năng Sensitivity Matcher:</strong>&nbsp;Đồng bộ h&oacute;a v&agrave; chuyển c&aacute;c mức thiết lập DPI từ mẫu chuột cũ của bạn sang cho Razer V3 Pro Wireless.</p>

<h3><strong>N&uacute;t bấm quang học thế hệ thứ 3</strong></h3>

<p>Với tuổi thọ l&ecirc;n tới 90 triệu lượt nhấp chuột n&oacute;i kh&ocirc;ng với sự cố double-click, đến chu kỳ 0,2 gi&acirc;y si&ecirc;u nhanh của n&uacute;t bấm quang học Razer Gen 3 si&ecirc;u bền bỉ,&nbsp;<strong>Razer Viper V3 Pro Wireless</strong>&nbsp;sở hữu độ bền bỉ v&agrave; tốc độ phản hồi đ&uacute;ng chuẩn d&agrave;nh cho Game thủ chuy&ecirc;n nghiệp.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/03-05-2024/chuot_razer_viper_v3_pro_wireless_2.jpg" /></p>

<h3><strong>Thiết kế thoải m&aacute;i, trọng lượng si&ecirc;u nhẹ</strong></h3>

<p>Nghi&ecirc;n cứu kỹ lưỡng th&oacute;i quen của người d&ugrave;ng v&agrave; Game thủ chuy&ecirc;n nghiệp, Razer mang tới cho&nbsp;<strong>Razer Viper V3 Pro Wireless</strong>&nbsp;những thay đổi nhỏ trong thiết kế nhưng mang tới hiệu quả tuyệt vời v&agrave; sự thoải m&aacute;i trong suốt qu&aacute; tr&igrave;nh sử dụng. Phần r&atilde;nh ng&oacute;n tay r&otilde; rệt tăng cường tiếp t&uacute;c, th&agrave;nh b&ecirc;n phẳng hơn để ph&ugrave; hợp với nhiều k&iacute;ch cỡ tay, độ cong vừa phải để &ocirc;m tay hơn, ph&ugrave; hợp cho nhiều Form cầm kh&aacute;c nhau. Thiết kế c&acirc;n bằng ho&agrave;n hảo kết hợp c&ugrave;ng trọng lượng si&ecirc;u nhẹ chỉ 55g gi&uacute;p&nbsp;<strong>Razer Viper V3 Pro Wireless</strong>&nbsp;linh hoạt v&agrave; thoải m&aacute;i hơn mọi con chuột kh&aacute;c, cho ph&eacute;p bạn điều khiển ch&iacute;nh x&aacute;c, phản ứng cực nhanh ch&oacute;ng trong mọi t&igrave;nh huống.</p>
', N'DataImageSql/razer_viper_v3(1).jpg', N'5', N'Còn hàng', 17, 15)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (98, N'Chuột Razer DeathAdder V3', CAST(N'2024-11-29' AS Date), 1899000, 1804050, 10, N'Chuột Razer DeathAdder V3', N'<h2><strong>Chuột Razer DeathAdder V3</strong></h2>

<p>Với cộng đồng Game thủ n&oacute;i chung v&agrave; cộng đồng y&ecirc;u&nbsp;<a href="https://www.anphatpc.com.vn/gaming-gear.html" target="_blank">Gaming Gear</a>&nbsp;n&oacute;i ri&ecirc;ng, những mẫu&nbsp;<a href="https://www.anphatpc.com.vn/chuot-razer.html" target="_blank">chuột Razer</a>&nbsp;lu&ocirc;n được xếp v&agrave;o trong những mẫu chuột tốt nhất, cao cấp nhất. Mang thiết kế Ultra Lightweight ergonomic - Chuột c&ocirc;ng th&aacute;i học si&ecirc;u nhẹ c&ugrave;ng v&ocirc; số c&ocirc;ng nghệ hiện đại, si&ecirc;u phẩm&nbsp;<a href="https://www.anphatpc.com.vn/chuot-choi-game.html" target="_blank">chuột Gaming</a><strong>&nbsp;Razer DeathAdder V3</strong>&nbsp;sẽ l&agrave; trợ thủ đắc lực c&ugrave;ng bạn chinh chiến tr&ecirc;n mọi mặt trận Esport.</p>

<p><img alt="RAZER DEATHADDER V3" src="https://assets2.razerzone.com/images/pnx.assets/bf7ea91398b704ea710dfad671d185b9/razer-deathadder-v3-hero-desktop.jpg" style="height:320px; width:878px" /></p>

<h2><strong>Định nghĩa của chiến thắng</strong></h2>

<p>C&aacute;c bạn đ&atilde; bao giờ nh&igrave;n thấy được sự &ldquo;chiến thắng&rdquo;? Giờ đ&acirc;y &quot;Chiến thắng&quot; mang một h&igrave;nh dạng mới với&nbsp;<strong>Razer DeathAdder V3</strong>. Được cải tiến v&agrave; ho&agrave;n thiện với sự hỗ trợ của c&aacute;c chuy&ecirc;n gia thể thao điện tử h&agrave;ng đầu, h&igrave;nh thức c&ocirc;ng th&aacute;i học mang t&iacute;nh biểu tượng của n&oacute; giờ đ&acirc;y nhẹ hơn 25% so với người tiền nhiệm, được hỗ trợ bởi một loạt c&aacute;c n&acirc;ng cấp ti&ecirc;n tiến để đẩy giới hạn của lối chơi cạnh tranh.</p>

<p><img alt="" src="https://anphat.com.vn/media/product/44551_razer_deathadder_v3__4_.jpg" /></p>

<h2><strong>C&ocirc;ng nghệ Razer&trade; 8K Hz HyperPolling</strong></h2>

<p>Ưu điểm d&agrave;nh cho những con chuột d&acirc;y l&agrave; tốc độ phản hồi ấn tượng, cho thao t&aacute;c v&agrave; di chuyển cực mượt m&agrave;. Chuột Razer DeathAdder V3 c&oacute; khả năng gửi dữ liệu nhiều hơn tới 8 lần trong một gi&acirc;y, giảm độ trễ đầu v&agrave;o một c&aacute;ch hiệu quả từ 1 xuống 1/8 mili gi&acirc;y. Trong trận chiến quyết định thắng bại chỉ trong 1 t&iacute;ch tắc, đ&acirc;y l&agrave; lợi thế m&agrave; mọi Game thủ cần c&oacute; để chiếm ưu thế trước đối thủ.</p>

<p><img alt="" src="https://assets2.razerzone.com/images/pnx.assets/b1809539ce554ed943d910a31e177411/razer-deathadder-v3-hyperpolling-technology-desktop.jpg" style="height:173px; width:925px" /></p>

<h2><strong>Sự cải tiến thiết kế vượt bậc</strong></h2>

<p><strong>Cấu tr&uacute;c si&ecirc;u nhẹ</strong><br />
Với khả năng tối ưu h&oacute;a trọng lượng đ&aacute;ng kinh ngạc,&nbsp;<strong>Razer DeathAdder V3</strong>&nbsp;l&agrave; một trong những con chuột esports c&ocirc;ng th&aacute;i học nhẹ nhất từng được tạo ra. Một con chuột Gaming chuy&ecirc;n dụng c&oacute; trọng lượng chỉ 59g chắc chắn sẽ cho người d&ugrave;ng trải nghiệm sử dụng cực kỳ thoải m&aacute;i. K&iacute;ch thước chuột cũng kh&ocirc;ng qu&aacute; lớn, kh&aacute; vừa tay với đại đa số Game thủ.</p>

<p><img alt="Mid-to-large sized mouse without weight and drag." src="https://assets2.razerzone.com/images/pnx.assets/57f749b949dd030d0865f29c20f46043/razer-deathadder-v3-no-weight-and-drag.jpg" /></p>

<p><strong>Thiết kế c&ocirc;ng th&aacute;i học</strong><br />
Được ph&aacute;t triển với sự hợp t&aacute;c của c&aacute;c chuy&ecirc;n gia thể thao điện tử h&agrave;ng đầu, h&igrave;nh d&aacute;ng mang t&iacute;nh biểu tượng của Razer DeathAdder đ&atilde; được cải tiến hơn nữa để tối ưu h&oacute;a khả năng xử l&yacute; v&agrave; sự thoải m&aacute;i của Game thủ.</p>

<h2><strong>Cảm biến quang học ch&iacute;nh x&aacute;c nhất thế giới</strong></h2>

<p>Chuột&nbsp;<strong>Razer DeathAdder V3</strong>&nbsp;sở hữu bộ cảm biến quang học RAZER FOCUS PRO 30K ch&iacute;nh x&aacute;c nhất thế giới. Với th&ocirc;ng số DPI l&ecirc;n tới 30,000, RAZER FOCUS PRO 30K hứa hẹn sẽ l&agrave; &ocirc;ng tr&ugrave;m trong ph&acirc;n kh&uacute;c chuột Gaming Hi-end trong một khoảng thời gian d&agrave;i sắp tới.</p>

<p><img alt="ARMED WITH INDUSTRY-LEADING TECH SPECS:" src="https://assets2.razerzone.com/images/pnx.assets/602aea850ab962f593b9fc301b6724d9/razer-deathadder-v3-pro-sensor.jpg" style="height:404px; width:720px" /><br />
Chức năng th&ocirc;ng minh:<br />
-&nbsp;<em><strong>Asymmetric Cut-off:</strong>&nbsp;</em>Nhằm gi&uacute;p c&aacute;c bạn c&oacute; những pha vẩy chuột thần th&aacute;nh, Razer DeathAdder V3 Pro cho ph&eacute;p c&aacute;c bạn điều chỉnh khoảng c&aacute;ch lấy mẫu với 26 mức độ cao chi tiết thay v&igrave; chỉ 3 mức độ như những phi&ecirc;n bản tiền nhiệm.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/24-02-2023/dieu.png" style="height:346px; width:822px" /><br />
-&nbsp;<strong><em>Smart Tracking</em>:</strong>&nbsp;Cảm biến quang học Razer Focus Pro c&oacute; thể duy tr&igrave; khoảng c&aacute;ch n&acirc;ng hạ nhất qu&aacute;n cho d&ugrave; n&oacute; được sử dụng tr&ecirc;n bất k&igrave; bề mặt n&agrave;o, cho ph&eacute;p kiểm so&aacute;t chuột với độ ch&iacute;nh x&aacute;c cao hơn.</p>
', N'DataImageSql/razer_deathadder_(1).jpg', N'5', N'Còn hàng', 17, 15)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (99, N'Laptop Asus ROG Strix G16 G614JVR-N4162W', CAST(N'2024-11-29' AS Date), 52990000, 47691000, 10, N'Laptop Asus ROG Strix G16 G614JVR-N4162W', N'<h2><strong>Laptop Asus ROG Strix G16: Hiệu Suất Đỉnh Cao Cho Game Thủ Chuy&ecirc;n Nghiệp</strong></h2>

<p><a href="https://www.anphatpc.com.vn/laptop-asus-rog-strix-g16-g614jvr-n4162w.html" target="_blank">Laptop Asus ROG Strix G16</a>&nbsp;l&agrave; lựa chọn ho&agrave;n hảo cho những game thủ v&agrave; người d&ugrave;ng cần một chiếc&nbsp;<a href="https://www.anphatpc.com.vn/gaming-laptop.html" target="_blank">laptop</a>&nbsp;mạnh mẽ, hiệu suất cao v&agrave; thiết kế tinh tế. Với cấu h&igrave;nh mạnh mẽ v&agrave; những t&iacute;nh năng nổi bật, chiếc laptop n&agrave;y chắc chắn sẽ đem lại trải nghiệm tuyệt vời cho người d&ugrave;ng. H&atilde;y c&ugrave;ng kh&aacute;m ph&aacute; những đặc điểm nổi bật v&agrave; điểm nhấn của sản phẩm n&agrave;y:</p>

<h3><strong><img alt="" src="https://anphat.com.vn/media/lib/10-07-2024/asusrog.png" /></strong></h3>

<h3><strong>1. Hiệu Suất Mạnh Mẽ</strong></h3>

<ul>
	<li><strong>Bộ vi xử l&yacute; Intel Core i9-14900HX</strong>: Với bộ vi xử l&yacute; Intel Core i9 thế hệ mới nhất, laptop Asus ROG Strix G16 G614JVR-N4162W mang lại hiệu suất xử l&yacute; cực nhanh, đ&aacute;p ứng mọi nhu cầu từ chơi game, đồ họa cho đến c&aacute;c t&aacute;c vụ đa nhiệm phức tạp.</li>
	<li><strong>RAM 32GB</strong>: Được trang bị 32GB RAM, chiếc laptop n&agrave;y đảm bảo khả năng đa nhiệm mượt m&agrave;, gi&uacute;p bạn dễ d&agrave;ng xử l&yacute; nhiều t&aacute;c vụ c&ugrave;ng l&uacute;c m&agrave; kh&ocirc;ng gặp phải hiện tượng giật lag.</li>
</ul>

<h3><strong><img alt="" src="https://anphat.com.vn/media/lib/10-07-2024/asusrog4.png" /></strong></h3>

<h3><strong>2. Đồ Họa Xuất Sắc</strong></h3>

<ul>
	<li><strong>Card đồ họa NVIDIA GeForce RTX 4060</strong>: Với card đồ họa RTX 4060, Asus ROG Strix G16 mang lại khả năng xử l&yacute; đồ họa tuyệt vời, gi&uacute;p bạn chơi những tựa game mới nhất ở cấu h&igrave;nh cao nhất v&agrave; trải nghiệm h&igrave;nh ảnh sống động, sắc n&eacute;t.</li>
	<li><strong>M&agrave;n h&igrave;nh 16 inch QHD+</strong>: M&agrave;n h&igrave;nh 16 inch với độ ph&acirc;n giải QHD+ (2560 x 1600) mang lại h&igrave;nh ảnh sắc n&eacute;t v&agrave; chi tiết, gi&uacute;p bạn thưởng thức mọi nội dung với chất lượng h&igrave;nh ảnh tuyệt vời.</li>
</ul>

<h3><strong>3. Lưu Trữ Rộng R&atilde;i</strong></h3>

<ul>
	<li><strong>Ổ cứng SSD 1TB</strong>: Với ổ cứng SSD dung lượng 1TB, bạn sẽ c&oacute; kh&ocirc;ng gian lưu trữ rộng r&atilde;i cho c&aacute;c tựa game y&ecirc;u th&iacute;ch, phần mềm v&agrave; dữ liệu c&aacute; nh&acirc;n, đồng thời tận hưởng tốc độ khởi động v&agrave; truy xuất dữ liệu nhanh ch&oacute;ng.</li>
</ul>

<h3><strong>4. Hệ Điều H&agrave;nh Hiện Đại</strong></h3>

<ul>
	<li><strong>Windows 11</strong>: Laptop được c&agrave;i đặt sẵn hệ điều h&agrave;nh Windows 11, mang lại giao diện người d&ugrave;ng th&acirc;n thiện, c&ugrave;ng nhiều t&iacute;nh năng v&agrave; cải tiến mới, gi&uacute;p tối ưu h&oacute;a trải nghiệm sử dụng.</li>
</ul>

<h3><strong>5. Thiết Kế Tinh Tế V&agrave; Hiện Đại</strong></h3>

<ul>
	<li><strong>Thiết kế x&aacute;m sang trọng</strong>: Với m&agrave;u x&aacute;m chủ đạo, Asus ROG Strix G16 kh&ocirc;ng chỉ mạnh mẽ về hiệu năng m&agrave; c&ograve;n tinh tế về thiết kế, ph&ugrave; hợp với phong c&aacute;ch của những game thủ hiện đại.</li>
	<li><strong>Hệ thống tản nhiệt ti&ecirc;n tiến</strong>: Hệ thống tản nhiệt hiệu quả gi&uacute;p laptop lu&ocirc;n m&aacute;t mẻ v&agrave; hoạt động ổn định ngay cả khi bạn chơi game trong thời gian d&agrave;i.</li>
</ul>

<p><strong><img alt="" src="https://anphat.com.vn/media/lib/10-07-2024/asurog2.png" /></strong></p>

<p><strong>6. Kết Nối Đa Dạng V&agrave; Tiện Lợi</strong></p>

<ul>
	<li><strong>Kết nối to&agrave;n diện</strong>: Laptop được trang bị đầy đủ c&aacute;c cổng kết nối hiện đại như USB Type-C, HDMI, cổng mạng LAN, gi&uacute;p bạn dễ d&agrave;ng kết nối với c&aacute;c thiết bị ngoại vi v&agrave; mạng internet.</li>
	<li><strong>B&agrave;n ph&iacute;m RGB</strong>: B&agrave;n ph&iacute;m với hệ thống đ&egrave;n nền RGB t&ugrave;y chỉnh, mang lại trải nghiệm g&otilde; ph&iacute;m tuyệt vời v&agrave; tạo kh&ocirc;ng gian chơi game đầy m&agrave;u sắc.</li>
</ul>

<h3><strong><img alt="" src="https://anphat.com.vn/media/lib/10-07-2024/asusrog3.png" /></strong></h3>

<h3><strong>Kết Luận</strong></h3>

<p>Laptop Asus ROG Strix G16 G614JVR-N4162W l&agrave; sự kết hợp ho&agrave;n hảo giữa hiệu suất mạnh mẽ, đồ họa xuất sắc v&agrave; thiết kế hiện đại. Đ&acirc;y chắc chắn l&agrave; lựa chọn l&yacute; tưởng cho những game thủ chuy&ecirc;n nghiệp v&agrave; người d&ugrave;ng cần một chiếc laptop mạnh mẽ để đ&aacute;p ứng mọi nhu cầu c&ocirc;ng việc v&agrave; giải tr&iacute;.</p>

<p>Đặt h&agrave;ng ngay h&ocirc;m nay để trải nghiệm sức mạnh vượt trội của Laptop Asus ROG Strix G16!</p>
', N'DataImageSql/Laptop Asus ROG Strix G16 G614JVR-N4162W(1).jpg', N'10', N'Còn hàng', 4, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (100, N'Laptop ASUS ROG Zephyrus G16 GA605WI-QR156WS', CAST(N'2024-11-28' AS Date), 67990000, 61191000, 10, N'Laptop ASUS ROG Zephyrus G16 GA605WI-QR156WS', N'<h1>Laptop ASUS ROG Zephyrus G16 GA605WI-QR156WS</h1>
', N'DataImageSql/Laptop ASUS ROG Zephyrus G16 GA605WI-QR156WS(1).jpg', N'10', N'Còn hàng', 4, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (101, N'Laptop MSI Cyborg 15 A12UCX-618VN', CAST(N'2024-11-28' AS Date), 19990000, 17991000, 10, N'Laptop MSI Cyborg 15 A12UCX-618VN', N'<h2><strong>Laptop MSI Cyborg 15 A12UCX-618VN&nbsp;</strong></h2>

<h2><strong>Thiết Kế Gaming Bắt Mắt</strong></h2>

<p><strong><img alt="" src="https://anphat.com.vn/media/lib/23-01-2024/laptop-msi-cyborg-15-a12ucx-618vn.jpg" /></strong></p>

<p><strong><a href="https://www.anphatpc.com.vn/laptop-msi-cyborg-15-a12ucx-618vn.html">Laptop MSI Cyborg 15 A12UCX-618VN</a></strong>&nbsp;chắc chắn l&agrave; một trong những t&aacute;c phẩm nghệ thuật của MSI trong thế giới của laptop gaming. Ngay từ c&aacute;i nh&igrave;n đầu ti&ecirc;n, bạn sẽ bị cuốn h&uacute;t bởi thiết kế ấn tượng v&agrave; hiện đại của n&oacute;. Với một vỏ ngo&agrave;i được l&agrave;m chất liệu cứng c&aacute;p bền bỉ, bạn ho&agrave;n to&agrave;n c&oacute; thể y&ecirc;n t&acirc;m sử dụng tại nhiều m&ocirc;i trường kh&aacute;c nhau. Với &aacute;nh s&aacute;ng RGB đa dạng tr&ecirc;n b&agrave;n ph&iacute;m v&agrave; logo MSI,&nbsp;Chiếc&nbsp;<strong><a href="https://www.anphatpc.com.vn/gaming-laptop.html" target="_blank" title="laptop gaming">laptop gaming</a></strong>&nbsp;n&agrave;y đ&atilde;&nbsp;mang lại phong c&aacute;ch độc đ&aacute;o v&agrave; c&aacute; nh&acirc;n h&oacute;a cao cho anh em game thủ.</p>

<p>K&iacute;ch thước của m&aacute;y thuộc loại&nbsp;<strong><a href="https://www.anphatpc.com.vn/laptop-khoang-15-inch_dm2403.html">laptop m&agrave;n h&igrave;nh 15.6 inch</a></strong>&nbsp;phổ biến gi&uacute;p tăng t&iacute;nh cơ động. B&agrave;n ph&iacute;m c&oacute; đ&egrave;n nền RGB cho ph&eacute;p t&ugrave;y chỉnh &aacute;nh s&aacute;ng theo phong c&aacute;ch ri&ecirc;ng của bạn v&agrave; l&agrave;m việc trong m&ocirc;i trường thiếu s&aacute;ng dễ d&agrave;ng. Touchpad rộng lớn v&agrave; cổng th&ocirc;ng hơi ở ph&iacute;a sau l&agrave;m cho m&aacute;y trở n&ecirc;n ho&agrave;n hảo trong mọi kh&iacute;a cạnh.</p>

<h2><strong>Cấu H&igrave;nh&nbsp;Gaming Phổ Th&ocirc;ng</strong></h2>

<p><strong><img alt="" src="https://anphat.com.vn/media/lib/23-01-2024/laptop-msi-cyborg-15-a12ucx-618vn3.jpg" /></strong></p>

<p><strong><a href="https://www.anphatpc.com.vn/laptop-msi-cyborg-15-a12ucx-618vn.html" target="_blank" title="Laptop MSI Cyborg 15 A12UCX-618VN">Laptop MSI Cyborg 15 A12UCX-618VN</a></strong>&nbsp;sở hữu một cấu h&igrave;nh mạnh mẽ để đ&aacute;p ứng mọi nhu cầu của game thủ. Với vi xử l&yacute;&nbsp;<strong>Intel Core i5-12450H</strong>, m&aacute;y c&oacute; khả năng xử l&yacute; đa nhiệm v&agrave; đồ họa cao cấp.&nbsp;<strong>RAM 16GB</strong>&nbsp;gi&uacute;p m&aacute;y chạy mượt m&agrave; v&agrave; đảm bảo hiệu năng ổn định. GPU&nbsp;<strong>NVIDIA GeForce RTX 2050</strong>&nbsp;mạnh mẽ đảm bảo trải nghiệm&nbsp;tốt c&aacute;c tựa game Esport như CS2, League of Legends hay c&aacute;c game online phổ biến kh&aacute;c tr&ecirc;n thị trường.</p>

<h2><strong>M&agrave;n H&igrave;nh Mượt</strong></h2>

<p><img alt="" src="https://anphat.com.vn/media/lib/23-01-2024/laptop-msi-cyborg-15-a12ucx-618vn2.jpg" /></p>

<p>M&agrave;n h&igrave;nh&nbsp;<strong>Full HD 144Hz</strong>&nbsp;của chiếc&nbsp;<strong><a href="https://www.anphatpc.com.vn/laptop-gaming-msi_dm2406.html" target="_blank" title="laptop gaming MSI">laptop gaming MSI</a></strong>&nbsp;n&agrave;y&nbsp;l&agrave; điểm nổi bật kh&aacute;c với khả năng hiển thị h&igrave;nh ảnh sắc n&eacute;t v&agrave; m&agrave;u sắc sống động. Tần số l&agrave;m mới cao gi&uacute;p trải nghiệm chơi game trở n&ecirc;n mượt m&agrave; v&agrave; đ&aacute;p ứng nhanh hơn. Điều n&agrave;y cực kỳ quan trọng trong c&aacute;c tr&ograve; chơi nhanh, nơi mỗi khung h&igrave;nh c&oacute; thể quyết định sự th&agrave;nh bại.</p>

<h2><strong>Hiệu Năng &amp; T&iacute;nh Năng:</strong></h2>

<p><strong><img alt="" src="https://anphat.com.vn/media/lib/23-01-2024/laptop-msi-cyborg-15-a12ucx-618vn1.jpg" /></strong></p>

<p><strong>Laptop MSI Cyborg 15 A12UCX-618VN</strong>&nbsp;kh&ocirc;ng chỉ về cấu h&igrave;nh mạnh mẽ m&agrave; c&ograve;n đi k&egrave;m với nhiều t&iacute;nh năng độc quyền. C&ocirc;ng nghệ l&agrave;m m&aacute;t Cooler Boost gi&uacute;p duy tr&igrave; nhiệt độ hoạt động ổn định, ngăn ngừng đọng nhiệt độ qu&aacute; cao v&agrave; tăng hiệu năng. Hệ thống &acirc;m thanh&nbsp;Stereo mang lại trải nghiệm &acirc;m thanh định hướng r&otilde; r&agrave;ng gi&uacute;p bạn c&oacute; những ph&aacute;n đo&aacute;n ch&iacute;nh x&aacute;c hơn khi chơi game.</p>

<p>Laptop n&agrave;y c&ograve;n hỗ trợ phần mềm Dragon Center của MSI, cho ph&eacute;p bạn t&ugrave;y chỉnh &aacute;nh s&aacute;ng RGB tr&ecirc;n b&agrave;n ph&iacute;m v&agrave; quản l&yacute; hiệu năng m&aacute;y t&iacute;nh dễ d&agrave;ng. M&agrave;n h&igrave;nh 144Hz gi&uacute;p bạn trải nghiệm game mượt m&agrave; hơn, với độ trễ thấp v&agrave; khả năng hiển thị h&igrave;nh ảnh sống động.</p>

<h2><strong>Cổng Kết Nối:</strong></h2>

<p><strong>MSI Cyborg 15 A12UCX-618VN</strong>&nbsp;được trang bị một loạt c&aacute;c cổng kết nối, bao gồm USB-C, USB-A, HDMI v&agrave; jack tai nghe, gi&uacute;p bạn kết nối với c&aacute;c thiết bị ngoại vi v&agrave; m&agrave;n h&igrave;nh một c&aacute;ch dễ d&agrave;ng. Cổng kết nối USB-C, cho ph&eacute;p bạn mở rộng th&ecirc;m c&aacute;c phụ kiện v&agrave; hiển thị ngoại vi một c&aacute;ch nhanh ch&oacute;ng v&agrave; dễ d&agrave;ng.</p>
', N'DataImageSql/Laptop MSI Cyborg 15 A12UCX-618VN(1).jpg', N'10', N'Còn hàng', 4, 13)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (102, N'Laptop MSI Sword 16 HX B14VFKG-460VN', CAST(N'2024-11-28' AS Date), 39990000, 32791800, 10, N'Laptop MSI Sword 16 HX B14VFKG-460VN', N'<h2><strong>Laptop MSI Sword 16 HX B14VFKG-460VN</strong></h2>

<h3><strong>Thiết Kế v&agrave; M&agrave;n H&igrave;nh</strong></h3>

<p><strong><a href="https://www.anphatpc.com.vn/laptop-msi-sword-16-hx-b14vfkg-460vn.html" target="_blank">Laptop MSI Sword 16 HX B14VFKG-460VN</a></strong>&nbsp;sở hữu m&agrave;n h&igrave;nh 16 inch QHD+ (2560 x 1600) với tỉ lệ 16:10, tần số qu&eacute;t 240Hz v&agrave; khả năng t&aacute;i tạo m&agrave;u sắc đạt 100% DCI-P3. Với tấm nền IPS, m&agrave;n h&igrave;nh n&agrave;y kh&ocirc;ng chỉ mang lại trải nghiệm h&igrave;nh ảnh sống động m&agrave; c&ograve;n đảm bảo g&oacute;c nh&igrave;n rộng, ph&ugrave; hợp cho cả việc chơi game v&agrave; l&agrave;m việc đồ họa.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/12-08-2024/laptop-msi-sword-16-hx-b14vfkg-460vn.jpg" /></p>

<h3><strong>Hiệu Năng Mạnh Mẽ</strong></h3>

<p>Được trang bị CPU Intel Core i7-14650HX với xung nhịp l&ecirc;n tới 5.20GHz v&agrave; bộ nhớ đệm 30MB, laptop n&agrave;y đ&aacute;p ứng mọi nhu cầu từ c&ocirc;ng việc nặng đến chơi game. C&ugrave;ng với card đồ họa Geforce RTX 4060 8GB GDDR6, m&aacute;y đảm bảo hiệu năng xử l&yacute; đồ họa mạnh mẽ, đặc biệt l&agrave; khi xử l&yacute; c&aacute;c t&aacute;c vụ li&ecirc;n quan đến AI nhờ c&ocirc;ng nghệ AI TOPS đạt 233.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/12-08-2024/laptop-msi-sword-16-hx-b14vfkg-460vn-1.jpg" /></p>

<h3><strong>Bộ Nhớ v&agrave; Lưu Trữ</strong></h3>

<p>Với RAM 16GB DDR5 5600MHz (c&oacute; thể n&acirc;ng cấp tối đa 64GB),&nbsp;<strong><a href="https://www.anphatpc.com.vn/Laptop-msi_dm1065.html" target="_blank">Laptop MSI</a></strong>&nbsp;Sword 16 HX B14VFKG-460VN mang lại khả năng đa nhiệm ấn tượng. Ổ cứng 1TB NVMe PCIe Gen4x4 đảm bảo tốc độ truy xuất dữ liệu nhanh ch&oacute;ng, c&ugrave;ng với khả năng n&acirc;ng cấp th&ecirc;m một slot SSD tối đa l&ecirc;n đến 2TB, cung cấp kh&ocirc;ng gian lưu trữ rộng r&atilde;i cho người d&ugrave;ng.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/12-08-2024/laptop-msi-sword-16-hx-b14vfkg-460vn-2.jpg" /></p>

<h3><strong>T&iacute;nh Năng Đặc Biệt</strong></h3>

<p>B&agrave;n ph&iacute;m RGB 24 v&ugrave;ng gi&uacute;p tăng trải nghiệm gaming, đồng thời hỗ trợ t&ugrave;y chỉnh &aacute;nh s&aacute;ng theo sở th&iacute;ch c&aacute; nh&acirc;n. Pin 4 cell với dung lượng 65Whr gi&uacute;p đảm bảo thời lượng sử dụng hợp l&yacute; cho c&aacute;c t&aacute;c vụ h&agrave;ng ng&agrave;y. Với trọng lượng chỉ 2.3kg, m&aacute;y dễ d&agrave;ng di chuyển v&agrave; ph&ugrave; hợp cho cả c&ocirc;ng việc lẫn giải tr&iacute;.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/12-08-2024/laptop-msi-sword-16-hx-b14vfkg-460vn-3.jpg" /></p>

<p>Với hiệu năng mạnh mẽ, m&agrave;n h&igrave;nh chất lượng cao v&agrave; t&iacute;nh năng t&ugrave;y biến,&nbsp;<strong><a href="https://www.anphatpc.com.vn/laptop-gaming-msi_dm2406.html" target="_blank">Laptop gaming MSI</a></strong>&nbsp;Sword 16 HX B14VFKG-460VN l&agrave; lựa chọn ho&agrave;n hảo cho game thủ v&agrave; những người cần một chiếc laptop đa năng, mạnh mẽ.</p>
', N'DataImageSql/Laptop MSI Sword 16 HX B14VFKG-460VN(1).jpg', N'18', N'Còn hàng', 4, 13)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (103, N'Laptop GIGABYTE G5 MF5-52VN383SH', CAST(N'2024-11-29' AS Date), 24990000, 22491000, 10, N'Laptop GIGABYTE G5 MF5-52VN383SH', N'<p>L&agrave; một trong những &ocirc;ng lớn đứng đầu ng&agrave;nh đồ c&ocirc;ng nghệ, Gigabyte lu&ocirc;n lu&ocirc;n xuất hiện với những d&ograve;ng sản phẩm mới v&ocirc; c&ugrave;ng ấn tượng v&agrave; ph&ugrave; hợp với nhu cầu kh&aacute;ch h&agrave;ng. Sản xuất m&aacute;y t&iacute;nh c&aacute; nh&acirc;n l&agrave; một trong những ng&agrave;nh trọng điểm của Gigabyte v&agrave; trong lần tr&igrave;nh l&agrave;ng mới n&agrave;y, nh&agrave; sản xuất đ&atilde; cho ra mắt chiếc <strong><a href="https://www.anphatpc.com.vn/laptop-gigabyte-g5-mf5-52vn383sh.html">Laptop GIGABYTE G5 MF5-52VN383SH</a></strong><strong> (Intel Core i5-13500H | 8GB | 512GB | RTX 4050 | 15.6 inch FHD | Win 11 | Đen), </strong>đặc biệt ph&ugrave; hợp với c&aacute;c game thủ c&ugrave;ng những th&ocirc;ng số kỹ thuật hiện đại đ&aacute;ng bất ngờ.&nbsp;Xuất hiện với c&acirc;n nặng l&agrave; 2.08kg, c&ugrave;ng m&agrave;u sắc quen thuộc - m&agrave;u đen sang trọng mang đến cho người d&ugrave;ng một sản phẩm với ngoại h&igrave;nh ưa nh&igrave;n, nhỏ gọn, đặc biệt dễ d&agrave;ng mang theo b&ecirc;n m&igrave;nh với những kh&aacute;ch h&agrave;ng thường xuy&ecirc;n di chuyển.&nbsp;</p>

<p><strong><strong><img alt="" src="https://anphat.com.vn/media/lib/20-03-2024/47728_laptop_gigabyte_g5_mf5_52vn383sh__1_.jpg" style="width:700px" /></strong></strong></p>

<p><strong>Laptop GIGABYTE G5 MF5-52VN383SH </strong>được trang bị bộ vi xử l&yacute; Intel Core i5-13500H (12 nh&acirc;n, 16 luồng, upto 4.70GHz, 18MB) với hiệu năng mạnh mẽ 12 nh&acirc;n v&agrave; 16 luồng gi&uacute;p <strong><a href="https://www.anphatpc.com.vn/cpu-bo-vi-xu-ly.html">CPU</a></strong> xử l&yacute; nhiều t&aacute;c vụ c&ugrave;ng l&uacute;c một c&aacute;ch mượt m&agrave;, c&oacute; thể thực hiện nhiều t&aacute;c vụ nặng như chơi game, chỉnh sửa video, thiết kế đồ họa, lập tr&igrave;nh. Hiệu năng mạnh mẽ xung nhịp tối đa l&ecirc;n đến 4.70 GHz gi&uacute;p CPU xử l&yacute; c&aacute;c t&aacute;c vụ nặng một c&aacute;ch nhanh ch&oacute;ng, bộ nhớ đệm 18 MB gi&uacute;p CPU truy cập dữ liệu nhanh hơn, tăng hiệu suất tổng thể. Vi xử l&yacute; c&oacute; k&iacute;ch thước nhỏ gọn gi&uacute;p cho laptop mỏng nhẹ hơn, dễ d&agrave;ng mang theo b&ecirc;n m&igrave;nh.&nbsp;</p>

<p>Kh&ocirc;ng chỉ vậy, 8GB (1x8GB) DDR5-4800MHz - dung lượng Ram ph&ugrave; hợp c&aacute;c game thủ lưu trữ c&aacute;c t&agrave;i liệu, bao gồm cả dữ liệu h&igrave;nh ảnh, &acirc;m thanh, văn bản... Kh&ocirc;ng chỉ vậy, với dung lượng lớn như vậy, người d&ugrave;ng ho&agrave;n to&agrave;n c&oacute; thể download c&aacute;c d&ograve;ng game giải tr&iacute; kh&aacute;c với đồ họa hiện đại với laptop. Ngo&agrave;i ra, c&ugrave;ng với sự kết hợp của ổ cứng c&oacute; dung lượng kh&aacute; lớn đối với nhu cầu sử dụng của người chơi l&agrave; 512GB SSD Gen4 + 1 PCIe 3.0 Upgrade Slot, sản phẩm tự tin mang đến khả năng đọc ghi dữ liệu nhanh hơn, khả năng tương th&iacute;ch cao v&agrave; hoạt động &ecirc;m &aacute;i.&nbsp;</p>

<p><strong><strong><img alt="" src="https://anphat.com.vn/media/lib/20-03-2024/47728_laptop_gigabyte_g5_mf5_52vn383sh__2_.jpg" style="width:700px" /></strong></strong></p>

<p>M&agrave;n h&igrave;nh của chiếc <strong><a href="https://www.anphatpc.com.vn/laptop-lenovo_dm1059.html">laptop Lenovo</a></strong> n&agrave;y l&agrave; 15.6 inch FHD (1920x1080), gi&uacute;p người d&ugrave;ng c&oacute; những trải nghiệm thị gi&aacute;c tuyệt vời khi sử dụng laptop n&agrave;y<strong>, </strong>sản phẩm hứa hẹn cung cấp h&igrave;nh ảnh với m&agrave;u sắc ch&acirc;n thực, r&otilde; n&eacute;t, chi tiết; mang lại cảm gi&aacute;c thoải m&aacute;i, nhất l&agrave; khi xem phim, video hoặc sử dụng c&aacute;c tr&igrave;nh duyệt thiết kế tr&ecirc;n m&aacute;y t&iacute;nh. B&ecirc;n cạnh đ&oacute;, card m&agrave;n h&igrave;nh NVIDIA GeForce RTX 4050 6GB GDDR6 l&otilde;i Ampere thế hệ mới mang lại hiệu năng mạnh mẽ cho c&aacute;c t&aacute;c vụ đồ họa, cung cấp băng th&ocirc;ng bộ nhớ cao để xử l&yacute; c&aacute;c tập dữ liệu lớn; l&agrave;m tăng độ ph&acirc;n giải của sản phẩm, gi&uacute;p mang lại những h&igrave;nh ảnh chất lượng nhất.&nbsp;</p>

<p>Kh&ocirc;ng chỉ vậy, chiếc <strong><a href="https://www.anphatpc.com.vn/may-tinh-xach-tay-laptop.html">laptop</a></strong> n&agrave;y&nbsp;chắc chắn được ưa chuộng khi b&agrave;n ph&iacute;m sở hữu bố cục hợp l&yacute;, k&iacute;ch thước ph&iacute;m ph&ugrave; hợp với người chơi, h&agrave;nh tr&igrave;nh ph&iacute;m d&agrave;i tạo cảm gi&aacute;c &ecirc;m v&agrave; nhanh hơn khi sử dụng.&nbsp;</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/20-03-2024/47728_laptop_gigabyte_g5_mf5_52vn383sh__4_.jpg" style="width:700px" /></p>

<p>Sản phẩm được hỗ trợ c&aacute;c cổng kết nối cơ bản gi&uacute;p người d&ugrave;ng dễ d&agrave;ng kết nối với c&aacute;c linh kiện v&agrave; nguồn dẫn b&ecirc;n ngo&agrave;i lần lượt gồm 1x USB 2.0 (Type-A) 1x USB3.2 Gen1 (Type-A), 2x USB3.2 Gen2 (Type-C), 1x RJ-45 LAN port, 1 x DC-in Jack, 1x Mini DisplayPort 1.4, 1x HDMI I Output port (with HDCP), 1 x 2-in-1 Audio Jack(Headphone / Microphone). Ngo&agrave;i ra camera ở chiếc laptop n&agrave;y với 1.0M HD video camera sẵn s&agrave;ng cung cấp h&igrave;nh ảnh sắc n&eacute;t khi người d&ugrave;ng sử dụng c&aacute;c tr&igrave;nh duyệt video call &hellip;&nbsp;</p>
', N'DataImageSql/gagibyte_g5_(1).jpg', N'10', N'Còn hàng', 4, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (104, N'Laptop Gigabyte AORUS 16X 9KG-43VNC54SH', CAST(N'2024-11-28' AS Date), 36990000, 33291000, 10, N'Laptop Gigabyte AORUS 16X 9KG-43VNC54SH', N'<h2><strong>Laptop Gigabyte AORUS 16X 9KG-43VNC54SH</strong></h2>

<h3><strong>Hiệu Năng Mạnh Mẽ Với Intel Core i7-13650HX</strong></h3>

<p><strong><a href="https://www.anphatpc.com.vn/laptop-gigabyte-aorus-16x-9kg-43vnc54sh.html" target="_blank">Laptop Gigabyte AORUS 16X 9KG-43VNC54SH</a></strong>&nbsp;được trang bị bộ vi xử l&yacute; Intel Core i7-13650HX với 14 nh&acirc;n (6 P-core v&agrave; 8 E-core) v&agrave; tần số tối đa l&ecirc;n đến 4.9GHz. Với khả năng xử l&yacute; mạnh mẽ, thiết bị n&agrave;y đ&aacute;p ứng tốt c&aacute;c nhu cầu từ c&ocirc;ng việc văn ph&ograve;ng, lập tr&igrave;nh cho đến c&aacute;c tr&ograve; chơi y&ecirc;u cầu cấu h&igrave;nh cao, mang đến trải nghiệm mượt m&agrave; v&agrave; hiệu quả.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/28-08-2024/laptop-gigabyte-aorus-16x-9kg-43vnc54sh-3.jpg" /></p>

<h3><strong>Đồ Họa Ấn Tượng Với NVIDIA GeForce RTX 4060</strong></h3>

<p>M&aacute;y t&iacute;nh n&agrave;y sử dụng card đồ họa NVIDIA GeForce RTX 4060 với 8GB GDDR6, hỗ trợ c&ocirc;ng nghệ AI TOPS l&ecirc;n đến 233. Điều n&agrave;y kh&ocirc;ng chỉ gi&uacute;p tăng cường khả năng xử l&yacute; đồ họa m&agrave; c&ograve;n mang đến trải nghiệm chơi game với h&igrave;nh ảnh sắc n&eacute;t, ch&acirc;n thực nhờ c&aacute;c c&ocirc;ng nghệ như Dolby Vision&reg;, NVIDIA Advanced Optimus, v&agrave; G-SYNC.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/28-08-2024/laptop-gigabyte-aorus-16x-9kg-43vnc54sh.jpg" /></p>

<h3><strong>M&agrave;n H&igrave;nh Sắc N&eacute;t V&agrave; Hiệu Suất H&igrave;nh Ảnh Đỉnh Cao</strong></h3>

<p><strong><a href="https://www.anphatpc.com.vn/laptop-gaming-gigabyte.html" target="_blank">Laptop gaming Gigabyte</a></strong>&nbsp;AORUS 16X sở hữu m&agrave;n h&igrave;nh 16.0 inch với độ ph&acirc;n giải WQXGA (2560x1600) v&agrave; tần số qu&eacute;t 165Hz, mang đến chất lượng hiển thị tuyệt vời cho mọi t&aacute;c vụ. M&agrave;n h&igrave;nh n&agrave;y kh&ocirc;ng chỉ đạt 100% sRGB m&agrave; c&ograve;n được chứng nhận Pantone&reg; Validated, T&Uuml;V Rheinland-certified, gi&uacute;p bảo vệ mắt người d&ugrave;ng v&agrave; đảm bảo độ ch&iacute;nh x&aacute;c m&agrave;u sắc trong c&ocirc;ng việc đồ họa.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/28-08-2024/laptop-gigabyte-aorus-16x-9kg-43vnc54sh-1.jpg" /></p>

<h3><strong>Bộ Nhớ V&agrave; Lưu Trữ Cao Cấp</strong></h3>

<p>Với 16GB RAM DDR5 4800MHz (2x8GB) v&agrave; ổ cứng 1TB SSD PCIe NVMe Gen 4, chiếc laptop n&agrave;y kh&ocirc;ng chỉ đảm bảo tốc độ truy xuất dữ liệu nhanh ch&oacute;ng m&agrave; c&ograve;n cung cấp kh&ocirc;ng gian lưu trữ lớn. Điều n&agrave;y gi&uacute;p người d&ugrave;ng c&oacute; thể l&agrave;m việc với c&aacute;c tệp tin lớn m&agrave; kh&ocirc;ng gặp trở ngại, đồng thời tăng cường trải nghiệm chơi game mượt m&agrave;.</p>

<p><img alt="" src="https://anphat.com.vn/media/lib/28-08-2024/laptop-gigabyte-aorus-16x-9kg-43vnc54sh-2.jpg" /></p>

<h3><strong>Thiết Kế Hiện Đại V&agrave; Pin Dung Lượng Lớn</strong></h3>

<p>Gigabyte AORUS 16X 9KG-43VNC54SH c&oacute; thiết kế mạnh mẽ với m&agrave;u sắc x&aacute;m tinh tế. Với trọng lượng chỉ 2.3 kg, m&aacute;y t&iacute;nh n&agrave;y kh&aacute; nhẹ nh&agrave;ng v&agrave; dễ d&agrave;ng mang theo trong c&aacute;c chuyến c&ocirc;ng t&aacute;c hay di chuyển h&agrave;ng ng&agrave;y. Pin dung lượng 99Wh cung cấp thời lượng sử dụng l&acirc;u d&agrave;i, gi&uacute;p bạn y&ecirc;n t&acirc;m l&agrave;m việc m&agrave; kh&ocirc;ng lo hết pin giữa chừng.</p>

<p><strong><a href="https://www.anphatpc.com.vn/gaming-laptop.html" target="_blank">Laptop gaming</a></strong>&nbsp;Gigabyte AORUS 16X 9KG-43VNC54SH l&agrave; sự lựa chọn ho&agrave;n hảo cho những ai t&igrave;m kiếm một thiết bị mạnh mẽ để chơi game v&agrave; l&agrave;m việc chuy&ecirc;n nghiệp. Với sự kết hợp giữa hiệu năng mạnh mẽ, khả năng đồ họa ấn tượng v&agrave; thiết kế hiện đại, đ&acirc;y ch&iacute;nh l&agrave; c&ocirc;ng cụ l&yacute; tưởng để đ&aacute;p ứng mọi nhu cầu của bạn.</p>
', N'DataImageSql/gigabyte_16X_(1).jpg', N'10', N'Còn hàng', 4, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [NgayNhap], [GiaTien], [GiaTienDaKhuyenMai], [SoLuong], [MoTa], [MoTaSanPham], [HinhAnh], [GiamGia], [TinhTrangSP], [MaLoai], [MaNCC]) VALUES (105, N'ROG Zephyrus G14 GA403UU-QS101W', CAST(N'2024-11-28' AS Date), 54990000, 49491000, 10, N'ROG Zephyrus G14 GA403UU-QS101W', N'<p>Laptop gaming ROG Nebula OLED 14-inch mạnh nhất</p>

<p>Laptop gaming OLED ROG Zephyrus G14 (2024) GA403UU-QS101W với thiết kế m&agrave;u Trắng Platinum c&ugrave;ng dải ch&eacute;o Slash Lighting LED ho&agrave;n to&agrave;n mới, mỏng nhẹ chỉ 1.5kg, sở hữu hiệu năng mạnh mẽ với AMD Ryzen&trade; 9 8945HS mới nhất v&agrave; GPU NVIDIA GeForce RTX 4050, gi&uacute;p bạn dễ d&agrave;ng thống trị c&aacute;c tựa game AAA bom tấn hiện nay tr&ecirc;n m&agrave;n h&igrave;nh OLED 16:10 đạt chuẩn ROG Nebula Display, độ ph&acirc;n giải 3K 120Hz/0.2ms cho h&igrave;nh ảnh mượt m&agrave;, m&agrave;u sắc ch&acirc;n thực v&agrave; sống động.</p>

<ul>
	<li>Bộ vi xử l&yacute; AMD Ryzen&trade; 9 8945HS Processor 4GHz (24MB Cache, up to 5.2 GHz, 8 cores, 16 Threads) t&iacute;ch hợp AMD Ryzen&trade; AI up to 39 TOPs</li>
	<li>Đồ họa NVIDIA GeForce RTX 4050 6GB GDDR6 với MUX Switch + NVIDIA&reg; Advanced Optimus</li>
	<li>Bộ nhớ RAM tối da 32GB LPDDR5X 6400 on board</li>
	<li>Ổ SSD 512TB PCIe&reg; 4.0 NVMe&trade; M.2 SSD</li>
	<li>M&agrave;n h&igrave;nh OLED 3K 16:10 (2880 x 1800) 120Hz 0.2ms, 100% DCI-P3, m&agrave;n h&igrave;nh b&oacute;ng, G-Sync, đạt chuẩn Pantone, ROG Nebula Display</li>
	<li>C&ocirc;ng nghệ tản nhiệt 3 quạt &amp; keo tản nhiệt kim loại lỏng gi&uacute;p tản nhiệt hiệu quả giảm đến 10&deg;C cho cả CPU v&agrave; GPU​</li>
	<li>Thiết kế khung kim loại si&ecirc;u mỏng 1.59cm với vỏ nh&ocirc;m CNC nguy&ecirc;n khối c&ugrave;ng kỹ thuật chế t&aacute;c bậc thầy mang đến sự chắc chắn v&agrave; bền bỉ, gi&uacute;p dễ d&agrave;ng mang theo v&agrave; sử dụng ở bất cứ đ&acirc;u</li>
	<li>Dung lượng pin lớn 90Whr k&eacute;o d&agrave;i thời gian l&agrave;m việc</li>
	<li>Miễn ph&iacute; 3 th&aacute;ng PC Game Pass với nhiều tựa game PC hấp dẫn</li>
</ul>
', N'DataImageSql/rog_zephyrus_(1).jpg', N'10', N'Còn hàng', 4, 4)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[TinTuc] ON 

INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [NgayDang], [TacGia], [HinhAnh], [TrangThai], [TrangDang]) VALUES (1, N'Banner', N'123', CAST(N'2024-11-28' AS Date), N'Phan Duy Lộc', N'DataImageSql/1801_1-04.jpg', N'Hiện', N'Trang chủ/Banner')
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [NgayDang], [TacGia], [HinhAnh], [TrangThai], [TrangDang]) VALUES (2, N'123', N'123', CAST(N'2024-11-28' AS Date), N'Phan Duy Lộc', N'DataImageSql/8853_ctkm_phu_kien_apple_thang4.jpg', N'Hiện', N'Trang chủ/Banner')
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [NgayDang], [TacGia], [HinhAnh], [TrangThai], [TrangDang]) VALUES (3, N'Banner', N'123', CAST(N'2024-11-29' AS Date), N'Phan Duy Lộc', N'DataImageSql/mau-banner-cong-nghe-3.jpg', N'Hiện', N'Trang chủ/Banner')
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [NgayDang], [TacGia], [HinhAnh], [TrangThai], [TrangDang]) VALUES (4, N'123', N'123', CAST(N'2024-11-29' AS Date), N'Phan Duy Lộc', N'DataImageSql/b7ff21f48b41244b6c0a7d935cdd5820.png', N'Hiện', N'Trang chủ/Banner')
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [NgayDang], [TacGia], [HinhAnh], [TrangThai], [TrangDang]) VALUES (5, N'5', N'123', CAST(N'2024-11-29' AS Date), N'Phan Duy Lộc', N'DataImageSql/1200x628_Banner-KM-3-1.jpg', N'Nổi bật', N'Sales')
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [NgayDang], [TacGia], [HinhAnh], [TrangThai], [TrangDang]) VALUES (6, N'Code Gomu Huyền Thoại', N'Code Gomu Huyền Thoại Huyền Thoại Trở Lại', CAST(N'2024-11-29' AS Date), N'Phan Duy Lộc', N'DataImageSql/code-gomu-huyen-thoai-moi-nhat-2023-cap-nhat-thuong-xuyen-640-360-640x360.jpg', N'Hiện', N'Trang chủ')
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [NgayDang], [TacGia], [HinhAnh], [TrangThai], [TrangDang]) VALUES (7, N'Đăng nhập Zalo', N'Đăng nhập Zalo', CAST(N'2024-11-28' AS Date), N'Phan Duy Lộc', N'DataImageSql/dang-nha-zalo-web-thumb.jpg', N'Hiện', N'Trang chủ')
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [NgayDang], [TacGia], [HinhAnh], [TrangThai], [TrangDang]) VALUES (8, N'GetLink là gì ?', N'GetLink là gì ? ', CAST(N'2024-11-28' AS Date), N'Phan Duy Lộc', N'DataImageSql/GETLINK-2.jpg', N'Hiện', N'Trang chủ')
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [NgayDang], [TacGia], [HinhAnh], [TrangThai], [TrangDang]) VALUES (9, N'Sale 50%', N'Giảm sập sàn 50%', CAST(N'2024-11-29' AS Date), N'Phan Duy Lộc', N'DataImageSql/sale_800x450.jpg', N'Hiện', N'Trang chủ')
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [NgayDang], [TacGia], [HinhAnh], [TrangThai], [TrangDang]) VALUES (10, N'GetLink là gì ?', N'GetLink là gì ? cách lấy getlink', CAST(N'2024-11-28' AS Date), N'Phan Duy Lộc', N'DataImageSql/GETLINK-2.jpg', N'Hiện', N'Tin tức')
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [NgayDang], [TacGia], [HinhAnh], [TrangThai], [TrangDang]) VALUES (11, N'Top 5 game sinh tồn', N'Top 5 game sinh tồn đáng chơi nhất', CAST(N'2024-11-29' AS Date), N'Phan Duy Lộc', N'DataImageSql/hq720.jpg', N'Hiện', N'Tin tức')
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [NgayDang], [TacGia], [HinhAnh], [TrangThai], [TrangDang]) VALUES (12, N'Code Gomu Huyền Thoại', N'Code gomu huyền thoại', CAST(N'2024-11-28' AS Date), N'Phan Duy Lộc', N'DataImageSql/code-gomu-huyen-thoai-moi-nhat-2023-cap-nhat-thuong-xuyen-640-360-640x360.jpg', N'Hiện', N'Tin tức')
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [NgayDang], [TacGia], [HinhAnh], [TrangThai], [TrangDang]) VALUES (13, N'Đăng nhập Zalo', N'Đăng nhập zalo', CAST(N'2024-11-28' AS Date), N'Phan Duy Lộc', N'DataImageSql/dang-nha-zalo-web-thumb.jpg', N'Hiện', N'Tin tức')
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [NgayDang], [TacGia], [HinhAnh], [TrangThai], [TrangDang]) VALUES (14, N'TOP 9+ web kiếm tiền online không cần vốn, phù hợp nhiều đối tượng', N'TOP 9+ web kiếm tiền online không cần vốn, phù hợp nhiều đối tượng', CAST(N'2024-11-29' AS Date), N'Phan Duy Lộc', N'DataImageSql/Top 9 web kiếm tiền.jpg', N'Hiện', N'Tin tức')
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [NgayDang], [TacGia], [HinhAnh], [TrangThai], [TrangDang]) VALUES (15, N'Tổng hợp list code Gym League mới nhất tháng 11/2024', N'Tổng hợp list code Gym League mới nhất tháng 11/2024', CAST(N'2024-11-29' AS Date), N'Phan Duy Lộc', N'DataImageSql/Gym League.jpg', N'Hiện', N'Tin tức')
SET IDENTITY_INSERT [dbo].[TinTuc] OFF
GO
ALTER TABLE [dbo].[DonHang] ADD  DEFAULT (getdate()) FOR [NgayDat]
GO
ALTER TABLE [dbo].[YeuThich] ADD  DEFAULT (getdate()) FOR [NgayThemVao]
GO
ALTER TABLE [dbo].[AnhSP]  WITH CHECK ADD FOREIGN KEY([MASP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([MaDH])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MAKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiHang] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[YeuThich]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[YeuThich]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
USE [master]
GO
ALTER DATABASE [TechWorld] SET  READ_WRITE 
GO
