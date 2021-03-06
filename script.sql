USE [master]
GO
CREATE DATABASE [eProdaja]
 CONTAINMENT = NONE

ALTER DATABASE [eProdaja] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eProdaja].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eProdaja] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eProdaja] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eProdaja] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eProdaja] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eProdaja] SET ARITHABORT OFF 
GO
ALTER DATABASE [eProdaja] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [eProdaja] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eProdaja] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eProdaja] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eProdaja] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eProdaja] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eProdaja] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eProdaja] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eProdaja] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eProdaja] SET  DISABLE_BROKER 
GO
ALTER DATABASE [eProdaja] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eProdaja] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eProdaja] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eProdaja] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eProdaja] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eProdaja] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eProdaja] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eProdaja] SET RECOVERY FULL 
GO
ALTER DATABASE [eProdaja] SET  MULTI_USER 
GO
ALTER DATABASE [eProdaja] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eProdaja] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eProdaja] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eProdaja] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [eProdaja] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'eProdaja', N'ON'
GO
ALTER DATABASE [eProdaja] SET QUERY_STORE = OFF
GO
USE [eProdaja]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
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
USE [eProdaja]
GO
/****** Object:  User [rs]    Script Date: 3/7/2020 11:48:41 AM ******/
CREATE USER [rs] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [rs]
GO
/****** Object:  Table [dbo].[Dobavljaci]    Script Date: 3/7/2020 11:48:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dobavljaci](
	[DobavljacID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](100) NOT NULL,
	[KontaktOsoba] [nvarchar](100) NULL,
	[Adresa] [nvarchar](100) NOT NULL,
	[Telefon] [nvarchar](25) NOT NULL,
	[Fax] [nvarchar](25) NULL,
	[Web] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[ZiroRacuni] [nvarchar](255) NULL,
	[Napomena] [nvarchar](500) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Dobavljaci] PRIMARY KEY CLUSTERED 
(
	[DobavljacID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Izlazi]    Script Date: 3/7/2020 11:48:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Izlazi](
	[IzlazID] [int] IDENTITY(1,1) NOT NULL,
	[BrojRacuna] [nvarchar](50) NOT NULL,
	[Datum] [datetime] NOT NULL,
	[KorisnikID] [int] NOT NULL,
	[Zakljucen] [bit] NOT NULL,
	[IznosBezPDV] [decimal](18, 2) NOT NULL,
	[IznosSaPDV] [decimal](18, 2) NOT NULL,
	[NarudzbaID] [int] NULL,
	[SkladisteID] [int] NOT NULL,
 CONSTRAINT [PK_Izlazi] PRIMARY KEY CLUSTERED 
(
	[IzlazID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IzlazStavke]    Script Date: 3/7/2020 11:48:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IzlazStavke](
	[IzlazStavkaID] [int] IDENTITY(1,1) NOT NULL,
	[IzlazID] [int] NOT NULL,
	[ProizvodID] [int] NOT NULL,
	[Kolicina] [int] NOT NULL,
	[Cijena] [decimal](18, 2) NOT NULL,
	[Popust] [decimal](5, 2) NULL,
 CONSTRAINT [PK_IzlazStavke] PRIMARY KEY CLUSTERED 
(
	[IzlazStavkaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JediniceMjere]    Script Date: 3/7/2020 11:48:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JediniceMjere](
	[JedinicaMjereID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_JediniceMjere] PRIMARY KEY CLUSTERED 
(
	[JedinicaMjereID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Korisnici]    Script Date: 3/7/2020 11:48:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Korisnici](
	[KorisnikID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](50) NOT NULL,
	[Prezime] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Telefon] [nvarchar](20) NULL,
	[KorisnickoIme] [nvarchar](50) NOT NULL,
	[LozinkaHash] [nvarchar](500) NOT NULL,
	[LozinkaSalt] [nvarchar](500) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Korisnici] PRIMARY KEY CLUSTERED 
(
	[KorisnikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [CS_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [CS_KorisnickoIme] UNIQUE NONCLUSTERED 
(
	[KorisnickoIme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KorisniciUloge]    Script Date: 3/7/2020 11:48:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KorisniciUloge](
	[KorisnikUlogaID] [int] IDENTITY(1,1) NOT NULL,
	[KorisnikID] [int] NOT NULL,
	[UlogaID] [int] NOT NULL,
	[DatumIzmjene] [datetime] NOT NULL,
 CONSTRAINT [PK_KorisniciUloge] PRIMARY KEY CLUSTERED 
(
	[KorisnikUlogaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kupci]    Script Date: 3/7/2020 11:48:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kupci](
	[KupacID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](50) NOT NULL,
	[Prezime] [nvarchar](50) NOT NULL,
	[DatumRegistracije] [datetime] NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[KorisnickoIme] [nvarchar](50) NOT NULL,
	[LozinkaHash] [nvarchar](50) NOT NULL,
	[LozinkaSalt] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Kupci] PRIMARY KEY CLUSTERED 
(
	[KupacID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NarudzbaStavke]    Script Date: 3/7/2020 11:48:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NarudzbaStavke](
	[NarudzbaStavkaID] [int] IDENTITY(1,1) NOT NULL,
	[NarudzbaID] [int] NOT NULL,
	[ProizvodID] [int] NOT NULL,
	[Kolicina] [int] NOT NULL,
 CONSTRAINT [PK_NarudzbaStavke] PRIMARY KEY CLUSTERED 
(
	[NarudzbaStavkaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Narudzbe]    Script Date: 3/7/2020 11:48:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Narudzbe](
	[NarudzbaID] [int] IDENTITY(1,1) NOT NULL,
	[BrojNarudzbe] [nvarchar](20) NOT NULL,
	[KupacID] [int] NOT NULL,
	[Datum] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[Otkazano] [bit] NULL,
 CONSTRAINT [PK_Narudzbe] PRIMARY KEY CLUSTERED 
(
	[NarudzbaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ocjene]    Script Date: 3/7/2020 11:48:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ocjene](
	[OcjenaID] [int] IDENTITY(1,1) NOT NULL,
	[ProizvodID] [int] NOT NULL,
	[KupacID] [int] NOT NULL,
	[Datum] [datetime] NOT NULL,
	[Ocjena] [int] NOT NULL,
 CONSTRAINT [PK_Ocjene] PRIMARY KEY CLUSTERED 
(
	[OcjenaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proizvodi]    Script Date: 3/7/2020 11:48:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proizvodi](
	[ProizvodID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](50) NOT NULL,
	[Sifra] [nvarchar](20) NOT NULL,
	[Cijena] [decimal](18, 2) NOT NULL,
	[VrstaID] [int] NOT NULL,
	[JedinicaMjereID] [int] NOT NULL,
	[Slika] [varbinary](max) NULL,
	[SlikaThumb] [varbinary](max) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Proizvodi] PRIMARY KEY CLUSTERED 
(
	[ProizvodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skladista]    Script Date: 3/7/2020 11:48:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skladista](
	[SkladisteID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](50) NOT NULL,
	[Adresa] [nvarchar](150) NULL,
	[Opis] [nvarchar](500) NULL,
 CONSTRAINT [PK_Skladista] PRIMARY KEY CLUSTERED 
(
	[SkladisteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ulazi]    Script Date: 3/7/2020 11:48:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ulazi](
	[UlazID] [int] IDENTITY(1,1) NOT NULL,
	[BrojFakture] [nvarchar](20) NOT NULL,
	[Datum] [datetime] NOT NULL,
	[IznosRacuna] [decimal](18, 2) NOT NULL,
	[PDV] [numeric](18, 2) NOT NULL,
	[Napomena] [nvarchar](500) NULL,
	[SkladisteID] [int] NOT NULL,
	[KorisnikID] [int] NOT NULL,
	[DobavljacID] [int] NOT NULL,
 CONSTRAINT [PK_Ulazi] PRIMARY KEY CLUSTERED 
(
	[UlazID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UlazStavke]    Script Date: 3/7/2020 11:48:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UlazStavke](
	[UlazStavkaID] [int] IDENTITY(1,1) NOT NULL,
	[UlazID] [int] NOT NULL,
	[ProizvodID] [int] NOT NULL,
	[Kolicina] [int] NOT NULL,
	[Cijena] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_UlazStavke] PRIMARY KEY CLUSTERED 
(
	[UlazStavkaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uloge]    Script Date: 3/7/2020 11:48:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uloge](
	[UlogaID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](50) NOT NULL,
	[Opis] [nvarchar](200) NULL,
 CONSTRAINT [PK_Uloge] PRIMARY KEY CLUSTERED 
(
	[UlogaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VrsteProizvoda]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VrsteProizvoda](
	[VrstaID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_VrsteProizvoda] PRIMARY KEY CLUSTERED 
(
	[VrstaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Korisnici] ADD  CONSTRAINT [DF_Korisnici_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Proizvodi] ADD  CONSTRAINT [DF_Artikli_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Izlazi]  WITH CHECK ADD  CONSTRAINT [FK_Izlazi_Korisnici] FOREIGN KEY([KorisnikID])
REFERENCES [dbo].[Korisnici] ([KorisnikID])
GO
ALTER TABLE [dbo].[Izlazi] CHECK CONSTRAINT [FK_Izlazi_Korisnici]
GO
ALTER TABLE [dbo].[Izlazi]  WITH CHECK ADD  CONSTRAINT [FK_Izlazi_Narudzbe] FOREIGN KEY([NarudzbaID])
REFERENCES [dbo].[Narudzbe] ([NarudzbaID])
GO
ALTER TABLE [dbo].[Izlazi] CHECK CONSTRAINT [FK_Izlazi_Narudzbe]
GO
ALTER TABLE [dbo].[Izlazi]  WITH CHECK ADD  CONSTRAINT [FK_Izlazi_Skladista] FOREIGN KEY([SkladisteID])
REFERENCES [dbo].[Skladista] ([SkladisteID])
GO
ALTER TABLE [dbo].[Izlazi] CHECK CONSTRAINT [FK_Izlazi_Skladista]
GO
ALTER TABLE [dbo].[IzlazStavke]  WITH CHECK ADD  CONSTRAINT [FK_IzlazStavke_Izlazi] FOREIGN KEY([IzlazID])
REFERENCES [dbo].[Izlazi] ([IzlazID])
GO
ALTER TABLE [dbo].[IzlazStavke] CHECK CONSTRAINT [FK_IzlazStavke_Izlazi]
GO
ALTER TABLE [dbo].[IzlazStavke]  WITH CHECK ADD  CONSTRAINT [FK_IzlazStavke_Proizvodi] FOREIGN KEY([ProizvodID])
REFERENCES [dbo].[Proizvodi] ([ProizvodID])
GO
ALTER TABLE [dbo].[IzlazStavke] CHECK CONSTRAINT [FK_IzlazStavke_Proizvodi]
GO
ALTER TABLE [dbo].[KorisniciUloge]  WITH CHECK ADD  CONSTRAINT [FK_KorisniciUloge_Korisnici] FOREIGN KEY([KorisnikID])
REFERENCES [dbo].[Korisnici] ([KorisnikID])
GO
ALTER TABLE [dbo].[KorisniciUloge] CHECK CONSTRAINT [FK_KorisniciUloge_Korisnici]
GO
ALTER TABLE [dbo].[KorisniciUloge]  WITH CHECK ADD  CONSTRAINT [FK_KorisniciUloge_Uloge] FOREIGN KEY([UlogaID])
REFERENCES [dbo].[Uloge] ([UlogaID])
GO
ALTER TABLE [dbo].[KorisniciUloge] CHECK CONSTRAINT [FK_KorisniciUloge_Uloge]
GO
ALTER TABLE [dbo].[NarudzbaStavke]  WITH CHECK ADD  CONSTRAINT [FK_NarudzbaStavke_Narudzbe] FOREIGN KEY([NarudzbaID])
REFERENCES [dbo].[Narudzbe] ([NarudzbaID])
GO
ALTER TABLE [dbo].[NarudzbaStavke] CHECK CONSTRAINT [FK_NarudzbaStavke_Narudzbe]
GO
ALTER TABLE [dbo].[NarudzbaStavke]  WITH CHECK ADD  CONSTRAINT [FK_NarudzbaStavke_Proizvodi] FOREIGN KEY([ProizvodID])
REFERENCES [dbo].[Proizvodi] ([ProizvodID])
GO
ALTER TABLE [dbo].[NarudzbaStavke] CHECK CONSTRAINT [FK_NarudzbaStavke_Proizvodi]
GO
ALTER TABLE [dbo].[Narudzbe]  WITH CHECK ADD  CONSTRAINT [FK_Narudzbe_Kupci] FOREIGN KEY([KupacID])
REFERENCES [dbo].[Kupci] ([KupacID])
GO
ALTER TABLE [dbo].[Narudzbe] CHECK CONSTRAINT [FK_Narudzbe_Kupci]
GO
ALTER TABLE [dbo].[Ocjene]  WITH CHECK ADD  CONSTRAINT [FK_Ocjene_Kupci] FOREIGN KEY([KupacID])
REFERENCES [dbo].[Kupci] ([KupacID])
GO
ALTER TABLE [dbo].[Ocjene] CHECK CONSTRAINT [FK_Ocjene_Kupci]
GO
ALTER TABLE [dbo].[Ocjene]  WITH CHECK ADD  CONSTRAINT [FK_Ocjene_Proizvodi] FOREIGN KEY([ProizvodID])
REFERENCES [dbo].[Proizvodi] ([ProizvodID])
GO
ALTER TABLE [dbo].[Ocjene] CHECK CONSTRAINT [FK_Ocjene_Proizvodi]
GO
ALTER TABLE [dbo].[Proizvodi]  WITH CHECK ADD  CONSTRAINT [FK_Proizvodi_JediniceMjere] FOREIGN KEY([JedinicaMjereID])
REFERENCES [dbo].[JediniceMjere] ([JedinicaMjereID])
GO
ALTER TABLE [dbo].[Proizvodi] CHECK CONSTRAINT [FK_Proizvodi_JediniceMjere]
GO
ALTER TABLE [dbo].[Proizvodi]  WITH CHECK ADD  CONSTRAINT [FK_Proizvodi_VrsteProizvoda] FOREIGN KEY([VrstaID])
REFERENCES [dbo].[VrsteProizvoda] ([VrstaID])
GO
ALTER TABLE [dbo].[Proizvodi] CHECK CONSTRAINT [FK_Proizvodi_VrsteProizvoda]
GO
ALTER TABLE [dbo].[Ulazi]  WITH CHECK ADD  CONSTRAINT [FK_Ulazi_Dobavljaci] FOREIGN KEY([DobavljacID])
REFERENCES [dbo].[Dobavljaci] ([DobavljacID])
GO
ALTER TABLE [dbo].[Ulazi] CHECK CONSTRAINT [FK_Ulazi_Dobavljaci]
GO
ALTER TABLE [dbo].[Ulazi]  WITH CHECK ADD  CONSTRAINT [FK_Ulazi_Korisnici] FOREIGN KEY([KorisnikID])
REFERENCES [dbo].[Korisnici] ([KorisnikID])
GO
ALTER TABLE [dbo].[Ulazi] CHECK CONSTRAINT [FK_Ulazi_Korisnici]
GO
ALTER TABLE [dbo].[Ulazi]  WITH CHECK ADD  CONSTRAINT [FK_Ulazi_Skladista] FOREIGN KEY([SkladisteID])
REFERENCES [dbo].[Skladista] ([SkladisteID])
GO
ALTER TABLE [dbo].[Ulazi] CHECK CONSTRAINT [FK_Ulazi_Skladista]
GO
ALTER TABLE [dbo].[UlazStavke]  WITH CHECK ADD  CONSTRAINT [FK_UlazStavke_Proizvodi] FOREIGN KEY([ProizvodID])
REFERENCES [dbo].[Proizvodi] ([ProizvodID])
GO
ALTER TABLE [dbo].[UlazStavke] CHECK CONSTRAINT [FK_UlazStavke_Proizvodi]
GO
ALTER TABLE [dbo].[UlazStavke]  WITH CHECK ADD  CONSTRAINT [FK_UlazStavke_Ulazi] FOREIGN KEY([UlazID])
REFERENCES [dbo].[Ulazi] ([UlazID])
GO
ALTER TABLE [dbo].[UlazStavke] CHECK CONSTRAINT [FK_UlazStavke_Ulazi]
GO
/****** Object:  StoredProcedure [dbo].[esp_Dobavljaci_SelectByNaziv]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_Dobavljaci_SelectByNaziv]
(
	@Naziv NVARCHAR(100)
)
AS
    SELECT *
    FROM Dobavljaci
    WHERE (LOWER(Naziv) LIKE LOWER(@Naziv) + '%' OR @Naziv = '') AND Status = 1
    ORDER BY Naziv
-----------------------
GO
/****** Object:  StoredProcedure [dbo].[esp_GetSkladistaByProizvodId_IB150191]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_GetSkladistaByProizvodId_IB150191]
(
	@proizvodID INT
)
AS
BEGIN
SELECT S.Naziv,
 (SELECT ISNULL(SUM(US.Kolicina),0) FROM Ulazi AS U JOIN UlazStavke AS US ON US.UlazID= U.UlazID WHERE U.SkladisteID=S.SkladisteID AND US.ProizvodID=@proizvodID)
-(SELECT ISNULL(SUM(IZS.Kolicina),0) FROM Izlazi I JOIN IzlazStavke AS IZS ON IZS.IzlazID = I.IzlazID WHERE I.SkladisteID=S.SkladisteID AND IZS.ProizvodID=@proizvodID) AS 'StanjeSkladista'
FROM Skladista AS S
END;
GO
/****** Object:  StoredProcedure [dbo].[esp_GetSkladistaByProizvodIdIB150146]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_GetSkladistaByProizvodIdIB150146]
	@proizvodID int
AS

	SELECT T3.SkladisteID, T3.Naziv, T1.ProizvodID, SUM(T1.Kolicina) AS 'Kolicina' INTO #izlazi
	FROM IzlazStavke AS T1
	JOIN Izlazi AS T2 ON T1.IzlazID=T2.IzlazID
		JOIN Skladista AS T3 ON T2.SkladisteID=T3.SkladisteID
	GROUP BY ProizvodID,T3.SkladisteID, T3.Naziv
	
	SELECT 
	T3.SkladisteID, T3.Naziv, ProizvodID,
	SUM(Kolicina) - ISNULL((SELECT Kolicina FROM #izlazi AS I1 WHERE I1.ProizvodID=T1.ProizvodID AND I1.SkladisteID=T3.SkladisteID),0)  AS 'Kolicina'
	FROM UlazStavke AS T1
	 	JOIN Ulazi AS T2 ON T1.UlazID=T2.UlazID
		JOIN Skladista AS T3 ON T2.SkladisteID=T3.SkladisteID
	WHERE ProizvodID=@proizvodID
	GROUP BY ProizvodID,T3.SkladisteID, T3.Naziv
GO
/****** Object:  StoredProcedure [dbo].[esp_Izlazi_InsertByNarudzbaID]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_Izlazi_InsertByNarudzbaID]
(
	@NarudzbaID INT,
	@IznosSaPDV DECIMAL(18,2),
	@IznosBezPDV DECIMAL (18,2),
	@SkladisteID INT,
	@KorisnikID INT
)
AS
	
	DECLARE @BrojRacuna INT = (SELECT TOP 1 LEFT(BrojRacuna, CHARINDEX('/', BrojRacuna, 0) - 1)
										FROM Izlazi 
										WHERE YEAR(Datum) = YEAR(GETDATE())
										ORDER BY IzlazID DESC);

	IF @BrojRacuna IS NULL
		SET @BrojRacuna = 0;

	INSERT INTO Izlazi(BrojRacuna, Datum, KorisnikID, Zakljucen, IznosSaPDV, IznosBezPDV, NarudzbaID, SkladisteID)
	VALUES (CONVERT(NVARCHAR, @BrojRacuna + 1) + '/' + RIGHT(CONVERT(NVARCHAR, YEAR(GETDATE())), 2), 
	        GETDATE(), @KorisnikID, 1, @IznosSaPDV, @IznosBezPDV, @NarudzbaID, @SkladisteID)


	INSERT INTO IzlazStavke
	SELECT @@IDENTITY, T1.ProizvodID, T1.Kolicina, T2.Cijena, 0
	FROM NarudzbaStavke AS T1 INNER JOIN Proizvodi AS T2
	     ON T1.ProizvodID = T2.ProizvodID
	WHERE NarudzbaID = @NarudzbaID

	UPDATE Narudzbe
	SET Status = 0
	WHERE NarudzbaID = @NarudzbaID
-----------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[esp_JediniceMjere_SelectAll]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_JediniceMjere_SelectAll]
AS
    SELECT *
    FROM JediniceMjere
    ORDER BY Naziv
GO
/****** Object:  StoredProcedure [dbo].[esp_Korisnici_Insert]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_Korisnici_Insert]
(
	@Ime NVARCHAR(50),
	@Prezime NVARCHAR(50),
	@Email NVARCHAR(100),
	@Telefon NVARCHAR(20),
	@KorisnickoIme NVARCHAR(50),
	@LozinkaSalt NVARCHAR(50),
	@LozinkaHash NVARCHAR(50)
)
AS

	INSERT INTO Korisnici (Ime, Prezime, Email, Telefon, KorisnickoIme, LozinkaSalt, LozinkaHash, Status)
	VALUES (@Ime, @Prezime, @Email, @Telefon, @KorisnickoIme, @LozinkaSalt, @LozinkaHash, 1)

	SELECT @@IDENTITY
    
---------------------------------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[esp_Korisnici_SelectByImePrezime]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_Korisnici_SelectByImePrezime]
(
	@ImePrezime NVARCHAR(100)
)
AS
    SELECT KorisnikID, Ime, Prezime, Email, Telefon, KorisnickoIme, Status
    FROM Korisnici
    WHERE LOWER(Ime + ' ' + Prezime) like LOWER(@ImePrezime) + '%' OR
	        LOWER(Prezime + ' ' + Ime)  like LOWER(@ImePrezime) + '%'
GO
/****** Object:  StoredProcedure [dbo].[esp_Korisnici_SelectByKorisnickoIme]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_Korisnici_SelectByKorisnickoIme]
(
	@KorisnickoIme NVARCHAR(50)
)
AS
    SELECT *
    FROM Korisnici
    WHERE KorisnickoIme = @KorisnickoIme AND Status=1
GO
/****** Object:  StoredProcedure [dbo].[esp_Korisnici_Update]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_Korisnici_Update]
(
    @KorisnikID INT,
	@Ime NVARCHAR(50),
	@Prezime NVARCHAR(50),
	@Email NVARCHAR(100),
	@Telefon NVARCHAR(20),
	@KorisnickoIme NVARCHAR(50),
	@LozinkaSalt NVARCHAR(50) = null,
	@LozinkaHash NVARCHAR(50) = null,
	@Status BIT
)
AS
	
	IF @LozinkaHash IS NULL
	BEGIN
		UPDATE Korisnici
		SET
			Ime = @Ime, 
			Prezime = @Prezime,
			Email = @Email,
			Telefon = @Telefon,
			KorisnickoIme = @KorisnickoIme,
			Status = @Status
		WHERE KorisnikID = @KorisnikID
	END
	ELSE
	BEGIN
		UPDATE Korisnici
		SET
			Ime = @Ime, 
			Prezime = @Prezime,
			Email = @Email,
			Telefon = @Telefon,
			KorisnickoIme = @KorisnickoIme,
			Status = @Status,
			LozinkaSalt = @LozinkaSalt,
			LozinkaHash = @LozinkaHash
		WHERE KorisnikID = @KorisnikID
	END
	
---------------------------------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[esp_KorisniciUloge_Insert]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_KorisniciUloge_Insert]
(
	@KorisnikID INT,
	@UlogaID INT
)
AS
	INSERT INTO KorisniciUloge (KorisnikID, UlogaID, DatumIzmjene)
	VALUES (@KorisnikID, @UlogaID, GETDATE())
GO
/****** Object:  StoredProcedure [dbo].[esp_Kupci_Insert]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_Kupci_Insert]
(
	@Ime NVARCHAR(50),
	@Prezime NVARCHAR(50),
	@Email NVARCHAR(100),
	@KorisnickoIme NVARCHAR(50),
	@LozinkaSalt NVARCHAR(50),
	@LozinkaHash NVARCHAR(50)
)
AS

	INSERT INTO Kupci (Ime, Prezime, DatumRegistracije, Email, KorisnickoIme, LozinkaSalt, LozinkaHash, Status)
	VALUES (@Ime, @Prezime, GETDATE(), @Email, @KorisnickoIme, @LozinkaSalt, @LozinkaHash, 1)

	SELECT @@IDENTITY
    
---------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[esp_Kupci_SelectByKorisnickoIme]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_Kupci_SelectByKorisnickoIme]
(
	@KorisnickoIme NVARCHAR(50)
)
AS
    SELECT *
    FROM Kupci
    WHERE KorisnickoIme = @KorisnickoIme AND Status=1
GO
/****** Object:  StoredProcedure [dbo].[esp_NarudzbaStavke_Insert]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_NarudzbaStavke_Insert]
(
	@NarudzbaID INT,
	@ProizvodID INT,
	@Kolicina INT
)
AS
	INSERT INTO NarudzbaStavke(NarudzbaID, ProizvodID, Kolicina)
	VALUES (@NarudzbaID, @ProizvodID, @Kolicina)
GO
/****** Object:  StoredProcedure [dbo].[esp_Narudzbe_CountAktivne]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_Narudzbe_CountAktivne]
AS
    SELECT COUNT(NarudzbaID)
    FROM Narudzbe
	WHERE Status = 1
GO
/****** Object:  StoredProcedure [dbo].[esp_Narudzbe_Insert]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_Narudzbe_Insert]
(
	@BrojNarudzbe NVARCHAR(20),
	@KupacID INT,
	@Datum DATETIME
)
AS
	INSERT INTO Narudzbe(BrojNarudzbe, KupacID, Datum, Status, Otkazano)
	VALUES (@BrojNarudzbe, @KupacID, @Datum, 1, 0)

	SELECT @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[esp_Narudzbe_SelectAktivne]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_Narudzbe_SelectAktivne]
AS
	SELECT T1.NarudzbaID, T1.BrojNarudzbe, T1.KupacID, T1.Datum, T2.Ime + ' ' + T2.Prezime AS Kupac, 
	       SUM(T3.Kolicina * T4.Cijena) AS Iznos
	FROM Narudzbe AS T1 INNER JOIN Kupci AS T2
		 ON T1.KupacID = T2.KupacID INNER JOIN NarudzbaStavke AS T3
		 ON T1.NarudzbaID = T3.NarudzbaID INNER JOIN Proizvodi AS T4
		 ON T3.ProizvodID = T4.ProizvodID
	WHERE T1.Status = 1
	GROUP BY T1.NarudzbaID, T1.BrojNarudzbe, T1.KupacID, T1.Datum, T2.Ime, T2.Prezime
	ORDER BY Datum ASC
----------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[esp_NarudzbeStavke_SelectByNarudzbaID]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_NarudzbeStavke_SelectByNarudzbaID]
(
	@NarudzbaID INT
)
AS
	SELECT T1.NarudzbaStavkaID, T1.ProizvodID, T2.Naziv, T2.Sifra, 
	       T2.Cijena, T1.Kolicina, T1.Kolicina * T2.Cijena AS Iznos
	FROM NarudzbaStavke AS T1 INNER JOIN Proizvodi AS T2
	     ON T1.ProizvodID = T2.ProizvodID
	WHERE NarudzbaID = @NarudzbaID
GO
/****** Object:  StoredProcedure [dbo].[esp_Proizvodi_Insert]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_Proizvodi_Insert]
(
	@Naziv NVARCHAR (50),
	@Sifra NVARCHAR (50),
	@Cijena DECIMAL (10,2),
	@VrstaID INT,
	@JedinicaMjereID INT,
	@Slika VARBINARY (MAX) = NULL,
	@SlikaThumb VARBINARY (MAX) = NULL
)
AS
    INSERT INTO Proizvodi (Naziv, Sifra, Cijena, VrstaID, JedinicaMjereID, Slika, SlikaThumb)
	VALUES (@Naziv, @Sifra, @Cijena, @VrstaID, @JedinicaMjereID, @Slika, @SlikaThumb)

	SELECT @@IDENTITY

---------------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[esp_Proizvodi_SelectById]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_Proizvodi_SelectById]
(
	@ProizvodID INT
)
AS
    SELECT T1.*, T2.Naziv AS VrstaProizvoda, AVG(1.0 * T3.Ocjena) AS ProsjecnaOcjena
    FROM Proizvodi AS T1 INNER JOIN VrsteProizvoda AS T2
		 ON T1.VrstaID = T2.VrstaID LEFT JOIN Ocjene AS T3
		 ON T1.ProizvodID = T3.ProizvodID
    WHERE T1.ProizvodID = @ProizvodID
	GROUP BY T1.ProizvodID, T1.Naziv, T1.Sifra, T1.Cijena, T1.VrstaID, T1.JedinicaMjereID,
	         T1.Slika, T1.SlikaThumb, T1.Status, T2.Naziv 
GO
/****** Object:  StoredProcedure [dbo].[esp_Proizvodi_SelectBySifra]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_Proizvodi_SelectBySifra]
(
	@Sifra NVARCHAR(20)
)
AS
	SELECT ProizvodID, T1.Naziv, Sifra, Cijena, T2.Naziv AS JedMjere, SlikaThumb, Status
	FROM Proizvodi AS T1 INNER JOIN JediniceMjere AS T2
	     ON T1.JedinicaMjereID = T2.JedinicaMjereID
	WHERE Sifra = @Sifra AND  Status = 1
	ORDER BY Sifra
GO
/****** Object:  StoredProcedure [dbo].[esp_Proizvodi_SelectByVrsta]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_Proizvodi_SelectByVrsta]
(
	@VrstaID INT
)
AS

	IF @VrstaID = 0
	BEGIN
		SELECT TOP 5 ProizvodID, T1.Naziv, Sifra, Cijena, 
			   T2.Naziv AS JedMjere, SlikaThumb, Status
		FROM  Proizvodi AS T1 INNER JOIN JediniceMjere AS T2
	          ON T1.JedinicaMjereID = T2.JedinicaMjereID
		ORDER BY ProizvodID DESC
	END

	ELSE
	BEGIN
		SELECT ProizvodID, T1.Naziv, Sifra, Cijena, 
	           T2.Naziv AS JedMjere, SlikaThumb, Status
		FROM Proizvodi AS T1 INNER JOIN JediniceMjere AS T2
	         ON T1.JedinicaMjereID = T2.JedinicaMjereID
	    WHERE VrstaID = @VrstaID
		ORDER BY ProizvodID DESC
	END
--------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[esp_Skladista_GetByProizvodID_IB150030]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[esp_Skladista_GetByProizvodID_IB150030]
	@ProizvodID INT
AS BEGIN
	SELECT T1.SkladisteID, T1.Naziv AS [Skladiste], (
			   SUM(T3.Kolicina) - 
			   ISNULL(
					(SELECT SUM(I2.Kolicina)
					 FROM Izlazi AS I1
	    				JOIN IzlazStavke AS I2 ON I2.IzlazID = I1.IzlazID AND I2.ProizvodID = T4.ProizvodID
					 WHERE I1.SkladisteID = T1.SkladisteID)
				,0)
		   ) AS Kolicina
	FROM Skladista AS T1
		 JOIN Ulazi				AS T2 ON T2.SkladisteID = T1.SkladisteID
		 JOIN UlazStavke		AS T3 ON T3.UlazID = T2.UlazID
		 JOIN Proizvodi			AS T4 ON T4.ProizvodID = T3.ProizvodID
	WHERE T4.ProizvodID = @ProizvodID
	GROUP BY T1.Naziv, T1.SkladisteID, T4.ProizvodID
END
GO
/****** Object:  StoredProcedure [dbo].[esp_Skladista_GetByProizvodId_IB150068]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_Skladista_GetByProizvodId_IB150068]
	@ProizvodID INT
AS
	SELECT S.Naziv,
	(SUM(US.Kolicina) - ISNULL((SELECT SUM(ISt.Kolicina)
							FROM Skladista AS SK
							INNER JOIN Izlazi AS I ON SK.SkladisteID=I.SkladisteID
							INNER JOIN IzlazStavke AS ISt ON I.IzlazID=ISt.IzlazID
							INNER JOIN Proizvodi AS Pr ON ISt.ProizvodID=Pr.ProizvodID
							WHERE Pr.ProizvodID=@ProizvodID AND SK.SkladisteID=S.SkladisteID
							GROUP BY SK.SkladisteID),0)) as Column1
	FROM Skladista AS S
	INNER JOIN Ulazi AS U ON S.SkladisteID=U.SkladisteID
	INNER JOIN UlazStavke AS US ON U.UlazID=US.UlazID
	INNER JOIN Proizvodi AS P ON US.ProizvodID=P.ProizvodID
	WHERE P.ProizvodID=@ProizvodID
	GROUP BY S.Naziv,S.SkladisteID
GO
/****** Object:  StoredProcedure [dbo].[esp_Skladista_SelectAll]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_Skladista_SelectAll]
AS
    SELECT *
    FROM Skladista
    ORDER BY Naziv
GO
/****** Object:  StoredProcedure [dbo].[esp_Ulazi_Insert]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_Ulazi_Insert]
(
	@BrojFakture NVARCHAR(20),
	@Datum DATETIME,
	@IznosRacuna DECIMAL (18,2),
	@PDV DECIMAL (18,2),
	@Napomena NVARCHAR(500),
	@SkladisteID INT,
	@KorisnikID INT,
	@DobavljacID INT
)
AS

	INSERT INTO Ulazi
	(
		BrojFakture,
		Datum,
		IznosRacuna,
		PDV,
		Napomena,
		SkladisteID,
		KorisnikID,
		DobavljacID
	) 
	VALUES 
	(
		@BrojFakture,
		@Datum,
		@IznosRacuna,
		@PDV,
		@Napomena,
		@SkladisteID,
		@KorisnikID,
		@DobavljacID
	)

	SELECT @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[esp_UlazStavke_Insert]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_UlazStavke_Insert]
(
	@UlazID INT,
	@ProizvodID INT,
	@Kolicina INT,
	@Cijena DECIMAL (18,2)
)
AS

	INSERT INTO UlazStavke (UlazID, ProizvodID, Kolicina, Cijena)
	VALUES (@UlazID, @ProizvodID, @Kolicina, @Cijena)
	SELECT @@IDENTITY

GO
/****** Object:  StoredProcedure [dbo].[esp_Uloge_SelectAll]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_Uloge_SelectAll]
AS
    SELECT *
    FROM Uloge
    ORDER BY Naziv
GO
/****** Object:  StoredProcedure [dbo].[esp_VrsteProizvoda_SelectAll]    Script Date: 3/7/2020 11:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_VrsteProizvoda_SelectAll]
AS
    SELECT *
    FROM VrsteProizvoda
    ORDER BY Naziv
GO
USE [master]
GO
ALTER DATABASE [eProdaja] SET  READ_WRITE 
GO
