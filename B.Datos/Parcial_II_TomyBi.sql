-- =========================================
-- PARCIAL II
-- BASES DE DATOS SEGURAS
-- TOMYBI
-- =========================================


-- =========================================
-- PUNTO 1
-- CREAR 5 USERS EN bd_Compras
-- =========================================

CREATE DATABASE bd_Compras;
GO

USE bd_Compras;
GO


-- =========================================
-- No es posible crear USERS
-- sin LOGIN previamente creado
-- =========================================

CREATE LOGIN usr_TomyBi_01
WITH PASSWORD = 'Password123!';
GO

CREATE LOGIN usr_TomyBi_02
WITH PASSWORD = 'Password123!';
GO

CREATE LOGIN usr_TomyBi_03
WITH PASSWORD = 'Password123!';
GO

CREATE LOGIN usr_TomyBi_04
WITH PASSWORD = 'Password123!';
GO

CREATE LOGIN usr_TomyBi_05
WITH PASSWORD = 'Password123!';
GO


CREATE USER usr_TomyBi_01
FOR LOGIN usr_TomyBi_01;
GO

CREATE USER usr_TomyBi_02
FOR LOGIN usr_TomyBi_02;
GO

CREATE USER usr_TomyBi_03
FOR LOGIN usr_TomyBi_03;
GO

CREATE USER usr_TomyBi_04
FOR LOGIN usr_TomyBi_04;
GO

CREATE USER usr_TomyBi_05
FOR LOGIN usr_TomyBi_05;
GO


-- =========================================
-- PUNTO 2
-- CREAR 5 BASES DE DATOS
-- =========================================

CREATE DATABASE bd_TomyBi_01;
GO

CREATE DATABASE bd_TomyBi_02;
GO

CREATE DATABASE bd_TomyBi_03;
GO

CREATE DATABASE bd_TomyBi_04;
GO

CREATE DATABASE bd_TomyBi_05;
GO


-- =========================================
-- PUNTO 3
-- CREAR 5 LOGINS
-- =========================================

CREATE LOGIN usr_TomyBi_06
WITH PASSWORD = 'Password123!';
GO

CREATE LOGIN usr_TomyBi_07
WITH PASSWORD = 'Password123!';
GO

CREATE LOGIN usr_TomyBi_08
WITH PASSWORD = 'Password123!';
GO

CREATE LOGIN usr_TomyBi_09
WITH PASSWORD = 'Password123!';
GO

CREATE LOGIN usr_TomyBi_10
WITH PASSWORD = 'Password123!';
GO


-- =========================================
-- PUNTO 4
-- CREAR 5 USERS
-- =========================================

USE bd_TomyBi_01;
GO

CREATE USER usr_TomyBi_06
FOR LOGIN usr_TomyBi_06;
GO

USE bd_TomyBi_02;
GO

CREATE USER usr_TomyBi_07
FOR LOGIN usr_TomyBi_07;
GO

USE bd_TomyBi_03;
GO

CREATE USER usr_TomyBi_08
FOR LOGIN usr_TomyBi_08;
GO

USE bd_TomyBi_04;
GO

CREATE USER usr_TomyBi_09
FOR LOGIN usr_TomyBi_09;
GO

USE bd_TomyBi_05;
GO

CREATE USER usr_TomyBi_10
FOR LOGIN usr_TomyBi_10;
GO
-- =========================================
-- PUNTO 5
-- MODELO DE VIATICOS
-- =========================================

CREATE DATABASE bd_Viaticos;
GO

USE bd_Viaticos;
GO


-- =========================================
-- TABLAS PADRE
-- =========================================

CREATE TABLE TipoTransporte (
    idTipoTransporte TINYINT PRIMARY KEY,
    DescripcionTransporte VARCHAR(100)
);
GO


CREATE TABLE Estatus (
    idEstatus TINYINT PRIMARY KEY,
    DescripcionEstatus VARCHAR(300)
);
GO


CREATE TABLE Documentos (
    idTipoDocumento TINYINT PRIMARY KEY,
    NombreDocumento VARCHAR(100),
    Abreviatura VARCHAR(5)
);
GO


CREATE TABLE Colaborador (
    idColaborador BIGINT PRIMARY KEY,
    Nombre1 VARCHAR(200),
    Nombre2 VARCHAR(200),
    Apellido1 VARCHAR(200),
    Apellido2 VARCHAR(200),
    ApellidoCasada VARCHAR(200),
    TipoID TINYINT,
    Identificacion VARCHAR(100)
);
GO


-- =========================================
-- TABLA Solicitud_Viatico_PAT
-- No es posible crear esta tabla
-- sin las tablas padre previamente creadas
-- =========================================

CREATE TABLE Solicitud_Viatico_PAT (

    idSolicitud_Viatico_PAT BIGINT PRIMARY KEY,
    NumeroDocumento VARCHAR(20),
    Fecha DATE,
    idTipoDocumento TINYINT,
    idColaborador BIGINT,
    Observaciones VARCHAR(500),
    idEstatus TINYINT,
    FechaInicio DATE,
    FechaFinal DATE,

    CONSTRAINT FK_SolicitudViaticoPAT_Documentos
    FOREIGN KEY (idTipoDocumento)
    REFERENCES Documentos(idTipoDocumento),

    CONSTRAINT FK_SolicitudViaticoPAT_Colaborador
    FOREIGN KEY (idColaborador)
    REFERENCES Colaborador(idColaborador),

    CONSTRAINT FK_SolicitudViaticoPAT_Estatus
    FOREIGN KEY (idEstatus)
    REFERENCES Estatus(idEstatus)

);
GO


-- =========================================
-- TABLA Solicitud_Viatico_PAT_Detalle
-- No es posible crear esta tabla
-- sin las tablas padre previamente creadas
-- =========================================

CREATE TABLE Solicitud_Viatico_PAT_Detalle (

    idSolicitud_Viatico_PAT_Detalle BIGINT PRIMARY KEY,
    idSolicitud_Viatico_PAT BIGINT,
    Renglon TINYINT,
    FechaHora_Inicio DATETIME,
    FechaHora_Final DATETIME,
    idTipoTransporte TINYINT,
    LugarSalida VARCHAR(200),
    LugarDestino VARCHAR(200),
    MovilizacionExterna DECIMAL(7,2),
    MovilizacionInterna DECIMAL(7,2),
    MontoDesayuno DECIMAL(7,2),
    MontoAlmuerzo DECIMAL(7,2),
    MontoCena DECIMAL(7,2),
    Hospedaje DECIMAL(7,2),

    CONSTRAINT FK_SolicitudViaticoDetalle_SolicitudViaticoPAT
    FOREIGN KEY (idSolicitud_Viatico_PAT)
    REFERENCES Solicitud_Viatico_PAT(idSolicitud_Viatico_PAT),

    CONSTRAINT FK_SolicitudViaticoDetalle_TipoTransporte
    FOREIGN KEY (idTipoTransporte)
    REFERENCES TipoTransporte(idTipoTransporte)

);
GO