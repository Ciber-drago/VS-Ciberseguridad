/* ============================================================================
   PROYECTO FINAL - TECNOLOGÍA DE BASE DE DATOS
   Empresa X: Solicitud de Servicios, Facturación y Cobro (Recibo)
   Motor: SQL Server
   ============================================================================ */

USE Ejemplo_SIN_Encripcion;
GO

/* ============================================================================
   1. CREACIÓN DE TABLAS
   Se crean UNA sola vez todas las tablas del proyecto (Solicitud, Facturación
   y Cobro), aunque algunas sean utilizadas por más de un subproceso.
   ============================================================================ */

-- ---------------------------------------------------------------------------
-- Catálogos / entidades base (compartidas por los 3 subprocesos)
-- ---------------------------------------------------------------------------
CREATE TABLE Departamento (
    Codigo_Departamento   INT             NOT NULL,
    Nombre_Departamento   VARCHAR(200)    NOT NULL,
    CONSTRAINT PK_Departamento PRIMARY KEY (Codigo_Departamento)
);
GO

CREATE TABLE Colaborador (
    Codigo_Colaborador    INT             NOT NULL,
    Nombre1               VARCHAR(200)    NOT NULL,
    Nombre2               VARCHAR(200)    NULL,
    Apellido1             VARCHAR(200)    NOT NULL,
    Apellido2             VARCHAR(200)    NULL,
    Tipo_Colaborador      INT             NOT NULL, -- 1: Nacional, 2: Extranjero
    Identificacion        VARCHAR(50)     NOT NULL,
    Tipo_Identificacion   INT             NOT NULL, -- 1: Cédula, 2: Pasaporte
    Direccion             VARCHAR(500)    NULL,
    Email                 VARCHAR(500)    NULL,
    Codigo_Departamento   INT             NOT NULL,
    CONSTRAINT PK_Colaborador PRIMARY KEY (Codigo_Colaborador),
    CONSTRAINT FK_Colaborador_Departamento FOREIGN KEY (Codigo_Departamento)
        REFERENCES Departamento (Codigo_Departamento)
);
GO

CREATE TABLE Cliente (
    Codigo_Cliente        INT             NOT NULL,
    Nombre1               VARCHAR(200)    NOT NULL,
    Nombre2               VARCHAR(200)    NULL,
    Apellido1             VARCHAR(200)    NULL,
    Apellido2             VARCHAR(200)    NULL,
    Tipo_Cliente          INT             NOT NULL, -- 1: Natural, 2: Jurídico
    Identificacion        VARCHAR(50)     NOT NULL,
    Tipo_Identificacion   INT             NOT NULL, -- 1: Cédula, 2: Pasaporte, 3: RUC
    Direccion             VARCHAR(500)    NULL,
    Email                 VARCHAR(500)    NULL,
    CONSTRAINT PK_Cliente PRIMARY KEY (Codigo_Cliente)
);
GO

CREATE TABLE Cliente_Telefonos (
    Codigo_Cliente        INT             NOT NULL,
    Telefono              VARCHAR(20)     NOT NULL,
    CONSTRAINT PK_Cliente_Telefonos PRIMARY KEY (Codigo_Cliente, Telefono),
    CONSTRAINT FK_ClienteTelefonos_Cliente FOREIGN KEY (Codigo_Cliente)
        REFERENCES Cliente (Codigo_Cliente)
);
GO

CREATE TABLE Cliente_Contactos (
    Codigo_Cliente        INT             NOT NULL,
    Codigo_Contacto       INT             NOT NULL,
    Nombre_Contacto       VARCHAR(200)    NOT NULL,
    CONSTRAINT PK_Cliente_Contactos PRIMARY KEY (Codigo_Cliente, Codigo_Contacto),
    CONSTRAINT FK_ClienteContactos_Cliente FOREIGN KEY (Codigo_Cliente)
        REFERENCES Cliente (Codigo_Cliente)
);
GO

CREATE TABLE Servicio (
    Codigo_Servicio       INT             NOT NULL,
    Nombre_Servicio       VARCHAR(200)    NOT NULL,
    Precio_Base           DECIMAL(19,6)   NOT NULL,
    CONSTRAINT PK_Servicio PRIMARY KEY (Codigo_Servicio)
);
GO

CREATE TABLE Unidad_Medida (
    Codigo_Unidad_Medida  INT             NOT NULL,
    Nombre_Unidad_Medida  VARCHAR(200)    NOT NULL,
    CONSTRAINT PK_Unidad_Medida PRIMARY KEY (Codigo_Unidad_Medida)
);
GO

-- ---------------------------------------------------------------------------
-- Subproceso 1: SOLICITUD DE SERVICIOS
-- ---------------------------------------------------------------------------
CREATE TABLE Solicitud (
    Numero_Solicitud      VARCHAR(20)     NOT NULL,
    Fecha_Solicitud       DATETIME        NOT NULL,
    Observacion           VARCHAR(500)    NULL,
    Codigo_Cliente        INT             NOT NULL,
    Codigo_Colaborador    INT             NOT NULL,
    CONSTRAINT PK_Solicitud PRIMARY KEY (Numero_Solicitud),
    CONSTRAINT FK_Solicitud_Cliente FOREIGN KEY (Codigo_Cliente)
        REFERENCES Cliente (Codigo_Cliente),
    CONSTRAINT FK_Solicitud_Colaborador FOREIGN KEY (Codigo_Colaborador)
        REFERENCES Colaborador (Codigo_Colaborador)
);
GO

CREATE TABLE Solicitud_Detalle (
    Numero_Solicitud      VARCHAR(20)     NOT NULL,
    Renglon               INT             NOT NULL,
    Codigo_Servicio       INT             NOT NULL,
    Codigo_Unidad_Medida  INT             NOT NULL,
    Codigo_Departamento   INT             NOT NULL,
    Cantidad              DECIMAL(19,6)   NOT NULL,
    Precio_Unitario       DECIMAL(19,6)   NOT NULL,
    Descuento             DECIMAL(19,6)   NOT NULL DEFAULT 0,
    ITBMS                 DECIMAL(19,6)   NOT NULL DEFAULT 0,
    Otros_Importes        DECIMAL(19,6)   NOT NULL DEFAULT 0,
    Estado                INT             NOT NULL DEFAULT 1, -- 1: En espera, 2: Atendido, 3: Facturado
    CONSTRAINT PK_Solicitud_Detalle PRIMARY KEY (Numero_Solicitud, Renglon),
    CONSTRAINT FK_SolicitudDetalle_Solicitud FOREIGN KEY (Numero_Solicitud)
        REFERENCES Solicitud (Numero_Solicitud),
    CONSTRAINT FK_SolicitudDetalle_Servicio FOREIGN KEY (Codigo_Servicio)
        REFERENCES Servicio (Codigo_Servicio),
    CONSTRAINT FK_SolicitudDetalle_UnidadMedida FOREIGN KEY (Codigo_Unidad_Medida)
        REFERENCES Unidad_Medida (Codigo_Unidad_Medida),
    CONSTRAINT FK_SolicitudDetalle_Departamento FOREIGN KEY (Codigo_Departamento)
        REFERENCES Departamento (Codigo_Departamento)
);
GO

-- ---------------------------------------------------------------------------
-- Subproceso 2: FACTURACIÓN
-- (reutiliza Cliente, Colaborador, Departamento, Solicitud, Solicitud_Detalle)
-- ---------------------------------------------------------------------------
CREATE TABLE Factura (
    Numero_Factura        VARCHAR(20)     NOT NULL,
    Fecha_Factura         DATETIME        NOT NULL,
    Codigo_Cliente        INT             NOT NULL,
    Codigo_Colaborador    INT             NOT NULL,
    CONSTRAINT PK_Factura PRIMARY KEY (Numero_Factura),
    CONSTRAINT FK_Factura_Cliente FOREIGN KEY (Codigo_Cliente)
        REFERENCES Cliente (Codigo_Cliente),
    CONSTRAINT FK_Factura_Colaborador FOREIGN KEY (Codigo_Colaborador)
        REFERENCES Colaborador (Codigo_Colaborador)
);
GO

CREATE TABLE Factura_Detalle (
    Numero_Factura        VARCHAR(20)     NOT NULL,
    Renglon_Factura       INT             NOT NULL,
    Numero_Solicitud      VARCHAR(20)     NOT NULL,
    Renglon_Solicitud     INT             NOT NULL,
    Cantidad_Facturada    DECIMAL(19,6)   NOT NULL,
    Precio_Unitario       DECIMAL(19,6)   NOT NULL,
    Descuento             DECIMAL(19,6)   NOT NULL DEFAULT 0,
    ITBMS                 DECIMAL(19,6)   NOT NULL DEFAULT 0,
    Otros_Importes        DECIMAL(19,6)   NOT NULL DEFAULT 0,
    Precio_Total          DECIMAL(19,6)   NOT NULL,
    CONSTRAINT PK_Factura_Detalle PRIMARY KEY (Numero_Factura, Renglon_Factura),
    CONSTRAINT FK_FacturaDetalle_Factura FOREIGN KEY (Numero_Factura)
        REFERENCES Factura (Numero_Factura),
    CONSTRAINT FK_FacturaDetalle_SolicitudDetalle FOREIGN KEY (Numero_Solicitud, Renglon_Solicitud)
        REFERENCES Solicitud_Detalle (Numero_Solicitud, Renglon)
);
GO

-- ---------------------------------------------------------------------------
-- Subproceso 3: COBRO (RECIBO)
-- (reutiliza Cliente, Colaborador, Factura, Factura_Detalle)
-- ---------------------------------------------------------------------------
CREATE TABLE Recibo (
    Numero_Recibo         VARCHAR(20)     NOT NULL,
    Fecha_Recibo          DATETIME        NOT NULL,
    Codigo_Cliente        INT             NOT NULL,
    Codigo_Colaborador    INT             NOT NULL, -- cajero
    Monto_Total_Recibo    DECIMAL(19,6)   NOT NULL,
    CONSTRAINT PK_Recibo PRIMARY KEY (Numero_Recibo),
    CONSTRAINT FK_Recibo_Cliente FOREIGN KEY (Codigo_Cliente)
        REFERENCES Cliente (Codigo_Cliente),
    CONSTRAINT FK_Recibo_Colaborador FOREIGN KEY (Codigo_Colaborador)
        REFERENCES Colaborador (Codigo_Colaborador)
);
GO

CREATE TABLE Recibo_Detalle (
    Numero_Recibo         VARCHAR(20)     NOT NULL,
    Renglon_Recibo        INT             NOT NULL,
    Numero_Factura        VARCHAR(20)     NOT NULL,
    Renglon_Factura       INT             NOT NULL,
    Monto_Abonado         DECIMAL(19,6)   NOT NULL,
    Descuento             DECIMAL(19,6)   NOT NULL DEFAULT 0,
    Otros_Importes        DECIMAL(19,6)   NOT NULL DEFAULT 0,
    ITBMS                 DECIMAL(19,6)   NOT NULL DEFAULT 0,
    Total_Pagado          DECIMAL(19,6)   NOT NULL,
    CONSTRAINT PK_Recibo_Detalle PRIMARY KEY (Numero_Recibo, Renglon_Recibo),
    CONSTRAINT FK_ReciboDetalle_Recibo FOREIGN KEY (Numero_Recibo)
        REFERENCES Recibo (Numero_Recibo),
    CONSTRAINT FK_ReciboDetalle_FacturaDetalle FOREIGN KEY (Numero_Factura, Renglon_Factura)
        REFERENCES Factura_Detalle (Numero_Factura, Renglon_Factura)
);
GO

/* ============================================================================
   2. CREACIÓN DE ROLES (uno por proceso)
   ============================================================================ */

CREATE ROLE RolSolicitudServicios;
GO
CREATE ROLE RolFacturacion;
GO
CREATE ROLE RolCobro;
GO

/* ============================================================================
   3. ASIGNACIÓN DE TABLAS A ROLES Y PERMISOS
   Cada rol recibe los 4 permisos principales (SELECT, INSERT, UPDATE, DELETE)
   sobre las tablas que le pertenecen a su proceso.
   ============================================================================ */

-- ---- RolSolicitudServicios ----
GRANT SELECT, INSERT, UPDATE, DELETE ON Departamento        TO RolSolicitudServicios;
GRANT SELECT, INSERT, UPDATE, DELETE ON Colaborador         TO RolSolicitudServicios;
GRANT SELECT, INSERT, UPDATE, DELETE ON Cliente             TO RolSolicitudServicios;
GRANT SELECT, INSERT, UPDATE, DELETE ON Cliente_Telefonos   TO RolSolicitudServicios;
GRANT SELECT, INSERT, UPDATE, DELETE ON Cliente_Contactos   TO RolSolicitudServicios;
GRANT SELECT, INSERT, UPDATE, DELETE ON Servicio            TO RolSolicitudServicios;
GRANT SELECT, INSERT, UPDATE, DELETE ON Unidad_Medida       TO RolSolicitudServicios;
GRANT SELECT, INSERT, UPDATE, DELETE ON Solicitud           TO RolSolicitudServicios;
GRANT SELECT, INSERT, UPDATE, DELETE ON Solicitud_Detalle   TO RolSolicitudServicios;
GO

-- ---- RolFacturacion ----
-- Consulta las tablas de origen de la solicitud (solo lectura) y administra sus propias tablas
GRANT SELECT ON Cliente                                     TO RolFacturacion;
GRANT SELECT ON Colaborador                                 TO RolFacturacion;
GRANT SELECT ON Solicitud                                   TO RolFacturacion;
GRANT SELECT, UPDATE ON Solicitud_Detalle                   TO RolFacturacion; -- actualiza Estado a 'Facturado'
GRANT SELECT, INSERT, UPDATE, DELETE ON Factura             TO RolFacturacion;
GRANT SELECT, INSERT, UPDATE, DELETE ON Factura_Detalle     TO RolFacturacion;
GO

-- ---- RolCobro ----
-- Consulta cliente/colaborador/factura (solo lectura) y administra sus propias tablas
GRANT SELECT ON Cliente                                     TO RolCobro;
GRANT SELECT ON Colaborador                                 TO RolCobro;
GRANT SELECT ON Factura                                     TO RolCobro;
GRANT SELECT, UPDATE ON Factura_Detalle                     TO RolCobro; -- Consulta y actualización del detalle de la factura
GRANT SELECT, INSERT, UPDATE, DELETE ON Recibo              TO RolCobro;
GRANT SELECT, INSERT, UPDATE, DELETE ON Recibo_Detalle      TO RolCobro;
GO

/* ============================================================================
   4. ASIGNACIÓN DEL USUARIO A LOS ROLES
   ============================================================================ */

ALTER ROLE RolSolicitudServicios ADD MEMBER UsrProcesa;
ALTER ROLE RolFacturacion ADD MEMBER UsrProcesa;
ALTER ROLE RolCobro ADD MEMBER UsrProcesa;
GO
