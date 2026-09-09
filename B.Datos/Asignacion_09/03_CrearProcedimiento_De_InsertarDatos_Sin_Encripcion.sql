use [Ejemplo_SIN_Encripcion] 
go

-- Crear procedimiento de Inserción de datos de usuarios
create procedure [dbo].[prInsertarUsuario]
( 
@CodigoUsuario integer output, -- Es identity:autoincremental. Se genera automáticamente. debe devolverse al aplicativo
@NombreUsuario varchar(50), @SegundoNombre varchar(50),
@ApellidoUsuario varchar(50), @SegundoApellido varchar(50), @ApellidoCasada varchar(50),
@Email varchar(100), @Pass varchar(500)
)
--WITH ENCRYPTION
as
begin
	-- Insertar los datos en la tabla con la contraseña encriptada con la llave simetrica
	insert into Perfiles
	(
	NombreUsuario , SegundoNombre , ApellidoUsuario , SegundoApellido ,
	ApellidoCasada , Email , Pass 
	)
	values
	(
	@NombreUsuario, @SegundoNombre, @ApellidoUsuario, @SegundoApellido, 
	@ApellidoCasada, @Email, 

	convert(varbinary (128), @Pass )

	)
	
	set @CodigoUsuario = SCOPE_IDENTITY() -- obtiene el nuevo valor generado para @CodigoUsuario
	
end
go


/*
Ejemplo de insertar un dato de usario 
Se insertará el primer usuario manualmnente

declare @CodigoU integer -- recupera el nuevo valor de @CodigoUsuario

execute prInsertarUsuario
@CodigoUsuario = @CodigoU output, 
@NombreUsuario = 'Usuario', @SegundoNombre = '',
@ApellidoUsuario = 'Mil: 1000', @SegundoApellido = '', @ApellidoCasada = '',
@Email = 'el_mil@prueba.com', @Pass = '123456'

select @CodigoU CodigoU 
go

-- Leer el dato de la contraseña convertida en texto
SELECT [CodigoUsuario], [NombreUsuario], [SegundoNombre]
,[ApellidoUsuario], [SegundoApellido], [ApellidoCasada]
,[Email], 
Pass PassNormal, 
convert( varchar(500), [Pass] ) Pass 

FROM [Ejemplo_SIN_Encripcion].[dbo].[Perfiles]

GO





*/
