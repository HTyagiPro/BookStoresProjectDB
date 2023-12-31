USE [master]
GO
/****** Object:  Database [BookStoresProject]    Script Date: 31-08-2023 15:48:16 ******/
CREATE DATABASE [BookStoresProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookStoresProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BookStoresProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookStoresProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BookStoresProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BookStoresProject] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStoresProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStoresProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStoresProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStoresProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStoresProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStoresProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStoresProject] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BookStoresProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStoresProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStoresProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStoresProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStoresProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStoresProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStoresProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStoresProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStoresProject] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookStoresProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStoresProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStoresProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStoresProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStoresProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStoresProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookStoresProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStoresProject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookStoresProject] SET  MULTI_USER 
GO
ALTER DATABASE [BookStoresProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStoresProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStoresProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStoresProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookStoresProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookStoresProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BookStoresProject] SET QUERY_STORE = ON
GO
ALTER DATABASE [BookStoresProject] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BookStoresProject]
GO
/****** Object:  UserDefinedFunction [dbo].[UserLogInFun]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[UserLogInFun](@username INT, @password BIGINT)
RETURNS bit
As
Begin
 DECLARE @storedPasswordHash VARCHAR(100);

    -- Get the stored password hash for the provided username
    SELECT @storedPasswordHash = passcode
    FROM Users
    WHERE username = @username;

    -- Hash the provided password using the same algorithm
    DECLARE @inputPasswordHash BIGINT;
    --SET @inputPasswordHash = CONVERT(VARCHAR(100), HASHBYTES('SHA2_512', @password), 2);



    -- Check if the provided password hash matches the stored password hash
    IF @storedPasswordHash = @password
    BEGIN
        --PRINT 'Login successful';
        -- You might add additional actions here, like setting a session token or updating login history.
		return 1;
    END
    ELSE
    BEGIN
        --PRINT 'Login failed';
		return 0;
    END;
	return 0;
End
GO
/****** Object:  Table [dbo].[Author]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[authorID] [int] IDENTITY(1001,1) NOT NULL,
	[authorName] [varchar](50) NULL,
	[recordCreatedOn] [datetime] NULL,
	[rowVersion] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[authorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[bookID] [int] IDENTITY(1,1) NOT NULL,
	[authorID] [int] NULL,
	[publisherID] [int] NULL,
	[title] [varchar](255) NOT NULL,
	[category] [varchar](127) NOT NULL,
	[price] [money] NOT NULL,
	[ISBNcode] [bigint] NOT NULL,
	[pageCount] [int] NOT NULL,
	[publishedYear] [int] NOT NULL,
	[condition] [varchar](5) NOT NULL,
	[recordCreatedOn] [datetime] NULL,
	[rowVersion] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customerID] [int] IDENTITY(101,1) NOT NULL,
	[custName] [varchar](255) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[custAddress] [varchar](100) NOT NULL,
	[contactNo] [bigint] NOT NULL,
	[recordCreatedOn] [datetime] NULL,
	[rowVersion] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerActivity]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerActivity](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customerID] [int] NULL,
	[activity] [text] NOT NULL,
	[recordCreatedOn] [datetime] NULL,
	[rowVersion] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[inventoryID] [int] IDENTITY(1,1) NOT NULL,
	[bookID] [int] NULL,
	[stockLevelUsed] [int] NOT NULL,
	[stockLevelNew] [int] NOT NULL,
	[recordCreatedOn] [datetime] NULL,
	[rowVersion] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[inventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NULL,
	[bookID] [int] NULL,
	[quantity] [int] NOT NULL,
	[priceOfUnitQuantity] [money] NOT NULL,
	[recordCreatedOn] [datetime] NULL,
	[rowVersion] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[customerID] [int] NULL,
	[orderDate] [datetime] NOT NULL,
	[totalAmount] [money] NOT NULL,
	[shippingAddress] [varchar](100) NOT NULL,
	[taxAmount] [money] NOT NULL,
	[discountAmount] [money] NOT NULL,
	[recordCreatedOn] [datetime] NULL,
	[rowVersion] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[paymentID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NULL,
	[customerID] [int] NULL,
	[paymentDate] [datetime] NOT NULL,
	[amount] [money] NOT NULL,
	[status] [varchar](120) NOT NULL,
	[recordCreatedOn] [datetime] NULL,
	[rowVersion] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[paymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[publisherID] [int] IDENTITY(10001,1) NOT NULL,
	[publisherName] [varchar](50) NULL,
	[recordCreatedOn] [datetime] NULL,
	[rowVersion] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[publisherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[passcode] [text] NOT NULL,
	[email] [varchar](100) NOT NULL,
	[registrationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([authorID], [authorName], [recordCreatedOn]) VALUES (1001, N'John Doe', CAST(N'2023-08-31T09:04:29.523' AS DateTime))
INSERT [dbo].[Author] ([authorID], [authorName], [recordCreatedOn]) VALUES (1002, N'Jane Smith', CAST(N'2023-08-31T09:04:29.523' AS DateTime))
INSERT [dbo].[Author] ([authorID], [authorName], [recordCreatedOn]) VALUES (1003, N'Mark Johnson', CAST(N'2023-08-31T09:04:29.523' AS DateTime))
INSERT [dbo].[Author] ([authorID], [authorName], [recordCreatedOn]) VALUES (1004, N'Emily White', CAST(N'2023-08-31T09:04:29.523' AS DateTime))
INSERT [dbo].[Author] ([authorID], [authorName], [recordCreatedOn]) VALUES (1005, N'Michael Brown', CAST(N'2023-08-31T09:04:29.523' AS DateTime))
INSERT [dbo].[Author] ([authorID], [authorName], [recordCreatedOn]) VALUES (1006, N'Sarah Lee', CAST(N'2023-08-31T09:04:29.523' AS DateTime))
INSERT [dbo].[Author] ([authorID], [authorName], [recordCreatedOn]) VALUES (1007, N'David Miller', CAST(N'2023-08-31T09:04:29.523' AS DateTime))
INSERT [dbo].[Author] ([authorID], [authorName], [recordCreatedOn]) VALUES (1008, N'Emma Taylor', CAST(N'2023-08-31T09:04:29.523' AS DateTime))
INSERT [dbo].[Author] ([authorID], [authorName], [recordCreatedOn]) VALUES (1009, N'Christopher Wilson', CAST(N'2023-08-31T09:04:29.523' AS DateTime))
INSERT [dbo].[Author] ([authorID], [authorName], [recordCreatedOn]) VALUES (1010, N'Olivia Martinez', CAST(N'2023-08-31T09:04:29.523' AS DateTime))
SET IDENTITY_INSERT [dbo].[Author] OFF
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([bookID], [authorID], [publisherID], [title], [category], [price], [ISBNcode], [pageCount], [publishedYear], [condition], [recordCreatedOn]) VALUES (1, 1001, 10001, N'The Great Adventure', N'Adventure', 25.9900, 1234567890123, 350, 2022, N'New', CAST(N'2023-08-31T09:10:55.413' AS DateTime))
INSERT [dbo].[Books] ([bookID], [authorID], [publisherID], [title], [category], [price], [ISBNcode], [pageCount], [publishedYear], [condition], [recordCreatedOn]) VALUES (2, 1002, 10002, N'Coding Masterclass', N'Programming', 49.9900, 9876543210456, 450, 2021, N'New', CAST(N'2023-08-31T09:10:55.413' AS DateTime))
INSERT [dbo].[Books] ([bookID], [authorID], [publisherID], [title], [category], [price], [ISBNcode], [pageCount], [publishedYear], [condition], [recordCreatedOn]) VALUES (3, 1003, 10003, N'Mystery at Midnight', N'Mystery', 19.9900, 3456789012345, 280, 2023, N'New', CAST(N'2023-08-31T09:10:55.413' AS DateTime))
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([customerID], [custName], [email], [custAddress], [contactNo], [recordCreatedOn]) VALUES (101, N'Alice Johnson', N'alice@example.com', N'123 Main St', 1234567890, CAST(N'2023-08-31T09:04:39.227' AS DateTime))
INSERT [dbo].[Customer] ([customerID], [custName], [email], [custAddress], [contactNo], [recordCreatedOn]) VALUES (102, N'Bob Smith', N'bob@example.com', N'456 Elm St', 9876543210, CAST(N'2023-08-31T09:04:39.227' AS DateTime))
INSERT [dbo].[Customer] ([customerID], [custName], [email], [custAddress], [contactNo], [recordCreatedOn]) VALUES (103, N'Eve Brown', N'eve@example.com', N'789 Oak St', 5678901234, CAST(N'2023-08-31T09:04:39.227' AS DateTime))
INSERT [dbo].[Customer] ([customerID], [custName], [email], [custAddress], [contactNo], [recordCreatedOn]) VALUES (104, N'William Davis', N'william@example.com', N'567 Pine St', 4567890123, CAST(N'2023-08-31T09:04:39.227' AS DateTime))
INSERT [dbo].[Customer] ([customerID], [custName], [email], [custAddress], [contactNo], [recordCreatedOn]) VALUES (105, N'Sophia Martinez', N'sophia@example.com', N'890 Maple St', 3456789012, CAST(N'2023-08-31T09:04:39.227' AS DateTime))
INSERT [dbo].[Customer] ([customerID], [custName], [email], [custAddress], [contactNo], [recordCreatedOn]) VALUES (106, N'Daniel Thompson', N'daniel@example.com', N'123 Cedar St', 2345678901, CAST(N'2023-08-31T09:04:39.227' AS DateTime))
INSERT [dbo].[Customer] ([customerID], [custName], [email], [custAddress], [contactNo], [recordCreatedOn]) VALUES (107, N'Lily Harris', N'lily@example.com', N'456 Birch St', 9874567890, CAST(N'2023-08-31T09:04:39.227' AS DateTime))
INSERT [dbo].[Customer] ([customerID], [custName], [email], [custAddress], [contactNo], [recordCreatedOn]) VALUES (108, N'Jackson Adams', N'jackson@example.com', N'789 Walnut St', 9876123210, CAST(N'2023-08-31T09:04:39.227' AS DateTime))
INSERT [dbo].[Customer] ([customerID], [custName], [email], [custAddress], [contactNo], [recordCreatedOn]) VALUES (109, N'Ava Miller', N'ava@example.com', N'567 Oak St', 8727632109, CAST(N'2023-08-31T09:04:39.227' AS DateTime))
INSERT [dbo].[Customer] ([customerID], [custName], [email], [custAddress], [contactNo], [recordCreatedOn]) VALUES (110, N'Ethan Scott', N'ethan@example.com', N'890 Pine St', 7654331998, CAST(N'2023-08-31T09:04:39.227' AS DateTime))
INSERT [dbo].[Customer] ([customerID], [custName], [email], [custAddress], [contactNo], [recordCreatedOn]) VALUES (111, N'Nitesh', N'nitesh@example.com', N'123 Main St', 1295136396, CAST(N'2023-08-31T14:11:15.623' AS DateTime))
INSERT [dbo].[Customer] ([customerID], [custName], [email], [custAddress], [contactNo], [recordCreatedOn]) VALUES (112, N'A', N'a@example.com', N'123 Main St', 2305136396, CAST(N'2023-08-31T14:14:49.373' AS DateTime))
INSERT [dbo].[Customer] ([customerID], [custName], [email], [custAddress], [contactNo], [recordCreatedOn]) VALUES (113, N'B', N'b@example.com', N'123 Main St', 98989879897, CAST(N'2023-08-31T14:41:58.620' AS DateTime))
INSERT [dbo].[Customer] ([customerID], [custName], [email], [custAddress], [contactNo], [recordCreatedOn]) VALUES (114, N'C', N'c@example.com', N'123 Main St', 97989879897, CAST(N'2023-08-31T14:47:32.570' AS DateTime))
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventory] ON 

INSERT [dbo].[Inventory] ([inventoryID], [bookID], [stockLevelUsed], [stockLevelNew], [recordCreatedOn]) VALUES (1, 1, 5, 5, CAST(N'2023-08-31T09:11:01.657' AS DateTime))
INSERT [dbo].[Inventory] ([inventoryID], [bookID], [stockLevelUsed], [stockLevelNew], [recordCreatedOn]) VALUES (2, 2, 3, 13, CAST(N'2023-08-31T09:11:01.657' AS DateTime))
INSERT [dbo].[Inventory] ([inventoryID], [bookID], [stockLevelUsed], [stockLevelNew], [recordCreatedOn]) VALUES (3, 3, 2, 0, CAST(N'2023-08-31T09:11:01.657' AS DateTime))
SET IDENTITY_INSERT [dbo].[Inventory] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([ID], [orderID], [bookID], [quantity], [priceOfUnitQuantity], [recordCreatedOn]) VALUES (1, 1, 1, 2, 25.9900, CAST(N'2023-08-31T09:44:02.713' AS DateTime))
INSERT [dbo].[OrderItems] ([ID], [orderID], [bookID], [quantity], [priceOfUnitQuantity], [recordCreatedOn]) VALUES (2, 1, 3, 1, 19.9900, CAST(N'2023-08-31T09:44:02.713' AS DateTime))
INSERT [dbo].[OrderItems] ([ID], [orderID], [bookID], [quantity], [priceOfUnitQuantity], [recordCreatedOn]) VALUES (3, 2, 2, 3, 49.9900, CAST(N'2023-08-31T09:44:02.713' AS DateTime))
INSERT [dbo].[OrderItems] ([ID], [orderID], [bookID], [quantity], [priceOfUnitQuantity], [recordCreatedOn]) VALUES (7, 7, 7, 2, 25.9900, CAST(N'2023-08-31T13:39:30.190' AS DateTime))
INSERT [dbo].[OrderItems] ([ID], [orderID], [bookID], [quantity], [priceOfUnitQuantity], [recordCreatedOn]) VALUES (8, 8, 7, 2, 25.9900, CAST(N'2023-08-31T13:43:18.233' AS DateTime))
INSERT [dbo].[OrderItems] ([ID], [orderID], [bookID], [quantity], [priceOfUnitQuantity], [recordCreatedOn]) VALUES (9, 9, 7, 2, 25.9900, CAST(N'2023-08-31T13:44:39.923' AS DateTime))
INSERT [dbo].[OrderItems] ([ID], [orderID], [bookID], [quantity], [priceOfUnitQuantity], [recordCreatedOn]) VALUES (10, 10, 5, 2, 25.9900, CAST(N'2023-08-31T13:48:26.873' AS DateTime))
INSERT [dbo].[OrderItems] ([ID], [orderID], [bookID], [quantity], [priceOfUnitQuantity], [recordCreatedOn]) VALUES (11, 11, 2, 7, 25.9900, CAST(N'2023-08-31T13:48:46.420' AS DateTime))
INSERT [dbo].[OrderItems] ([ID], [orderID], [bookID], [quantity], [priceOfUnitQuantity], [recordCreatedOn]) VALUES (12, 12, 3, 5, 25.9900, CAST(N'2023-08-31T13:58:42.320' AS DateTime))
INSERT [dbo].[OrderItems] ([ID], [orderID], [bookID], [quantity], [priceOfUnitQuantity], [recordCreatedOn]) VALUES (13, 13, 3, 1, 25.9900, CAST(N'2023-08-31T14:38:05.043' AS DateTime))
INSERT [dbo].[OrderItems] ([ID], [orderID], [bookID], [quantity], [priceOfUnitQuantity], [recordCreatedOn]) VALUES (14, 14, 1, 20, 25.9900, CAST(N'2023-08-31T14:50:22.290' AS DateTime))
INSERT [dbo].[OrderItems] ([ID], [orderID], [bookID], [quantity], [priceOfUnitQuantity], [recordCreatedOn]) VALUES (15, 15, 3, 15, 25.9900, CAST(N'2023-08-31T15:44:29.243' AS DateTime))
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([orderID], [customerID], [orderDate], [totalAmount], [shippingAddress], [taxAmount], [discountAmount], [recordCreatedOn]) VALUES (1, 101, CAST(N'2023-08-30T10:00:00.000' AS DateTime), 30.9900, N'123 Main St', 3.0000, 1.0000, CAST(N'2023-08-31T09:14:10.103' AS DateTime))
INSERT [dbo].[Orders] ([orderID], [customerID], [orderDate], [totalAmount], [shippingAddress], [taxAmount], [discountAmount], [recordCreatedOn]) VALUES (2, 102, CAST(N'2023-08-29T15:30:00.000' AS DateTime), 60.9900, N'456 Elm St', 6.0000, 2.5000, CAST(N'2023-08-31T09:14:10.103' AS DateTime))
INSERT [dbo].[Orders] ([orderID], [customerID], [orderDate], [totalAmount], [shippingAddress], [taxAmount], [discountAmount], [recordCreatedOn]) VALUES (3, 103, CAST(N'2023-08-28T09:45:00.000' AS DateTime), 15.5000, N'789 Oak St', 1.5000, 0.5000, CAST(N'2023-08-31T09:14:10.103' AS DateTime))
INSERT [dbo].[Orders] ([orderID], [customerID], [orderDate], [totalAmount], [shippingAddress], [taxAmount], [discountAmount], [recordCreatedOn]) VALUES (4, 109, CAST(N'2023-08-30T10:00:00.000' AS DateTime), 51.9800, N'123 Main St', 3.0000, 1.0000, CAST(N'2023-08-31T13:30:28.173' AS DateTime))
INSERT [dbo].[Orders] ([orderID], [customerID], [orderDate], [totalAmount], [shippingAddress], [taxAmount], [discountAmount], [recordCreatedOn]) VALUES (5, 109, CAST(N'2023-08-30T10:00:00.000' AS DateTime), 51.9800, N'123 Main St', 3.0000, 1.0000, CAST(N'2023-08-31T13:37:00.700' AS DateTime))
INSERT [dbo].[Orders] ([orderID], [customerID], [orderDate], [totalAmount], [shippingAddress], [taxAmount], [discountAmount], [recordCreatedOn]) VALUES (6, 105, CAST(N'2023-08-30T10:00:00.000' AS DateTime), 51.9800, N'123 Main St', 3.0000, 1.0000, CAST(N'2023-08-31T13:38:06.770' AS DateTime))
INSERT [dbo].[Orders] ([orderID], [customerID], [orderDate], [totalAmount], [shippingAddress], [taxAmount], [discountAmount], [recordCreatedOn]) VALUES (7, 105, CAST(N'2023-08-30T10:00:00.000' AS DateTime), 51.9800, N'123 Main St', 3.0000, 1.0000, CAST(N'2023-08-31T13:39:30.190' AS DateTime))
INSERT [dbo].[Orders] ([orderID], [customerID], [orderDate], [totalAmount], [shippingAddress], [taxAmount], [discountAmount], [recordCreatedOn]) VALUES (8, 105, CAST(N'2023-08-30T10:00:00.000' AS DateTime), 51.9800, N'123 Main St', 3.0000, 1.0000, CAST(N'2023-08-31T13:43:18.233' AS DateTime))
INSERT [dbo].[Orders] ([orderID], [customerID], [orderDate], [totalAmount], [shippingAddress], [taxAmount], [discountAmount], [recordCreatedOn]) VALUES (9, 105, CAST(N'2023-08-30T10:00:00.000' AS DateTime), 51.9800, N'123 Main St', 3.0000, 1.0000, CAST(N'2023-08-31T13:44:39.923' AS DateTime))
INSERT [dbo].[Orders] ([orderID], [customerID], [orderDate], [totalAmount], [shippingAddress], [taxAmount], [discountAmount], [recordCreatedOn]) VALUES (10, 105, CAST(N'2023-08-30T10:00:00.000' AS DateTime), 51.9800, N'123 Main St', 3.0000, 1.0000, CAST(N'2023-08-31T13:48:26.873' AS DateTime))
INSERT [dbo].[Orders] ([orderID], [customerID], [orderDate], [totalAmount], [shippingAddress], [taxAmount], [discountAmount], [recordCreatedOn]) VALUES (11, 105, CAST(N'2023-08-30T10:00:00.000' AS DateTime), 181.9300, N'123 Main St', 3.0000, 1.0000, CAST(N'2023-08-31T13:48:46.417' AS DateTime))
INSERT [dbo].[Orders] ([orderID], [customerID], [orderDate], [totalAmount], [shippingAddress], [taxAmount], [discountAmount], [recordCreatedOn]) VALUES (12, 105, CAST(N'2023-08-30T10:00:00.000' AS DateTime), 129.9500, N'123 Main St', 3.0000, 1.0000, CAST(N'2023-08-31T13:58:42.320' AS DateTime))
INSERT [dbo].[Orders] ([orderID], [customerID], [orderDate], [totalAmount], [shippingAddress], [taxAmount], [discountAmount], [recordCreatedOn]) VALUES (13, 111, CAST(N'2023-08-30T10:00:00.000' AS DateTime), 25.9900, N'123 Main St', 3.0000, 1.0000, CAST(N'2023-08-31T14:38:05.040' AS DateTime))
INSERT [dbo].[Orders] ([orderID], [customerID], [orderDate], [totalAmount], [shippingAddress], [taxAmount], [discountAmount], [recordCreatedOn]) VALUES (14, 111, CAST(N'2023-08-30T10:00:00.000' AS DateTime), 519.8000, N'123 Main St', 3.0000, 1.0000, CAST(N'2023-08-31T14:50:22.287' AS DateTime))
INSERT [dbo].[Orders] ([orderID], [customerID], [orderDate], [totalAmount], [shippingAddress], [taxAmount], [discountAmount], [recordCreatedOn]) VALUES (15, 111, CAST(N'2023-08-30T10:00:00.000' AS DateTime), 389.8500, N'123 Main St', 3.0000, 1.0000, CAST(N'2023-08-31T15:44:29.243' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([paymentID], [orderID], [customerID], [paymentDate], [amount], [status], [recordCreatedOn]) VALUES (1, 1, 101, CAST(N'2023-08-30T11:00:00.000' AS DateTime), 30.9900, N'Paid', CAST(N'2023-08-31T09:44:06.847' AS DateTime))
INSERT [dbo].[Payments] ([paymentID], [orderID], [customerID], [paymentDate], [amount], [status], [recordCreatedOn]) VALUES (2, 3, 102, CAST(N'2023-08-29T16:00:00.000' AS DateTime), 60.9900, N'Paid', CAST(N'2023-08-31T09:44:06.847' AS DateTime))
INSERT [dbo].[Payments] ([paymentID], [orderID], [customerID], [paymentDate], [amount], [status], [recordCreatedOn]) VALUES (3, 2, 103, CAST(N'2023-08-28T10:00:00.000' AS DateTime), 15.5000, N'Pending', CAST(N'2023-08-31T09:44:06.847' AS DateTime))
INSERT [dbo].[Payments] ([paymentID], [orderID], [customerID], [paymentDate], [amount], [status], [recordCreatedOn]) VALUES (4, 4, 109, CAST(N'2023-08-30T10:00:00.000' AS DateTime), 53.9800, N'Pending', CAST(N'2023-08-31T13:30:28.267' AS DateTime))
INSERT [dbo].[Payments] ([paymentID], [orderID], [customerID], [paymentDate], [amount], [status], [recordCreatedOn]) VALUES (5, 5, 109, CAST(N'2023-08-30T10:00:00.000' AS DateTime), 53.9800, N'Pending', CAST(N'2023-08-31T13:37:00.700' AS DateTime))
INSERT [dbo].[Payments] ([paymentID], [orderID], [customerID], [paymentDate], [amount], [status], [recordCreatedOn]) VALUES (6, 6, 105, CAST(N'2023-08-30T10:00:00.000' AS DateTime), 53.9800, N'Pending', CAST(N'2023-08-31T13:38:06.770' AS DateTime))
INSERT [dbo].[Payments] ([paymentID], [orderID], [customerID], [paymentDate], [amount], [status], [recordCreatedOn]) VALUES (7, 7, 105, CAST(N'2023-08-30T10:00:00.000' AS DateTime), 53.9800, N'Pending', CAST(N'2023-08-31T13:39:30.190' AS DateTime))
INSERT [dbo].[Payments] ([paymentID], [orderID], [customerID], [paymentDate], [amount], [status], [recordCreatedOn]) VALUES (8, 8, 105, CAST(N'2023-08-30T10:00:00.000' AS DateTime), 53.9800, N'Pending', CAST(N'2023-08-31T13:43:18.233' AS DateTime))
INSERT [dbo].[Payments] ([paymentID], [orderID], [customerID], [paymentDate], [amount], [status], [recordCreatedOn]) VALUES (9, 9, 105, CAST(N'2023-08-30T10:00:00.000' AS DateTime), 53.9800, N'Pending', CAST(N'2023-08-31T13:44:39.923' AS DateTime))
INSERT [dbo].[Payments] ([paymentID], [orderID], [customerID], [paymentDate], [amount], [status], [recordCreatedOn]) VALUES (10, 10, 105, CAST(N'2023-08-30T10:00:00.000' AS DateTime), 53.9800, N'Pending', CAST(N'2023-08-31T13:48:26.873' AS DateTime))
INSERT [dbo].[Payments] ([paymentID], [orderID], [customerID], [paymentDate], [amount], [status], [recordCreatedOn]) VALUES (11, 11, 105, CAST(N'2023-08-30T10:00:00.000' AS DateTime), 183.9300, N'Pending', CAST(N'2023-08-31T13:48:46.420' AS DateTime))
INSERT [dbo].[Payments] ([paymentID], [orderID], [customerID], [paymentDate], [amount], [status], [recordCreatedOn]) VALUES (12, 12, 105, CAST(N'2023-08-30T10:00:00.000' AS DateTime), 131.9500, N'Pending', CAST(N'2023-08-31T13:58:42.323' AS DateTime))
INSERT [dbo].[Payments] ([paymentID], [orderID], [customerID], [paymentDate], [amount], [status], [recordCreatedOn]) VALUES (13, 13, 111, CAST(N'2023-08-30T10:00:00.000' AS DateTime), 27.9900, N'Pending', CAST(N'2023-08-31T14:38:05.070' AS DateTime))
INSERT [dbo].[Payments] ([paymentID], [orderID], [customerID], [paymentDate], [amount], [status], [recordCreatedOn]) VALUES (14, 14, 111, CAST(N'2023-08-30T10:00:00.000' AS DateTime), 521.8000, N'Pending', CAST(N'2023-08-31T14:50:22.290' AS DateTime))
INSERT [dbo].[Payments] ([paymentID], [orderID], [customerID], [paymentDate], [amount], [status], [recordCreatedOn]) VALUES (15, 15, 111, CAST(N'2023-08-30T10:00:00.000' AS DateTime), 391.8500, N'Pending', CAST(N'2023-08-31T15:44:29.243' AS DateTime))
SET IDENTITY_INSERT [dbo].[Payments] OFF
GO
SET IDENTITY_INSERT [dbo].[Publisher] ON 

INSERT [dbo].[Publisher] ([publisherID], [publisherName], [recordCreatedOn]) VALUES (10001, N'ABC Publications', CAST(N'2023-08-31T09:04:34.203' AS DateTime))
INSERT [dbo].[Publisher] ([publisherID], [publisherName], [recordCreatedOn]) VALUES (10002, N'XYZ Books', CAST(N'2023-08-31T09:04:34.203' AS DateTime))
INSERT [dbo].[Publisher] ([publisherID], [publisherName], [recordCreatedOn]) VALUES (10003, N'Sunrise Publishing', CAST(N'2023-08-31T09:04:34.203' AS DateTime))
INSERT [dbo].[Publisher] ([publisherID], [publisherName], [recordCreatedOn]) VALUES (10004, N'Moonlight Press', CAST(N'2023-08-31T09:04:34.203' AS DateTime))
INSERT [dbo].[Publisher] ([publisherID], [publisherName], [recordCreatedOn]) VALUES (10005, N'Star Books', CAST(N'2023-08-31T09:04:34.203' AS DateTime))
INSERT [dbo].[Publisher] ([publisherID], [publisherName], [recordCreatedOn]) VALUES (10006, N'Golden Pages', CAST(N'2023-08-31T09:04:34.203' AS DateTime))
INSERT [dbo].[Publisher] ([publisherID], [publisherName], [recordCreatedOn]) VALUES (10007, N'Crystal Publishing', CAST(N'2023-08-31T09:04:34.203' AS DateTime))
INSERT [dbo].[Publisher] ([publisherID], [publisherName], [recordCreatedOn]) VALUES (10008, N'Harbor Publishers', CAST(N'2023-08-31T09:04:34.203' AS DateTime))
INSERT [dbo].[Publisher] ([publisherID], [publisherName], [recordCreatedOn]) VALUES (10009, N'Rainbow Prints', CAST(N'2023-08-31T09:04:34.203' AS DateTime))
INSERT [dbo].[Publisher] ([publisherID], [publisherName], [recordCreatedOn]) VALUES (10010, N'Swift Publications', CAST(N'2023-08-31T09:04:34.203' AS DateTime))
SET IDENTITY_INSERT [dbo].[Publisher] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([userID], [username], [passcode], [email], [registrationDate]) VALUES (5, N'111', N'1295136396', N'nitesh@example.com', CAST(N'2023-08-31T14:11:15.657' AS DateTime))
INSERT [dbo].[Users] ([userID], [username], [passcode], [email], [registrationDate]) VALUES (6, N'112', N'2305136396', N'a@example.com', CAST(N'2023-08-31T14:14:49.370' AS DateTime))
INSERT [dbo].[Users] ([userID], [username], [passcode], [email], [registrationDate]) VALUES (7, N'113', N'98989879897', N'b@example.com', CAST(N'2023-08-31T14:41:58.623' AS DateTime))
INSERT [dbo].[Users] ([userID], [username], [passcode], [email], [registrationDate]) VALUES (8, N'114', N'97989879897', N'c@example.com', CAST(N'2023-08-31T14:47:32.567' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [UQ__Books__3A75502566E9744D]    Script Date: 31-08-2023 15:48:17 ******/
ALTER TABLE [dbo].[Books] ADD UNIQUE NONCLUSTERED 
(
	[ISBNcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Books__E52A1BB3C58E5F57]    Script Date: 31-08-2023 15:48:17 ******/
ALTER TABLE [dbo].[Books] ADD UNIQUE NONCLUSTERED 
(
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Customer__7126D0BE123B60F1]    Script Date: 31-08-2023 15:48:17 ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[contactNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__AB6E6164DAD7BFE6]    Script Date: 31-08-2023 15:48:17 ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__AB6E61645E4A6BBF]    Script Date: 31-08-2023 15:48:17 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__F3DBC572AE70E446]    Script Date: 31-08-2023 15:48:17 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Author] ADD  DEFAULT ('Anonymous') FOR [authorName]
GO
ALTER TABLE [dbo].[Author] ADD  DEFAULT (sysdatetimeoffset()) FOR [recordCreatedOn]
GO
ALTER TABLE [dbo].[Books] ADD  DEFAULT (sysdatetimeoffset()) FOR [recordCreatedOn]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT (sysdatetimeoffset()) FOR [recordCreatedOn]
GO
ALTER TABLE [dbo].[CustomerActivity] ADD  DEFAULT (sysdatetimeoffset()) FOR [recordCreatedOn]
GO
ALTER TABLE [dbo].[Inventory] ADD  DEFAULT (sysdatetimeoffset()) FOR [recordCreatedOn]
GO
ALTER TABLE [dbo].[OrderItems] ADD  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[OrderItems] ADD  DEFAULT (sysdatetimeoffset()) FOR [recordCreatedOn]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (sysdatetimeoffset()) FOR [recordCreatedOn]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (sysdatetimeoffset()) FOR [recordCreatedOn]
GO
ALTER TABLE [dbo].[Publisher] ADD  DEFAULT ('Prolifics') FOR [publisherName]
GO
ALTER TABLE [dbo].[Publisher] ADD  DEFAULT (sysdatetimeoffset()) FOR [recordCreatedOn]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [registrationDate]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD FOREIGN KEY([authorID])
REFERENCES [dbo].[Author] ([authorID])
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD FOREIGN KEY([publisherID])
REFERENCES [dbo].[Publisher] ([publisherID])
GO
ALTER TABLE [dbo].[CustomerActivity]  WITH CHECK ADD FOREIGN KEY([customerID])
REFERENCES [dbo].[Customer] ([customerID])
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [LinkInventoryToBooksTable] FOREIGN KEY([bookID])
REFERENCES [dbo].[Books] ([bookID])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [LinkInventoryToBooksTable]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([customerID])
REFERENCES [dbo].[Customer] ([customerID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([customerID])
REFERENCES [dbo].[Customer] ([customerID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
/****** Object:  StoredProcedure [dbo].[AddBook]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AddBook]
	@authorID int ,
	@publisherID int ,
	@title varchar (255),
	@category varchar (127),
	@price money,
	@ISBNcode bigint,
	@pageCount int,
	@condition varchar(5),
	@publishedYear int
AS
BEGIN
Insert Into Books(authorID, publisherID, title, category, price, ISBNcode, pageCount, publishedYear, condition) 
values
	(@authorID, @publisherID, @title, @category, @price, @ISBNcode, @pageCount, @publishedYear, @condition)
END
GO
/****** Object:  StoredProcedure [dbo].[AddCustomer]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCustomer]
    @custName varchar(50),
    @email varchar(50),
    @custAddress varchar(100),
    @contactNo bigint,
	@existing_username int,
	@existing_passcode Bigint
AS
BEGIN
	If((dbo.UserLogInFun(@existing_username, @existing_passcode)) = 1)
	Begin
    INSERT INTO Customer (custName, email, custAddress, contactNo)
    VALUES (@custName, @email, @custAddress, @contactNo);
	END
	Else 
		PRINT 'Log In with valid credentials.'
END;
GO
/****** Object:  StoredProcedure [dbo].[AddToStockLevelNew]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Stored Procedure to increase stock levels
Create Procedure [dbo].[AddToStockLevelNew] 
	@bookID int
AS
BEGIN
	Declare @oldStock int;
	Select @oldStock = stockLevelNew from Inventory where bookID = @bookID;
	Update Inventory Set stockLevelNew = @oldStock+1 where bookID = @bookID;
END
GO
/****** Object:  StoredProcedure [dbo].[AddToStockLevelUsed]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Stored Procedure to increase stock levels
Create Procedure [dbo].[AddToStockLevelUsed] 
	@bookID int
AS
BEGIN
	Declare @oldStock int;
	Select @oldStock = stockLevelUsed from Inventory where bookID = @bookID;
	Update Inventory Set stockLevelUsed = @oldStock+1 where bookID = @bookID;
END
GO
/****** Object:  StoredProcedure [dbo].[GeneratePopularBook]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[GeneratePopularBook]
	@topPopular int
As
Begin
	Select Top (@topPopular)  Books.title, Books.category, Books.ISBNcode, Books.price, Author.authorName, Publisher.publisherName, COUNT(OrderItems.bookID) as OrderedTimes
	From Books Join Author
	On Books.authorID = Author.authorID Inner Join Publisher
	On Books.publisherID = Publisher.publisherID Left Join OrderItems
	On OrderItems.bookID = Books.bookID
	Group By OrderItems.bookID, Books.title, Books.category, Books.ISBNcode, Books.price, Author.authorName, Publisher.publisherName
	Order By OrderedTimes Desc;
End
GO
/****** Object:  StoredProcedure [dbo].[GetReports]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[GetReports]
	@bookID int 
As
Begin
	Select Books.title,Books.category,Books.ISBNcode, Books.price, Author.authorName, Publisher.publisherName, COUNT(OrderItems.bookID) As TotalOrders, Inventory.stockLevelNew, Inventory.stockLevelUsed
	From Books Inner Join Author 
	On Books.authorID = Author.authorID Inner Join Publisher
	On Books.publisherID = Publisher.publisherID Inner Join OrderItems
	On Books.bookID = OrderItems.bookID Inner Join Inventory
	On Books.bookID = Inventory.bookID
	Where Books.bookID = @bookID
	Group By OrderItems.bookID, Books.title, Books.category, Books.ISBNcode, Books.price, Author.authorName, Publisher.publisherName, Inventory.stockLevelNew, Inventory.stockLevelUsed;

End
GO
/****** Object:  StoredProcedure [dbo].[PlaceOrder]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PlaceOrder]
    @customerID INT,
    @orderDate DATETIME,
    @shippingAddress VARCHAR(100),
    @bookID INT,
    @quantity INT,
    @priceOfUnitQuantity MONEY,
    @taxAmount MONEY,
    @discountAmount MONEY,
	@bookType VARCHAR(16)
	
AS
BEGIN
    DECLARE @orderID INT;
	DECLARE @presentStockLevelNew INT;
	DECLARE @presentStockLevelUsed INT;
	DECLARE @passcode varchar(100)
	Select @presentStockLevelNew = stockLevelNew, @presentStockLevelUsed = stockLevelUsed from Inventory where bookID = @bookID;
	Select @passcode = passcode from Users where username = @customerID;
	
	If((dbo.UserLogInFun(@customerID,@passcode)) = 1)
	Begin
--	PRINT @presentStockLevelNew;
--	PRINT @presentStockLevelUsed;

	If (@bookType like 'New')
		Begin
			--Print @bookType;
			If(@presentStockLevelNew >= @quantity)
			Begin
				--PRINT @presentStockLevelUsed;
				Declare @i int;
				Set @i = 1;
				While (@i <=@quantity)
				Begin
						EXEC SubstractToStockLevelNew @bookID;
						Set @i = @i +1;
				End
			 -- Insert into Orders table
				INSERT INTO Orders (customerID, orderDate, totalAmount, shippingAddress, taxAmount, discountAmount)
				VALUES (@customerID, @orderDate, @quantity * @priceOfUnitQuantity, @shippingAddress, @taxAmount, @discountAmount);

				-- Get the generated orderID
				SET @orderID = SCOPE_IDENTITY();

				-- Insert into OrderItems table
				INSERT INTO OrderItems (orderID, bookID, quantity, priceOfUnitQuantity)
				VALUES (@orderID, @bookID, @quantity, @priceOfUnitQuantity);

				-- Insert into Payments table
				INSERT INTO Payments (orderID, customerID, paymentDate, amount, status)
				VALUES (@orderID, @customerID, @orderDate, @quantity * @priceOfUnitQuantity - @discountAmount + @taxAmount, 'Pending');
			End
				Else
					PRINT 'The order Quantity is not available.';
		End

		--If Orderd Used Books
		If (@bookType like 'Used')
		Begin
			--Print @bookType;
			If(@presentStockLevelUsed >= @quantity)
			Begin
				--PRINT @presentStockLevelUsed;
				Declare @j int;
				Set @j = 1;
				While (@j <=@quantity)
				Begin
						EXEC SubstractToStockLevelUsed @bookID;
						Set @j = @j +1;
				End
			 -- Insert into Orders table
				INSERT INTO Orders (customerID, orderDate, totalAmount, shippingAddress, taxAmount, discountAmount)
				VALUES (@customerID, @orderDate, @quantity * @priceOfUnitQuantity, @shippingAddress, @taxAmount, @discountAmount);

				-- Get the generated orderID
				SET @orderID = SCOPE_IDENTITY();

				-- Insert into OrderItems table
				INSERT INTO OrderItems (orderID, bookID, quantity, priceOfUnitQuantity)
				VALUES (@orderID, @bookID, @quantity, @priceOfUnitQuantity);

				-- Insert into Payments table
				INSERT INTO Payments (orderID, customerID, paymentDate, amount, status)
				VALUES (@orderID, @customerID, @orderDate, @quantity * @priceOfUnitQuantity - @discountAmount + @taxAmount, 'Pending');
			End
				Else
					PRINT 'The order Quantity is not available.';
		End
		End 
			Else
				PRINT 'Customer Need to be added';
END;
GO
/****** Object:  StoredProcedure [dbo].[RegisterUser]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedure to User Registration
CREATE PROCEDURE [dbo].[RegisterUser]
    @username VARCHAR(50),
    @password VARCHAR(255),
    @email VARCHAR(100)
AS
BEGIN
    DECLARE @passcode VARCHAR(100);
    
    -- Hash the password (use appropriate hashing algorithm)
    SET @passcode = HASHBYTES('SHA2_512', @password);

    -- Insert user data into Users table
    INSERT INTO Users (username, passcode, email)
    VALUES (@username, @password, @email);
END;
GO
/****** Object:  StoredProcedure [dbo].[SearchBookByAuthor]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SearchBookByAuthor]
	@Author varchar(255)
As 
Begin
	Declare @authorID int;
	Select @authorID = authorID from Author where authorName = @Author;
	Select * from Books where authorID = @authorID;
End
GO
/****** Object:  StoredProcedure [dbo].[SearchBookByID]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Search Book By Id
Create Procedure [dbo].[SearchBookByID]
	@id int
As 
Begin
	Select * from Books where bookID = @id;
End
GO
/****** Object:  StoredProcedure [dbo].[SearchBookByTitle]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Search Book By Title
Create Procedure [dbo].[SearchBookByTitle]
	@title varchar(255)
As 
Begin
	Select * from Books where title = @title;
End
GO
/****** Object:  StoredProcedure [dbo].[SubstractToStockLevelNew]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SubstractToStockLevelNew] 
	@bookID int
AS
BEGIN
	Declare @oldStock int;
	Select @oldStock = stockLevelNew from Inventory where bookID = @bookID;
	Update Inventory Set stockLevelNew = @oldStock-1 where bookID = @bookID And @oldStock >0;
END
GO
/****** Object:  StoredProcedure [dbo].[SubstractToStockLevelUsed]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Stored Procedure to Decrease stock levels
Create Procedure [dbo].[SubstractToStockLevelUsed] 
	@bookID int
AS
BEGIN
	Declare @oldStock int;
	Select @oldStock = stockLevelUsed from Inventory where bookID = @bookID;
	Update Inventory Set stockLevelUsed = @oldStock-1 where bookID = @bookID And @oldStock >0;
END
GO
/****** Object:  StoredProcedure [dbo].[UserLogin]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserLogin]
    @username VARCHAR(50),
    @password VARCHAR(100)
AS
BEGIN
    DECLARE @storedPasswordHash VARCHAR(100);

    -- Get the stored password hash for the provided username
    SELECT @storedPasswordHash = passcode
    FROM Users
    WHERE username = @username;

    -- Hash the provided password using the same algorithm
    DECLARE @inputPasswordHash VARCHAR(100);
    --SET @inputPasswordHash = CONVERT(VARCHAR(100), HASHBYTES('SHA2_512', @password), 2);



    -- Check if the provided password hash matches the stored password hash
    IF @storedPasswordHash = @password
    BEGIN
        PRINT 'Login successful';
        -- You might add additional actions here, like setting a session token or updating login history.
    END
    ELSE
    BEGIN
        PRINT 'Login failed';
    END;
END;
GO
/****** Object:  Trigger [dbo].[AfterInsertBook]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[AfterInsertBook]
ON [dbo].[Books]
AFTER INSERT
AS
BEGIN
    -- Insert the new book into the Inventory table with default stock levels
    INSERT INTO Inventory (bookID, stockLevelUsed, stockLevelNew)
    SELECT inserted.bookID, 0, 0
    FROM inserted;
END;
GO
ALTER TABLE [dbo].[Books] ENABLE TRIGGER [AfterInsertBook]
GO
/****** Object:  Trigger [dbo].[AddCustomerAsUser]    Script Date: 31-08-2023 15:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Trigger [dbo].[AddCustomerAsUser] 
On [dbo].[Customer]
AFTER INSERT
AS
BEGIN
	DECLARE @username varchar(255);
	DECLARE @passcode varchar(100);
	DECLARE @email varchar(100);

	Select @username = inserted.customerID, @passcode = inserted.contactNo, @email = inserted.email From inserted;

	INSERT INTO Users (username, passcode, email)
	VALUES(@username, @passcode,@email) 
END
GO
ALTER TABLE [dbo].[Customer] ENABLE TRIGGER [AddCustomerAsUser]
GO
USE [master]
GO
ALTER DATABASE [BookStoresProject] SET  READ_WRITE 
GO
