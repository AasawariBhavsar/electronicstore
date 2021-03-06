USE [master]
GO
/****** Object:  Database [furnitureshop]    Script Date: 01-09-2020 10:42:10 ******/
CREATE DATABASE [furnitureshop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'furnitureshop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\furnitureshop.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'furnitureshop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\furnitureshop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [furnitureshop] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [furnitureshop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [furnitureshop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [furnitureshop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [furnitureshop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [furnitureshop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [furnitureshop] SET ARITHABORT OFF 
GO
ALTER DATABASE [furnitureshop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [furnitureshop] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [furnitureshop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [furnitureshop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [furnitureshop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [furnitureshop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [furnitureshop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [furnitureshop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [furnitureshop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [furnitureshop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [furnitureshop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [furnitureshop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [furnitureshop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [furnitureshop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [furnitureshop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [furnitureshop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [furnitureshop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [furnitureshop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [furnitureshop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [furnitureshop] SET  MULTI_USER 
GO
ALTER DATABASE [furnitureshop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [furnitureshop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [furnitureshop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [furnitureshop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [furnitureshop]
GO
/****** Object:  Table [dbo].[tbl_bill]    Script Date: 01-09-2020 10:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_bill](
	[billid] [numeric](18, 0) NOT NULL,
	[customerdetails] [varchar](1000) NULL,
	[billdatetiime] [datetime] NULL,
 CONSTRAINT [PK_tbl_bill] PRIMARY KEY CLUSTERED 
(
	[billid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_bill_items]    Script Date: 01-09-2020 10:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bill_items](
	[id] [numeric](18, 0) NOT NULL,
	[billid] [numeric](18, 0) NULL,
	[pid] [numeric](18, 0) NULL,
	[qty] [numeric](18, 0) NULL,
	[total] [numeric](18, 0) NULL,
 CONSTRAINT [PK_tbl_bill_items] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_category]    Script Date: 01-09-2020 10:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_category](
	[cat_id] [numeric](18, 0) NOT NULL,
	[categoryname] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_category] PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_products]    Script Date: 01-09-2020 10:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_products](
	[pid] [numeric](18, 0) NOT NULL,
	[cat_id] [numeric](18, 0) NULL,
	[pro_name] [varchar](200) NULL,
	[pro_desc] [varchar](1000) NULL,
	[pro_price] [numeric](18, 0) NULL,
	[pro_disc] [numeric](18, 0) NULL,
	[imgurl] [varchar](50) NULL,
	[quantity] [numeric](18, 0) NULL,
 CONSTRAINT [PK_tbl_products] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_stock]    Script Date: 01-09-2020 10:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_stock](
	[stock_id] [numeric](18, 0) NOT NULL,
	[prod_id] [numeric](18, 0) NULL,
	[prod_name] [varchar](50) NULL,
	[Quantity] [numeric](18, 0) NULL,
 CONSTRAINT [PK_tbl_stock] PRIMARY KEY CLUSTERED 
(
	[stock_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_user]    Script Date: 01-09-2020 10:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_user](
	[uid] [numeric](18, 0) NOT NULL,
	[username] [varchar](50) NULL,
	[pass] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_user] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[VIEW_BILL]    Script Date: 01-09-2020 10:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW_BILL]
AS
SELECT     dbo.tbl_products.pid AS SKU, dbo.tbl_products.pro_name AS PRODUCT, dbo.tbl_products.pro_price AS PRICE, dbo.tbl_bill_items.qty AS QUANTITY, 
                      dbo.tbl_bill_items.total AS TOTAL, dbo.tbl_bill_items.billid
FROM         dbo.tbl_bill_items INNER JOIN
                      dbo.tbl_products ON dbo.tbl_bill_items.pid = dbo.tbl_products.pid INNER JOIN
                      dbo.tbl_category ON dbo.tbl_products.cat_id = dbo.tbl_category.cat_id

GO
/****** Object:  View [dbo].[VIEW_PRODUCTS]    Script Date: 01-09-2020 10:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW_PRODUCTS]
AS
SELECT dbo.tbl_products.pid AS CODE, dbo.tbl_category.categoryname AS CATEGORY, dbo.tbl_products.pro_name AS PRODUCTNAME, dbo.tbl_products.pro_desc AS DETAILS, dbo.tbl_products.pro_price AS PRICE, dbo.tbl_products.pro_disc AS DISCOUNT, 
             dbo.tbl_products.imgurl AS IMAGE, dbo.tbl_stock.stock_id
FROM   dbo.tbl_category INNER JOIN
             dbo.tbl_products ON dbo.tbl_category.cat_id = dbo.tbl_products.cat_id INNER JOIN
             dbo.tbl_stock ON dbo.tbl_products.pid = dbo.tbl_stock.prod_id

GO
INSERT [dbo].[tbl_bill] ([billid], [customerdetails], [billdatetiime]) VALUES (CAST(1 AS Numeric(18, 0)), N'Aasawari ,Thane ,9022237565', CAST(0x0000AB7200D6C7A4 AS DateTime))
INSERT [dbo].[tbl_bill] ([billid], [customerdetails], [billdatetiime]) VALUES (CAST(2 AS Numeric(18, 0)), N'ASHH ,KJFG ,6756754678', CAST(0x0000AB7200FEB4B0 AS DateTime))
INSERT [dbo].[tbl_bill] ([billid], [customerdetails], [billdatetiime]) VALUES (CAST(3 AS Numeric(18, 0)), N'Aasawari ,Thane ,9022237565', CAST(0x0000AC2900AC9985 AS DateTime))
INSERT [dbo].[tbl_bill_items] ([id], [billid], [pid], [qty], [total]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(300000 AS Numeric(18, 0)))
INSERT [dbo].[tbl_bill_items] ([id], [billid], [pid], [qty], [total]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), CAST(2730 AS Numeric(18, 0)))
INSERT [dbo].[tbl_bill_items] ([id], [billid], [pid], [qty], [total]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(50000 AS Numeric(18, 0)))
INSERT [dbo].[tbl_category] ([cat_id], [categoryname]) VALUES (CAST(1 AS Numeric(18, 0)), N'TV')
INSERT [dbo].[tbl_category] ([cat_id], [categoryname]) VALUES (CAST(2 AS Numeric(18, 0)), N'FRIDGE')
INSERT [dbo].[tbl_category] ([cat_id], [categoryname]) VALUES (CAST(3 AS Numeric(18, 0)), N'MOBILE')
INSERT [dbo].[tbl_category] ([cat_id], [categoryname]) VALUES (CAST(4 AS Numeric(18, 0)), N'WASHING')
INSERT [dbo].[tbl_category] ([cat_id], [categoryname]) VALUES (CAST(5 AS Numeric(18, 0)), N'LAPTOP')
INSERT [dbo].[tbl_category] ([cat_id], [categoryname]) VALUES (CAST(6 AS Numeric(18, 0)), N'COMPUTER')
INSERT [dbo].[tbl_products] ([pid], [cat_id], [pro_name], [pro_desc], [pro_price], [pro_disc], [imgurl], [quantity]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'SONY', N'SONY LED TV ', CAST(50000 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), N'1.jpg', CAST(200 AS Numeric(18, 0)))
INSERT [dbo].[tbl_products] ([pid], [cat_id], [pro_name], [pro_desc], [pro_price], [pro_disc], [imgurl], [quantity]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'LG ', N'LG FRIDGERATOR', CAST(30000 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), N'2.jpg', CAST(100 AS Numeric(18, 0)))
INSERT [dbo].[tbl_products] ([pid], [cat_id], [pro_name], [pro_desc], [pro_price], [pro_disc], [imgurl], [quantity]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'JHHJGDHF', N'JHDS', CAST(546 AS Numeric(18, 0)), CAST(56 AS Numeric(18, 0)), N'3.jpg', CAST(567 AS Numeric(18, 0)))
INSERT [dbo].[tbl_products] ([pid], [cat_id], [pro_name], [pro_desc], [pro_price], [pro_disc], [imgurl], [quantity]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), N'UYER', N'HJGF', CAST(456 AS Numeric(18, 0)), CAST(546 AS Numeric(18, 0)), N'4.jpg', CAST(56 AS Numeric(18, 0)))
INSERT [dbo].[tbl_stock] ([stock_id], [prod_id], [prod_name], [Quantity]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'SONY', CAST(193 AS Numeric(18, 0)))
INSERT [dbo].[tbl_stock] ([stock_id], [prod_id], [prod_name], [Quantity]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'LG ', CAST(100 AS Numeric(18, 0)))
INSERT [dbo].[tbl_stock] ([stock_id], [prod_id], [prod_name], [Quantity]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), N'JHHJGDHF', CAST(562 AS Numeric(18, 0)))
INSERT [dbo].[tbl_stock] ([stock_id], [prod_id], [prod_name], [Quantity]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), N'UYER', CAST(56 AS Numeric(18, 0)))
INSERT [dbo].[tbl_user] ([uid], [username], [pass]) VALUES (CAST(1 AS Numeric(18, 0)), N'admin', N'admin')
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[15] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tbl_bill_items"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 153
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_category"
            Begin Extent = 
               Top = 98
               Left = 253
               Bottom = 265
               Right = 413
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_products"
            Begin Extent = 
               Top = 6
               Left = 434
               Bottom = 153
               Right = 594
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VIEW_BILL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VIEW_BILL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tbl_category"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 211
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_stock"
            Begin Extent = 
               Top = 9
               Left = 453
               Bottom = 268
               Right = 675
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_products"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 303
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VIEW_PRODUCTS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VIEW_PRODUCTS'
GO
USE [master]
GO
ALTER DATABASE [furnitureshop] SET  READ_WRITE 
GO
