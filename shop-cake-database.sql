USE [master]
GO
/****** Object:  Database [shop_cake]    Script Date: 5/3/2019 10:20:39 AM ******/
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
/****** Object:  Table [dbo].[admin]    Script Date: 5/3/2019 10:20:39 AM ******/
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
/****** Object:  Table [dbo].[bill]    Script Date: 5/3/2019 10:20:39 AM ******/
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
/****** Object:  Table [dbo].[bill_detail]    Script Date: 5/3/2019 10:20:39 AM ******/
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
/****** Object:  Table [dbo].[customer]    Script Date: 5/3/2019 10:20:39 AM ******/
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
/****** Object:  Table [dbo].[news]    Script Date: 5/3/2019 10:20:39 AM ******/
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
/****** Object:  Table [dbo].[product]    Script Date: 5/3/2019 10:20:39 AM ******/
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
/****** Object:  Table [dbo].[product_types]    Script Date: 5/3/2019 10:20:39 AM ******/
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
/****** Object:  Table [dbo].[slide]    Script Date: 5/3/2019 10:20:39 AM ******/
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
