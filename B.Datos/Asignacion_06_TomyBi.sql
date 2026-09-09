-- =========================================
-- ASIGNACION 06
-- BASES DE DATOS SEGURAS
-- =========================================

-- =========================================
-- CREACION DE BASES DE DATOS
-- =========================================

CREATE DATABASE bd_A6_TomyBi_01;
GO

CREATE DATABASE bd_A6_TomyBi_02;
GO

CREATE DATABASE bd_A6_TomyBi_03;
GO

CREATE DATABASE bd_A6_TomyBi_04;
GO

CREATE DATABASE bd_A6_TomyBi_05;
GO


-- =========================================
-- CREACION DE LOGINS
-- No es posible crear USERS sin LOGIN
-- =========================================

CREATE LOGIN usr_A6_TomyBi_01
WITH PASSWORD = 'Password123!';
GO

CREATE LOGIN usr_A6_TomyBi_02
WITH PASSWORD = 'Password123!';
GO

CREATE LOGIN usr_A6_TomyBi_03
WITH PASSWORD = 'Password123!';
GO

CREATE LOGIN usr_A6_TomyBi_04
WITH PASSWORD = 'Password123!';
GO

CREATE LOGIN usr_A6_TomyBi_05
WITH PASSWORD = 'Password123!';
GO

CREATE LOGIN usr_A6_TomyBi_06
WITH PASSWORD = 'Password123!';
GO

CREATE LOGIN usr_A6_TomyBi_07
WITH PASSWORD = 'Password123!';
GO

CREATE LOGIN usr_A6_TomyBi_08
WITH PASSWORD = 'Password123!';
GO

CREATE LOGIN usr_A6_TomyBi_09
WITH PASSWORD = 'Password123!';
GO

CREATE LOGIN usr_A6_TomyBi_10
WITH PASSWORD = 'Password123!';
GO


-- =========================================
-- BASE DE DATOS 1
-- =========================================

USE bd_A6_TomyBi_01;
GO

-- No es posible crear USER
-- sin LOGIN previamente creado

CREATE USER usr_A6_TomyBi_01
FOR LOGIN usr_A6_TomyBi_01;
GO

CREATE USER usr_A6_TomyBi_02
FOR LOGIN usr_A6_TomyBi_02;
GO


-- =========================================
-- BASE DE DATOS 2
-- =========================================

USE bd_A6_TomyBi_02;
GO

CREATE USER usr_A6_TomyBi_03
FOR LOGIN usr_A6_TomyBi_03;
GO

CREATE USER usr_A6_TomyBi_04
FOR LOGIN usr_A6_TomyBi_04;
GO


-- =========================================
-- BASE DE DATOS 3
-- =========================================

USE bd_A6_TomyBi_03;
GO

CREATE USER usr_A6_TomyBi_05
FOR LOGIN usr_A6_TomyBi_05;
GO

CREATE USER usr_A6_TomyBi_06
FOR LOGIN usr_A6_TomyBi_06;
GO


-- =========================================
-- BASE DE DATOS 4
-- =========================================

USE bd_A6_TomyBi_04;
GO

CREATE USER usr_A6_TomyBi_07
FOR LOGIN usr_A6_TomyBi_07;
GO

CREATE USER usr_A6_TomyBi_08
FOR LOGIN usr_A6_TomyBi_08;
GO


-- =========================================
-- BASE DE DATOS 5
-- =========================================

USE bd_A6_TomyBi_05;
GO

CREATE USER usr_A6_TomyBi_09
FOR LOGIN usr_A6_TomyBi_09;
GO

CREATE USER usr_A6_TomyBi_10
FOR LOGIN usr_A6_TomyBi_10;
GO