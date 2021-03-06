USE [master]
GO
/****** Object:  Database [SIG_DBxx]    Script Date: 04/04/2018 9:03:37 p. m. ******/
CREATE DATABASE [SIG_DBxx]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SIG_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLSERVER2016\MSSQL\DATA\SIG_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SIG_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLSERVER2016\MSSQL\DATA\SIG_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SIG_DBxx] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SIG_DBxx].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SIG_DBxx] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SIG_DBxx] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SIG_DBxx] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SIG_DBxx] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SIG_DBxx] SET ARITHABORT OFF 
GO
ALTER DATABASE [SIG_DBxx] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SIG_DBxx] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SIG_DBxx] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SIG_DBxx] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SIG_DBxx] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SIG_DBxx] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SIG_DBxx] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SIG_DBxx] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SIG_DBxx] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SIG_DBxx] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SIG_DBxx] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SIG_DBxx] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SIG_DBxx] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SIG_DBxx] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SIG_DBxx] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SIG_DBxx] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SIG_DBxx] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SIG_DBxx] SET RECOVERY FULL 
GO
ALTER DATABASE [SIG_DBxx] SET  MULTI_USER 
GO
ALTER DATABASE [SIG_DBxx] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SIG_DBxx] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SIG_DBxx] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SIG_DBxx] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SIG_DBxx] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SIG_DBxx', N'ON'
GO
ALTER DATABASE [SIG_DBxx] SET QUERY_STORE = OFF
GO
USE [SIG_DBxx]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SIG_DBxx]
GO
/****** Object:  Table [dbo].[cargos]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cargos](
	[nombre] [varchar](50) NULL,
	[valor] [float] NULL,
	[autor] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[clientes]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[userID] [int] NOT NULL,
	[gastado] [decimal](18, 0) NULL,
	[adeudado] [decimal](18, 0) NULL,
	[ganado] [decimal](18, 0) NULL,
	[estatus] [int] NULL,
	[autor] [varchar](50) NULL,
	[credito] [decimal](18, 0) NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[consulta]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[consulta](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[pacienteID] [int] NOT NULL,
	[doctorID] [int] NOT NULL,
	[fecha] [datetime] NULL,
	[fechaProxima] [datetime] NULL,
	[fechaFinalizacion] [datetime] NULL,
	[razon] [nvarchar](max) NULL,
	[sintomas] [nvarchar](max) NULL,
	[indicaciones] [nvarchar](max) NULL,
	[diagnostico] [nvarchar](max) NULL,
	[recomendaciones] [nvarchar](max) NULL,
	[observaciones] [nvarchar](max) NULL,
	[referido] [varchar](60) NULL,
	[estatus] [int] NULL,
	[autor] [varchar](50) NULL,
	[historiaMID] [int] NULL,
	[fecultima] [date] NULL,
	[procedimientoID] [int] NULL,
 CONSTRAINT [PK_consultas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[doctor]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doctor](
	[userID] [int] NOT NULL,
	[especialidadID] [int] NOT NULL,
	[ultimaVisita] [datetime] NULL,
 CONSTRAINT [PK_doctor] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[especialidad]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[especialidad](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NULL,
	[notas] [nvarchar](max) NULL,
 CONSTRAINT [PK_especialidad] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[estatusM]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estatusM](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[tabla] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](250) NULL,
 CONSTRAINT [PK_estatusM] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[estudios]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estudios](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NULL,
	[notas] [nvarchar](max) NULL,
 CONSTRAINT [PK_estudios] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[farmacos]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[farmacos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[presentacionID] [int] NULL,
	[laboratorioID] [int] NULL,
	[nombreComercial] [nvarchar](50) NULL,
	[nombrePopular] [nvarchar](50) NULL,
	[principioActivo] [nvarchar](max) NULL,
	[indicaciones] [nvarchar](max) NULL,
	[dosis] [nvarchar](max) NULL,
	[notas] [nvarchar](max) NULL,
	[precio] [decimal](18, 2) NULL,
	[stock] [int] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_farmacos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[grupoSanguineo]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grupoSanguineo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[notas] [text] NULL,
 CONSTRAINT [PK_grupoSanguineo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hAnestesica]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hAnestesica](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConsultaID] [int] NULL,
	[hAnestesicaMID] [int] NULL,
	[valor] [varchar](250) NULL,
	[controlid] [varchar](250) NULL,
 CONSTRAINT [PK_hAnestesica] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hAnestesicaM]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hAnestesicaM](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[ValRef] [varchar](10) NULL,
	[autor] [varchar](25) NULL,
 CONSTRAINT [PK_hAnestesicaM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hGinecologica]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hGinecologica](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pacienteID] [int] NULL,
	[consultaID] [int] NULL,
	[fecha] [date] NULL,
	[observaciones] [varchar](max) NULL,
	[menarquia] [varchar](50) NULL,
	[pubarquia] [varchar](50) NULL,
	[telarquia] [varchar](50) NULL,
	[fum] [date] NULL,
	[patronmens] [varchar](50) NULL,
	[dismenorrea] [varchar](50) NULL,
	[primerarelacion] [varchar](50) NULL,
	[relsemana] [varchar](50) NULL,
	[nocompaneros] [varchar](50) NULL,
	[tiempocasada] [varchar](50) NULL,
	[usoactual] [varchar](50) NULL,
	[usopasado] [varchar](50) NULL,
	[oral] [varchar](50) NULL,
	[div] [varchar](50) NULL,
	[debarrera] [varchar](50) NULL,
	[norplat] [varchar](50) NULL,
	[gestas] [varchar](50) NULL,
	[partos] [varchar](50) NULL,
	[cesareas] [varchar](50) NULL,
	[abortos] [varchar](50) NULL,
	[hijosvivos] [varchar](50) NULL,
	[hijosprematuros] [varchar](50) NULL,
	[natimuertos] [varchar](50) NULL,
	[fecultimoparto] [varchar](50) NULL,
	[forceps] [varchar](50) NULL,
	[nohijosprem] [int] NULL,
	[reslab] [varchar](max) NULL,
 CONSTRAINT [PK_hGinecologica] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[historiaAnestesica]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historiaAnestesica](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[pacienteID] [int] NOT NULL,
	[doctorID] [int] NOT NULL,
	[fecha] [datetime] NULL,
	[fechaProxima] [datetime] NULL,
	[fechaFinalizacion] [datetime] NULL,
	[razon] [nvarchar](max) NULL,
	[sintomas] [nvarchar](max) NULL,
	[indicaciones] [nvarchar](max) NULL,
	[diagnostico] [nvarchar](max) NULL,
	[recomendaciones] [nvarchar](max) NULL,
	[observaciones] [nvarchar](max) NULL,
	[Conclucion] [nvarchar](max) NULL,
	[OtrasPatologias] [nvarchar](max) NULL,
	[PatologiasCardio] [nvarchar](max) NULL,
	[ConclucionCardio] [nvarchar](max) NULL,
	[AntecedentesAnalgesicos] [nvarchar](max) NULL,
	[antecedentesfamiliares] [nvarchar](max) NULL,
	[referido] [varchar](60) NULL,
	[estatus] [int] NULL,
	[diagnosticoenfermedad] [varchar](250) NULL,
	[procedimientoarealizar] [varchar](250) NULL,
	[sintomasnocardiovasculares] [varchar](250) NULL,
	[iam] [int] NULL,
	[peso] [int] NULL,
	[cuello] [int] NULL,
	[corazon] [int] NULL,
	[torax] [int] NULL,
	[abdomen] [int] NULL,
	[pulmones] [int] NULL,
	[extremidadessuperiores] [int] NULL,
	[extremidadesinferiores] [int] NULL,
	[viasrespiratorias] [int] NULL,
	[mallapanti] [int] NULL,
	[plananestesia] [int] NULL,
	[discutido] [int] NULL,
	[iamDetalle] [varchar](250) NULL,
	[nac] [bit] NULL,
	[tbpulmonar] [bit] NULL,
	[derramepleural] [bit] NULL,
	[ebpoc] [bit] NULL,
	[asmabronquial] [bit] NULL,
	[enfgastroentestinal] [bit] NULL,
	[enfhepatica] [bit] NULL,
	[enfrenal] [bit] NULL,
	[diabetesmellitus] [bit] NULL,
	[enfematologica] [bit] NULL,
	[cancer] [bit] NULL,
	[arritmias] [bit] NULL,
	[cardiopatiaisquemica] [bit] NULL,
	[cardiopatiareumatica] [bit] NULL,
	[hta] [bit] NULL,
	[anginaobs] [bit] NULL,
	[sicc] [bit] NULL,
	[avc] [bit] NULL,
	[dislipidemia] [bit] NULL,
	[valbulopatia] [bit] NULL,
	[marcapaso] [bit] NULL,
	[insuficienciavascular] [bit] NULL,
	[obecidad] [bit] NULL,
	[alergias] [bit] NULL,
	[alergias2] [int] NULL,
	[sedentarismo] [bit] NULL,
	[alcohol] [bit] NULL,
	[tabaquismo] [bit] NULL,
	[anticonceptivos] [bit] NULL,
	[cafe] [bit] NULL,
	[drogas] [bit] NULL,
	[sncsnp] [bit] NULL,
	[pulmonar] [bit] NULL,
	[cv] [bit] NULL,
	[hepatica] [bit] NULL,
	[renal] [bit] NULL,
	[endocrino] [bit] NULL,
	[hemorragia] [bit] NULL,
	[reflujo] [bit] NULL,
	[tabaquismo2] [bit] NULL,
	[embarazo] [bit] NULL,
	[bd] [varchar](25) NULL,
	[bi] [varchar](25) NULL,
	[tfc] [varchar](25) NULL,
	[tfr] [varchar](25) NULL,
	[pesoarterial] [varchar](25) NULL,
	[talla] [varchar](25) NULL,
	[imcarterial] [varchar](25) NULL,
	[spo2] [varchar](25) NULL,
	[ritmo] [varchar](25) NULL,
	[fc] [varchar](25) NULL,
	[p] [varchar](25) NULL,
	[pr] [varchar](25) NULL,
	[qrs] [varchar](25) NULL,
	[qt] [varchar](25) NULL,
	[aqrs] [varchar](25) NULL,
	[bloqueosav] [varchar](25) NULL,
	[bloqueosrama] [varchar](25) NULL,
	[extrasistoles] [varchar](25) NULL,
	[bradicardia] [varchar](25) NULL,
	[taquicardia] [varchar](25) NULL,
	[ondasq] [varchar](25) NULL,
	[ondast] [varchar](25) NULL,
	[hipertrofia] [varchar](25) NULL,
	[cirugiasprevias] [bit] NULL,
	[convulciones] [bit] NULL,
	[angina] [bit] NULL,
	[palpitaciosn] [bit] NULL,
	[dismea] [bit] NULL,
	[sincope] [bit] NULL,
	[ortopnea] [bit] NULL,
	[tos] [bit] NULL,
	[dpn] [bit] NULL,
	[edema] [bit] NULL,
	[fatiga] [bit] NULL,
	[cianosis] [bit] NULL,
	[otroscardiovasculares] [varchar](250) NULL,
	[autor] [varchar](25) NULL,
	[medicacionenuso] [varchar](250) NULL,
	[procedimientoID] [int] NULL,
	[historiaquirurgica] [varchar](300) NULL,
	[otroshistoria] [varchar](300) NULL,
	[medicamentos] [varchar](300) NULL,
	[apertura] [int] NULL,
	[movimiento] [int] NULL,
	[tirometoniana] [int] NULL,
	[esternometoniana] [int] NULL,
	[atlantooccipital] [int] NULL,
	[anestesiaotros] [varchar](50) NULL,
	[asa] [int] NULL,
	[fechaoperacion] [varchar](25) NULL,
	[hora] [varchar](25) NULL,
	[manejopreguntas] [varchar](max) NULL,
	[riesgos] [varchar](max) NULL,
	[preferencias] [varchar](max) NULL,
	[consideraciones] [varchar](max) NULL,
	[latex] [bit] NULL,
	[huevos] [bit] NULL,
 CONSTRAINT [PK_historiaObstetricia] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[historiaEstudios]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historiaEstudios](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[estudioID] [int] NOT NULL,
	[pacienteID] [int] NULL,
	[doctorID] [int] NULL,
	[consultaID] [int] NULL,
	[fecha] [datetime] NULL,
	[fechaRealizado] [datetime] NULL,
	[imagen1] [image] NULL,
	[imagen2] [image] NULL,
	[imagen3] [image] NULL,
	[imagen4] [image] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_historiaEstudios] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[historiaFarmacologica]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historiaFarmacologica](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[farmacoID] [int] NOT NULL,
	[pacienteID] [int] NULL,
	[doctorID] [int] NULL,
	[consultaID] [int] NULL,
	[fecha] [datetime] NULL,
	[fechaHasta] [datetime] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_historiaFarmacologica] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[historiaM]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historiaM](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[autor] [varchar](25) NULL,
 CONSTRAINT [PK_historiaM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HistoriaObstetricia]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoriaObstetricia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pacienteID] [int] NULL,
	[autor] [varchar](25) NULL,
	[fecha] [date] NULL,
	[sintomas] [varchar](250) NULL,
	[observaciones] [varchar](250) NULL,
	[fecultima] [date] NULL,
	[tbcfamiliar] [int] NULL,
	[diabetesfamiliar] [int] NULL,
	[hipertencionfamiliar] [int] NULL,
	[preeclamsiafamiliar] [int] NULL,
	[eclampsiafamiliar] [int] NULL,
	[otracondicionfamiliar] [int] NULL,
	[tbcpeint] [int] NULL,
	[nal] [int] NULL,
	[diabetespersonal] [int] NULL,
	[hipertencionpersonal] [int] NULL,
	[preeclamsiapersonal] [int] NULL,
	[eclampsiapersonal] [int] NULL,
	[otracondicionpersonal] [int] NULL,
	[cirugiagenitourinaria] [int] NULL,
	[infertilidad] [int] NULL,
	[cardiopatia] [int] NULL,
	[nefropatia] [int] NULL,
	[violencia] [int] NULL,
	[v076] [int] NULL,
	[ultimoprevio] [int] NULL,
	[ultimopreviovalor] [int] NULL,
	[gemelares] [int] NULL,
	[gestasprevias] [varchar](25) NULL,
	[ectopico] [varchar](25) NULL,
	[abortos] [varchar](25) NULL,
	[partos] [varchar](25) NULL,
	[vaginales] [varchar](25) NULL,
	[cesarea] [varchar](25) NULL,
	[vivos] [varchar](25) NULL,
	[muertos] [varchar](25) NULL,
	[viven] [varchar](25) NULL,
	[m1semana] [varchar](25) NULL,
	[d1semana] [varchar](25) NULL,
	[menos1anio] [bit] NULL,
	[fecembarazoanterior] [varchar](25) NULL,
	[planeado] [int] NULL,
	[fracasometodo] [int] NULL,
	[pesoant] [varchar](25) NULL,
	[talla] [varchar](25) NULL,
	[fumfec] [date] NULL,
	[fpp] [date] NULL,
	[fum] [int] NULL,
	[eco20s] [int] NULL,
	[fuma1er] [int] NULL,
	[fuma2do] [int] NULL,
	[fuma3er] [int] NULL,
	[fumapas1er] [int] NULL,
	[fumapas2do] [int] NULL,
	[fumapas3er] [int] NULL,
	[drogas1er] [int] NULL,
	[drogas2do] [int] NULL,
	[drogas3er] [int] NULL,
	[alcohol1er] [int] NULL,
	[alcohol2do] [int] NULL,
	[alcohol3er] [int] NULL,
	[vd1er] [int] NULL,
	[vd2do] [int] NULL,
	[vd3er] [int] NULL,
	[antirubeola] [int] NULL,
	[antitetanica] [int] NULL,
	[dosis1] [varchar](25) NULL,
	[dosis2] [varchar](25) NULL,
	[odont] [int] NULL,
	[mamas] [int] NULL,
	[inspvisual] [int] NULL,
	[pap] [int] NULL,
	[colp] [int] NULL,
	[sangre] [varchar](25) NULL,
	[rh] [int] NULL,
	[inmuniz] [int] NULL,
	[globulina] [int] NULL,
	[toxomenor] [int] NULL,
	[toxomayor] [int] NULL,
	[consultalgm] [int] NULL,
	[glucemiamenorvalor] [varchar](25) NULL,
	[glucemiamayorvalor] [varchar](25) NULL,
	[glucemiamenor] [bit] NULL,
	[glucemiamayor] [bit] NULL,
	[chagas] [int] NULL,
	[paludismo] [int] NULL,
	[bacteriuriamenor] [int] NULL,
	[bacteriuriamayor] [int] NULL,
	[hbvalor] [bit] NULL,
	[hb] [varchar](25) NULL,
	[fe] [int] NULL,
	[folatos] [int] NULL,
	[hbmayor] [varchar](25) NULL,
	[hbmayorvalor] [bit] NULL,
	[estretococo] [int] NULL,
	[prepparto] [int] NULL,
	[lactancia] [int] NULL,
	[semsolicitadamenor] [int] NULL,
	[pruebaresultmenot] [int] NULL,
	[tarvmenor] [int] NULL,
	[semsolicitadamayor] [int] NULL,
	[pruebaresultmayor] [int] NULL,
	[tarvmayor] [int] NULL,
	[sifilispruebamenor] [int] NULL,
	[sifilispruebamenorvalor] [varchar](25) NULL,
	[sifilispruebamayorvalor] [varchar](25) NULL,
	[sifilispruebamayor] [int] NULL,
	[treponemicamenor] [int] NULL,
	[treponemicamayor] [int] NULL,
	[treponemicamenorvalor] [varchar](25) NULL,
	[treponemicamayorvalor] [varchar](25) NULL,
	[tratamientomenor] [int] NULL,
	[tratamientomayor] [int] NULL,
	[tratamientomenorvalor] [varchar](25) NULL,
	[tratamientomayorvalor] [varchar](25) NULL,
	[tipparejamenor] [int] NULL,
	[tipparejamayor] [int] NULL,
	[fecconsulta1] [varchar](25) NULL,
	[fecconsulta2] [varchar](25) NULL,
	[fecconsulta3] [varchar](25) NULL,
	[fecconsulta4] [varchar](25) NULL,
	[fecconsulta5] [varchar](25) NULL,
	[edadgestal1] [varchar](25) NULL,
	[edadgestal2] [varchar](25) NULL,
	[edadgestal3] [varchar](25) NULL,
	[edadgestal4] [varchar](25) NULL,
	[edadgestal5] [varchar](25) NULL,
	[peso1] [varchar](25) NULL,
	[peso2] [varchar](25) NULL,
	[peso3] [varchar](25) NULL,
	[peso4] [varchar](25) NULL,
	[peso5] [varchar](25) NULL,
	[pa1] [varchar](25) NULL,
	[pa2] [varchar](25) NULL,
	[pa3] [varchar](25) NULL,
	[pa4] [varchar](25) NULL,
	[pa5] [varchar](25) NULL,
	[altuterina1] [varchar](25) NULL,
	[altuterina2] [varchar](25) NULL,
	[altuterina3] [varchar](25) NULL,
	[altuterina4] [varchar](25) NULL,
	[altuterina5] [varchar](25) NULL,
	[presentacion1] [varchar](25) NULL,
	[presentacion2] [varchar](25) NULL,
	[presentacion3] [varchar](25) NULL,
	[presentacion4] [varchar](25) NULL,
	[presentacion5] [varchar](25) NULL,
	[fcf1] [varchar](25) NULL,
	[fcf2] [varchar](25) NULL,
	[fcf3] [varchar](25) NULL,
	[fcf4] [varchar](25) NULL,
	[fcf5] [varchar](25) NULL,
	[movimfetales1] [varchar](25) NULL,
	[movimfetales2] [varchar](25) NULL,
	[movimfetales3] [varchar](25) NULL,
	[movimfetales4] [varchar](25) NULL,
	[movimfetales5] [varchar](25) NULL,
	[protei1] [varchar](25) NULL,
	[protei2] [varchar](25) NULL,
	[protei3] [varchar](25) NULL,
	[protei4] [varchar](25) NULL,
	[protei5] [varchar](25) NULL,
	[signos1] [varchar](25) NULL,
	[signos2] [varchar](25) NULL,
	[signos3] [varchar](25) NULL,
	[signos4] [varchar](25) NULL,
	[signos5] [varchar](25) NULL,
	[ncjp1] [varchar](25) NULL,
	[ncjp2] [varchar](25) NULL,
	[ncjp3] [varchar](25) NULL,
	[ncjp4] [varchar](25) NULL,
	[ncjp5] [varchar](25) NULL,
	[proxcita1] [varchar](25) NULL,
	[proxcita2] [varchar](25) NULL,
	[proxcita3] [varchar](25) NULL,
	[proxcita4] [varchar](25) NULL,
	[proxcita5] [varchar](25) NULL,
	[partoaborto] [int] NULL,
	[fecingreso] [varchar](25) NULL,
	[consultastotal] [varchar](25) NULL,
	[diashospitaliz] [varchar](25) NULL,
	[corticoides] [int] NULL,
	[semanainicio] [varchar](25) NULL,
	[inicio] [int] NULL,
	[roturas] [int] NULL,
	[fechamembrana] [varchar](25) NULL,
	[horamembrana] [varchar](25) NULL,
	[roturamayor] [bit] NULL,
	[roturahs] [bit] NULL,
	[roturagrados] [bit] NULL,
	[semanasgestal] [varchar](25) NULL,
	[diasgestal] [varchar](25) NULL,
	[porfumgestal] [bit] NULL,
	[porecogestal] [bit] NULL,
	[cefalica] [bit] NULL,
	[pelviana] [bit] NULL,
	[transversa] [bit] NULL,
	[tamanofetal] [int] NULL,
	[acompanantetdp] [int] NULL,
	[acompanantep] [int] NULL,
	[vivomuerto] [int] NULL,
	[momento] [int] NULL,
	[horanacido] [varchar](25) NULL,
	[fechanacido] [varchar](25) NULL,
	[ordennacimiento] [varchar](25) NULL,
	[terminacion] [int] NULL,
	[indicacionesparto] [varchar](25) NULL,
	[ocitocicos] [int] NULL,
	[antibiot] [int] NULL,
	[analgesia] [int] NULL,
	[anestlocal] [int] NULL,
	[anestregion] [int] NULL,
	[anestgral] [int] NULL,
	[transfusion] [int] NULL,
	[otrosmedicacion] [int] NULL,
	[otrosmedicacionvalor] [varchar](25) NULL,
	[posicion] [int] NULL,
	[episiotomia] [int] NULL,
	[desgarros] [int] NULL,
	[desgarrosvalor] [varchar](25) NULL,
	[ocitocitospre] [int] NULL,
	[ocitocitospost] [int] NULL,
	[placentacompleta] [int] NULL,
	[placentaretenida] [int] NULL,
	[ligadura] [int] NULL,
	[htaprevia] [int] NULL,
	[htainducida] [int] NULL,
	[preeclampsia] [int] NULL,
	[cardiopatiaenf] [int] NULL,
	[nefropatiaenf] [int] NULL,
	[diabetes] [int] NULL,
	[infecurinaria] [int] NULL,
	[infectovular] [int] NULL,
	[amenazaparto] [int] NULL,
	[rciu] [int] NULL,
	[roturaprem] [int] NULL,
	[anemia] [int] NULL,
	[otracondgrave] [int] NULL,
	[hemorragia1] [int] NULL,
	[hemorragia2] [int] NULL,
	[hemorraria3] [int] NULL,
	[hemorragiapost] [int] NULL,
	[infectpuerperal] [int] NULL,
	[pruebasifilis] [int] NULL,
	[prueba076] [int] NULL,
	[tarv] [int] NULL,
	[sexo] [int] NULL,
	[peso] [varchar](25) NULL,
	[pcefalico] [varchar](25) NULL,
	[longitud] [varchar](25) NULL,
	[edadgestacionalsem] [varchar](25) NULL,
	[edadgestacionaldias] [varchar](25) NULL,
	[edadgestacional] [int] NULL,
	[pesoeg] [int] NULL,
	[apgar] [varchar](25) NULL,
	[defectos] [int] NULL,
	[estimulac] [int] NULL,
	[aspiracion] [int] NULL,
	[mascara] [int] NULL,
	[oxigeno] [int] NULL,
	[tubo] [int] NULL,
	[fallece] [int] NULL,
	[refereido] [int] NULL,
	[fecprox] [date] NULL,
 CONSTRAINT [PK_HistoriaObstetricia_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[historiaPadecimientos]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historiaPadecimientos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[diagnosticoCode] [varchar](20) NOT NULL,
	[observaciones] [varchar](max) NULL,
	[fechaDeterminacion] [date] NULL,
	[fechaFinalizacion] [date] NULL,
	[pacienteID] [int] NOT NULL,
	[consultaID] [int] NULL,
 CONSTRAINT [PK_historiaPadecimientos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[historiaPruebas]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historiaPruebas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PruebaID] [int] NOT NULL,
	[fechaRealizacion] [datetime] NULL,
	[fechaRecoger] [datetime] NULL,
	[fechaEntrega] [datetime] NULL,
	[resultado] [varchar](250) NULL,
	[indicaciones] [varchar](250) NULL,
	[observaciones] [varchar](max) NULL,
	[notas] [varchar](max) NULL,
	[status] [smallint] NULL,
 CONSTRAINT [PK_historiaPruebas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hObstericaVisitas]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hObstericaVisitas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[hObsID] [int] NULL,
	[fecha] [date] NULL,
	[semanasporfum] [varchar](50) NULL,
	[tammhg] [varchar](50) NULL,
	[pesoenlibras] [varchar](50) NULL,
	[ausem] [varchar](50) NULL,
	[present] [varchar](50) NULL,
	[fcf] [varchar](50) NULL,
	[edema] [varchar](50) NULL,
	[varices] [varchar](50) NULL,
	[observaciones] [varchar](max) NULL,
 CONSTRAINT [PK_hObstericaVisitas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hObstetrica]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hObstetrica](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pacienteID] [int] NULL,
	[consultaID] [int] NULL,
	[fecha] [date] NULL,
	[alergias] [varchar](max) NULL,
	[testdecoombs] [varchar](max) NULL,
	[app] [varchar](max) NULL,
	[fum] [varchar](50) NULL,
	[fpp] [varchar](50) NULL,
	[ultimopap] [varchar](50) NULL,
	[primeratt] [varchar](50) NULL,
	[segundatt] [varchar](50) NULL,
	[hb] [varchar](50) NULL,
	[vdrl] [varchar](50) NULL,
	[falsemia] [varchar](50) NULL,
	[plaq] [varchar](50) NULL,
	[hbsag] [varchar](50) NULL,
	[electroforesis] [varchar](50) NULL,
	[glicemia] [varchar](50) NULL,
	[hvc] [varchar](50) NULL,
	[detecciondmg] [varchar](50) NULL,
	[orina] [varchar](50) NULL,
	[hiv] [varchar](50) NULL,
	[manurezpulmonar] [varchar](50) NULL,
	[observaciones] [varchar](max) NULL,
	[nohijosprem] [int] NULL,
	[reslab] [varchar](max) NULL,
 CONSTRAINT [PK_hObstetrica] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hojadiagnostica]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hojadiagnostica](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pacienteID] [int] NULL,
	[fecha] [date] NULL,
	[observaciones] [varchar](max) NULL,
	[tipificacion] [bit] NULL,
	[hemograma] [bit] NULL,
	[falsemia] [bit] NULL,
	[hemoglobina] [bit] NULL,
	[eritrosedimentacion] [bit] NULL,
	[glisemia] [bit] NULL,
	[hba1c] [bit] NULL,
	[urea] [bit] NULL,
	[creatinina] [bit] NULL,
	[tgo] [bit] NULL,
	[tgp] [bit] NULL,
	[colesterol] [bit] NULL,
	[hdl] [bit] NULL,
	[ldl] [bit] NULL,
	[vldl] [bit] NULL,
	[trigliceridos] [bit] NULL,
	[biltotal] [bit] NULL,
	[bi] [bit] NULL,
	[bd] [bit] NULL,
	[acidourico] [bit] NULL,
	[ldh] [bit] NULL,
	[vdrl] [bit] NULL,
	[pcr] [bit] NULL,
	[ftabs] [bit] NULL,
	[tc] [bit] NULL,
	[tp] [bit] NULL,
	[tpt] [bit] NULL,
	[fibrinogeno] [bit] NULL,
	[toxoplasmosis] [bit] NULL,
	[igg] [bit] NULL,
	[igm] [bit] NULL,
	[proteinastotales] [bit] NULL,
	[albumina] [bit] NULL,
	[sodio] [bit] NULL,
	[potasio] [bit] NULL,
	[calcio] [bit] NULL,
	[magnesio] [bit] NULL,
	[fosforo] [bit] NULL,
	[hiv] [bit] NULL,
	[hbsag] [bit] NULL,
	[t3] [bit] NULL,
	[t4libre] [bit] NULL,
	[tsh] [bit] NULL,
	[orina] [bit] NULL,
	[urocultivo] [bit] NULL,
	[coprologico] [bit] NULL,
	[cultivosecvagin] [bit] NULL,
	[prolactina] [bit] NULL,
	[fsh] [bit] NULL,
	[estradial] [bit] NULL,
	[progesterona] [bit] NULL,
	[rubeola] [bit] NULL,
	[bhcg] [bit] NULL,
	[hcg] [bit] NULL,
	[cea] [bit] NULL,
	[sa199] [bit] NULL,
	[ca125] [bit] NULL,
	[herpes] [bit] NULL,
	[clamidia] [bit] NULL,
	[toraxpa] [bit] NULL,
	[toraxap] [bit] NULL,
	[mamografia] [bit] NULL,
	[pelvismediocontraste] [bit] NULL,
	[pelvissincontraste] [bit] NULL,
	[abdomencontraste] [bit] NULL,
	[abdomensincontraste] [bit] NULL,
	[abdomen] [bit] NULL,
	[pelvis] [bit] NULL,
	[tiroides] [bit] NULL,
	[transvaginal] [bit] NULL,
 CONSTRAINT [PK_hojadiagnostica] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ICD10]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ICD10](
	[Code] [varchar](20) NOT NULL,
	[Descripcion_es] [varchar](400) NULL,
	[Descripcion_en] [varchar](400) NULL,
 CONSTRAINT [PK_ICD10] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[laboratorios]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[laboratorios](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[direccion] [nvarchar](250) NULL,
 CONSTRAINT [PK_laboratorios] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[motivos]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[motivos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](250) NULL,
	[BalAnt] [decimal](18, 2) NULL,
	[BalAct] [decimal](18, 2) NULL,
	[Origen] [int] NULL,
	[autor] [varchar](50) NULL,
	[FecRecordar] [date] NULL,
	[marcaRecordar] [bit] NULL,
	[fecUltTrans] [datetime] NULL,
 CONSTRAINT [PK_motivos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[opciones]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[opciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [varchar](250) NULL,
	[link] [varchar](250) NULL,
	[autor] [varchar](25) NULL,
	[orden] [int] NULL,
 CONSTRAINT [PK_opciones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[paciente]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paciente](
	[record] [varchar](20) NOT NULL,
	[userID] [int] NOT NULL,
	[seguro] [bit] NULL,
	[gruposanguineoID] [int] NULL,
	[padecimientosInfancia] [varchar](max) NULL,
	[fechaCreacion] [datetime] NULL,
	[condicionActual] [varchar](max) NULL,
	[diabetes] [bit] NULL,
	[drogas] [varchar](max) NULL,
	[tabaco] [bit] NULL,
	[alcohol] [bit] NULL,
	[gastrointestinal] [varchar](max) NULL,
	[menstruation] [varchar](200) NULL,
	[alergias] [varchar](200) NULL,
	[respiracion] [varchar](max) NULL,
	[piel] [varchar](max) NULL,
	[urinarias] [varchar](max) NULL,
	[psiquiatria] [varchar](200) NULL,
	[otros] [varchar](max) NULL,
	[sirugias] [varchar](max) NULL,
	[transfusiones] [varchar](max) NULL,
	[medicinasNaturales] [varchar](max) NULL,
	[farmacos] [varchar](max) NULL,
	[ultimaVisita] [datetime] NULL,
	[edad] [int] NULL,
	[referido] [varchar](50) NULL,
	[autor] [varchar](50) NULL,
	[seguroID] [int] NULL,
 CONSTRAINT [PK_paciente] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[presentaciones]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[presentaciones](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[unidadID] [int] NULL,
 CONSTRAINT [PK_presentaciones] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[procedimientos]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[procedimientos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NULL,
	[Nombre] [varchar](250) NULL,
 CONSTRAINT [PK_procedimientos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pruebas]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pruebas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[clasificacionID] [int] NOT NULL,
	[valorReferenciaID] [int] NULL,
	[unidadID] [int] NULL,
	[descripcion] [nvarchar](50) NULL,
	[abreviatura] [nvarchar](50) NULL,
	[comentarios] [varchar](max) NULL,
	[precio] [decimal](18, 2) NULL,
	[stock] [int] NULL,
	[indicaciones] [varchar](max) NULL,
	[notas] [varchar](max) NULL,
 CONSTRAINT [PK_pruebas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pruebasClasificacion]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pruebasClasificacion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[detalle] [varchar](250) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pruebasUnidades]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pruebasUnidades](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[medida] [varchar](50) NULL,
 CONSTRAINT [PK_pruebasUnidades] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pruebasValorReferencia]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pruebasValorReferencia](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[valor] [nvarchar](50) NULL,
 CONSTRAINT [PK_pruebasValorReferencia] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[recetasobstetricia]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recetasobstetricia](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PacienteID] [int] NULL,
	[hObstetriciaID] [int] NULL,
	[fecha] [date] NULL,
	[observaciones] [varchar](max) NULL,
	[receta] [varchar](max) NULL,
 CONSTRAINT [PK_recetasobstetricia] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[roles]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [varchar](250) NULL,
	[autor] [varchar](25) NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rolesopciones]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rolesopciones](
	[opcionId] [int] NULL,
	[rolID] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_rolesopciones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[servicios]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicios](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](6) NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion] [nvarchar](250) NULL,
	[precio] [decimal](18, 2) NULL,
	[notas] [varchar](450) NULL,
	[costo] [decimal](18, 0) NULL,
	[stock] [int] NULL,
	[categoria] [int] NULL,
	[autor] [varchar](50) NULL,
	[imagen] [nvarchar](max) NULL,
	[tservicio] [bit] NULL,
 CONSTRAINT [PK_servicios] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[transacciones]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transacciones](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MotivoOrigen] [int] NULL,
	[MotivoDestino] [int] NULL,
	[Descripcion] [varchar](250) NULL,
	[BalAnt] [decimal](18, 2) NULL,
	[BalTrans] [decimal](18, 2) NULL,
	[fecha] [datetime] NULL,
	[autor] [varchar](50) NULL,
	[tipo] [int] NULL,
	[marca] [bit] NULL,
	[BalAntProcedencia] [decimal](18, 2) NULL,
 CONSTRAINT [PK_transacciones] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[unidades]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[unidades](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
 CONSTRAINT [PK_Unidades] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usuariosroles]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuariosroles](
	[rolID] [int] NULL,
	[userID] [int] NULL,
	[defaultpage] [varchar](50) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_usuariosroles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usuariosSec]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuariosSec](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[fecNacimiento] [datetime] NOT NULL,
	[rnc] [varchar](20) NULL,
	[tipoRnc] [char](1) NULL,
	[email] [varchar](50) NULL,
	[telefono] [varchar](15) NULL,
	[celular] [varchar](15) NULL,
	[genero] [char](1) NOT NULL,
	[estatusMarital] [char](1) NOT NULL,
	[ocupacion] [varchar](50) NULL,
	[religion] [varchar](50) NULL,
	[fecCreacion] [datetime] NULL,
	[ultimaVisita] [datetime] NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](200) NOT NULL,
	[nivel] [char](1) NOT NULL,
	[estatus] [bit] NOT NULL,
	[autor] [varchar](50) NULL,
	[direccion] [varchar](250) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ventas]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ventas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[numDoc] [varchar](50) NOT NULL,
	[tipoDoc] [int] NOT NULL,
	[fecha] [smalldatetime] NULL,
	[fechaPagada] [smalldatetime] NULL,
	[fechaAbono] [smalldatetime] NULL,
	[subTotal] [decimal](18, 0) NULL,
	[total] [decimal](18, 0) NULL,
	[balancePendiente] [decimal](18, 0) NULL,
	[saldoPagado] [decimal](18, 0) NULL,
	[autor] [varchar](50) NULL,
	[clienteID] [int] NULL,
	[comentarios] [varchar](250) NULL,
	[transaccionID] [int] NULL,
	[estatusID] [int] NULL,
 CONSTRAINT [PK_ventas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ventasDetalle]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ventasDetalle](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ventaID] [int] NOT NULL,
	[servicioID] [int] NOT NULL,
	[cantidad] [decimal](18, 2) NOT NULL,
	[precio] [decimal](18, 2) NOT NULL,
	[itbis] [decimal](18, 2) NOT NULL,
	[total] [decimal](18, 2) NOT NULL,
	[autor] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ventasDetalle] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VISITASGINECOLOGICAS]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VISITASGINECOLOGICAS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HGINECOLOGICAID] [int] NULL,
	[NOTAS] [varchar](max) NULL,
	[FECHA] [date] NULL,
 CONSTRAINT [PK_VISITASGINECOLOGICAS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[cargos] ([nombre], [valor], [autor]) VALUES (N'itbis', 0.18, N'salon')
SET IDENTITY_INSERT [dbo].[consulta] ON 

INSERT [dbo].[consulta] ([ID], [pacienteID], [doctorID], [fecha], [fechaProxima], [fechaFinalizacion], [razon], [sintomas], [indicaciones], [diagnostico], [recomendaciones], [observaciones], [referido], [estatus], [autor], [historiaMID], [fecultima], [procedimientoID]) VALUES (2, 44, 19, CAST(N'2016-05-29T00:00:00.000' AS DateTime), CAST(N'2016-05-29T00:00:00.000' AS DateTime), CAST(N'2016-05-29T00:00:00.000' AS DateTime), N'Evaluacion Anestesica Pre Quirurgica', N'', N'', N'A001', N'', N'', N'', 1, N'doctora', 1, CAST(N'2016-05-29' AS Date), 2)
INSERT [dbo].[consulta] ([ID], [pacienteID], [doctorID], [fecha], [fechaProxima], [fechaFinalizacion], [razon], [sintomas], [indicaciones], [diagnostico], [recomendaciones], [observaciones], [referido], [estatus], [autor], [historiaMID], [fecultima], [procedimientoID]) VALUES (3, 44, 19, CAST(N'2016-05-29T00:00:00.000' AS DateTime), CAST(N'2016-05-29T00:00:00.000' AS DateTime), CAST(N'2016-05-29T00:00:00.000' AS DateTime), N'Evaluacion Anestesica Pre Quirurgica', N'', N'', N'A001', N'', N'', N'', 1, N'doctora', 1, CAST(N'2016-05-29' AS Date), 2)
INSERT [dbo].[consulta] ([ID], [pacienteID], [doctorID], [fecha], [fechaProxima], [fechaFinalizacion], [razon], [sintomas], [indicaciones], [diagnostico], [recomendaciones], [observaciones], [referido], [estatus], [autor], [historiaMID], [fecultima], [procedimientoID]) VALUES (4, 44, 19, CAST(N'2016-05-29T00:00:00.000' AS DateTime), CAST(N'2016-05-29T00:00:00.000' AS DateTime), CAST(N'2016-05-29T00:00:00.000' AS DateTime), N'Evaluacion Anestesica Pre Quirurgica', N'', N'', N'A009', N'', N'', N'', 1, N'doctora', 1, CAST(N'2016-05-29' AS Date), 2)
INSERT [dbo].[consulta] ([ID], [pacienteID], [doctorID], [fecha], [fechaProxima], [fechaFinalizacion], [razon], [sintomas], [indicaciones], [diagnostico], [recomendaciones], [observaciones], [referido], [estatus], [autor], [historiaMID], [fecultima], [procedimientoID]) VALUES (5, 44, 19, CAST(N'2016-05-29T00:00:00.000' AS DateTime), CAST(N'2016-05-29T00:00:00.000' AS DateTime), CAST(N'2016-05-29T00:00:00.000' AS DateTime), N'Evaluacion Anestesica Pre Quirurgica', N'', N'', N'A009', N'', N'', N'', 1, N'doctora', 1, CAST(N'2016-05-29' AS Date), 2)
INSERT [dbo].[consulta] ([ID], [pacienteID], [doctorID], [fecha], [fechaProxima], [fechaFinalizacion], [razon], [sintomas], [indicaciones], [diagnostico], [recomendaciones], [observaciones], [referido], [estatus], [autor], [historiaMID], [fecultima], [procedimientoID]) VALUES (6, 44, 19, CAST(N'2016-05-29T00:00:00.000' AS DateTime), CAST(N'2016-05-29T00:00:00.000' AS DateTime), CAST(N'2016-05-29T00:00:00.000' AS DateTime), N'Evaluacion Anestesica Pre Quirurgica', N'', N'', N'A01', N'', N'', N'', 1, N'doctora', 1, CAST(N'2016-05-29' AS Date), 3)
INSERT [dbo].[consulta] ([ID], [pacienteID], [doctorID], [fecha], [fechaProxima], [fechaFinalizacion], [razon], [sintomas], [indicaciones], [diagnostico], [recomendaciones], [observaciones], [referido], [estatus], [autor], [historiaMID], [fecultima], [procedimientoID]) VALUES (7, 44, 19, CAST(N'2016-05-29T00:00:00.000' AS DateTime), CAST(N'2016-05-29T00:00:00.000' AS DateTime), CAST(N'2016-05-29T00:00:00.000' AS DateTime), N'Evaluacion Anestesica Pre Quirurgica', N'', N'', N'B007', N'', N'', N'', 1, N'doctora', 1, CAST(N'2016-05-29' AS Date), 3)
INSERT [dbo].[consulta] ([ID], [pacienteID], [doctorID], [fecha], [fechaProxima], [fechaFinalizacion], [razon], [sintomas], [indicaciones], [diagnostico], [recomendaciones], [observaciones], [referido], [estatus], [autor], [historiaMID], [fecultima], [procedimientoID]) VALUES (8, 44, 19, CAST(N'2016-05-29T00:00:00.000' AS DateTime), CAST(N'2016-05-29T00:00:00.000' AS DateTime), CAST(N'2016-05-29T00:00:00.000' AS DateTime), N'Evaluacion Anestesica Pre Quirurgica', N'', N'', N'B008', N'', N'', N'', 1, N'doctora', 1, CAST(N'2016-05-29' AS Date), 3)
SET IDENTITY_INSERT [dbo].[consulta] OFF
INSERT [dbo].[doctor] ([userID], [especialidadID], [ultimaVisita]) VALUES (19, 1, NULL)
SET IDENTITY_INSERT [dbo].[especialidad] ON 

INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (1, N'None', N'Significa que aun no tiene otra especialidad')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (2, N'Alergología', N'(Alergia inmunológica) Es la especialidad que ve los fenómenos inmunológicos del organismo como: asma, rinitis, urticarias, fiebre de heno, reacciones a medicamentos, reacciones adversas a ciertos medicamentos.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (3, N'Dermatología', N'Rama de la medicina que estudia las enfermedades de la piel, pelo y uñas, así como sus diagnósticos y tratamientos. Hoy en día la dermatología tiene varias subespecialidades como: Dematología Pediátrica, Cirugía Dermatológica, Dermatopatología, Contactología, etc.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (4, N'Dermatología pediátrica', N'Manejo médico quirúrgico de enfermedades de la piel cabello y uñas enfocado a los niños.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (5, N'Endocrinología', N'Estudio de las glándulas de secreción interna. Esta especialidad abarca todas las enfermedades ocasionadas por trastornos hormonales, tales como: Diabetes Mellitus, enfermedades tiroideas, hipofisarias, paratiroideas, suprarrenales, alteraciones en el metabolismo de lípidos, obesidad.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (6, N'Endoscopía', N'Manejo médico que permite revisar, reparar, o realizar biopsias de tejidos por medio de una minúscula lamparita colocada al borde de un delgado alambre elaborado con fibra óptica. Esto permite extender la vista del médico para detectar cualquier cambio de coloración, la textura, posibles sangrados o la presencia de pólipos o tumores en algunas partes del cuerpo.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (7, N'Endodoncia', N'Manejo quirúrgico de enfermedades de los nervios de las piezas dentales.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (8, N'Gastroenterología', N'Estudia todo lo relacionado al estómago e intestinos, como: cáncer de estómago, esófago, colon, pólipos, úlceras, gastritis, vesícula, acidez, parásitos, estreñimiento, etc.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (9, N'Genética', N'Rama de la medicina que estudia y trata la reproducción, herencia, variación y del conjunto de fenómenos y problemas relativos a la descendencia, ejemplo: historia clínica genética y el árbol genealógico, tamiz neonatal para detección de enfermedades metabólicas, estudios cromosómicos en sangre periférica, médula ósea, y fibroblastos, estudios moleculares de DNA para algunos padecimientos.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (10, N'Geriatría', N'Especialidad que estudia los aspectos preventivos, clínicos y  terapéuticos de los adultos mayores.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (11, N'Gerontología', N'Estudia el envejecimiento atendiendo los aspectos biológicos, psicológicos y sociales, atienden de manera integral al paciente de edad avanzada.   Ginecología y Obstetricia Estudia todo lo relacionado con la salud de la mujer, desde el inicio de la menstruación, control de natalidad, embarazo, menopausia, infertilidad, enfermedades del sistema reproductor, etc.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (12, N'Hematología', N'Especialidad que estudia todo lo relacionado con la sangre como: leucemia, anemias, hemostasia, hipoglicemia, trombos, coagulación, hemofilia, etc.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (13, N'Algología', N'Especialidad médica que estudia y trata el dolor en todas sus manifestaciones.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (14, N'Hemato-Oncología', N'Estudio médico de enfermedades malignas en la sangre.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (15, N'Hepatología', N'Manejo médico de todo lo relacionado al hígado.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (16, N'Imagenología', N'Maneja todo tipo de imágenes como: radiografías, tomografía axial computarizada, resonancia magnética, fluoroscopia digital, ultrasonidos, mastografías, ecotomogramas 3D, etc.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (17, N'Infectología', N'Estudia todo lo relacionado a las enfermedades infecciosas, tanto en su prevención como su tratamiento.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (18, N'Inhaloterapia', N'Es la aplicación de los procedimientos que se utilizan para tratar y rehabilitar a los pacientes con padecimientos respiratorios mediante la administración de oxígeno, sólo o mezclado con otros gases, humedad, aerosoles y fisioterapia torácica.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (19, N'Inmunología clínica y alergología pediátrica', N'Manejo médico encaminado al fortalecimiento del sistema de defensa en niños con infecciones de repetición y/o infecciones severas.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (20, N'Medicina física y de rehabilitación', N'Tratamiento mediante terapia física de rehabilitación de pacientes con enfermedades crónicas , traumatizados y quirúrgicos.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (21, N'Medicina Crític', N'Atiende pacientes en estado delicado internados en terapia intensiva, media y de cuidados prolongados.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (22, N'Medicina general', N'Manejo médico integral del paciente.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (23, N'Medicina familiar', N'Actúa como vía de entrada del paciente y su familia al sistema de atención a la salud. Integra las ciencias biológicas, sociales y de la conducta; su campo de acción se desarrolla sin distinción de edades, sexos, sistemas orgánicos y enfermedades.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (24, N'Anestesiología', N'Especialidad médica que estudia los procedimientos, aparatos y materiales que pueden emplearse para la anestesia.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (25, N'Medicina del deporte', N'Incluye aquellas ramas teóricas y prácticas de la medicina que investigan la influencia del ejercicio, el entrenamiento, en personas sanas, enfermas y de los deportistas. La medicina del deporte abarca desde la valoración del estado de salud, capacitación, atención de lesiones, nutrición, control científico del entrenamiento, etc.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (26, N'Medicina Nuclear', N'Rama de la medicina en la que se utilizan las propiedades de materiales radiactivos y estables para investigar procesos fisiológicos y bioquímicos normales y anormales, así como para diagnosticar y tratar procesos patológicos que afectan al organismo.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (27, N'Medicina preventiva', N'Tiene como objetivo principal, la de prevenir enfermedades, pero si éstas no se pueden evitar o ya están presentes, es importante diagnosticarlas tempranamente antes de que hagan daño o más daño. A través de una evaluación médica (Check-up), se identifican factores de riesgo.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (28, N'Nefrología', N'La Nefrología es la rama de la Medicina Interna que estudia las múltiples alteraciones que afectan los líquidos y los electrolitos del cuerpo así como las enfermedades renales, su diagnóstico y tratamiento (Insuficiencia renal crónica). Incluye el estudio del equilibrio ácido-base y la hipertensión arterial, y el control de pacientes con diálisis. Así como la preparación necesaria para transplantes de riñón.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (29, N'Neonatología', N'Especialidad que estudia todo lo relacionado con el recién nacido, desde que nace hasta el momento de darlo de alta. El neonatólogo brinda cuidados especiales a los bebés prematuros, vigilando su desarrollo o complicaciones que pueda tener.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (30, N'Neumología', N'Especialidad que está enfocada a todo lo relacionado con el sistema respiratorio, como: neumonías, bronconeumonías, cáncer de pulmón, fumadores, enfermedades inflamatorias del pulmón, etc.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (31, N'Neurocirugía', N'Manejo quirúrgico de pacientes con enfermedades en cerebro, medula y nervios periféricos.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (32, N'Neuroradiología', N'Realización e interpretación de tomografías, resonancias magnéticas y angiografías del cerebro y médula espinal.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (33, N'Neurofisiología', N'Los estudios neurofisiológicos, son evaluaciones de la actividad eléctrica del cerebro, de los nervios periféricos y músculos. La forma de evaluar las diferentes estructuras del sistema nervioso, es a través de mediciones muy precisas de la actividad eléctrica que continuamente se produce en este sistema. Algunos estudios pueden ser: electroencefalograma, electomolografía, laboratorio del sueño, etc.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (34, N'Neurología', N'Especialidad que estudia el Sistema Nervioso Central como por ejemplo: migraña, epilepsia, enfermedad vascular cerebral, demencias o padecimientos del sistema periférico como : neuropatías diabéticas, radiculopatías (ciática) , distrofías, convulsiones, ataque cerebral, hidrocefalia, parálisis cerebral, apoplejias, etc.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (35, N'Angiología y cirugía vascular', N'Manejo médico de los vasos sanguíneos y linfáticos.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (36, N'Nutriología', N'El nutriólogo se encarga de evaluar y vigilar el estado nutricional de las personas. La función del nutriólogo es muy importante para mantener la salud de todas las personas, a nivel preventivo y también a nivel correctivo. Hay ciertas enfermedades que deben ser controladas con medicamentos, nutrición y ejercicio como es el caso de la diabetes o la obesidad.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (37, N'Odontología', N'Se encarga del diagnóstico, prevención y tratamientos de problemas de la salud bucal. Se divide en varias especialidades, endodoncia, odontopediatría, ortodoncia, periodoncia. Revisión de la cavidad oral, ganglios linfáticos, submaxilares y cervicales, así como articulación Temporo-mandibular.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (38, N'Oftalmología', N'Especialidad dedicada a la prevención y tratamientos, tanto médicos como quirúrgicos, de todo lo relacionado al ojo y sus anexos (párpados, vías lagrimales, órbita, etc.) como: miopía, astigmatismo, hipermetropía, cataratas, estrabismo, glaucoma, etc.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (39, N'Oncología', N'La oncología es la especialidad de la medicina interna que se dedica al diagnóstico y tratamiento médico del cáncer.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (40, N'Técnico Ortesista', N'El Técnico Ortesista está capacitado para desempeñarse en el área del diseño y confección de aparatos ortopédicos, adecuados a cada paciente en particular según sea la patología invalidante. Los técnicos son capaces de aplicar, en el diseño y confección de una ortesis, los conocimientos científicos, especialmente aquellos relacionados con anatomía, biomecánica, patología ortésica y rehabilitación, y las habilidades técnicas necesarias para que el diseño del aparato ortopédico sea funcional y cumpla con el objetivo de rehabilitar al paciente, siguiendo las instrucciones del profesional médico tratante.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (41, N'Ortopedia', N'Especialidad relacionada con patologías del sistema musculoesquéletico  (huesos, ligamentos, músculos, nervios y todo lo que forma la estructura del cuerpo humano), como: deformidades congénitas, problemas de crecimiento y problemas posturales, lesiones traumáticas y deportivas, lesiones neuromusculares, infecciones, tumores, artritis osteoporosis, etc.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (42, N'Otorrinolaringología', N'Especialidad relacionada a todo lo referente al oído, nariz, y laringe y sus enfermedades.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (43, N'Patología', N'Ciencia médica y especialidad práctica que estudian todos los aspectos de la enfermedad, con referencia especial a la naturaleza esencial, las causas y el desarrollo de estados anormales y también a los cambios estructurales y funcionales que resultan de los procesos de la enfermedad.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (44, N'Pediatría', N'Especialidad médica que se ocupa del estudio y tratamiento de los niños en estado de salud y enfermedad durante su desarrollo, desde el nacimiento hasta la adolescencia.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (45, N'Perinatología', N'Subespecialidad de la obstetricia que se ocupa del cuidado de la madre y el feto durante la gestación, el parto y el alumbramiento, en particular cuando la madre y/o el feto están enfermos o corren riesgo de estarlo.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (46, N'Audiología, foniatría', N'Manejo médico de la voz y la audición (detección, prevención de patología del lenguaje y la audición).')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (47, N'Proctología', N'Especialidad quirúrgica que se ocupa del ano y recto, y sus enfermedades.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (48, N'Psicología', N'Disciplina académica y ciencia que se ocupa de la conducta del hombre y los animales, y de los procesos mentales y fisiológicos relacionados con ella.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (49, N'Psiquiatría', N'Medicina psiquiátrica. Especialidad médica que se ocupa de los trastornos mentales. Diagnóstico y tratamiento de las enfermedades mentales.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (50, N'Quiropraxia', N'Sistema de curación, fundado en que las enfermedades reconocen por causas un trastorno del sistema nervioso y se corrigen por la manipulación de los órganos, especialmente reducción manual de subluxaciones vertebrales.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (51, N'Radiología', N'Realización e interpretación de estudio de imagen como rayos x y tomografías.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (52, N'Radioterapia', N'Radioactividad dirigida y controlada contra el cáncer.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (53, N'Rehabilitación pulmonar', N'Programa para personas con enfermedades pulmonares crónicas como: enfisema, bronquitis crónica, asma, bronquiectasia y enfermedad intersticial pulmonar. La mayoría de los programas de rehabilitación pulmonar incluyen control médico, educación, apoyo emocional, ejercicio, re-entrenamiento respiratorio y terapia de nutrición.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (54, N'Reumatología', N'Especialidad que tiene relación con los problemas músculo-esquelético (músculos, huesos, columna vertebral, etc) de predominio en las articulaciones. Además enfermedades de tejido conjuntivo como: Lupus Eritematoso Sistémico, Dermatomiositis, Polimiositis, Esclerodemia, Síndrome de Sjögren, Vasculitis, etc.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (55, N'Traumatología y ortopedia', N'Manejo médico y quirúrgico de pacientes con enfermedades o lesiones en las articulaciones huesos y músculos.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (56, N'Traumatología deportiva', N'Manejo médico y quirúrgico de pacientes con lesiones de todo tipo, relacionadas con el la actividad física (deportistas).')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (57, N'Bariatría', N'Manejo médico farmacológico de pacientes con sobrepeso.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (58, N'Urología', N'Manejo médico y quirúrgico de las enfermedades de riñones, ureteros, próstata, vejiga y uretra')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (59, N'Cardiología', N'Estudia el corazón, sus funciones y patologías. Una de sus funciones es la de prevenir problemas futuros en pacientes con alto riesgo de enfermedades cardiacas. La otra, es la de ayudar a solucionar los problemas de salud a aquellos pacientes que ya tienen o han tenido problemas cardiacos de gravedad, como un infarto al miocardio, hipertensión, insuficiencia cardiaca, etc.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (60, N'Cirugía plática y reconstructiva', N'La Cirugía Reconstructiva; dedicada a preservar la integridad y funcionalidad de diversas estructuras de cuerpo, lo mismo se encarga de reconstruir un labio leporino (hendido), una glándula mamaria extirpada por cáncer o una mano severamente traumatizada. La Cirugía Estética o Cosmética; tienen como objetivo, mejorar y mantener en forma óptima las diversas características de la cara y el cuerpo, dentro de un contexto de imagen y armonía, individualizado para cada paciente.')
INSERT [dbo].[especialidad] ([ID], [descripcion], [notas]) VALUES (61, N'Coloproctología', N'Manejo médico de todo lo relacionado con el colon y el recto.')
SET IDENTITY_INSERT [dbo].[especialidad] OFF
SET IDENTITY_INSERT [dbo].[estatusM] ON 

INSERT [dbo].[estatusM] ([id], [code], [tabla], [descripcion]) VALUES (1, N'Pag', N'ventas', N'Pagado')
INSERT [dbo].[estatusM] ([id], [code], [tabla], [descripcion]) VALUES (2, N'Sal', N'ventas', N'Saldado')
INSERT [dbo].[estatusM] ([id], [code], [tabla], [descripcion]) VALUES (3, N'Pend', N'ventas', N'Pendiente de Pago')
INSERT [dbo].[estatusM] ([id], [code], [tabla], [descripcion]) VALUES (4, N'CxC', N'ventas', N'Pendiente de Pago (CxC)')
INSERT [dbo].[estatusM] ([id], [code], [tabla], [descripcion]) VALUES (5, N'Ex', N'ventas', N'Exonerado')
INSERT [dbo].[estatusM] ([id], [code], [tabla], [descripcion]) VALUES (7, N'TC', N'ventas', N'Pagado con Tarjeta de Credito')
INSERT [dbo].[estatusM] ([id], [code], [tabla], [descripcion]) VALUES (8, N'Ab', N'ventas', N'Abonado')
SET IDENTITY_INSERT [dbo].[estatusM] OFF
SET IDENTITY_INSERT [dbo].[farmacos] ON 

INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (1, NULL, NULL, N'jabon de arcilla', N'jabon antialergico', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (2, NULL, NULL, N'jabon B33', N'jabon antibacterial', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (3, NULL, NULL, N'AMOXICILINA + AMBROXOL', N'AMOXICILINA +AMBROXOL ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (4, NULL, NULL, N'complejo b', N'complejo b', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (5, NULL, NULL, N'ambroxol', N'Ambroxol', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (6, NULL, NULL, N'acetaminofen', N'acetaminofen', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (7, NULL, NULL, N'colenta', N'getamicina', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (8, NULL, NULL, N'VITAMINA A', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (9, NULL, NULL, N'GENCLOBEN CREMA', N'gentamicina-clotrimazol-betametazona', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (10, NULL, NULL, N'antigripal', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (11, NULL, NULL, N'cefalexina', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (12, NULL, NULL, N'metronidazol + nistatina', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (13, NULL, NULL, N'doloneuroalfa', N'diclofenac +vitaminas b', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (14, NULL, NULL, N'atenolol', N'atenolol', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (15, NULL, NULL, N'fendramin', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (16, NULL, NULL, N'clotrimazol', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (17, NULL, NULL, N'omeprazol', N'omeprazol', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (18, NULL, NULL, N'vitamina c', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (19, NULL, NULL, N'trimetropin', N'trimetropin + sulfa', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (20, NULL, NULL, N'amoxicilina', N'amoxicilina', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (21, NULL, NULL, N'fisionazal', N'solucion salina', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (22, NULL, NULL, N'acetaminofen', N'acetaminofen', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (23, NULL, NULL, N'propanolol', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (24, NULL, NULL, N'calcio', N'calcio', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (25, NULL, NULL, N'gentamicina', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (26, NULL, NULL, N'VITAMINA E', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (27, NULL, NULL, N'suero oral', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (28, NULL, NULL, N'sulfato  ferroso', N'hierro', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (29, NULL, NULL, N'acido folico', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (30, NULL, NULL, N'perlas de aceite de higado de bacalao', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (31, NULL, NULL, N'clotrimazol', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (32, NULL, NULL, N'hierro vitaminado', N'hierro + vitaminas', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (33, NULL, NULL, N'loratadina', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (34, NULL, NULL, N'acido mefenamico', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (35, NULL, NULL, N'ibuprofen', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (36, NULL, NULL, N'ibuprofen', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (37, NULL, NULL, N'jabon castilla', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (38, NULL, NULL, N'jabon de avena', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (39, NULL, NULL, N'penicilina triple 6.3.3', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (40, NULL, NULL, N'penicilina procainica 4.0', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (41, NULL, NULL, N'penicilina proainica 0.4', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (42, NULL, NULL, N'penicilina benzatinica', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (43, NULL, NULL, N'penicilina procainica 2.4', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (44, NULL, NULL, N'complejo b', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (45, NULL, NULL, N'gentamicina', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (46, NULL, NULL, N'dexametasona', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (47, NULL, NULL, N'hidrocortizona', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (48, NULL, NULL, N'ranitidina', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (49, NULL, NULL, N'diclofenac', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (50, NULL, NULL, N'hierro', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (51, NULL, NULL, N'dipirona', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (52, NULL, NULL, N'dramidon', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (53, NULL, NULL, N'ampipulmin rectar pedriatico', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (54, NULL, NULL, N'ampipulmin  adultos', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (55, NULL, NULL, N'neural 25000', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (56, NULL, NULL, N'furosemida', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (57, NULL, NULL, N'hidroclorotiazida', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (58, NULL, NULL, N'dermofull', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (59, NULL, NULL, N'jabon sanasin', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (60, NULL, NULL, N'CLOTIMAZOL', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (61, NULL, NULL, N'calamina locion', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (62, NULL, NULL, N'ketoconazol', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (63, NULL, NULL, N'antialergico', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (64, NULL, NULL, N'ergovidon', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (65, NULL, NULL, N'hierro dextrado', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (66, NULL, NULL, N'locion lindano', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (67, NULL, NULL, N'jabon germicida', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (68, NULL, NULL, N'jabon de azufre', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (69, NULL, NULL, N'diclofenac', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (70, NULL, NULL, N'nistatina', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (71, NULL, NULL, N'fluconazol', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (72, NULL, NULL, N'acetaminofen', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (73, NULL, NULL, N'diclofenac', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (74, NULL, NULL, N'glicerina', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (75, NULL, NULL, N'albendazol', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (76, NULL, NULL, N'mebendazol', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (77, NULL, NULL, N'amoxicilina', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (78, NULL, NULL, N'amoxicilina con ambrozol', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (79, NULL, NULL, N'lasurtin d', N'antigripal ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (80, NULL, NULL, N'ANTIACIDO', N'ANTIACIDO ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (81, NULL, NULL, N'DRAMIDON', N'DIMEHIDRATO ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (82, NULL, NULL, N'ACIDO FOLICO', N'ACIDO FOLICO', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (83, NULL, NULL, N'COMPLEJO B', N'COMPLEJO B ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (84, NULL, NULL, N'ACEITE DE HIGADO DE BACALAO', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (85, NULL, NULL, N'SALBUTAMOL', N'SALBUTAMOL', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (86, NULL, NULL, N'VITAMINA C', N'EMULCION ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (87, NULL, NULL, N'HIDRIXINA', N'ANTIALERGICO ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (88, NULL, NULL, N'CETIRIZINA', N'ANTIALERGICO ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (89, NULL, NULL, N'LUCOTUSIN', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (90, NULL, NULL, N'RABANO YODADO', N'ANTIGRIPAL ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (91, NULL, NULL, N'BROMEXINA', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (92, NULL, NULL, N'atenolol 50 mg', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (93, NULL, NULL, N'ATENOLOL 100 MG', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (94, NULL, NULL, N'HIDROCLOROTIAZIDA  50 MG', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (95, NULL, NULL, N'ENALAPRIL 10 MG', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (96, NULL, NULL, N'NIFEDIPINA 10 MG', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (97, NULL, NULL, N'NIFEDIPINA 20 MG', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (98, NULL, NULL, N'ENALAPRIL 20MG', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (99, NULL, NULL, N'FUROSEMIDA 40MG', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (100, NULL, NULL, N'PROPANOLOL 40MG', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (101, NULL, NULL, N'GLIBENCLAMIDA 5M', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (102, NULL, NULL, N'METOCLPRAMIDA 10MG', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (103, NULL, NULL, N'LISINOPPRIL 20MG', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (104, NULL, NULL, N'LISINOPRIL 10MG', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (105, NULL, NULL, N'ANLODIPINA 10MG', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (106, NULL, NULL, N'ANLODIPINA 5MG', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (107, NULL, NULL, N'ASPIRINA 81MG', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (108, NULL, NULL, N'albendazol 400mg', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (109, NULL, NULL, N'suero oral', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (110, NULL, NULL, N'dramidon  50mg', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (111, NULL, NULL, N'frutadex', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (112, NULL, NULL, N'amoxicilina 500mg', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (113, NULL, NULL, N'cefalexina 500mg', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (114, NULL, NULL, N'ampicilia 500mg', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (115, NULL, NULL, N'trimetropin 800mg', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (116, NULL, NULL, N'ERITROMICINA 500MG', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (117, NULL, NULL, N'CIPROFLOXACINA 500MG', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (118, NULL, NULL, N'METRONIDAZOL 500MG', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (119, NULL, NULL, N'CLORANFENICOL 500', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (120, NULL, NULL, N'MEBENDAZOL 100MG', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (121, NULL, NULL, N'OTOCARE AL 1%', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (122, NULL, NULL, N'COOL EYES', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (123, NULL, NULL, N'MAXIPORIN GOTAS OFTALMICAS', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (124, NULL, NULL, N'optichlor gotas oftalmicas', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (125, NULL, NULL, N'HIDROCLOROTIAZIDA 25 MG', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[farmacos] ([ID], [presentacionID], [laboratorioID], [nombreComercial], [nombrePopular], [principioActivo], [indicaciones], [dosis], [notas], [precio], [stock], [status]) VALUES (126, NULL, NULL, N'ERITOMICIA SUSPENCION', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[farmacos] OFF
SET IDENTITY_INSERT [dbo].[grupoSanguineo] ON 

INSERT [dbo].[grupoSanguineo] ([ID], [nombre], [notas]) VALUES (1, N'O+', N'Esta es la mas abundante')
INSERT [dbo].[grupoSanguineo] ([ID], [nombre], [notas]) VALUES (2, N'A+', N'Esta tambien es muy abundante')
INSERT [dbo].[grupoSanguineo] ([ID], [nombre], [notas]) VALUES (3, N'B+', N'No es tan escasa')
INSERT [dbo].[grupoSanguineo] ([ID], [nombre], [notas]) VALUES (4, N'AB+', N'Esta es muy escasa')
INSERT [dbo].[grupoSanguineo] ([ID], [nombre], [notas]) VALUES (5, N'O-', N'Un poco escasa')
INSERT [dbo].[grupoSanguineo] ([ID], [nombre], [notas]) VALUES (6, N'A-', N'Muy escasa')
INSERT [dbo].[grupoSanguineo] ([ID], [nombre], [notas]) VALUES (7, N'B-', N'Bastante escasa')
INSERT [dbo].[grupoSanguineo] ([ID], [nombre], [notas]) VALUES (8, N'AB-', N'Sumamente escasa')
INSERT [dbo].[grupoSanguineo] ([ID], [nombre], [notas]) VALUES (9, N'Desconocido', N'En caso de que desconoscamos su tipo sanguineo')
SET IDENTITY_INSERT [dbo].[grupoSanguineo] OFF
SET IDENTITY_INSERT [dbo].[hAnestesica] ON 

INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (1, 6, 1, N'0', N'RadioButtonList1')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (2, 6, 1, N'0', N'RadioButtonList2')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (3, 8, 1, N'-1', N'RadioButtonList14')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (4, 8, 1, N'-1', N'RadioButtonList13')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (5, 8, 1, N'-1', N'RadioButtonList15')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (6, 8, 1, N'-1', N'RadioButtonList16')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (7, 8, 1, N'-1', N'RadioButtonList18')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (8, 8, 1, N'-1', N'RadioButtonList19')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (9, 8, 1, N'False', N'Angina  ')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (10, 8, 1, N'False', N'HTA Esencial  ')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (11, 8, 1, N'', N'txthistoriaquirurgica')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (12, 8, 1, N'', N'ddlsintomasnocardioactuales')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (13, 8, 1, N'', N'txtobservacionesiam')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (14, 8, 1, N'', N'txtcardiootros')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (15, 8, 1, N'', N'txtbd')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (16, 8, 1, N'', N'txtbi')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (17, 8, 1, N'', N'txtfc')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (18, 8, 1, N'', N'txtfr')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (19, 8, 1, N'', N'txtpesoarterial')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (20, 8, 1, N'', N'txttalla')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (21, 8, 1, N'', N'txtimcarterial')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (22, 8, 1, N'', N'txtspo2')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (23, 8, 1, N'', N'txtritmo')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (24, 8, 1, N'', N'txtelectrofc')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (25, 8, 1, N'', N'txtelectrop')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (26, 8, 1, N'', N'txtelectropr')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (27, 8, 1, N'', N'txtelectroqrs')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (28, 8, 1, N'', N'txtElectroqt')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (29, 8, 1, N'', N'txtaqrs')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (30, 8, 1, N'', N'txtbloqueosav')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (31, 8, 1, N'', N'txtbloqueosderama')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (32, 8, 1, N'', N'txtextrasistoles')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (33, 8, 1, N'', N'txtbradicardia')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (34, 8, 1, N'', N'txttaquicardia')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (35, 8, 1, N'', N'txtondasq')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (36, 8, 1, N'', N'txtondast')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (37, 8, 1, N'', N'txthipertrofia')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (38, 8, 1, N'', N'txtconclusionesyrecomendaciones')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (39, 8, 1, N'', N'txtotraspatologias')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (40, 8, 1, N'', N'txtpatologiascardio')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (41, 8, 1, N'', N'txtconclucioncardio')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (42, 8, 1, N'', N'txtantecedentesanestesicos')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (43, 8, 1, N'-1', N'rdoantecedentesfamiliares')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (44, 8, 1, N'-1', N'rdoiam')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (45, 8, 1, N'-1', N'RadioButtonList1')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (46, 8, 1, N'-1', N'RadioButtonList2')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (47, 8, 1, N'-1', N'RadioButtonList3')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (48, 8, 1, N'-1', N'RadioButtonList4')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (49, 8, 1, N'-1', N'RadioButtonList5')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (50, 8, 1, N'-1', N'RadioButtonList6')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (51, 8, 1, N'-1', N'RadioButtonList7')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (52, 8, 1, N'-1', N'RadioButtonList8')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (53, 8, 1, N'-1', N'RadioButtonList9')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (54, 8, 1, N'-1', N'RadioButtonList10')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (55, 8, 1, N'-1', N'RadioButtonList11')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (56, 8, 1, N'-1', N'RadioButtonList12')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (57, 8, 1, N'', N'txtotroshistoria')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (58, 8, 1, N'', N'txtmedicamentos')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (59, 8, 1, N'', N'txtanestesiaotros')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (60, 8, 1, N'', N'txtfechaoperacion')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (61, 8, 1, N'', N'txthora')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (62, 8, 1, N'', N'txtmanejopreguntas')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (63, 8, 1, N'', N'txtriesgos')
INSERT [dbo].[hAnestesica] ([ID], [ConsultaID], [hAnestesicaMID], [valor], [controlid]) VALUES (64, 8, 1, N'', N'txtpreferencias')
SET IDENTITY_INSERT [dbo].[hAnestesica] OFF
SET IDENTITY_INSERT [dbo].[hAnestesicaM] ON 

INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (1, N'Diagnostico de la Enfermedad Quirurgica', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (2, N'Procedimiento Quirurgico a Realizarse', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (3, N'Sintomas no Cardiovasculares Actuales', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (4, N'Historia Quirurgica', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (5, N'Antecedentes Anestesicos', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (6, N'Familiares con Reaccion Abversas a la Anestesia', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (7, N'Alergias', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (8, N'Historia Previa', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (9, N'Medicamentos Actuales', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (10, N'IAM', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (11, N'Observaciones Cardiovasculares', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (12, N'Afecciones Cardiovasculares Encontradas', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (14, N'Cuello', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (15, N'Peso', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (16, N'9999999999999', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (17, N'Corazon', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (18, N'Torax', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (19, N'Abdomen', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (20, N'Pulmones', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (21, N'Extremidades Superiores', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (22, N'Extremidades Inferiores', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (23, N'Vias Respiratorias', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (24, N'Apertura Bucal', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (25, N'Mallampati', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (26, N'Movimiento temporo-mandibular', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (27, N'Distancia Tiromentoniana', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (28, N'Distancia Esternomentoniana', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (29, N'Arco de Flexion', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (30, N'Extencion Atlanto-Occipital', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (31, N'Patologias Cardiovasculares Detectadas', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (32, N'Otras Patologias', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (33, N'Conclucion', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (34, N'ASA', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (35, N'Metodo Anestesico', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (36, N'Consultado con el Paciente', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (37, N'Consideraciones y/o instrucciones especiales', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (38, N'Preferencias del paciente/preocupaciones', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (39, N'Riesgos, beneficios y alternativas discutidas', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (40, N'Manejo del dolor discutido/preguntas contestadas', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (41, N'Fecha Operacion', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (42, N'Hora Operacion', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (43, N'Recomendaciones Finales', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (44, N'Tencion Arterial', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (45, N'BD', N'mmhg', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (46, N'BI', N'mmHg', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (47, N'FC', N'lat/min', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (48, N'FR', N'resp/min', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (49, N'Peso Arterial', N'', N'kg')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (50, N'Talla', N'cms', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (51, N'IMC', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (52, N'SPO2', N'%', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (53, N'Electrocardiograma', N'%', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (54, N'Ritmo', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (55, N'FC Electro', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (56, N'P', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (57, N'PR', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (58, N'QRS', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (59, N'QT', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (60, N'AQRS', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (61, N'Ondas Q', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (62, N'Ondas T', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (63, N'Extrasistoles', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (64, N'Bradicardia S', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (65, N'Taquicardia S', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (66, N'Hipertrofia', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (67, N'Bloqueos AV', N'', N'doctora')
INSERT [dbo].[hAnestesicaM] ([ID], [Nombre], [ValRef], [autor]) VALUES (68, N'Bloqueos Rama', N'', N'doctora')
SET IDENTITY_INSERT [dbo].[hAnestesicaM] OFF
SET IDENTITY_INSERT [dbo].[hGinecologica] ON 

INSERT [dbo].[hGinecologica] ([id], [pacienteID], [consultaID], [fecha], [observaciones], [menarquia], [pubarquia], [telarquia], [fum], [patronmens], [dismenorrea], [primerarelacion], [relsemana], [nocompaneros], [tiempocasada], [usoactual], [usopasado], [oral], [div], [debarrera], [norplat], [gestas], [partos], [cesareas], [abortos], [hijosvivos], [hijosprematuros], [natimuertos], [fecultimoparto], [forceps], [nohijosprem], [reslab]) VALUES (1, 43, NULL, CAST(N'2016-06-26' AS Date), N'', N'111111111111111', N'222222222222', N'', CAST(N'0001-01-01' AS Date), N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', NULL, N'', N'', N'', NULL, NULL)
INSERT [dbo].[hGinecologica] ([id], [pacienteID], [consultaID], [fecha], [observaciones], [menarquia], [pubarquia], [telarquia], [fum], [patronmens], [dismenorrea], [primerarelacion], [relsemana], [nocompaneros], [tiempocasada], [usoactual], [usopasado], [oral], [div], [debarrera], [norplat], [gestas], [partos], [cesareas], [abortos], [hijosvivos], [hijosprematuros], [natimuertos], [fecultimoparto], [forceps], [nohijosprem], [reslab]) VALUES (2, 43, NULL, CAST(N'2016-07-12' AS Date), N'uuuuuuuuuuuuuu', N'jjjjjjjjjjjjjjj,,,,,,,,,,,,,,,,,,,', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', NULL, N'', N'', N'', NULL, NULL)
INSERT [dbo].[hGinecologica] ([id], [pacienteID], [consultaID], [fecha], [observaciones], [menarquia], [pubarquia], [telarquia], [fum], [patronmens], [dismenorrea], [primerarelacion], [relsemana], [nocompaneros], [tiempocasada], [usoactual], [usopasado], [oral], [div], [debarrera], [norplat], [gestas], [partos], [cesareas], [abortos], [hijosvivos], [hijosprematuros], [natimuertos], [fecultimoparto], [forceps], [nohijosprem], [reslab]) VALUES (1002, 49, NULL, CAST(N'2016-07-22' AS Date), N'9999999', N'99999999999999', N'999999999', N'999999', NULL, N'99999999', N'9999999999', N'999999', N'9999999', N'99999999', N'99999999', N'9999999999', N'99999', N'9999', N'999', N'999999', N'9999999', N'99999999', N'999999', N'99999', N'9999', N'999999', NULL, N'99999999', N'999999', N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[hGinecologica] OFF
SET IDENTITY_INSERT [dbo].[historiaM] ON 

INSERT [dbo].[historiaM] ([ID], [Nombre], [autor]) VALUES (1, N'Historia Anestesica', N'doctora')
INSERT [dbo].[historiaM] ([ID], [Nombre], [autor]) VALUES (2, N'Historia Estudios', NULL)
INSERT [dbo].[historiaM] ([ID], [Nombre], [autor]) VALUES (3, N'Historia Farmacologica', NULL)
INSERT [dbo].[historiaM] ([ID], [Nombre], [autor]) VALUES (4, N'Historia Obstetrica', N'obs')
INSERT [dbo].[historiaM] ([ID], [Nombre], [autor]) VALUES (5, N'Historia Padecimientos', NULL)
INSERT [dbo].[historiaM] ([ID], [Nombre], [autor]) VALUES (6, N'Historia Pruebas', NULL)
SET IDENTITY_INSERT [dbo].[historiaM] OFF
SET IDENTITY_INSERT [dbo].[HistoriaObstetricia] ON 

INSERT [dbo].[HistoriaObstetricia] ([id], [pacienteID], [autor], [fecha], [sintomas], [observaciones], [fecultima], [tbcfamiliar], [diabetesfamiliar], [hipertencionfamiliar], [preeclamsiafamiliar], [eclampsiafamiliar], [otracondicionfamiliar], [tbcpeint], [nal], [diabetespersonal], [hipertencionpersonal], [preeclamsiapersonal], [eclampsiapersonal], [otracondicionpersonal], [cirugiagenitourinaria], [infertilidad], [cardiopatia], [nefropatia], [violencia], [v076], [ultimoprevio], [ultimopreviovalor], [gemelares], [gestasprevias], [ectopico], [abortos], [partos], [vaginales], [cesarea], [vivos], [muertos], [viven], [m1semana], [d1semana], [menos1anio], [fecembarazoanterior], [planeado], [fracasometodo], [pesoant], [talla], [fumfec], [fpp], [fum], [eco20s], [fuma1er], [fuma2do], [fuma3er], [fumapas1er], [fumapas2do], [fumapas3er], [drogas1er], [drogas2do], [drogas3er], [alcohol1er], [alcohol2do], [alcohol3er], [vd1er], [vd2do], [vd3er], [antirubeola], [antitetanica], [dosis1], [dosis2], [odont], [mamas], [inspvisual], [pap], [colp], [sangre], [rh], [inmuniz], [globulina], [toxomenor], [toxomayor], [consultalgm], [glucemiamenorvalor], [glucemiamayorvalor], [glucemiamenor], [glucemiamayor], [chagas], [paludismo], [bacteriuriamenor], [bacteriuriamayor], [hbvalor], [hb], [fe], [folatos], [hbmayor], [hbmayorvalor], [estretococo], [prepparto], [lactancia], [semsolicitadamenor], [pruebaresultmenot], [tarvmenor], [semsolicitadamayor], [pruebaresultmayor], [tarvmayor], [sifilispruebamenor], [sifilispruebamenorvalor], [sifilispruebamayorvalor], [sifilispruebamayor], [treponemicamenor], [treponemicamayor], [treponemicamenorvalor], [treponemicamayorvalor], [tratamientomenor], [tratamientomayor], [tratamientomenorvalor], [tratamientomayorvalor], [tipparejamenor], [tipparejamayor], [fecconsulta1], [fecconsulta2], [fecconsulta3], [fecconsulta4], [fecconsulta5], [edadgestal1], [edadgestal2], [edadgestal3], [edadgestal4], [edadgestal5], [peso1], [peso2], [peso3], [peso4], [peso5], [pa1], [pa2], [pa3], [pa4], [pa5], [altuterina1], [altuterina2], [altuterina3], [altuterina4], [altuterina5], [presentacion1], [presentacion2], [presentacion3], [presentacion4], [presentacion5], [fcf1], [fcf2], [fcf3], [fcf4], [fcf5], [movimfetales1], [movimfetales2], [movimfetales3], [movimfetales4], [movimfetales5], [protei1], [protei2], [protei3], [protei4], [protei5], [signos1], [signos2], [signos3], [signos4], [signos5], [ncjp1], [ncjp2], [ncjp3], [ncjp4], [ncjp5], [proxcita1], [proxcita2], [proxcita3], [proxcita4], [proxcita5], [partoaborto], [fecingreso], [consultastotal], [diashospitaliz], [corticoides], [semanainicio], [inicio], [roturas], [fechamembrana], [horamembrana], [roturamayor], [roturahs], [roturagrados], [semanasgestal], [diasgestal], [porfumgestal], [porecogestal], [cefalica], [pelviana], [transversa], [tamanofetal], [acompanantetdp], [acompanantep], [vivomuerto], [momento], [horanacido], [fechanacido], [ordennacimiento], [terminacion], [indicacionesparto], [ocitocicos], [antibiot], [analgesia], [anestlocal], [anestregion], [anestgral], [transfusion], [otrosmedicacion], [otrosmedicacionvalor], [posicion], [episiotomia], [desgarros], [desgarrosvalor], [ocitocitospre], [ocitocitospost], [placentacompleta], [placentaretenida], [ligadura], [htaprevia], [htainducida], [preeclampsia], [cardiopatiaenf], [nefropatiaenf], [diabetes], [infecurinaria], [infectovular], [amenazaparto], [rciu], [roturaprem], [anemia], [otracondgrave], [hemorragia1], [hemorragia2], [hemorraria3], [hemorragiapost], [infectpuerperal], [pruebasifilis], [prueba076], [tarv], [sexo], [peso], [pcefalico], [longitud], [edadgestacionalsem], [edadgestacionaldias], [edadgestacional], [pesoeg], [apgar], [defectos], [estimulac], [aspiracion], [mascara], [oxigeno], [tubo], [fallece], [refereido], [fecprox]) VALUES (1, 43, N'obs', NULL, NULL, N'', NULL, -1, 0, -1, -1, -1, -1, NULL, NULL, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, N'', N'', N'', N'', N'', N'', N'', N'', NULL, N'', N'', 0, N'', -1, -1, N'', N'', NULL, NULL, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, N'', N'', -1, -1, -1, -1, -1, N'', -1, -1, -1, -1, -1, -1, N'', N'', 0, 0, -1, -1, -1, -1, 0, N'', -1, -1, N'', 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, N'', N'', -1, -1, -1, N'', N'', -1, -1, N'', N'', -1, -1, N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', -1, N'', N'', N'', -1, N'', -1, -1, N'', N'', 0, 0, 0, N'', N'', 0, 0, 0, 0, 0, -1, -1, -1, -1, -1, N'', N'', N'', -1, N'', -1, -1, -1, -1, -1, -1, -1, -1, N'', -1, -1, -1, N'', -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, N'', N'', N'', N'', N'', -1, -1, N'', -1, -1, -1, NULL, -1, -1, -1, -1, NULL)
SET IDENTITY_INSERT [dbo].[HistoriaObstetricia] OFF
SET IDENTITY_INSERT [dbo].[hObstetrica] ON 

INSERT [dbo].[hObstetrica] ([id], [pacienteID], [consultaID], [fecha], [alergias], [testdecoombs], [app], [fum], [fpp], [ultimopap], [primeratt], [segundatt], [hb], [vdrl], [falsemia], [plaq], [hbsag], [electroforesis], [glicemia], [hvc], [detecciondmg], [orina], [hiv], [manurezpulmonar], [observaciones], [nohijosprem], [reslab]) VALUES (1, 43, NULL, CAST(N'2016-06-20' AS Date), N'', N'', N'', N'1/1/0001 12:00:00 a. m.', N'', N'gfgfg', N'fgfg', N'', N'ffgf', N'fg', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'ghhhhhhhhhhhhhhh', NULL, NULL)
INSERT [dbo].[hObstetrica] ([id], [pacienteID], [consultaID], [fecha], [alergias], [testdecoombs], [app], [fum], [fpp], [ultimopap], [primeratt], [segundatt], [hb], [vdrl], [falsemia], [plaq], [hbsag], [electroforesis], [glicemia], [hvc], [detecciondmg], [orina], [hiv], [manurezpulmonar], [observaciones], [nohijosprem], [reslab]) VALUES (2, 43, NULL, CAST(N'2016-06-20' AS Date), N'cddddddddddddddddddd', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', NULL, NULL)
INSERT [dbo].[hObstetrica] ([id], [pacienteID], [consultaID], [fecha], [alergias], [testdecoombs], [app], [fum], [fpp], [ultimopap], [primeratt], [segundatt], [hb], [vdrl], [falsemia], [plaq], [hbsag], [electroforesis], [glicemia], [hvc], [detecciondmg], [orina], [hiv], [manurezpulmonar], [observaciones], [nohijosprem], [reslab]) VALUES (3, 43, NULL, CAST(N'2016-07-11' AS Date), N'', N'', N'', N'5/7/2016 12:00:00 a. m.', N'12/4/2017 12:00:00 a. m.', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', NULL, NULL)
INSERT [dbo].[hObstetrica] ([id], [pacienteID], [consultaID], [fecha], [alergias], [testdecoombs], [app], [fum], [fpp], [ultimopap], [primeratt], [segundatt], [hb], [vdrl], [falsemia], [plaq], [hbsag], [electroforesis], [glicemia], [hvc], [detecciondmg], [orina], [hiv], [manurezpulmonar], [observaciones], [nohijosprem], [reslab]) VALUES (4, 49, NULL, CAST(N'2016-07-22' AS Date), N'sddddddddd', N'sddddddd', N'', N'05/07/2016', N'12/4/2017 12:00:00 a. m.', N'', N'', N'', N'sdsd', N'', N'sdsd', N'', N'', N'ssd', N'ds', N'', N'sdds', N'', N'sds', N'', N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[hObstetrica] OFF
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'A00', N'Colera', N'Cholera')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'A000', N'Colera Debido A Vibrio Cholerae O1, Biotipo Cholerae', N'Cholera Vibrio cholerae Due to O1, biotype cholerae')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'A001', N'Colera Debido A Vibrio Cholerae O1, Biotipo El Tor', N'Cholera Vibrio cholerae Due to O1, biotype El Tor')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'A009', N'Colera No Especificado', N'Cholera Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'A01', N'Fiebres Tifoidea Y Paratifoidea', N'Typhoid and paratyphoid fevers')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'B007', N'Enfermedad Herpetica Diseminada', N'Disseminated herpetic disease')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'B008', N'Otras Formas De Infecciones Herpeticas', N'Other Ways to herpetic infections')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'B009', N'Infeccion Debida A El Virus Del Herpes, No Especificada', N'Infection Due To The Herpes Virus, Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'B01', N'Varicela', N'Varicella')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'B010*', N'Meningitis Debida A La Varicela (G02.0*)', N'Meningitis Due to Chickenpox (G02.0 *)')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'B011*', N'Encefalitis Debida A La Varicela (G05.1*)', N'Encephalitis Due to Chickenpox (G05.1 *)')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'B012*', N'Neumonia Debida A La Varicela (J17.1*)', N'Pneumonia Due to Chickenpox (J17.1 *)')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'B018', N'Varicela Con Otras Complicaciones', N'Chickenpox With Other Complications')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'B019', N'Varicela Sin Complicaciones', N'Chickenpox Without Complications')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'B02', N'Herpes Zoster', N'Herpes Zoster')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'B020*', N'Encefalitis Debida A Herpes Zoster (G05.1*)', N'Encephalitis Due to Herpes Zoster (G05.1 *)')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'B021*', N'Meningitis Debida A Herpes Zoster (G02.0*)', N'Meningitis Due to Herpes Zoster (G02.0 *)')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'B022*', N'Herpes Zoster Con Otros Compromisos Del Sistema Nervioso', N'Herpes Zoster With Other Commitments Nervous System')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'C081', N'Tumor Maligno De La Glandula Sublingual', N'Malignant Of Sublingual Gland')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'C088', N'Lesion De Sitios Contiguos De Las Glandulas Salivales Mayores', N'Contiguous sites Lesion Of Salivary Glands Of Seniors')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'C089', N'Tumor Maligno De Glandula Salival Mayor, No Especificada', N'Malignant Salivary Gland From Mayor, Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'C09', N'Tumor Maligno De La Amigdala', N'Malignant Tonsil')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'C090', N'Tumor Maligno De La Fosa Amigdalina', N'Malignant Amygdalin From the Pit')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'C091', N'Tumor Maligno Del Pilar Amigdalino (Anterior) (Posterior)', N'Malignant tonsillar Del Pilar (Previous) (Next)')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'C098', N'Lesion De Sitios Contiguos De La Amigdala', N'Contiguous sites Lesion Of Tonsil')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'C099', N'Tumor Maligno De La Amigdala, Parte No Especificada', N'Malignant tonsil, unspecified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'C10', N'Tumor Maligno De La Orofaringe', N'Malignant Tumor Of The Oropharynx')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'C100', N'Tumor Maligno De La Valecula', N'Malignant From the vallecula')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'D174', N'Tumor Benigno Lipomatoso De Los Organos Intratoracicos', N'Tumor Benign lipomatous Of intrathoracic organs')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'D175', N'Tumor Benigno Lipomatoso De Los Organos Intraabdominales', N'Tumor Benign lipomatous Of Intraabdominal Organs')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'D176', N'Tumor Benigno Lipomatoso Del Cordon Espermatico', N'Benign lipomatous neoplasm spermatic cord')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'D177', N'Tumor Benigno Lipomatoso De Otros Sitios Especificados', N'Benign lipomatous neoplasm of other specified sites')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'D179', N'Tumor Benigno Lipomatoso, De Sitio No Especificado', N'Benign lipomatous neoplasm, site unspecified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'E123*', N'Diabetes Mellitus Asociada Con Desnutricion Con Complicaciones Oftalmicas', N'Diabetes Mellitus Associated With Malnutrition With Ophthalmic Complications')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'E124*', N'Diabetes Mellitus Asociada Con Desnutricion Con Complicaciones Neurologicas', N'Diabetes Mellitus Associated With Malnutrition With Neurological Complications')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'E125', N'Diabetes Mellitus Asociada Con Desnutricion Con Complicaciones Circulatorias Perifericas', N'Diabetes Mellitus Associated With Malnutrition Complications With Peripheral Circulatory')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'E126', N'Diabetes Mellitus Asociada Con Desnutricion Con Otras Complicaciones Especificadas', N'Diabetes Mellitus Associated With Malnutrition With Other Specified Complications')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'E127', N'Diabetes Mellitus Asociada Con Desnutricion Con Complicaciones Multiples', N'Diabetes Mellitus Associated With Malnutrition With Multiple Complications')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'E128', N'Diabetes Mellitus Asociada Con Desnutricion Con Complicaciones No Especificadas', N'Diabetes Mellitus Associated With Malnutrition with Complications Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'F070', N'Trastorno De La Personalidad, Organico', N'Personality Disorder, Organic')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'F071', N'Sindrome Postencefalitico', N'Postencephalitic syndrome')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'F072', N'Sindrome Postconcusional', N'Postconcusional Syndrome')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'F078', N'Otros Trastornos Organicos De La Personalidad Y Del Comportamiento Debidos A Enfermedad, Lesion Y Disfuncion Cerebrales', N'Other Organic Disorders Personality And Behavior Due To Illness, Injury and Brain Dysfunction')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'F079', N'Trastorno Organico De La Personalidad Y Del Comportamiento, No Especificado, Debido A Enfermedad, Lesion Y Disfuncion Cerebral', N'Organic Personality Disorder and Behavior, Not Specified, Due To Illness, Injury and Brain Dysfunction')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'F09', N'Trastorno Mental Organico O Sintomatico, No Especificado', N'Organic Mental Disorder Symptomatic O, Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'F10', N'Trastornos Mentales Y Del Comportamiento Debidos Al Uso Del Alcohol', N'Behavioral and Mental Disorders Due To Alcohol Use')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'F100', N'Trastornos Mentales Y Del Comportamiento Debidos Al Uso Del Alcohol: Intoxicacion Aguda', N'Behavioral and Mental Disorders Due To Alcohol Use: Acute Poisoning')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'F101', N'Trastornos Mentales Y Del Comportamiento Debidos Al Uso Del Alcohol: Uso Nocivo', N'Mental and behavioral disorders due to use Alcohol Harmful Use')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'F102', N'Trastornos Mentales Y Del Comportamiento Debidos Al Uso Del Alcohol: Sindrome De Dependencia', N'Behavioral and Mental Disorders Due To Alcohol Use: From Dependency Syndrome')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'F103', N'Trastornos Mentales Y Del Comportamiento Debidos Al Uso Del Alcohol: Estado De Abstinencia', N'Behavioral and Mental Disorders Due To Alcohol Use: State Of Abstinence')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'F104', N'Trastornos Mentales Y Del Comportamiento Debidos Al Uso Del Alcohol: Estado De Abstinencia Con Delirio', N'Mental and behavioral disorders due to use Alcohol: State Of Abstinence With Delirium')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'F105', N'Trastornos Mentales Y Del Comportamiento Debidos Al Uso Del Alcohol: Trastorno Psicotico', N'Behavioral and Mental Disorders Due To Alcohol Use: Upset Psicotico')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'F106', N'Trastornos Mentales Y Del Comportamiento Debidos Al Uso Del Alcohol: Sindrome Amnesico', N'Behavioral and Mental Disorders Due to alcohol: amnesic syndrome')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'F107', N'Trastornos Mentales Y Del Comportamiento Debidos Al Uso Del Alcohol: Trastorno Psicotico Residual Y De Comienzo Tardio', N'Mental and behavioral disorders due to use Alcohol: Residual Psicotico Disorder And Start Tardio')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'F108', N'Trastornos Mentales Y Del Comportamiento Debidos Al Uso Del Alcohol: Otros Trastornos Mentales Y Del Comportamiento', N'Mental and behavioral disorders due to use Alcohol: And Other Mental Disorders Behavioral')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'F109', N'Trastornos Mentales Y Del Comportamiento Debidos Al Uso Del Alcohol: Trastorno Mental Y Del Comportamiento, No Especificado', N'Mental and behavioral disorders due to use Alcohol: Mental and Behavioral Disorder, Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'F11', N'Trastornos Mentales Y Del Comportamiento Debidos Al Uso De Opiaceos', N'Behavioral And Mental Disorders due to use of Opiates')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'F110', N'Trastornos Mentales Y Del Comportamiento Debidos Al Uso De Opiaceos: Intoxicacion Aguda', N'Behavioral And Mental Disorders due to use of Opiates: Acute Poisoning')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'F111', N'Trastornos Mentales Y Del Comportamiento Debidos Al Uso De Opiaceos: Uso Nocivo', N'Behavioral And Mental Disorders due to use of Opiates: Harmful Use')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'F112', N'Trastornos Mentales Y Del Comportamiento Debidos Al Uso De Opiaceos: Sindrome De Dependencia', N'Behavioral And Mental Disorders due to use of Opiates: From Dependency Syndrome')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'G13*', N'Atrofias Sistemicas Que Afectan Primariamente El Sistema Nervioso Central En Enfermedades Clasificadas En Otra Parte', N'Atrophies Systemic Affecting Primarily In The Central Nervous System Diseases Classified Elsewhere')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'G130*', N'Neuromiopatia Y Neuropatia Paraneoplasica', N'Neuromuscular diseases and paraneoplastic neuropathy')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'G131*', N'Otras Atrofias Sistemicas Que Afectan El Sistema Nervioso Central En Enfermedad Neoplasica', N'Other atrophies Systemic Affecting The Central Nervous System Neoplastic Disease')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'G132*', N'Atrofia Sistemica Que Afecta Primariamente El Sistema Nervioso Central En El Mixedema (E00.1*, E03.-*)', N'Systemic Atrophy That Primarily Affect the Central Nervous System In myxedema (E00.1 * E03 -. *)')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'G138*', N'Atrofia Sistemica Que Afecta Primariamente El Sistema Nervioso Central En Otras Enfermedades Clasificadas En Otra Parte', N'Systemic Atrophy That Primarily Affect the Central Nervous System in Other Diseases Classified Elsewhere')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'G20', N'Enfermedad De Parkinson', N'Parkinson''s disease')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'G21', N'Parkinsonismo Secundario', N'Secondary Parkinsonism')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H063*', N'Otros Trastornos De La Orbita En Enfermedades Clasificadas En Otra Parte', N'Other Disorders of the orbit in Diseases Classified Elsewhere')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H10', N'Conjuntivitis', N'Conjunctivitis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H100', N'Conjuntivitis Mucopurulenta', N'Mucopurulent conjunctivitis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H101', N'Conjuntivitis Atopica Aguda', N'Atopica Acute Conjunctivitis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H102', N'Otras Conjuntivitis Agudas', N'Other Acute Conjunctivitis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H150', N'Escleritis', N'Scleritis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H151', N'Episcleritis', N'Episcleritis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H158', N'Otros Trastornos De La Esclerotica', N'Other disorders of sclera')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H159', N'Trastornos De La Esclerotica, No Especificado', N'Disorders of sclera, Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H16', N'Queratitis', N'Keratitis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H160', N'Ulcera De La Cornea', N'Corneal ulcer')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H161', N'Otras Queratitis Superficiales Sin Cunjuntivitis', N'Other Superficial Keratitis No Cunjuntivitis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H162', N'Queratoconjuntivitis', N'Keratoconjunctivitis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H163', N'Queratitis Intersticial Y Profunda', N'Interstitial keratitis And Deep')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H164', N'Neovascularizacion De La Cornea', N'Corneal neovascularization')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H168', N'Otras Queratitis', N'Other Keratitis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H169', N'Queratitis, No Especificada', N'Keratitis, Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H17', N'Opacidades Y Cicatrices Corneales', N'Corneal scars and opacities')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H170', N'Leucoma Adherente', N'Adherent Walleyes')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H171', N'Otras Opacidades Centrales De La Cornea', N'Other Central corneal opacities')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H178', N'Otras Opacidades O Cicatrices De La Cornea', N'Other opacities O Scars Of The Cornea')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H179', N'Cicatriz U Opacidad De La Cornea, No Especificada', N'Scar U corneal opacity, not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H18', N'Otros Trastornos De La Cornea', N'Other Disorders Of The Cornea')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H180', N'Pigmentaciones Y Depositos En La Cornea', N'Pigmentations And Storage In The Cornea')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H181', N'Queratopatia Vesicular', N'Vesicular keratopathy')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H182', N'Otros Edemas De La Cornea', N'Other Edema Of The Cornea')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H183', N'Cambios En Las Membranas De La Cornea', N'Changes In The Membranes Of The Cornea')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H184', N'Degeneracion De La Cornea', N'Degeneration Of The Cornea')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'H185', N'Distrofia Hereditaria De La Cornea', N'Hereditary dystrophy of the cornea')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'I12', N'Enfermedad Renal Hipertensiva', N'Hypertensive Renal Disease')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'I120', N'Enfermedad Renal Hipertensiva Con Insuficiencia Renal', N'Hypertensive Renal Disease with Renal Failure')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'I129', N'Enfermedad Renal Hipertensiva Sin Insuficiencia Renal', N'Hypertensive Renal Disease Renal Insufficiency No')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'I13', N'Enfermedad Cardiorrenal Hipertensiva', N'Cardiorenal Disease Hypertensive')
GO
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'I130', N'Enfermedad Cardiorrenal Hipertensiva Con Insuficiencia Cardiaca (Congestiva)', N'Cardiorenal Disease With Hypertensive Heart Failure (Congestive)')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'J039', N'Amigdalitis Aguda, No Especificada', N'Acute tonsillitis, Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'J04', N'Laringitis Y Traqueitis Agudas', N'Acute laryngitis and tracheitis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'J040', N'Laringitis Aguda', N'Acute Laryngitis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'J041', N'Traqueitis Aguda', N'Acute tracheitis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'J042', N'Laringotraqueitis Aguda', N'Acute laryngotracheitis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'J05', N'Laringitis Obstructiva Aguda [Crup] Y Epiglotitis', N'Acute obstructive laryngitis [croup] and epiglottitis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K031', N'Abrasion De Los Dientes', N'Abrasion Teeth')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K032', N'Erosion De Los Dientes', N'Erosion Teeth')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K033', N'Reabsorcion Patologica De Los Dientes', N'Pathological resorption Teeth')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K034', N'Hipercementosis', N'Hypercementosis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K035', N'Anquilosis Dental', N'Dental ankylosis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K036', N'Depositos [Acreciones] En Los Dientes', N'Deposits [accretions] On Teeth')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K037', N'Cambios Posteruptivos Del Color De Los Tejidos Dentales Duros', N'Posteruptivos Changes Color From Hard Dental Tissues')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K038', N'Otras Enfermedades Especificadas De Los Tejidos Duros De Los Dientes', N'Other Specified Diseases Woven Hard Teeth')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K039', N'Enfermedad No Especificada De Los Tejidos Dentales Duros', N'Not Specified Disease Of Dental Hard Tissue')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K04', N'Enfermedades De La Pulpa Y De Los Tejidos Periapicales', N'Diseases Of The Pulp And Periapical Tissues')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K040', N'Pulpitis', N'Pulpitis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K041', N'Necrosis De La Pulpa', N'Necrosis Of Flesh')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K042', N'Degeneracion De La Pulpa', N'Degeneration Of Flesh')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K043', N'Formacion Anormal De Tejido Duro En La Pulpa', N'Abnormal Tissue Training Hard In The Flesh')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K044', N'Periodontitis Apical Aguda Originada En La Pulpa', N'Acute Apical Periodontitis Originated In The Flesh')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K045', N'Periodontitis Apical Cronica', N'Chronic Apical Periodontitis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K046', N'Absceso Periapical Con Fistula', N'Periapical Abscess with Fistula')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K047', N'Absceso Periapical Sin Fistula', N'Without Periapical Abscess Fistula')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K048', N'Quiste Radicular', N'Radicular cyst')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K049', N'Otras Enfermedades Y Las No Especificadas De La Pulpa Y Del Tejido Periapical', N'Other and unspecified diseases of the pulp and Periapical Tissue')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K05', N'Gingivitis Y Enfermedades Periodontales', N'Gingivitis And Periodontal Disease')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K050', N'Gingivitis Aguda', N'Acute Gingivitis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K051', N'Gingivitis Cronica', N'Chronic Gingivitis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K052', N'Periodontitis Aguda', N'Acute Periodontitis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K053', N'Periodontitis Cronica', N'Chronic Periodontitis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K054', N'Periodontosis', N'Periodontosis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K055', N'Otras Enfermedades Periodontales', N'Other Periodontal Diseases')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'K056', N'Enfermedad De Periodonto, No Especificada', N'Periodontal Disease, Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L218', N'Otras Dermatitis Seborreicas', N'Other seborrheic dermatitis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L219', N'Dermatitis Seborreica, No Especificada', N'Seborrheic Dermatitis, Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L22', N'Dermatitis Del Panal', N'Diaper rash')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L23', N'Dermatitis Alergica De Contacto', N'Allergic Contact Dermatitis From')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L230', N'Dermatitis Alergica De Contacto Debida A Metales', N'Allergic Contact Dermatitis Due From A Metals')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L231', N'Dermatitis Alergica De Contacto Debida A Adhesivos', N'Allergic Contact Dermatitis Due A De Adhesives')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L232', N'Dermatitis Alergica De Contacto Debida A Cosmeticos', N'Allergic Contact Dermatitis Due From A Cosmetics')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L233', N'Dermatitis Alergica De Contacto Debida A Drogas En Contacto Con La Piel', N'Allergic Contact Dermatitis Due From Drugs In A Skin Contact')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L234', N'Dermatitis Alergica De Contacto Debida A Colorantes', N'Allergic Contact Dermatitis Due From A Dyes')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L235', N'Dermatitis Alergica De Contacto Debida A Otros Productos Quimicos', N'Allergic Contact Dermatitis Due From A Specialty Chemicals')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L44', N'Otros Trastornos Papuloescamosos', N'Other papulosquamous disorders')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L440', N'Pitiriasis Rubra Pilaris', N'Pityriasis Rubra Pilaris')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L441', N'Liquen Nitido', N'Lichen Nitido')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L442', N'Liquen Estriado', N'Lichen reeded')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L443', N'Liquen Rojo Moniliforme', N'Red Lichen moniliforme')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L444', N'Acrodermatitis Papular Infantil [Giannotti-Crosti]', N'Papular Acrodermatitis Children [Giannotti Crosti]')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L448', N'Otros Trastornos Palpuloescamosos Especificados', N'Other Specified Disorders Palpuloescamosos')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L449', N'Trastorno Papuloescamoso, No Especificado', N'Papulosquamous disorder, Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L45*', N'Trastornos Papuloescamosos En Enfermedades Clasificadas En Otra Parte', N'Papulosquamous disorders in diseases classified elsewhere')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L50', N'Urticaria', N'Urticaria')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L500', N'Urticaria Alergica', N'Allergic Urticaria')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L501', N'Urticaria Idiopatica', N'Idiopathic Urticaria')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L502', N'Urticaria Debida Al Calor Y Al Frio', N'Urticaria Due to heat and Frio')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L503', N'Urticaria Dermatografica', N'Urticaria Dermatografica')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L504', N'Urticaria Vibratoria', N'Vibratory Urticaria')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L505', N'Urticaria Colinergica', N'Cholinergic Urticaria')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L506', N'Urticaria Por Contacto', N'Urticaria By Contact')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L508', N'Otras Urticarias', N'Other Urticarias')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L509', N'Urticaria, No Especificada', N'Urticaria Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L51', N'Eritema Multiforme', N'Erythema Multiforme')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L510', N'Eritema Multiforme No Flictenular', N'Erythema Multiforme No phlyctenular')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L511', N'Eritema Multiforme Flictenular', N'Erythema Multiforme phlyctenular')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'L512', N'Necrolisis Epidermica Toxica [Lyell]', N'Toxic epidermal necrolysis [Lyell]')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M001', N'Artritis Y Poliartritis Neumococica', N'Pneumococcal arthritis and polyarthritis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M002', N'Artritis Y Poliartritis Estreptococicas', N'Streptococcal arthritis and polyarthritis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M008', N'Artritis Y Poliartritis Debidas A Otros Agentes Bacterianos Especificados', N'Arthritis and polyarthritis due to other Specified Bacterial Agents')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M009', N'Artritis Piogena, No Especificada', N'Pyogenic arthritis, unspecified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M01*', N'Infecciones Directas De La Articulacion En Enfermedades Infecciosas Y Parasitarias Clasificadas En Otra Parte', N'Direct Articulation Of Infections In Infectious And Parasitic Diseases Classified Elsewhere')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M010*', N'Artritis Meningococica (A39.8*)', N'Meningococcal arthritis (A39.8 *)')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M011*', N'Tuberculosa (A18.0*)', N'Tuberculous (A18.0 *)')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M012*', N'Artritis En La Enfermedad De Lyme (A69.2*)', N'Arthritis In Lyme Disease (A69.2 *)')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M013*', N'Artritis En Otras Enfermedades Bacterianas Clasificadas En Otra Parte', N'Arthritis In Other Bacterial Diseases Classified Elsewhere')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M014*', N'Artritis En Rubeola (B06.8*)', N'Arthritis In Rubella (B06.8 *)')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M015*', N'Artritis En Otras Enfermedades Virales Clasificadas En Otra Parte', N'Arthritis In Other Viral Diseases Classified Elsewhere')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M016*', N'Artritis En Micosis (B35-B49*)', N'Arthritis in mycoses (B35-B49 *)')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M018*', N'Artritis En Otras Enfermedades Infecciosas Y Parasitarias Clasificadas En Otra Parte', N'Arthritis In Other Infectious And Parasitic Diseases Classified Elsewhere')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M02', N'Artropatias Reactivas', N'Reactive arthropathies')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M020', N'Artropatia Consecutiva A Derivacion Intestinal', N'Consecutive arthropathy A Derivacion Intestinal')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M021', N'Artropatia Postdisenterica', N'Arthropathy Postdisenterica')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M022', N'Artropatia Postinmunizacion', N'Postimmunization arthropathy')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M023', N'Enfermedad De Reiter', N'Reiter Disease')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M028', N'Otras Artropatia Reactivas', N'Other Arthropathy Reactive')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M029', N'Artropatia Reactiva, No Especificada', N'Reactive arthropathy, Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M03*', N'Artropatias Postinfecciosas Y Reactivas En Enfermedades Clasificadas En Otra Parte', N'And postinfectious arthropathies Reactive In Diseases Classified Elsewhere')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M030*', N'Artritis Postmeningococica (A39.8*)', N'Postmeningococica arthritis (A39.8 *)')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M031*', N'Artropatia Postinfecciosa En Sifilis', N'Postinfectious arthropathy In Syphilis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M032*', N'Otras Artropatias Postinfecciosas En Enfermedades Clasificadas En Otra Parte', N'Other postinfectious arthropathies in diseases classified elsewhere')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M036*', N'Artropatia Reactiva En Otras Enfermedades Clasificadas En Otra Parte', N'Reactive arthropathy in other diseases classified elsewhere')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M05', N'Artritis Reumatoide Seropositiva', N'HIV-positive Rheumatoid Arthritis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M050', N'Sindrome De Felty', N'In Felty Syndrome')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M051*', N'Enfermedad Reumatoide Del Pulmon (J99.0*)', N'Rheumatoid lung disease (J99.0 *)')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M052', N'Vasculitis Reumatoide', N'Rheumatoid Vasculitis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M053*', N'Artritis Reumatoide Con Compromiso De Otros Organos O Sistemas', N'Rheumatoid Arthritis with involvement of other organs or systems')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M058', N'Otras Artritis Reumatoideas Seropositivas', N'Other Arthritis Reumatoideas HIV Positive')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M059', N'Artritis Reumatoide Seropositiva, Sin Otra Especificacion', N'HIV-positive rheumatoid arthritis, unspecified')
GO
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M06', N'Otras Artritis Reumatoides', N'Rheumatoid Arthritis Other')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M060', N'Artritis Reumatoide Seronegativa', N'Seronegative rheumatoid arthritis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M061', N'Enfermedad De Still De Comienzo En El Adulto', N'Disease Still On Top Of The People')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'M062', N'Bursitis Reumatoide', N'Bursitis Rheumatoid')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'N001', N'Sindrome NefríTico Agudo: Lesiones Glomerulares Focales Y Segmentarias', N'Acute nephritic syndrome: Focal and Segmental Glomerular Injury')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'N002', N'Sindrome Nefritico Agudo: Glomerulonefritis Membranosa Difusa', N'Acute nephritic syndrome: Diffuse membranous glomerulonephritis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'N003', N'Sindrome Nefritico Agudo: Glomerulonefritis Proliferativa Mesangial Difusa', N'Acute nephritic syndrome: Diffuse Mesangial Proliferative Glomerulonephritis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'N004', N'Sindrome Nefritico Agudo: Glomerulonefritis Proliferativa Endocapilar Difusa', N'Acute nephritic syndrome: Diffuse endocapillary proliferative glomerulonephritis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'N005', N'Sindrome Nefritico Agudo: Glomerulonefritis Mesangiocapilar Difusa', N'Acute nephritic syndrome: Diffuse glomerulonephritis mesangiocapillary')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'N006', N'Sindrome Nefritico Agudo: Enfermedad Por Depositos Densos', N'Acute nephritic syndrome: Dense deposit disease')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'N007', N'Sindrome Nefritico Agudo: Glomerulonefritis Difusa En Media Luna', N'Acute nephritic syndrome: Diffuse glomerulonephritis in Crescent')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'N008', N'Sindrome Nefritico Agudo: Otras', N'Acute nephritic syndrome: Other')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'N009', N'Sindrome Nefritico Agudo: No Especificada', N'Acute nephritic syndrome: Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'N01', N'Sindrome Nefritico Rapidamente Progresivo', N'Rapidly progressive nephritic syndrome')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'N010', N'Sindrome Nefritico Rapidamente Progresivo: Anomalia Glomerular Minima', N'Rapidly progressive nephritic syndrome: Glomerular Anomalia Minima')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'N011', N'Sindrome NefríTico Rapidamente Progresivo: Lesiones Glomerulares Focales Y Segmentarias', N'Rapidly progressive nephritic syndrome: Focal and Segmental Glomerular Injury')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'N012', N'Sindrome Nefritico Rapidamente Progresivo: Glomerulonefritis Membranosa Difusa', N'Rapidly progressive nephritic syndrome: Diffuse membranous glomerulonephritis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'N013', N'Sindrome Nefritico Rapidamente Progresivo: Glomerulonefritis Proliferativa Mesangial Difusa', N'Rapidly progressive nephritic syndrome: Diffuse Mesangial Proliferative Glomerulonephritis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'N014', N'Sindrome Nefritico Rapidamente Progresivo: Glomerulonefritis Proliferativa Endocapilar Difusa', N'Rapidly progressive nephritic syndrome: Diffuse endocapillary proliferative glomerulonephritis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'N015', N'Sindrome Nefritico Rapidamente Progresivo: Glomerulonefritis Mesangiocapilar Difusa', N'Rapidly progressive nephritic syndrome: Diffuse glomerulonephritis mesangiocapillary')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'N016', N'Sindrome Nefritico Rapidamente Progresivo: Enfermedad Por Depositos Densos', N'Rapidly progressive nephritic syndrome: Dense deposit disease')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'N017', N'Sindrome Nefritico Rapidamente Progresivo: Glomerulonefritis Difusa En Media Luna', N'Rapidly progressive nephritic syndrome: Diffuse glomerulonephritis in Crescent')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'N018', N'Sindrome Nefritico Rapidamente Progresivo: Otras', N'Rapidly progressive nephritic syndrome: Other')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'N019', N'Sindrome Nefritico Rapidamente Progresivo: No Especificada', N'Rapidly progressive nephritic syndrome: Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'O001', N'Embarazo Tubarico', N'Tubal pregnancy')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'O002', N'Embarazo Ovarico', N'Ovarian Pregnancy')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'O008', N'Otros Embarazos Ectopicos', N'Other ectopic pregnancies')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'O009', N'Embarazo Ectopico, No Especificado', N'Ectopic Pregnancy, Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'O01', N'Mola Hidatiforme', N'Hydatidiform Mole')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'O010', N'Mola Hidatiforme Clasica', N'Classical Hydatidiform Mole')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'O011', N'Mola Hidatiforme, Incompleta O Parcial', N'Hydatidiform Mole, Incomplete or Partial')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'O019', N'Mola Hidatiforme, No Especificada', N'Hydatidiform Mole, Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'O02', N'Otros Productos Anormales De La Concepcion', N'Other Products Abnormal De La Concepcion')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'O020', N'Detencion Del Desarrollo Del Huevo Y Mola No Hidatiforme', N'Developmental arrest Egg And Mola No hydatidiform')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'O021', N'Aborto Retenido', N'Abortion Withheld')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'O028', N'Otros Productos Anormales Especificados De La Concepcion', N'Other Products Specified Abnormal De La Concepcion')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'O029', N'Producto Anormal De La Concepcion, No Especificado', N'Product Abnormal De La Concepcion, Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'O03', N'Aborto Espontaneo', N'Spontaneous Abortion')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'O030', N'Aborto Espontaneo: Incompleto, Complicado Con InfeccióN Genital Y Pelviana', N'Spontaneous abortion: Incomplete, complicated by genital infection and Pelvic')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'O031', N'Aborto Espontaneo: Incompleto, Complicado Por Hemorragia Excesiva O Tardia', N'Spontaneous abortion: Incomplete, complicated by hemorrhage Excessive O Tardia')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'O032', N'Aborto Espontaneo: Incompleto, Complicado Por Embolia', N'Spontaneous abortion: Incomplete, complicated by embolism')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'O033', N'Aborto Espontaneo: Incompleto, Con Otras Complicaciones Especificadas Y Las No Especificadas', N'Spontaneous abortion: Incomplete, with Other Specified Complications and unspecified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'O034', N'Aborto Espontaneo: Incompleto, Sin Complicacion', N'Spontaneous abortion: Incomplete, No Complication')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'O035', N'Aborto Espontaneo: Completo O No Especificado, Complicado Con Infeccion Genital Y Pelviana', N'Spontaneous abortion: Complete or unspecified, Difficult With Genital Infection and Pelvic')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'O036', N'Aborto Espontaneo: Completo O No Especificado, Complicado Por Hemorragia Excesiva O Tardia', N'Spontaneous abortion: Complete or unspecified, complicated by hemorrhage Excessive O Tardia')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'O037', N'Aborto Espontaneo: Completo O No Especificado, Complicado Por Embolia', N'Spontaneous abortion: Complete or unspecified, complicated by embolism')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'O038', N'Aborto Espontaneo: Completo O No Especificado, Con Otras Complicaciones Especificadas Y Las No Especificadas', N'Spontaneous abortion: Complete or unspecified, with Other Specified Complications and unspecified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'O039', N'Aborto Espontaneo: Completo O No Especificado, Sin Complicacion', N'Spontaneous abortion: Complete or unspecified, Without Complication')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'P10', N'Hemorragia Y Laceracion Intracraneal Debidas A Traumatismo Del Nacimiento', N'Intracranial hemorrhage due to Laceration And Birth Trauma')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'P100', N'Hemorragia Subdural Debida A Traumatismo Del Nacimiento', N'Subdural Hemorrhage Due to Trauma Birth')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'P101', N'Hemorragia Cerebral Debida A Traumatismo Del Nacimiento', N'Cerebral Hemorrhage Due to Trauma Birth')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'P102', N'Hemorragia Intraventricular Debida A Traumatismo Del Nacimiento', N'Intraventricular Hemorrhage Due to Trauma Birth')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'P103', N'Hemorragia Subaracnoidea Debida A Traumatismo Del Nacimiento', N'Subarachnoid Hemorrhage Due to Trauma Birth')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'P104', N'Desgarro Tentorial Debido A Traumatismo Del Nacimiento', N'Tentorial tear Due to birth injury')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'P108', N'Otras Hemorragias Y Laceraciones Intracraneales Debidas A Traumatismo Del Nacimiento', N'Other Intracranial hemorrhages and lacerations due to trauma Birth')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'P109', N'Hemorragia Y Laceracion Intracraneales No Especificadas, Debidas A Traumatismo Del Nacimiento', N'Intracranial hemorrhage and Laceration Specified, due to trauma Birth')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'P11', N'Otros Traumatismos Del Nacimiento En El Sistema Nervioso Central', N'Other Birth Injuries In The Central Nervous System')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'P110', N'Edema Cerebral Debido A Traumatismo Del Nacimiento', N'Cerebral edema due to birth injury')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'P111', N'Otras Lesiones Especificadas Del Encefalo Debidas A Traumatismo Del Nacimiento', N'Other Specified Injuries Encephalon Debidas A Birth Injury')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'P112', N'Lesion No Especificada Del Encefalo, Debida A Traumatismo Del Nacimiento', N'Not Specified brain injury, Due to birth injury')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Q040', N'Malformaciones Congenitas Del Cuerpo Calloso', N'Congenital Malformations of the Corpus Callosum')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Q041', N'Arrinencefalia', N'Arhinencephaly')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Q042', N'Holoprosencefalia', N'Holoprosencephaly')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Q043', N'Otras Anomalias Hipoplasicas Del Encefalo', N'Other Anomalies hypoplastic brain')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Q044', N'Displasia Opticoseptal', N'Dysplasia Opticoseptal')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Q045', N'Megalencefalia', N'Megalencephaly')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Q046', N'Quistes Cerebrales Congenitos', N'Congenital Cerebral Cysts')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Q048', N'Otras Malformaciones Congenitas Del Encefalo, Especificadas', N'Other Congenital Malformations of the brain, Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Q049', N'Malformacion Congenita Del Encefalo, No Especificada', N'Congenital malformation of brain, unspecified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Q05', N'Espina Bifida', N'Spina Bifida')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Q050', N'Espina Bifida Cervical Con Hidrocefalo', N'Cervical spina bifida with hydrocephalus')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Q051', N'Espina Bifida Toracica Con Hidrocefalo', N'Thoracic spina bifida with hydrocephalus')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Q052', N'Espina Bifida Lumbar Con Hidrocefalo', N'Lumbar spina bifida with hydrocephalus')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Q053', N'Espina Bifida Sacra Con Hidrocefalo', N'With Sacra Spina Bifida Hydrocephalus')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Q054', N'Espina Bifida Con Hidrocefalo, Sin Otra Especificacion', N'With spina bifida hydrocephalus, unspecified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Q055', N'Espina Bifida Cervical Sin Hidrocefalo', N'Cervical spina bifida without hydrocephalus')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'R068', N'Otras Anormalidades De La Respiracion Y Las No Especificadas', N'Other abnormalities of breathing and unspecified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'R07', N'Dolor De Garganta Y En El Pecho', N'Sore Throat And Chest')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'R070', N'Dolor De Garganta', N'Sore throat')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'R071', N'Dolor En El Pecho Al Respirar', N'Pain In Chest When Breathing')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'R072', N'Dolor Precordial', N'Precordial Pain')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'R073', N'Otros Dolores En El Pecho', N'Other Chest Pains')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'R074', N'Dolor En El Pecho, No Especificado', N'Chest Pain, Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'R09', N'Otros Sintomas Y Signos Que Involucran Los Sistemas Circulatorio Y Respiratorio', N'Other symptoms and signs involving the Circulatory and Respiratory Systems')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'R090', N'Asfixia', N'Asphyxia')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'R091', N'Pleuresia', N'Pleurisy')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'R092', N'Paro Respiratorio', N'Respiratory arrest')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'R093', N'Esputo Anormal', N'Abnormal sputum')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'R098', N'Otros Sintomas Y Signos Especificados Que Involucran Los Sistemas Circulatorio Y Respiratorio', N'Other symptoms and signs involving the circulatory Specified Systems and Respiratory')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'R10', N'Dolor Abdominal Y Pelvico', N'Abdominal and Pelvic Pain')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'R100', N'Abdomen Agudo', N'Acute Abdomen')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'R101', N'Dolor Abdominal Localizado En Parte Superior', N'Abdominal Pain Located In Tops')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'S025', N'Fractura De Los Dientes', N'Fractured Teeth')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'S026', N'Fractura Del Maxilar Inferior', N'Mandibular Fracture')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'S027', N'Fracturas Multiples Que Comprometen El Craneo Y Los Huesos De La Cara', N'Multiple fractures involving the skull And Bones Of The Face')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'S028', N'Fractura De Otros Huesos Del Craneo Y De La Cara', N'Other Fracture Skull And Bones Of The Face')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'S029', N'Fractura Del Craneo Y De Los Huesos De La Cara, Parte No Especificada', N'Fracture Skull and Bones Of The Face, Part Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'S03', N'Luxacion, Esguince Y Torcedura De Articulaciones Y De Ligamentos De La Cabeza', N'Dislocation, sprain and strain of joints and ligaments Head')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T263', N'Quemadura De Otras Partes Del Ojo Y Sus Anexos', N'Burn Other Parts Of The Eye And Their Attachments')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T264', N'Quemadura Del Ojo Y Anexos, Parte No Especificada', N'Burn Eye And Attachments, Part Not Specified')
GO
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T265', N'Corrosion Del Parpado Y Area Periocular', N'Corrosion of the eyelid and Periocular Area')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T266', N'Corrosion De La Cornea Y Saco Conjuntival', N'Corrosion Of Cornea and Conjunctival Sac')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T267', N'Corrosion Con Ruptura Y Destruccion Resultantes Del Globo Ocular', N'Corrosion With Breakup And Destruction Resulting from Eyeball')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T268', N'Corrosion De Otras Partes Del Ojo Y Sus Anexos', N'Corrosion Of Other Parts Of The Eye And Their Attachments')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T269', N'Corrosion Del Ojo Y Anexos, Parte No Especificada', N'Corrosion Eye And Attachments, unspecified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T27', N'Quemadura Y Corrosion De Las Vias Respiratorias', N'Burn and corrosion Airway')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T270', N'Quemadura De La Laringe Y La Traquea', N'Burn The larynx and trachea')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T271', N'Quemadura Que Afecta La Laringe Y La Traquea Con El Pulmon', N'Burn That Affects The Larynx And Trachea With Lung')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T272', N'Quemadura De Otras Partes De Las Vias Respiratorias', N'Burn Other Parts Of The Airway')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T273', N'Quemadura De Las Vias Respiratorias, Parte No Especificada', N'Burn The Airway, Part Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T274', N'Corrosion De La Laringe Y De La Traquea', N'Corrosion Of The Larynx and trachea')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T275', N'Corrosion Que Afecta La Laringe Y La Traquea Con El Pulmon', N'Corrosion That Affects The Larynx And Trachea With Lung')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T276', N'Corrosion De Otras Partes De Las Vias Respiratorias', N'Corrosion Of Other Parts Of The Airway')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T277', N'Corrosion De Las Vias Respiratorias, Parte No Especificada', N'Corrosion Of Airway, Part Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T28', N'Quemadura Y Corrosion De Otros Organos Internos', N'Burn And Corrosion From Other Internal Organs')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T280', N'Quemadura De La Boca Y De La Faringe', N'Burn Mouth and pharynx')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T281', N'Quemadura Del Esofago', N'Burn the Esophagus')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T282', N'Quemadura De Otras Partes Del Tubo Digestivo', N'Burn Other Parts Of The Digestive Tract')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T283', N'Quemadura De Organos Genitourinarios Internos', N'Burn Genitourinary Internal Organs')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T284', N'Quemadura De Otros Organos Internos Y De Los No Especificados', N'Burn Other Internal Organs And The Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T285', N'Corrosion De La Boca Y De La Faringe', N'Corrosion Of Mouth and pharynx')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T286', N'Corrosion Del Esofago', N'Corrosion Of Esophagus')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T287', N'Corrosion De Otras Partes Del Tubo Digestivo', N'Corrosion Of Other Parts Of The Digestive Tract')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T288', N'Corrosion De Organos Genitourinarios Internos', N'Internal Corrosion Of Genitourinary Organs')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T289', N'Corrosion De Otros Organos Internos Y De Los No Especificados', N'Corrosion Of Other Internal Organs And The Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T29', N'Quemadura Y Corrosion De Multiples Regiones Del Cuerpo', N'Burn And Corrosion Of Multiple Body Regions')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T290', N'Quemaduras De Multiples Regiones, Grado No Especificado', N'Burns Multiple Regions, Grade Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T291', N'Quemaduras De Multiples Regiones, Mencionadas Como De No Mas De Primer Grado', N'Burns Multiple Regions From Mas As Mentioned In First Grade')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T292', N'Quemaduras De Multiples Regiones, Mencionadas Como De No Mas De Segundo Grado', N'Burns Multiple Regions From Mas As Mentioned In Second Grade')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T293', N'Quemaduras De Multiples Regiones, Con Mencion Al Menos De Una Quemadura De Tercer Grado', N'Multiple Regions Burns, With At Least Mention Of A Third Degree Burn')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T294', N'Corrosiones De Multiples Regiones, Grado No Especificado', N'Corrosion Of Multiple Regions, Grade Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T295', N'Corrosiones Multiples, Mencionadas Como De No Mas De Primer Grado', N'Corrosion Multiples, No Mas De As Mentioned In First Grade')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T296', N'Corrosiones Multiples, Mencionadas Como De No Mas De Segundo Grado', N'Corrosion Multiples, No Mas De As Mentioned In Second Grade')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T297', N'Corrosiones Multiples, Con Mencion Al Menos De Una Quemadura De Tercer Grado', N'Corrosion Multiples, With At Least Mention Of A Third Degree Burn')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T30', N'Quemadura Y Corrosion, Region Del Cuerpo No Especificada', N'Burn And Corrosion, Body Region No Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T300', N'Quemadura De Region Del Cuerpo Y Grado No Especificados', N'Burn Body Region and Grade Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T301', N'Quemadura De Primer Grado, Region Del Cuerpo No Especificada', N'First Degree Burn, Body Region Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T302', N'Quemadura De Segundo Grado, Region Del Cuerpo No Especificada', N'Second Degree Burn, Body Region Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T303', N'Quemadura De Tercer Grado, Region Del Cuerpo No Especificada', N'Third Degree Burn, Body Region Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T304', N'Corrosion De Region Del Cuerpo Y Grado No Especificados', N'Corrosion Of Body And Grado Region No Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T305', N'Corrosion De Primer Grado, Region Del Cuerpo No Especificada', N'Corrosion Of First Grade, Region Not Specified Body')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T306', N'Corrosion De Segundo Grado, Region Del Cuerpo No Especificada', N'Corrosion Of Second Grade, Body Region No Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T307', N'Corrosion De Tercer Grado, Region Del Cuerpo No Especificada', N'Corrosion Of Third Grade, Body Region Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T31', N'Quemaduras Clasificadas Segun La Extension De La Superficie Del Cuerpo Afectada', N'Burns classified according to extent of body surface involvement')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'T310', N'Quemaduras Que Afectan Menos Del 10% De La Superficie Del Cuerpo', N'Less Del Burns Affecting 10% Of Body Surface')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V541', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Vehiculo De Transporte Pesado O Autobus: Pasajero Lesionado En Accidente No De Transito', N'Occupying From truck or van injured in collision with heavy transport vehicle or bus: Passenger Injured In Traffic Accident No Of')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V542', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Vehiculo De Transporte Pesado O Autobus: Persona Que Viaja Fuera Del Vehiculo, Lesionada En Accidente No De Transito', N'Occupying From truck or van injured in collision with heavy transport vehicle or bus: Person Traveling Out Of Car, Injured In Traffic Accident No Of')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V543', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Vehiculo De Transporte Pesado O Autobus: Ocupante No Especificado De Camioneta O Furgoneta, Lesionado En Accidente No De Transito', N'Occupying From truck or van injured in collision with O Heavy Bus Transportation: Truck Occupant Or Not Specified De Van, Injured In Traffic Accident No Of')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V544', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Vehiculo De Transporte Pesado O Autobus: Persona Lesionada Al Subir O Bajar Del Vehiculo', N'Occupying From truck or van injured in collision with heavy transport vehicle or bus: Person Injured By raising or lowering the Vehicle')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V545', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Vehiculo De Transporte Pesado O Autobus: Conductor Lesionado En Accidente De Transito', N'Occupying From truck or van injured in collision with heavy transport vehicle or bus: Driver Injured In Traffic Accident')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V546', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Vehiculo De Transporte Pesado O Autobus: Pasajero Lesionado En Accidente De Transito', N'Occupying From truck or van injured in collision with O Heavy Bus Transportation: Passenger Injured In Traffic Accident')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V547', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Vehiculo De Transporte Pesado O Autobus: Persona Que Viaja Fuera Del Vehiculo, Lesionada En Accidente De Transito', N'Occupying From truck or van injured in collision with heavy transport vehicle or bus: Person Traveling Out Of Car, Injured In Traffic Accident')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V549', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Vehiculo De Transporte Pesado O Autobus: Ocupante No Especificado De Camioneta O Furgoneta, Lesionado En Accidente De Transito', N'Occupying From truck or van injured in collision with O Heavy Bus Transportation: Truck Occupant Or Not Specified De Van, Injured In Traffic Accident')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V55', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Tren O Vehiculo De Rieles', N'Occupant Of Truck Or Van Injured In Collision With Train Or Vehicle From Rails')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V550', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Tren O Vehiculo De Rieles: Conductor Lesionado En Accidente No De Transito', N'Occupant Of Truck Or Van Injured In Collision With Train Or Vehicle From Rails: Driver Injured In Traffic Accident No Of')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V551', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Tren O Vehiculo De Rieles: Pasajero Lesionado En Accidente No De Transito', N'Occupant Of Truck Or Van Injured In Collision With Train Or Vehicle From Rails: Passenger Injured In Traffic Accident No Of')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V552', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Tren O Vehiculo De Rieles: Persona Que Viaja Fuera Del Vehiculo, Lesionada En Accidente No De Transito', N'Occupant Of Truck Or Van Injured In Collision With Train Or Vehicle From Rails: People Traveling Out Of Car, Injured In Traffic Accident No Of')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V553', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Tren O Vehiculo De Rieles: Ocupante No Especificado De Camioneta O Furgoneta, Lesionado En Accidente No De Transito', N'Occupant Of Truck Or Van Injured In Collision With Train In Rails Or Vehicle: Occupant Not Specified Truck Or Van De, Injured In Traffic Accident No Of')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V554', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Tren O Vehiculo De Rieles: Persona Lesionada Al Subir O Bajar Del Vehiculo', N'Occupant Of Truck Or Van Injured In Collision With Train Or Vehicle From Rails: Person Injured By raising or lowering the Vehicle')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V555', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Tren O Vehiculo De Rieles: Conductor Lesionado En Accidente De Transito', N'Occupant Of Truck Or Van Injured In Collision With Train Or Vehicle From Rails: Driver Injured In Traffic Accident')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V556', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Tren O Vehiculo De Rieles: Pasajero Lesionado En Accidente De Transito', N'Occupant Of Truck Or Van Injured In Collision With Train Or Vehicle From Rails: Passenger Injured In Traffic Accident')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V557', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Tren O Vehiculo De Rieles: Persona Que Viaja Fuera Del Vehiculo, Lesionada En Accidente De Transito', N'Occupant Of Truck Or Van Injured In Collision With Train Or Vehicle From Rails: People Traveling Out Of Car, Injured In Traffic Accident')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V559', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Tren O Vehiculo De Rieles: Ocupante No Especificado De Camioneta O Furgoneta, Lesionado En Accidente De Transito', N'Occupant Of Truck Or Van Injured In Collision With Train In Rails Or Vehicle: Occupant Not Specified Truck Or Van De, Injured In Traffic Accident')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V56', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Otros Vehiculos Sin Motor', N'Occupying From truck or van injured in collision with other Motor Vehicle Without')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V560', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Otros Vehiculos Sin Motor: Conductor Lesionado En Accidente No De Transito', N'Occupying From truck or van injured in collision with other Motor Vehicle No: Driver Injured In Traffic Accident No Of')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V561', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Otros Vehiculos Sin Motor: Pasajero Lesionado En Accidente No De Transito', N'Occupying From truck or van injured in collision with other Motor Vehicle No: Passenger Injured In Traffic Accident No Of')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V562', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Otros Vehiculos Sin Motor: Persona Que Viaja Fuera Del Vehiculo, Lesionada En Accidente No De Transito', N'Occupying From truck or van injured in collision with other Motor Vehicle No: Person Traveling Out Of Car, Injured In Traffic Accident No Of')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V563', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Otros Vehiculos Sin Motor: Ocupante No Especificado De Camioneta O Furgoneta, Lesionado En Accidente No De Transito', N'Occupying From truck or van injured in collision with other Motor Vehicle No: Occupant Not Specified Truck Or Van De, Injured In Traffic Accident No Of')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V564', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Otros Vehiculos Sin Motor: Persona Lesionada Al Subir O Bajar Del Vehiculo', N'Occupying From truck or van injured in collision with other Motor Vehicle No: Person Injured By raising or lowering the Vehicle')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V565', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Otros Vehiculos Sin Motor: Conductor Lesionado En Accidente De Transito', N'Occupying From truck or van injured in collision with other Motor Vehicle No: Driver Injured In Traffic Accident')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V566', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Otros Vehiculos Sin Motor: Pasajero Lesionado En Accidente De Transito', N'Occupying From truck or van injured in collision with other Motor Vehicle No: Passenger Injured In Traffic Accident')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V567', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Otros Vehiculos Sin Motor: Persona Que Viaja Fuera Del Vehiculo, Lesionada En Accidente De Transito', N'Occupying From truck or van injured in collision with other Motor Vehicle No: Person Traveling Out Of Car, Injured In Traffic Accident')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V569', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Otros Vehiculos Sin Motor: Ocupante No Especificado De Camioneta O Furgoneta, Lesionado En Accidente De Transito', N'Occupying From truck or van injured in collision with other Motor Vehicle No: Occupant Not Specified Truck Or Van De, Injured In Traffic Accident')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V57', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Objeto Estacionado Fijo', N'Occupant Of Truck Or Van Injured In Collision With Fixed Object Parked')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V570', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Objeto Fijo O Estacionado: Conductor Lesionado En Accidente No De Transito', N'Occupant Of Truck Or Van Injured In Collision With Fixed Object O Parked: Driver Injured In Traffic Accident No Of')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V571', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Objeto Fijo O Estacionado: Pasajero Lesionado En Accidente No De Transito', N'Occupant Of Truck Or Van Injured In Collision With Fixed Object O Parked: Passenger Injured In Traffic Accident No Of')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V572', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Objeto Fijo O Estacionado: Persona Que Viaja Fuera Del Vehiculo, Lesionada En Accidente No De Transito', N'Occupant Of Truck Or Van Injured In Collision With Fixed Object O Parked: People Traveling Out Of Car, Injured In Traffic Accident No Of')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V573', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Objeto Fijo O Estacionado: Ocupante No Especificado De Camioneta O Furgoneta, Lesionado En Accidente No De Transito', N'Occupant Of Truck Or Van Injured In Collision With Fixed Object O Parked: Not Specified Occupant Of Truck Or Van, Injured In Traffic Accident No Of')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V574', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Objeto Fijo O Estacionado: Persona Lesionada Al Subir O Bajar Del Vehiculo', N'Occupant Of Truck Or Van Injured In Collision With Fixed Object O Parked: Person Injured By raising or lowering the Vehicle')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V575', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Objeto Fijo O Estacionado: Conductor Lesionado En Accidente De Transito', N'Occupant Of Truck Or Van Injured In Collision With Fixed Object O Parked: Driver Injured In Traffic Accident')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V576', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Objeto Fijo O Estacionado: Pasajero Lesionado En Accidente De Transito', N'Occupant Of Truck Or Van Injured In Collision With Fixed Object O Parked: Passenger Injured In Traffic Accident')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V577', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Objeto Fijo O Estacionado: Persona Que Viaja Fuera Del Vehiculo, Lesionada En Accidente De Transito', N'Occupant Of Truck Or Van Injured In Collision With Fixed Object O Parked: People Traveling Out Of Car, Injured In Traffic Accident')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V579', N'Ocupante De Camioneta O Furgoneta Lesionado Por Colision Con Objeto Fijo O Estacionado: Ocupante No Especificado De Camioneta O Furgoneta, Lesionado En Accidente De Transito', N'Occupant Of Truck Or Van Injured In Collision With Fixed Object O Parked: Occupant Not Specified Truck Or Van De, Injured In Traffic Accident')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V58', N'Ocupante De Camioneta O Furgoneta Lesionado En Accidente Transporte Sin Colision', N'Occupant Of Truck Or Van Injured In Collision No Transport Accident')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V580', N'Ocupante De Camioneta O Furgoneta Lesionado En Accidente De Transporte Sin Colision: Conductor Lesionado En Accidente No De Transito', N'Occupant Of Truck Or Van Injured In Collision No Transport Accident: Driver Injured In Traffic Accident No Of')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V581', N'Ocupante De Camioneta O Furgoneta Lesionado En Accidente De Transporte Sin Colision: Pasajero Lesionado En Accidente No De Transito', N'Occupant Of Truck Or Van Injured In Collision No Accident Transportation: Passenger Injured In Traffic Accident No Of')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V582', N'Ocupante De Camioneta O Furgoneta Lesionado En Accidente De Transporte Sin Colision: Persona Que Viaja Fuera Del Vehiculo, Lesionada En Accidente No De Transito', N'Occupant Of Truck Or Van Injured In Collision No Transport Accident: People Traveling Out Of Car, Injured In Traffic Accident No Of')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V583', N'Ocupante De Camioneta O Furgoneta Lesionado En Accidente De Transporte Sin Colision: Ocupante No Especificado De Camioneta O Furgoneta, Lesionado En Accidente No De Transito', N'Occupant Of Truck Or Van Injured In Collision No Transport Accident: Truck Occupant Or Not Specified De Van, Injured In Traffic Accident No Of')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V584', N'Ocupante De Camioneta O Furgoneta Lesionado En Accidente De Transporte Sin Colision: Persona Lesionada Al Subir O Bajar Del Vehiculo', N'Occupant Of Truck Or Van Injured In Collision No Transport Accident: Injured Person up or down from the Vehicle')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V585', N'Ocupante De Camioneta O Furgoneta Lesionado En Accidente De Transporte Sin Colision: Conductor Lesionado En Accidente De Transito', N'Occupant Of Truck Or Van Injured In Collision No Transport Accident: Driver Injured In Traffic Accident')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V586', N'Ocupante De Camioneta O Furgoneta Lesionado En Accidente De Transporte Sin Colision: Pasajero Lesionado En Accidente De Transito', N'Occupant Of Truck Or Van Injured In Collision No Accident Transportation: Passenger Injured In Traffic Accident')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V587', N'Ocupante De Camioneta O Furgoneta Lesionado En Accidente De Transporte Sin Colision: Persona Que Viaja Fuera Del Vehiculo, Lesionada En Accidente De Transito', N'Occupant Of Truck Or Van Injured In Collision No Transport Accident: People Traveling Out Of Car, Injured In Traffic Accident')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V589', N'Ocupante De Camioneta O Furgoneta Lesionado En Accidente De Transporte Sin Colision: Ocupante No Especificado De Camioneta O Furgoneta, Lesionado En Accidente De Transito', N'Occupant Of Truck Or Van Injured In Collision No Transport Accident: Truck Occupant Or Not Specified De Van, Injured In Traffic Accident')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V59', N'Ocupante De Camioneta O Furgoneta Lesionado En Otros Accidentes De Transporte, Y En Los No Especificados', N'Occupant Of Truck Or Van Injured In Accident Other Transportation And In The Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V590', N'Conductor De Camioneta O Furgoneta Lesionado Por Colision Con Otros Vehiculos De Motor, Y Con Los No Especificados, En Accidente No De Transito', N'Driver truck or van injured in collision with other motor vehicles, And With No Specified, in nontraffic accident')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V591', N'Pasajero De Camioneta O Furgoneta Lesionado Por Colision Con Otros Vehiculos De Motor, Y Con Los No Especificados, En Accidente No De Transito', N'Passenger From truck or van injured in collision with other motor vehicles, and With No Specified, in nontraffic accident')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V592', N'Ocupante No Especificado De Camioneta O Furgoneta Lesionado Por Colision Con Otros Vehiculos De Motor, Y Con Los No Especificados, En Accidente No De Transito', N'Unspecified occupant truck or van injured in collision with other motor vehicles, And With No Specified, in nontraffic accident')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V593', N'Ocupante [Cualquiera] De Camioneta O Furgoneta Lesionado En Accidente No De Transito, No Especificado', N'Occupant [any] From truck or van injured in nontraffic accident, Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V594', N'Conductor De Camioneta O Furgoneta Lesionado Por Colision Con Otros Vehiculos De Motor, Y Con Los No Especificados, En Accidente De Transito', N'Driver truck or van injured in collision with other motor vehicles, And With No Specified, In Traffic Accident')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V595', N'Pasajero De Camioneta O Furgoneta Lesionado Por Colision Con Otros Vehiculos De Motor, Y Con Los No Especificados, En Accidente De Transito', N'Passenger From truck or van injured in collision with other motor vehicles, and With No Specified, In Traffic Accident')
GO
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V596', N'Ocupante No Especificado De Camioneta O Furgoneta Lesionado Por Colision Con Otros Vehiculos De Motor, Y Con Los No Especificados, En Accidente De Transito', N'Unspecified occupant truck or van injured in collision with other motor vehicles, And With No Specified, In Traffic Accident')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V598', N'Ocupante [Cualquiera] De Camioneta O Furgoneta Lesionado En Otros Accidentes De Transporte Especificados', N'Occupant [any] From Truck Or Van Injured In Accidents Other Specified Transportation')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V599', N'Ocupante [Cualquiera] De Camioneta O Furgoneta Lesionado En Accidente De Transito No Especificado', N'Occupant [any] From truck or van injured in traffic accident Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V60', N'Ocupante De Vehiculo De Transporte Pesado Pesado Lesionado Por Colision Con Peaton O Animal', N'Occupant Of Heavy Goods Vehicle, Heavy injured in collision with pedestrian or animal')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V600', N'Ocupante De Vehiculo De Transporte Pesado Lesionado Por Colision Con Peaton O Animal: Conductor Lesionado En Accidente No De Transito', N'Occupant Vehicle Transportation Of Heavy injured in collision with pedestrian or animal: Driver Injured In Traffic Accident No Of')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'V601', N'Ocupante De Vehiculo De Transporte Pesado Lesionado Por Colision Con Peaton O Animal: Pasajero Lesionado En Accidente No De Transito', N'Occupant Vehicle Transportation Of Heavy injured in collision with pedestrian or animal: Passenger Injured In Traffic Accident No Of')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W685', N'Ahogamiento Y Sumersion Consecutivos A Caida En Una Piscina: Comercio Y Areas De Servicio', N'Drowning and submersion Consecutive Drop In A Pool A: Trade and Service Areas')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W686', N'Ahogamiento Y Sumersion Consecutivos A Caida En Una Piscina: Area Industrial Y De La Construccion', N'Drowning and submersion Consecutive Drop In A Pool A: Industrial and construction area')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W687', N'Ahogamiento Y Sumersion Consecutivos A Caida En Una Piscina: Granja', N'A drowning and submersion Consecutive Drop In A Pool: Farm')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W688', N'Ahogamiento Y Sumersion Consecutivos A Caida En Una Piscina: Otro Lugar Especificado', N'A drowning and submersion Consecutive Drop In A Pool: Elsewhere Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W689', N'Ahogamiento Y Sumersion Consecutivos A Caida En Una Piscina: Lugar No Especificado', N'A drowning and submersion Consecutive Drop In A Pool: No Location Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W69', N'Ahogamiento Y Sumersion Mientras Se Esta En Aguas Naturales', N'Drowning and submersion while in natural water')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W690', N'Ahogamiento Y Sumersion Mientras Se Esta En Aguas Naturales: Vivienda', N'Drowning and submersion while in natural water: Housing')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W691', N'Ahogamiento Y Sumersion Mientras Se Esta En Aguas Naturales: Institucion Residencial', N'Drowning and submersion while in natural waters: Residential Institution')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W692', N'Ahogamiento Y Sumersion Mientras Se Esta En Aguas Naturales: Escuelas, Otras Instituciones Y Areas Administrativas Publicas', N'Drowning and submersion while in natural water: Schools, Other Public Institutions and Administrative Areas')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W693', N'Ahogamiento Y Sumersion Mientras Se Esta En Aguas Naturales: Areas De Deporte Y Atletismo', N'Drowning and submersion while in natural waters: Areas Of Sports And Athletics')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W694', N'Ahogamiento Y Sumersion Mientras Se Esta En Aguas Naturales: Calles Y Carreteras', N'Drowning and submersion while in natural water: Streets, Roads')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W695', N'Ahogamiento Y Sumersion Mientras Se Esta En Aguas Naturales: Comercio Y Areas De Servicio', N'Drowning and submersion while in natural water: Trade and Service Areas')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W696', N'Ahogamiento Y Sumersion Mientras Se Esta En Aguas Naturales: Area Industrial Y De La Construccion', N'Drowning and submersion while in natural water: Industrial Area and construction')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W697', N'Ahogamiento Y Sumersion Mientras Se Esta En Aguas Naturales: Granja', N'Drowning and submersion while in natural water: Farm')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W698', N'Ahogamiento Y Sumersion Mientras Se Esta En Aguas Naturales: Otro Lugar Especificado', N'Drowning and submersion while in Natural Water: Elsewhere Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W699', N'Ahogamiento Y Sumersion Mientras Se Esta En Aguas Naturales: Lugar No Especificado', N'Drowning and submersion while in natural water: Not Specified Location')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W70', N'Ahogamiento Y Sumersion Posterior A Caida En Aguas Naturales', N'A drowning and submersion Fall Back In Natural Waters')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W700', N'Ahogamiento Y Sumersion Posterior A Caida En Aguas Naturales: Vivienda', N'A drowning and submersion Fall Back In Natural Waters: Home')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W701', N'Ahogamiento Y Sumersion Posterior A Caida En Aguas Naturales: Institucion Residencial', N'A drowning and submersion Fall Back In Natural Waters: Residential Institution')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W702', N'Ahogamiento Y Sumersion Posterior A Caida En Aguas Naturales: Escuelas, Otras Instituciones Y Areas Administrativas Publicas', N'A drowning and submersion Fall Back In Natural Waters: Schools, Other Public Institutions and Administrative Areas')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W703', N'Ahogamiento Y Sumersion Posterior A Caida En Aguas Naturales: Areas De Deporte Y Atletismo', N'A drowning and submersion Fall Back In Natural Waters: Areas Of Sports And Athletics')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W704', N'Ahogamiento Y Sumersion Posterior A Caida En Aguas Naturales: Calles Y Carreteras', N'A drowning and submersion Fall Back In Natural Waters: Streets, Roads')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W705', N'Ahogamiento Y Sumersion Posterior A Caida En Aguas Naturales: Comercio Y Areas De Servicio', N'A drowning and submersion Fall Back In Natural Waters: Trade and Service Areas')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W706', N'Ahogamiento Y Sumersion Posterior A Caida En Aguas Naturales: Area Industrial Y De La Construccion', N'A drowning and submersion Fall Back In Natural Waters: Industrial Area and construction')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W707', N'Ahogamiento Y Sumersion Posterior A Caida En Aguas Naturales: Granja', N'A drowning and submersion Fall Back In Natural Waters: Farm')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W708', N'Ahogamiento Y Sumersion Posterior A Caida En Aguas Naturales: Otro Lugar Especificado', N'A drowning and submersion Fall Back In Natural Water: Elsewhere Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W709', N'Ahogamiento Y Sumersion Posterior A Caida En Aguas Naturales: Lugar No Especificado', N'A drowning and submersion Fall Back In Natural Waters: Not Specified Location')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W73', N'Otros Ahogamientos Y Sumersiones Especificados', N'Drownings and Other Specified Submersions')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'W730', N'Otros Ahogamientos Y Sumersiones Especificados: Vivienda', N'Drownings and Other Specified Submersions: Home')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'X367', N'Victima De Avalancha, Derrumbe Y Otros Movimientos De Tierra: Granja', N'Victim Of Avalanche, Landslide and Other Earthworks: Farm')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'X368', N'Victima De Avalancha, Derrumbe Y Otros Movimientos De Tierra: Otro Lugar Especificado', N'Victim Of Avalanche, Landslide and Other Earthworks: Elsewhere Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'X369', N'Victima De Avalancha, Derrumbe Y Otros Movimientos De Tierra: Lugar No Especificado', N'Victim Of Avalanche, Landslide and Other Earthworks: Not Specified Location')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'X37', N'Victima De Tormenta Cataclismica', N'Storm victim cataclysmic')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'X370', N'Victima De Tormenta Cataclismica: Vivienda', N'Storm victim cataclysmic: Home')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'X371', N'Victima De Tormenta Cataclismica: Institucion Residencial', N'Storm victim cataclysmic: Residential Institution')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'X372', N'Victima De Tormenta Cataclismica: Escuelas, Otras Instituciones Y Areas Administrativas Publicas', N'Storm victim cataclysmic: Schools, Other Public Institutions and Administrative Areas')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'X373', N'Victima De Tormenta Cataclismica: Areas De Deporte Y Atletismo', N'Storm victim cataclysmic: Areas Of Sport And Athletics')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'X374', N'Victima De Tormenta Cataclismica: Calles Y Carreteras', N'Storm victim cataclysmic: Streets, Roads')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'X375', N'Victima De Tormenta Cataclismica: Comercio Y Areas De Servicio', N'Storm victim cataclysmic: Trade and Service Areas')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y472', N'Efectos Adversos De Derivados Clorales', N'Adverse Effects Derivatives Clorales')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y473', N'Efectos Adversos De Paraldehido', N'Adverse Effects Of Paraldehyde')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y474', N'Efectos Adversos De Compuestos De Bromo', N'Adverse Effects Of Bromo Compounds')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y475', N'Efectos Adversos De Mezclas Sedantes E Hipnoticas, No Clasificadas En Otra Parte', N'Adverse Effects Of Mixes sedative and hypnotic, Not Elsewhere Classified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y478', N'Efectos Adversos De Otras Drogas Sedantes, Hipnoticas Y Ansioliticas', N'Adverse Effects Of Other Drugs sedative-hypnotic and anxiolytic')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y479', N'Efectos Adversos De Drogas Sedantes, Hipnoticas Y Ansioliticas No Especificadas', N'Adverse Drug sedative-hypnotic and anxiolytic Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y48', N'Efectos Adversos De Gases Anestesicos Y Terapeuticos', N'Adverse Effects Of Anesthetics and Therapeutic Gases')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y480', N'Efectos Adversos De Gases Anestesicos Por Inhalacion', N'Adverse Effects Of Gases By Inhalation Anesthetics')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y481', N'Efectos Adversos De Gases Anestesicos Parenterales', N'Adverse Effects Of Gases Parenteral Anesthetics')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y482', N'Efectos Adversos De Otros Gases Anestesicos Generales, Y Los No Especificados', N'Adverse Effects From Other Gases General Anesthetics, and unspecified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y483', N'Efectos Adversos De Gases Anestesicos Locales', N'Adverse Effects Of Local Anesthetics Gases')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y484', N'Efectos Adversos De Anestesicos No Especificados', N'Adverse Effects Of Anesthetics Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y485', N'Efectos Adversos De Gases Terapeuticos', N'Adverse Effects In Therapeutic Gases')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y49', N'Efectos Adversos De Drogas Psicotropicas No Clasificadas En Otra Parte', N'Adverse Effects of Psychotropic Drugs Not Elsewhere Classified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y490', N'Efectos Adversos De Antidepresivos Triciclicos Y Tetraciclicos', N'Adverse Effects Of tricyclic and tetracyclic antidepressants')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y491', N'Efectos Adversos De Antidepresivos Inhibidores De La Monoaminooxidasa', N'Antidepressant Adverse Effects Monoamine Oxidase Inhibitors')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y492', N'Efectos Adversos De Otros Antidepresivos Y Los No Especificados', N'Other Adverse Effects of Antidepressants and unspecified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y493', N'Efectos Adversos De Antipsicoticos Y Neurolepticos Fenotiazinicos', N'And Adverse Effects Of Antipsychotic phenothiazine neuroleptics')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y494', N'Efectos Adversos De Neurolepticos De La Butirofenona Y Tioxantina', N'Adverse effects of neuroleptic butyrophenone And thioxanthine')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y495', N'Efectos Adversos De Otros Antipsicoticos Y Neurolepticos', N'Other Adverse Effects of Antipsychotics and neuroleptics')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y496', N'Efectos Adversos De Psicodislepticos [Alucinogenos]', N'Adverse Effects Of psychodysleptics [hallucinogens]')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y497', N'Efectos Adversos De Psicoestimulantes Con Abuso Potencial', N'Adverse Effects Of Psychostimulants with abuse potential')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y498', N'Efectos Adversos De Otras Drogas Psicotropicas, No Clasificadas En Otra Parte', N'Other Adverse Effects of Psychotropic Drugs, Not Elsewhere Classified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y499', N'Efectos Adversos De Drogas Psicotropicas No Especificadas', N'Adverse Effects of Psychotropic Drugs Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y50', N'Efectos Adversos De Estimulantes Del Sistema Nervioso Central, No Clasificadas En Otra Parte', N'Adverse Effects Of Stimulants Central Nervous System, Not Elsewhere Classified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y500', N'Efectos Adversos De Analepticos', N'Adverse Effects Of analeptic')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y501', N'Efectos Adversos De Antagonistas De Opiaceos', N'Adverse Effects Of Opiates Antagonists')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y502', N'Efectos Adversos De Metilxantinas, No Clasificadas En Otra Parte', N'Adverse Effects Of Methylxanthines, Not Elsewhere Classified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y508', N'Efectos Adversos De Otros Estimulantes Del Sistema Nervioso Central', N'Other Adverse Effects Of Stimulants Central Nervous System')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y509', N'Efectos Adversos De Estimulante No Especificado Del Sistema Nervioso Central', N'Adverse Effects Of Not Specified Stimulating the Central Nervous System')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y51', N'Efectos Adversos De Drogas Que Afectan Primariamente El Sistema Nervioso Autonomo', N'Adverse Drug Primarily Affecting Autonomous Nervous System')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y510', N'Efectos Adversos De Agentes Anticolinesterasa', N'Adverse Effects Of Anticholinesterase Agents')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y511', N'Efectos Adversos De Otros Parasimpaticomimeticos [Colinergicos]', N'Adverse Effects From Other Parasympathomimetics [Cholinergic]')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y512', N'Efectos Adversos De Drogas Bloqueadoras Ganglionares, No Clasificadas En Otra Parte', N'Adverse Drug Ganglion Blockers, Not Elsewhere Classified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y513', N'Efectos Adversos De Otros Parasimpaticoliticos [Anticolinergicos Y Antimuscarinicos] Y Espasmoliticos, No Clasificados En Otra Parte', N'Adverse Effects From Other parasympatholytics [anticholinergics and antimuscarinics] and spasmolytic, Not Elsewhere Classified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y514', N'Efectos Adversos De Agonistas [Estimulantes] Predominantemente Alfa-Adrenergicos, No Clasificados En Otra Parte', N'Adverse Effects Of Agonists [stimulants] Alpha-Adrenergic Predominantly, Not Classified Elsewhere')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y515', N'Efectos Adversos De Agonistas [Estimulantes] Predominantemente Beta-Adrenergicos, No Clasificados En Otra Parte', N'Adverse Effects Of Agonists [stimulants] Predominantly Beta-Adrenergic, Not Elsewhere Classified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y516', N'Efectos Adversos De Antagonistas [Bloqueadores] Alfa-Adrenergicos, No Clasificados En Otra Parte', N'Adverse Effects Of Antagonists [blockers] Alpha-Adrenergic, Not Classified Elsewhere')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y517', N'Efectos Adversos De Antagonistas [Bloqueadores] Beta-Adrenergicos, No Clasificados En Otra Parte', N'Adverse Effects Of Antagonists [blockers] Beta-Adrenergic, Not Elsewhere Classified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y518', N'Efectos Adversos De Agentes Bloqueadores Neuro-Adrenergicos Que Actuan Centralmente, No Clasificados En Otra Parte', N'Adverse De Neuro-Adrenergic Blocking Agents centrally acting, Not Elsewhere Classified Effects')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y519', N'Efectos Adversos De Otras Drogas Que Afectan Primariamente El Sistema Nervioso Autonomo, Y Las No Especificadas', N'Adverse Effects Of Other Drugs Affecting Primarily Autonomous Nervous System, and unspecified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y52', N'Efectos Adversos De Agentes Que Afectan El Sistema Cardiovascular', N'Adverse Effects Of Agents That Affect The Cardiovascular System')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Y520', N'Efectos Adversos De Glucosidos Cardiotonicos Y Drogas De Accion Similar', N'Adverse Effects Of Drugs In cardiac glycosides And Similar Action')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z550', N'Problemas Relacionados Con El Analfabetismo O Bajo Nivel De InstruccióN', N'Related Problems With Illiteracy or low level of education')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z551', N'Problemas Relacionados Con La Educacion No Disponible O Inaccesible', N'Relating unavailable or inaccessible Education Problems')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z552', N'Problemas Relacionados Con La Falla En Los Examenes', N'Related Problems With Failure In The Exam')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z553', N'Problemas Relacionados Con El Bajo Rendimiento Escolar', N'Relating Underachievement Problem')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z554', N'Problemas Relacionados Con La Inadaptacion Educacional Y Desavenencias Con Maestros Y CompañEros', N'Relating Educational maladjustment problems and discrepancies with teachers and peers')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z558', N'Otros Problemas Relacionados Con La Educacion Y La Alfabetizacion', N'Other Related Problems With Education And Literacy')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z559', N'Problema No Especificado Relacionado Con La Educacion Y La Alfabetizacion', N'Related Not Specified Problem With Education And Literacy')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z56', N'Problemas Relacionados Con El Empleo Y El Desempleo', N'Issues Related To Employment And Unemployment')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z560', N'Problemas Relacionados Con El Desempleo, No Especificados', N'Relating Unemployment Problems Not Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z561', N'Problemas Relacionados Con El Cambio De Empleo', N'Related Problems With Change Jobs')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z562', N'Problemas Relacionados Con Amenaza De Perdida Del Empleo', N'Related Problems With Threat Of Employment Loss')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z563', N'Problemas Relacionados Con Horario Estresante De Trabajo', N'Related Problems With Stressful Work Schedule')
GO
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z564', N'Problemas Relacionados Con Desavenencias Con El Jefe Y Los CompañEros De Trabajo', N'Disputes Relating With Head And coworkers Problems')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z565', N'Problemas Relacionados Con El Trabajo Incompatible', N'Related Problems With Incompatible Job')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z566', N'Otros Problemas De Tension Fisica O Mental Relacionadas Con El Trabajo', N'Other Physical Disabilities or Mental Tension With Work Related')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z567', N'Otros Problemas Y Los No Especificados Relacionados Con El Empleo', N'Other and unspecified Problems Related To Jobs')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z57', N'Exposicion A Factores De Riesgo Ocupacional', N'Occupational Exposure to Risk Factors')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z570', N'Exposicion Ocupacional Al Ruido', N'Occupational Noise Exposure Al')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z571', N'Exposicion Ocupacional A La Radiacion', N'Occupational Exposure To Radiation')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z572', N'Exposicion Ocupacional Al Polvo', N'Occupational Exposure To Dust')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z573', N'Exposicion Ocupacional A Otro Contaminante Del Aire', N'Occupational Exposure To Another From Air Pollutant')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z574', N'Exposicion Ocupacional A Agentes Toxicos En Agricultura', N'Occupational Exposure to Toxic Agents in Agriculture')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z575', N'Exposicion Ocupacional A Agentes Toxicos En Otras Industrias', N'Occupational Exposure to Toxic Agents in Other Industries')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z576', N'Exposicion Ocupacional A Temperatura Extrema', N'Occupational Exposure to Extreme Temperature')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z577', N'Exposicion Ocupacional A La Vibracion', N'Occupational Exposure To Vibration')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z578', N'Exposicion Ocupacional A Otros Factores De Riesgo', N'Occupational Exposure to Other Risk Factors')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z579', N'Exposicion Ocupacional A Factor De Riesgo No Especificado', N'Occupational Exposure to Unspecified Risk Factor')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z58', N'Problemas Relacionados Con El Ambiente Fisico', N'Related Problems With The Physical Environment')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z580', N'Exposicion Al Ruido', N'Noise exposure')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z581', N'Exposicion Al Aire Contaminado', N'Exposure to air pollution')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z582', N'Exposicion Al Agua Contaminada', N'Exposure to contaminated water')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z583', N'Exposicion Al Suelo Contaminado', N'Exposure to contaminated soil')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z584', N'Exposicion A La Radiacion', N'Radiation exposure')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z585', N'Exposicion A Otras Contaminaciones Del Ambiente Fisico', N'Other Contamination From Exhibition A Physical Environment')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z586', N'Suministro Inadecuado De Agua Potable', N'Inadequate Supply Drinking Water')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z588', N'Otros Problemas Relacionados Con El Ambiente Fisico', N'Other Related Problems With The Physical Environment')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z589', N'Problema No Especificado Relacionado Con El Ambiente Fisico', N'Problem Related With Not Specified Physical Environment')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z59', N'Problemas Relacionados Con La Vivienda Y Las Circunstancias Economicas', N'Housing Issues Relating To Economics And Circumstances')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z590', N'Problemas Relacionados Con La Falta De Vivienda', N'Problems Related With Lack Of Housing')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z591', N'Problemas Relacionados Con Vivienda Inadecuada', N'Related Problems With Inadequate Housing')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z592', N'Problemas Caseros Y Con Vecinos E Inquilinos', N'Homemade And Tenant Problems With Neighbors E')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z593', N'Problemas Relacionados Con Persona Que Reside En Una Institucion', N'That Problems Relating To Individual resident in a')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z594', N'Problemas Relacionados Con Falta De Alimentos Adecuados', N'Related Problems Lacking Adequate Food')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z595', N'Problemas Relacionados Con Pobreza Extrema', N'Related Problems With Extreme Poverty')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z596', N'Problemas Relacionados Con Bajos Ingresos', N'Related Problems With Low Income')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z597', N'Problemas Relacionados Con Seguridad Social Y Sostenimiento Insuficientes Para El Bienestar', N'Related To Social Security And Sustainability For Deficient Welfare Issues')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z598', N'Otros Problemas Relacionados Con La Vivienda Y Las Circunstancias Economicas', N'Other Issues Relating To Housing And Economics Circumstances')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z599', N'Problemas No Especificados Relacionados Con La Vivienda Y Las Circunstancias Economicas', N'Not Specified Issues Relating To Housing And Economic Circumstances')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z60', N'Problemas Relacionados Con El Ambiente Social', N'Related Problems With Social Environment')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z600', N'Problemas Relacionados Con El Ajuste A Las Transiciones Del Ciclo Vital', N'Related To Set A Cycle Transitions Vital Issues')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z601', N'Problemas Relacionados Con Situacion Familiar Atipica', N'Related Problems With Family Status Atipica')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z602', N'Problemas Relacionados Con Persona Que Vive Sola', N'Issues Relating Individual Who Lives Alone')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z603', N'Problemas Relacionados Con La Adaptacion Cultural', N'Related Problems With Cultural Adaptation')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z604', N'Problemas Relacionados Con Exclusion Y Rechazo Social', N'Related Problems and Social Exclusion With Rejection')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z605', N'Problemas Relacionados Con La Discriminacion Y Persecucion Percibidas', N'Related Problems With Perceived Discrimination and Persecution')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z608', N'Otros Problemas Relacionados Con El Ambiente Social', N'Other Related Problems With Social Environment')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z609', N'Problema No Especificado Relacionado Con El Ambiente Social', N'Related Not Specified Problem With Social Environment')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z61', N'Problemas Relacionados Con Hechos Negativos En La Ninez', N'Negative Acts Relating Problems in Childhood')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z610', N'Problemas Relacionados Con La Perdida De Relacion Afectiva En La Infancia', N'Related Problems With Affective Relationship Loss in Childhood')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z611', N'Problemas Relacionados Con El Alejamiento Del Hogar En La Infancia', N'Relating Zoom Household Problems in Childhood')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z612', N'Problemas Relacionados Con Alteracion En El Patron De La Relacion Familiar En La Infancia', N'Relating Alteration In The Family Patron Of Relationship Problems In Children')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z613', N'Problemas Relacionados Con Eventos Que Llevaron A La Perdida De La Autoestima En La Infancia', N'Issues Relating events that led to the loss of self esteem in Childhood')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z614', N'Problemas Relacionados Con El Abuso Sexual Del NiñO Por Persona Dentro Del Grupo De Apoyo Primario', N'Related To Child Sexual Abuse Inside Person Support Group Primary Problems')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z615', N'Problemas Relacionados Con El Abuso Sexual Del NiñO Por Persona Ajena Al Grupo De Apoyo Primario', N'Related To Child Sexual Abuse Issues Beyond Person At Primary Support Group')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z616', N'Problemas Relacionados Con Abuso Fisico Del NiñO', N'Physical Abuse Related Problems With child')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z617', N'Problemas Relacionados Con Experiencias Personales Atemorizantes En La Infancia', N'Problems Related With Personal Experiences Frightening in Childhood')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z618', N'Problemas Relacionados Con Otras Experiencias Negativas En La Infancia', N'Other Issues Relating Negative Experiences in Childhood')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z619', N'Problemas Relacionados Con Experiencia Negativa No Especificada En La Infancia', N'Related Problems Experienced Negative Not Specified in Childhood')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z62', N'Otros Problemas Relacionados Con La Crianza Del Nino', N'Other Related Problems With Child Rearing')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z620', N'Problemas Relacionados Con La Supervision O El Control Inadecuados De Los Padres', N'Related Problems With Inadequate Supervision Or Control Fathers')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z621', N'Problemas Relacionados Con La Sobreproteccion De Los Padres', N'Relating overprotective Issues Parents')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z622', N'Problemas Relacionados Con La Crianza En Institucion', N'Related Problems With Aging In Institution')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z623', N'Problemas Relacionados Con Hostilidad Y Reprobacion Al NiñO', N'Relating to the Child Hostility and failure problems')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z624', N'Problemas Relacionados Con El Abandono Emocional Del NiñO', N'Related Problems With Emotional Abandonment child')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z625', N'Otros Problemas Relacionados Con Negligencia En La Crianza Del NiñO', N'Other Related Problems With Negligence child rearing')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z626', N'Problemas Relacionados Con Presiones Inapropiadas De Los Padres Y Otras Anormalidades En La Calidad De La Crianza', N'Inappropriate Pressures Related Problems With Parents and Other Abnormalities In The Quality Of Parenting')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z628', N'Otros Problemas Especificados Y Relacionados Con La Crianza Del NiñO', N'Other Specified and Related Problems With Child Rearing')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z629', N'Problema No Especificado Relacionado Con La Crianza Del NiñO', N'Problem Related To Not Specified child rearing')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z63', N'Problemas Relacionados Con El Grupo Primario De Apoyo, Inclusive Circunstancias Familiares', N'Relating Primary Issues Support Group, Inclusive Family Circumstances')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z630', N'Problemas En La Relacion Entre Esposos O Pareja', N'Problems In The Relationship Between Spouses or Partner')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z631', N'Problemas En La Relacion Con Los Padres Y Los Familiares Politicos', N'Problems In Relationship With Parents And Political Family')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z632', N'Problemas Relacionados Con El Apoyo Familiar Inadecuado', N'Inappropriate Related Problems With Family Support')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z633', N'Problemas Relacionados Con La Ausencia De Un Miembro De La Familia', N'Problems Related With Lack Of A Family Member')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z634', N'Problemas Relacionados Con La Desaparicion O Muerte De Un Miembro De La Familia', N'Related Problems With The Disappearance O Death Of A Family Member')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z635', N'Problemas Relacionados Con La Ruptura Familiar Por Separacion O Divorcio', N'Relating Family Breakup Of Separation Or Divorce Problems')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z636', N'Problemas Relacionados Con Familiar Dependiente, Necesitado De Cuidado En La Casa', N'Relating Dependent Family Problems, Care Needed In The House')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z637', N'Problemas Relacionados Con Otros Hechos Estresantes Que Afectan A La Familia Y Al Hogar', N'Other Acts Relating Stressors Affecting A Family And At Home Problems')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z974', N'Presencia De Audifono Externo', N'Presence of External Headphone')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z975', N'Presencia De Dispositivo Anticonceptivo (Intrauterino)', N'Presence of contraceptive device (Intrauterine)')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z978', N'Presencia De Otros Dispositivos Especificados', N'Presence of other specified devices')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z98', N'Otros Estados Postquirurgicos', N'Other states postsurgical')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z980', N'Estado De Derivacion Intestinal O Anastomosis', N'O Estado De Derivacion Intestinal Anastomosis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z981', N'Estado De Artrodesis', N'Status Arthrodesis')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z982', N'Presencia De Dispositivo Para Drenaje De Liquido Cefalorraquideo', N'Presence Of Device For Cerebrospinal Fluid Drainage')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z988', N'Otros Estados Postquirurgicos Especificados', N'Other postsurgical states Specified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z99', N'Dependencia De Maquinas Y Dispositivos Capacitantes, No Clasificadas En Otra Parte', N'Dependence Machines incapacitating Devices, Not Elsewhere Classified')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z990', N'Dependencia De Aspirador', N'Dependence Vacuum')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z991', N'Dependencia De Respirador', N'Dependence Respirator')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z992', N'Dependencia De Dialisis Renal', N'Renal Dialysis Unit From')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z993', N'Dependencia De Silla De Ruedas', N'Dependence Wheel Chair')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z998', N'Dependencia De Otras Maquinas Y Dispositivos Capacitantes', N'Unit Of Other Machinery incapacitating devices')
INSERT [dbo].[ICD10] ([Code], [Descripcion_es], [Descripcion_en]) VALUES (N'Z999', N'Dependencia De Maquina Y Dispositivo Capacitante, No Especificada', N'Dependence capacitating Device Used And, not Specified')
SET IDENTITY_INSERT [dbo].[laboratorios] ON 

INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (1, N'Generico', N'')
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (2, N'Ethical', N'')
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (3, N'Acromax Dominicana, S A', N'')
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (4, N'Laboratorios Sued', N'')
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (5, N'Abbott Republica Dominicana', N'')
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (6, N'Laboratorios Alfa', N'')
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (7, N'Laboratorios Roldán CxA', N'')
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (8, N'Sanofi-Aventis', N'')
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (9, N'Laboratorio San Luis', N'')
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (10, N'Laboratorios LAM', N'')
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (11, N'Pharma A. G. Trading, S.A.', N'')
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (12, N'Medifarma, CxA', N'')
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (13, N'Laboratorios Unión, S.A.', N'')
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (14, N'Suipar', N'')
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (15, N'MSD Republica Dominicana', N'')
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (16, N'Hospira', N'')
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (17, N'Laboratorios Rangel, CxA', N'')
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (18, N'Laboratorios Italdom S.A.', N'')
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (19, N'Medietic, S.A.', N'')
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (20, N'Farcaribe, CxA', N'')
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (21, N'Alopecil Corporation, CxA', N'')
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (22, N'Grupo Profármaco', N'')
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (23, N'Laboratorio Químico Dominicano C.xA.', N'')
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (24, N'Oscar A. Renta Negron', N'')
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (25, N'ethical 2', NULL)
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (26, N'casa real', NULL)
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (27, N'Disfariq', NULL)
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (28, N'Laboratorio Normon', NULL)
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (29, N'colins', NULL)
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (30, N'phoenix', NULL)
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (31, N'incol', NULL)
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (32, N'leyra', NULL)
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (33, N'samed', NULL)
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (34, N'saad farmaceutica', NULL)
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (35, N'disfarig', NULL)
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (36, N'alfa', NULL)
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (37, N'imenol', NULL)
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (38, N'thical', NULL)
INSERT [dbo].[laboratorios] ([ID], [nombre], [direccion]) VALUES (39, N'a', NULL)
SET IDENTITY_INSERT [dbo].[laboratorios] OFF
SET IDENTITY_INSERT [dbo].[motivos] ON 

INSERT [dbo].[motivos] ([ID], [Codigo], [Nombre], [Descripcion], [BalAnt], [BalAct], [Origen], [autor], [FecRecordar], [marcaRecordar], [fecUltTrans]) VALUES (2, N'250', N'CXC', N'', CAST(-555555555357.00 AS Decimal(18, 2)), CAST(-555555555757.00 AS Decimal(18, 2)), 1, N'salon', NULL, NULL, NULL)
INSERT [dbo].[motivos] ([ID], [Codigo], [Nombre], [Descripcion], [BalAnt], [BalAct], [Origen], [autor], [FecRecordar], [marcaRecordar], [fecUltTrans]) VALUES (3, N'121 ', N'Ingreso por Venta o Servicio', N'', CAST(1097.00 AS Decimal(18, 2)), CAST(1093.00 AS Decimal(18, 2)), 2, N'salon', NULL, NULL, NULL)
INSERT [dbo].[motivos] ([ID], [Codigo], [Nombre], [Descripcion], [BalAnt], [BalAct], [Origen], [autor], [FecRecordar], [marcaRecordar], [fecUltTrans]) VALUES (6, N'147', N'Ventas Exoneradas, Descuentos, Promosiones', N'', CAST(0.00 AS Decimal(18, 2)), CAST(1500.00 AS Decimal(18, 2)), 1, N'salon', NULL, NULL, NULL)
INSERT [dbo].[motivos] ([ID], [Codigo], [Nombre], [Descripcion], [BalAnt], [BalAct], [Origen], [autor], [FecRecordar], [marcaRecordar], [fecUltTrans]) VALUES (7, N'400', N'VENTAS', N'', CAST(0.00 AS Decimal(18, 2)), CAST(66666.00 AS Decimal(18, 2)), 1, N'salon', NULL, NULL, NULL)
INSERT [dbo].[motivos] ([ID], [Codigo], [Nombre], [Descripcion], [BalAnt], [BalAct], [Origen], [autor], [FecRecordar], [marcaRecordar], [fecUltTrans]) VALUES (8, N'527', N'MANO DE OBRA', N'', NULL, CAST(0.00 AS Decimal(18, 2)), 1, N'salon', NULL, NULL, NULL)
INSERT [dbo].[motivos] ([ID], [Codigo], [Nombre], [Descripcion], [BalAnt], [BalAct], [Origen], [autor], [FecRecordar], [marcaRecordar], [fecUltTrans]) VALUES (11, N'168', N'DEUDAS', N'', CAST(-74077.00 AS Decimal(18, 2)), CAST(-73677.00 AS Decimal(18, 2)), 2, N'salon', NULL, NULL, NULL)
INSERT [dbo].[motivos] ([ID], [Codigo], [Nombre], [Descripcion], [BalAnt], [BalAct], [Origen], [autor], [FecRecordar], [marcaRecordar], [fecUltTrans]) VALUES (12, N'500', N'CAPITAL', N'', NULL, CAST(0.00 AS Decimal(18, 2)), 2, N'salon', NULL, NULL, NULL)
INSERT [dbo].[motivos] ([ID], [Codigo], [Nombre], [Descripcion], [BalAnt], [BalAct], [Origen], [autor], [FecRecordar], [marcaRecordar], [fecUltTrans]) VALUES (13, N'000', N'EFECTIVO', N'', CAST(1500.00 AS Decimal(18, 2)), CAST(-9611.00 AS Decimal(18, 2)), 1, N'salon', NULL, NULL, NULL)
INSERT [dbo].[motivos] ([ID], [Codigo], [Nombre], [Descripcion], [BalAnt], [BalAct], [Origen], [autor], [FecRecordar], [marcaRecordar], [fecUltTrans]) VALUES (14, N'450', N'CXP', N'', NULL, CAST(0.00 AS Decimal(18, 2)), 2, N'salon', NULL, NULL, NULL)
INSERT [dbo].[motivos] ([ID], [Codigo], [Nombre], [Descripcion], [BalAnt], [BalAct], [Origen], [autor], [FecRecordar], [marcaRecordar], [fecUltTrans]) VALUES (15, N'251', N'888', N'', NULL, CAST(0.00 AS Decimal(18, 2)), 1, N'salon', NULL, NULL, NULL)
INSERT [dbo].[motivos] ([ID], [Codigo], [Nombre], [Descripcion], [BalAnt], [BalAct], [Origen], [autor], [FecRecordar], [marcaRecordar], [fecUltTrans]) VALUES (16, N'254', N'INGRESOS', N'', CAST(0.00 AS Decimal(18, 2)), CAST(-99999999999.00 AS Decimal(18, 2)), 2, N'salon', NULL, NULL, NULL)
INSERT [dbo].[motivos] ([ID], [Codigo], [Nombre], [Descripcion], [BalAnt], [BalAct], [Origen], [autor], [FecRecordar], [marcaRecordar], [fecUltTrans]) VALUES (17, N'568', N'Ingreso Por Servicio', N'', NULL, CAST(0.00 AS Decimal(18, 2)), 2, N'salon', NULL, NULL, NULL)
INSERT [dbo].[motivos] ([ID], [Codigo], [Nombre], [Descripcion], [BalAnt], [BalAct], [Origen], [autor], [FecRecordar], [marcaRecordar], [fecUltTrans]) VALUES (18, N'545', N'AGUA', N'', NULL, CAST(0.00 AS Decimal(18, 2)), 1, N'salon', NULL, NULL, NULL)
INSERT [dbo].[motivos] ([ID], [Codigo], [Nombre], [Descripcion], [BalAnt], [BalAct], [Origen], [autor], [FecRecordar], [marcaRecordar], [fecUltTrans]) VALUES (19, N'542', N'Electricidad', N'', NULL, CAST(0.00 AS Decimal(18, 2)), 1, N'salon', NULL, NULL, NULL)
INSERT [dbo].[motivos] ([ID], [Codigo], [Nombre], [Descripcion], [BalAnt], [BalAct], [Origen], [autor], [FecRecordar], [marcaRecordar], [fecUltTrans]) VALUES (20, N'547', N'Mobiliario', N'', NULL, CAST(0.00 AS Decimal(18, 2)), 1, N'salon', NULL, NULL, NULL)
INSERT [dbo].[motivos] ([ID], [Codigo], [Nombre], [Descripcion], [BalAnt], [BalAct], [Origen], [autor], [FecRecordar], [marcaRecordar], [fecUltTrans]) VALUES (21, N'545', N'Sueldo a Empleados', N'', CAST(-2000.00 AS Decimal(18, 2)), CAST(4222.00 AS Decimal(18, 2)), 1, N'salon', NULL, NULL, NULL)
INSERT [dbo].[motivos] ([ID], [Codigo], [Nombre], [Descripcion], [BalAnt], [BalAct], [Origen], [autor], [FecRecordar], [marcaRecordar], [fecUltTrans]) VALUES (22, N'452', N'999999', N'', NULL, CAST(0.00 AS Decimal(18, 2)), 2, N'salon', NULL, NULL, NULL)
INSERT [dbo].[motivos] ([ID], [Codigo], [Nombre], [Descripcion], [BalAnt], [BalAct], [Origen], [autor], [FecRecordar], [marcaRecordar], [fecUltTrans]) VALUES (23, N'855', N'Cuenta Vit', N'', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, N'salon', CAST(N'2016-05-17' AS Date), 0, CAST(N'2016-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[motivos] ([ID], [Codigo], [Nombre], [Descripcion], [BalAnt], [BalAct], [Origen], [autor], [FecRecordar], [marcaRecordar], [fecUltTrans]) VALUES (24, N'pp', N'TC Reservas', N'', CAST(-1000.00 AS Decimal(18, 2)), CAST(-1100.00 AS Decimal(18, 2)), 1, N'salon', CAST(N'2016-06-17' AS Date), 1, CAST(N'2016-05-17T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[motivos] OFF
SET IDENTITY_INSERT [dbo].[opciones] ON 

INSERT [dbo].[opciones] ([id], [nombre], [descripcion], [link], [autor], [orden]) VALUES (1, N'Procedimientos', N'Administracion de los procedimientos que pueden ser realizados', N'Procedimientos.aspx', N'doctora', 3)
INSERT [dbo].[opciones] ([id], [nombre], [descripcion], [link], [autor], [orden]) VALUES (2, N'Procedimientos', N'Administracion de los procedimientos que pueden ser realizados', N'Procedimientos.aspx', N'obs', 3)
INSERT [dbo].[opciones] ([id], [nombre], [descripcion], [link], [autor], [orden]) VALUES (3, N'ICD10', N'Manual Diagnostico de enfermedades', N'ICD10.aspx', N'doctora', 2)
INSERT [dbo].[opciones] ([id], [nombre], [descripcion], [link], [autor], [orden]) VALUES (4, N'ICD10', N'Manual Diagnostico de enfermedades', N'ICD10.aspx', N'obs', 2)
INSERT [dbo].[opciones] ([id], [nombre], [descripcion], [link], [autor], [orden]) VALUES (5, N'H. Anestesica', N'Historia Anestesica del Paciente', N'hAnestesica.aspx', N'doctora', 5)
INSERT [dbo].[opciones] ([id], [nombre], [descripcion], [link], [autor], [orden]) VALUES (6, N'H. Obstetrica', N'Historia de Obstetricia del paciente', N'hObstetrica', N'obs', NULL)
INSERT [dbo].[opciones] ([id], [nombre], [descripcion], [link], [autor], [orden]) VALUES (7, N'Paciente', N'Administracion de los Pacientes', N'PacientesAnestesia.aspx', N'doctora', 4)
INSERT [dbo].[opciones] ([id], [nombre], [descripcion], [link], [autor], [orden]) VALUES (8, N'Paciente', N'Administracion de los Pacientes', N'PacientesObstetricia.aspx', N'obs', 4)
INSERT [dbo].[opciones] ([id], [nombre], [descripcion], [link], [autor], [orden]) VALUES (9, N'Inicio', N'Pantalla de Inicio', N'InicioAnestesia.aspx', N'doctora', 1)
INSERT [dbo].[opciones] ([id], [nombre], [descripcion], [link], [autor], [orden]) VALUES (10, N'Inicio', N'Pantalla de Inicio', N'InicioObstetricia.aspx', N'obs', 1)
INSERT [dbo].[opciones] ([id], [nombre], [descripcion], [link], [autor], [orden]) VALUES (11, N'Pacientes', N'Administracion de los Pacientes', N'PacientesAmico.aspx', N'amico', 3)
INSERT [dbo].[opciones] ([id], [nombre], [descripcion], [link], [autor], [orden]) VALUES (12, N'App', N'Pantalla de Inicio', N'InicioObstetricia.aspx', N'dorka', 1)
INSERT [dbo].[opciones] ([id], [nombre], [descripcion], [link], [autor], [orden]) VALUES (13, N'Pacientes', N'Administracion de los Pacientes', N'PacientesObstetricia.aspx', N'dorka', 2)
SET IDENTITY_INSERT [dbo].[opciones] OFF
INSERT [dbo].[paciente] ([record], [userID], [seguro], [gruposanguineoID], [padecimientosInfancia], [fechaCreacion], [condicionActual], [diabetes], [drogas], [tabaco], [alcohol], [gastrointestinal], [menstruation], [alergias], [respiracion], [piel], [urinarias], [psiquiatria], [otros], [sirugias], [transfusiones], [medicinasNaturales], [farmacos], [ultimaVisita], [edad], [referido], [autor], [seguroID]) VALUES (N'43', 43, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 222, N'eeeeeeeeeeeee', N'obs', 0)
INSERT [dbo].[paciente] ([record], [userID], [seguro], [gruposanguineoID], [padecimientosInfancia], [fechaCreacion], [condicionActual], [diabetes], [drogas], [tabaco], [alcohol], [gastrointestinal], [menstruation], [alergias], [respiracion], [piel], [urinarias], [psiquiatria], [otros], [sirugias], [transfusiones], [medicinasNaturales], [farmacos], [ultimaVisita], [edad], [referido], [autor], [seguroID]) VALUES (N'44', 44, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'', N'doctora', 0)
INSERT [dbo].[paciente] ([record], [userID], [seguro], [gruposanguineoID], [padecimientosInfancia], [fechaCreacion], [condicionActual], [diabetes], [drogas], [tabaco], [alcohol], [gastrointestinal], [menstruation], [alergias], [respiracion], [piel], [urinarias], [psiquiatria], [otros], [sirugias], [transfusiones], [medicinasNaturales], [farmacos], [ultimaVisita], [edad], [referido], [autor], [seguroID]) VALUES (N'47', 47, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, N'', N'obs', 1)
INSERT [dbo].[paciente] ([record], [userID], [seguro], [gruposanguineoID], [padecimientosInfancia], [fechaCreacion], [condicionActual], [diabetes], [drogas], [tabaco], [alcohol], [gastrointestinal], [menstruation], [alergias], [respiracion], [piel], [urinarias], [psiquiatria], [otros], [sirugias], [transfusiones], [medicinasNaturales], [farmacos], [ultimaVisita], [edad], [referido], [autor], [seguroID]) VALUES (N'48', 48, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'', N'obs', 0)
INSERT [dbo].[paciente] ([record], [userID], [seguro], [gruposanguineoID], [padecimientosInfancia], [fechaCreacion], [condicionActual], [diabetes], [drogas], [tabaco], [alcohol], [gastrointestinal], [menstruation], [alergias], [respiracion], [piel], [urinarias], [psiquiatria], [otros], [sirugias], [transfusiones], [medicinasNaturales], [farmacos], [ultimaVisita], [edad], [referido], [autor], [seguroID]) VALUES (N'49', 49, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, N'9999999', N'obs', 0)
SET IDENTITY_INSERT [dbo].[presentaciones] ON 

INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (3, N'Sin Presentacion', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (4, N'500 Ml', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (5, N'Tabletas: caja de 100 tabletas', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (6, N'Jarabe 120 mL', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (7, N'Comprimidos', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (8, N'Jarabe 100 mL', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (9, N'600 ml', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (10, N'tulio manuel cestero', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (11, N'50 ml', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (12, N'crema 20 g', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (13, N'frasco 120ml', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (14, N'pasta 90grs', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (15, N'Jarabe 60 mL', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (16, N'blister 10 tabletas ', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (17, N'caja de 1 ovulos ', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (18, N'gotas 20grs', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (19, N'jabon 10grs', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (20, N'suero 10grs', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (21, N' caja de  1ovulo', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (22, N'frasco 60 ml', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (23, N' blister 10 800 mg', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (24, N'blister 10 tabletas 600 ', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (25, N'frasco 3cc', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (26, N'frasco 10cc', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (27, N'frasco 5cc', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (28, N'ampollas 5 cc', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (29, N'ampollas 3 cc', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (30, N'solucion 20grs', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (31, N'caja de 1 tableta ', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (32, N'caja de 1 supositorio ', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (33, N'frasco de 16 onzas ', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (34, N'frasco de 40 ml ', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (35, N'frasco de 400grs', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (36, N'caja de 1 sobre ', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (37, N'fraco de 500 mililitro', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (38, N'FRASSCO 10 ML', 1)
INSERT [dbo].[presentaciones] ([ID], [nombre], [unidadID]) VALUES (39, N'FRASCO 10 ML', 1)
SET IDENTITY_INSERT [dbo].[presentaciones] OFF
SET IDENTITY_INSERT [dbo].[procedimientos] ON 

INSERT [dbo].[procedimientos] ([id], [code], [Nombre]) VALUES (1, N'0015', N'Macioflaxia2')
INSERT [dbo].[procedimientos] ([id], [code], [Nombre]) VALUES (2, N'D845', N'Cateterismo')
INSERT [dbo].[procedimientos] ([id], [code], [Nombre]) VALUES (3, N'8782', N'Operacion Vesicular')
INSERT [dbo].[procedimientos] ([id], [code], [Nombre]) VALUES (4, N'8', N'9')
SET IDENTITY_INSERT [dbo].[procedimientos] OFF
SET IDENTITY_INSERT [dbo].[pruebas] ON 

INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (1, N'001', 4, NULL, NULL, N'Prueba de Orina', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (2, N'001', 5, NULL, NULL, N'Ph', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (3, N'001', 6, NULL, NULL, N'Globulos Blancos', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (4, N'001', 7, NULL, NULL, N'Huevos', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (5, N'001', 8, NULL, NULL, N'H.I.V.', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (6, N'001', 9, NULL, NULL, N'Salmonela Tuphi O', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (7, N'001', 10, NULL, NULL, N'Glicemia', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (8, N'001', 11, NULL, NULL, N'', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (9, N'002', 1, NULL, NULL, N'Grs', N'Grs', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (10, N'002', 2, NULL, NULL, N'Litocitos', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (11, N'002', 3, NULL, NULL, N'Olor', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (12, N'002', 4, NULL, NULL, N'Prueba de Sanguinea', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (13, N'002', 5, NULL, NULL, N'Glucosa', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (14, N'002', 6, NULL, NULL, N'Globulos Rojos', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (15, N'002', 7, NULL, NULL, N'Investigacion de Amebas', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (16, N'002', 8, NULL, NULL, N'V.D.R.L', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (17, N'002', 9, NULL, NULL, N'Salmonela Typhi H', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (18, N'002', 10, NULL, NULL, N'Colesterol', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (19, N'003', 1, NULL, NULL, N'HTQ', N'HTQ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (20, N'003', 2, NULL, NULL, N'Eosinofilos', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (21, N'003', 3, NULL, NULL, N'Aspecto', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (22, N'003', 5, NULL, NULL, N'Albumina', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (23, N'003', 6, NULL, NULL, N'Celulas Epiteliales', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (24, N'003', 7, NULL, NULL, N'Sangre Oculta', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (25, N'003', 8, NULL, NULL, N'Factor Reumatolde', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (26, N'003', 9, NULL, NULL, N'Paratyphi A', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (27, N'003', 10, NULL, NULL, N'Trigliceridos', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (28, N'004', 1, NULL, NULL, N'GR', N'GR', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (29, N'004', 2, NULL, NULL, N'Banda', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (30, N'004', 3, NULL, NULL, N'Densidad', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (31, N'004', 5, NULL, NULL, N'Acetona', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (32, N'004', 6, NULL, NULL, N'Bacterias', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (33, N'004', 7, NULL, NULL, N'Otros', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (34, N'004', 8, NULL, NULL, N'A.S.O.', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (35, N'004', 9, NULL, NULL, N'Paratyphi B', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (36, N'004', 10, NULL, NULL, N'Urea', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (37, N'005', 1, NULL, NULL, N'G.B.', N'GB', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (38, N'005', 2, NULL, NULL, N'Monocitos', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (39, N'005', 5, NULL, NULL, N'Sangre Oculta', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (40, N'005', 6, NULL, NULL, N'Cristales', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (41, N'005', 8, NULL, NULL, N'P.C.R.', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (42, N'005', 9, NULL, NULL, N'Brucela Abortus', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (43, N'005', 10, NULL, NULL, N'Creatinina', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (44, N'006', 1, NULL, NULL, N'V.C.M.', N'VCM', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (45, N'006', 2, NULL, NULL, N'Basofilos', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (46, N'006', 5, NULL, NULL, N'Bilirrubina', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (47, N'006', 6, NULL, NULL, N'Fibras Mocosas', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (48, N'006', 8, NULL, NULL, N'Toxoplasmosis', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (49, N'006', 9, NULL, NULL, N'Proteus Oxig', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (50, N'006', 10, NULL, NULL, N'S.G.O.T.', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (51, N'007', 1, NULL, NULL, N'H.C.M.', N'HCM', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (52, N'007', 2, NULL, NULL, N'Jueniles', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (53, N'007', 5, NULL, NULL, N'Urobilinogeno', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (54, N'007', 6, NULL, NULL, N'Cilindros', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (55, N'007', 8, NULL, NULL, N'I.G.G., I.G.M.', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (56, N'007', 10, NULL, NULL, N'S.G.P.T.', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (57, N'008', 1, NULL, NULL, N'C.H.C.M.', N'CHCM', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (58, N'008', 2, NULL, NULL, N'Celulas Falciformes', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (59, N'008', 5, NULL, NULL, N'Nitrito', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (60, N'008', 6, NULL, NULL, N'Levaduras', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (61, N'008', 8, NULL, NULL, N'Hepatitis B', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (62, N'008', 10, NULL, NULL, N'Acido Urico', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (63, N'009', 2, NULL, NULL, N'Eritrosedimentacion', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (64, N'009', 6, NULL, NULL, N'Parasitos', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (65, N'009', 10, NULL, NULL, N'BILIRRUBINA', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (66, N'010', 2, NULL, NULL, N'Tiempo de Sangria', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (67, N'010', 8, NULL, NULL, N'IGM', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (68, N'010', 10, NULL, NULL, N'BILIRRUBINA Total Directa', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (69, N'011', 2, NULL, NULL, N'Tiempo de Coagulacion', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (70, N'011', 8, NULL, NULL, N'TSanguinea', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (71, N'011', 10, NULL, NULL, N'BILIRRUBINA Total Indirecta', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (72, N'012', 2, NULL, NULL, N'Conteo de Plaquetas', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (73, N'012', 8, NULL, NULL, N'Embarazo', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (74, N'012', 10, NULL, NULL, N'BILIRRUBINA Total', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (75, N'013', 2, NULL, NULL, N'Conteo de Eosinofilos', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (76, N'013', 8, NULL, NULL, N'HVC', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (77, N'013', 10, NULL, NULL, N'HDL', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (78, N'014', 2, NULL, NULL, N'Conteo de Reticulocitos', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (79, N'014', 10, NULL, NULL, N'LDL', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (80, N'015', 2, NULL, NULL, N'Hematozoarios', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (81, N'015', 10, NULL, NULL, N'Albumina', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (82, N'016', 2, NULL, NULL, N'Extendido de Sangre Periferica', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (83, N'016', 10, NULL, NULL, N'Amilasa', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (84, N'017', 2, NULL, NULL, N'Comentarios Sobre Recuento Diferencial', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (85, N'017', 10, NULL, NULL, N'Liposa', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (86, N'018', 10, NULL, NULL, N'Fosfatasa Acida', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (87, N'019', 10, NULL, NULL, N'Hbg Glucosilada', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (88, N'020', 10, NULL, NULL, N'VLDL', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (89, N'021', 10, NULL, NULL, N'Proteina Total', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (90, N'022', 10, NULL, NULL, N'Albumine', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (91, N'023', 10, NULL, NULL, N'Globulina', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (92, N'024', 10, NULL, NULL, N'Relacion A/G', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (93, N'025', 10, NULL, NULL, N'H_Pilory', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (94, N'026', 10, NULL, NULL, N'Fosfata Alcalina', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (95, N'027', 8, NULL, NULL, N'TSanguineaRH', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (96, N'030', 10, NULL, NULL, N'LDH', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (97, N'031', 10, NULL, NULL, N'CK', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[pruebas] ([ID], [Code], [clasificacionID], [valorReferenciaID], [unidadID], [descripcion], [abreviatura], [comentarios], [precio], [stock], [indicaciones], [notas]) VALUES (98, N'032', 10, NULL, NULL, N'CKMB', N'', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[pruebas] OFF
GO
SET IDENTITY_INSERT [dbo].[pruebasClasificacion] ON 

INSERT [dbo].[pruebasClasificacion] ([ID], [Code], [descripcion], [detalle]) VALUES (1, N'01', N'Hematologia Hemograma', NULL)
INSERT [dbo].[pruebasClasificacion] ([ID], [Code], [descripcion], [detalle]) VALUES (2, N'02', N'Hematologia Recuento Diferencial', NULL)
INSERT [dbo].[pruebasClasificacion] ([ID], [Code], [descripcion], [detalle]) VALUES (3, N'03', N'Examen de Orina Examen Fisico', NULL)
INSERT [dbo].[pruebasClasificacion] ([ID], [Code], [descripcion], [detalle]) VALUES (4, N'04', N'Prueba de Embarazo', NULL)
INSERT [dbo].[pruebasClasificacion] ([ID], [Code], [descripcion], [detalle]) VALUES (5, N'05', N'Examen de Orina Examen Quimico', NULL)
INSERT [dbo].[pruebasClasificacion] ([ID], [Code], [descripcion], [detalle]) VALUES (6, N'06', N'Examen de Orina Examen Microscopico', NULL)
INSERT [dbo].[pruebasClasificacion] ([ID], [Code], [descripcion], [detalle]) VALUES (7, N'07', N'Coprologico', NULL)
INSERT [dbo].[pruebasClasificacion] ([ID], [Code], [descripcion], [detalle]) VALUES (8, N'08', N'Serologia', NULL)
INSERT [dbo].[pruebasClasificacion] ([ID], [Code], [descripcion], [detalle]) VALUES (9, N'09', N'Antigenos Febriles', NULL)
INSERT [dbo].[pruebasClasificacion] ([ID], [Code], [descripcion], [detalle]) VALUES (10, N'10', N'Qumica Sanguinea', NULL)
INSERT [dbo].[pruebasClasificacion] ([ID], [Code], [descripcion], [detalle]) VALUES (11, N'11', N'Otros Analisis', N'')
SET IDENTITY_INSERT [dbo].[pruebasClasificacion] OFF
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([id], [nombre], [descripcion], [autor]) VALUES (1, N'Administrador', N'Usuario administrador del sistema', N'doctora')
INSERT [dbo].[roles] ([id], [nombre], [descripcion], [autor]) VALUES (2, N'Administrador', N'Usuario administrador del sistema', N'obs')
INSERT [dbo].[roles] ([id], [nombre], [descripcion], [autor]) VALUES (1002, N'Administrador', N'Usuario administrador del sistema', N'amico')
INSERT [dbo].[roles] ([id], [nombre], [descripcion], [autor]) VALUES (1003, N'Administrador', N'Usuario Administrador del sistema', N'dorka')
INSERT [dbo].[roles] ([id], [nombre], [descripcion], [autor]) VALUES (1004, N'Super Usuario', N'Usuario Avanzado del sistema', N'dorka')
INSERT [dbo].[roles] ([id], [nombre], [descripcion], [autor]) VALUES (1005, N'Usuario', N'Usuario del sistema', N'dorka')
INSERT [dbo].[roles] ([id], [nombre], [descripcion], [autor]) VALUES (1006, N'Visitante', N'Visitante del sistema', N'dorka')
SET IDENTITY_INSERT [dbo].[roles] OFF
SET IDENTITY_INSERT [dbo].[rolesopciones] ON 

INSERT [dbo].[rolesopciones] ([opcionId], [rolID], [id]) VALUES (1, 1, 1)
INSERT [dbo].[rolesopciones] ([opcionId], [rolID], [id]) VALUES (5, 1, 3)
INSERT [dbo].[rolesopciones] ([opcionId], [rolID], [id]) VALUES (7, 1, 4)
INSERT [dbo].[rolesopciones] ([opcionId], [rolID], [id]) VALUES (9, 1, 5)
INSERT [dbo].[rolesopciones] ([opcionId], [rolID], [id]) VALUES (6, 2, 8)
INSERT [dbo].[rolesopciones] ([opcionId], [rolID], [id]) VALUES (8, 2, 9)
INSERT [dbo].[rolesopciones] ([opcionId], [rolID], [id]) VALUES (10, 2, 10)
INSERT [dbo].[rolesopciones] ([opcionId], [rolID], [id]) VALUES (11, 1002, 11)
INSERT [dbo].[rolesopciones] ([opcionId], [rolID], [id]) VALUES (12, 1003, 12)
INSERT [dbo].[rolesopciones] ([opcionId], [rolID], [id]) VALUES (12, 1004, 13)
INSERT [dbo].[rolesopciones] ([opcionId], [rolID], [id]) VALUES (12, 1005, 14)
INSERT [dbo].[rolesopciones] ([opcionId], [rolID], [id]) VALUES (12, 1006, 15)
INSERT [dbo].[rolesopciones] ([opcionId], [rolID], [id]) VALUES (13, 1003, 16)
INSERT [dbo].[rolesopciones] ([opcionId], [rolID], [id]) VALUES (13, 1004, 17)
INSERT [dbo].[rolesopciones] ([opcionId], [rolID], [id]) VALUES (13, 1005, 18)
INSERT [dbo].[rolesopciones] ([opcionId], [rolID], [id]) VALUES (13, 1006, 19)
SET IDENTITY_INSERT [dbo].[rolesopciones] OFF
SET IDENTITY_INSERT [dbo].[servicios] ON 

INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (1, N'0000', N'Farmacia', N'concepto general de todas las transacciones de farmacia resumidas en una sola transaccion', CAST(0.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (2, N'0001', N'Consulta General', N'Consulta medica general con cualquiera de los espe', CAST(125.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (3, N'0002', N'Analisis de Laboratorio', N'analisis realizado en laboratorio', CAST(155.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (4, N'0003', N'Ginecologia', N'examenes ginecologicos', CAST(250.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (5, N'0004', N'PapaNicolao H', N'', CAST(250.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (6, N'0005', N'PapaNicolao M', N'', CAST(350.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (7, N'0006', N'Otro', N'las diferencias que vengan de otros', CAST(1.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (8, N'0007', N'Consulta de paciente nuevo', N'', CAST(135.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (9, N'0008', N'Odontologia Extraccion', N'', CAST(100.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (10, N'0009', N'Odontologia Profilaxis', N'', CAST(200.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (11, N'0010', N'Odontologia Recina', N'', CAST(400.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (12, N'0011', N'Odontologia Amalgama', N'', CAST(125.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (13, N'0012', N'Odontologia Cura', N'', CAST(100.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (14, N'0013', N'Neurologia y Diabetologia', N'', CAST(250.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (15, N'0014', N'Psicologia Nuevo Paciente', N'', CAST(300.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (16, N'0015', N'Psicologia Pacientes Frecuente', N'', CAST(200.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (17, N'0016', N'Reembolso', N'', CAST(0.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (18, N'0017', N'Sonografia', N'', CAST(50.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (19, N'0018', N'Lentes Monturas', N'', CAST(300.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (20, N'0019', N'Lentes Sencillos Negativo Tallado', N'', CAST(600.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (21, N'0020', N'Lente Vicion Sencilla', N'', CAST(600.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (22, N'0021', N'Flat top Terminado', N'', CAST(650.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (23, N'0022', N'Flat Top tallado', N'', CAST(800.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (24, N'0023', N'Lentes Invicibles Terminado', N'', CAST(700.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (25, N'0024', N'Lentes Invicibles Tallados', N'', CAST(950.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (26, N'0025', N'lentes progresivos', N'', CAST(1550.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (27, N'0026', N'lentes progrecivos tallados', N'', CAST(2000.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (28, N'0027', N'lentes policarbonato', N'', CAST(850.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (29, N'0585', N'Monto digitado manual', N'', CAST(150.00 AS Decimal(18, 2)), N'', CAST(100 AS Decimal(18, 0)), 979, 2, N'salon', NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (30, N'087', N'Desrizado', N'', CAST(350.00 AS Decimal(18, 2)), N'', CAST(150 AS Decimal(18, 0)), 990, 2, N'salon', NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (31, N'4896', N'Galon Shampoo Lafier', N'', CAST(400.00 AS Decimal(18, 2)), N'', CAST(250 AS Decimal(18, 0)), 147, 1, N'salon', NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (32, N'878', N'Leaving', N'', CAST(1500.00 AS Decimal(18, 2)), N'', CAST(1000 AS Decimal(18, 0)), 984, 1, N'salon', NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (33, N'999', N'Secado Complejo', N'', CAST(1000.00 AS Decimal(18, 2)), N'', CAST(150 AS Decimal(18, 0)), 991, 1, N'salon', NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (34, N'87', N'Tratamiento Completo', N'el tratamiento especial', CAST(800.00 AS Decimal(18, 2)), N'', CAST(400 AS Decimal(18, 0)), 900, 1, N'salon', NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (35, N'584', N'Desrrizado', N'', CAST(300.00 AS Decimal(18, 2)), N'', CAST(150 AS Decimal(18, 0)), 98, 1, N'salon', NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (36, N'332', N'Celofen', N'', CAST(300.00 AS Decimal(18, 2)), N'', CAST(100 AS Decimal(18, 0)), 9000, 1, N'salon', NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (37, N'4556', N'Hay Light', N'', CAST(500.00 AS Decimal(18, 2)), N'', CAST(200 AS Decimal(18, 0)), 900, 1, N'salon', NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (38, N'666', N'Extenciones Pelo', N'', CAST(800.00 AS Decimal(18, 2)), N'', CAST(700 AS Decimal(18, 0)), 5, 1, N'salon', NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (39, N'433', N'Extenciones Pelo Humano', N'', CAST(5000.00 AS Decimal(18, 2)), N'', CAST(4000 AS Decimal(18, 0)), 3, 1, N'salon', NULL, NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (40, N'877', N'Secado de Pelo con Blower', N'secado de pelo con blower para evitar el dolor de cabeza', CAST(200.00 AS Decimal(18, 2)), N'', CAST(100 AS Decimal(18, 0)), 999, 1, N'salon', N'secar_cabello.jpg', NULL)
INSERT [dbo].[servicios] ([ID], [codigo], [nombre], [descripcion], [precio], [notas], [costo], [stock], [categoria], [autor], [imagen], [tservicio]) VALUES (41, N'222', N'222222', N'', CAST(2222.00 AS Decimal(18, 2)), NULL, CAST(222 AS Decimal(18, 0)), 2222, 2, N'salon', N'', NULL)
SET IDENTITY_INSERT [dbo].[servicios] OFF
SET IDENTITY_INSERT [dbo].[transacciones] ON 

INSERT [dbo].[transacciones] ([ID], [MotivoOrigen], [MotivoDestino], [Descripcion], [BalAnt], [BalTrans], [fecha], [autor], [tipo], [marca], [BalAntProcedencia]) VALUES (1, NULL, 2, N'', CAST(0.00 AS Decimal(18, 2)), CAST(1500.00 AS Decimal(18, 2)), CAST(N'2016-04-07T00:00:00.000' AS DateTime), N'salon', NULL, NULL, NULL)
INSERT [dbo].[transacciones] ([ID], [MotivoOrigen], [MotivoDestino], [Descripcion], [BalAnt], [BalTrans], [fecha], [autor], [tipo], [marca], [BalAntProcedencia]) VALUES (2, NULL, 2, N'Cuenta pendiente de cobrar al cliente: Teresa villa', CAST(-555555555757.00 AS Decimal(18, 2)), CAST(2650.00 AS Decimal(18, 2)), CAST(N'2016-05-16T00:00:00.000' AS DateTime), N'salon', 1, NULL, NULL)
INSERT [dbo].[transacciones] ([ID], [MotivoOrigen], [MotivoDestino], [Descripcion], [BalAnt], [BalTrans], [fecha], [autor], [tipo], [marca], [BalAntProcedencia]) VALUES (3, NULL, 2, N'Cuenta pendiente de cobrar al cliente: Teresa villa', CAST(-555555553107.00 AS Decimal(18, 2)), CAST(1050.00 AS Decimal(18, 2)), CAST(N'2016-05-16T00:00:00.000' AS DateTime), N'salon', 1, NULL, NULL)
INSERT [dbo].[transacciones] ([ID], [MotivoOrigen], [MotivoDestino], [Descripcion], [BalAnt], [BalTrans], [fecha], [autor], [tipo], [marca], [BalAntProcedencia]) VALUES (4, NULL, 2, N'Cuenta pendiente de cobrar al cliente: Teresa villa', CAST(-555555552057.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(N'2016-05-16T00:00:00.000' AS DateTime), N'salon', 1, NULL, NULL)
INSERT [dbo].[transacciones] ([ID], [MotivoOrigen], [MotivoDestino], [Descripcion], [BalAnt], [BalTrans], [fecha], [autor], [tipo], [marca], [BalAntProcedencia]) VALUES (5, NULL, 11, N'Abono a Factura, Cliente: Teresa villa, ', CAST(-555555551657.00 AS Decimal(18, 2)), CAST(101.00 AS Decimal(18, 2)), CAST(N'2016-05-16T00:00:00.000' AS DateTime), N'salon', 2, NULL, NULL)
INSERT [dbo].[transacciones] ([ID], [MotivoOrigen], [MotivoDestino], [Descripcion], [BalAnt], [BalTrans], [fecha], [autor], [tipo], [marca], [BalAntProcedencia]) VALUES (6, NULL, 11, N'Abono a Factura, Cliente: Teresa villa, ', CAST(-555555551758.00 AS Decimal(18, 2)), CAST(1501.00 AS Decimal(18, 2)), CAST(N'2016-05-16T00:00:00.000' AS DateTime), N'salon', 2, NULL, NULL)
INSERT [dbo].[transacciones] ([ID], [MotivoOrigen], [MotivoDestino], [Descripcion], [BalAnt], [BalTrans], [fecha], [autor], [tipo], [marca], [BalAntProcedencia]) VALUES (7, NULL, 11, N'Pago de Factura, Cliente: Teresa villa, ', CAST(-555555553259.00 AS Decimal(18, 2)), CAST(1048.00 AS Decimal(18, 2)), CAST(N'2016-05-16T00:00:00.000' AS DateTime), N'salon', 2, NULL, NULL)
INSERT [dbo].[transacciones] ([ID], [MotivoOrigen], [MotivoDestino], [Descripcion], [BalAnt], [BalTrans], [fecha], [autor], [tipo], [marca], [BalAntProcedencia]) VALUES (8, NULL, 11, N'Abono a Factura, Cliente: Teresa villa, ', CAST(-555555554307.00 AS Decimal(18, 2)), CAST(953.00 AS Decimal(18, 2)), CAST(N'2016-05-16T00:00:00.000' AS DateTime), N'salon', 2, NULL, NULL)
INSERT [dbo].[transacciones] ([ID], [MotivoOrigen], [MotivoDestino], [Descripcion], [BalAnt], [BalTrans], [fecha], [autor], [tipo], [marca], [BalAntProcedencia]) VALUES (9, NULL, 11, N'Pago de Factura, Cliente: Teresa villa, ', CAST(-555555555260.00 AS Decimal(18, 2)), CAST(97.00 AS Decimal(18, 2)), CAST(N'2016-05-16T00:00:00.000' AS DateTime), N'salon', 2, NULL, NULL)
INSERT [dbo].[transacciones] ([ID], [MotivoOrigen], [MotivoDestino], [Descripcion], [BalAnt], [BalTrans], [fecha], [autor], [tipo], [marca], [BalAntProcedencia]) VALUES (10, NULL, 11, N'Pago de Factura, Cliente: Teresa villa, ', CAST(-555555555357.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), CAST(N'2016-05-16T00:00:00.000' AS DateTime), N'salon', 2, NULL, NULL)
INSERT [dbo].[transacciones] ([ID], [MotivoOrigen], [MotivoDestino], [Descripcion], [BalAnt], [BalTrans], [fecha], [autor], [tipo], [marca], [BalAntProcedencia]) VALUES (11, NULL, 24, N'', CAST(15000.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(N'2016-05-17T00:00:00.000' AS DateTime), N'salon', 3, NULL, NULL)
INSERT [dbo].[transacciones] ([ID], [MotivoOrigen], [MotivoDestino], [Descripcion], [BalAnt], [BalTrans], [fecha], [autor], [tipo], [marca], [BalAntProcedencia]) VALUES (12, NULL, 24, N'', CAST(14000.00 AS Decimal(18, 2)), CAST(15000.00 AS Decimal(18, 2)), CAST(N'2016-05-17T00:00:00.000' AS DateTime), N'salon', 3, NULL, NULL)
INSERT [dbo].[transacciones] ([ID], [MotivoOrigen], [MotivoDestino], [Descripcion], [BalAnt], [BalTrans], [fecha], [autor], [tipo], [marca], [BalAntProcedencia]) VALUES (13, NULL, 24, N'', CAST(-1000.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(N'2016-05-17T00:00:00.000' AS DateTime), N'salon', 3, NULL, NULL)
SET IDENTITY_INSERT [dbo].[transacciones] OFF
SET IDENTITY_INSERT [dbo].[unidades] ON 

INSERT [dbo].[unidades] ([ID], [nombre]) VALUES (1, N'ml')
INSERT [dbo].[unidades] ([ID], [nombre]) VALUES (2, N'mg')
INSERT [dbo].[unidades] ([ID], [nombre]) VALUES (3, N'g')
INSERT [dbo].[unidades] ([ID], [nombre]) VALUES (4, N'mcg')
SET IDENTITY_INSERT [dbo].[unidades] OFF
SET IDENTITY_INSERT [dbo].[usuariosroles] ON 

INSERT [dbo].[usuariosroles] ([rolID], [userID], [defaultpage], [id]) VALUES (1, 19, N'InicioAnestesia.aspx', 1)
INSERT [dbo].[usuariosroles] ([rolID], [userID], [defaultpage], [id]) VALUES (2, 20, N'InicioObstetricia.aspx', 2)
INSERT [dbo].[usuariosroles] ([rolID], [userID], [defaultpage], [id]) VALUES (1002, 46, N'InicioAmico.aspx', 3)
INSERT [dbo].[usuariosroles] ([rolID], [userID], [defaultpage], [id]) VALUES (1003, 18, N'InicioObstetricia.aspx', 5)
INSERT [dbo].[usuariosroles] ([rolID], [userID], [defaultpage], [id]) VALUES (1003, 19, N'InicioObstetricia.aspx', 6)
INSERT [dbo].[usuariosroles] ([rolID], [userID], [defaultpage], [id]) VALUES (1003, 20, N'InicioObstetricia.aspx', 7)
SET IDENTITY_INSERT [dbo].[usuariosroles] OFF
SET IDENTITY_INSERT [dbo].[usuariosSec] ON 

INSERT [dbo].[usuariosSec] ([ID], [nombre], [apellido], [fecNacimiento], [rnc], [tipoRnc], [email], [telefono], [celular], [genero], [estatusMarital], [ocupacion], [religion], [fecCreacion], [ultimaVisita], [username], [password], [nivel], [estatus], [autor], [direccion]) VALUES (18, N'Starling', N'Germosen', CAST(N'2016-04-21T00:00:00.000' AS DateTime), NULL, NULL, N'sgrysoft@outlook.com', N'', N'', N'M', N'S', NULL, NULL, CAST(N'2016-04-21T00:00:00.000' AS DateTime), NULL, N'sgermosen', N'824455', N'1', 1, N'dorka', N'')
INSERT [dbo].[usuariosSec] ([ID], [nombre], [apellido], [fecNacimiento], [rnc], [tipoRnc], [email], [telefono], [celular], [genero], [estatusMarital], [ocupacion], [religion], [fecCreacion], [ultimaVisita], [username], [password], [nivel], [estatus], [autor], [direccion]) VALUES (19, N'Dorka M.', N'Estevez Pascual', CAST(N'2016-04-12T00:00:00.000' AS DateTime), NULL, NULL, N'sss@ddd.com', NULL, NULL, N'F', N'S', N'Doctor', NULL, CAST(N'2016-04-13T13:06:42.000' AS DateTime), NULL, N'dorka', N'824455', N'1', 1, N'dorka', NULL)
INSERT [dbo].[usuariosSec] ([ID], [nombre], [apellido], [fecNacimiento], [rnc], [tipoRnc], [email], [telefono], [celular], [genero], [estatusMarital], [ocupacion], [religion], [fecCreacion], [ultimaVisita], [username], [password], [nivel], [estatus], [autor], [direccion]) VALUES (20, N'Super Usuario', N'Elis Pascual', CAST(N'2016-04-13T00:00:00.000' AS DateTime), NULL, NULL, N'sgermosen@dgii.gov.do', N'849555', N'895959', N'M', N'S', NULL, NULL, CAST(N'2016-04-13T00:00:00.000' AS DateTime), NULL, N'elis', N'824455', N'1', 1, N'dorka', N'la calle de su casa')
INSERT [dbo].[usuariosSec] ([ID], [nombre], [apellido], [fecNacimiento], [rnc], [tipoRnc], [email], [telefono], [celular], [genero], [estatusMarital], [ocupacion], [religion], [fecCreacion], [ultimaVisita], [username], [password], [nivel], [estatus], [autor], [direccion]) VALUES (43, N'wwwwwww', N'wwwwwwwww', CAST(N'2016-05-16T00:00:00.000' AS DateTime), NULL, NULL, N'', N'22222', N'222', N'M', N'S', NULL, NULL, CAST(N'2016-05-16T00:00:00.000' AS DateTime), NULL, N'pacientedoctora', N'123', N'3', 1, NULL, N'wwwwwwww')
INSERT [dbo].[usuariosSec] ([ID], [nombre], [apellido], [fecNacimiento], [rnc], [tipoRnc], [email], [telefono], [celular], [genero], [estatusMarital], [ocupacion], [religion], [fecCreacion], [ultimaVisita], [username], [password], [nivel], [estatus], [autor], [direccion]) VALUES (44, N'juan', N'almonte', CAST(N'2016-05-29T00:00:00.000' AS DateTime), NULL, NULL, N'', N'', N'', N'M', N'S', NULL, NULL, CAST(N'2016-05-29T00:00:00.000' AS DateTime), NULL, N'pacientedoctora', N'123', N'3', 1, NULL, N'')
INSERT [dbo].[usuariosSec] ([ID], [nombre], [apellido], [fecNacimiento], [rnc], [tipoRnc], [email], [telefono], [celular], [genero], [estatusMarital], [ocupacion], [religion], [fecCreacion], [ultimaVisita], [username], [password], [nivel], [estatus], [autor], [direccion]) VALUES (46, N'Amico', N'Consultorio', CAST(N'2016-05-29T00:00:00.000' AS DateTime), NULL, NULL, N'info@consultorioamico.orf', NULL, NULL, N'I', N'S', NULL, NULL, CAST(N'2016-05-29T00:00:00.000' AS DateTime), NULL, N'amico', N'824455', N'3', 1, N'amico', NULL)
INSERT [dbo].[usuariosSec] ([ID], [nombre], [apellido], [fecNacimiento], [rnc], [tipoRnc], [email], [telefono], [celular], [genero], [estatusMarital], [ocupacion], [religion], [fecCreacion], [ultimaVisita], [username], [password], [nivel], [estatus], [autor], [direccion]) VALUES (47, N'wwwwww', N'2222222', CAST(N'2016-06-20T00:00:00.000' AS DateTime), NULL, NULL, N'', N'3333333', N'3333333', N'M', N'S', NULL, NULL, CAST(N'2016-06-20T00:00:00.000' AS DateTime), NULL, N'pacientedoctora', N'123', N'3', 1, NULL, N'wwwww')
INSERT [dbo].[usuariosSec] ([ID], [nombre], [apellido], [fecNacimiento], [rnc], [tipoRnc], [email], [telefono], [celular], [genero], [estatusMarital], [ocupacion], [religion], [fecCreacion], [ultimaVisita], [username], [password], [nivel], [estatus], [autor], [direccion]) VALUES (48, N'dsdsdsd', N'', CAST(N'2016-06-20T00:00:00.000' AS DateTime), NULL, NULL, N'', N'', N'', N'M', N'S', NULL, NULL, CAST(N'2016-06-20T00:00:00.000' AS DateTime), NULL, N'pacientedoctora', N'123', N'3', 1, NULL, N'')
INSERT [dbo].[usuariosSec] ([ID], [nombre], [apellido], [fecNacimiento], [rnc], [tipoRnc], [email], [telefono], [celular], [genero], [estatusMarital], [ocupacion], [religion], [fecCreacion], [ultimaVisita], [username], [password], [nivel], [estatus], [autor], [direccion]) VALUES (49, N'ooooooooooooo', N'oooooooo', CAST(N'2016-07-22T00:00:00.000' AS DateTime), NULL, NULL, N'', N'ooooooooo', N'oooooo', N'M', N'S', NULL, NULL, CAST(N'2016-07-22T00:00:00.000' AS DateTime), NULL, N'pacientedoctora', N'123', N'3', 1, NULL, N'')
SET IDENTITY_INSERT [dbo].[usuariosSec] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_paciente]    Script Date: 04/04/2018 9:03:38 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_paciente] ON [dbo].[paciente]
(
	[record] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [pk_pruebasCategoria]    Script Date: 04/04/2018 9:03:38 p. m. ******/
ALTER TABLE [dbo].[pruebasClasificacion] ADD  CONSTRAINT [pk_pruebasCategoria] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[consulta] ADD  CONSTRAINT [DF_Consultas_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [dbo].[historiaAnestesica] ADD  CONSTRAINT [DF_hobs_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [dbo].[historiaEstudios] ADD  CONSTRAINT [DF_historiaEstudios_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [dbo].[historiaPadecimientos] ADD  CONSTRAINT [DF_historiaPadecimientos_fechaDeterminacion]  DEFAULT (getdate()) FOR [fechaDeterminacion]
GO
ALTER TABLE [dbo].[usuariosSec] ADD  CONSTRAINT [DF_Users_fecCreacion]  DEFAULT (getdate()) FOR [fecCreacion]
GO
ALTER TABLE [dbo].[usuariosSec] ADD  CONSTRAINT [DF_Users_status]  DEFAULT ('True') FOR [estatus]
GO
ALTER TABLE [dbo].[clientes]  WITH CHECK ADD  CONSTRAINT [FK_cliente_usuariosSec] FOREIGN KEY([userID])
REFERENCES [dbo].[usuariosSec] ([ID])
GO
ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [FK_cliente_usuariosSec]
GO
ALTER TABLE [dbo].[consulta]  WITH CHECK ADD  CONSTRAINT [FK_consulta_historiaM] FOREIGN KEY([historiaMID])
REFERENCES [dbo].[historiaM] ([ID])
GO
ALTER TABLE [dbo].[consulta] CHECK CONSTRAINT [FK_consulta_historiaM]
GO
ALTER TABLE [dbo].[consulta]  WITH CHECK ADD  CONSTRAINT [FK_consulta_procedimientos] FOREIGN KEY([procedimientoID])
REFERENCES [dbo].[procedimientos] ([id])
GO
ALTER TABLE [dbo].[consulta] CHECK CONSTRAINT [FK_consulta_procedimientos]
GO
ALTER TABLE [dbo].[consulta]  WITH CHECK ADD  CONSTRAINT [FK_consultas_doctor] FOREIGN KEY([doctorID])
REFERENCES [dbo].[doctor] ([userID])
GO
ALTER TABLE [dbo].[consulta] CHECK CONSTRAINT [FK_consultas_doctor]
GO
ALTER TABLE [dbo].[consulta]  WITH CHECK ADD  CONSTRAINT [FK_consultas_paciente] FOREIGN KEY([pacienteID])
REFERENCES [dbo].[paciente] ([userID])
GO
ALTER TABLE [dbo].[consulta] CHECK CONSTRAINT [FK_consultas_paciente]
GO
ALTER TABLE [dbo].[doctor]  WITH CHECK ADD  CONSTRAINT [FK_doctor_especialidad] FOREIGN KEY([especialidadID])
REFERENCES [dbo].[especialidad] ([ID])
GO
ALTER TABLE [dbo].[doctor] CHECK CONSTRAINT [FK_doctor_especialidad]
GO
ALTER TABLE [dbo].[doctor]  WITH CHECK ADD  CONSTRAINT [FK_doctor_Usuarios] FOREIGN KEY([userID])
REFERENCES [dbo].[usuariosSec] ([ID])
GO
ALTER TABLE [dbo].[doctor] CHECK CONSTRAINT [FK_doctor_Usuarios]
GO
ALTER TABLE [dbo].[farmacos]  WITH CHECK ADD  CONSTRAINT [FK_farmacos_laboratorios] FOREIGN KEY([laboratorioID])
REFERENCES [dbo].[laboratorios] ([ID])
GO
ALTER TABLE [dbo].[farmacos] CHECK CONSTRAINT [FK_farmacos_laboratorios]
GO
ALTER TABLE [dbo].[farmacos]  WITH CHECK ADD  CONSTRAINT [FK_farmacos_presentaciones] FOREIGN KEY([presentacionID])
REFERENCES [dbo].[presentaciones] ([ID])
GO
ALTER TABLE [dbo].[farmacos] CHECK CONSTRAINT [FK_farmacos_presentaciones]
GO
ALTER TABLE [dbo].[hAnestesica]  WITH CHECK ADD  CONSTRAINT [FK_hAnestesica_hAnestesica] FOREIGN KEY([ConsultaID])
REFERENCES [dbo].[consulta] ([ID])
GO
ALTER TABLE [dbo].[hAnestesica] CHECK CONSTRAINT [FK_hAnestesica_hAnestesica]
GO
ALTER TABLE [dbo].[hAnestesica]  WITH CHECK ADD  CONSTRAINT [FK_hAnestesica_hAnestesicaM] FOREIGN KEY([hAnestesicaMID])
REFERENCES [dbo].[hAnestesicaM] ([ID])
GO
ALTER TABLE [dbo].[hAnestesica] CHECK CONSTRAINT [FK_hAnestesica_hAnestesicaM]
GO
ALTER TABLE [dbo].[hGinecologica]  WITH CHECK ADD  CONSTRAINT [FK_hGinecologica_paciente] FOREIGN KEY([pacienteID])
REFERENCES [dbo].[paciente] ([userID])
GO
ALTER TABLE [dbo].[hGinecologica] CHECK CONSTRAINT [FK_hGinecologica_paciente]
GO
ALTER TABLE [dbo].[historiaAnestesica]  WITH CHECK ADD  CONSTRAINT [FK_historiaAnestesica_procedimientos] FOREIGN KEY([procedimientoID])
REFERENCES [dbo].[procedimientos] ([id])
GO
ALTER TABLE [dbo].[historiaAnestesica] CHECK CONSTRAINT [FK_historiaAnestesica_procedimientos]
GO
ALTER TABLE [dbo].[historiaEstudios]  WITH CHECK ADD  CONSTRAINT [FK_historiaEstudios_consulta] FOREIGN KEY([consultaID])
REFERENCES [dbo].[consulta] ([ID])
GO
ALTER TABLE [dbo].[historiaEstudios] CHECK CONSTRAINT [FK_historiaEstudios_consulta]
GO
ALTER TABLE [dbo].[historiaEstudios]  WITH CHECK ADD  CONSTRAINT [FK_historiaEstudios_doctor] FOREIGN KEY([doctorID])
REFERENCES [dbo].[doctor] ([userID])
GO
ALTER TABLE [dbo].[historiaEstudios] CHECK CONSTRAINT [FK_historiaEstudios_doctor]
GO
ALTER TABLE [dbo].[historiaEstudios]  WITH CHECK ADD  CONSTRAINT [FK_historiaEstudios_estudios] FOREIGN KEY([ID])
REFERENCES [dbo].[estudios] ([ID])
GO
ALTER TABLE [dbo].[historiaEstudios] CHECK CONSTRAINT [FK_historiaEstudios_estudios]
GO
ALTER TABLE [dbo].[historiaEstudios]  WITH CHECK ADD  CONSTRAINT [FK_historiaEstudios_paciente] FOREIGN KEY([pacienteID])
REFERENCES [dbo].[paciente] ([userID])
GO
ALTER TABLE [dbo].[historiaEstudios] CHECK CONSTRAINT [FK_historiaEstudios_paciente]
GO
ALTER TABLE [dbo].[historiaFarmacologica]  WITH CHECK ADD  CONSTRAINT [FK_historiaFarmacologica_consulta] FOREIGN KEY([consultaID])
REFERENCES [dbo].[consulta] ([ID])
GO
ALTER TABLE [dbo].[historiaFarmacologica] CHECK CONSTRAINT [FK_historiaFarmacologica_consulta]
GO
ALTER TABLE [dbo].[historiaFarmacologica]  WITH CHECK ADD  CONSTRAINT [FK_historiaFarmacologica_doctor] FOREIGN KEY([doctorID])
REFERENCES [dbo].[doctor] ([userID])
GO
ALTER TABLE [dbo].[historiaFarmacologica] CHECK CONSTRAINT [FK_historiaFarmacologica_doctor]
GO
ALTER TABLE [dbo].[historiaFarmacologica]  WITH CHECK ADD  CONSTRAINT [FK_historiaFarmacologica_farmacos] FOREIGN KEY([farmacoID])
REFERENCES [dbo].[farmacos] ([ID])
GO
ALTER TABLE [dbo].[historiaFarmacologica] CHECK CONSTRAINT [FK_historiaFarmacologica_farmacos]
GO
ALTER TABLE [dbo].[historiaFarmacologica]  WITH CHECK ADD  CONSTRAINT [FK_historiaFarmacologica_paciente] FOREIGN KEY([pacienteID])
REFERENCES [dbo].[paciente] ([userID])
GO
ALTER TABLE [dbo].[historiaFarmacologica] CHECK CONSTRAINT [FK_historiaFarmacologica_paciente]
GO
ALTER TABLE [dbo].[historiaPadecimientos]  WITH CHECK ADD  CONSTRAINT [FK_historiaPadecimientos_consulta] FOREIGN KEY([consultaID])
REFERENCES [dbo].[consulta] ([ID])
GO
ALTER TABLE [dbo].[historiaPadecimientos] CHECK CONSTRAINT [FK_historiaPadecimientos_consulta]
GO
ALTER TABLE [dbo].[historiaPadecimientos]  WITH CHECK ADD  CONSTRAINT [FK_historiaPadecimientos_ICD10] FOREIGN KEY([diagnosticoCode])
REFERENCES [dbo].[ICD10] ([Code])
GO
ALTER TABLE [dbo].[historiaPadecimientos] CHECK CONSTRAINT [FK_historiaPadecimientos_ICD10]
GO
ALTER TABLE [dbo].[historiaPadecimientos]  WITH CHECK ADD  CONSTRAINT [FK_historiaPadecimientos_paciente] FOREIGN KEY([pacienteID])
REFERENCES [dbo].[paciente] ([userID])
GO
ALTER TABLE [dbo].[historiaPadecimientos] CHECK CONSTRAINT [FK_historiaPadecimientos_paciente]
GO
ALTER TABLE [dbo].[historiaPruebas]  WITH CHECK ADD  CONSTRAINT [FK_historiaPruebas_pruebas] FOREIGN KEY([PruebaID])
REFERENCES [dbo].[pruebas] ([ID])
GO
ALTER TABLE [dbo].[historiaPruebas] CHECK CONSTRAINT [FK_historiaPruebas_pruebas]
GO
ALTER TABLE [dbo].[hObstericaVisitas]  WITH CHECK ADD  CONSTRAINT [FK_hObstericaVisitas_hObstetrica] FOREIGN KEY([hObsID])
REFERENCES [dbo].[hObstetrica] ([id])
GO
ALTER TABLE [dbo].[hObstericaVisitas] CHECK CONSTRAINT [FK_hObstericaVisitas_hObstetrica]
GO
ALTER TABLE [dbo].[hObstetrica]  WITH CHECK ADD  CONSTRAINT [FK_hObstetrica_paciente] FOREIGN KEY([pacienteID])
REFERENCES [dbo].[paciente] ([userID])
GO
ALTER TABLE [dbo].[hObstetrica] CHECK CONSTRAINT [FK_hObstetrica_paciente]
GO
ALTER TABLE [dbo].[hojadiagnostica]  WITH CHECK ADD  CONSTRAINT [FK_hojadiagnostica_paciente] FOREIGN KEY([pacienteID])
REFERENCES [dbo].[paciente] ([userID])
GO
ALTER TABLE [dbo].[hojadiagnostica] CHECK CONSTRAINT [FK_hojadiagnostica_paciente]
GO
ALTER TABLE [dbo].[paciente]  WITH CHECK ADD  CONSTRAINT [FK_paciente_grupoSanguineo] FOREIGN KEY([gruposanguineoID])
REFERENCES [dbo].[grupoSanguineo] ([ID])
GO
ALTER TABLE [dbo].[paciente] CHECK CONSTRAINT [FK_paciente_grupoSanguineo]
GO
ALTER TABLE [dbo].[paciente]  WITH CHECK ADD  CONSTRAINT [FK_paciente_Usuarios] FOREIGN KEY([userID])
REFERENCES [dbo].[usuariosSec] ([ID])
GO
ALTER TABLE [dbo].[paciente] CHECK CONSTRAINT [FK_paciente_Usuarios]
GO
ALTER TABLE [dbo].[presentaciones]  WITH CHECK ADD  CONSTRAINT [FK_presentaciones_Unidades] FOREIGN KEY([unidadID])
REFERENCES [dbo].[unidades] ([ID])
GO
ALTER TABLE [dbo].[presentaciones] CHECK CONSTRAINT [FK_presentaciones_Unidades]
GO
ALTER TABLE [dbo].[pruebas]  WITH CHECK ADD  CONSTRAINT [FK_pruebas_pruebasClasificacion] FOREIGN KEY([unidadID])
REFERENCES [dbo].[pruebasUnidades] ([ID])
GO
ALTER TABLE [dbo].[pruebas] CHECK CONSTRAINT [FK_pruebas_pruebasClasificacion]
GO
ALTER TABLE [dbo].[pruebas]  WITH CHECK ADD  CONSTRAINT [FK_pruebas_pruebasValorReferencia] FOREIGN KEY([valorReferenciaID])
REFERENCES [dbo].[pruebasValorReferencia] ([ID])
GO
ALTER TABLE [dbo].[pruebas] CHECK CONSTRAINT [FK_pruebas_pruebasValorReferencia]
GO
ALTER TABLE [dbo].[recetasobstetricia]  WITH CHECK ADD  CONSTRAINT [FK_recetasobstetricia_paciente] FOREIGN KEY([PacienteID])
REFERENCES [dbo].[paciente] ([userID])
GO
ALTER TABLE [dbo].[recetasobstetricia] CHECK CONSTRAINT [FK_recetasobstetricia_paciente]
GO
ALTER TABLE [dbo].[rolesopciones]  WITH CHECK ADD  CONSTRAINT [FK_rolesopciones_opciones] FOREIGN KEY([opcionId])
REFERENCES [dbo].[opciones] ([id])
GO
ALTER TABLE [dbo].[rolesopciones] CHECK CONSTRAINT [FK_rolesopciones_opciones]
GO
ALTER TABLE [dbo].[rolesopciones]  WITH CHECK ADD  CONSTRAINT [FK_rolesopciones_roles] FOREIGN KEY([rolID])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[rolesopciones] CHECK CONSTRAINT [FK_rolesopciones_roles]
GO
ALTER TABLE [dbo].[transacciones]  WITH CHECK ADD  CONSTRAINT [FK_transacciones_motivos] FOREIGN KEY([MotivoDestino])
REFERENCES [dbo].[motivos] ([ID])
GO
ALTER TABLE [dbo].[transacciones] CHECK CONSTRAINT [FK_transacciones_motivos]
GO
ALTER TABLE [dbo].[transacciones]  WITH CHECK ADD  CONSTRAINT [FK_transacciones_motivos1] FOREIGN KEY([MotivoOrigen])
REFERENCES [dbo].[motivos] ([ID])
GO
ALTER TABLE [dbo].[transacciones] CHECK CONSTRAINT [FK_transacciones_motivos1]
GO
ALTER TABLE [dbo].[usuariosroles]  WITH CHECK ADD  CONSTRAINT [FK_usuariosroles_roles] FOREIGN KEY([rolID])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[usuariosroles] CHECK CONSTRAINT [FK_usuariosroles_roles]
GO
ALTER TABLE [dbo].[usuariosroles]  WITH CHECK ADD  CONSTRAINT [FK_usuariosroles_usuariosSec] FOREIGN KEY([userID])
REFERENCES [dbo].[usuariosSec] ([ID])
GO
ALTER TABLE [dbo].[usuariosroles] CHECK CONSTRAINT [FK_usuariosroles_usuariosSec]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [FK_ventas_clientes] FOREIGN KEY([clienteID])
REFERENCES [dbo].[clientes] ([userID])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [FK_ventas_clientes]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [FK_ventas_estatusM] FOREIGN KEY([estatusID])
REFERENCES [dbo].[estatusM] ([id])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [FK_ventas_estatusM]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [FK_ventas_transacciones] FOREIGN KEY([transaccionID])
REFERENCES [dbo].[transacciones] ([ID])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [FK_ventas_transacciones]
GO
ALTER TABLE [dbo].[ventasDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ventasDetalle_servicios] FOREIGN KEY([servicioID])
REFERENCES [dbo].[servicios] ([ID])
GO
ALTER TABLE [dbo].[ventasDetalle] CHECK CONSTRAINT [FK_ventasDetalle_servicios]
GO
ALTER TABLE [dbo].[ventasDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ventasDetalle_ventas] FOREIGN KEY([ventaID])
REFERENCES [dbo].[ventas] ([ID])
GO
ALTER TABLE [dbo].[ventasDetalle] CHECK CONSTRAINT [FK_ventasDetalle_ventas]
GO
ALTER TABLE [dbo].[VISITASGINECOLOGICAS]  WITH CHECK ADD  CONSTRAINT [FK_VISITASGINECOLOGICAS_hGinecologica] FOREIGN KEY([HGINECOLOGICAID])
REFERENCES [dbo].[hGinecologica] ([id])
GO
ALTER TABLE [dbo].[VISITASGINECOLOGICAS] CHECK CONSTRAINT [FK_VISITASGINECOLOGICAS_hGinecologica]
GO
/****** Object:  StoredProcedure [dbo].[GetConsulta]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetConsulta] (@idpaciente int,@autor varchar (25))
as 
select id,Format(fecha,'dd/MM/yyyy')as fecha, sintomas,observaciones, Format(fecultima,'dd/MM/yyyy')as fecultima  from consulta   where  autor=@autor

and pacienteID=@idpaciente



GO
/****** Object:  StoredProcedure [dbo].[GethGinecologica]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GethGinecologica] (@idpaciente int)
as 
select * from  hGinecologica   where  pacienteID = @idpaciente  

 




GO
/****** Object:  StoredProcedure [dbo].[GetHistAnestesica2]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetHistAnestesica2] (@idpaciente int,@autor varchar (25),@historiaMID int)
as 
select id,Format(fecha,'dd/MM/yyyy')as fecha,(select d.Code + ' - ' + d.Descripcion_es from ICD10 d where d.Code=diagnostico) as diagnosticoenfermedad, sintomas, (select e.code + ' - ' + e.Nombre from procedimientos e where e.id=procedimientoID) as procedimientoarealizar from consulta where  autor=@autor and historiaMID=@historiaMID

and pacienteID=@idpaciente



GO
/****** Object:  StoredProcedure [dbo].[GetHistAnestesicaDetalle]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetHistAnestesicaDetalle] (@ConsultaID int,@autor varchar (25))
as 
select id,(select d.Nombre from hAnestesicaM d where d.ID=hAnestesicaMID) as valorhistoria     from hAnestesica where   ConsultaID=@ConsultaID


GO
/****** Object:  StoredProcedure [dbo].[GetHistAnestesicaOld]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetHistAnestesicaOld] (@idpaciente int)
as 
select id,Format(fecha,'dd/MM/yyyy')as fecha,(select d.Code + ' - ' + d.Descripcion_es from ICD10 d where d.Code=diagnosticoenfermedad) as diagnosticoenfermedad, sintomasnocardiovasculares, (select e.code + ' - ' + e.Nombre from procedimientos e where e.id=procedimientoID) as procedimientoarealizar from historiaAnestesica where  autor='doctora' 

and pacienteID=@idpaciente



GO
/****** Object:  StoredProcedure [dbo].[GetHistObstetricia]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetHistObstetricia] (@idpaciente int)
as 
select id,Format(fecha,'dd/MM/yyyy')as fecha, sintomas,observaciones, Format(fecultima,'dd/MM/yyyy')as fecultima  from HistoriaObstetricia   where  autor='obs' 

and pacienteID=@idpaciente



GO
/****** Object:  StoredProcedure [dbo].[GethObstetrica]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GethObstetrica] (@idpaciente int)
as 
select * from  hObstetrica   where  pacienteID = @idpaciente  

 



GO
/****** Object:  StoredProcedure [dbo].[GethObstetricaVisita]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GethObstetricaVisita] (@idConsulta int)
as 
select * from  hObstericaVisitas   where  hObsID = @idConsulta  

 




GO
/****** Object:  StoredProcedure [dbo].[GetHojaDiagnostica]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetHojaDiagnostica] (@idpaciente int)
as 
select * from  hojadiagnostica   where  pacienteID = @idpaciente  

 



GO
/****** Object:  StoredProcedure [dbo].[GetOpcionesRol]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
 
 
 

CREATE procedure [dbo].[GetOpcionesRol]
(@RolID int,
@autor varchar(25))
as

select o.nombre , o.descripcion, o.link from opcionesrol ro,   opciones o where o.id = ro.opcionid and o.autor=@autor
and ro.Rolid =@RolID
order by o.orden








GO
/****** Object:  StoredProcedure [dbo].[GetRecetaObstetricia]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetRecetaObstetricia] (@PacienteID int)
as 
select * from  recetasobstetricia   where  PacienteID = @PacienteID 

 



GO
/****** Object:  StoredProcedure [dbo].[GetVentaDetalle]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
create procedure [dbo].[GetVentaDetalle] (@id int )as 
 
 select v.*, (select s.nombre from servicios s where s.ID= v.servicioID) as nombre   from ventasdetalle v where v.ventaID=@id

GO
/****** Object:  StoredProcedure [dbo].[GetVentaServicio]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
create procedure [dbo].[GetVentaServicio] (@id int )as 
 
 select v.*, (select s.nombre from servicios s where s.ID= v.servicioID) as nombre   from ventasdetalle v where v.servicioID=@id

GO
/****** Object:  StoredProcedure [dbo].[GetVisitasGinecologicas]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetVisitasGinecologicas] (@hGinecologicaID int)
as 
select * from VISITASGINECOLOGICAS   where  HGINECOLOGICAID = @hGinecologicaID  

  order by id desc



GO
/****** Object:  StoredProcedure [dbo].[ListCIE10]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ListCIE10]
as
select top 250 Code, Descripcion_es,( Code +  ' - ' + Descripcion_es) as Nombre from icd10



GO
/****** Object:  StoredProcedure [dbo].[ListClientes]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ListClientes] 
(@autor varchar(50))
as 
select c.userID as ID, u.nombre + ' ' + u.apellido as Nombre, u.email as Correo, c.gastado as Gastado, c.ganado as Ganado, c.adeudado as Adeudado, c.credito as Credito       from   clientes c, usuariosSec u where  c.autor=@autor and c.userid=u.ID 


GO
/****** Object:  StoredProcedure [dbo].[ListCuentas]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
CREATE procedure [dbo].[ListCuentas] as 
 
select m.ID,m.Codigo,m.Nombre,m.Descripcion,m.BalAnt,m.BalAct,m.autor,  (case (m.Origen) when 1 then '1 - Debito' when 2 then '2- Credito' else '' end ) as Origen, m.FecRecordar,m.marcaRecordar,m.fecUltTrans, abs(m.BalAct - m.BalAnt) as ValUltTrans from motivos m where m.autor='salon' 

GO
/****** Object:  StoredProcedure [dbo].[ListDeudas]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[ListDeudas] (@cargos decimal (18,4),
@idCliente int ) as 
 
   select *, (subtotal * @cargos ) as cargos from ventas where autor = 'salon' and estatusID = 4  and clienteID=  @idCliente
                     

GO
/****** Object:  StoredProcedure [dbo].[ListDeudas21]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ListDeudas21] (@cargos decimal (18,4),
@idCliente int ) as 
 
   select *, (subtotal * @cargos ) as cargos from ventas where autor = 'salon' and estatusID = 4 and (GETDATE()-fecha)>15 and clienteID=  @idCliente
                     


GO
/****** Object:  StoredProcedure [dbo].[ListOpcionesRol]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

CREATE procedure [dbo].[ListOpcionesRol]
(@RolID int,
@autor varchar(25))
as

select o.nombre , o.descripcion, o.link from rolesopciones ro,   opciones o where o.id = ro.opcionid and o.autor=@autor
and ro.Rolid =@RolID
order by o.orden



GO
/****** Object:  StoredProcedure [dbo].[ListPacientes]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ListPacientes]
(@autor varchar(50))
as

  select p.userID as ID, (u.nombre + ' ' + u.apellido ) as nombre, p.edad as Edad,u.genero as Sexo,u.telefono as Telefono, (case  when p.seguro is null then 'No' else  case p.seguro when 'false' then 'No' when 'true' then 'Si' end end) as Seguro,p.referido as Referido    from usuariosSec u, paciente p where p.autor=@autor and u.ID= p.userID


GO
/****** Object:  StoredProcedure [dbo].[ListProcedimientos]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ListProcedimientos]
as
select * from procedimientos



GO
/****** Object:  StoredProcedure [dbo].[ListRolesUsuarios]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 

 

CREATE procedure [dbo].[ListRolesUsuarios]
(@userId int
)
as

select ru.ROLID as ROLID,ru.DEFAULTPAGE as DEFAULTPAGE,ru.ID as ID,ru.DESDE as DESDE,ru.HASTA,ru.STATUS as  STATUS,ru.INDEFINIDO as INDEFINIDO,r.NOMBRE as NOMBRE from ROLESUSUARIO ru,ROLES r  where ru.userID = @userId  and r.ID=ru.ROLID
 
 





GO
/****** Object:  StoredProcedure [dbo].[ListServicios]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ListServicios] 
(@autor varchar (25),
@stock int )
as 

 
  select *,(case (categoria)  when 1 then '1 - Servicio' when 2 then '2 - Producto'  else '3 - Indefinido' end )  as Tipo    from servicios where autor=@autor and stock >= @stock          





GO
/****** Object:  StoredProcedure [dbo].[ListTransacciones]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
create procedure [dbo].[ListTransacciones] as 
 
select (case (t.tipo) when 1 then '1 - Debito' when 3 then '3 - Resta' when 4 then '4 - Suma' when 2 then '2 - Credito' else '' end )  as Tipo, t.ID as ID,(select m.nombre from motivos m where m.ID=t.MotivoOrigen) as MotivoOrigen,(select m2.nombre from motivos m2 where m2.ID=t.MotivoDestino) as MotivoDestino, t.Descripcion as Descripcion, t.BalAnt as BalanceAnterior, t.BalTrans as BalanceTransaccion, t.Fecha as Fecha  from transacciones t  where t.autor='salon' 

GO
/****** Object:  StoredProcedure [dbo].[ListUsuario]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
 

create procedure [dbo].[ListUsuario]
(@autor varchar(20),
@status int)
as

  select  *    from USUARIOSSEC u where u.autor=@autor and  u.ESTATUS=@status





GO
/****** Object:  StoredProcedure [dbo].[ListUsuarios]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
 

create procedure [dbo].[ListUsuarios]
(@autor varchar(20),
@status int)
as

  select  *    from USUARIOSSEC u where u.autor=@autor and  u.STATUS=@status










GO
/****** Object:  StoredProcedure [dbo].[ListVentas]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
create procedure [dbo].[ListVentas] (@cargos decimal (18,4) )as 
 
 

 select v.ID,(select u.nombre + ' ' + u.apellido from usuariosSec u where u.ID = c.userID ) as nombre, v.fecha,v.fechaPagada,v.fechaAbono,v.subTotal,(v.subtotal * @cargos ) as cargos,v.total,v.balancePendiente, v.saldoPagado,st.descripcion as estatus from ventas v,clientes c,estatusM st   where v.autor='salon' and v.clienteID=c.userID and st.ID=v.estatusID and st.tabla='ventas'



GO
/****** Object:  StoredProcedure [dbo].[VerificarOpcionRol]    Script Date: 04/04/2018 9:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 

CREATE procedure [dbo].[VerificarOpcionRol]
(@RolID int,
@autor varchar(25),
@link varchar(50))
as

select o.nombre , o.descripcion, o.link from rolesopciones ro,   opciones o where o.id = ro.opcionid and o.autor=@autor
and ro.Rolid =@RolID and o.link=@link
order by o.orden




 
GO
USE [master]
GO
ALTER DATABASE [SIG_DBxx] SET  READ_WRITE 
GO
