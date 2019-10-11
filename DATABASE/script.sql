USE [master]
GO
/****** Object:  Database [projectDB]    Script Date: 10/11/2019 1:33:15 AM ******/
CREATE DATABASE [projectDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'projectDB', FILENAME = N'D:\sql server\sql server 2017\MSSQL14.SQLEXPRESS\MSSQL\DATA\projectDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'projectDB_log', FILENAME = N'D:\sql server\sql server 2017\MSSQL14.SQLEXPRESS\MSSQL\DATA\projectDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [projectDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [projectDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [projectDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [projectDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [projectDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [projectDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [projectDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [projectDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [projectDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [projectDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [projectDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [projectDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [projectDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [projectDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [projectDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [projectDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [projectDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [projectDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [projectDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [projectDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [projectDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [projectDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [projectDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [projectDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [projectDB] SET RECOVERY FULL 
GO
ALTER DATABASE [projectDB] SET  MULTI_USER 
GO
ALTER DATABASE [projectDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [projectDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [projectDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [projectDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [projectDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'projectDB', N'ON'
GO
ALTER DATABASE [projectDB] SET QUERY_STORE = OFF
GO
USE [projectDB]
GO
/****** Object:  Table [dbo].[PaymentDetails]    Script Date: 10/11/2019 1:33:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[txtType] [varchar](max) NULL,
	[amount] [float] NULL,
	[remarks] [varchar](max) NULL,
	[mentorId] [int] NOT NULL,
	[mentorName] [varchar](max) NULL,
	[trainingId] [int] NOT NULL,
	[skillName] [varchar](max) NULL,
	[totalAmountToMentor] [float] NULL,
	[commision] [int] NULL,
 CONSTRAINT [PaymentDtls] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SignupDtls]    Script Date: 10/11/2019 1:33:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SignupDtls](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[userName] [varchar](max) NOT NULL,
	[password] [varchar](max) NOT NULL,
	[firstName] [char](50) NOT NULL,
	[lastName] [char](50) NOT NULL,
	[contactNumber] [numeric](10, 0) NOT NULL,
	[regCode] [varchar](max) NULL,
	[role] [int] NOT NULL,
	[linkdinUrl] [varchar](max) NULL,
	[yearOfExperience] [int] NULL,
	[active] [bit] NOT NULL,
	[confirmedSignUp] [bit] NULL,
	[resetPasswordDate] [datetime] NULL,
	[resetPassword] [bit] NULL,
	[pictureUrl] [varchar](max) NULL,
	[technology] [varchar](max) NULL,
 CONSTRAINT [PK_UserDtls] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkillDetails]    Script Date: 10/11/2019 1:33:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkillDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](max) NULL,
	[toc] [varchar](max) NULL,
	[prerequisites] [varchar](max) NULL,
	[fees] [int] NULL,
 CONSTRAINT [SkillDtls] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainingDtls]    Script Date: 10/11/2019 1:33:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainingDtls](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [varchar](max) NULL,
	[progress] [int] NULL,
	[commisionAmount] [float] NULL,
	[rating] [int] NULL,
	[avaRating] [float] NULL,
	[startDate] [date] NULL,
	[endDate] [date] NULL,
	[startTime] [datetime] NULL,
	[endTime] [datetime] NULL,
	[amountReceived] [float] NULL,
	[userId] [int] NOT NULL,
	[userName] [varchar](max) NULL,
	[mentorId] [int] NOT NULL,
	[mentorName] [varchar](max) NULL,
	[skillId] [int] NOT NULL,
	[skillname] [varchar](max) NULL,
	[fees] [float] NULL,
	[timeSlot] [varchar](max) NULL,
	[requested] [bit] NULL,
	[rejectNotify] [bit] NULL,
	[paymentStatus] [bit] NULL,
 CONSTRAINT [PK_TrainingDtls] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PaymentDetails] ON 

INSERT [dbo].[PaymentDetails] ([id], [txtType], [amount], [remarks], [mentorId], [mentorName], [trainingId], [skillName], [totalAmountToMentor], [commision]) VALUES (1, NULL, NULL, NULL, 0, NULL, 0, N'Dot NET', NULL, NULL)
INSERT [dbo].[PaymentDetails] ([id], [txtType], [amount], [remarks], [mentorId], [mentorName], [trainingId], [skillName], [totalAmountToMentor], [commision]) VALUES (2, NULL, 1200, NULL, 2, N'Arvind                                            ', 1, N'Dot NET', NULL, NULL)
INSERT [dbo].[PaymentDetails] ([id], [txtType], [amount], [remarks], [mentorId], [mentorName], [trainingId], [skillName], [totalAmountToMentor], [commision]) VALUES (1002, NULL, 1200, NULL, 2, N'Arvind                                            ', 2, N'Dot NET', NULL, NULL)
INSERT [dbo].[PaymentDetails] ([id], [txtType], [amount], [remarks], [mentorId], [mentorName], [trainingId], [skillName], [totalAmountToMentor], [commision]) VALUES (1003, NULL, 6000, NULL, 46, N'Cornel', 9, N'Mean Stack', 5700, 400)
INSERT [dbo].[PaymentDetails] ([id], [txtType], [amount], [remarks], [mentorId], [mentorName], [trainingId], [skillName], [totalAmountToMentor], [commision]) VALUES (1004, NULL, 1000, NULL, 1003, N'Ankit                                             ', 3, N'Mean Stack', NULL, NULL)
INSERT [dbo].[PaymentDetails] ([id], [txtType], [amount], [remarks], [mentorId], [mentorName], [trainingId], [skillName], [totalAmountToMentor], [commision]) VALUES (1005, NULL, 1000, NULL, 1003, N'Ankit                                             ', 3, N'Mean Stack', NULL, NULL)
SET IDENTITY_INSERT [dbo].[PaymentDetails] OFF
SET IDENTITY_INSERT [dbo].[SignupDtls] ON 

INSERT [dbo].[SignupDtls] ([id], [email], [userName], [password], [firstName], [lastName], [contactNumber], [regCode], [role], [linkdinUrl], [yearOfExperience], [active], [confirmedSignUp], [resetPasswordDate], [resetPassword], [pictureUrl], [technology]) VALUES (1, N'ankith@gmail.com', N'jjsjjjjs', N'12345678', N'iwsisi                                            ', N'hshshhs                                           ', CAST(8985081643 AS Numeric(10, 0)), NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SignupDtls] ([id], [email], [userName], [password], [firstName], [lastName], [contactNumber], [regCode], [role], [linkdinUrl], [yearOfExperience], [active], [confirmedSignUp], [resetPasswordDate], [resetPassword], [pictureUrl], [technology]) VALUES (2, N'a@arvind.com', N'arvindkumar', N'aaaaaaaa', N'Arvind                                            ', N'Kumar                                             ', CAST(9876985666 AS Numeric(10, 0)), NULL, 2, N'linkedinArvind', 5, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SignupDtls] ([id], [email], [userName], [password], [firstName], [lastName], [contactNumber], [regCode], [role], [linkdinUrl], [yearOfExperience], [active], [confirmedSignUp], [resetPasswordDate], [resetPassword], [pictureUrl], [technology]) VALUES (1002, N's@gmail.com', N'souvikmallick', N'asdfghjkl', N'Souvik                                            ', N'Mallick                                           ', CAST(8986565377 AS Numeric(10, 0)), NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SignupDtls] ([id], [email], [userName], [password], [firstName], [lastName], [contactNumber], [regCode], [role], [linkdinUrl], [yearOfExperience], [active], [confirmedSignUp], [resetPasswordDate], [resetPassword], [pictureUrl], [technology]) VALUES (1003, N'a@ankit.com', N'akliv', N'123456789', N'Ankit                                             ', N'Kumar                                             ', CAST(8976867564 AS Numeric(10, 0)), NULL, 2, N'httpp', 10, 1, NULL, NULL, NULL, NULL, N'Mean Stack')
INSERT [dbo].[SignupDtls] ([id], [email], [userName], [password], [firstName], [lastName], [contactNumber], [regCode], [role], [linkdinUrl], [yearOfExperience], [active], [confirmedSignUp], [resetPasswordDate], [resetPassword], [pictureUrl], [technology]) VALUES (1004, N'b@bikash.com', N'bikashsaha', N'123456789', N'Bikash                                            ', N'Saha                                              ', CAST(9874565467 AS Numeric(10, 0)), NULL, 2, N'lindinsgs', 8, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SignupDtls] ([id], [email], [userName], [password], [firstName], [lastName], [contactNumber], [regCode], [role], [linkdinUrl], [yearOfExperience], [active], [confirmedSignUp], [resetPasswordDate], [resetPassword], [pictureUrl], [technology]) VALUES (1005, N's@sanjay.com', N'sanjaykumar', N'123456789', N'Sanjay                                            ', N'Kumar                                             ', CAST(9897868689 AS Numeric(10, 0)), NULL, 2, N'asdsagsd', 6, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SignupDtls] ([id], [email], [userName], [password], [firstName], [lastName], [contactNumber], [regCode], [role], [linkdinUrl], [yearOfExperience], [active], [confirmedSignUp], [resetPasswordDate], [resetPassword], [pictureUrl], [technology]) VALUES (1006, N'a@gmail.com', N'ankitsri', N'akliv123', N'Ankit                                             ', N'Srivastava                                        ', CAST(9865740000 AS Numeric(10, 0)), NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SignupDtls] ([id], [email], [userName], [password], [firstName], [lastName], [contactNumber], [regCode], [role], [linkdinUrl], [yearOfExperience], [active], [confirmedSignUp], [resetPasswordDate], [resetPassword], [pictureUrl], [technology]) VALUES (1007, N'd@dhiman.com', N'dman', N'dhimanmondal', N'Dhiman                                            ', N'Mondal                                            ', CAST(9845349801 AS Numeric(10, 0)), NULL, 2, N'ghdfshghl', 5, 1, NULL, NULL, NULL, NULL, N'Web Application')
INSERT [dbo].[SignupDtls] ([id], [email], [userName], [password], [firstName], [lastName], [contactNumber], [regCode], [role], [linkdinUrl], [yearOfExperience], [active], [confirmedSignUp], [resetPasswordDate], [resetPassword], [pictureUrl], [technology]) VALUES (1008, N'bittu@gmail.com', N'bittudada', N'1212121212', N'Bittu                                             ', N'Saha                                              ', CAST(9876567865 AS Numeric(10, 0)), NULL, 1, N'', NULL, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SignupDtls] ([id], [email], [userName], [password], [firstName], [lastName], [contactNumber], [regCode], [role], [linkdinUrl], [yearOfExperience], [active], [confirmedSignUp], [resetPasswordDate], [resetPassword], [pictureUrl], [technology]) VALUES (1011, N'swaggy@gmail.com', N'swaggydada', N'1212131313', N'Swagata                                           ', N'Nath                                              ', CAST(9876555565 AS Numeric(10, 0)), NULL, 1, N'', NULL, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SignupDtls] ([id], [email], [userName], [password], [firstName], [lastName], [contactNumber], [regCode], [role], [linkdinUrl], [yearOfExperience], [active], [confirmedSignUp], [resetPasswordDate], [resetPassword], [pictureUrl], [technology]) VALUES (1012, N'swaggy1@gmail.com', N'swaggydada', N'1212131313', N'Swagata                                           ', N'Nath                                              ', CAST(9876555565 AS Numeric(10, 0)), NULL, 1, N'', NULL, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SignupDtls] ([id], [email], [userName], [password], [firstName], [lastName], [contactNumber], [regCode], [role], [linkdinUrl], [yearOfExperience], [active], [confirmedSignUp], [resetPasswordDate], [resetPassword], [pictureUrl], [technology]) VALUES (1013, N'swaggy12@gmail.com', N'swaggydada', N'1212131313', N'Swagata                                           ', N'Nath                                              ', CAST(9876555565 AS Numeric(10, 0)), NULL, 1, N'', NULL, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SignupDtls] ([id], [email], [userName], [password], [firstName], [lastName], [contactNumber], [regCode], [role], [linkdinUrl], [yearOfExperience], [active], [confirmedSignUp], [resetPasswordDate], [resetPassword], [pictureUrl], [technology]) VALUES (1015, N'swaggy132@gmail.com', N'swaggydada', N'1212131313', N'Swagata                                           ', N'Nath                                              ', CAST(9876555565 AS Numeric(10, 0)), NULL, 1, N'', NULL, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SignupDtls] ([id], [email], [userName], [password], [firstName], [lastName], [contactNumber], [regCode], [role], [linkdinUrl], [yearOfExperience], [active], [confirmedSignUp], [resetPasswordDate], [resetPassword], [pictureUrl], [technology]) VALUES (1016, N'swaggy12342@gmail.com', N'swaggydada', N'1212131313', N'Swagata                                           ', N'Nath                                              ', CAST(9876555565 AS Numeric(10, 0)), NULL, 1, N'', NULL, 1, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SignupDtls] OFF
SET IDENTITY_INSERT [dbo].[SkillDetails] ON 

INSERT [dbo].[SkillDetails] ([id], [name], [toc], [prerequisites], [fees]) VALUES (2, N'Mean Stack', N'Angular', N'Html', 1000)
INSERT [dbo].[SkillDetails] ([id], [name], [toc], [prerequisites], [fees]) VALUES (3, N'Dot NET', N'C Sharp', N'OOPs', 1200)
INSERT [dbo].[SkillDetails] ([id], [name], [toc], [prerequisites], [fees]) VALUES (1003, N'Web Application', N'Angular', N'C Sharp', 12000)
SET IDENTITY_INSERT [dbo].[SkillDetails] OFF
SET IDENTITY_INSERT [dbo].[TrainingDtls] ON 

INSERT [dbo].[TrainingDtls] ([id], [status], [progress], [commisionAmount], [rating], [avaRating], [startDate], [endDate], [startTime], [endTime], [amountReceived], [userId], [userName], [mentorId], [mentorName], [skillId], [skillname], [fees], [timeSlot], [requested], [rejectNotify], [paymentStatus]) VALUES (1, N'completed', 100, NULL, NULL, NULL, CAST(N'2019-10-09' AS Date), CAST(N'2019-10-31' AS Date), NULL, NULL, NULL, 1, N'iwsisi                                            ', 2, N'Arvind                                            ', 3, N'Dot NET', 1200, N'09:00 AM - 12:00 PM', 1, 0, 1)
INSERT [dbo].[TrainingDtls] ([id], [status], [progress], [commisionAmount], [rating], [avaRating], [startDate], [endDate], [startTime], [endTime], [amountReceived], [userId], [userName], [mentorId], [mentorName], [skillId], [skillname], [fees], [timeSlot], [requested], [rejectNotify], [paymentStatus]) VALUES (2, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-10-10' AS Date), CAST(N'2019-12-10' AS Date), NULL, NULL, NULL, 1002, N'Souvik                                            ', 2, N'Arvind                                            ', 3, N'Dot NET', 1200, N'12:00 PM - 03:00 PM', 1, 0, 1)
INSERT [dbo].[TrainingDtls] ([id], [status], [progress], [commisionAmount], [rating], [avaRating], [startDate], [endDate], [startTime], [endTime], [amountReceived], [userId], [userName], [mentorId], [mentorName], [skillId], [skillname], [fees], [timeSlot], [requested], [rejectNotify], [paymentStatus]) VALUES (3, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-02-06' AS Date), CAST(N'2019-03-10' AS Date), NULL, NULL, NULL, 1006, N'Ankit                                             ', 1003, N'Ankit                                             ', 2, N'Mean Stack', 1000, N'12:00 PM - 03:00 PM', 1, 0, 1)
INSERT [dbo].[TrainingDtls] ([id], [status], [progress], [commisionAmount], [rating], [avaRating], [startDate], [endDate], [startTime], [endTime], [amountReceived], [userId], [userName], [mentorId], [mentorName], [skillId], [skillname], [fees], [timeSlot], [requested], [rejectNotify], [paymentStatus]) VALUES (4, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-11-11' AS Date), CAST(N'2019-11-30' AS Date), NULL, NULL, NULL, 1006, N'Ankit                                             ', 1004, N'Bikash                                            ', 4, N'Web Application', 1600, N'09:00 AM - 12:00 PM', 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[TrainingDtls] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__SignupDt__AB6E6164FE2D0EBE]    Script Date: 10/11/2019 1:33:16 AM ******/
ALTER TABLE [dbo].[SignupDtls] ADD  CONSTRAINT [UQ__SignupDt__AB6E6164FE2D0EBE] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [projectDB] SET  READ_WRITE 
GO
