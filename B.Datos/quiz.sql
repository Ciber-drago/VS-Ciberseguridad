-- =====================================================================
-- CURSO: BASE DE DATOS SEGURAS | GRUPO: 1S3222
-- ESTUDIANTE: Tomy Bi Zhang
-- =====================================================================

-- PARTE 1: NORTHWIND
USE Northwind;
GO

-- Punto 1: OrderID, ProductName y CategoryName
SELECT od.OrderID, p.ProductName, c.CategoryName
FROM [Order Details] od
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID;
GO

-- Punto 2: Productos en la orden 10248
SELECT p.ProductName
FROM [Order Details] od
JOIN Products p ON od.ProductID = p.ProductID
WHERE od.OrderID = 10248;
GO

-- Punto 3: Categoría para productos 22, 31 o 9
SELECT DISTINCT c.CategoryName
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE p.ProductID IN (22, 31, 9);
GO

-- Punto 4: Empleados con órdenes del cliente 'QUICK'
SELECT DISTINCT e.LastName
FROM Orders o
JOIN Employees e ON o.EmployeeID = e.EmployeeID
WHERE o.CustomerID = 'QUICK';
GO


-- PARTE 2: PUBS
USE pubs;
GO

-- Punto 5: Datos del empleado 'PMA42628M' y descripción de empleo
SELECT e.*, j.job_desc
FROM employee e
JOIN jobs j ON e.job_id = j.job_id
WHERE e.emp_id = 'PMA42628M';
GO

-- Punto 6: Datos del empleado y editorial (con alias requeridos)
SELECT E.*, P.pub_name AS Editorial
FROM employee E
JOIN publishers P ON E.pub_id = P.pub_id
WHERE E.emp_id = 'PMA42628M';
GO

-- Punto 7: Órdenes de compra por almacén
SELECT s.stor_name, sa.ord_num, sa.ord_date
FROM stores s
JOIN sales sa ON s.stor_id = sa.stor_id;
GO