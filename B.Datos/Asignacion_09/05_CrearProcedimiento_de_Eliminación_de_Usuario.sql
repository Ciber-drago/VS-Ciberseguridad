use [Ejemplo_SIN_Encripcion]
go

-- Crea el procedimiento que elimina datos de usuario
create PROCEDURE prEliminarUsuarios
(@CodigoUsuario integer)
AS
BEGIN
/*
La llave: @CodigoUsuario, será el medio para eliminar los 
datos del usuario.
*/
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete p
	FROM [dbo].[Perfiles] p
	where
	p.CodigoUsuario = @CodigoUsuario
END
GO
