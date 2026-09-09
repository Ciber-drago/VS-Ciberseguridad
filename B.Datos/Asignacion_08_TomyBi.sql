-- =========================================
-- ASIGNACION 08
-- TOMY BI
-- BASE DE DATOS SEGURAS
-- =========================================

USE pubs;
GO

-- =========================================
-- USUARIOS VENTAS
-- =========================================

CREATE LOGIN usr_ventas_01
WITH PASSWORD='Password123!',
DEFAULT_DATABASE=pubs;
GO

CREATE LOGIN usr_ventas_02
WITH PASSWORD='Password123!',
DEFAULT_DATABASE=pubs;
GO

CREATE LOGIN usr_ventas_03
WITH PASSWORD='Password123!',
DEFAULT_DATABASE=pubs;
GO

-- =========================================
-- USUARIOS EDITORIALES
-- =========================================

CREATE LOGIN usr_edit_01
WITH PASSWORD='Password123!',
DEFAULT_DATABASE=pubs;
GO

CREATE LOGIN usr_edit_02
WITH PASSWORD='Password123!',
DEFAULT_DATABASE=pubs;
GO

CREATE LOGIN usr_edit_03
WITH PASSWORD='Password123!',
DEFAULT_DATABASE=pubs;
GO

-- =========================================
-- USUARIOS LIBROS
-- =========================================

CREATE LOGIN usr_libros_01
WITH PASSWORD='Password123!',
DEFAULT_DATABASE=pubs;
GO

CREATE LOGIN usr_libros_02
WITH PASSWORD='Password123!',
DEFAULT_DATABASE=pubs;
GO

CREATE LOGIN usr_libros_03
WITH PASSWORD='Password123!',
DEFAULT_DATABASE=pubs;
GO

-- =========================================
-- CREACION DE USERS
-- =========================================

USE pubs;
GO

CREATE USER usr_ventas_01
FOR LOGIN usr_ventas_01;
GO

CREATE USER usr_ventas_02
FOR LOGIN usr_ventas_02;
GO

CREATE USER usr_ventas_03
FOR LOGIN usr_ventas_03;
GO

CREATE USER usr_edit_01
FOR LOGIN usr_edit_01;
GO

CREATE USER usr_edit_02
FOR LOGIN usr_edit_02;
GO

CREATE USER usr_edit_03
FOR LOGIN usr_edit_03;
GO

CREATE USER usr_libros_01
FOR LOGIN usr_libros_01;
GO

CREATE USER usr_libros_02
FOR LOGIN usr_libros_02;
GO

CREATE USER usr_libros_03
FOR LOGIN usr_libros_03;
GO

-- =========================================
-- CREACION DE ROLES
-- =========================================

CREATE ROLE Ventas;
GO

CREATE ROLE Editoriales;
GO

CREATE ROLE Libros;
GO

-- =========================================
-- ASIGNACION DE USUARIOS A ROLES
-- =========================================

USE pubs;
GO

ALTER ROLE Ventas
ADD MEMBER usr_ventas_01;
GO

ALTER ROLE Ventas
ADD MEMBER usr_ventas_02;
GO

ALTER ROLE Ventas
ADD MEMBER usr_ventas_03;
GO

ALTER ROLE Editoriales
ADD MEMBER usr_edit_01;
GO

ALTER ROLE Editoriales
ADD MEMBER usr_edit_02;
GO

ALTER ROLE Editoriales
ADD MEMBER usr_edit_03;
GO

ALTER ROLE Libros
ADD MEMBER usr_libros_01;
GO

ALTER ROLE Libros
ADD MEMBER usr_libros_02;
GO

ALTER ROLE Libros
ADD MEMBER usr_libros_03;
GO

-- =========================================
-- PERMISOS ROL VENTAS
-- =========================================

GRANT SELECT, INSERT, UPDATE, DELETE
ON sales
TO Ventas;
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON stores
TO Ventas;
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON discounts
TO Ventas;
GO

-- =========================================
-- PERMISOS ROL EDITORIALES
-- =========================================

GRANT SELECT, INSERT, UPDATE, DELETE
ON publishers
TO Editoriales;
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON pub_info
TO Editoriales;
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON employee
TO Editoriales;
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON jobs
TO Editoriales;
GO

-- =========================================
-- PERMISOS ROL LIBROS
-- =========================================

GRANT SELECT, INSERT, UPDATE, DELETE
ON titles
TO Libros;
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON authors
TO Libros;
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON titleauthor
TO Libros;
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON roysched
TO Libros;
GO