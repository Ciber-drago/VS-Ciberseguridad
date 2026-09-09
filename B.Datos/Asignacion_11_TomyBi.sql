-- =========================================
-- ASIGNACION 11
-- TOMY BI
-- BASE DE DATOS SEGURAS
-- =========================================

USE Northwind;
GO

-- =========================================
-- PROCEDIMIENTO: INSERT CUSTOMER
-- =========================================

CREATE PROCEDURE sp_InsertCustomer
    @CustomerID nchar(5),
    @CompanyName nvarchar(40),
    @ContactName nvarchar(30),
    @ContactTitle nvarchar(30),
    @Address nvarchar(60),
    @City nvarchar(15),
    @Region nvarchar(15),
    @PostalCode nvarchar(10),
    @Country nvarchar(15),
    @Phone nvarchar(24),
    @Fax nvarchar(24)
AS
BEGIN
    INSERT INTO Customers
    (
        CustomerID,
        CompanyName,
        ContactName,
        ContactTitle,
        Address,
        City,
        Region,
        PostalCode,
        Country,
        Phone,
        Fax
    )
    VALUES
    (
        @CustomerID,
        @CompanyName,
        @ContactName,
        @ContactTitle,
        @Address,
        @City,
        @Region,
        @PostalCode,
        @Country,
        @Phone,
        @Fax
    );
END;
GO
-- =========================================
-- PROCEDIMIENTO: UPDATE CUSTOMER
-- =========================================

CREATE PROCEDURE sp_UpdateCustomer
    @CustomerID nchar(5),
    @CompanyName nvarchar(40),
    @ContactName nvarchar(30),
    @ContactTitle nvarchar(30),
    @Address nvarchar(60),
    @City nvarchar(15),
    @Region nvarchar(15),
    @PostalCode nvarchar(10),
    @Country nvarchar(15),
    @Phone nvarchar(24),
    @Fax nvarchar(24)
AS
BEGIN
    UPDATE Customers
    SET
        CompanyName = @CompanyName,
        ContactName = @ContactName,
        ContactTitle = @ContactTitle,
        Address = @Address,
        City = @City,
        Region = @Region,
        PostalCode = @PostalCode,
        Country = @Country,
        Phone = @Phone,
        Fax = @Fax
    WHERE CustomerID = @CustomerID;
END;
GO
-- =========================================
-- PROCEDIMIENTO: DELETE CUSTOMER
-- =========================================

CREATE PROCEDURE sp_DeleteCustomer
    @CustomerID nchar(5)
AS
BEGIN
    DELETE FROM Customers
    WHERE CustomerID = @CustomerID;
END;
GO
-- =========================================
-- PROCEDIMIENTO: SELECT CUSTOMER
-- =========================================

CREATE PROCEDURE sp_SelectCustomer
    @CustomerID nchar(5)
AS
BEGIN
    SELECT
        CustomerID,
        CompanyName,
        ContactName,
        ContactTitle,
        Address,
        City,
        Region,
        PostalCode,
        Country,
        Phone,
        Fax
    FROM Customers
    WHERE CustomerID = @CustomerID;
END;
GO
-- =========================================
-- PROCEDIMIENTO: INSERT EMPLOYEE
-- =========================================

CREATE PROCEDURE sp_InsertEmployee
    @LastName nvarchar(20),
    @FirstName nvarchar(10),
    @Title nvarchar(30),
    @TitleOfCourtesy nvarchar(25),
    @BirthDate datetime,
    @HireDate datetime,
    @Address nvarchar(60),
    @City nvarchar(15),
    @Region nvarchar(15),
    @PostalCode nvarchar(10),
    @Country nvarchar(15),
    @HomePhone nvarchar(24),
    @Extension nvarchar(4),
    @ReportsTo int
AS
BEGIN
    INSERT INTO Employees
    (
        LastName,
        FirstName,
        Title,
        TitleOfCourtesy,
        BirthDate,
        HireDate,
        Address,
        City,
        Region,
        PostalCode,
        Country,
        HomePhone,
        Extension,
        ReportsTo
    )
    VALUES
    (
        @LastName,
        @FirstName,
        @Title,
        @TitleOfCourtesy,
        @BirthDate,
        @HireDate,
        @Address,
        @City,
        @Region,
        @PostalCode,
        @Country,
        @HomePhone,
        @Extension,
        @ReportsTo
    );
END;
GO
-- =========================================
-- PROCEDIMIENTO: UPDATE EMPLOYEE
-- =========================================

CREATE PROCEDURE sp_UpdateEmployee
    @EmployeeID int,
    @LastName nvarchar(20),
    @FirstName nvarchar(10),
    @Title nvarchar(30),
    @TitleOfCourtesy nvarchar(25),
    @BirthDate datetime,
    @HireDate datetime,
    @Address nvarchar(60),
    @City nvarchar(15),
    @Region nvarchar(15),
    @PostalCode nvarchar(10),
    @Country nvarchar(15),
    @HomePhone nvarchar(24),
    @Extension nvarchar(4),
    @ReportsTo int
AS
BEGIN
    UPDATE Employees
    SET
        LastName = @LastName,
        FirstName = @FirstName,
        Title = @Title,
        TitleOfCourtesy = @TitleOfCourtesy,
        BirthDate = @BirthDate,
        HireDate = @HireDate,
        Address = @Address,
        City = @City,
        Region = @Region,
        PostalCode = @PostalCode,
        Country = @Country,
        HomePhone = @HomePhone,
        Extension = @Extension,
        ReportsTo = @ReportsTo
    WHERE EmployeeID = @EmployeeID;
END;
GO
-- =========================================
-- PROCEDIMIENTO: DELETE EMPLOYEE
-- =========================================

CREATE PROCEDURE sp_DeleteEmployee
    @EmployeeID int
AS
BEGIN
    DELETE FROM Employees
    WHERE EmployeeID = @EmployeeID;
END;
GO
-- =========================================
-- PROCEDIMIENTO: SELECT EMPLOYEE
-- =========================================

CREATE PROCEDURE sp_SelectEmployee
    @EmployeeID int
AS
BEGIN
    SELECT
        EmployeeID,
        LastName,
        FirstName,
        Title,
        TitleOfCourtesy,
        BirthDate,
        HireDate,
        Address,
        City,
        Region,
        PostalCode,
        Country,
        HomePhone,
        Extension,
        ReportsTo
    FROM Employees
    WHERE EmployeeID = @EmployeeID;
END;
GO
-- =========================================
-- PROCEDIMIENTO: INSERT REGION
-- =========================================

CREATE PROCEDURE sp_InsertRegion
    @RegionID int,
    @RegionDescription nchar(50)
AS
BEGIN
    INSERT INTO Region
    (
        RegionID,
        RegionDescription
    )
    VALUES
    (
        @RegionID,
        @RegionDescription
    );
END;
GO
-- =========================================
-- PROCEDIMIENTO: UPDATE REGION
-- =========================================

CREATE PROCEDURE sp_UpdateRegion
    @RegionID int,
    @RegionDescription nchar(50)
AS
BEGIN
    UPDATE Region
    SET
        RegionDescription = @RegionDescription
    WHERE RegionID = @RegionID;
END;
GO
-- =========================================
-- PROCEDIMIENTO: DELETE REGION
-- =========================================

CREATE PROCEDURE sp_DeleteRegion
    @RegionID int
AS
BEGIN
    DELETE FROM Region
    WHERE RegionID = @RegionID;
END;
GO
-- =========================================
-- PROCEDIMIENTO: SELECT REGION
-- =========================================

CREATE PROCEDURE sp_SelectRegion
    @RegionID int
AS
BEGIN
    SELECT
        RegionID,
        RegionDescription
    FROM Region
    WHERE RegionID = @RegionID;
END;
GO
-- =========================================
-- PUNTO 2 - INSERTAR 3 CUSTOMERS
-- =========================================

EXEC sp_InsertCustomer
    'TOM01',
    'Tomy Company',
    'Tomy Bi',
    'Owner',
    'Condado',
    'Panama',
    'Panama',
    '0801',
    'Panama',
    '6000-0001',
    '6000-0002';
GO

EXEC sp_InsertCustomer
    'TOM02',
    'Cyber Tech',
    'Juan Perez',
    'Manager',
    'Via España',
    'Panama',
    'Panama',
    '0802',
    'Panama',
    '6000-0003',
    '6000-0004';
GO

EXEC sp_InsertCustomer
    'TOM03',
    'Secure Systems',
    'Maria Lopez',
    'Sales',
    'Tumba Muerto',
    'Panama',
    'Panama',
    '0803',
    'Panama',
    '6000-0005',
    '6000-0006';
GO
-- =========================================
-- PUNTO 2 - INSERTAR 3 EMPLOYEES
-- =========================================

EXEC sp_InsertEmployee
    'Gomez',
    'Carlos',
    'Programador',
    'Mr.',
    '1998-05-10',
    '2026-07-05',
    'Via España',
    'Panama',
    'Panama',
    '0801',
    'Panama',
    '6000-1001',
    '100',
    2;
GO

EXEC sp_InsertEmployee
    'Martinez',
    'Laura',
    'Analista',
    'Ms.',
    '1999-08-20',
    '2026-07-05',
    'Tumba Muerto',
    'Panama',
    'Panama',
    '0802',
    'Panama',
    '6000-1002',
    '101',
    2;
GO

EXEC sp_InsertEmployee
    'Rodriguez',
    'Pedro',
    'Administrador',
    'Mr.',
    '1997-02-15',
    '2026-07-05',
    'Condado',
    'Panama',
    'Panama',
    '0803',
    'Panama',
    '6000-1003',
    '102',
    2;
GO
-- =========================================
-- PUNTO 2 - INSERTAR 3 REGIONES
-- =========================================

EXEC sp_InsertRegion
    5,
    'Central';
GO

EXEC sp_InsertRegion
    6,
    'Insular';
GO

EXEC sp_InsertRegion
    7,
    'Metropolitana';
GO
-- =========================================
-- PUNTO 3 - ELIMINAR 1 REGISTRO DE CADA TABLA
-- =========================================

EXEC sp_DeleteCustomer 'TOM03';
GO

EXEC sp_DeleteEmployee 12;
GO

EXEC sp_DeleteRegion 7;
GO
-- =========================================
-- PUNTO 4 - ACTUALIZAR EL APELLIDO DEL EMPLEADO 7
-- =========================================

EXEC sp_UpdateEmployee
    @EmployeeID = 7,
    @LastName = 'Reyes',
    @FirstName = 'Robert',
    @Title = 'Sales Representative',
    @TitleOfCourtesy = 'Mr.',
    @BirthDate = '1960-05-29',
    @HireDate = '1994-01-02',
    @Address = 'Edgeham Hollow Winchester Way',
    @City = 'London',
    @Region = NULL,
    @PostalCode = 'RG1 9SP',
    @Country = 'UK',
    @HomePhone = '(71) 555-5598',
    @Extension = '465',
    @ReportsTo = 5;
GO
-- =========================================
-- PUNTO 5 - ACTUALIZAR DIRECCIÓN DEL CLIENTE CHOPS
-- =========================================

EXEC sp_UpdateCustomer
    @CustomerID = 'CHOPS',
    @CompanyName = 'Chop-suey Chinese',
    @ContactName = 'Yang Wang',
    @ContactTitle = 'Owner',
    @Address = '12, rue des Bouchers',
    @City = 'Bern',
    @Region = NULL,
    @PostalCode = '3012',
    @Country = 'Switzerland',
    @Phone = '0452-076545',
    @Fax = NULL;
GO
-- =========================================
-- PUNTO 6 - ACTUALIZAR DESCRIPCIÓN DE LA REGIÓN
-- =========================================

EXEC sp_UpdateRegion
    @RegionID = 3,
    @RegionDescription = 'Norteña';
GO
-- =========================================
-- PUNTO 7A - PRODUCTOS QUE CONTIENEN "os"
-- =========================================

SELECT *
FROM Products
WHERE ProductName LIKE '%os%';
GO

-- =========================================
-- PUNTO 7B - PROVEEDORES CUYO CONTACTTITLE
-- TERMINA EN "Manager"
-- =========================================

SELECT *
FROM Suppliers
WHERE ContactTitle LIKE '%Manager';
GO

-- =========================================
-- PUNTO 7C - CATEGORÍAS CUYO NOMBRE
-- EMPIEZA CON "co"
-- =========================================

SELECT *
FROM Categories
WHERE CategoryName LIKE 'co%';
GO