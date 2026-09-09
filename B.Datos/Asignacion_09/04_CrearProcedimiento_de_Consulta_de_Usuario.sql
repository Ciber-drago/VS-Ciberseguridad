use [Ejemplo_SIN_Encripcion]
go

--Crear el procedimiento para consultar datos de usuario, menos pass
create PROCEDURE prConsultarUsuarios
(@CodigoUsuario integer)
AS
BEGIN
/*
La llave: @CodigoUsuario, será el medio para consultar los 
datos del usuario.
*/
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if @CodigoUsuario = 0 
	begin
    -- Si se manda el valor de 0 como código de usuario, 
    -- se devolverán todos los datos (Registros) de la tabla
		SELECT 
		p.[CodigoUsuario], p.[NombreUsuario], p.[SegundoNombre], 
		p.[ApellidoUsuario]	,p.[SegundoApellido], p.[ApellidoCasada], p.[Email]
		FROM [dbo].[Perfiles] p
	end 
	else
	begin
		SELECT 
		p.[CodigoUsuario], p.[NombreUsuario], p.[SegundoNombre], 
		p.[ApellidoUsuario]	,p.[SegundoApellido], p.[ApellidoCasada], p.[Email]
		FROM [dbo].[Perfiles] p
		where
		p.CodigoUsuario = @CodigoUsuario 
	end
END
GO

