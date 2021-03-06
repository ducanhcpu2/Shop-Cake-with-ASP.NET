USE [master]
GO
/****** Object:  Database [shop_cake]    Script Date: 6/4/2019 9:38:49 PM ******/
CREATE DATABASE [shop_cake]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'shop_cake', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\shop_cake.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'shop_cake_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\shop_cake_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [shop_cake] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shop_cake].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shop_cake] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shop_cake] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shop_cake] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shop_cake] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shop_cake] SET ARITHABORT OFF 
GO
ALTER DATABASE [shop_cake] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [shop_cake] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [shop_cake] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shop_cake] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shop_cake] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shop_cake] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shop_cake] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shop_cake] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shop_cake] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shop_cake] SET  ENABLE_BROKER 
GO
ALTER DATABASE [shop_cake] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [shop_cake] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shop_cake] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shop_cake] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shop_cake] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shop_cake] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [shop_cake] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shop_cake] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [shop_cake] SET  MULTI_USER 
GO
ALTER DATABASE [shop_cake] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shop_cake] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shop_cake] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shop_cake] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [shop_cake] SET DELAYED_DURABILITY = DISABLED 
GO
USE [shop_cake]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 6/4/2019 9:38:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[id_admin] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
 CONSTRAINT [PK__admin__89472E95F895A925] PRIMARY KEY CLUSTERED 
(
	[id_admin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bill]    Script Date: 6/4/2019 9:38:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[id_bill] [int] IDENTITY(1,1) NOT NULL,
	[date_order] [date] NULL,
	[total] [float] NULL,
	[payment] [nvarchar](200) NULL,
	[note] [nvarchar](400) NULL,
	[created_at] [date] NULL,
	[updated_at] [date] NULL,
	[id_customer] [int] NULL,
 CONSTRAINT [PK__bill__C56081F56D7E8D52] PRIMARY KEY CLUSTERED 
(
	[id_bill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bill_detail]    Script Date: 6/4/2019 9:38:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill_detail](
	[id_bill_detail] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[created_at] [date] NULL,
	[updated_at] [date] NULL,
	[unit_price] [float] NULL,
	[id_bill] [int] NULL,
	[id_product] [int] NULL,
 CONSTRAINT [PK__bill_det__9EC57E5C0CB147AC] PRIMARY KEY CLUSTERED 
(
	[id_bill_detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customer]    Script Date: 6/4/2019 9:38:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[id_customer] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[gender] [nvarchar](10) NULL,
	[phone_number] [nvarchar](15) NULL,
	[created_at] [date] NULL,
	[updated_at] [date] NULL,
	[address] [nvarchar](50) NULL,
	[note] [nvarchar](200) NULL,
 CONSTRAINT [PK__customer__8CC9BA46684A0D2E] PRIMARY KEY CLUSTERED 
(
	[id_customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[news]    Script Date: 6/4/2019 9:38:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[news](
	[id_news] [int] NOT NULL,
	[title] [nvarchar](200) NULL,
	[content] [nvarchar](200) NULL,
	[image] [varchar](100) NULL,
	[created_at] [date] NULL,
	[updated_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_news] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product]    Script Date: 6/4/2019 9:38:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product](
	[id_product] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[unit_price] [float] NULL,
	[promotion_price] [float] NULL,
	[image] [varchar](100) NULL,
	[unit] [nvarchar](100) NULL,
	[new] [tinyint] NULL,
	[created_at] [date] NULL,
	[updated_at] [date] NULL,
	[id_product_type] [int] NOT NULL,
 CONSTRAINT [PK__product__BA39E84FBEDDADAD] PRIMARY KEY CLUSTERED 
(
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product_types]    Script Date: 6/4/2019 9:38:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product_types](
	[id_product_type] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[image] [varchar](100) NULL,
	[created_at] [date] NULL,
	[updated_at] [date] NULL,
 CONSTRAINT [PK__product___92422128F7DF0943] PRIMARY KEY CLUSTERED 
(
	[id_product_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[slide]    Script Date: 6/4/2019 9:38:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[slide](
	[id_slide] [int] NOT NULL,
	[link] [nvarchar](100) NULL,
	[image] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_slide] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([id_admin], [email], [password]) VALUES (1, N'admin@gmail.com', N'123123')
SET IDENTITY_INSERT [dbo].[admin] OFF
SET IDENTITY_INSERT [dbo].[bill] ON 

INSERT [dbo].[bill] ([id_bill], [date_order], [total], [payment], [note], [created_at], [updated_at], [id_customer]) VALUES (11, CAST(N'2017-03-21' AS Date), 420000, N'COD', N'không chú', CAST(N'2017-03-21' AS Date), CAST(N'2017-03-21' AS Date), 11)
INSERT [dbo].[bill] ([id_bill], [date_order], [total], [payment], [note], [created_at], [updated_at], [id_customer]) VALUES (12, CAST(N'2017-03-21' AS Date), 520000, N'COD', N'vui lòng giao hàng đúng giờ đừng để khách chết vì đói', CAST(N'2017-03-21' AS Date), CAST(N'2017-03-21' AS Date), 12)
INSERT [dbo].[bill] ([id_bill], [date_order], [total], [payment], [note], [created_at], [updated_at], [id_customer]) VALUES (13, CAST(N'2017-03-21' AS Date), 400000, N'ATM', N'giao hàng trước 5h', CAST(N'2017-03-21' AS Date), CAST(N'2017-03-21' AS Date), 13)
INSERT [dbo].[bill] ([id_bill], [date_order], [total], [payment], [note], [created_at], [updated_at], [id_customer]) VALUES (14, CAST(N'2017-03-23' AS Date), 160000, N'COD', N'k', CAST(N'2017-03-23' AS Date), CAST(N'2017-03-23' AS Date), 14)
INSERT [dbo].[bill] ([id_bill], [date_order], [total], [payment], [note], [created_at], [updated_at], [id_customer]) VALUES (15, CAST(N'2017-03-23' AS Date), 160000, N'COD', N'vui lòng giao hàng đúng giờ,đừng để khách hàng chết đói', CAST(N'2017-03-23' AS Date), CAST(N'2017-03-23' AS Date), 15)
INSERT [dbo].[bill] ([id_bill], [date_order], [total], [payment], [note], [created_at], [updated_at], [id_customer]) VALUES (16, CAST(N'2019-05-09' AS Date), 520000, NULL, NULL, CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), 15)
INSERT [dbo].[bill] ([id_bill], [date_order], [total], [payment], [note], [created_at], [updated_at], [id_customer]) VALUES (17, CAST(N'2019-05-09' AS Date), 520000, NULL, NULL, CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), 15)
INSERT [dbo].[bill] ([id_bill], [date_order], [total], [payment], [note], [created_at], [updated_at], [id_customer]) VALUES (18, CAST(N'2019-05-09' AS Date), 120000, NULL, NULL, CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), 15)
INSERT [dbo].[bill] ([id_bill], [date_order], [total], [payment], [note], [created_at], [updated_at], [id_customer]) VALUES (19, CAST(N'2019-05-09' AS Date), 440000, N'ATM', N'giao hàng sớm sớm nhé', CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), 15)
INSERT [dbo].[bill] ([id_bill], [date_order], [total], [payment], [note], [created_at], [updated_at], [id_customer]) VALUES (20, CAST(N'2019-05-09' AS Date), 640000, N'COD', N'giao hàng nhanh lên', CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), 15)
INSERT [dbo].[bill] ([id_bill], [date_order], [total], [payment], [note], [created_at], [updated_at], [id_customer]) VALUES (21, CAST(N'2019-05-09' AS Date), 440000, N'COD', NULL, CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), 15)
INSERT [dbo].[bill] ([id_bill], [date_order], [total], [payment], [note], [created_at], [updated_at], [id_customer]) VALUES (22, CAST(N'2019-05-09' AS Date), 360000, N'COD', N'áda', CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), 15)
INSERT [dbo].[bill] ([id_bill], [date_order], [total], [payment], [note], [created_at], [updated_at], [id_customer]) VALUES (23, CAST(N'2019-05-09' AS Date), 640000, N'ATM', NULL, CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), 15)
INSERT [dbo].[bill] ([id_bill], [date_order], [total], [payment], [note], [created_at], [updated_at], [id_customer]) VALUES (24, CAST(N'2019-05-10' AS Date), 280000, N'COD', N'adasdasdasdas', CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), 15)
INSERT [dbo].[bill] ([id_bill], [date_order], [total], [payment], [note], [created_at], [updated_at], [id_customer]) VALUES (25, CAST(N'2019-05-28' AS Date), 360000, N'COD', N'abc', CAST(N'2019-05-28' AS Date), CAST(N'2019-05-28' AS Date), 15)
INSERT [dbo].[bill] ([id_bill], [date_order], [total], [payment], [note], [created_at], [updated_at], [id_customer]) VALUES (26, CAST(N'2019-05-29' AS Date), 240000, N'COD', N'uuu', CAST(N'2019-05-29' AS Date), CAST(N'2019-05-29' AS Date), 15)
SET IDENTITY_INSERT [dbo].[bill] OFF
SET IDENTITY_INSERT [dbo].[bill_detail] ON 

INSERT [dbo].[bill_detail] ([id_bill_detail], [quantity], [created_at], [updated_at], [unit_price], [id_bill], [id_product]) VALUES (11, 2, CAST(N'2017-03-21' AS Date), CAST(N'2017-03-21' AS Date), 150000, 11, 57)
INSERT [dbo].[bill_detail] ([id_bill_detail], [quantity], [created_at], [updated_at], [unit_price], [id_bill], [id_product]) VALUES (12, 1, CAST(N'2017-03-21' AS Date), CAST(N'2017-03-21' AS Date), 120000, 11, 61)
INSERT [dbo].[bill_detail] ([id_bill_detail], [quantity], [created_at], [updated_at], [unit_price], [id_bill], [id_product]) VALUES (13, 1, CAST(N'2017-03-21' AS Date), CAST(N'2017-03-21' AS Date), 120000, 12, 61)
INSERT [dbo].[bill_detail] ([id_bill_detail], [quantity], [created_at], [updated_at], [unit_price], [id_bill], [id_product]) VALUES (14, 2, CAST(N'2017-03-21' AS Date), CAST(N'2017-03-21' AS Date), 200000, 12, 60)
INSERT [dbo].[bill_detail] ([id_bill_detail], [quantity], [created_at], [updated_at], [unit_price], [id_bill], [id_product]) VALUES (15, 1, CAST(N'2017-03-21' AS Date), CAST(N'2017-03-21' AS Date), 200000, 13, 59)
INSERT [dbo].[bill_detail] ([id_bill_detail], [quantity], [created_at], [updated_at], [unit_price], [id_bill], [id_product]) VALUES (16, 1, CAST(N'2017-03-21' AS Date), CAST(N'2017-03-21' AS Date), 200000, 13, 60)
INSERT [dbo].[bill_detail] ([id_bill_detail], [quantity], [created_at], [updated_at], [unit_price], [id_bill], [id_product]) VALUES (17, 1, CAST(N'2017-03-23' AS Date), CAST(N'2017-03-23' AS Date), 160000, 14, 2)
INSERT [dbo].[bill_detail] ([id_bill_detail], [quantity], [created_at], [updated_at], [unit_price], [id_bill], [id_product]) VALUES (18, 5, CAST(N'2017-03-24' AS Date), CAST(N'2017-03-24' AS Date), 220000, 15, 62)
INSERT [dbo].[bill_detail] ([id_bill_detail], [quantity], [created_at], [updated_at], [unit_price], [id_bill], [id_product]) VALUES (19, 1, CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), 120000, 18, 1)
INSERT [dbo].[bill_detail] ([id_bill_detail], [quantity], [created_at], [updated_at], [unit_price], [id_bill], [id_product]) VALUES (20, 2, CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), 160000, 19, 2)
INSERT [dbo].[bill_detail] ([id_bill_detail], [quantity], [created_at], [updated_at], [unit_price], [id_bill], [id_product]) VALUES (21, 1, CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), 120000, 19, 3)
INSERT [dbo].[bill_detail] ([id_bill_detail], [quantity], [created_at], [updated_at], [unit_price], [id_bill], [id_product]) VALUES (22, 4, CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), 120000, 20, 1)
INSERT [dbo].[bill_detail] ([id_bill_detail], [quantity], [created_at], [updated_at], [unit_price], [id_bill], [id_product]) VALUES (23, 1, CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), 160000, 20, 2)
INSERT [dbo].[bill_detail] ([id_bill_detail], [quantity], [created_at], [updated_at], [unit_price], [id_bill], [id_product]) VALUES (24, 1, CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), 120000, 21, 1)
INSERT [dbo].[bill_detail] ([id_bill_detail], [quantity], [created_at], [updated_at], [unit_price], [id_bill], [id_product]) VALUES (25, 2, CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), 160000, 21, 2)
INSERT [dbo].[bill_detail] ([id_bill_detail], [quantity], [created_at], [updated_at], [unit_price], [id_bill], [id_product]) VALUES (26, 3, CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), 120000, 22, 1)
INSERT [dbo].[bill_detail] ([id_bill_detail], [quantity], [created_at], [updated_at], [unit_price], [id_bill], [id_product]) VALUES (27, 4, CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), 120000, 23, 1)
INSERT [dbo].[bill_detail] ([id_bill_detail], [quantity], [created_at], [updated_at], [unit_price], [id_bill], [id_product]) VALUES (28, 1, CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), 160000, 23, 2)
INSERT [dbo].[bill_detail] ([id_bill_detail], [quantity], [created_at], [updated_at], [unit_price], [id_bill], [id_product]) VALUES (29, 1, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), 120000, 24, 1)
INSERT [dbo].[bill_detail] ([id_bill_detail], [quantity], [created_at], [updated_at], [unit_price], [id_bill], [id_product]) VALUES (30, 1, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), 160000, 24, 2)
INSERT [dbo].[bill_detail] ([id_bill_detail], [quantity], [created_at], [updated_at], [unit_price], [id_bill], [id_product]) VALUES (31, 3, CAST(N'2019-05-28' AS Date), CAST(N'2019-05-28' AS Date), 120000, 25, 1)
INSERT [dbo].[bill_detail] ([id_bill_detail], [quantity], [created_at], [updated_at], [unit_price], [id_bill], [id_product]) VALUES (32, 2, CAST(N'2019-05-29' AS Date), CAST(N'2019-05-29' AS Date), 120000, 26, 1)
SET IDENTITY_INSERT [dbo].[bill_detail] OFF
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([id_customer], [name], [email], [password], [gender], [phone_number], [created_at], [updated_at], [address], [note]) VALUES (10, N'Nguyễn thị giang', N'giang123@gmail.com', N'123!@#', N'nữ', N'0115320729', CAST(N'2017-03-24' AS Date), CAST(N'2017-03-24' AS Date), N'Hải Dương', N'')
INSERT [dbo].[customer] ([id_customer], [name], [email], [password], [gender], [phone_number], [created_at], [updated_at], [address], [note]) VALUES (11, N'Nguyễn thị hương', N'huong123@gmail.com', N'123!@#', N'nữ', N'0915320729', CAST(N'2017-03-24' AS Date), CAST(N'2017-03-24' AS Date), N'Hà Nội', N'')
INSERT [dbo].[customer] ([id_customer], [name], [email], [password], [gender], [phone_number], [created_at], [updated_at], [address], [note]) VALUES (12, N'Nguyễn thi hoa', N'hoa123@gmail.com', N'123!@#', N'nữ', N'0125320729', CAST(N'2017-03-23' AS Date), CAST(N'2017-03-24' AS Date), N'Nam Định', N'')
INSERT [dbo].[customer] ([id_customer], [name], [email], [password], [gender], [phone_number], [created_at], [updated_at], [address], [note]) VALUES (13, N'Nguyễn thị tình', N'tinh97@gmail.com', N'123!@#', N'nữ', N'0921320729', CAST(N'2017-03-22' AS Date), CAST(N'2017-03-24' AS Date), N'Hà Nam', N'vui lòng giao hàng dúng h?n')
INSERT [dbo].[customer] ([id_customer], [name], [email], [password], [gender], [phone_number], [created_at], [updated_at], [address], [note]) VALUES (14, N'Nguyễn hùng', N'hungprogramer98@gmail.com', N'123!@#', N'nam', N'0915320123', CAST(N'2017-03-25' AS Date), CAST(N'2017-03-25' AS Date), N'Hà Nội', N'vui lòng giao hàng tru?c 4h')
INSERT [dbo].[customer] ([id_customer], [name], [email], [password], [gender], [phone_number], [created_at], [updated_at], [address], [note]) VALUES (15, N'Nguyễn Đức Anh', N'ducanhprogramer98@gmail.com', N'123!@#', N'nam', N'0915320729', CAST(N'2019-05-29' AS Date), CAST(N'2019-05-29' AS Date), N'Hà Nội ', N'giao hàng sớm sớm nhé')
SET IDENTITY_INSERT [dbo].[customer] OFF
INSERT [dbo].[news] ([id_news], [title], [content], [image], [created_at], [updated_at]) VALUES (1, N'Mùa trung thu năm nay, Hỷ Lâm Môn muốn gửi đến quý khách hàng sản phẩm mới xuất hiện lần đầu tiên tại Việt nam "Bánh trung thu Bơ Sữa HongKong".', N'Những ý tưởng dưới đây sẽ giúp bạn sắp xếp tủ quần áo trong phòng ngủ chật hẹp của mình một cách dễ dàng và hiệu quả nhất. ', N'sample1.jpg', CAST(N'2017-03-11' AS Date), CAST(N'2017-03-11' AS Date))
INSERT [dbo].[news] ([id_news], [title], [content], [image], [created_at], [updated_at]) VALUES (2, N'Tư vấn cải tạo phòng ngủ nhỏ sao cho thoải mái và thoáng mát', N'Chúng tôi sẽ tư vấn cải tạo và bố trí nội thất để giúp phòng ngủ của chàng trai độc thân thật thoải mái, thoáng mát và sáng sủa nhất. ', N'sample2.jpg', CAST(N'2016-10-20' AS Date), CAST(N'2016-10-20' AS Date))
INSERT [dbo].[news] ([id_news], [title], [content], [image], [created_at], [updated_at]) VALUES (3, N'Đồ gỗ nội thất và nhu cầu, xu hướng sử dụng của người dùng', N'Đồ gỗ nội thất ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Xu thế của các gia đình hiện nay là muốn đem thiên nhiên vào nhà ', N'sample3.jpg', CAST(N'2016-10-20' AS Date), CAST(N'2016-10-20' AS Date))
INSERT [dbo].[news] ([id_news], [title], [content], [image], [created_at], [updated_at]) VALUES (4, N'Hướng dẫn sử dụng bảo quản đồ gỗ, nội thất.', N'Ngày nay, xu hướng chọn vật dụng làm bằng gỗ để trang trí, sử dụng trong văn phòng, gia đình được nhiều người ưa chuộng và quan tâm. Trên thị trường có nhiều sản phẩm mẫu ', N'sample4.jpg', CAST(N'2016-10-20' AS Date), CAST(N'2016-10-20' AS Date))
INSERT [dbo].[news] ([id_news], [title], [content], [image], [created_at], [updated_at]) VALUES (5, N'Phong cách mới trong sử dụng đồ gỗ nội thất gia đình', N'Đồ gỗ nội thất gia đình ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Phong cách sử dụng đồ gỗ hiện nay của các gia đình hầu h ', N'sample5.jpg', CAST(N'2016-10-20' AS Date), CAST(N'2016-10-20' AS Date))
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (1, N'Bánh Crepe Sầu riêng', N'Bánh crepe sầu riêng nhà làm', 180000, 130001, N'crepe-chuoi.jpg', N'hộp', 1, CAST(N'2016-10-26' AS Date), CAST(N'2019-05-30' AS Date), 1)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (2, N'Bánh Crepe Chocolate', N'', 180000, 160000, N'crepe-chocolate.jpg', N'hộp', 1, CAST(N'2016-10-26' AS Date), CAST(N'2016-10-24' AS Date), 6)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (3, N'Bánh Crepe Sầu riêng - Chuối', N'', 150000, 120000, N'crepe-chuoi.jpg', N'hộp', 0, CAST(N'2016-10-26' AS Date), CAST(N'2016-10-24' AS Date), 5)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (4, N'Bánh Crepe Đào', N'', 160000, 0, N'crepe-dao.jpg', N'hộp', 0, CAST(N'2016-10-26' AS Date), CAST(N'2016-10-24' AS Date), 5)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (5, N'Bánh Crepe Dâu', N'', 160000, 0, N'crepedau.jpg', N'hộp', 0, CAST(N'2016-10-26' AS Date), CAST(N'2016-10-24' AS Date), 5)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (6, N'Bánh Crepe Pháp', N'', 200000, 180000, N'crepe-phap.jpg', N'hộp', 0, CAST(N'2016-10-26' AS Date), CAST(N'2016-10-24' AS Date), 5)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (7, N'Bánh Crepe Táo', N'', 160000, 0, N'crepe-tao.jpg', N'hộp', 1, CAST(N'2016-10-26' AS Date), CAST(N'2016-10-24' AS Date), 5)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (8, N'Bánh Crepe Trà xanh', N'', 160000, 150000, N'crepe-traxanh.jpg', N'hộp', 0, CAST(N'2016-10-26' AS Date), CAST(N'2016-10-24' AS Date), 5)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (9, N'Bánh Crepe Sầu riêng và Dứa', N'', 160000, 150000, N'saurieng-dua.jpg', N'hộp', 0, CAST(N'2016-10-26' AS Date), CAST(N'2016-10-24' AS Date), 5)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (11, N'Bánh Gato Trái cây Việt Quất', N'', 250000, 0, N'544bc48782741.png', N'cái', 0, CAST(N'2016-10-12' AS Date), CAST(N'2016-10-27' AS Date), 3)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (12, N'Bánh sinh nhật rau câu trái cây', N'', 200000, 180000, N'210215-banh-sinh-nhat-rau-cau-body- (6).jpg', N'cái', 0, CAST(N'2016-10-12' AS Date), CAST(N'2016-10-27' AS Date), 3)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (13, N'Bánh kem Chocolate Dâu', N'', 300000, 280000, N'banh kem sinh nhat.jpg', N'cái', 1, CAST(N'2016-10-12' AS Date), CAST(N'2016-10-27' AS Date), 3)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (14, N'Bánh kem Dâu III', N'', 300000, 280000, N'Banh-kem (6).jpg', N'cái', 0, CAST(N'2016-10-12' AS Date), CAST(N'2016-10-27' AS Date), 3)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (15, N'Bánh kem Dâu I', N'', 350000, 320000, N'banhkem-dau.jpg', N'cái', 1, CAST(N'2016-10-12' AS Date), CAST(N'2016-10-27' AS Date), 3)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (16, N'Bánh trái cây II', N'', 150000, 120000, N'banhtraicay.jpg', N'hộp', 0, CAST(N'2016-10-12' AS Date), CAST(N'2016-10-27' AS Date), 3)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (17, N'Apple Cake', N'', 250000, 240000, N'Fruit-Cake_7979.jpg', N'cai', 0, CAST(N'2016-10-12' AS Date), CAST(N'2016-10-27' AS Date), 3)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (18, N'Bánh ngọt nhân cream táo', N'', 180000, 0, N'20131108144733.jpg', N'hộp', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 2)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (19, N'Bánh Chocolate Trái cây', N'', 150000, 0, N'Fruit-Cake_7976.jpg', N'hộp', 1, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 2)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (20, N'Bánh Chocolate Trái cây II', N'', 150000, 0, N'Fruit-Cake_7981.jpg', N'hộp', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 2)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (21, N'Peach Cake', N'', 160000, 150000, N'Peach-Cake_3294.jpg', N'cái', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 2)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (22, N'Bánh bông lan trứng muối I', N'', 160000, 150000, N'banhbonglantrung.jpg', N'hộp', 1, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 1)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (23, N'Bánh bông lan trứng muối II', N'', 180000, 0, N'banhbonglantrungmuoi.jpg', N'hộp', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 1)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (24, N'Bánh French', N'', 180000, 0, N'banh-man-thu-vi-nhat-1.jpg', N'hộp', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 1)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (25, N'Bánh mì Australia', N'', 80000, 70000, N'dung-khoai-tay-lam-banh-gato-man-cuc-ngon.jpg', N'hộp', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 1)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (26, N'Bánh mặn thập cẩm', N'', 50000, 0, N'Fruit-Cake.png', N'hộp', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 1)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (27, N'Bánh Muffins trứng', N'', 100000, 80000, N'maxresdefault.jpg', N'hộp', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 1)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (28, N'Bánh Scone Peach Cake', N'', 120000, 0, N'Peach-Cake_3300.jpg', N'hộp', 1, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 1)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (29, N'Bánh mì Loaf I', N'', 100000, 0, N'sli12.jpg', N'hộp', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 1)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (30, N'Bánh kem Chocolate Dâu I', N'', 380000, 350000, N'sli12.jpg', N'cái', 1, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 4)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (31, N'Bánh kem Trái cây I', N'', 380000, 350000, N'Fruit-Cake.jpg', N'cái', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 4)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (32, N'Bánh kem Trái cây II', N'', 380000, 350000, N'Fruit-Cake_7971.jpg', N'cái', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 4)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (33, N'Bánh kem Doraemon', N'', 280000, 250000, N'p1392962167_banh74.jpg', N'cái', 1, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 4)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (34, N'Bánh kem Caramen Pudding', N'', 280000, 0, N'Caramen-pudding636099031482099583.jpg', N'cái', 1, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 4)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (35, N'Bánh kem Chocolate Fruit', N'', 320000, 300000, N'chocolate-fruit636098975917921990.jpg', N'cái', 1, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 4)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (36, N'Bánh kem Coffee Chocolate GH6', N'', 320000, 300000, N'COFFE-CHOCOLATE636098977566220885.jpg', N'cái', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 4)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (37, N'Bánh kem Mango Mouse', N'', 320000, 300000, N'mango-mousse-cake.jpg', N'cái', 1, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 4)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (38, N'Bánh kem Matcha Mouse', N'', 350000, 330000, N'MATCHA-MOUSSE.jpg', N'cái', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 4)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (39, N'Bánh kem Flower Fruit', N'', 350000, 330000, N'flower-fruits636102461981788938.jpg', N'cái', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 4)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (40, N'Bánh kem Strawberry Delight', N'', 350000, 330000, N'strawberry-delight636102445035635173.jpg', N'cái', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 4)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (41, N'Bánh kem Raspberry Delight', N'', 350000, 330000, N'raspberry.jpg', N'cái', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 4)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (42, N'Beefy Pizza', N'Thịt bò xay, ngô, sốt BBQ, phô mai mozzarella', 150000, 130000, N'40819_food_pizza.jpg', N'cái', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 6)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (43, N'Hawaii Pizza', N'Sốt cà chua, ham , dứa, pho mai mozzarella', 120000, 0, N'hawaiian paradise_large-900x900.jpg', N'cái', 1, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 6)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (44, N'Smoke Chicken Pizza', N'Gà hun khói,nấm, sốt cà chua, pho mai mozzarella.', 120000, 0, N'chicken black pepper_large-900x900.jpg', N'cái', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 6)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (45, N'Sausage Pizza', N'Xúc xích klobasa, Nấm, Ngô, sốtcà chua, pho mai Mozzarella.', 120000, 0, N'pizza-miami.jpg', N'cái', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 6)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (46, N'Ocean Pizza', N'Tôm , mực, xào cay,ớt xanh, hành tây, cà chua, phomai mozzarella.', 120000, 0, N'seafood curry_large-900x900.jpg', N'cái', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 6)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (47, N'All Meaty Pizza', N'Ham, bacon, chorizo, pho mai mozzarella.', 140000, 0, N'all1).jpg', N'cái', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 6)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (48, N'Tuna Pizza', N'Cá Ngừ, sốt Mayonnaise,sốt càchua, hành tây, pho mai Mozzarella', 140000, 0, N'54eaf93713081_-_07-germany-tuna.jpg', N'cái', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 6)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (49, N'Bánh su kem nhân dừa', N'', 120000, 100000, N'maxresdefault.jpg', N'cái', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 7)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (50, N'Bánh su kem sữa tươi', N'', 120000, 100000, N'sukem.jpg', N'cái', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 7)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (51, N'Bánh su kem sữa tươi chiên giòn', N'', 150000, 0, N'1434429117-banh-su-kem-chien-20.jpg', N'hộp', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 7)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (52, N'Bánh su kem dâu sữa tươi', N'', 150000, 0, N'sukemdau.jpg', N'hộp', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 7)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (53, N'Bánh su kem bơ sữa tươi', N'', 150000, 0, N'He-Thong-Banh-Su-Singapore-Chewy-Junior.jpg', N'hộp', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 7)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (54, N'Bánh su kem nhân trái cây sữa tươi', N'', 150000, 0, N'foody-banh-su-que-635930347896369908.jpg', N'hộp', 1, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 7)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (55, N'Bánh su kem cà phê', N'', 150000, 0, N'banh-su-kem-ca-phe-1.jpg', N'hộp', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 7)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (56, N'Bánh su kem phô mai', N'', 150000, 0, N'50020041-combo-20-banh-su-que-pho-mai-9.jpg', N'hộp', 0, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 7)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (57, N'Bánh su kem sữa tươi chocolate', N'', 150000, 0, N'combo-20-banh-su-que-kem-sua-tuoi-phu-socola.jpg', N'hộp', 1, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-19' AS Date), 7)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (58, N'Bánh Macaron Pháp', N'Thưởng thức macaron, người ta có thể tìm thấy từ những hương vị truyền thống như mâm xôi, chocolate, cho đến những hương vị mới như nấm và trà xanh. Macaron với vị giòn tan của vỏ bánh, béo ngậy ngọt ngào của phần nhân, với vẻ ngoài đáng yêu và nhiều màu sắc đẹp mắt, đây là món bạn không nên bỏ qua khi khám phá nền ẩm thực Pháp.', 200000, 180000, N'Macaron9.jpg', N'', 0, CAST(N'2016-10-26' AS Date), CAST(N'2016-10-11' AS Date), 2)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (59, N'Bánh Tiramisu - Italia', N'Chỉ cần cắn một miếng, bạn sẽ cảm nhận được tất cả các hương vị đó hòa quyện cùng một chính vì thế người ta còn ví món bánh này là Thiên đường trong miệng của bạn', 200000, 0, N'234.jpg', N'', 0, CAST(N'2016-10-26' AS Date), CAST(N'2016-10-11' AS Date), 2)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (60, N'Bánh Táo - Mỹ', N'Bánh táo Mỹ với phần vỏ bánh mỏng, giòn mềm, ẩn chứa phần nhân táo thơm ngọt, điểm chút vị chua dịu của trái cây quả sẽ là một lựa chọn hoàn hảo cho những tín đồ bánh ngọt trên toàn thế giới.', 200000, 0, N'1234.jpg', N'', 0, CAST(N'2016-10-26' AS Date), CAST(N'2016-10-11' AS Date), 2)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (61, N'Bánh Cupcake - Anh Quốc', N'Những chiếc cupcake có cấu tạo gồm phần vỏ bánh xốp mịn và phần kem trang trí bên trên rất bắt mắt với nhiều hình dạng và màu sắc khác nhau. Cupcake còn được cho là chiếc bánh mang lại niềm vui và tiếng cười như chính hình dáng đáng yêu của chúng.', 150000, 120000, N'cupcake.jpg', N'cái', 1, NULL, NULL, 6)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (62, N'Bánh Sachertorte', N'Sachertorte là một loại bánh xốp được tạo ra bởi loại&nbsp;chocholate&nbsp;tuyệt hảo nhất của nước Áo. Sachertorte có vị ngọt nhẹ, gồm nhiều lớp bánh được làm từ ruột bánh mì và bánh sữa chocholate, xen lẫn giữa các lớp bánh là mứt mơ. Món bánh chocholate này nổi tiếng tới mức thành phố Vienna của Áo đã ấn định&nbsp;tổ chức một ngày Sachertorte quốc gia, vào 5/12 hằng năm', 250000, 220000, N'111.jpg', N'cái', 0, NULL, NULL, 6)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (71, N'adadsad312', N'aedad', 121, 12, N'webapi-overview.png', N'cái', 0, NULL, NULL, 1)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (72, N'asfasdas', N'adadad', 1212, 1212, N'sli12.jpg', N'hop', 1, NULL, NULL, 5)
INSERT [dbo].[product] ([id_product], [name], [description], [unit_price], [promotion_price], [image], [unit], [new], [created_at], [updated_at], [id_product_type]) VALUES (74, N'new sp', N'adasd', 123123, 121, N'43255847_306785083466972_834230958398898176_n.jpg', N'hop', 0, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[product] OFF
SET IDENTITY_INSERT [dbo].[product_types] ON 

INSERT [dbo].[product_types] ([id_product_type], [name], [description], [image], [created_at], [updated_at]) VALUES (1, N'Bánh mặn', N'Nếu từng bị mê hoặc bởi các loại tarlet ngọt thì chắn chắn bạn không thể bỏ qua những loại tarlet mặn. Ngoài hình dáng bắt mắt, lớp vở bánh giòn giòn cùng với nhân mặn như thịt gà, nấm, thị heo ,… của bánh sẽ chinh phục bất cứ ai dùng thử.', N'banh-man-thu-vi-nhat-1.jpg', NULL, NULL)
INSERT [dbo].[product_types] ([id_product_type], [name], [description], [image], [created_at], [updated_at]) VALUES (2, N'Bánh ngọt', N'Bánh ngọt là một loại thức ăn thường dưới hình thức món bánh dạng bánh mì từ bột nhào, được nướng lên dùng để tráng miệng. Bánh ngọt có nhiều loại, có thể phân loại dựa theo nguyên liệu và kỹ thuật chế biến như bánh ngọt làm từ lúa mì, bơ, bánh ngọt dạng bọt biển. Bánh ngọt có thể phục vụ những mục đính đặc biệt như bánh cưới, bánh sinh nhật, bánh Giáng sinh, bánh Halloween..', N'20131108144733.jpg', CAST(N'2016-10-12' AS Date), CAST(N'2016-10-13' AS Date))
INSERT [dbo].[product_types] ([id_product_type], [name], [description], [image], [created_at], [updated_at]) VALUES (3, N'Bánh trái cây', N'Bánh trái cây, hay còn gọi là bánh hoa quả, là một món ăn chơi, không riêng gì của Huế nhưng khi "lạc" vào mảnh đất Cố đô, món bánh này dường như cũng mang chút tinh tế, cầu kỳ và đặc biệt. Lấy cảm hứng từ những loại trái cây trong vườn, qua bàn tay khéo léo của người phụ nữ Huế, món bánh trái cây ra đời - ngọt thơm, dịu nhẹ làm đẹp lòng biết bao người thưởng thức.', N'banhtraicay.jpg', CAST(N'2016-10-18' AS Date), CAST(N'2016-10-15' AS Date))
INSERT [dbo].[product_types] ([id_product_type], [name], [description], [image], [created_at], [updated_at]) VALUES (4, N'Bánh kem', N'Với người Việt Nam thì bánh ngọt nói chung đều hay được quy về bánh bông lan – một loại tráng miệng bông xốp, ăn không hoặc được phủ kem lên thành bánh kem. Tuy nhiên, cốt bánh kem thực ra có rất nhiều loại với hương vị, kết cấu và phương thức làm khác nhau chứ không chỉ đơn giản là “bánh bông lan” chung chung đâu nhé!', N'banhkem.jpg', CAST(N'2016-10-26' AS Date), CAST(N'2016-10-26' AS Date))
INSERT [dbo].[product_types] ([id_product_type], [name], [description], [image], [created_at], [updated_at]) VALUES (5, N'Bánh crepe', N'Crepe là một món bánh nổi tiếng của Pháp, nhưng từ khi du nhập vào Việt Nam món bánh đẹp mắt, ngon miệng này đã làm cho biết bao bạn trẻ phải “xiêu lòng”', N'crepe.jpg', CAST(N'2016-10-28' AS Date), CAST(N'2016-10-27' AS Date))
INSERT [dbo].[product_types] ([id_product_type], [name], [description], [image], [created_at], [updated_at]) VALUES (6, N'Bánh Pizza', N'Pizza đã không chỉ còn là một món ăn được ưa chuộng khắp thế giới mà còn được những nhà cầm quyền EU chứng nhận là một phần di sản văn hóa ẩm thực châu Âu. Và để được chứng nhận là một nhà sản xuất pizza không hề đơn giản. Người ta phải qua đủ mọi các bước xét duyệt của chính phủ Ý và liên minh châu Âu nữa… tất cả là để đảm bảo danh tiếng cho món ăn này.', N'pizza.jpg', CAST(N'2016-10-25' AS Date), NULL)
INSERT [dbo].[product_types] ([id_product_type], [name], [description], [image], [created_at], [updated_at]) VALUES (7, N'Bánh su kem', N'Bánh su kem là món bánh ngọt ở dạng kem được làm từ các nguyên liệu như bột mì, trứng, sữa, bơ.... đánh đều tạo thành một hỗn hợp và sau đó bằng thao tác ép và phun qua một cái túi để định hình thành những bánh nhỏ và cuối cùng được nướng chín. Bánh su kem có thể thêm thành phần Sô cô la để tăng vị hấp dẫn. Bánh có xuất xứ từ nước Pháp.', N'sukemdau.jpg', CAST(N'2016-10-25' AS Date), NULL)
INSERT [dbo].[product_types] ([id_product_type], [name], [description], [image], [created_at], [updated_at]) VALUES (13, N'abcde', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[product_types] OFF
INSERT [dbo].[slide] ([id_slide], [link], [image]) VALUES (1, N'', N'banner1.jpg')
INSERT [dbo].[slide] ([id_slide], [link], [image]) VALUES (2, N'', N'banner2.jpg')
INSERT [dbo].[slide] ([id_slide], [link], [image]) VALUES (3, N'', N'banner3.jpg')
INSERT [dbo].[slide] ([id_slide], [link], [image]) VALUES (4, N'', N'banner4.jpg')
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [FK__bill__id_custome__1CF15040] FOREIGN KEY([id_customer])
REFERENCES [dbo].[customer] ([id_customer])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [FK__bill__id_custome__1CF15040]
GO
ALTER TABLE [dbo].[bill_detail]  WITH CHECK ADD  CONSTRAINT [FK__bill_deta__id_bi__24927208] FOREIGN KEY([id_bill])
REFERENCES [dbo].[bill] ([id_bill])
GO
ALTER TABLE [dbo].[bill_detail] CHECK CONSTRAINT [FK__bill_deta__id_bi__24927208]
GO
ALTER TABLE [dbo].[bill_detail]  WITH CHECK ADD  CONSTRAINT [FK__bill_deta__id_pr__25869641] FOREIGN KEY([id_product])
REFERENCES [dbo].[product] ([id_product])
GO
ALTER TABLE [dbo].[bill_detail] CHECK CONSTRAINT [FK__bill_deta__id_pr__25869641]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK__product__id_prod__21B6055D] FOREIGN KEY([id_product_type])
REFERENCES [dbo].[product_types] ([id_product_type])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK__product__id_prod__21B6055D]
GO
USE [master]
GO
ALTER DATABASE [shop_cake] SET  READ_WRITE 
GO
