use [Ejemplo_SIN_Encripcion]
go

-- Crea el procedimiento que modifica datos de usuario
CREATE PROCEDURE prModificarUsuarios
(
@CodigoUsuario integer, @NombreUsuario varchar(50),
@SegundoNombre varchar(50), @ApellidoUsuario varchar(50),
@SegundoApellido varchar(50), @ApellidoCasada varchar(50),
@Email varchar(100)
)
AS
BEGIN
/*
La llave: @CodigoUsuario, será el medio para actualizar el resto de los 
datos del usuario.
No nse cambiará el código de usuario
*/

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE p
	SET 
	 [NombreUsuario]   = @NombreUsuario
	,[SegundoNombre]   = @SegundoNombre
	,[ApellidoUsuario] = @ApellidoUsuario
	,[SegundoApellido] = @SegundoApellido
	,[ApellidoCasada] = @ApellidoCasada
	,[Email] = @Email
	FROM [dbo].[Perfiles] p
	where
	p.CodigoUsuario = @CodigoUsuario
END
GO
