USE [master]
GO
ALTER DATABASE [Corona] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Corona].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Corona] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Corona] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Corona] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Corona] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Corona] SET ARITHABORT OFF 
GO
ALTER DATABASE [Corona] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Corona] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Corona] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Corona] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Corona] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Corona] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Corona] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Corona] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Corona] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Corona] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Corona] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Corona] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Corona] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Corona] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Corona] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Corona] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Corona] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Corona] SET RECOVERY FULL 
GO
ALTER DATABASE [Corona] SET  MULTI_USER 
GO
ALTER DATABASE [Corona] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Corona] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Corona] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Corona] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Corona] SET DELAYED_DURABILITY = DISABLED 
GO

GO
ALTER DATABASE [Corona] SET QUERY_STORE = OFF
GO
USE [Corona]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 02/07/2021 9:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Age] [int] NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientVaccin]    Script Date: 02/07/2021 9:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientVaccin](
	[PatientID] [int] NOT NULL,
	[VaccinID] [int] NOT NULL,
	[DoseNo] [int] NOT NULL,
	[Sensitive] [bit] NOT NULL,
 CONSTRAINT [PK_PatientVaccin] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC,
	[VaccinID] ASC,
	[DoseNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vaccin]    Script Date: 02/07/2021 9:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vaccin](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Vaccin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Patient] ([ID], [Name], [Age]) VALUES (111, N'Eli', 60)
GO
INSERT [dbo].[Patient] ([ID], [Name], [Age]) VALUES (125, N'Uri', 43)
GO
INSERT [dbo].[Patient] ([ID], [Name], [Age]) VALUES (156, N'Tal', 55)
GO
INSERT [dbo].[Patient] ([ID], [Name], [Age]) VALUES (189, N'Ariel', 21)
GO
INSERT [dbo].[Patient] ([ID], [Name], [Age]) VALUES (202, N'Moshe', 67)
GO
INSERT [dbo].[Patient] ([ID], [Name], [Age]) VALUES (208, N'Zvia', 65)
GO
INSERT [dbo].[Patient] ([ID], [Name], [Age]) VALUES (209, N'Daniel', 35)
GO
INSERT [dbo].[Patient] ([ID], [Name], [Age]) VALUES (210, N'Gal', 46)
GO
INSERT [dbo].[Patient] ([ID], [Name], [Age]) VALUES (230, N'Alona', 18)
GO
INSERT [dbo].[Patient] ([ID], [Name], [Age]) VALUES (301, N'Yonatan', 28)
GO
INSERT [dbo].[Patient] ([ID], [Name], [Age]) VALUES (523, N'Yael', 42)
GO
INSERT [dbo].[Patient] ([ID], [Name], [Age]) VALUES (561, N'Michal', 45)
GO
INSERT [dbo].[Patient] ([ID], [Name], [Age]) VALUES (785, N'Meital', 42)
GO
INSERT [dbo].[Patient] ([ID], [Name], [Age]) VALUES (897, N'Tom', 43)
GO
INSERT [dbo].[PatientVaccin] ([PatientID], [VaccinID], [DoseNo], [Sensitive]) VALUES (111, 1, 1, 1)
GO
INSERT [dbo].[PatientVaccin] ([PatientID], [VaccinID], [DoseNo], [Sensitive]) VALUES (111, 1, 2, 1)
GO
INSERT [dbo].[PatientVaccin] ([PatientID], [VaccinID], [DoseNo], [Sensitive]) VALUES (125, 1, 1, 0)
GO
INSERT [dbo].[PatientVaccin] ([PatientID], [VaccinID], [DoseNo], [Sensitive]) VALUES (125, 1, 2, 0)
GO
INSERT [dbo].[PatientVaccin] ([PatientID], [VaccinID], [DoseNo], [Sensitive]) VALUES (189, 1, 1, 0)
GO
INSERT [dbo].[PatientVaccin] ([PatientID], [VaccinID], [DoseNo], [Sensitive]) VALUES (189, 1, 2, 0)
GO
INSERT [dbo].[PatientVaccin] ([PatientID], [VaccinID], [DoseNo], [Sensitive]) VALUES (202, 2, 1, 0)
GO
INSERT [dbo].[PatientVaccin] ([PatientID], [VaccinID], [DoseNo], [Sensitive]) VALUES (208, 2, 1, 0)
GO
INSERT [dbo].[PatientVaccin] ([PatientID], [VaccinID], [DoseNo], [Sensitive]) VALUES (209, 2, 1, 0)
GO
INSERT [dbo].[PatientVaccin] ([PatientID], [VaccinID], [DoseNo], [Sensitive]) VALUES (210, 2, 1, 0)
GO
INSERT [dbo].[PatientVaccin] ([PatientID], [VaccinID], [DoseNo], [Sensitive]) VALUES (301, 2, 1, 0)
GO
INSERT [dbo].[PatientVaccin] ([PatientID], [VaccinID], [DoseNo], [Sensitive]) VALUES (523, 1, 1, 1)
GO
INSERT [dbo].[PatientVaccin] ([PatientID], [VaccinID], [DoseNo], [Sensitive]) VALUES (523, 1, 2, 1)
GO
INSERT [dbo].[PatientVaccin] ([PatientID], [VaccinID], [DoseNo], [Sensitive]) VALUES (785, 2, 1, 1)
GO
INSERT [dbo].[PatientVaccin] ([PatientID], [VaccinID], [DoseNo], [Sensitive]) VALUES (785, 2, 2, 1)
GO
INSERT [dbo].[Vaccin] ([ID], [Name], [Quantity]) VALUES (1, N'Pfizer', 1000)
GO
INSERT [dbo].[Vaccin] ([ID], [Name], [Quantity]) VALUES (2, N'Moderna', 1500)
GO
ALTER TABLE [dbo].[PatientVaccin]  WITH CHECK ADD  CONSTRAINT [FK_PatientVaccin_Patient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([ID])
GO
ALTER TABLE [dbo].[PatientVaccin] CHECK CONSTRAINT [FK_PatientVaccin_Patient]
GO
ALTER TABLE [dbo].[PatientVaccin]  WITH CHECK ADD  CONSTRAINT [FK_PatientVaccin_Vaccin] FOREIGN KEY([VaccinID])
REFERENCES [dbo].[Vaccin] ([ID])
GO
ALTER TABLE [dbo].[PatientVaccin] CHECK CONSTRAINT [FK_PatientVaccin_Vaccin]
GO
USE [master]
GO
ALTER DATABASE [Corona] SET  READ_WRITE 
GO
