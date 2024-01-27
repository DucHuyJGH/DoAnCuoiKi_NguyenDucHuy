USE [master]
GO
/****** Object:  Database [CHBHTH]    Script Date: 01/27/2024 2:54:31 PM ******/
CREATE DATABASE [CHBHTH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CHBHTH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.DUCHUY\MSSQL\DATA\CHBHTH.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CHBHTH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.DUCHUY\MSSQL\DATA\CHBHTH_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CHBHTH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CHBHTH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CHBHTH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CHBHTH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CHBHTH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CHBHTH] SET ARITHABORT OFF 
GO
ALTER DATABASE [CHBHTH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CHBHTH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CHBHTH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CHBHTH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CHBHTH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CHBHTH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CHBHTH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CHBHTH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CHBHTH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CHBHTH] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CHBHTH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CHBHTH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CHBHTH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CHBHTH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CHBHTH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CHBHTH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CHBHTH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CHBHTH] SET RECOVERY FULL 
GO
ALTER DATABASE [CHBHTH] SET  MULTI_USER 
GO
ALTER DATABASE [CHBHTH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CHBHTH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CHBHTH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CHBHTH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CHBHTH] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CHBHTH] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CHBHTH', N'ON'
GO
ALTER DATABASE [CHBHTH] SET QUERY_STORE = ON
GO
ALTER DATABASE [CHBHTH] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CHBHTH]
GO
/****** Object:  User [admin]    Script Date: 01/27/2024 2:54:31 PM ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [admin]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [admin]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [admin]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [admin]
GO
ALTER ROLE [db_datareader] ADD MEMBER [admin]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [admin]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [admin]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [admin]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 01/27/2024 2:54:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[CTMaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaDon] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
	[ThanhTien] [decimal](18, 0) NULL,
	[PhuongThucThanhToan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CTMaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 01/27/2024 2:54:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[Madon] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [datetime] NULL,
	[TinhTrang] [int] NULL,
	[ThanhToan] [int] NULL,
	[DiaChiNhanHang] [nvarchar](100) NULL,
	[MaNguoiDung] [int] NULL,
	[TongTien] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[Madon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiHang]    Script Date: 01/27/2024 2:54:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiHang](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 01/27/2024 2:54:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 01/27/2024 2:54:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[IDQuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 01/27/2024 2:54:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](100) NULL,
	[GiaBan] [decimal](18, 0) NULL,
	[Soluong] [int] NULL,
	[MoTa] [ntext] NULL,
	[MaLoai] [int] NULL,
	[MaNCC] [int] NULL,
	[AnhSP] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 01/27/2024 2:54:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Dienthoai] [varchar](50) NULL,
	[Matkhau] [varchar](50) NULL,
	[IDQuyen] [int] NULL,
	[Diachi] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 01/27/2024 2:54:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[MaTT] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](100) NULL,
	[NoiDung] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] ON 

INSERT [dbo].[ChiTietDonHang] ([CTMaDon], [MaDon], [MaSP], [SoLuong], [DonGia], [ThanhTien], [PhuongThucThanhToan]) VALUES (1, 1, 2, 1, CAST(5000 AS Decimal(18, 0)), CAST(5000 AS Decimal(18, 0)), 1)
INSERT [dbo].[ChiTietDonHang] ([CTMaDon], [MaDon], [MaSP], [SoLuong], [DonGia], [ThanhTien], [PhuongThucThanhToan]) VALUES (2, 1, 3, 1, CAST(22000 AS Decimal(18, 0)), CAST(22000 AS Decimal(18, 0)), 1)
INSERT [dbo].[ChiTietDonHang] ([CTMaDon], [MaDon], [MaSP], [SoLuong], [DonGia], [ThanhTien], [PhuongThucThanhToan]) VALUES (3, 2, 1, 1, CAST(18000 AS Decimal(18, 0)), CAST(18000 AS Decimal(18, 0)), 1)
INSERT [dbo].[ChiTietDonHang] ([CTMaDon], [MaDon], [MaSP], [SoLuong], [DonGia], [ThanhTien], [PhuongThucThanhToan]) VALUES (4, 3, 1, 1, CAST(180000 AS Decimal(18, 0)), CAST(180000 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([Madon], [NgayDat], [TinhTrang], [ThanhToan], [DiaChiNhanHang], [MaNguoiDung], [TongTien]) VALUES (1, CAST(N'2023-02-07T00:00:00.000' AS DateTime), 1, 1, N'Đại Học VLUTE', 2, CAST(27000 AS Decimal(18, 0)))
INSERT [dbo].[DonHang] ([Madon], [NgayDat], [TinhTrang], [ThanhToan], [DiaChiNhanHang], [MaNguoiDung], [TongTien]) VALUES (2, CAST(N'2023-02-07T00:00:00.000' AS DateTime), NULL, 1, N'Vũng Liêm', 2, CAST(18000 AS Decimal(18, 0)))
INSERT [dbo].[DonHang] ([Madon], [NgayDat], [TinhTrang], [ThanhToan], [DiaChiNhanHang], [MaNguoiDung], [TongTien]) VALUES (3, CAST(N'2024-01-22T10:21:31.280' AS DateTime), NULL, 1, N'Dong Nai', 2, CAST(180000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiHang] ON 

INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai]) VALUES (1, N'Hoa Hồng')
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai]) VALUES (2, N'Hoa Sen')
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai]) VALUES (3, N'Hoa Ly')
SET IDENTITY_INSERT [dbo].[LoaiHang] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (1, N'CT Dương Thị')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (2, N'CT Kim Thủy')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC]) VALUES (3, N'CT Ngọc Huyền')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO
SET IDENTITY_INSERT [dbo].[PhanQuyen] ON 

INSERT [dbo].[PhanQuyen] ([IDQuyen], [TenQuyen]) VALUES (1, N'Adminstrator')
INSERT [dbo].[PhanQuyen] ([IDQuyen], [TenQuyen]) VALUES (2, N'Member')
SET IDENTITY_INSERT [dbo].[PhanQuyen] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [Soluong], [MoTa], [MaLoai], [MaNCC], [AnhSP]) VALUES (1, N'Hoa Hồng', CAST(180000 AS Decimal(18, 0)), 10, N'Bó hoa hồng đỏ tươi, đầy sức sống và quyến rũ.', 1, 3, N'\Images\HoaHong.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [Soluong], [MoTa], [MaLoai], [MaNCC], [AnhSP]) VALUES (2, N'Hoa Sen', CAST(500000 AS Decimal(18, 0)), 10, N'Bó hoa mang đến sự thanh nhã và tĩnh lặng. ', 2, 2, N'\Images\HoaSen.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [Soluong], [MoTa], [MaLoai], [MaNCC], [AnhSP]) VALUES (3, N'Hoa Ly ', CAST(220000 AS Decimal(18, 0)), 10, N'Bó hoa mang đến sự diệu dàng', 3, 1, N'\Images\HoaLy.jpg')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (1, N'DucHuy', N'Admin@gmail.com', N'0904596810', N'123456', 1, N'Đồng Nai')
INSERT [dbo].[TaiKhoan] ([MaNguoiDung], [HoTen], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (2, N'Nguyễn Văn A', N'nguyenvana@gmail.com', N'0123456789', N'123456', 2, N'Vũng Liêm')
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
SET IDENTITY_INSERT [dbo].[TinTuc] ON 

INSERT [dbo].[TinTuc] ([MaTT], [TieuDe], [NoiDung]) VALUES (1, N'Hoa đẹp cuộc sống thêm đẹp', N'Biến Những Dịp Đặc Biệt Thành Những Khoảng Khắc Đẹp Nhất!')
SET IDENTITY_INSERT [dbo].[TinTuc] OFF
GO
ALTER TABLE [dbo].[LoaiHang] ADD  DEFAULT (NULL) FOR [TenLoai]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_cthd_hd] FOREIGN KEY([MaDon])
REFERENCES [dbo].[DonHang] ([Madon])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_cthd_hd]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_cthd_sp] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_cthd_sp]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_hd_tk] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[TaiKhoan] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_hd_tk]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_sp_loai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiHang] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_sp_loai]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_sp_ncc] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_sp_ncc]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_tk_pq] FOREIGN KEY([IDQuyen])
REFERENCES [dbo].[PhanQuyen] ([IDQuyen])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_tk_pq]
GO
USE [master]
GO
ALTER DATABASE [CHBHTH] SET  READ_WRITE 
GO
