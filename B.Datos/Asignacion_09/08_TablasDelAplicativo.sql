USE Ejemplo_SIN_Encripcion
GO


CREATE TABLE dbo.Clientes(
	IdCliente int IDENTITY(1000,1) NOT NULL,
	NombreCliente varchar(200) NULL,
	Cedula varchar(30) NULL,
	Dirrecion varchar(300) NULL,
	Telefono varchar(20) NULL,
	Celular varchar(20) NULL,
	Correo varchar(200) NULL,

	CONSTRAINT PK_Clientes 
		PRIMARY KEY CLUSTERED (IdCliente ASC)
		WITH (ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) 
)
GO

CREATE TABLE [dbo].[Departamentos](
	[IdDepartamento] [int] IDENTITY(1,1) NOT NULL,
	[NombreDepartamento] [varchar](120) NULL,
	[IdDepartamentoSuperior] [int] NOT NULL,
 CONSTRAINT [PK_Departamentos] PRIMARY KEY CLUSTERED 
(
	[IdDepartamento] ASC
)
) 
GO


GO

CREATE TABLE [dbo].[Servicios](
	[IdServicio] [int] NOT NULL,
	[NombreServicio] [varchar](120) NULL,
	[Precio] [money] NULL,
 CONSTRAINT [PK_Servicios] PRIMARY KEY CLUSTERED 
(
	[IdServicio] ASC
)
) 
GO

CREATE TABLE dbo.DepartamentosServicios(
	IdDepartamentoServicio int IDENTITY(1,1) NOT NULL,
	IdDepartamento int NOT NULL,
	IdServicio int NOT NULL,

	CONSTRAINT PK_DepartamentosServicios
		PRIMARY KEY CLUSTERED (IdDepartamentoServicio ASC)
		WITH (ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF),

	CONSTRAINT FK_DepartamentosServicios_Departamentos			-- 1ra forma de crear las llaves foráneas
		FOREIGN KEY(IdDepartamento)
		REFERENCES dbo.Departamentos (IdDepartamento),

	CONSTRAINT FK_DepartamentosServicios_Servicios				-- 1ra forma de crear las llaves foráneas
		FOREIGN KEY(IdServicio)
		REFERENCES dbo.Servicios (IdServicio)
) 
GO

CREATE UNIQUE NONCLUSTERED INDEX IdxDepartamentosServicios_01 
	ON dbo.DepartamentosServicios 
	(IdDepartamento,	IdServicio) 
	WITH ( ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) 
GO

/****** Object:  Table [dbo].[Solicitudes]    Script Date: 22/07/2021 08:43:57 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Solicitudes](
	[IdSolicitud] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[NumeroSolicitud] [varchar](20) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Observacion] [varchar](300) NULL,
	[Provincia] [varchar](50) NULL,
 CONSTRAINT [PK_Solicitudes] PRIMARY KEY CLUSTERED 
(
	[IdSolicitud] ASC
) ,
 CONSTRAINT [ck_Solicitudes_05] UNIQUE NONCLUSTERED 
(
	[NumeroSolicitud] ASC
)
) 
GO


-- 2da forma de crear las llaves foráneas
ALTER TABLE dbo.Solicitudes 
	ADD CONSTRAINT FK_Solicitudes_Clientes 
	FOREIGN KEY(IdCliente)
	REFERENCES Clientes (IdCliente)
GO

ALTER TABLE [dbo].[Solicitudes] CHECK CONSTRAINT [FK_Solicitudes_Clientes]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Formato: SBSNN-secuencial. SBS: Solicitud; NN: dos dígitos del año; -:Guión; Secuencial: Secuencial por año' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solicitudes', @level2type=N'COLUMN',@level2name=N'NumeroSolicitud'
GO

CREATE TABLE dbo.SolicitudesDetalle(
	IdSolicitudDetalle int IDENTITY(1,1) NOT NULL,
	IdSolicitud int NULL,
	IdServicio int NULL,
	IdDepartamento int NULL,
	Precio decimal(19,2) NULL,
	Cantidad int NULL,
	OtrosImportes decimal(19,2) NULL,
	ITMBS decimal(19,2) NULL,

	CONSTRAINT PK_SolicitudesDetalle 
		PRIMARY KEY CLUSTERED (IdSolicitudDetalle ASC)
		WITH (ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) 
) 
GO

ALTER TABLE dbo.SolicitudesDetalle  
	ADD  CONSTRAINT FK_SolicitudesDetalle_Solicitudes 
	FOREIGN KEY(IdSolicitud)
	REFERENCES dbo.Solicitudes (IdSolicitud)
GO

ALTER TABLE dbo.SolicitudesDetalle  
	ADD  CONSTRAINT FK_SolicitudesDetalle_Servicios 
	FOREIGN KEY(IdServicio)
	REFERENCES dbo.Servicios (IdServicio)
GO

ALTER TABLE dbo.SolicitudesDetalle  
	ADD  CONSTRAINT FK_SolicitudesDetalle_Departamentos 
	FOREIGN KEY(IdDepartamento)
	REFERENCES dbo.Departamentos (IdDepartamento)
GO

CREATE TABLE dbo.Facturas(
	IdFactura int IDENTITY(1,1) NOT NULL,
	IdCliente int NOT NULL,
	IdDepartamento int NULL,
	Fecha varchar(20) NULL,

	CONSTRAINT PK_Facturas 
		PRIMARY KEY CLUSTERED (IdFactura ASC)
		WITH (ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) 
) 
GO

ALTER TABLE dbo.Facturas  
	ADD  CONSTRAINT FK_Facturas_Clientes FOREIGN KEY(IdCliente)
	REFERENCES dbo.Clientes (IdCliente)
GO

ALTER TABLE dbo.Facturas  
	ADD  CONSTRAINT FK_Facturas_Departamentos FOREIGN KEY(IdDepartamento)
	REFERENCES dbo.Departamentos (IdDepartamento)
GO

CREATE TABLE dbo.FacturasDetalle(
	IdFacturaDetalle int IDENTITY(1,1) NOT NULL,
	IdFactura int NULL,
	IdServicio int NULL,
	IdSolicitudDetalle int, 
	Precio money NULL,
	Cantidad int NULL,
	OtrosImportes decimal(4, 2) NULL,
	ITMBS decimal(4, 2) NULL,
	Descuento decimal(4, 2) NULL,

	CONSTRAINT PK_FacturasDetalle 
		PRIMARY KEY CLUSTERED (IdFacturaDetalle ASC)
		WITH (ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) 
) 
GO

ALTER TABLE dbo.FacturasDetalle  
	ADD CONSTRAINT FK_FacturasDetalle_Facturas FOREIGN KEY(IdFactura)
	REFERENCES dbo.Facturas (IdFactura)
GO

ALTER TABLE dbo.FacturasDetalle  
	ADD CONSTRAINT FK_FacturasDetalle_Servicios 
	FOREIGN KEY(IdServicio)
	REFERENCES dbo.Servicios (IdServicio)
GO

ALTER TABLE dbo.FacturasDetalle  
	ADD CONSTRAINT FK_FacturasDetalle_SolicitudesDetalle
	FOREIGN KEY(IdSolicitudDetalle)
	REFERENCES dbo.SolicitudesDetalle (IdSolicitudDetalle)
GO

CREATE TABLE dbo.Recibos(
	IdRecibo int IDENTITY(1,1) NOT NULL,
	IdCliente int NOT NULL,
	Fecha varchar(20) NULL,
	Observaciones varchar(300),

	CONSTRAINT PK_Recibos
		PRIMARY KEY CLUSTERED (IdRecibo ASC) 
		WITH (ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
) 
GO

ALTER TABLE dbo.Recibos 
	ADD CONSTRAINT FK_Recibos_ FOREIGN KEY(IdCliente)
	REFERENCES dbo.Clientes (IdCliente)
GO

CREATE TABLE dbo.RecibosDetalle(
	IdReciboDetalle int IDENTITY(1,1) NOT NULL,
	IdRecibo int NOT NULL,
	IdFacturaDetalle int NOT NULL,
	IdServicio int NULL,
	Precio money NULL,
	Cantidad int NULL,
	OtrosImportes decimal(4, 2) NULL,
	ITMBS decimal(4, 2) NULL,
	Descuento decimal(4, 2) NULL,

	CONSTRAINT PK_RecibosDetalle
	PRIMARY KEY CLUSTERED (IdReciboDetalle ASC)
	WITH (ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 
GO

ALTER TABLE dbo.RecibosDetalle  
	ADD CONSTRAINT FK_RecibosDetalle_Recibos 
	FOREIGN KEY(IdRecibo)
	REFERENCES dbo.Recibos (IdRecibo)
GO

ALTER TABLE dbo.RecibosDetalle  
	ADD CONSTRAINT FK_RecibosDetalle_FacturasDetalle 
	FOREIGN KEY(IdFacturaDetalle)
	REFERENCES dbo.FacturasDetalle (IdFacturaDetalle)
GO

ALTER TABLE dbo.RecibosDetalle  
	ADD CONSTRAINT FK_RecibosDetalle_Servicios
	FOREIGN KEY(IdServicio)
	REFERENCES dbo.Servicios (IdServicio)
GO


