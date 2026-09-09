use [Ejemplo_SIN_Encripcion]
go

-- Crear el procedimiento para validar datos del usuario
Create procedure prValidarUsuario
( @CodigoUsuario integer, @Pass varchar (500) )
--WITH ENCRYPTION
as
begin
	--Hacer la comparación para ver si el usuario y contraseña son válidos
	if exists ( 
		select 1
		from Perfiles
		where CodigoUsuario = @CodigoUsuario and
		convert(varchar(500) , Pass ) = @Pass
	)
	BEGIN
		select NombreUsuario, ApellidoUsuario, Email from dbo.Perfiles
		where
		CodigoUsuario = @CodigoUsuario
		return
	END
	ELSE
	BEGIN
		select '' NombreUsuario, '' ApellidoUsuario, '' Email 
		from dbo.Perfiles where 1 <> 1
		return
	END


end
GO

/*
Ejemplo que valida si el usurio es válido
*/

execute prValidarUsuario 1000, '123456'
go

