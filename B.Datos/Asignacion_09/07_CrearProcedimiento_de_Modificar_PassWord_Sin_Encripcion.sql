use [Ejemplo_SIN_Encripcion]
go

-- Crea el procedimiento que modifica datos de usuario
CREATE PROCEDURE prModificarPasswordUsuarios
(
@CodigoUsuario integer, @PassAnterior varchar(500), @PassNuevo varchar(500), @resetear tinyint
)
AS
BEGIN
/*
La llave: @CodigoUsuario, será el medio para actualizar el resto de los 
datos del usuario.
No nse cambiará el código de usuario
*/
	SET NOCOUNT ON;

	declare @lsMsgErr varchar(200)

	--Hacer la comparación para ver si el usuario y contraseña son válidos
	if @resetear = 1
	begin
		UPDATE p
		SET p.Pass = convert( varbinary(128), @PassNuevo) 
		FROM [dbo].[Perfiles] p
		where
		p.CodigoUsuario = @CodigoUsuario
		 
		return
	end
	else
	if exists ( 
		select 1
		from Perfiles
		where CodigoUsuario = @CodigoUsuario and
		convert(varchar(500) , Pass ) = @PassAnterior
	) 
	BEGIN
		UPDATE p
		SET p.Pass = convert( varbinary(128), @PassNuevo) 
		FROM [dbo].[Perfiles] p
		where
		p.CodigoUsuario = @CodigoUsuario

		return
	END
	ELSE
	begin
		set @lsMsgErr = 'Contraseña anterior no válida'
		return
	end

END
GO
