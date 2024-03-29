USE [UserManagement]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Status]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Roles]
GO
ALTER TABLE [dbo].[Histories] DROP CONSTRAINT [FK_Histories_Users]
GO
ALTER TABLE [dbo].[Histories] DROP CONSTRAINT [FK_Histories_Status]
GO
ALTER TABLE [dbo].[Histories] DROP CONSTRAINT [FK_Histories_Ranks]
GO
ALTER TABLE [dbo].[Histories] DROP CONSTRAINT [FK_Histories_Promotions]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/21/2021 13:27:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 6/21/2021 13:27:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Status]') AND type in (N'U'))
DROP TABLE [dbo].[Status]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/21/2021 13:27:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
DROP TABLE [dbo].[Roles]
GO
/****** Object:  Table [dbo].[Ranks]    Script Date: 6/21/2021 13:27:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ranks]') AND type in (N'U'))
DROP TABLE [dbo].[Ranks]
GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 6/21/2021 13:27:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Promotions]') AND type in (N'U'))
DROP TABLE [dbo].[Promotions]
GO
/****** Object:  Table [dbo].[Histories]    Script Date: 6/21/2021 13:27:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Histories]') AND type in (N'U'))
DROP TABLE [dbo].[Histories]
GO
/****** Object:  Table [dbo].[Histories]    Script Date: 6/21/2021 13:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Histories](
	[historyID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [nvarchar](25) NULL,
	[rankID] [int] NULL,
	[assignDate] [date] NULL,
	[promotionID] [int] NULL,
	[statusID] [int] NULL,
 CONSTRAINT [PK_Histories] PRIMARY KEY CLUSTERED 
(
	[historyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 6/21/2021 13:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions](
	[promotionID] [int] NOT NULL,
	[promotionName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Promotions] PRIMARY KEY CLUSTERED 
(
	[promotionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ranks]    Script Date: 6/21/2021 13:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ranks](
	[rankID] [int] NOT NULL,
	[rankValue] [int] NULL,
 CONSTRAINT [PK_Ranks] PRIMARY KEY CLUSTERED 
(
	[rankID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/21/2021 13:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[roleID] [int] NOT NULL,
	[roleName] [nvarchar](25) NULL,
 CONSTRAINT [PK_Roles1] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 6/21/2021 13:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[statusID] [int] NOT NULL,
	[statusName] [nvarchar](20) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/21/2021 13:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [nvarchar](25) NOT NULL,
	[userName] [nvarchar](50) NULL,
	[password] [nvarchar](64) NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nvarchar](25) NULL,
	[roleID] [int] NULL,
	[photo] [nvarchar](50) NULL,
	[statusID] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Histories] ON 

INSERT [dbo].[Histories] ([historyID], [userID], [rankID], [assignDate], [promotionID], [statusID]) VALUES (3, N'U006', 5, CAST(N'2021-06-08' AS Date), 3, 2)
INSERT [dbo].[Histories] ([historyID], [userID], [rankID], [assignDate], [promotionID], [statusID]) VALUES (4, N'U005', 5, CAST(N'2021-06-08' AS Date), 1, 2)
INSERT [dbo].[Histories] ([historyID], [userID], [rankID], [assignDate], [promotionID], [statusID]) VALUES (5, N'U006', 5, CAST(N'2021-06-09' AS Date), 4, 1)
INSERT [dbo].[Histories] ([historyID], [userID], [rankID], [assignDate], [promotionID], [statusID]) VALUES (6, N'U007', 5, CAST(N'2021-06-09' AS Date), 2, 2)
INSERT [dbo].[Histories] ([historyID], [userID], [rankID], [assignDate], [promotionID], [statusID]) VALUES (7, N'U007', 5, CAST(N'2021-06-09' AS Date), 1, 2)
INSERT [dbo].[Histories] ([historyID], [userID], [rankID], [assignDate], [promotionID], [statusID]) VALUES (8, N'U007', 5, CAST(N'2021-06-09' AS Date), 3, 1)
INSERT [dbo].[Histories] ([historyID], [userID], [rankID], [assignDate], [promotionID], [statusID]) VALUES (9, N'U0014', 5, CAST(N'2021-06-20' AS Date), 4, 2)
INSERT [dbo].[Histories] ([historyID], [userID], [rankID], [assignDate], [promotionID], [statusID]) VALUES (10, N'U012', 5, CAST(N'2021-06-20' AS Date), 2, 2)
INSERT [dbo].[Histories] ([historyID], [userID], [rankID], [assignDate], [promotionID], [statusID]) VALUES (11, N'U013', 5, CAST(N'2021-06-20' AS Date), 2, 1)
INSERT [dbo].[Histories] ([historyID], [userID], [rankID], [assignDate], [promotionID], [statusID]) VALUES (12, N'U113', 5, CAST(N'2021-06-20' AS Date), 5, 1)
INSERT [dbo].[Histories] ([historyID], [userID], [rankID], [assignDate], [promotionID], [statusID]) VALUES (13, N'U114', 5, CAST(N'2021-06-20' AS Date), 5, 1)
INSERT [dbo].[Histories] ([historyID], [userID], [rankID], [assignDate], [promotionID], [statusID]) VALUES (14, N'U115', 5, CAST(N'2021-06-20' AS Date), 2, 1)
INSERT [dbo].[Histories] ([historyID], [userID], [rankID], [assignDate], [promotionID], [statusID]) VALUES (15, N'U116', 5, CAST(N'2021-06-20' AS Date), 5, 2)
INSERT [dbo].[Histories] ([historyID], [userID], [rankID], [assignDate], [promotionID], [statusID]) VALUES (16, N'U0014', 5, CAST(N'2021-06-20' AS Date), 2, 2)
INSERT [dbo].[Histories] ([historyID], [userID], [rankID], [assignDate], [promotionID], [statusID]) VALUES (17, N'U0014', 5, CAST(N'2021-06-20' AS Date), 1, 2)
INSERT [dbo].[Histories] ([historyID], [userID], [rankID], [assignDate], [promotionID], [statusID]) VALUES (18, N'U0014', 5, CAST(N'2021-06-20' AS Date), 2, 1)
SET IDENTITY_INSERT [dbo].[Histories] OFF
GO
INSERT [dbo].[Promotions] ([promotionID], [promotionName]) VALUES (1, N'Nhan Vien')
INSERT [dbo].[Promotions] ([promotionID], [promotionName]) VALUES (2, N'Giam Doc')
INSERT [dbo].[Promotions] ([promotionID], [promotionName]) VALUES (3, N'Bao Ve')
INSERT [dbo].[Promotions] ([promotionID], [promotionName]) VALUES (4, N'Quan Ly')
INSERT [dbo].[Promotions] ([promotionID], [promotionName]) VALUES (5, N'Tap Vu')
GO
INSERT [dbo].[Ranks] ([rankID], [rankValue]) VALUES (1, 1)
INSERT [dbo].[Ranks] ([rankID], [rankValue]) VALUES (2, 2)
INSERT [dbo].[Ranks] ([rankID], [rankValue]) VALUES (3, 3)
INSERT [dbo].[Ranks] ([rankID], [rankValue]) VALUES (4, 4)
INSERT [dbo].[Ranks] ([rankID], [rankValue]) VALUES (5, 5)
INSERT [dbo].[Ranks] ([rankID], [rankValue]) VALUES (6, 6)
INSERT [dbo].[Ranks] ([rankID], [rankValue]) VALUES (7, 7)
INSERT [dbo].[Ranks] ([rankID], [rankValue]) VALUES (8, 8)
INSERT [dbo].[Ranks] ([rankID], [rankValue]) VALUES (9, 9)
INSERT [dbo].[Ranks] ([rankID], [rankValue]) VALUES (10, 10)
GO
INSERT [dbo].[Roles] ([roleID], [roleName]) VALUES (1, N'User')
INSERT [dbo].[Roles] ([roleID], [roleName]) VALUES (2, N'Admin')
GO
INSERT [dbo].[Status] ([statusID], [statusName]) VALUES (1, N'Active')
INSERT [dbo].[Status] ([statusID], [statusName]) VALUES (2, N'InActive')
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [phone], [roleID], [photo], [statusID]) VALUES (N'U001', N'Pham Manh Toan', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'MinhT@gmail.com', N'123345678', 2, N'U001.jpg', 1)
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [phone], [roleID], [photo], [statusID]) VALUES (N'U0014', N'toanzzzzzzzz', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'toandeptrai@gmail.com', N'036396436', 1, N'U0014.jpg', 1)
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [phone], [roleID], [photo], [statusID]) VALUES (N'U002', N'anh sang', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'sang@gmail.com', N'123', 2, N'abc', 1)
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [phone], [roleID], [photo], [statusID]) VALUES (N'U003', N'hien anh', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'hien@gmail.com', N'123456789', 2, N'U003.jpg', 1)
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [phone], [roleID], [photo], [statusID]) VALUES (N'U004', N'minh tuan', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'tuan@gmail.com', N'123456789', 2, N'U004.jpg', 1)
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [phone], [roleID], [photo], [statusID]) VALUES (N'U005', N'thao vy', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'vy@gmail.com', N'123', 1, N'abc', 2)
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [phone], [roleID], [photo], [statusID]) VALUES (N'U006', N'thanh trong', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'trong@gmail.com', N'123456789', 2, N'U006.jpg', 1)
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [phone], [roleID], [photo], [statusID]) VALUES (N'U007', N'minh nhat', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'nhat@gmail.com', N'123456789', 1, N'U007.jpg', 2)
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [phone], [roleID], [photo], [statusID]) VALUES (N'U009', N'abc', N'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', N'HoaDNT@fpt.edu.vn', N'121212121', 1, N'U009.jpg', 2)
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [phone], [roleID], [photo], [statusID]) VALUES (N'U010', N'abc', N'8bb0cf6eb9b17d0f7d22b456f121257dc1254e1f01665370476383ea776df414', N'HoaDNT@fpt.edu.vn', N'121212121', 1, N'U010.jpg', 2)
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [phone], [roleID], [photo], [statusID]) VALUES (N'U011', N'toandeptrai102', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'HoaDNT@fpt.edu.vn', N'121212121', 1, N'U011.jpg', 2)
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [phone], [roleID], [photo], [statusID]) VALUES (N'U012', N'sang', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'anc@gmail.com', N'0335272043', 1, N'U012.jpg', 1)
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [phone], [roleID], [photo], [statusID]) VALUES (N'U013', N'tung', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'a@gmail.com', N'0335272043', 1, N'U013.jpg', 1)
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [phone], [roleID], [photo], [statusID]) VALUES (N'U111', N'toanqqqq', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'abc@gmail.com', N'0363964361', 1, N'U111.jpg', 2)
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [phone], [roleID], [photo], [statusID]) VALUES (N'U112', N'toandeptraicomotkhonghai', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'phammanhtoanhht@gmail.com', N'0969080408', 1, N'U112.jpg', 1)
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [phone], [roleID], [photo], [statusID]) VALUES (N'U113', N'MinhT', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'MinhT@gmail.com', N'0969080408', 1, N'U113.jpg', 1)
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [phone], [roleID], [photo], [statusID]) VALUES (N'U114', N'MinhT', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'phammanhtoan933@gmail.com', N'0969080408', 1, N'U114.jpg', 2)
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [phone], [roleID], [photo], [statusID]) VALUES (N'U115', N'MinhT', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'MinhT@gmail.com', N'0969080408', 1, N'U115.jpg', 1)
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [phone], [roleID], [photo], [statusID]) VALUES (N'U116', N'MinhT', N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', N'phammanhtoanhht933@gmail.com', N'0000000000', 1, N'U116.jpg', 1)
GO
ALTER TABLE [dbo].[Histories]  WITH CHECK ADD  CONSTRAINT [FK_Histories_Promotions] FOREIGN KEY([promotionID])
REFERENCES [dbo].[Promotions] ([promotionID])
GO
ALTER TABLE [dbo].[Histories] CHECK CONSTRAINT [FK_Histories_Promotions]
GO
ALTER TABLE [dbo].[Histories]  WITH CHECK ADD  CONSTRAINT [FK_Histories_Ranks] FOREIGN KEY([rankID])
REFERENCES [dbo].[Ranks] ([rankID])
GO
ALTER TABLE [dbo].[Histories] CHECK CONSTRAINT [FK_Histories_Ranks]
GO
ALTER TABLE [dbo].[Histories]  WITH CHECK ADD  CONSTRAINT [FK_Histories_Status] FOREIGN KEY([statusID])
REFERENCES [dbo].[Status] ([statusID])
GO
ALTER TABLE [dbo].[Histories] CHECK CONSTRAINT [FK_Histories_Status]
GO
ALTER TABLE [dbo].[Histories]  WITH CHECK ADD  CONSTRAINT [FK_Histories_Users] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Histories] CHECK CONSTRAINT [FK_Histories_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([roleID])
REFERENCES [dbo].[Roles] ([roleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Status] FOREIGN KEY([statusID])
REFERENCES [dbo].[Status] ([statusID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Status]
GO
