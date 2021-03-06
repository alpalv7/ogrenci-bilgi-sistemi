USE [master]
GO
/****** Object:  Database [ogrenciIsleri]    Script Date: 6.07.2020 19:12:40 ******/
CREATE DATABASE [ogrenciIsleri]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ogrenciIsleri', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ogrenciIsleri.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ogrenciIsleri_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ogrenciIsleri_1.ldf' , SIZE = 3840KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ogrenciIsleri] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ogrenciIsleri].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ogrenciIsleri] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ogrenciIsleri] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ogrenciIsleri] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ogrenciIsleri] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ogrenciIsleri] SET ARITHABORT OFF 
GO
ALTER DATABASE [ogrenciIsleri] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ogrenciIsleri] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ogrenciIsleri] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ogrenciIsleri] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ogrenciIsleri] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ogrenciIsleri] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ogrenciIsleri] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ogrenciIsleri] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ogrenciIsleri] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ogrenciIsleri] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ogrenciIsleri] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ogrenciIsleri] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ogrenciIsleri] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ogrenciIsleri] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ogrenciIsleri] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ogrenciIsleri] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ogrenciIsleri] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ogrenciIsleri] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ogrenciIsleri] SET  MULTI_USER 
GO
ALTER DATABASE [ogrenciIsleri] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ogrenciIsleri] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ogrenciIsleri] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ogrenciIsleri] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ogrenciIsleri] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ogrenciIsleri', N'ON'
GO
ALTER DATABASE [ogrenciIsleri] SET QUERY_STORE = OFF
GO
USE [ogrenciIsleri]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ogrenciIsleri]
GO
/****** Object:  Table [dbo].[bolumler]    Script Date: 6.07.2020 19:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bolumler](
	[bolumID] [int] IDENTITY(1,1) NOT NULL,
	[bolumAdi] [nvarchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[danisman]    Script Date: 6.07.2020 19:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[danisman](
	[danismanID] [int] IDENTITY(1,1) NOT NULL,
	[bolumID] [int] NULL,
	[ad] [nvarchar](30) NULL,
	[soyad] [nvarchar](30) NULL,
	[tc] [nvarchar](11) NULL,
	[kullaniciAdi] [nvarchar](20) NULL,
	[sifre] [nvarchar](20) NULL,
	[tur] [bit] NULL,
 CONSTRAINT [PK_danisman] PRIMARY KEY CLUSTERED 
(
	[danismanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ders_program]    Script Date: 6.07.2020 19:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ders_program](
	[programID] [int] IDENTITY(1,1) NOT NULL,
	[dersID] [int] NULL,
	[bolumID] [nchar](10) NULL,
	[gun] [date] NULL,
	[saat] [time](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dersler]    Script Date: 6.07.2020 19:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dersler](
	[dersID] [int] IDENTITY(1,1) NOT NULL,
	[bolumID] [int] NULL,
	[donem] [int] NULL,
	[dersAdi] [nvarchar](30) NULL,
	[kredi] [int] NULL,
	[ogr_dns] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dersSecim]    Script Date: 6.07.2020 19:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dersSecim](
	[derssecID] [int] IDENTITY(1,1) NOT NULL,
	[dersID] [int] NULL,
	[ogrID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ogrenci]    Script Date: 6.07.2020 19:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ogrenci](
	[ogrID] [int] IDENTITY(1,1) NOT NULL,
	[bolumID] [int] NULL,
	[ad] [nvarchar](30) NULL,
	[soyad] [nvarchar](30) NULL,
	[numara] [nvarchar](9) NULL,
	[tc] [nvarchar](11) NULL,
	[kullaniciAdi] [nvarchar](15) NULL,
	[sifre] [nvarchar](15) NULL,
	[donem] [int] NULL,
	[onay] [bit] NULL,
 CONSTRAINT [PK_ogrenci] PRIMARY KEY CLUSTERED 
(
	[ogrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[secmeliDersler]    Script Date: 6.07.2020 19:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[secmeliDersler](
	[secID] [int] IDENTITY(1,1) NOT NULL,
	[dersadi] [nvarchar](30) NULL,
	[donem] [int] NULL,
	[kredi] [nchar](10) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bolumler] ON 

INSERT [dbo].[bolumler] ([bolumID], [bolumAdi]) VALUES (1, N'Bilişim Teknolojileri')
INSERT [dbo].[bolumler] ([bolumID], [bolumAdi]) VALUES (2, N'Halkla İlişkiler')
INSERT [dbo].[bolumler] ([bolumID], [bolumAdi]) VALUES (3, N'Grafik Tasarım')
SET IDENTITY_INSERT [dbo].[bolumler] OFF
GO
SET IDENTITY_INSERT [dbo].[danisman] ON 

INSERT [dbo].[danisman] ([danismanID], [bolumID], [ad], [soyad], [tc], [kullaniciAdi], [sifre], [tur]) VALUES (1, 1, N'Aybike', N'ŞİMŞEK', N'64684646541', N'aybike', N'123', 1)
INSERT [dbo].[danisman] ([danismanID], [bolumID], [ad], [soyad], [tc], [kullaniciAdi], [sifre], [tur]) VALUES (2, 1, N'Tuba', N'PALA', N'44864486444', N'tuba', N'87', 0)
INSERT [dbo].[danisman] ([danismanID], [bolumID], [ad], [soyad], [tc], [kullaniciAdi], [sifre], [tur]) VALUES (3, 1, N'Beytullah', N'BOZALİ', N'87456846436', N'beto', N'77', 0)
INSERT [dbo].[danisman] ([danismanID], [bolumID], [ad], [soyad], [tc], [kullaniciAdi], [sifre], [tur]) VALUES (4, 2, N'Nalan', N'BARAZ', N'46484987461', N'nalo', N'878', 1)
INSERT [dbo].[danisman] ([danismanID], [bolumID], [ad], [soyad], [tc], [kullaniciAdi], [sifre], [tur]) VALUES (5, 2, N'Süleyman', N'AKDEMİR', N'45468489464', N'sülo', N'45', 0)
INSERT [dbo].[danisman] ([danismanID], [bolumID], [ad], [soyad], [tc], [kullaniciAdi], [sifre], [tur]) VALUES (6, 3, N'Oğuzhan', N'ALAKAŞ', N'87841648466', N'oğuz', N'32', 1)
INSERT [dbo].[danisman] ([danismanID], [bolumID], [ad], [soyad], [tc], [kullaniciAdi], [sifre], [tur]) VALUES (7, 3, N'Mehmet', N'ARAS', N'15316846446', N'memo', N'52', 0)
INSERT [dbo].[danisman] ([danismanID], [bolumID], [ad], [soyad], [tc], [kullaniciAdi], [sifre], [tur]) VALUES (8, 2, N'Nurcan', N'TURAN', N'48648496544', N'nuro', N'78', 0)
INSERT [dbo].[danisman] ([danismanID], [bolumID], [ad], [soyad], [tc], [kullaniciAdi], [sifre], [tur]) VALUES (9, 3, N'Ali', N'ALKAN', N'84684684646', N'Ali', N'12', 0)
INSERT [dbo].[danisman] ([danismanID], [bolumID], [ad], [soyad], [tc], [kullaniciAdi], [sifre], [tur]) VALUES (10, 2, N'Barak', N'OBAMA', N'98498444977', N'ABD', N'israel', 0)
INSERT [dbo].[danisman] ([danismanID], [bolumID], [ad], [soyad], [tc], [kullaniciAdi], [sifre], [tur]) VALUES (11, 3, N'Viladimir', N'PUTİN', N'74561114864', N'F16', N'nataşa', 0)
INSERT [dbo].[danisman] ([danismanID], [bolumID], [ad], [soyad], [tc], [kullaniciAdi], [sifre], [tur]) VALUES (12, 1, N'Beşar', N'ESAT', N'74451165414', N'katil', N'hain', 1)
INSERT [dbo].[danisman] ([danismanID], [bolumID], [ad], [soyad], [tc], [kullaniciAdi], [sifre], [tur]) VALUES (13, 3, N'Aleyna', N'TİLKİ', N'46465465449', N'popi', N'16', 1)
SET IDENTITY_INSERT [dbo].[danisman] OFF
GO
SET IDENTITY_INSERT [dbo].[ders_program] ON 

INSERT [dbo].[ders_program] ([programID], [dersID], [bolumID], [gun], [saat]) VALUES (1, NULL, NULL, NULL, CAST(N'12:55:00' AS Time))
SET IDENTITY_INSERT [dbo].[ders_program] OFF
GO
SET IDENTITY_INSERT [dbo].[dersler] ON 

INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (1, 1, 3, N'Görsel 2', 4, 1)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (2, 1, 3, N'Nesne Tabanlı', 4, 1)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (3, 1, 3, N'İnternet Programcılığı', 4, 1)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (4, 1, 3, N'C Programlama', 4, 2)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (21, 1, 1, N'Görsel 3', 6, 1)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (6, 1, 1, N'Araştırma Yöntem ve Teknikleri', 3, 1)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (7, 1, 1, N'Görsel Programlama', 4, 2)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (22, 1, 1, N'Veri Tabanı 2', 2, 2)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (23, 0, 1, N'Matematik', 4, 2)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (24, 0, 1, N'İngilizce', 2, 4)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (11, 1, 2, N'Veri Tabanı 1', 4, 7)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (33, 2, 1, N'Halk İlişkileri', 4, 7)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (13, 1, 2, N'Görsel 1', 4, 7)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (14, 1, 2, N'Bilgisayar Donanımı', 4, 3)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (15, 1, 2, N'İşçi Sağlığı', 2, 7)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (16, 1, 4, N'Visual Basic', 3, 8)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (17, 1, 4, N'Meslek Etiği', 3, 3)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (18, 1, 4, N'Biilişim Okumaları', 3, 3)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (19, 1, 4, N'Ağ Temelleri', 4, 3)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (26, 0, 2, N'Ofis Yazılımları', 4, 4)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (27, 0, 3, N'Mesleki Matematik', 4, 4)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (28, 0, 3, N'Mesleki İngilizce', 2, 4)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (29, 0, 1, N'Tarih 1', 2, 5)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (30, 0, 2, N'Tarih 2', 2, 5)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (31, 0, 2, N'Girişimcilik', 4, 5)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (32, 0, 4, N'İngilizce 2', 2, 5)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (34, 2, 1, N'Temel Halk İlişkileri', 4, 6)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (35, 2, 1, N'İletşim', 2, 6)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (36, 2, 1, N'Toplum Ve Sağlık', 4, 6)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (37, 2, 1, N'Pazarlama Yöntem ve Teknikleri', 6, 6)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (38, 2, 2, N'Temel Halk İlişkileri II', 6, 8)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (39, 2, 2, N'İletşim II', 6, 8)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (40, 2, 2, N'Toplum Ve Sağlık II', 6, 8)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (45, 2, 2, N'Pazarlama Yöntem ve Teknikleri', 4, 9)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (46, 2, 3, N'Temel İletişim I', 6, 9)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (47, 2, 3, N'Özgür Basın', 4, 9)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (48, 2, 3, N'Demokrasi', 6, 9)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (49, 2, 3, N'Klasik Basın Esasları', 4, 10)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (50, 2, 4, N'Temel İletişim II', 6, 10)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (51, 2, 4, N'Özgür Basın II', 4, 10)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (52, 2, 4, N'Demokrasi', 6, 10)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (53, 2, 4, N'Klasik Basın Esasları', 6, 11)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (54, 3, 1, N'Grafik Tasarım Esasları', 4, 11)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (55, 3, 1, N'Photoshop', 4, 11)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (56, 3, 1, N'Flash Professionel', 4, 11)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (57, 3, 1, N'El Becerileri ', 4, 12)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (58, 3, 2, N'Grafik Tasarım Esasları II', 4, 12)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (59, 3, 2, N'Photoshop II', 4, 12)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (60, 3, 2, N'Flash Professionel II', 4, 12)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (61, 3, 2, N'El Becerileri II', 4, 12)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (62, 3, 3, N'İleri Seviye Photoshop', 6, 13)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (63, 3, 3, N'Grafik Tasarım', 4, 13)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (64, 3, 3, N'Gönyeli Çizim', 4, 13)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (65, 3, 3, N'Siyah Tonlama', 2, 13)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (66, 3, 4, N'İleri Seviye Photoshop II', 4, 13)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (67, 3, 4, N'Grafik Tasarım II', 4, 3)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (68, 3, 4, N'Gönyeli Çizim II', 4, 4)
INSERT [dbo].[dersler] ([dersID], [bolumID], [donem], [dersAdi], [kredi], [ogr_dns]) VALUES (69, 3, 4, N'Siyah Tonlama II', 6, 5)
SET IDENTITY_INSERT [dbo].[dersler] OFF
GO
SET IDENTITY_INSERT [dbo].[dersSecim] ON 

INSERT [dbo].[dersSecim] ([derssecID], [dersID], [ogrID]) VALUES (5, 23, 2)
INSERT [dbo].[dersSecim] ([derssecID], [dersID], [ogrID]) VALUES (6, 7, 2)
INSERT [dbo].[dersSecim] ([derssecID], [dersID], [ogrID]) VALUES (7, 22, 2)
INSERT [dbo].[dersSecim] ([derssecID], [dersID], [ogrID]) VALUES (8, 24, 2)
INSERT [dbo].[dersSecim] ([derssecID], [dersID], [ogrID]) VALUES (9, 6, 2)
INSERT [dbo].[dersSecim] ([derssecID], [dersID], [ogrID]) VALUES (10, 21, 2)
SET IDENTITY_INSERT [dbo].[dersSecim] OFF
GO
SET IDENTITY_INSERT [dbo].[ogrenci] ON 

INSERT [dbo].[ogrenci] ([ogrID], [bolumID], [ad], [soyad], [numara], [tc], [kullaniciAdi], [sifre], [donem], [onay]) VALUES (1, 1, N'Selçuk', N'BOLAT', N'151601036', N'54468464111', N'slc', N'qwe', 1, 0)
INSERT [dbo].[ogrenci] ([ogrID], [bolumID], [ad], [soyad], [numara], [tc], [kullaniciAdi], [sifre], [donem], [onay]) VALUES (2, 1, N'Yusuf', N'AYHAN', N'151601009', N'68411468464', N'yusufay', N'123', 1, 0)
INSERT [dbo].[ogrenci] ([ogrID], [bolumID], [ad], [soyad], [numara], [tc], [kullaniciAdi], [sifre], [donem], [onay]) VALUES (3, 1, N'Ferdi', N'KENDİR', N'151601024', N'68646446456', N'ferd', N'14', 2, 1)
INSERT [dbo].[ogrenci] ([ogrID], [bolumID], [ad], [soyad], [numara], [tc], [kullaniciAdi], [sifre], [donem], [onay]) VALUES (4, 1, N'Oğuz', N'NALBANTOĞLU', N'151601054', N'64768648646', N'rus', N'45', 2, 1)
INSERT [dbo].[ogrenci] ([ogrID], [bolumID], [ad], [soyad], [numara], [tc], [kullaniciAdi], [sifre], [donem], [onay]) VALUES (5, 1, N'Mustafa', N'IRMAK', N'151601078', N'78746464486', N'must', N'11', 3, 1)
INSERT [dbo].[ogrenci] ([ogrID], [bolumID], [ad], [soyad], [numara], [tc], [kullaniciAdi], [sifre], [donem], [onay]) VALUES (6, 2, N'Hasan', N'GÜLER', N'151601087', N'46874654688', N'has', N'78', 3, 1)
INSERT [dbo].[ogrenci] ([ogrID], [bolumID], [ad], [soyad], [numara], [tc], [kullaniciAdi], [sifre], [donem], [onay]) VALUES (7, 2, N'Muhittin', N'SARI', N'151601788', N'98746498464', N'muhi', N'77', 4, 1)
INSERT [dbo].[ogrenci] ([ogrID], [bolumID], [ad], [soyad], [numara], [tc], [kullaniciAdi], [sifre], [donem], [onay]) VALUES (8, 2, N'Abdurrezzak', N'TRAURE', N'465464664', N'87869478646', N'imam', N'31', 4, 1)
INSERT [dbo].[ogrenci] ([ogrID], [bolumID], [ad], [soyad], [numara], [tc], [kullaniciAdi], [sifre], [donem], [onay]) VALUES (9, 2, N'Beyhan', N'KOÇ', N'231384666', N'89431346413', N'beyo', N'55', 1, 1)
INSERT [dbo].[ogrenci] ([ogrID], [bolumID], [ad], [soyad], [numara], [tc], [kullaniciAdi], [sifre], [donem], [onay]) VALUES (10, 2, N'Reyhan', N'TURGUT', N'121165846', N'86468468468', N'ask', N'gokhan', 1, 0)
INSERT [dbo].[ogrenci] ([ogrID], [bolumID], [ad], [soyad], [numara], [tc], [kullaniciAdi], [sifre], [donem], [onay]) VALUES (11, 3, N'Yusuf', N'ÖZBEK', N'445646464', N'68468486463', N'özbek', N'space', 2, 0)
INSERT [dbo].[ogrenci] ([ogrID], [bolumID], [ad], [soyad], [numara], [tc], [kullaniciAdi], [sifre], [donem], [onay]) VALUES (12, 3, N'Orhan', N'BULUT', N'644468464', N'78721332331', N'hiçlik', N'karadelik', 2, 0)
INSERT [dbo].[ogrenci] ([ogrID], [bolumID], [ad], [soyad], [numara], [tc], [kullaniciAdi], [sifre], [donem], [onay]) VALUES (13, 3, N'Enes', N'DORUK', N'894684666', N'78643231316', N'armut', N'piş', 3, 0)
INSERT [dbo].[ogrenci] ([ogrID], [bolumID], [ad], [soyad], [numara], [tc], [kullaniciAdi], [sifre], [donem], [onay]) VALUES (15, 3, N'Netice', N'KILINÇ', N'564684686', N'56466464466', N'boşluk', N'frisby', 4, 0)
INSERT [dbo].[ogrenci] ([ogrID], [bolumID], [ad], [soyad], [numara], [tc], [kullaniciAdi], [sifre], [donem], [onay]) VALUES (16, 3, N'Tufan', N'ÇIVAK', N'897987479', N'54456468798', N'sevimsiz', N'virüs', 4, 0)
SET IDENTITY_INSERT [dbo].[ogrenci] OFF
GO
SET IDENTITY_INSERT [dbo].[secmeliDersler] ON 

INSERT [dbo].[secmeliDersler] ([secID], [dersadi], [donem], [kredi]) VALUES (1, N'Matematik', 1, N'4         ')
INSERT [dbo].[secmeliDersler] ([secID], [dersadi], [donem], [kredi]) VALUES (2, N'İngilize', 1, N'2         ')
INSERT [dbo].[secmeliDersler] ([secID], [dersadi], [donem], [kredi]) VALUES (3, N'Ofis Yazılımları', 1, N'4         ')
INSERT [dbo].[secmeliDersler] ([secID], [dersadi], [donem], [kredi]) VALUES (4, N'Mesleki Matematik', 2, N'4         ')
INSERT [dbo].[secmeliDersler] ([secID], [dersadi], [donem], [kredi]) VALUES (5, N'Mesleki İngilizce', 2, N'2         ')
INSERT [dbo].[secmeliDersler] ([secID], [dersadi], [donem], [kredi]) VALUES (6, N'Girişimcilik', 3, N'4         ')
INSERT [dbo].[secmeliDersler] ([secID], [dersadi], [donem], [kredi]) VALUES (7, N'Tarih 1', 1, N'3         ')
INSERT [dbo].[secmeliDersler] ([secID], [dersadi], [donem], [kredi]) VALUES (8, N'Tarih 2', 2, N'3         ')
INSERT [dbo].[secmeliDersler] ([secID], [dersadi], [donem], [kredi]) VALUES (9, N'İngilizce 2', 2, N'2         ')
INSERT [dbo].[secmeliDersler] ([secID], [dersadi], [donem], [kredi]) VALUES (10, N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[secmeliDersler] OFF
GO
USE [master]
GO
ALTER DATABASE [ogrenciIsleri] SET  READ_WRITE 
GO
