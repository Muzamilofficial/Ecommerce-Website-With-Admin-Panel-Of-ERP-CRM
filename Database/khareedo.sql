USE [master]
GO
/****** Object:  Database [kahreedo]    Script Date: 12/07/2023 4:00:13 am ******/
CREATE DATABASE [kahreedo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kahreedo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\kahreedo.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'kahreedo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\kahreedo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [kahreedo] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kahreedo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kahreedo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kahreedo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kahreedo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kahreedo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kahreedo] SET ARITHABORT OFF 
GO
ALTER DATABASE [kahreedo] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [kahreedo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kahreedo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kahreedo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kahreedo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kahreedo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kahreedo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kahreedo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kahreedo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kahreedo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [kahreedo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kahreedo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kahreedo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kahreedo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kahreedo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kahreedo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kahreedo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kahreedo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [kahreedo] SET  MULTI_USER 
GO
ALTER DATABASE [kahreedo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kahreedo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kahreedo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kahreedo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [kahreedo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [kahreedo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [kahreedo] SET QUERY_STORE = ON
GO
ALTER DATABASE [kahreedo] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [kahreedo]
GO
/****** Object:  Table [dbo].[admin_Employee]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_Employee](
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NULL,
	[Age] [int] NULL,
	[DateofBirth] [date] NULL,
	[Gender] [varchar](10) NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[Phone] [varchar](15) NULL,
	[Mobile] [varchar](15) NOT NULL,
	[PhotoPath] [varchar](500) NULL,
	[Password] [nvarchar](150) NULL,
	[InActive] [bit] NULL,
 CONSTRAINT [PK_admin_Employee] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[admin_Login]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_Login](
	[LoginID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[RoleType] [int] NULL,
	[Notes] [varchar](255) NULL,
 CONSTRAINT [PK_admin_Login] PRIMARY KEY CLUSTERED 
(
	[LoginID] ASC,
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Description] [varchar](50) NULL,
	[Picture1] [varchar](255) NULL,
	[Picture2] [varchar](250) NULL,
	[isActive] [bit] NULL,
	[Createddate] [date] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerGoodReceiptNote]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerGoodReceiptNote](
	[GoodRecieptNote] [int] IDENTITY(1,1) NOT NULL,
	[CustomerQoutationID] [int] NULL,
	[ReqQoutationID] [int] NULL,
	[Product] [nvarchar](150) NULL,
	[Customer] [nvarchar](150) NULL,
	[QuantityNeeded] [int] NULL,
	[SupplierQuantity] [int] NULL,
	[UnitPrice] [int] NULL,
	[TotalPrice] [int] NULL,
	[SupQuantity] [nvarchar](150) NULL,
	[ConUnit] [nvarchar](150) NULL,
	[Tax] [nvarchar](150) NULL,
	[PaymentTerm] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GoodRecieptNote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerQoutation]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerQoutation](
	[CustomerQoutationID] [int] IDENTITY(1,1) NOT NULL,
	[ReqQoutationID] [int] NULL,
	[Product] [nvarchar](150) NULL,
	[Customer] [nvarchar](150) NULL,
	[QuantityNeeded] [int] NULL,
	[SupplierQuantity] [int] NULL,
	[UnitPrice] [int] NULL,
	[TotalPrice] [int] NULL,
	[Date] [date] NULL,
	[SaveQuantity] [nvarchar](150) NULL,
	[Tax] [nvarchar](150) NULL,
	[PaymentTerm] [int] NULL,
	[ConUnit] [nvarchar](150) NULL,
 CONSTRAINT [PK__Customer__7E084C7144842EAD] PRIMARY KEY CLUSTERED 
(
	[CustomerQoutationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerQoutationItems]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerQoutationItems](
	[CustomerQoutationID] [int] NULL,
	[ReqQoutationID] [int] NULL,
	[ProductID] [int] NULL,
	[CustomerID] [int] NULL,
	[QuantityNeeded] [int] NULL,
	[SupplierQuantity] [int] NULL,
	[UnitPrice] [int] NULL,
	[TotalPrice] [int] NULL,
	[Date] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerQuotationItems]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerQuotationItems](
	[reqQuotID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[qty] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[productName] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerRequestforQoutation]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerRequestforQoutation](
	[ReqQoutationID] [int] IDENTITY(1,1) NOT NULL,
	[Product] [int] NULL,
	[Customer] [int] NULL,
	[Quantity] [int] NULL,
	[ProductDate] [date] NULL,
	[custname] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReqQoutationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[First Name] [varchar](50) NOT NULL,
	[Last Name] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Age] [int] NULL,
	[Gender] [varchar](50) NULL,
	[DateofBirth] [date] NULL,
	[Organization] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[PostalCode] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[AltEmail] [varchar](50) NULL,
	[Phone1] [varchar](50) NULL,
	[Phone2] [varchar](20) NULL,
	[Mobile1] [varchar](50) NULL,
	[Mobile2] [varchar](50) NULL,
	[Address1] [varchar](50) NULL,
	[Address2] [varchar](50) NULL,
	[Picture] [varchar](250) NULL,
	[status] [varchar](50) NULL,
	[LastLogin] [datetime] NULL,
	[Created] [date] NULL,
	[Notes] [varchar](250) NULL,
	[InActive] [bit] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genMainSlider]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genMainSlider](
	[MainSliderID] [int] IDENTITY(1,1) NOT NULL,
	[ImageURL] [varchar](500) NULL,
	[AltText] [varchar](255) NULL,
	[OfferTag] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[Description] [varchar](255) NULL,
	[BtnText] [varchar](50) NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_genMainSlider] PRIMARY KEY CLUSTERED 
(
	[MainSliderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genPromoRight]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genPromoRight](
	[PromoRightID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ImageURL] [varchar](500) NULL,
	[AltText] [varchar](500) NULL,
	[OfferTag] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_genPromoRight] PRIMARY KEY CLUSTERED 
(
	[PromoRightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoodReceiptNote]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodReceiptNote](
	[GoodRecieptNote] [int] IDENTITY(1,1) NOT NULL,
	[SupplierQoutationID] [int] NULL,
	[ReqQoutationID] [int] NULL,
	[Product] [nvarchar](150) NULL,
	[Supplier] [nvarchar](150) NULL,
	[QuantityNeeded] [int] NULL,
	[SupplierQuantity] [int] NULL,
	[UnitPrice] [int] NULL,
	[TotalPrice] [int] NULL,
	[SupQuantity] [nvarchar](150) NULL,
	[ConUnit] [nvarchar](150) NULL,
	[Tax] [nvarchar](150) NULL,
	[PaymentTerm] [int] NULL,
 CONSTRAINT [PK__GoodRece__DD40853723EF2006] PRIMARY KEY CLUSTERED 
(
	[GoodRecieptNote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[PaymentID] [int] NULL,
	[ShippingID] [int] NULL,
	[Discount] [int] NULL,
	[Taxes] [int] NULL,
	[TotalAmount] [int] NULL,
	[isCompleted] [bit] NULL,
	[OrderDate] [datetime] NULL,
	[DIspatched] [bit] NULL,
	[DispatchedDate] [datetime] NULL,
	[Shipped] [bit] NULL,
	[ShippingDate] [datetime] NULL,
	[Deliver] [bit] NULL,
	[DeliveryDate] [datetime] NULL,
	[Notes] [varchar](500) NULL,
	[CancelOrder] [bit] NULL,
 CONSTRAINT [PK_Oder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
	[Discount] [decimal](18, 0) NULL,
	[TotalAmount] [decimal](18, 0) NULL,
	[OrderDate] [datetime] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[CreditAmount] [money] NULL,
	[DebitAmount] [money] NULL,
	[Balance] [money] NULL,
	[PaymentDateTime] [datetime] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[PayTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[PayTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[SubCategoryID] [int] NULL,
	[QuantityPerUnit] [varchar](50) NULL,
	[UnitPrice] [decimal](18, 0) NOT NULL,
	[OldPrice] [decimal](18, 0) NULL,
	[UnitWeight] [varchar](50) NULL,
	[Size] [varchar](50) NULL,
	[Discount] [decimal](18, 0) NULL,
	[UnitInStock] [int] NULL,
	[UnitOnOrder] [int] NULL,
	[ProductAvailable] [bit] NULL,
	[ImageURL] [varchar](500) NULL,
	[AltText] [varchar](50) NULL,
	[AddBadge] [bit] NULL,
	[OfferTitle] [varchar](50) NULL,
	[OfferBadgeClass] [varchar](50) NULL,
	[ShortDescription] [varchar](300) NULL,
	[LongDescription] [varchar](2000) NULL,
	[Picture1] [varchar](500) NULL,
	[Picture2] [varchar](500) NULL,
	[Picture3] [varchar](500) NULL,
	[Picture4] [varchar](500) NULL,
	[Note] [varchar](250) NULL,
	[UnitMeasureID] [int] NULL,
	[InActive] [bit] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseReturn]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseReturn](
	[PurchaseReturnID] [int] IDENTITY(1,1) NOT NULL,
	[Supplier] [int] NULL,
	[Product] [int] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PurchaseReturnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecentlyViews]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecentlyViews](
	[RViewID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ViewDate] [datetime] NOT NULL,
	[Note] [varchar](255) NULL,
 CONSTRAINT [PK_RecentlyViews] PRIMARY KEY CLUSTERED 
(
	[RViewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestforCustomerQuotationItems]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestforCustomerQuotationItems](
	[reqQuotID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[qty] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[productName] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestforQoutation]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestforQoutation](
	[ReqQoutationID] [int] IDENTITY(1,1) NOT NULL,
	[Product] [int] NULL,
	[Supplier] [int] NULL,
	[Quantity] [int] NULL,
	[ProductDate] [date] NULL,
	[suppName] [nchar](10) NULL,
 CONSTRAINT [PK__Requestf__6BA8829DBA55FCC9] PRIMARY KEY CLUSTERED 
(
	[ReqQoutationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestforQuotationItems]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestforQuotationItems](
	[reqQuotID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[qty] [int] NOT NULL,
	[supplierID] [int] NOT NULL,
	[productName] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[ProductID] [int] NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Review] [varchar](500) NULL,
	[Rate] [int] NULL,
	[DateTime] [datetime] NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
	[DateCreated] [date] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesReturn]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesReturn](
	[SalesID] [int] IDENTITY(1,1) NOT NULL,
	[Customer] [nvarchar](150) NULL,
	[Product] [int] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingDetails]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingDetails](
	[ShippingID] [int] NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Mobile] [varchar](20) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[Province] [varchar](20) NULL,
	[City] [varchar](20) NULL,
	[PostCode] [varchar](10) NULL,
 CONSTRAINT [PK_ShippingDetails] PRIMARY KEY CLUSTERED 
(
	[ShippingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Name] [nchar](20) NOT NULL,
	[Description] [varchar](250) NULL,
	[Picture1] [varchar](500) NULL,
	[Picture2] [varchar](500) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierQoutation]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierQoutation](
	[SupplierQoutationID] [int] IDENTITY(1,1) NOT NULL,
	[ReqQoutationID] [int] NULL,
	[Product] [nvarchar](150) NULL,
	[Supplier] [nvarchar](150) NULL,
	[QuantityNeeded] [int] NULL,
	[SupplierQuantity] [int] NULL,
	[UnitPrice] [int] NULL,
	[TotalPrice] [int] NULL,
	[Date] [date] NULL,
	[SaveQuantity] [nvarchar](150) NULL,
	[Tax] [nvarchar](150) NULL,
	[PaymentTerm] [int] NULL,
	[ConUnit] [nvarchar](150) NULL,
 CONSTRAINT [PK__Supplier__60CB486E7E1D135B] PRIMARY KEY CLUSTERED 
(
	[SupplierQoutationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierQoutationItems]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierQoutationItems](
	[SupplierQoutationID] [int] NULL,
	[ReqQoutationID] [int] NULL,
	[ProductID] [int] NULL,
	[SupplierID] [int] NULL,
	[QuantityNeeded] [int] NULL,
	[SupplierQuantity] [int] NULL,
	[UnitPrice] [int] NULL,
	[TotalPrice] [int] NULL,
	[Date] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[ContactName] [varchar](50) NULL,
	[ContactTitle] [varchar](50) NULL,
	[Address] [varchar](128) NULL,
	[Mobile] [varchar](15) NULL,
	[Phone] [varchar](15) NOT NULL,
	[Fax] [varchar](20) NULL,
	[Email] [varchar](50) NOT NULL,
	[City] [varchar](20) NULL,
	[Country] [varchar](20) NULL,
	[InActive] [bit] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_SupplierPayment]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SupplierPayment](
	[SupplierPaymentID] [int] IDENTITY(1,1) NOT NULL,
	[invoiceId] [int] NULL,
	[Supplier] [int] NULL,
	[PaymentDate] [date] NULL,
	[PaymentTerm] [int] NULL,
	[CreatedDate] [date] NULL,
	[Tax] [int] NULL,
	[Totalamount] [decimal](18, 2) NULL,
	[NetAmount] [decimal](18, 2) NULL,
	[Sup] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierPaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Tax]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Tax](
	[TaxID] [int] IDENTITY(1,1) NOT NULL,
	[TaxRate] [decimal](18, 0) NULL,
	[Taxcode] [nvarchar](150) NULL,
	[CreatedDate] [date] NULL,
	[TaxValue] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[TaxID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_UnitofMeasures]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UnitofMeasures](
	[UnitMeasureID] [int] IDENTITY(1,1) NOT NULL,
	[UnitMeasure] [nvarchar](150) NULL,
	[Description] [nvarchar](150) NULL,
	[Abbrevation] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[UnitMeasureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 12/07/2023 4:00:14 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[WishlistID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Wishlist] PRIMARY KEY CLUSTERED 
(
	[WishlistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin_Employee] ON 

INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (1, N'Hamza', N'Ali', 22, CAST(N'1994-08-26' AS Date), N'Male', N'hamza@gmail.com', N'karachi', N'02136256352', N'03441234567', NULL, N'124d', 1)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (5, N'Ali', N'Akram', 22, CAST(N'1997-08-26' AS Date), N'Male', N'zulfiqar@hotmail.com', N'karachi', N'03441234567', N'03441234567', NULL, N'a', 1)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (6, N'Rumail', N'Kumar', 22, CAST(N'1994-08-26' AS Date), N'Male', N'mevansharma4@gmail.com', N'flat# 201 adan wala appt garden east karachi', N'03420821307', N'03420821307', NULL, N'a', 1)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (7, N'mk', N'mk', 22, CAST(N'1994-08-26' AS Date), N'Female', N'mkmuzammil191@gmail.com', N'Model Colony malir Town Karachi', N'03363506933', N'03363506933', NULL, N'123', 1)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (8, N'Mevan', N'Kumar', 12, CAST(N'1994-08-26' AS Date), N'Female', N'mevansharma4@gmail.com', N'flat# 201 adan wala appt garden east karachi', N'+923420821307', N'+923420821307', NULL, N'123', NULL)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (9, N'Mevan', N'Kumar', 12, CAST(N'1994-08-26' AS Date), N'Male', N'mevansharma4@gmail.com', N'flat# 201 adan wala appt garden east karachi', N'+923420821307', N'+923420821307', NULL, N'123', NULL)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (10, N'mk', N'mk', 12, CAST(N'1990-12-12' AS Date), N'Male', N'mkmuzammil191@gmail.com', N'Model Colony malir Town Karachi', N'0336350693', N'0336350693', NULL, N'abc', NULL)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (11, N'mk', N'mk', 0, CAST(N'1990-12-12' AS Date), N'Male', N'mkmuzammil191@gmail.com', N'Model Colony malir Town Karachi', N'0336350693', N'0336350693', NULL, N'abc', NULL)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (12, N'mk', N'mk', 0, CAST(N'1990-12-12' AS Date), NULL, N'mkmuzammil191@gmail.com', N'Model Colony malir Town Karachi', N'03363506933', N'03363506933', NULL, N'abc', NULL)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (13, N'mk', N'mk', 12, CAST(N'1990-12-12' AS Date), N'Male', N'mkmuzammil191@gmail.com', N'Model Colony malir Town Karachi', N'03363506933', N'0336350693', NULL, N'abc', NULL)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (14, N'mk', N'mk', 12, CAST(N'1990-12-12' AS Date), NULL, N'mkmuzammil191@gmail.com', N'Model Colony malir Town Karachi', N'03363506933', N'033635069', NULL, N'abc', NULL)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (15, N'mk', N'mk', 12, CAST(N'1990-12-12' AS Date), N'Male', N'mkmuzammil191@gmail.com', N'Model Colony malir Town Karachi', N'03363506933', N'03363506933', NULL, N'abc', 1)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (16, N'mk', N'mk', 12, CAST(N'1990-12-12' AS Date), N'Male', N'mkmuzammil191@gmail.com', N'Model Colony malir Town Karachi', N'03363506933', N'03363506933', NULL, N'abc', 0)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (17, N'mk', N'mk', 12, CAST(N'1990-12-12' AS Date), N'Male', N'mkmuzammil191@gmail.com', N'Model Colony malir Town Karachi', N'03363506933', N'03363506933', NULL, N'abc', 0)
SET IDENTITY_INSERT [dbo].[admin_Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[admin_Login] ON 

INSERT [dbo].[admin_Login] ([LoginID], [EmpID], [UserName], [Password], [RoleType], [Notes]) VALUES (1, 1, N'Hamza123', N'123456', 2, NULL)
INSERT [dbo].[admin_Login] ([LoginID], [EmpID], [UserName], [Password], [RoleType], [Notes]) VALUES (2, 5, N'Zulfiqar', N'123456', 1, NULL)
INSERT [dbo].[admin_Login] ([LoginID], [EmpID], [UserName], [Password], [RoleType], [Notes]) VALUES (3, 6, N'rumail', N'123', 2, NULL)
SET IDENTITY_INSERT [dbo].[admin_Login] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive], [Createddate]) VALUES (1, N'Braking System', N'abc example', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive], [Createddate]) VALUES (2, N'Maintenance', N'abc example', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive], [Createddate]) VALUES (3, N'Handlebar Accesories', N'abc example', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive], [Createddate]) VALUES (4, N'Tires & Tubes', N'abc example', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive], [Createddate]) VALUES (5, N'misc121212', N'abc example', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive], [Createddate]) VALUES (6, N'Transmission', N'abc example', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive], [Createddate]) VALUES (7, N'Ignition System', N'abc example', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive], [Createddate]) VALUES (8, N'Filters', N'abc example', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive], [Createddate]) VALUES (9, N'Drive System', N'abc example', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive], [Createddate]) VALUES (10, N'Mirrors', N'abc example', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerGoodReceiptNote] ON 

INSERT [dbo].[CustomerGoodReceiptNote] ([GoodRecieptNote], [CustomerQoutationID], [ReqQoutationID], [Product], [Customer], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (1, 2, 7, N'Valeo, EBC Brakes20*20', N'1', NULL, NULL, NULL, 800, N'20*20', NULL, NULL, NULL)
INSERT [dbo].[CustomerGoodReceiptNote] ([GoodRecieptNote], [CustomerQoutationID], [ReqQoutationID], [Product], [Customer], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (2, 3, 7, N'Valeo, EBC Brakes20*20', N'1', NULL, NULL, NULL, 800, N'20*20', NULL, NULL, NULL)
INSERT [dbo].[CustomerGoodReceiptNote] ([GoodRecieptNote], [CustomerQoutationID], [ReqQoutationID], [Product], [Customer], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (3, 4, 7, NULL, N'1', NULL, NULL, NULL, 800, N'20*20', NULL, NULL, NULL)
INSERT [dbo].[CustomerGoodReceiptNote] ([GoodRecieptNote], [CustomerQoutationID], [ReqQoutationID], [Product], [Customer], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (4, 5, 9, N'Sachs, Exedy, Optima Batteries900*900*900', N'6', NULL, NULL, NULL, 2430000, N'900*900*900', NULL, NULL, NULL)
INSERT [dbo].[CustomerGoodReceiptNote] ([GoodRecieptNote], [CustomerQoutationID], [ReqQoutationID], [Product], [Customer], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (5, 8, 8, N'Sachs900', N'1', NULL, NULL, NULL, 18000, N'900', NULL, NULL, NULL)
INSERT [dbo].[CustomerGoodReceiptNote] ([GoodRecieptNote], [CustomerQoutationID], [ReqQoutationID], [Product], [Customer], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (6, 7, 8, N'Sachs', N'1', NULL, NULL, NULL, 26862, N'1221', NULL, NULL, NULL)
INSERT [dbo].[CustomerGoodReceiptNote] ([GoodRecieptNote], [CustomerQoutationID], [ReqQoutationID], [Product], [Customer], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (7, 6, 8, N'Sachs', N'1', NULL, NULL, NULL, 40959, N'123', NULL, NULL, NULL)
INSERT [dbo].[CustomerGoodReceiptNote] ([GoodRecieptNote], [CustomerQoutationID], [ReqQoutationID], [Product], [Customer], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (8, 15, 12, N'Exedy, Interstate Batteries, Ferodo', N'9', NULL, NULL, NULL, 432, N'12,12,12', NULL, NULL, NULL)
INSERT [dbo].[CustomerGoodReceiptNote] ([GoodRecieptNote], [CustomerQoutationID], [ReqQoutationID], [Product], [Customer], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (9, 14, 11, N'Luk', N'1', NULL, NULL, NULL, 144, N'12', N'12', N'12', 12)
INSERT [dbo].[CustomerGoodReceiptNote] ([GoodRecieptNote], [CustomerQoutationID], [ReqQoutationID], [Product], [Customer], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (10, 12, 12, N'Exedy, Interstate Batteries, Ferodo', N'9', NULL, NULL, NULL, 1200, N'20,20,20', NULL, N'20,20,20', NULL)
INSERT [dbo].[CustomerGoodReceiptNote] ([GoodRecieptNote], [CustomerQoutationID], [ReqQoutationID], [Product], [Customer], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (11, 9, 9, N'Sachs, Exedy, Optima Batteries, Valeo', N'1', NULL, NULL, NULL, 1600, N'20*20*20*20', NULL, NULL, NULL)
INSERT [dbo].[CustomerGoodReceiptNote] ([GoodRecieptNote], [CustomerQoutationID], [ReqQoutationID], [Product], [Customer], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (12, 16, 12, N'Exedy, Interstate Batteries, Ferodo', N'9', NULL, NULL, NULL, 1232, N'12,22,22', N'22,22,22', N'1,2,3', 1)
INSERT [dbo].[CustomerGoodReceiptNote] ([GoodRecieptNote], [CustomerQoutationID], [ReqQoutationID], [Product], [Customer], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (13, 13, 11, N'Luk', N'1', NULL, NULL, NULL, 4, N'2', NULL, N'2', NULL)
INSERT [dbo].[CustomerGoodReceiptNote] ([GoodRecieptNote], [CustomerQoutationID], [ReqQoutationID], [Product], [Customer], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (14, 17, 13, N'Sachs', N'1', NULL, NULL, NULL, 8, N'2', N'2', N'2', 2)
SET IDENTITY_INSERT [dbo].[CustomerGoodReceiptNote] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerQoutation] ON 

INSERT [dbo].[CustomerQoutation] ([CustomerQoutationID], [ReqQoutationID], [Product], [Customer], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (7, 12, NULL, N'9', NULL, NULL, NULL, 596, CAST(N'2023-07-10' AS Date), N'22*12*12', NULL, NULL, NULL)
INSERT [dbo].[CustomerQoutation] ([CustomerQoutationID], [ReqQoutationID], [Product], [Customer], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (8, 12, NULL, N'9', NULL, NULL, NULL, 432, CAST(N'2023-07-10' AS Date), N'20*20*1', NULL, NULL, NULL)
INSERT [dbo].[CustomerQoutation] ([CustomerQoutationID], [ReqQoutationID], [Product], [Customer], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (11, 11, NULL, N'1', NULL, NULL, NULL, 1, CAST(N'2023-07-10' AS Date), N'1', N'1', NULL, NULL)
SET IDENTITY_INSERT [dbo].[CustomerQoutation] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerRequestforQoutation] ON 

INSERT [dbo].[CustomerRequestforQoutation] ([ReqQoutationID], [Product], [Customer], [Quantity], [ProductDate], [custname]) VALUES (2, 1, 1, 199, CAST(N'2023-12-06' AS Date), NULL)
INSERT [dbo].[CustomerRequestforQoutation] ([ReqQoutationID], [Product], [Customer], [Quantity], [ProductDate], [custname]) VALUES (3, NULL, 1, NULL, CAST(N'2023-05-06' AS Date), N'Zulfiqar  ')
INSERT [dbo].[CustomerRequestforQoutation] ([ReqQoutationID], [Product], [Customer], [Quantity], [ProductDate], [custname]) VALUES (4, NULL, 1, NULL, CAST(N'2023-05-06' AS Date), N'Zulfiqar  ')
INSERT [dbo].[CustomerRequestforQoutation] ([ReqQoutationID], [Product], [Customer], [Quantity], [ProductDate], [custname]) VALUES (6, 6, 7, 199, CAST(N'2023-05-06' AS Date), NULL)
INSERT [dbo].[CustomerRequestforQoutation] ([ReqQoutationID], [Product], [Customer], [Quantity], [ProductDate], [custname]) VALUES (7, NULL, 1, NULL, CAST(N'2023-05-06' AS Date), N'Zulfiqar  ')
INSERT [dbo].[CustomerRequestforQoutation] ([ReqQoutationID], [Product], [Customer], [Quantity], [ProductDate], [custname]) VALUES (8, NULL, 1, NULL, CAST(N'2023-05-06' AS Date), N'Zulfiqar  ')
INSERT [dbo].[CustomerRequestforQoutation] ([ReqQoutationID], [Product], [Customer], [Quantity], [ProductDate], [custname]) VALUES (9, NULL, 1, NULL, CAST(N'2023-05-06' AS Date), N'Zulfiqar  ')
INSERT [dbo].[CustomerRequestforQoutation] ([ReqQoutationID], [Product], [Customer], [Quantity], [ProductDate], [custname]) VALUES (10, NULL, 7, NULL, CAST(N'2023-05-06' AS Date), N'Faraz     ')
INSERT [dbo].[CustomerRequestforQoutation] ([ReqQoutationID], [Product], [Customer], [Quantity], [ProductDate], [custname]) VALUES (11, NULL, 1, NULL, CAST(N'2023-05-06' AS Date), N'Zulfiqar  ')
INSERT [dbo].[CustomerRequestforQoutation] ([ReqQoutationID], [Product], [Customer], [Quantity], [ProductDate], [custname]) VALUES (12, NULL, 9, NULL, CAST(N'2023-05-06' AS Date), N'Mosa      ')
INSERT [dbo].[CustomerRequestforQoutation] ([ReqQoutationID], [Product], [Customer], [Quantity], [ProductDate], [custname]) VALUES (13, NULL, 1, NULL, CAST(N'2023-05-06' AS Date), N'Zulfiqar  ')
SET IDENTITY_INSERT [dbo].[CustomerRequestforQoutation] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes], [InActive]) VALUES (1, N'Zulfiqar', N'Akram', N'Zulfiqar', N'1234', 22, N'Male', CAST(N'1994-08-26' AS Date), N'BUKC', N'Pakistan', N'Sindh', N'Karachi', N'75300', N'zulfiqar.akram366@yahoo.com', NULL, N'02112354887', NULL, N'+923448127902', NULL, N'Majeed SRE Dalmain karachi', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes], [InActive]) VALUES (6, N'Ali', N'Sultan', N'Ali-Sultan', N'1234', NULL, NULL, NULL, NULL, N'Pakistan', NULL, NULL, NULL, N'ali123@gmail.com', NULL, NULL, NULL, N'03441234567', NULL, N'karachi', NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes], [InActive]) VALUES (7, N'Faraz', N'Ali', N'FarazAli', N'1234', NULL, NULL, NULL, NULL, N'China', NULL, NULL, NULL, N'faraz@hotmail.com', NULL, NULL, NULL, N'03441234567', NULL, N'karachi', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes], [InActive]) VALUES (8, N'inzi', N'mam', N'inzi', N'1234', NULL, NULL, NULL, NULL, N'USA', NULL, NULL, NULL, N'inzi@gmail.com', NULL, NULL, NULL, N'03441234567', NULL, N'cpo14-1', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes], [InActive]) VALUES (9, N'Mosa', N'Khan', N'Mosa', N'1234', NULL, NULL, NULL, NULL, N'India', NULL, NULL, NULL, N'mosa123@gmail.com', NULL, NULL, NULL, N'+923448127902', NULL, N'Dalmain karachi', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes], [InActive]) VALUES (10, N'Sajjad', N'Akram', N'zulfi', N'12345', NULL, NULL, NULL, NULL, N'India', NULL, NULL, NULL, N'zulfiqar.akram366@yahoo.com', NULL, NULL, NULL, N'+923448127902', NULL, N'Dalmain karachi', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes], [InActive]) VALUES (11, N'Zulfiqar', N'Akram', N'zulfiqarAkram', N'1234', 22, N'Male', CAST(N'1994-08-26' AS Date), NULL, N'Pakistan', N'sindh', N'Karachi', N'75300', N'zulfiqar.akram366@yahoo.com', NULL, NULL, NULL, N'+923448127902', NULL, N'Dalmain karachi, ', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes], [InActive]) VALUES (12, N'Ali', N'Khan', N'AliKhan', N'1234', NULL, NULL, NULL, NULL, N'India', NULL, NULL, NULL, N'ali123@gmail.com', NULL, NULL, NULL, N'03441234567', NULL, N'karachi, punjab', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes], [InActive]) VALUES (13, N'mk', N'mk', N'mk', N'123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'mkmuzammil191@gmail.com', NULL, NULL, NULL, N'03363506933', NULL, N'model coloy', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes], [InActive]) VALUES (18, N'abc', N'abc', N'abc', N'abc', 12, N'abc', CAST(N'1990-12-12' AS Date), N'abc', N'abc', N'abc', N'abc', N'abc', N'abc', NULL, N'abc', NULL, N'abc', NULL, N'abc', NULL, NULL, NULL, NULL, CAST(N'2023-07-12' AS Date), NULL, 1)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes], [InActive]) VALUES (19, N'q', N'q', N'q', N'q', 12, N'a', CAST(N'1990-12-12' AS Date), N'a', N'a', N'a', N'a', N'12', N'mkmuzammil191@gmail.com', N'mkmuzammil191@gmail.com', N'as11', NULL, N'as11', NULL, N'Model Colony malir Town Karachi', NULL, NULL, NULL, NULL, CAST(N'2023-07-12' AS Date), NULL, 0)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes], [InActive]) VALUES (20, N'mk', N'mk', N'Hamza123', N'abc', 12, N'abc', CAST(N'1990-12-12' AS Date), N'a', N'Pakistan', N'abc', N'Karachi', N'74000', N'mkmuzammil191@gmail.com', N'mkmuzammil191@gmail.com', N'03363506933', NULL, N'03363506933', NULL, N'Model Colony malir Town Karachi', NULL, NULL, NULL, NULL, CAST(N'2023-07-12' AS Date), NULL, 0)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[genMainSlider] ON 

INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (1, N'/Content/img/s1.jpg', N'.', N'Save Up to 75% Off', N'Exclusives Brakes', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.', N'SHOP NOW', 0)
INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (2, N'/Content/img/s2.jpg', N'.', N'Save Up to 40% Off', N'Batteries Stock', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.', N'SHOP NOW', 0)
INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (3, N'/Content/img/s3.jpg', N'.', N'Save Up to 75% Off', N'Car Ac Components', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.', N'SHOP NOW', 0)
INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (4, N'/Content/img/s4.jpg', N'.', N'Save Up to 75% Off', N'Tires', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.', N'SHOP NOW', 0)
INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (5, N'/Content/img/s5.jpg', N'.', N'Save Up to 50% Off', N'Mirrors', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.', N'SHOP NOW', 0)
SET IDENTITY_INSERT [dbo].[genMainSlider] OFF
GO
SET IDENTITY_INSERT [dbo].[genPromoRight] ON 

INSERT [dbo].[genPromoRight] ([PromoRightID], [CategoryID], [ImageURL], [AltText], [OfferTag], [Title], [isDeleted]) VALUES (0, 1, N'/Content/img/1.png', N'img', N'50% off', N'BRAKING SYSTEM', 0)
INSERT [dbo].[genPromoRight] ([PromoRightID], [CategoryID], [ImageURL], [AltText], [OfferTag], [Title], [isDeleted]) VALUES (1, 5, N'/Content/img/17.png', N'img', N'Sales off', N'Misc', 0)
INSERT [dbo].[genPromoRight] ([PromoRightID], [CategoryID], [ImageURL], [AltText], [OfferTag], [Title], [isDeleted]) VALUES (2, 3, N'/Content/img/h1.png', N'img', N'New Arrivals', N'HANDLEBAR ACCESORIES', 0)
INSERT [dbo].[genPromoRight] ([PromoRightID], [CategoryID], [ImageURL], [AltText], [OfferTag], [Title], [isDeleted]) VALUES (3, 4, N'/Content/img/18.png', N'img', N'25% off', N'TIRES & TUBES', 0)
SET IDENTITY_INSERT [dbo].[genPromoRight] OFF
GO
SET IDENTITY_INSERT [dbo].[GoodReceiptNote] ON 

INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (6, 34, 76, NULL, N'3', NULL, NULL, NULL, 37684, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (7, 34, 76, NULL, N'3', NULL, NULL, NULL, 37684, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (8, 34, 76, NULL, N'3', NULL, NULL, NULL, 37684, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (9, 34, 76, NULL, N'3', NULL, NULL, NULL, 37684, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (10, 34, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 37684, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (11, 34, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 37684, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (12, 34, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 37684, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (13, 34, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 37684, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (14, 36, 77, N'Valeo, Ferodo, Interstate Batteries, Duralast', N'3', NULL, NULL, NULL, 30034, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (15, 35, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 27124, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (16, 37, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 27368, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (17, 40, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 37684, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (18, 41, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 162, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (19, 42, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 18180, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (20, 43, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, -2, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (21, 58, 76, N'Valeo, TEXTAR20x20     ', N'3', NULL, NULL, NULL, 800, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (22, 59, 76, N'Valeo, TEXTAR20
20
  ', N'3', NULL, NULL, NULL, 800, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (23, 44, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 454, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (24, 45, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 19392, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (25, 60, 76, N'Valeo, TEXTAR20*20     ', N'3', NULL, NULL, NULL, 800, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (26, 61, 76, N'Valeo, TEXTAR20*20     ', N'3', NULL, 0, NULL, 800, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (27, 62, 76, N'Valeo, TEXTAR20*20     ', N'3', NULL, NULL, NULL, 800, N'20*20     ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (28, 46, 76, N'Valeo', N'3', NULL, NULL, NULL, 27124, N'20        ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (29, 93, 87, N'Exedy, Valeo, Bosch1*1*1     ', N'2', NULL, NULL, NULL, 36, N'1*1*1     ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (30, 95, 76, N'Valeo, TEXTAR200*200   ', N'3', NULL, NULL, NULL, 160000, N'200*200   ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (31, 102, 76, N'Valeo, TEXTAR1*1       ', N'3', NULL, NULL, NULL, 2, N'1*1       ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (32, 101, 76, N'Valeo, TEXTAR900*900   ', N'3', NULL, NULL, NULL, 1620000, N'900*900   ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (33, 100, 76, N'Valeo, TEXTAR12*12     ', N'3', NULL, NULL, NULL, 0, N'12*12     ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (34, 99, 76, N'', N'3', NULL, NULL, NULL, -775, N'89*9      ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (35, 47, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 27124, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (36, 97, 87, N'Exedy, Valeo, Bosch78*9*8    ', N'2', NULL, NULL, NULL, 1417, N'78*9*8    ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (37, 98, 76, N'Valeo, TEXTAR1*1       ', N'3', NULL, NULL, NULL, -2, N'1*1       ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (38, 96, 82, N'Braker10        ', N'2', NULL, NULL, NULL, 1110, N'10        ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (39, 92, 76, N'Valeo, TEXTAR2*2*2*2   ', N'3', NULL, NULL, NULL, 8, N'2*2*2*2   ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (40, 91, 76, N'2*2*2*2   ', N'3', NULL, NULL, NULL, 8, N'2*2*2*2   ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (41, 83, 86, N'Braker, Bosch, TEXTAR1*1*1     ', N'2', NULL, NULL, NULL, 3, N'1*1*1     ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (42, 89, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 8, N'0*1*0*1   ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (43, 86, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 2, N'1*1       ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (44, 80, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 8, N'2*2*2*2   ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (45, 109, 88, N'Exedy, EverStart, Optima Batteries, Ferodo123*123*123*123', N'3', NULL, NULL, NULL, 60516, N'123*123*123*123', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (46, 111, 95, N'Braker, Power Stop, DieHard1*1*1', N'2', NULL, NULL, NULL, 3, N'1*1*1', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (47, 110, 76, N'Valeo, TEXTAR20*1', N'3', NULL, NULL, NULL, 21, N'20*1', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (48, 116, 104, N'Akebono, Power Stop', N'3', NULL, NULL, NULL, 288, N'12*12', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (49, 118, 104, N'Akebono, Power Stop', N'3', NULL, NULL, NULL, 1848, N'23*33', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (50, 119, 115, N'Sachs, EverStart, Ferodo', N'2', NULL, NULL, NULL, 288, N'12*12*0', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (51, 117, 112, N'Valeo', N'3', NULL, NULL, NULL, 18000, N'900', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (52, 121, 115, N'Sachs, EverStart, Ferodo', N'2', NULL, NULL, NULL, 432, N'12*12*12', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (53, 48, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, -29088, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (54, 120, 115, N'Sachs, EverStart, Ferodo', N'2', NULL, NULL, NULL, 1232, N'12*22*22', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (55, 121, 115, N'Sachs, EverStart, Ferodo', N'2', NULL, NULL, NULL, 432, N'12*12*12', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (56, 122, 115, N'Sachs, EverStart, Ferodo', N'2', NULL, NULL, NULL, 432, N'12,12,12', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (57, 115, 112, N'Valeo', N'3', NULL, NULL, NULL, 144, N'12', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (58, 148, 112, N'Valeo', N'3', NULL, NULL, NULL, 1, N'1', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (59, 147, 114, N'Sachs, DieHard', N'3', NULL, NULL, NULL, 968, N'22,22', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (60, 146, 112, N'Valeo', N'3', NULL, NULL, NULL, 2, N'1', N'2:1', N'3', 4)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (61, 149, 115, N'Sachs, EverStart, Ferodo', N'2', NULL, NULL, NULL, 1452, N'22,22,22', N'22,22,22', N'22,22,22', 12)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (62, 150, 115, N'Sachs, EverStart, Ferodo', N'2', NULL, NULL, NULL, 22000, N'20,100,100', N'100,100,100', N'100,100,100', 100)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (63, 145, 114, N'Sachs, DieHard', N'3', NULL, NULL, NULL, 528, N'12,12', N'22:12,22:12', N'22,22', 12)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (64, 144, 115, N'Sachs, EverStart, Ferodo', N'2', NULL, NULL, NULL, 672, N'12,12,12', N'22', N'2,2,2', 1)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (65, 151, 115, N'Sachs, EverStart, Ferodo', N'2', NULL, NULL, NULL, 1200, N'20,20,20', N'20,20,20', N'1,1,1', 1)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (66, 49, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 10748, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (67, 152, 117, N'Centerforce, Optima Batteries, TEXTAR, DieHard', N'2', NULL, NULL, NULL, 444, N'12,12,12,12', N'12,21,2,2', N'12,12,12,21', 13)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (68, 154, 118, N'EBC Brakes', N'3', NULL, NULL, NULL, 8, N'2', N'2', N'2', 2)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (69, 153, 118, N'EBC Brakes', N'3', NULL, NULL, NULL, 4, N'2', N'2', N'2', 2)
SET IDENTITY_INSERT [dbo].[GoodReceiptNote] OFF
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (1, 1, 1, 1, 0, 0, 450, 1, CAST(N'2016-09-09T20:54:32.980' AS DateTime), 0, NULL, 0, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (2, 6, 2, 2, 0, 0, 3250, 1, CAST(N'2016-09-11T17:57:16.727' AS DateTime), 1, NULL, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (3, 7, 3, 3, 0, 0, 1000, 1, CAST(N'2016-09-11T18:01:33.653' AS DateTime), 0, NULL, 1, NULL, 0, NULL, NULL, 0)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (4, 1, 4, 4, 0, 0, 3650, 1, CAST(N'2016-09-11T18:07:10.180' AS DateTime), 0, NULL, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (5, 6, 5, 5, 0, 0, 2550, 1, CAST(N'2016-09-12T11:48:10.897' AS DateTime), 0, NULL, 1, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (6, 6, 6, 6, 0, 0, 1400, 1, CAST(N'2016-09-12T11:49:50.607' AS DateTime), 0, NULL, 1, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (7, 8, 7, 7, 0, 0, 1600, 1, CAST(N'2016-09-12T13:15:02.647' AS DateTime), 0, NULL, 1, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (8, 1, 8, 8, 0, NULL, 6650, 1, CAST(N'2016-09-16T22:47:37.677' AS DateTime), 0, NULL, 1, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (9, 1, 9, 9, 0, NULL, 2350, 1, CAST(N'2016-09-17T15:47:05.120' AS DateTime), 0, NULL, 1, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (10, 12, 10, 10, 0, NULL, 6950, 1, CAST(N'2016-09-17T22:33:22.687' AS DateTime), 0, NULL, 1, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (11, 13, 11, 11, 0, NULL, 850, 1, CAST(N'2023-06-20T13:49:50.123' AS DateTime), 0, NULL, 1, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (12, 13, 12, 12, 0, NULL, 700, 1, CAST(N'2023-06-20T14:41:33.707' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (13, 13, 13, 13, 0, NULL, 2400, 1, CAST(N'2023-06-28T00:54:07.963' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (14, 13, 14, 14, 0, NULL, 400, 1, CAST(N'2023-07-03T13:35:57.380' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (1, 1, 3, CAST(450 AS Decimal(18, 0)), 1, NULL, CAST(450 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (2, 2, 3, CAST(450 AS Decimal(18, 0)), 1, NULL, CAST(450 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (3, 2, 29, CAST(900 AS Decimal(18, 0)), 2, NULL, CAST(1800 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (4, 2, 1, CAST(550 AS Decimal(18, 0)), 3, NULL, CAST(1650 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (5, 2, 25, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (6, 2, 4, CAST(800 AS Decimal(18, 0)), 3, NULL, CAST(2400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (7, 3, 1, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (8, 3, 3, CAST(450 AS Decimal(18, 0)), 3, NULL, CAST(1350 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (9, 4, 3, CAST(450 AS Decimal(18, 0)), 1, NULL, CAST(450 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (10, 4, 2, CAST(700 AS Decimal(18, 0)), 1, NULL, CAST(700 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (11, 4, 1, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (12, 4, 26, CAST(850 AS Decimal(18, 0)), 1, NULL, CAST(850 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (13, 4, 30, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (14, 4, 33, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (15, 5, 3, CAST(450 AS Decimal(18, 0)), 1, NULL, CAST(450 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (16, 5, 25, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (17, 5, 5, CAST(700 AS Decimal(18, 0)), 1, NULL, CAST(700 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (18, 5, 34, CAST(850 AS Decimal(18, 0)), 1, NULL, CAST(850 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (19, 6, 2, CAST(700 AS Decimal(18, 0)), 2, NULL, CAST(1400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (20, 7, 2, CAST(700 AS Decimal(18, 0)), 1, NULL, CAST(700 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (21, 7, 3, CAST(450 AS Decimal(18, 0)), 2, NULL, CAST(900 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (22, 8, 7, CAST(700 AS Decimal(18, 0)), 4, NULL, CAST(2800 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (23, 8, 25, CAST(550 AS Decimal(18, 0)), 7, NULL, CAST(3850 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (24, 9, 2, CAST(700 AS Decimal(18, 0)), 1, NULL, CAST(700 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (25, 9, 31, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (26, 9, 33, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (27, 9, 30, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (28, 10, 1, CAST(550 AS Decimal(18, 0)), 5, NULL, CAST(2750 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (29, 10, 29, CAST(900 AS Decimal(18, 0)), 3, NULL, CAST(2700 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (30, 10, 35, CAST(750 AS Decimal(18, 0)), 2, NULL, CAST(1500 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (31, 11, 10, CAST(850 AS Decimal(18, 0)), 1, NULL, CAST(850 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (32, 12, 6, CAST(700 AS Decimal(18, 0)), 1, NULL, CAST(700 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (33, 13, 1, CAST(400 AS Decimal(18, 0)), 1, NULL, CAST(400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (34, 13, 1, CAST(400 AS Decimal(18, 0)), 1, NULL, CAST(400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (35, 13, 1, CAST(400 AS Decimal(18, 0)), 1, NULL, CAST(400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (36, 13, 1, CAST(400 AS Decimal(18, 0)), 1, NULL, CAST(400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (37, 13, 1, CAST(400 AS Decimal(18, 0)), 1, NULL, CAST(400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (38, 13, 1, CAST(400 AS Decimal(18, 0)), 1, NULL, CAST(400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (39, 14, 1, CAST(400 AS Decimal(18, 0)), 1, NULL, CAST(400 AS Decimal(18, 0)), NULL)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (3, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (4, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (5, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (6, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (7, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (8, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (9, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (10, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (11, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (12, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (13, 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (14, 1, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[PaymentType] ON 

INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (1, N'Cash on Delivery', NULL)
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (2, N'Paypal', NULL)
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (3, N'Master Card', NULL)
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (4, N'Easypaisa', NULL)
SET IDENTITY_INSERT [dbo].[PaymentType] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (1, N'Braker', 2, 1, 1, N'3', CAST(400 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), N'90', N'12', NULL, 487, 21, 1, N'/Content/img/1.png', N'.', 1, N'SALE!', N'aa-saless', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (2, N'Brembo', 2, 1, 6, NULL, CAST(700 AS Decimal(18, 0)), CAST(850 AS Decimal(18, 0)), NULL, NULL, NULL, 0, NULL, NULL, N'/Content/img/2.png', N'.', 1, N'SOLD OUT', N'aa-sold-out', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (3, N'EBC Brakes
', 2, 1, 6, NULL, CAST(450 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 9, NULL, NULL, N'/Content/img/3.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (4, N'Ferodo', 2, 1, 6, NULL, CAST(800 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), NULL, NULL, NULL, 48, NULL, NULL, N'/Content/img/4.png', N'.', 1, N'HOT!', N'aa-hot', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (5, N'Bosch', 2, 1, 6, NULL, CAST(700 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 51, NULL, NULL, N'/Content/img/5.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (6, N'Akebono
', 2, 1, 6, NULL, CAST(700 AS Decimal(18, 0)), CAST(950 AS Decimal(18, 0)), NULL, NULL, NULL, 99, NULL, NULL, N'/Content/img/6.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (7, N'TEXTAR', 2, 1, 6, NULL, CAST(700 AS Decimal(18, 0)), CAST(950 AS Decimal(18, 0)), NULL, NULL, NULL, 20, NULL, NULL, N'/Content/img/7.png', N'.', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (8, N'Power Stop
', 2, 1, 6, NULL, CAST(700 AS Decimal(18, 0)), CAST(850 AS Decimal(18, 0)), NULL, NULL, NULL, 0, NULL, NULL, N'/Content/img/8.png', N'.', 1, N'SOLD OUT', N'aa-sold-out', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (9, N'AC Delco', 2, 2, 1, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 0, NULL, NULL, N'/Content/img/9.png', N'.', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (10, N'Optima Batteries
', 2, 2, 1, NULL, CAST(850 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 8, NULL, NULL, N'/Content/img/10.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (11, N'Exide', 2, 2, 1, NULL, CAST(750 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 25, NULL, NULL, N'/Content/img/11.png', N'.', 1, N'HOT!', N'aa-hot', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (12, N'Interstate Batteries
', 2, 2, 1, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 2, NULL, NULL, N'/Content/img/12.png', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (13, N'DieHard', 2, 2, 1, NULL, CAST(900 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 8, NULL, NULL, N'/Content/img/13.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (14, N'Bosch', 2, 2, 1, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 0, NULL, NULL, N'/Content/img/14.png', N'.', 1, N'SOLD OUT!', N'aa-sold-out', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (15, N'Duralast', 2, 2, 1, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 16, NULL, NULL, N'/Content/img/15.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (16, N'EverStart', 2, 2, 1, NULL, CAST(1500 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 18, NULL, NULL, N'/Content/img/16.png', N'.', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (25, N'Exedy', 2, 4, 2, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 45, NULL, NULL, N'/Content/img/17.png', N'.', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (26, N'Sachs', 2, 4, 2, NULL, CAST(850 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 249, NULL, NULL, N'/Content/img/18.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (27, N'Valeo', 2, 4, 2, NULL, CAST(750 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 33, NULL, NULL, N'/Content/img/19.png', N'.', 1, N'HOT!', N'aa-hot', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (28, N'Luk', 2, 4, 2, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 0, NULL, NULL, N'/Content/img/20.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (29, N'ACT (Advanced Clutch Technology)', 2, 4, 2, NULL, CAST(900 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 0, NULL, NULL, N'/Content/img/21.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (30, N'Centerforce', 2, 4, 2, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 0, NULL, NULL, N'/Content/img/22.png', N'.', 1, N'SOLD OUT!', N'aa-sold-out', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (31, N'SPEC Clutch
', 2, 4, 2, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 8, NULL, NULL, N'/Content/img/23.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (32, N'Clutch Masters
', 2, 4, 2, NULL, CAST(1500 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 3, NULL, NULL, N'/Content/img/24.png', N'.', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (33, N'Garrett ', 2, 6, NULL, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 30, NULL, NULL, N'/Content/img/25.png', N'.', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (34, N'BorgWarner ', 2, 6, NULL, NULL, CAST(850 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 29, NULL, NULL, N'/Content/img/30.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (35, N'Mitsubishi Heavy Industries', 2, 6, NULL, NULL, CAST(750 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 21, NULL, NULL, N'/Content/img/31.png', N'.', 1, N'HOT!', N'aa-hot', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (36, N'IHI Corporation', 2, 6, NULL, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 19, NULL, NULL, N'/Content/img/32.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (37, N'Holset ', 2, 6, NULL, NULL, CAST(900 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 9, NULL, NULL, N'/Content/img/34.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (38, N'ABB Turbo Systems', 2, 6, NULL, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 4, NULL, NULL, N'/Content/img/30.png', N'.', 1, N'SOLD OUT!', N'aa-sold-out', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (39, N'Precision Turbo & Engine', 2, 6, NULL, NULL, CAST(550 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), NULL, NULL, NULL, 2, NULL, NULL, N'/Content/img/31.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (40, N'Turbonetics', 2, 6, NULL, NULL, CAST(1500 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, 11, NULL, NULL, N'/Content/img/32.png', N'.', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (42, N'Brake New Addional', 3, 5, 6, N'0', CAST(200 AS Decimal(18, 0)), CAST(3000 AS Decimal(18, 0)), N'3 kg', N'3 lbs', NULL, 2000, 100, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (43, N'Brake New Addional', 2, 1, 1, N'-88', CAST(-90 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, -300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (45, N'Brake New Addional', 2, 1, 1, N'-2222', CAST(200 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (46, N'mk', 2, 1, 1, N'100kh', CAST(200 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), N'200', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (47, N'new cat', 3, 3, 19, N'100', CAST(1200 AS Decimal(18, 0)), CAST(22 AS Decimal(18, 0)), N'2000', N'3 lbs', CAST(2000 AS Decimal(18, 0)), 200, 300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (48, N'Zic', 2, 1, 1, N'2000', CAST(1200 AS Decimal(18, 0)), CAST(3000 AS Decimal(18, 0)), N'3 kg', N'3 lbs', CAST(2 AS Decimal(18, 0)), 300, 400, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (49, N'xyz', 2, 1, 1, N'100', CAST(20 AS Decimal(18, 0)), CAST(17 AS Decimal(18, 0)), N'100', N'20', CAST(10 AS Decimal(18, 0)), 800, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (50, N'abc', 4, 7, 20, N'2000', CAST(90 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), N'-3', N'12', NULL, 12, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseReturn] ON 

INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (1, 3, 42, 199)
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (2, 3, 42, 1801)
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (3, 3, 42, 1801)
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (4, 3, 42, 1801)
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (5, 3, 1, 2)
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (6, 2, 1, 4)
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (7, 2, 2, 2)
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (8, 2, 2, 2)
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (9, 2, 2, 1)
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (10, 2, 2, 1)
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (11, 3, 2, 1)
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (12, 2, 2, 1)
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (13, 2, 1, 1)
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (14, 2, 1, 12)
SET IDENTITY_INSERT [dbo].[PurchaseReturn] OFF
GO
SET IDENTITY_INSERT [dbo].[RecentlyViews] ON 

INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (1, 8, 3, CAST(N'2016-09-12T13:04:22.833' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (2, 8, 3, CAST(N'2016-09-12T13:06:15.157' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (3, 8, 3, CAST(N'2016-09-12T13:06:23.053' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (4, 8, 3, CAST(N'2016-09-12T13:08:32.260' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (5, 8, 3, CAST(N'2016-09-12T13:08:38.983' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (6, 8, 3, CAST(N'2016-09-12T13:09:03.177' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (7, 8, 3, CAST(N'2016-09-12T13:11:26.760' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (8, 8, 2, CAST(N'2016-09-12T13:13:51.517' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (10, 9, 5, CAST(N'2016-09-16T21:23:59.193' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (11, 9, 31, CAST(N'2016-09-16T21:24:08.987' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (12, 9, 4, CAST(N'2016-09-16T21:24:18.577' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (13, 9, 10, CAST(N'2016-09-16T21:25:00.783' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (14, 1, 6, CAST(N'2016-09-16T22:27:00.397' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (15, 1, 3, CAST(N'2016-09-16T22:27:04.163' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (16, 1, 27, CAST(N'2016-09-16T22:27:09.210' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (17, 1, 7, CAST(N'2016-09-16T22:27:13.827' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (18, 1, 7, CAST(N'2016-09-16T22:27:17.980' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (19, 1, 7, CAST(N'2016-09-16T22:27:18.000' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (20, 1, 2, CAST(N'2016-09-16T22:35:59.680' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (21, 1, 6, CAST(N'2016-09-16T22:36:14.390' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (22, 1, 5, CAST(N'2016-09-16T22:36:44.520' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (23, 1, 2, CAST(N'2016-09-16T22:44:09.607' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (24, 1, 2, CAST(N'2016-09-16T22:44:15.410' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (25, 1, 7, CAST(N'2016-09-16T22:46:56.820' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (26, 1, 25, CAST(N'2016-09-16T22:47:05.047' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (27, 1, 25, CAST(N'2016-09-16T22:47:12.357' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (28, 1, 25, CAST(N'2016-09-16T22:47:12.407' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (29, 10, 3, CAST(N'2016-09-16T23:27:42.397' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (30, 10, 3, CAST(N'2016-09-16T23:27:45.477' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (31, 10, 3, CAST(N'2016-09-16T23:27:45.523' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (32, 10, 4, CAST(N'2016-09-16T23:28:35.837' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (33, 1, 2, CAST(N'2016-09-17T15:44:58.923' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (34, 1, 31, CAST(N'2016-09-17T15:45:06.387' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (35, 1, 33, CAST(N'2016-09-17T15:45:15.667' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (36, 1, 30, CAST(N'2016-09-17T15:45:21.820' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (37, 11, 28, CAST(N'2016-09-17T22:25:05.957' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (38, 11, 30, CAST(N'2016-09-17T22:25:13.003' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (39, 11, 34, CAST(N'2016-09-17T22:25:24.977' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (40, 11, 3, CAST(N'2016-09-17T22:25:45.587' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (41, 11, 3, CAST(N'2016-09-17T22:29:14.070' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (42, 11, 3, CAST(N'2016-09-17T22:29:30.140' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (43, 12, 1, CAST(N'2016-09-17T22:30:48.747' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (44, 12, 29, CAST(N'2016-09-17T22:31:00.773' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (45, 12, 26, CAST(N'2016-09-17T22:31:06.380' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (46, 12, 35, CAST(N'2016-09-17T22:31:41.210' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (47, 12, 35, CAST(N'2016-09-17T22:32:11.543' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (48, 12, 35, CAST(N'2016-09-17T22:32:22.803' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (49, 12, 35, CAST(N'2016-09-17T22:32:22.840' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (50, 13, 1, CAST(N'2023-06-20T13:41:35.327' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (51, 13, 1, CAST(N'2023-06-20T13:41:39.620' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (52, 13, 1, CAST(N'2023-06-20T13:45:07.237' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (53, 13, 1, CAST(N'2023-06-20T13:45:12.980' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (54, 13, 10, CAST(N'2023-06-20T13:48:28.457' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (55, 13, 13, CAST(N'2023-06-20T14:39:57.180' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (56, 13, 13, CAST(N'2023-06-20T14:39:57.940' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (57, 13, 13, CAST(N'2023-06-20T14:39:58.347' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (58, 13, 13, CAST(N'2023-06-20T14:39:58.573' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (59, 13, 13, CAST(N'2023-06-20T14:40:00.087' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (60, 13, 6, CAST(N'2023-06-20T14:41:08.433' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (61, 13, 1, CAST(N'2023-06-27T19:09:11.657' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (62, 13, 1, CAST(N'2023-06-27T19:11:32.427' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (63, 13, 1, CAST(N'2023-06-27T19:11:46.747' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (64, 13, 1, CAST(N'2023-06-27T19:15:53.563' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (65, 13, 1, CAST(N'2023-06-27T19:20:06.450' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (66, 13, 1, CAST(N'2023-06-27T19:20:06.610' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (67, 13, 1, CAST(N'2023-06-27T19:20:16.107' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (68, 13, 1, CAST(N'2023-06-27T19:20:18.687' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (69, 13, 1, CAST(N'2023-06-27T19:22:38.417' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (70, 13, 1, CAST(N'2023-06-27T19:22:41.703' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (71, 13, 1, CAST(N'2023-06-27T19:22:59.160' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (72, 13, 1, CAST(N'2023-06-27T19:23:01.473' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (73, 13, 2, CAST(N'2023-06-27T19:23:47.767' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (74, 13, 1, CAST(N'2023-06-27T19:23:50.943' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (75, 13, 2, CAST(N'2023-06-27T19:23:52.937' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (76, 13, 1, CAST(N'2023-06-27T19:32:36.530' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (77, 13, 1, CAST(N'2023-06-27T19:32:39.110' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (78, 13, 1, CAST(N'2023-06-27T19:36:30.200' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (79, 13, 1, CAST(N'2023-06-27T19:36:33.397' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (80, 13, 1, CAST(N'2023-06-27T19:36:35.687' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (81, 13, 5, CAST(N'2023-06-27T19:46:04.927' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (82, 13, 5, CAST(N'2023-06-27T19:46:08.457' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (83, 13, 1, CAST(N'2023-06-27T19:50:57.327' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (84, 13, 1, CAST(N'2023-06-27T19:51:31.123' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (85, 13, 1, CAST(N'2023-06-27T19:51:33.220' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (86, 13, 1, CAST(N'2023-06-27T19:51:35.020' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (87, 13, 1, CAST(N'2023-06-27T19:51:37.473' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (88, 13, 1, CAST(N'2023-06-27T19:51:44.370' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (89, 13, 1, CAST(N'2023-06-27T19:51:44.397' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (90, 13, 1, CAST(N'2023-06-27T19:51:51.530' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (91, 13, 1, CAST(N'2023-06-27T19:51:51.557' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (92, 13, 1, CAST(N'2023-06-27T19:52:06.300' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (93, 13, 1, CAST(N'2023-06-27T19:52:09.143' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (94, 13, 1, CAST(N'2023-06-27T19:52:11.183' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (95, 13, 1, CAST(N'2023-06-27T19:52:13.377' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (96, 13, 1, CAST(N'2023-06-27T19:59:41.623' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (97, 13, 1, CAST(N'2023-06-27T19:59:45.580' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (98, 13, 1, CAST(N'2023-06-27T19:59:47.787' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (99, 13, 1, CAST(N'2023-06-27T20:04:34.960' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (100, 13, 1, CAST(N'2023-06-27T20:08:59.797' AS DateTime), NULL)
GO
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (101, 13, 1, CAST(N'2023-06-27T20:09:01.790' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (102, 13, 1, CAST(N'2023-06-28T00:33:58.717' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (103, 13, 1, CAST(N'2023-06-28T00:34:00.817' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (104, 13, 2, CAST(N'2023-06-28T00:34:02.943' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (105, 13, 1, CAST(N'2023-06-28T00:36:10.473' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (106, 13, 1, CAST(N'2023-06-28T00:36:12.960' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (107, 13, 1, CAST(N'2023-06-28T00:36:15.090' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (108, 13, 2, CAST(N'2023-06-28T00:43:16.450' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (109, 13, 2, CAST(N'2023-06-28T00:43:21.277' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (110, 13, 2, CAST(N'2023-06-28T00:43:21.310' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (111, 13, 1, CAST(N'2023-06-28T00:47:46.060' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (112, 13, 1, CAST(N'2023-06-28T00:47:48.117' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (113, 13, 1, CAST(N'2023-06-28T00:51:59.997' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (114, 13, 1, CAST(N'2023-06-28T00:52:01.987' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (115, 13, 1, CAST(N'2023-06-28T00:53:43.823' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (116, 13, 1, CAST(N'2023-06-28T00:53:45.830' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (117, 13, 1, CAST(N'2023-07-03T13:35:19.070' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[RecentlyViews] OFF
GO
INSERT [dbo].[RequestforCustomerQuotationItems] ([reqQuotID], [productID], [qty], [CustomerID], [productName]) VALUES (7, 27, 199, 1, N'Valeo')
INSERT [dbo].[RequestforCustomerQuotationItems] ([reqQuotID], [productID], [qty], [CustomerID], [productName]) VALUES (7, 3, 199, 1, N'EBC Brakes')
INSERT [dbo].[RequestforCustomerQuotationItems] ([reqQuotID], [productID], [qty], [CustomerID], [productName]) VALUES (8, 26, 199, 1, N'Sachs')
INSERT [dbo].[RequestforCustomerQuotationItems] ([reqQuotID], [productID], [qty], [CustomerID], [productName]) VALUES (9, 26, 199, 6, N'Sachs')
INSERT [dbo].[RequestforCustomerQuotationItems] ([reqQuotID], [productID], [qty], [CustomerID], [productName]) VALUES (9, 25, 199, 6, N'Exedy')
INSERT [dbo].[RequestforCustomerQuotationItems] ([reqQuotID], [productID], [qty], [CustomerID], [productName]) VALUES (9, 10, 199, 6, N'Optima Batteries')
INSERT [dbo].[RequestforCustomerQuotationItems] ([reqQuotID], [productID], [qty], [CustomerID], [productName]) VALUES (10, 27, 199, 8, N'Valeo')
INSERT [dbo].[RequestforCustomerQuotationItems] ([reqQuotID], [productID], [qty], [CustomerID], [productName]) VALUES (10, 11, 199, 8, N'Exide')
INSERT [dbo].[RequestforCustomerQuotationItems] ([reqQuotID], [productID], [qty], [CustomerID], [productName]) VALUES (9, 27, 199, 1, N'Valeo')
INSERT [dbo].[RequestforCustomerQuotationItems] ([reqQuotID], [productID], [qty], [CustomerID], [productName]) VALUES (10, 26, 199, 7, N'Sachs')
INSERT [dbo].[RequestforCustomerQuotationItems] ([reqQuotID], [productID], [qty], [CustomerID], [productName]) VALUES (10, 2, 199, 7, N'Brembo')
INSERT [dbo].[RequestforCustomerQuotationItems] ([reqQuotID], [productID], [qty], [CustomerID], [productName]) VALUES (11, 28, 199, 1, N'Luk')
INSERT [dbo].[RequestforCustomerQuotationItems] ([reqQuotID], [productID], [qty], [CustomerID], [productName]) VALUES (12, 25, 199, 9, N'Exedy')
INSERT [dbo].[RequestforCustomerQuotationItems] ([reqQuotID], [productID], [qty], [CustomerID], [productName]) VALUES (12, 12, 199, 9, N'Interstate Batteries')
INSERT [dbo].[RequestforCustomerQuotationItems] ([reqQuotID], [productID], [qty], [CustomerID], [productName]) VALUES (12, 4, 199, 9, N'Ferodo')
INSERT [dbo].[RequestforCustomerQuotationItems] ([reqQuotID], [productID], [qty], [CustomerID], [productName]) VALUES (13, 26, 1, 1, N'Sachs')
GO
SET IDENTITY_INSERT [dbo].[RequestforQoutation] ON 

INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (76, NULL, 3, NULL, CAST(N'2023-05-06' AS Date), N'Zaibten   ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (77, NULL, 3, NULL, CAST(N'2023-05-06' AS Date), N'Zaibten   ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (78, NULL, 2, NULL, CAST(N'2023-05-06' AS Date), N'MKKK      ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (80, NULL, 2, NULL, CAST(N'2023-05-06' AS Date), N'MKKK      ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (81, NULL, 2, NULL, CAST(N'2023-05-06' AS Date), N'MKKK      ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (82, NULL, 2, NULL, CAST(N'2023-05-06' AS Date), N'MKKK      ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (85, NULL, 3, NULL, CAST(N'2023-05-06' AS Date), N'Zaibten   ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (86, NULL, 2, NULL, CAST(N'2023-05-06' AS Date), N'MKKK      ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (87, NULL, 2, NULL, CAST(N'2023-05-06' AS Date), N'MKKK      ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (88, NULL, 3, NULL, CAST(N'2023-05-06' AS Date), N'Zaibten   ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (95, NULL, 2, NULL, CAST(N'2023-05-06' AS Date), N'MKKK      ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (100, NULL, 3, NULL, CAST(N'2023-05-06' AS Date), N'Zaibten   ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (101, 1, 2, 199, CAST(N'2023-01-06' AS Date), NULL)
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (102, NULL, 2, NULL, CAST(N'2023-05-06' AS Date), N'MKKK      ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (103, NULL, 2, NULL, CAST(N'2023-05-06' AS Date), N'MKKK      ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (104, NULL, 3, NULL, CAST(N'2023-05-06' AS Date), N'Zaibten   ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (112, NULL, 3, NULL, CAST(N'2023-05-06' AS Date), N'Zaibten   ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (114, NULL, 3, NULL, CAST(N'2023-05-06' AS Date), N'Zaibten   ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (115, NULL, 2, NULL, CAST(N'2023-05-06' AS Date), N'Khan      ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (116, NULL, 3, NULL, CAST(N'2023-05-06' AS Date), N'Zaibten   ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (117, NULL, 2, NULL, CAST(N'2023-05-06' AS Date), N'Khan      ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (118, NULL, 3, NULL, CAST(N'2023-05-06' AS Date), N'Zaibten   ')
SET IDENTITY_INSERT [dbo].[RequestforQoutation] OFF
GO
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (76, 27, 199, 3, N'Valeo')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (76, 7, 12, 3, N'TEXTAR')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (77, 27, 199, 3, N'Valeo')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (77, 4, 199, 3, N'Ferodo')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (77, 12, 199, 3, N'Interstate Batteries')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (77, 15, 199, 3, N'Duralast')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (78, 6, 199, 2, N'Akebono')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (78, 2, 199, 2, N'Brembo')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (79, 29, -9, 3, N'ACT (Advanced Clutch Technology)')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (80, 28, 199, 2, N'Luk')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (81, 5, 199, 2, N'Bosch')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (82, 1, -9, 2, N'Braker')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (83, 1, 12, 2, N'Braker')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (84, 26, 199, 3, N'Sachs')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (86, 1, 199, 2, N'Braker')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (86, 5, 199, 2, N'Bosch')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (86, 7, 199, 2, N'TEXTAR')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (87, 25, 199, 2, N'Exedy')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (87, 27, 199, 2, N'Valeo')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (87, 14, 199, 2, N'Bosch')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (88, 16, 199, 1, N'EverStart')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (88, 8, 199, 1, N'Power Stop')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (88, 4, 199, 1, N'Ferodo')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (88, 15, 199, 1, N'Duralast')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (88, 11, 199, 1, N'Exide')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (85, 27, 199, 3, N'Valeo')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (85, 16, 9, 3, N'EverStart')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (88, 25, 199, 3, N'Exedy')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (88, 16, 199, 3, N'EverStart')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (88, 10, 199, 3, N'Optima Batteries')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (88, 4, 199, 3, N'Ferodo')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (102, 1, 199, 2, N'Braker')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (103, 1, 199, 2, N'Braker')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (104, 6, 199, 3, N'Akebono')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (104, 8, 199, 3, N'Power Stop')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (112, 27, 199, 3, N'Valeo')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (113, 27, 199, 3, N'Valeo')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (113, 10, 199, 3, N'Optima Batteries')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (113, 4, 199, 3, N'Ferodo')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (114, 26, 199, 3, N'Sachs')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (114, 13, 199, 3, N'DieHard')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (115, 26, 199, 2, N'Sachs')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (115, 16, 21, 2, N'EverStart')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (115, 4, 122, 2, N'Ferodo')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (95, 1, 199, 2, N'Braker')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (95, 8, 199, 2, N'Power Stop')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (95, 13, 199, 2, N'DieHard')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (100, 13, 199, 3, N'DieHard')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (116, 27, 199, 3, N'Valeo')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (116, 10, 199, 3, N'Optima Batteries')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (116, 5, 199, 3, N'Bosch')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (117, 30, 199, 2, N'Centerforce')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (117, 10, 199, 2, N'Optima Batteries')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (117, 7, 199, 2, N'TEXTAR')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (117, 13, 199, 2, N'DieHard')
INSERT [dbo].[RequestforQuotationItems] ([reqQuotID], [productID], [qty], [supplierID], [productName]) VALUES (118, 3, 2, 3, N'EBC Brakes')
GO
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (1, 7, 3, N'Faraz Talpur', N'faraz@yahoo.com', N'Good Product.', 4, CAST(N'2016-08-11T19:03:00.227' AS DateTime), NULL)
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (6, 8, 3, N'ABC', N'abc@gmail.com', N'Nice', 5, CAST(N'2016-08-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (7, 8, 3, N'XYZ', N'xyz@hotmail.com', N'Excellent product. thank you', 5, CAST(N'2016-08-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (8, 7, 3, N'dfg', N'dfg@gmail.com', N'bad', 2, CAST(N'2015-09-23T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (9, 11, 3, N'Zulfiqar Akram', N'zulfiqar.akram366@yahoo.com', N'Good Product', 4, CAST(N'2016-09-17T22:26:20.900' AS DateTime), NULL)
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (10, 11, 3, N'Zulfiqar Akram', N'zulfiqar.akram366@yahoo.com', N'Good Product', 4, CAST(N'2016-09-17T22:29:30.030' AS DateTime), NULL)
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (11, 12, 35, N'Ali', N'ali@gmail.com', N'Nice Product', 4, CAST(N'2016-09-17T22:32:11.457' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description], [DateCreated]) VALUES (1, N'Admin', N'All rights', NULL)
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description], [DateCreated]) VALUES (2, N'Employee', N'Some rights', NULL)
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description], [DateCreated]) VALUES (3, N'User', N'Some rights', NULL)
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[SalesReturn] ON 

INSERT [dbo].[SalesReturn] ([SalesID], [Customer], [Product], [Quantity]) VALUES (1, N'1', 1, 199)
INSERT [dbo].[SalesReturn] ([SalesID], [Customer], [Product], [Quantity]) VALUES (2, N'1', 1, 1)
INSERT [dbo].[SalesReturn] ([SalesID], [Customer], [Product], [Quantity]) VALUES (3, N'1', 1, 12)
INSERT [dbo].[SalesReturn] ([SalesID], [Customer], [Product], [Quantity]) VALUES (4, N'1', 1, 100)
INSERT [dbo].[SalesReturn] ([SalesID], [Customer], [Product], [Quantity]) VALUES (5, N'1', 1, 3)
INSERT [dbo].[SalesReturn] ([SalesID], [Customer], [Product], [Quantity]) VALUES (6, N'1', 1, 12)
INSERT [dbo].[SalesReturn] ([SalesID], [Customer], [Product], [Quantity]) VALUES (7, N'1', 1, 12)
INSERT [dbo].[SalesReturn] ([SalesID], [Customer], [Product], [Quantity]) VALUES (8, N'1', 1, 199)
INSERT [dbo].[SalesReturn] ([SalesID], [Customer], [Product], [Quantity]) VALUES (9, N'1', 1, 199)
INSERT [dbo].[SalesReturn] ([SalesID], [Customer], [Product], [Quantity]) VALUES (10, N'1', 1, 199)
INSERT [dbo].[SalesReturn] ([SalesID], [Customer], [Product], [Quantity]) VALUES (11, N'9', 26, 199)
INSERT [dbo].[SalesReturn] ([SalesID], [Customer], [Product], [Quantity]) VALUES (12, N'9', 1, 199)
INSERT [dbo].[SalesReturn] ([SalesID], [Customer], [Product], [Quantity]) VALUES (13, N'1', 1, 199)
SET IDENTITY_INSERT [dbo].[SalesReturn] OFF
GO
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (1, N'Zulfiqar', N'Akram', N'zulfiqar.akram366@yahoo.com', N'+923448127902', N'Dalmain karachi
', N'Sindh', N'Karachi', N'75300')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (2, N'Ali', N'sultan', N'ali123@gmail.com', N'03441234567', N'karachi
punjab', N'Sindh', N'karachi', N'75000')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (3, N'Faraz', N'Akram', N'faraz@hotmail.com', N'+923448127902', N'cpo14-1', N'KPK', N'CZXCZ', N'3123')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (4, N'Zulfiqar', N'Akram', N'zulfiqar.akram366@yahoo.com', N'+923448127902', N'Dalmain karachi
', N'Sindh', N'Karachi', N'75300')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (5, N'Ali', N'sultan', N'ali123@gmail.com', N'03441234567', N'karachi
punjab', N'Sindh', N'karachi', N'75000')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (6, N'Ali', N'sultan', N'ali123@gmail.com', N'03441234567', N'karachi
punjab', N'Sindh', N'karachi', N'75000')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (7, N'inzi', N'mama', N'inzi@gmail.com', N'03441234567', N'cpo14-1', N'Punjab', N'Karachi', N'75300')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (8, N'Zulfiqar', N'Akram', N'zulfiqar.akram366@yahoo.com', N'+923448127902', N'Dalmain karachi
', N'Sindh', N'Karachi', N'75300')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (9, N'Zulfiqar', N'Akram', N'zulfiqar123@yahoo.com', N'+923441234567', N'Dalmain karachi
', N'Sindh', N'Karachi', N'75000')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (10, N'Ali', N'Khan', N'ali123@gmail.com', N'03441234567', N'karachi
punjab', N'Sindh', N'karachi', N'75000')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (11, N'mk', N'mk', N'mkmuzammil191@gmail.com', N'03363506933', N'Model Colony malir Town Karachi', N'Sindh', N'Karachi', N'7400')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (12, N'mk', N'mk', N'mkmuzammil191@gmail.com', N'03363506933', N'Model Colony malir Town Karachi', N'KPK', N'Karachi', N'7400')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (13, N'mk', N'mk', N'mkmuzammil191@gmail.com', N'03363506933', N'Model Colony malir Town Karachi', N'--', N'Karachi', N'7400')
INSERT [dbo].[ShippingDetails] ([ShippingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (14, N'mk', N'mk', N'mkmuzammil191@gmail.com', N'03363506933', N'Model Colony malir Town Karachi', N'Sindh', N'Karachi', N'7400')
GO
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (1, 1, N'Brake pad           ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (2, 1, N'
Caliper           ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (3, 1, N'
Brake fluid       ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (4, 1, N'
Brake shoe        ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (5, 1, N'Wheel cylinder      ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (6, 1, N'
Brake calipers    ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (7, 1, N'Casual Shoes        ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (8, 1, N'Master cylinder     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (11, 1, N'Hydraulic brake     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (12, 1, N'
Brake lining      ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (13, 1, N'Brake rotor         ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (14, 1, N'Brake discs         ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (15, 1, N'Emergency Brake     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (16, 1, N'ABS Control Module  ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (17, 1, N'Wheel Speed Sensors ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (18, 1, N'Backing plate       ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (19, 2, N'Battery             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (20, 2, N'Air Filters         ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (21, 2, N'Fuel Pump           ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (22, 2, N'Exhaust & Muffler   ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (23, 2, N'OIL & FILTER        ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (24, 2, N'ROTATE TIRES        ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (25, 2, N'Flats & Sandals     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (26, 2, N'WAX VEHICLE         ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (27, 2, N'HEADLIGHTS          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (28, 2, N'TURN SIGNALS        ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (29, 2, N'BRAKE               ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (30, 2, N'PARKING LIGHTS      ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (32, 4, N'Tread               ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (33, 3, N'Jointless cap plies ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (34, 3, N'The inner liner     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (35, 3, N'Educational Toys    ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (36, 3, N'D. Grooves          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (37, 3, N'G. Inner Liner      ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (38, 4, N'Clutch              ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (39, 4, N'Gearbox             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (40, 4, N'Kids Wear           ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (41, 4, N'Propeller shaft     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (42, 4, N'Differential        ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (43, 6, N'Live Axle           ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (44, 6, N'Planetary Gear Set  ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (45, 6, N'Torque Converter    ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (46, 6, N'Valve Body          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (47, 6, N'Transmission        ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (48, 6, N'Turbine             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (49, 7, N'Distributor Cap     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (51, 7, N'Ignition Coil       ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (52, 7, N'Coil Packs          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (53, 7, N'Coil- On-Plug       ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (54, 7, N'Spark Plug Wires    ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (55, 7, N'Spark Plugs         ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (57, 7, N'Ignition Module     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (58, 8, N' high-pass          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (59, 8, N'low-pass            ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (60, 8, N'band-pass           ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (61, 8, N'band-reject         ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (62, 8, N'Mechanical Filters  ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (63, 8, N'Absorption Filters  ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (64, 8, N'Beverage Preparation', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (65, 9, N'Differential        ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (66, 9, N'Clutch              ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (67, 9, N'Clutch              ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (68, 9, N'Chassis             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (69, 9, N'Universal joint     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (70, 9, N'Alternator          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (71, 9, N'Transfer case
     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (72, 9, N'Universal joint
   ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (73, 9, N'Flywheel            ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (74, 10, N'mirror assembly     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (75, 10, N'mirror glass        ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (76, 10, N'cover               ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (77, 10, N'turn signal         ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (78, 10, N'Rear-view           ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (79, 10, N'side-mirror         ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (80, 10, N'interior            ', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[SupplierQoutation] ON 

INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (50, 81, NULL, N'2', NULL, NULL, NULL, -108, CAST(N'2023-06-29' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (51, 76, NULL, N'3', NULL, NULL, NULL, 10916, CAST(N'2023-06-29' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (52, 76, NULL, N'3', NULL, NULL, NULL, -10798920, CAST(N'2023-06-29' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (53, 76, NULL, N'3', NULL, NULL, NULL, -3152, CAST(N'2023-06-29' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (56, 76, NULL, N'3', NULL, NULL, NULL, 27124, CAST(N'2023-06-29' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (57, 76, NULL, N'3', NULL, NULL, NULL, 42, CAST(N'2023-06-30' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (66, 76, NULL, N'3', NULL, NULL, NULL, 800, CAST(N'2023-06-30' AS Date), N'20*20     ', NULL, NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (75, 76, NULL, N'3', NULL, NULL, NULL, 2, CAST(N'2023-06-30' AS Date), N'1*1       ', NULL, NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (107, 88, NULL, N'3', NULL, NULL, NULL, 4, CAST(N'2023-07-02' AS Date), N'1*1*1*1   ', NULL, NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (108, 88, NULL, N'3', NULL, NULL, NULL, 2304, CAST(N'2023-07-02' AS Date), N'24*24*24*24', NULL, NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (123, 115, NULL, N'2', NULL, NULL, NULL, 253, CAST(N'2023-07-08' AS Date), N'20,1,1', NULL, NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (124, 115, NULL, N'2', NULL, NULL, NULL, 34, CAST(N'2023-07-08' AS Date), N'2,1,1', NULL, NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (125, 112, NULL, N'3', NULL, NULL, NULL, 400, CAST(N'2023-07-09' AS Date), N'20', NULL, NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (126, 114, NULL, N'3', NULL, NULL, NULL, 260, CAST(N'2023-07-09' AS Date), N'20,1', NULL, NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (127, 112, NULL, N'3', NULL, NULL, NULL, 240, CAST(N'2023-07-09' AS Date), N'20', NULL, NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (128, 112, NULL, N'3', NULL, NULL, NULL, 240, CAST(N'2023-07-09' AS Date), N'20', NULL, NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (129, 112, NULL, N'3', NULL, NULL, NULL, 400, CAST(N'2023-07-09' AS Date), N'20', NULL, NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (130, 112, NULL, N'3', NULL, NULL, NULL, 20, CAST(N'2023-07-09' AS Date), N'20', NULL, NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (131, 112, NULL, N'3', NULL, NULL, NULL, 20, CAST(N'2023-07-09' AS Date), N'20', NULL, NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (132, 112, NULL, N'3', NULL, NULL, NULL, 2, CAST(N'2023-07-09' AS Date), N'2', NULL, NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (133, 114, NULL, N'3', NULL, NULL, NULL, 260, CAST(N'2023-07-09' AS Date), N'20,1', NULL, NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (134, 112, NULL, N'3', NULL, NULL, NULL, 1800, CAST(N'2023-07-09' AS Date), N'900', NULL, NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (135, 114, NULL, N'3', NULL, NULL, NULL, 420, CAST(N'2023-07-09' AS Date), N'20,20', NULL, NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (136, 112, NULL, N'3', NULL, NULL, NULL, 400, CAST(N'2023-07-09' AS Date), N'20', N'20', NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (137, 115, NULL, N'2', NULL, NULL, NULL, 1200, CAST(N'2023-07-09' AS Date), N'20,20,20', N'20,20,20', NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (138, 115, NULL, N'2', NULL, NULL, NULL, 1200, CAST(N'2023-07-09' AS Date), N'20,20,20', N'20,20,20', NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (139, 112, NULL, N'3', NULL, NULL, NULL, 240, CAST(N'2023-07-09' AS Date), N'20', N'20', NULL, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (140, 112, NULL, N'3', NULL, NULL, NULL, 1, CAST(N'2023-07-09' AS Date), N'1', N'1', 1, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (141, 115, NULL, N'2', NULL, NULL, NULL, 52, CAST(N'2023-07-09' AS Date), N'20,20,1', N'21,20,20', 25, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (142, 112, NULL, N'3', NULL, NULL, NULL, 1, CAST(N'2023-07-09' AS Date), N'1', N'1', 1, NULL)
INSERT [dbo].[SupplierQoutation] ([SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [Date], [SaveQuantity], [Tax], [PaymentTerm], [ConUnit]) VALUES (143, 115, NULL, N'2', NULL, NULL, NULL, 3, CAST(N'2023-07-09' AS Date), N'1,1,1', N'1,1,1', 1, N'1')
SET IDENTITY_INSERT [dbo].[SupplierQoutation] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [ContactTitle], [Address], [Mobile], [Phone], [Fax], [Email], [City], [Country], [InActive]) VALUES (2, N'Khan', N'Ian Devling', N'Marketing Manager', N'karachi', N'03441234567', N'03441234567', N'(03) 444-6588', N'lan@gmail.com', N'karachi', N'Pakistan', 1)
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [ContactTitle], [Address], [Mobile], [Phone], [Fax], [Email], [City], [Country], [InActive]) VALUES (3, N'Zaibten', N'Muzamil Khan', N'Manager', N'Model Colony malir Town Karachi', N'03363506933', N'03363506933', NULL, N'mkmuzammil191@gmail.com', N'Karachi', N'Pakistan', 1)
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [ContactTitle], [Address], [Mobile], [Phone], [Fax], [Email], [City], [Country], [InActive]) VALUES (4, N'Zabion', N'Muzamil Khan', N'Manager', N'Model Colony malir Town Karachi', N'03363506933', N'03363506933', NULL, N'mkmuzammil191@gmail.com', N'Karachi', N'Pakistan', 0)
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [ContactTitle], [Address], [Mobile], [Phone], [Fax], [Email], [City], [Country], [InActive]) VALUES (5, N'abc', N'abc', N'abc', N'abc', N'12345678901', N'12345678901', N'abc', N'abc@gmail.com', N'abc', N'abc', 1)
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [ContactTitle], [Address], [Mobile], [Phone], [Fax], [Email], [City], [Country], [InActive]) VALUES (6, N'Zaibten', N'Zaibten', N'Zaibten12', N'Model Colony malir Town Karachi', N'03363506933', N'03363506933', N'abc', N'mkmuzammil191@gmail.com', N'Karachi', N'Pakistan', 1)
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_SupplierPayment] ON 

INSERT [dbo].[tbl_SupplierPayment] ([SupplierPaymentID], [invoiceId], [Supplier], [PaymentDate], [PaymentTerm], [CreatedDate], [Tax], [Totalamount], [NetAmount], [Sup]) VALUES (7, 11, NULL, CAST(N'2023-07-27' AS Date), 11, CAST(N'2023-07-10' AS Date), 774, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'Khan')
INSERT [dbo].[tbl_SupplierPayment] ([SupplierPaymentID], [invoiceId], [Supplier], [PaymentDate], [PaymentTerm], [CreatedDate], [Tax], [Totalamount], [NetAmount], [Sup]) VALUES (8, 4, NULL, CAST(N'2023-07-20' AS Date), 15, CAST(N'2023-07-11' AS Date), 774, CAST(2.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), N'Khan')
SET IDENTITY_INSERT [dbo].[tbl_SupplierPayment] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Tax] ON 

INSERT [dbo].[tbl_Tax] ([TaxID], [TaxRate], [Taxcode], [CreatedDate], [TaxValue]) VALUES (774, CAST(13 AS Decimal(18, 0)), N'income Tax', CAST(N'2023-07-08' AS Date), CAST(1200712 AS Decimal(18, 0)))
INSERT [dbo].[tbl_Tax] ([TaxID], [TaxRate], [Taxcode], [CreatedDate], [TaxValue]) VALUES (779, CAST(13 AS Decimal(18, 0)), N'income Tax', CAST(N'2023-07-08' AS Date), CAST(12007 AS Decimal(18, 0)))
INSERT [dbo].[tbl_Tax] ([TaxID], [TaxRate], [Taxcode], [CreatedDate], [TaxValue]) VALUES (784, CAST(13 AS Decimal(18, 0)), N'income Tax', CAST(N'2023-07-08' AS Date), CAST(12007 AS Decimal(18, 0)))
INSERT [dbo].[tbl_Tax] ([TaxID], [TaxRate], [Taxcode], [CreatedDate], [TaxValue]) VALUES (785, CAST(13 AS Decimal(18, 0)), N'Custom Tax', CAST(N'2023-07-12' AS Date), CAST(120000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[tbl_Tax] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_UnitofMeasures] ON 

INSERT [dbo].[tbl_UnitofMeasures] ([UnitMeasureID], [UnitMeasure], [Description], [Abbrevation]) VALUES (1, N'Kilogram', N'abc record', N'kg')
INSERT [dbo].[tbl_UnitofMeasures] ([UnitMeasureID], [UnitMeasure], [Description], [Abbrevation]) VALUES (2, N'Meters', N'abc', N'M')
SET IDENTITY_INSERT [dbo].[tbl_UnitofMeasures] OFF
GO
SET IDENTITY_INSERT [dbo].[Wishlist] ON 

INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (1, 1, 1, NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (5, 9, 4, NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (6, 1, 6, NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (7, 1, 5, NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (8, 1, 2, NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (9, 11, 30, NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (10, 12, 26, NULL)
SET IDENTITY_INSERT [dbo].[Wishlist] OFF
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Taxes]  DEFAULT ((0)) FOR [Taxes]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_isCompleted]  DEFAULT ((0)) FOR [isCompleted]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_DIspatched]  DEFAULT ((0)) FOR [DIspatched]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Shipped]  DEFAULT ((0)) FOR [Shipped]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Deliver]  DEFAULT ((0)) FOR [Deliver]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_CancelOrder]  DEFAULT ((0)) FOR [CancelOrder]
GO
ALTER TABLE [dbo].[Wishlist] ADD  CONSTRAINT [DF_Wishlist_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[admin_Login]  WITH CHECK ADD  CONSTRAINT [FK_admin_Login_admin_Employee] FOREIGN KEY([EmpID])
REFERENCES [dbo].[admin_Employee] ([EmpID])
GO
ALTER TABLE [dbo].[admin_Login] CHECK CONSTRAINT [FK_admin_Login_admin_Employee]
GO
ALTER TABLE [dbo].[admin_Login]  WITH CHECK ADD  CONSTRAINT [FK_admin_Login_Roles] FOREIGN KEY([RoleType])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[admin_Login] CHECK CONSTRAINT [FK_admin_Login_Roles]
GO
ALTER TABLE [dbo].[CustomerRequestforQoutation]  WITH CHECK ADD FOREIGN KEY([Customer])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[CustomerRequestforQoutation]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[genPromoRight]  WITH CHECK ADD  CONSTRAINT [FK_genPromoRight_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[genPromoRight] CHECK CONSTRAINT [FK_genPromoRight_Categories]
GO
ALTER TABLE [dbo].[GoodReceiptNote]  WITH CHECK ADD  CONSTRAINT [FK__GoodRecei__ReqQo__1332DBDC] FOREIGN KEY([ReqQoutationID])
REFERENCES [dbo].[RequestforQoutation] ([ReqQoutationID])
GO
ALTER TABLE [dbo].[GoodReceiptNote] CHECK CONSTRAINT [FK__GoodRecei__ReqQo__1332DBDC]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customers]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Payment] FOREIGN KEY([PaymentID])
REFERENCES [dbo].[Payment] ([PaymentID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Payment]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_ShippingDetails] FOREIGN KEY([ShippingID])
REFERENCES [dbo].[ShippingDetails] ([ShippingID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_ShippingDetails]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_PaymentType] FOREIGN KEY([Type])
REFERENCES [dbo].[PaymentType] ([PayTypeID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_PaymentType]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Products1] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Products1]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_SubCategory] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategory] ([SubCategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_SubCategory]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[PurchaseReturn]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[PurchaseReturn]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[PurchaseReturn]  WITH CHECK ADD FOREIGN KEY([Supplier])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[PurchaseReturn]  WITH CHECK ADD FOREIGN KEY([Supplier])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[RecentlyViews]  WITH CHECK ADD  CONSTRAINT [FK_RecentlyViews_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[RecentlyViews] CHECK CONSTRAINT [FK_RecentlyViews_Customers]
GO
ALTER TABLE [dbo].[RecentlyViews]  WITH CHECK ADD  CONSTRAINT [FK_RecentlyViews_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[RecentlyViews] CHECK CONSTRAINT [FK_RecentlyViews_Products]
GO
ALTER TABLE [dbo].[RequestforQoutation]  WITH CHECK ADD  CONSTRAINT [FK__Requestfo__Produ__19DFD96B] FOREIGN KEY([Product])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[RequestforQoutation] CHECK CONSTRAINT [FK__Requestfo__Produ__19DFD96B]
GO
ALTER TABLE [dbo].[RequestforQoutation]  WITH CHECK ADD  CONSTRAINT [FK__Requestfo__Suppl__1AD3FDA4] FOREIGN KEY([Supplier])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[RequestforQoutation] CHECK CONSTRAINT [FK__Requestfo__Suppl__1AD3FDA4]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Customers]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Products]
GO
ALTER TABLE [dbo].[SalesReturn]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Categories]
GO
ALTER TABLE [dbo].[SupplierQoutation]  WITH CHECK ADD  CONSTRAINT [FK__SupplierQ__ReqQo__09A971A2] FOREIGN KEY([ReqQoutationID])
REFERENCES [dbo].[RequestforQoutation] ([ReqQoutationID])
GO
ALTER TABLE [dbo].[SupplierQoutation] CHECK CONSTRAINT [FK__SupplierQ__ReqQo__09A971A2]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_Customers]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_Products]
GO
/****** Object:  StoredProcedure [dbo].[InsertcustomerQoutation]    Script Date: 12/07/2023 4:00:15 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertcustomerQoutation]
    @ReqQoutationID INT,
    @Product NVARCHAR(150),
    @Customer NVARCHAR(150),
    @QuantityNeeded INT,
    @SupplierQuantity INT,
    @UnitPrice INT,
    @TotalPrice INT,
	@ProductDate date,
    @TaxRateID INT,
	@PaymentTerm int,
	@ConUnit nvarchar
AS
BEGIN
    INSERT INTO CustomerQoutation (ReqQoutationID, Product, customer, QuantityNeeded, SupplierQuantity, UnitPrice, TotalPrice, Date,Tax,PaymentTerm,ConUnit)
    VALUES (@ReqQoutationID, @Product, @Customer, @QuantityNeeded, @SupplierQuantity, @UnitPrice, @TotalPrice,@ProductDate, @TaxRateID,@PaymentTerm,@ConUnit)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertCustomerRequestforQoutation]    Script Date: 12/07/2023 4:00:15 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCustomerRequestforQoutation]
(
    @Product INT,
    @Customer INT,
    @Quantity INT,
    @ProductDate DATE
)
AS
BEGIN
    INSERT INTO CustomerRequestforQoutation (Product, Customer, Quantity, ProductDate)
    VALUES (@Product, @customer, @Quantity, @ProductDate)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertRequestforQoutation]    Script Date: 12/07/2023 4:00:15 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertRequestforQoutation]
(
    @Product INT,
    @Supplier INT,
    @Quantity INT,
    @ProductDate DATE
)
AS
BEGIN
    INSERT INTO RequestforQoutation (Product, Supplier, Quantity, ProductDate)
    VALUES (@Product, @Supplier, @Quantity, @ProductDate)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertSupplierGoodReceipt]    Script Date: 12/07/2023 4:00:15 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertSupplierGoodReceipt]
    @ReqQoutationID nvarchar(150),
    @Product NVARCHAR(150),
    @Supplier NVARCHAR(150),
    @QuantityNeeded INT,
    @SupplierQuantity INT,
    @UnitPrice INT,
    @TotalPrice INT,
	@ProductDate date
AS
BEGIN
    INSERT INTO SupplierQoutation (ReqQoutationID, Product, Supplier, QuantityNeeded, SupplierQuantity, UnitPrice, TotalPrice, Date)
    VALUES (@ReqQoutationID, @Product, @Supplier, @QuantityNeeded, @SupplierQuantity, @UnitPrice, @TotalPrice,@ProductDate)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertSupplierQoutation]    Script Date: 12/07/2023 4:00:15 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertSupplierQoutation]
    @ReqQoutationID INT,
    @Product NVARCHAR(150),
    @Supplier NVARCHAR(150),
    @QuantityNeeded INT,
    @SupplierQuantity INT,
    @UnitPrice INT,
    @TotalPrice INT,
    @ProductDate DATE,
    @TaxRateID INT,
	@PaymentTerm int,
	@ConUnit nvarchar
AS
BEGIN
    INSERT INTO SupplierQoutation (ReqQoutationID, Product, Supplier, QuantityNeeded, SupplierQuantity, UnitPrice, TotalPrice, Date,Tax,PaymentTerm,ConUnit)
    VALUES (@ReqQoutationID, @Product, @Supplier, @QuantityNeeded, @SupplierQuantity, @UnitPrice, @TotalPrice, @ProductDate, @TaxRateID,@PaymentTerm,@ConUnit)
END
GO
/****** Object:  StoredProcedure [dbo].[ViewRequestforQoutation]    Script Date: 12/07/2023 4:00:15 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewRequestforQoutation]
AS
BEGIN
    SELECT
        r.ReqQoutationID,
        p.Name,
        s.CompanyName,
        r.Quantity,
        r.ProductDate
    FROM
        RequestforQoutation r
        INNER JOIN Products p ON r.Product = p.ProductID
        INNER JOIN Suppliers s ON r.Supplier = s.SupplierID
    ORDER BY
        r.ReqQoutationID;
END
GO
USE [master]
GO
ALTER DATABASE [kahreedo] SET  READ_WRITE 
GO
