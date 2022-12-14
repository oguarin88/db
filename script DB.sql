USE [master]
GO
/****** Object:  Database [ColombianFlights ]    Script Date: 15/11/2022 9:16:35 p. m. ******/
CREATE DATABASE [ColombianFlights ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ColombianFlights', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ColombianFlights .mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ColombianFlights _log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ColombianFlights _log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ColombianFlights ] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ColombianFlights ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ColombianFlights ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ColombianFlights ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ColombianFlights ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ColombianFlights ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ColombianFlights ] SET ARITHABORT OFF 
GO
ALTER DATABASE [ColombianFlights ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ColombianFlights ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ColombianFlights ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ColombianFlights ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ColombianFlights ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ColombianFlights ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ColombianFlights ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ColombianFlights ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ColombianFlights ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ColombianFlights ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ColombianFlights ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ColombianFlights ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ColombianFlights ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ColombianFlights ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ColombianFlights ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ColombianFlights ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ColombianFlights ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ColombianFlights ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ColombianFlights ] SET  MULTI_USER 
GO
ALTER DATABASE [ColombianFlights ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ColombianFlights ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ColombianFlights ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ColombianFlights ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ColombianFlights ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ColombianFlights ] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ColombianFlights ] SET QUERY_STORE = OFF
GO
USE [ColombianFlights ]
GO
/****** Object:  User [profesorAdmin]    Script Date: 15/11/2022 9:16:35 p. m. ******/
CREATE USER [profesorAdmin] FOR LOGIN [profesorAdmin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[TbEmpleado]    Script Date: 15/11/2022 9:16:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbEmpleado](
	[Documento] [int] NOT NULL,
	[Id] [int] NOT NULL,
	[Nombre] [nchar](10) NOT NULL,
	[Cargo] [nchar](10) NOT NULL,
	[Sexo] [nchar](10) NOT NULL,
	[TipoEmpleado] [nchar](10) NOT NULL,
	[IdSede] [int] NOT NULL,
	[Direccion] [nchar](10) NULL,
	[Municipio] [nchar](10) NULL,
	[Departamento] [nchar](10) NULL,
	[Numero] [nchar](10) NULL,
	[Jefe] [nchar](10) NULL,
 CONSTRAINT [PK_TbEmpleado] PRIMARY KEY CLUSTERED 
(
	[Documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbViajes]    Script Date: 15/11/2022 9:16:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbViajes](
	[ID] [int] NOT NULL,
	[Documento] [int] NOT NULL,
	[Fecha] [nchar](10) NOT NULL,
	[Origen] [nchar](10) NOT NULL,
	[Destino] [nchar](10) NOT NULL,
 CONSTRAINT [PK_TbViajes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[viajeempleados]    Script Date: 15/11/2022 9:16:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viajeempleados]
AS
SELECT        dbo.TbEmpleado.Nombre, dbo.TbEmpleado.Cargo, dbo.TbViajes.Fecha, dbo.TbViajes.Origen, dbo.TbViajes.Destino
FROM            dbo.TbEmpleado INNER JOIN
                         dbo.TbViajes ON dbo.TbEmpleado.Documento = dbo.TbViajes.Documento
GO
/****** Object:  Table [dbo].[TbCronograma]    Script Date: 15/11/2022 9:16:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbCronograma](
	[Id] [int] NOT NULL,
	[Placa] [nchar](10) NOT NULL,
	[Origen] [nchar](10) NOT NULL,
	[Destino] [nchar](10) NOT NULL,
	[Piloto] [int] NOT NULL,
	[Copiloto] [int] NOT NULL,
	[IngenieroVuelo] [int] NOT NULL,
	[TripulanteCabina1] [int] NOT NULL,
	[TripulanteCabina2] [int] NOT NULL,
	[TripulanteCabina3] [int] NOT NULL,
 CONSTRAINT [PK_TbCronograma] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbAviones]    Script Date: 15/11/2022 9:16:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbAviones](
	[Placa] [nchar](10) NOT NULL,
	[Nombre] [nchar](10) NOT NULL,
	[Descripcion] [nchar](10) NOT NULL,
	[CantidadPasajeros] [nchar](10) NOT NULL,
 CONSTRAINT [PK_TbAviones] PRIMARY KEY CLUSTERED 
(
	[Placa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[cronogramaaviones]    Script Date: 15/11/2022 9:16:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[cronogramaaviones]
AS
SELECT        dbo.TbAviones.Placa, dbo.TbAviones.Nombre, dbo.TbAviones.CantidadPasajeros, dbo.TbCronograma.Origen, dbo.TbCronograma.Destino, dbo.TbCronograma.Piloto, dbo.TbCronograma.Copiloto, 
                         dbo.TbCronograma.IngenieroVuelo, dbo.TbCronograma.TripulanteCabina1, dbo.TbCronograma.TripulanteCabina2, dbo.TbCronograma.TripulanteCabina3
FROM            dbo.TbAviones INNER JOIN
                         dbo.TbCronograma ON dbo.TbAviones.Placa = dbo.TbCronograma.Placa
GO
/****** Object:  Table [dbo].[tbcuentaviaje]    Script Date: 15/11/2022 9:16:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbcuentaviaje](
	[ID] [int] NOT NULL,
	[documento] [int] NULL,
	[cuenta] [int] NULL,
 CONSTRAINT [PK_tbcuentaviaje] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbFamiliares]    Script Date: 15/11/2022 9:16:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbFamiliares](
	[Documento] [int] NOT NULL,
	[Nombre] [nchar](10) NOT NULL,
	[Parentesco] [nchar](10) NOT NULL,
	[CCEmpleado] [int] NOT NULL,
 CONSTRAINT [PK_TbFamiliares] PRIMARY KEY CLUSTERED 
(
	[Documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbSede]    Script Date: 15/11/2022 9:16:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbSede](
	[Id] [int] NOT NULL,
	[Sede] [nchar](10) NOT NULL,
	[TipoSede] [nchar](10) NOT NULL,
	[Direccion] [nchar](10) NOT NULL,
	[Numero] [nchar](10) NOT NULL,
	[Departamento] [nchar](10) NOT NULL,
	[Municipio] [nchar](10) NOT NULL,
 CONSTRAINT [PK_TbSede] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TbCronograma]  WITH CHECK ADD  CONSTRAINT [FK_TbCronograma_TbAviones] FOREIGN KEY([Placa])
REFERENCES [dbo].[TbAviones] ([Placa])
GO
ALTER TABLE [dbo].[TbCronograma] CHECK CONSTRAINT [FK_TbCronograma_TbAviones]
GO
ALTER TABLE [dbo].[TbCronograma]  WITH CHECK ADD  CONSTRAINT [FK_TbCronograma_TbEmpleado] FOREIGN KEY([Piloto])
REFERENCES [dbo].[TbEmpleado] ([Documento])
GO
ALTER TABLE [dbo].[TbCronograma] CHECK CONSTRAINT [FK_TbCronograma_TbEmpleado]
GO
ALTER TABLE [dbo].[TbCronograma]  WITH CHECK ADD  CONSTRAINT [FK_TbCronograma_TbEmpleado1] FOREIGN KEY([Copiloto])
REFERENCES [dbo].[TbEmpleado] ([Documento])
GO
ALTER TABLE [dbo].[TbCronograma] CHECK CONSTRAINT [FK_TbCronograma_TbEmpleado1]
GO
ALTER TABLE [dbo].[TbCronograma]  WITH CHECK ADD  CONSTRAINT [FK_TbCronograma_TbEmpleado2] FOREIGN KEY([IngenieroVuelo])
REFERENCES [dbo].[TbEmpleado] ([Documento])
GO
ALTER TABLE [dbo].[TbCronograma] CHECK CONSTRAINT [FK_TbCronograma_TbEmpleado2]
GO
ALTER TABLE [dbo].[TbCronograma]  WITH CHECK ADD  CONSTRAINT [FK_TbCronograma_TbEmpleado3] FOREIGN KEY([TripulanteCabina1])
REFERENCES [dbo].[TbEmpleado] ([Documento])
GO
ALTER TABLE [dbo].[TbCronograma] CHECK CONSTRAINT [FK_TbCronograma_TbEmpleado3]
GO
ALTER TABLE [dbo].[TbCronograma]  WITH CHECK ADD  CONSTRAINT [FK_TbCronograma_TbEmpleado4] FOREIGN KEY([TripulanteCabina2])
REFERENCES [dbo].[TbEmpleado] ([Documento])
GO
ALTER TABLE [dbo].[TbCronograma] CHECK CONSTRAINT [FK_TbCronograma_TbEmpleado4]
GO
ALTER TABLE [dbo].[TbCronograma]  WITH CHECK ADD  CONSTRAINT [FK_TbCronograma_TbEmpleado5] FOREIGN KEY([TripulanteCabina3])
REFERENCES [dbo].[TbEmpleado] ([Documento])
GO
ALTER TABLE [dbo].[TbCronograma] CHECK CONSTRAINT [FK_TbCronograma_TbEmpleado5]
GO
ALTER TABLE [dbo].[TbEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_TbEmpleado_TbSede] FOREIGN KEY([IdSede])
REFERENCES [dbo].[TbSede] ([Id])
GO
ALTER TABLE [dbo].[TbEmpleado] CHECK CONSTRAINT [FK_TbEmpleado_TbSede]
GO
ALTER TABLE [dbo].[TbFamiliares]  WITH CHECK ADD  CONSTRAINT [FK_TbFamiliares_TbEmpleado] FOREIGN KEY([CCEmpleado])
REFERENCES [dbo].[TbEmpleado] ([Documento])
GO
ALTER TABLE [dbo].[TbFamiliares] CHECK CONSTRAINT [FK_TbFamiliares_TbEmpleado]
GO
ALTER TABLE [dbo].[TbViajes]  WITH CHECK ADD  CONSTRAINT [FK_TbViajes_TbEmpleado] FOREIGN KEY([Documento])
REFERENCES [dbo].[TbEmpleado] ([Documento])
GO
ALTER TABLE [dbo].[TbViajes] CHECK CONSTRAINT [FK_TbViajes_TbEmpleado]
GO
/****** Object:  StoredProcedure [dbo].[sp1]    Script Date: 15/11/2022 9:16:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp1]
@Cargo varchar(10)
as
begin
select Nombre, Cargo from TbEmpleado where Cargo = @Cargo
end
GO
/****** Object:  StoredProcedure [dbo].[sp2]    Script Date: 15/11/2022 9:16:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp2]
@sede varchar(10)
as
begin
select * from TbSede where Sede=@sede
end
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
         Begin Table = "TbAviones"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TbCronograma"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 136
               Right = 447
            End
            DisplayFlags = 280
            TopColumn = 6
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'cronogramaaviones'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'cronogramaaviones'
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
         Begin Table = "TbEmpleado"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "TbViajes"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 2100
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viajeempleados'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viajeempleados'
GO
USE [master]
GO
ALTER DATABASE [ColombianFlights ] SET  READ_WRITE 
GO
