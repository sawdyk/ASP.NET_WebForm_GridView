/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.1742)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [TEST_COMPANY]    Script Date: 1/7/2021 11:31:49 AM ******/
CREATE DATABASE [TEST_COMPANY]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TEST_COMPANY', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\TEST_COMPANY.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TEST_COMPANY_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\TEST_COMPANY_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TEST_COMPANY] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TEST_COMPANY].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TEST_COMPANY] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TEST_COMPANY] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TEST_COMPANY] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TEST_COMPANY] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TEST_COMPANY] SET ARITHABORT OFF 
GO
ALTER DATABASE [TEST_COMPANY] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TEST_COMPANY] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TEST_COMPANY] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TEST_COMPANY] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TEST_COMPANY] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TEST_COMPANY] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TEST_COMPANY] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TEST_COMPANY] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TEST_COMPANY] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TEST_COMPANY] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TEST_COMPANY] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TEST_COMPANY] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TEST_COMPANY] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TEST_COMPANY] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TEST_COMPANY] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TEST_COMPANY] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TEST_COMPANY] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TEST_COMPANY] SET RECOVERY FULL 
GO
ALTER DATABASE [TEST_COMPANY] SET  MULTI_USER 
GO
ALTER DATABASE [TEST_COMPANY] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TEST_COMPANY] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TEST_COMPANY] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TEST_COMPANY] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TEST_COMPANY] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TEST_COMPANY', N'ON'
GO
ALTER DATABASE [TEST_COMPANY] SET QUERY_STORE = OFF
GO
USE [TEST_COMPANY]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [TEST_COMPANY]
GO
/****** Object:  Schema [EMP]    Script Date: 1/7/2021 11:31:50 AM ******/
CREATE SCHEMA [EMP]
GO
/****** Object:  Table [EMP].[EMPLOYEE]    Script Date: 1/7/2021 11:31:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [EMP].[EMPLOYEE](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[First_Name] [varchar](50) NULL,
	[Last_Name] [varchar](50) NULL,
	[Home_Address] [varchar](200) NULL,
	[Email_Address] [varchar](200) NULL,
	[Phone_Number] [varchar](50) NULL,
	[Position] [varchar](200) NULL,
	[Salary] [bigint] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [EMP].[EMPLOYEE] ON 

INSERT [EMP].[EMPLOYEE] ([Id], [First_Name], [Last_Name], [Home_Address], [Email_Address], [Phone_Number], [Position], [Salary]) VALUES (1, N'Sodiq', N'Ahmed', N'24, Iseyin Street Agunlejika, Cele Ijesha', N'Ahmedsodiq7@gmail.com', N'07065903222', N'MD', 1500000)
INSERT [EMP].[EMPLOYEE] ([Id], [First_Name], [Last_Name], [Home_Address], [Email_Address], [Phone_Number], [Position], [Salary]) VALUES (2, N'Tunde', N'Okediran', N'29, Iseyin Street Agunlejika, Cele Ijesha', N'TundeOkediran1212@gmail.com', N'08095713865', N'DEVELOPER 1', 550000)
INSERT [EMP].[EMPLOYEE] ([Id], [First_Name], [Last_Name], [Home_Address], [Email_Address], [Phone_Number], [Position], [Salary]) VALUES (3, N'Francis', N'Waje', N'4, Shofoluwe Street, Magbon Lagos', N'FrancisWaje21@gmail.com', N'09089909988', N'HR', 300000)
INSERT [EMP].[EMPLOYEE] ([Id], [First_Name], [Last_Name], [Home_Address], [Email_Address], [Phone_Number], [Position], [Salary]) VALUES (4, N'Micheal', N'Akinkuotu', N'12, Sanusi Street, Ibiye Lagos', N'AkinMike4me@gmail.com', N'08038193553', N'MANAGER', 800000)
INSERT [EMP].[EMPLOYEE] ([Id], [First_Name], [Last_Name], [Home_Address], [Email_Address], [Phone_Number], [Position], [Salary]) VALUES (5, N'Cynthia', N'Jude', N'2, Onifade Close, Ado-odo ota', N'ContactJudeCynthia@gmail.com', N'09087676544', N'INTERN', 95000)
INSERT [EMP].[EMPLOYEE] ([Id], [First_Name], [Last_Name], [Home_Address], [Email_Address], [Phone_Number], [Position], [Salary]) VALUES (6, N'Olanrewaju', N'Adewale', N'72, Iseyin Street Agunlejika, Cele Ijesha', N'OlaAdewale67@gmail.com', N'09083902212', N'DEVELOPER 2', 450000)
SET IDENTITY_INSERT [EMP].[EMPLOYEE] OFF
USE [master]
GO
ALTER DATABASE [TEST_COMPANY] SET  READ_WRITE 
GO
