-- =========================================
-- UNIVERSIDAD TECNOLOGICA DE PANAMA
-- BASES DE DATOS SEGURAS
-- EXAMEN PARCIAL II
-- TOMY BI
-- =========================================


-- =========================================
-- PUNTO 1
-- CREAR 5 USERS EN bd_DemoDB
-- =========================================

CREATE DATABASE bd_DemoDB;
GO

USE bd_DemoDB;
GO

-- No es posible crear los usuarios en este momento.
-- SQL Server requiere que exista previamente un LOGIN.
-- Se continuara con los siguientes puntos y este
-- punto sera completado posteriormente.

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

-- =========================================
-- PUNTO 4
-- CREAR 10 USUARIOS
-- =========================================

-- =========================================
-- BASE DE DATOS 01
-- =========================================

CREATE LOGIN usr_TomyBi_06
WITH PASSWORD = 'Password123!';
GO

CREATE LOGIN usr_TomyBi_07
WITH PASSWORD = 'Password123!';
GO

USE bd_TomyBi_01;
GO

CREATE USER usr_TomyBi_06
FOR LOGIN usr_TomyBi_06;
GO

CREATE USER usr_TomyBi_07
FOR LOGIN usr_TomyBi_07;
GO


-- =========================================
-- BASE DE DATOS 02
-- =========================================

CREATE LOGIN usr_TomyBi_08
WITH PASSWORD = 'Password123!';
GO

CREATE LOGIN usr_TomyBi_09
WITH PASSWORD = 'Password123!';
GO

USE bd_TomyBi_02;
GO

CREATE USER usr_TomyBi_08
FOR LOGIN usr_TomyBi_08;
GO

CREATE USER usr_TomyBi_09
FOR LOGIN usr_TomyBi_09;
GO


-- =========================================
-- BASE DE DATOS 03
-- =========================================

CREATE LOGIN usr_TomyBi_10
WITH PASSWORD = 'Password123!';
GO

CREATE LOGIN usr_TomyBi_11
WITH PASSWORD = 'Password123!';
GO

USE bd_TomyBi_03;
GO

CREATE USER usr_TomyBi_10
FOR LOGIN usr_TomyBi_10;
GO

CREATE USER usr_TomyBi_11
FOR LOGIN usr_TomyBi_11;
GO


-- =========================================
-- BASE DE DATOS 04
-- =========================================

CREATE LOGIN usr_TomyBi_12
WITH PASSWORD = 'Password123!';
GO

CREATE LOGIN usr_TomyBi_13
WITH PASSWORD = 'Password123!';
GO

USE bd_TomyBi_04;
GO

CREATE USER usr_TomyBi_12
FOR LOGIN usr_TomyBi_12;
GO

CREATE USER usr_TomyBi_13
FOR LOGIN usr_TomyBi_13;
GO


-- =========================================
-- BASE DE DATOS 05
-- =========================================

CREATE LOGIN usr_TomyBi_14
WITH PASSWORD = 'Password123!';
GO

CREATE LOGIN usr_TomyBi_15
WITH PASSWORD = 'Password123!';
GO

USE bd_TomyBi_05;
GO

CREATE USER usr_TomyBi_14
FOR LOGIN usr_TomyBi_14;
GO

CREATE USER usr_TomyBi_15
FOR LOGIN usr_TomyBi_15;
GO

-- =========================================
-- COMPLETAR PUNTO 1
-- CREAR 5 USERS EN bd_DemoDB
-- =========================================

USE bd_DemoDB;
GO

-- Ahora es posible crear los users debido a que
-- los logins fueron creados previamente.

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
-- PUNTO 5
-- BASE DE DATOS OBRAS DE AVENTURAS
-- =========================================

CREATE DATABASE bd_ObrasDeAventuras;
GO

USE bd_ObrasDeAventuras;
GO

-- =========================================
-- TABLAS PADRE
-- =========================================

-- =========================================
-- TABLA Contact
-- =========================================

CREATE TABLE Contact (
    ContactID INT IDENTITY(1,1),

    NameStyle BIT,
    Title NVARCHAR(8),
    FirstName VARCHAR(50),
    MiddleName VARCHAR(50),
    LastName VARCHAR(50),
    Suffix NVARCHAR(10),
    EmailAddress NVARCHAR(50),
    EmailPromotion INT,
    Phone VARCHAR(25),
    PasswordHash VARCHAR(40),
    PasswordSalt VARCHAR(10),
    AdditionalContactInfo XML,
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME,

    CONSTRAINT PK_Contact
    PRIMARY KEY (ContactID)
);
GO

-- =========================================
-- TABLA ContactType
-- =========================================

CREATE TABLE ContactType (
    ContactTypeID INT IDENTITY(1,1),

    Name VARCHAR(50),
    ModifiedDate DATETIME,

    CONSTRAINT PK_ContactType
    PRIMARY KEY (ContactTypeID)
);
GO

-- =========================================
-- TABLA Product
-- =========================================

CREATE TABLE Product (
    ProductID INT IDENTITY(1,1),

    Name VARCHAR(100),
    ProductNumber NVARCHAR(25),
    MakeFlag BIT,
    FinishedGoodsFlag BIT,
    Color NVARCHAR(15),
    SafetyStockLevel SMALLINT,
    ReorderPoint SMALLINT,
    StandardCost MONEY,
    ListPrice MONEY,
    Size NVARCHAR(5),
    SizeUnitMeasureCode NCHAR(3),
    WeightUnitMeasureCode NCHAR(3),
    Weight DECIMAL(8,2),
    DaysToManufacture INT,
    ProductLine NCHAR(2),
    Class NCHAR(2),
    Style NCHAR(2),
    ProductSubcategoryID INT,
    ProductModelID INT,
    SellStartDate DATETIME,
    SellEndDate DATETIME,
    DiscontinuedDate DATETIME,
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME,

    CONSTRAINT PK_Product
    PRIMARY KEY (ProductID)
);
GO

-- =========================================
-- TABLA Vendor
-- =========================================

CREATE TABLE Vendor (
    VendorID INT IDENTITY(1,1),

    AccountNumber VARCHAR(50),
    Name VARCHAR(100),
    CreditRating TINYINT,
    PreferredVendorStatus BIT,
    ActiveFlag BIT,
    PurchasingWebServiceURL NVARCHAR(1024),
    ModifiedDate DATETIME,

    CONSTRAINT PK_Vendor
    PRIMARY KEY (VendorID)
);
GO

-- =========================================
-- TABLA ShipMethod
-- =========================================

CREATE TABLE ShipMethod (
    ShipMethodID INT IDENTITY(1,1),

    Name VARCHAR(100),
    ShipBase MONEY,
    ShipRate MONEY,
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME,

    CONSTRAINT PK_ShipMethod
    PRIMARY KEY (ShipMethodID)
);
GO

-- =========================================
-- TABLAS HIJAS
-- =========================================

-- =========================================
-- TABLA PurchaseOrderHeader
-- =========================================

CREATE TABLE PurchaseOrderHeader (
    PurchaseOrderID INT IDENTITY(1,1),

    RevisionNumber TINYINT,
    Status TINYINT,
    EmployeeID INT,
    VendorID INT,
    ShipMethodID INT,
    OrderDate DATETIME,
    ShipDate DATETIME,
    SubTotal MONEY,
    TaxAmt MONEY,
    Freight MONEY,
    TotalDue MONEY,
    ModifiedDate DATETIME,

    CONSTRAINT PK_PurchaseOrderHeader
    PRIMARY KEY (PurchaseOrderID),

    CONSTRAINT FK_PurchaseOrderHeader_Vendor
    FOREIGN KEY (VendorID)
    REFERENCES Vendor(VendorID),

    CONSTRAINT FK_PurchaseOrderHeader_ShipMethod
    FOREIGN KEY (ShipMethodID)
    REFERENCES ShipMethod(ShipMethodID)
);
GO


-- =========================================
-- TABLA ProductVendor
-- =========================================

CREATE TABLE ProductVendor (
    ProductID INT,
    VendorID INT,

    AverageLeadTime INT,
    StandardPrice MONEY,
    LastReceiptCost MONEY,
    LastReceiptDate DATETIME,
    MinOrderQty INT,
    MaxOrderQty INT,
    OnOrderQty INT,
    UnitMeasureCode NCHAR(3),
    ModifiedDate DATETIME,

    CONSTRAINT PK_ProductVendor
    PRIMARY KEY (ProductID, VendorID),

    CONSTRAINT FK_ProductVendor_Product
    FOREIGN KEY (ProductID)
    REFERENCES Product(ProductID),

    CONSTRAINT FK_ProductVendor_Vendor
    FOREIGN KEY (VendorID)
    REFERENCES Vendor(VendorID)
);
GO


-- =========================================
-- TABLA VendorAddress
-- =========================================

CREATE TABLE VendorAddress (
    VendorID INT,
    AddressID INT,
    AddressTypeID INT,
    ModifiedDate DATETIME,

    CONSTRAINT PK_VendorAddress
    PRIMARY KEY (VendorID, AddressID),

    CONSTRAINT FK_VendorAddress_Vendor
    FOREIGN KEY (VendorID)
    REFERENCES Vendor(VendorID)
);
GO


-- =========================================
-- TABLA VendorContact
-- =========================================

CREATE TABLE VendorContact (
    VendorID INT,
    ContactID INT,
    ContactTypeID INT,
    ModifiedDate DATETIME,

    CONSTRAINT PK_VendorContact
    PRIMARY KEY (VendorID, ContactID, ContactTypeID),

    CONSTRAINT FK_VendorContact_Vendor
    FOREIGN KEY (VendorID)
    REFERENCES Vendor(VendorID),

    CONSTRAINT FK_VendorContact_Contact
    FOREIGN KEY (ContactID)
    REFERENCES Contact(ContactID),

    CONSTRAINT FK_VendorContact_ContactType
    FOREIGN KEY (ContactTypeID)
    REFERENCES ContactType(ContactTypeID)
);
GO


-- =========================================
-- TABLA PurchaseOrderDetail
-- =========================================

CREATE TABLE PurchaseOrderDetail (
    PurchaseOrderID INT,
    PurchaseOrderDetailID INT IDENTITY(1,1),

    DueDate DATETIME,
    OrderQty SMALLINT,
    ProductID INT,
    UnitPrice MONEY,
    LineTotal MONEY,
    ReceivedQty DECIMAL(8,2),
    RejectedQty DECIMAL(8,2),
    StockedQty DECIMAL(9,2),
    ModifiedDate DATETIME,

    CONSTRAINT PK_PurchaseOrderDetail
    PRIMARY KEY (PurchaseOrderID, PurchaseOrderDetailID),

    CONSTRAINT FK_PurchaseOrderDetail_PurchaseOrderHeader
    FOREIGN KEY (PurchaseOrderID)
    REFERENCES PurchaseOrderHeader(PurchaseOrderID),

    CONSTRAINT FK_PurchaseOrderDetail_Product
    FOREIGN KEY (ProductID)
    REFERENCES Product(ProductID)
);
GO