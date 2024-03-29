USE [OrderBento]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 2021/6/2 下午 08:22:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Account] [varchar](16) NOT NULL,
	[Password] [varchar](16) NOT NULL,
	[Name] [nvarchar](5) NOT NULL,
	[Image] [varchar](50) NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 2021/6/2 下午 08:22:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Gid] [int] NULL,
	[Name] [nvarchar](10) NOT NULL,
	[AccountName] [nvarchar](5) NOT NULL,
	[RestName] [nvarchar](10) NOT NULL,
	[Status] [nvarchar](3) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 2021/6/2 下午 08:22:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[DishName] [nvarchar](16) NOT NULL,
	[ResName] [nvarchar](10) NOT NULL,
	[Price] [decimal](4, 0) NOT NULL,
 CONSTRAINT [PK_Menus] PRIMARY KEY CLUSTERED 
(
	[DishName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2021/6/2 下午 08:22:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(5,1) NOT NULL,
	[GroupName] [nvarchar](10) NOT NULL,
	[AccountName] [nvarchar](5) NOT NULL,
	[DishName] [nvarchar](16) NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurants]    Script Date: 2021/6/2 下午 08:22:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurants](
	[Rid] [int] NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[Tel] [varchar](10) NULL,
	[Address] [nvarchar](20) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Account], [Password], [Name], [Image]) VALUES (N'admin', N'123', N'台中金城武', N'Images/TaichungKim.jpg')
INSERT [dbo].[Accounts] ([Account], [Password], [Name], [Image]) VALUES (N'idai', N'222', N'亞洲統神', N'Images/idai.jpg')
INSERT [dbo].[Accounts] ([Account], [Password], [Name], [Image]) VALUES (N'stanley', N'111', N'史丹利', N'Images/stanley.jpg')
GO
INSERT [dbo].[Groups] ([Gid], [Name], [AccountName], [RestName], [Status]) VALUES (1, N'第一團', N'台中金城武', N'麥當勞', N'未結團')
INSERT [dbo].[Groups] ([Gid], [Name], [AccountName], [RestName], [Status]) VALUES (7, N'第七團', N'台中金城武', N'麥當勞', N'未結團')
INSERT [dbo].[Groups] ([Gid], [Name], [AccountName], [RestName], [Status]) VALUES (2, N'第二團', N'史丹利', N'麥當勞', N'未結團')
INSERT [dbo].[Groups] ([Gid], [Name], [AccountName], [RestName], [Status]) VALUES (3, N'第三團', N'台中金城武', N'麥當勞', N'未結團')
INSERT [dbo].[Groups] ([Gid], [Name], [AccountName], [RestName], [Status]) VALUES (5, N'第五團', N'台中金城武', N'麥當勞', N'未結團')
INSERT [dbo].[Groups] ([Gid], [Name], [AccountName], [RestName], [Status]) VALUES (6, N'第六團', N'史丹利', N'麥當勞', N'未結團')
INSERT [dbo].[Groups] ([Gid], [Name], [AccountName], [RestName], [Status]) VALUES (4, N'第四團', N'史丹利', N'麥當勞', N'未結團')
GO
INSERT [dbo].[Menus] ([DishName], [ResName], [Price]) VALUES (N'大麥克', N'麥當勞', CAST(99 AS Decimal(4, 0)))
INSERT [dbo].[Menus] ([DishName], [ResName], [Price]) VALUES (N'勁辣雞腿堡', N'麥當勞', CAST(99 AS Decimal(4, 0)))
INSERT [dbo].[Menus] ([DishName], [ResName], [Price]) VALUES (N'麥香魚', N'麥當勞', CAST(89 AS Decimal(4, 0)))
INSERT [dbo].[Menus] ([DishName], [ResName], [Price]) VALUES (N'麥脆雞', N'麥當勞', CAST(129 AS Decimal(4, 0)))
INSERT [dbo].[Menus] ([DishName], [ResName], [Price]) VALUES (N'雙層牛肉堡', N'麥當勞', CAST(89 AS Decimal(4, 0)))
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID], [GroupName], [AccountName], [DishName], [Amount]) VALUES (1, N'第一團', N'台中金城武', N'大麥克', 2)
INSERT [dbo].[Orders] ([ID], [GroupName], [AccountName], [DishName], [Amount]) VALUES (2, N'第一團', N'史丹利', N'勁辣雞腿堡', 3)
INSERT [dbo].[Orders] ([ID], [GroupName], [AccountName], [DishName], [Amount]) VALUES (3, N'第一團', N'史丹利', N'麥脆雞', 2)
INSERT [dbo].[Orders] ([ID], [GroupName], [AccountName], [DishName], [Amount]) VALUES (4, N'第一團', N'亞洲統神', N'雙層牛肉堡', 1)
INSERT [dbo].[Orders] ([ID], [GroupName], [AccountName], [DishName], [Amount]) VALUES (5, N'第一團', N'亞洲統神', N'麥香魚', 3)
INSERT [dbo].[Orders] ([ID], [GroupName], [AccountName], [DishName], [Amount]) VALUES (6, N'第一團', N'亞洲統神', N'麥脆雞', 2)
INSERT [dbo].[Orders] ([ID], [GroupName], [AccountName], [DishName], [Amount]) VALUES (7, N'第一團', N'台中金城武', N'麥脆雞', 2)
INSERT [dbo].[Orders] ([ID], [GroupName], [AccountName], [DishName], [Amount]) VALUES (8, N'第一團', N'史丹利', N'麥香魚', 1)
INSERT [dbo].[Orders] ([ID], [GroupName], [AccountName], [DishName], [Amount]) VALUES (9, N'第一團', N'史丹利', N'雙層牛肉堡', 2)
INSERT [dbo].[Orders] ([ID], [GroupName], [AccountName], [DishName], [Amount]) VALUES (10, N'第一團', N'史丹利', N'麥脆雞', 2)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[Restaurants] ([Rid], [Name], [Tel], [Address]) VALUES (1, N'麥當勞', N'0212345678', N'高雄市橋頭區')
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Accounts] FOREIGN KEY([Account])
REFERENCES [dbo].[Accounts] ([Account])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Accounts]
GO
