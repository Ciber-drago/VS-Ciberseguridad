
-- Entrar a master
use master
go
-- Borrar base de datos si existe
-- Esto solo lo hacemos si es necesario
DROP DATABASE if exists [Ejemplo_SIN_Encripcion] 
go
-- Entrar a master
use master
go
-- Crear la base de datos
CREATE DATABASE [Ejemplo_SIN_Encripcion] 
go

-- Entrar a la base de datos que acabamos de crear
USE  [Ejemplo_SIN_Encripcion]
go
-- Crear las tablas del aplicativo. Por lo pronto sólo se tendrá una tabla
-- Cada Grupo debe crear las tablas que se necesitan para su proyecto
-- Recordar que identity significa autoincremental. Se genera de manera automática, 
-- no debemos insertarle datos diractamente 
-- (a menos que se usen comandos especiales para nuestro caso no lo haremos)
create table Perfiles
(
CodigoUsuario integer identity(1000, 1) not null, -- El CodigoUsuario empieza el conteo desde 1000
NombreUsuario varchar(50),
SegundoNombre varchar(50),
ApellidoUsuario varchar(50),
SegundoApellido varchar(50),
ApellidoCasada varchar(50),
Email varchar(100),
Pass varbinary (128)                -- Este campo almacenará datos encriptados
)
go

-- Adicionar la llave primaria
alter table Perfiles add constraint pk_Perfiles primary key (CodigoUsuario)
go

------------------------------------------------------------------------------------

------------------------------------------------------------------------------------

--Creación del Login de acceso al servidor
--Se tendrá acceso a conectarse al servidor de base de datos. mas no a ninguna base de datos
-- La base de datos default será EUGENIO, sin embargo, aún no se tiene permiso de accederla
-- El permiso se dará despues de crearla (creando un usuario)
use master
go
if exists( select 1 from sys.syslogins l where l.name = 'UsrProcesa' )
begin
	drop login UsrProcesa
end
go

CREATE LOGIN [UsrProcesa] 
WITH PASSWORD=N'UsrProcesa', 
DEFAULT_DATABASE=Ejemplo_SIN_Encripcion ,
CHECK_POLICY = OFF; 
GO

-- Se crea el usuario dentro de la base de datos que acabamos de crear
-- Para ello nos conectamos no metemos dentro de dicha base de datos
use [Ejemplo_SIN_Encripcion] 
go


-- Creación del usuario que tendrá permiso de acceder a la base de datos
-- El usuario [UsrProcesa] estará enlazado al login del mismo nombre [UsrProcesa]
CREATE USER [UsrProcesa] FOR LOGIN [UsrProcesa] WITH DEFAULT_SCHEMA=[dbo]
GO

-- Este usuario será dueño (dbo) de la base de datos EUGENIO
ALTER ROLE [db_owner] ADD MEMBER [UsrProcesa]
GO

---- Los Id's deben empezar en 1000
--alter table Perfiles 
--	add constraint ck_mayor999 check (CodigoUsuario > 999)
--go

--use master
--go
