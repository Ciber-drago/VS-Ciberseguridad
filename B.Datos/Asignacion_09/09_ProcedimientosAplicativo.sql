USE Ejemplo_SIN_Encripcion
GO

-- Crear procedimiento de Inserción de datos de la Solicitud de Servicios
CREATE procedure [dbo].[prActualizarSolicitud]
( 
@IdSolicitud integer,
@IdCliente integer,
@NumeroSolicitud varchar(20),	 
@Fecha datetime,
@Observacion varchar(300)
)
--WITH ENCRYPTION
as
begin

	update s
	set
	s.IdCliente = @IdCliente,
	s.NumeroSolicitud = @NumeroSolicitud, 
	s.Fecha = @Fecha, 
	s.Observacion = @Observacion
	from Solicitudes s
	where
	s.IdSolicitud =  @IdSolicitud

	
end
GO


-- Crear procedimiento de actualización de datos de la Solicitud de Servicios
CREATE procedure [dbo].[prActualizarSolicitudDetalle]
( 
@IdSolicitudDetalle int,
@IdSolicitud int,			
@IdServicio int,
@IdDepartamento int,	
@Precio decimal(19,2),
@Cantidad int,
@OtrosImportes decimal(19,2),
@ITMBS decimal(19,2)
)
--WITH ENCRYPTION
as
begin

	update sd
	set
	sd.IdSolicitud = @IdSolicitud,
	sd.IdServicio = @IdServicio,
	sd.IdDepartamento = @IdDepartamento,
	sd.Precio = @Precio,
	sd.Cantidad = @Cantidad,
	sd.OtrosImportes = @OtrosImportes,
	sd.ITMBS = @ITMBS
	from SolicitudesDetalle sd
	where
	sd.IdSolicitudDetalle = @IdSolicitudDetalle

	
end
GO

--Crear el procedimiento para consultar datos de usuario, menos pass 
CREATE procedure [dbo].[prConsultaAvanzadaSolicitud]
(@NumeroSolicitud varchar(20), @IdCliente integer, @FechaIni datetime, @FechaFin datetime) 
AS
BEGIN
	set dateformat dmy
/*
La llave: @CodigoUsuario, será el medio para consultar los 
datos del usuario.
*/
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if len(@NumeroSolicitud) > 0 
	begin
		SELECT 
		s.IdSolicitud, s.IdCliente, s.NumeroSolicitud, s.Fecha, s.Observacion, c.NombreCliente
		FROM Solicitudes s inner join Clientes c
						   on s.IdCliente = c.IdCliente
		where
		s.NumeroSolicitud = @NumeroSolicitud 
	end 
	else
	begin
		-- La fecha por default suele traer la hora.
	    -- Por conveniencia de este caso se extrae día, mes y año y se convierte a día mes y año sin la hora
		set @FechaIni = convert( datetime, convert(varchar(10), @FechaIni,103) ,103)
		set @FechaFin = convert( datetime, convert(varchar(10), @FechaFin,103) ,103)

		SELECT 
		s.IdSolicitud, s.IdCliente, s.NumeroSolicitud, s.Fecha, s.Observacion, c.NombreCliente
		FROM Solicitudes s inner join Clientes c
						   on s.IdCliente = c.IdCliente
		WHERE 
		s.Fecha between @FechaIni and @FechaFin and 
		@IdCliente = 0

		UNION

		SELECT 
		s.IdSolicitud, s.IdCliente, s.NumeroSolicitud, s.Fecha, s.Observacion, c.NombreCliente
		FROM Solicitudes s inner join Clientes c
						   on s.IdCliente = c.IdCliente
		WHERE 
		s.Fecha between @FechaIni and @FechaFin and
		s.IdCliente = @IdCliente

	end
END

/*
declare  @NumeroSolicitud varchar(20), @IdCliente integer, @FechaIni datetime, @FechaFin datetime

		set @NumeroSolicitud = null
		set @IdCliente = 1001
		set @FechaIni = convert( datetime, convert(varchar(10), '10/09/2019',103) ,103)
		set @FechaFin = convert( datetime, convert(varchar(10), '10/09/2019',103) ,103)
execute [prConsultaAvanzadaSolicitud] @NumeroSolicitud = @NumeroSolicitud, @IdCliente = @IdCliente, @FechaIni = @FechaIni, @FechaFin = @FechaFin 

declare  @NumeroSolicitud varchar(20), @IdCliente integer, @FechaIni datetime, @FechaFin datetime

		set @NumeroSolicitud = null
		set @IdCliente = 1001
		set @FechaIni = null
		set @FechaFin = null
execute [prConsultaAvanzadaSolicitud] @NumeroSolicitud = @NumeroSolicitud, @IdCliente = @IdCliente, @FechaIni = @FechaIni, @FechaFin = @FechaFin 

*/

GO

--Crear el procedimiento para consultar datos de usuario, menos pass 
CREATE procedure [dbo].[prConsultarCliente]
(@IdCliente integer)
AS
BEGIN
/*
La llave: @CodigoUsuario, será el medio para consultar los 
datos del usuario.
*/
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if @IdCliente > 0 
	begin
		SELECT 
		c.IdCliente, c.NombreCliente, c.Cedula, c.Dirrecion, c.Telefono, c.Celular, c.Correo
		FROM Clientes c
		where
		c.IdCliente = @IdCliente 
		order by IdCliente
	end
	else
	begin
		SELECT 
		c.IdCliente, c.NombreCliente, c.Cedula, c.Dirrecion, c.Telefono, c.Celular, c.Correo
		FROM Clientes c
		order by IdCliente
	end
END

/*
execute [[prConsultarCliente]] 1
*/

GO

--Crear el procedimiento para consultar datos de usuario, menos pass 
CREATE procedure [dbo].[prConsultarDepartamento]
(@IdDepartamento integer, @Opcion integer = 0)
AS
BEGIN
/*
La llave: @CodigoUsuario, será el medio para consultar los 
datos del usuario.
@Opcion: 0, será el default. Solo muestra los departamentos con servicios asociados
@Opcion: 1, Mostrará todos los departamentos
*/
	SET NOCOUNT ON;
	if @Opcion is null
	begin
		set @Opcion = 0
	end
    -- Insert statements for procedure here
	if @Opcion = 0
	begin
		select 0 IdDepartamento, '(NINGUNO)' NombreDepartamento, 0 IdDepartamentoSuperior
		UNION 
		SELECT distinct 
		d.IdDepartamento, d.NombreDepartamento, d.IdDepartamentoSuperior
		FROM Departamentos d inner join DepartamentosServicios ds
				                on d.IdDepartamento = ds.IdDepartamento
		order by IdDepartamento
		return
	end

	if @Opcion = 1
	begin
		if @IdDepartamento > 0 
		begin
			SELECT 
			d.IdDepartamento, d.NombreDepartamento, d.IdDepartamentoSuperior
			FROM Departamentos d
			where
			d.IdDepartamento = @IdDepartamento 
			order by IdDepartamento
		end
		else
		begin
			SELECT 
			d.IdDepartamento, d.NombreDepartamento, d.IdDepartamentoSuperior
			FROM Departamentos d
			order by IdDepartamento
		end
	end
END

/*
execute [prConsultarDepartamento] 0
*/

GO

--Crear el procedimiento para consultar datos de usuario, menos pass 
CREATE procedure [dbo].[prConsultarProductosServicios]
(@IdServicio int, @IdDepartamento int = 0)
AS
BEGIN
/*
La llave: @CodigoUsuario, será el medio para consultar los 
datos del usuario.
*/
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if @IdServicio > 0 
	begin
		SELECT 
			s.IdServicio, NombreServicio = s.NombreServicio + '('+ convert(varchar(20), s.Precio) + ')', s.Precio
		FROM Servicios s
		where
		s.IdServicio = @IdServicio 
		order by s.IdServicio
	end
	else
	begin
		if @IdDepartamento = 0
		begin
			SELECT 
			s.IdServicio, NombreServicio = s.NombreServicio + '('+ convert(varchar(20), s.Precio) + ')', s.Precio
			FROM Servicios s
			order by s.IdServicio
		end
		else
		begin
			SELECT 
			s.IdServicio, NombreServicio = s.NombreServicio + '('+ convert(varchar(20), s.Precio) + ')', s.Precio
			FROM Servicios s inner join DepartamentosServicios ds
							 on s.IdServicio = ds.IdServicio
			where 
			ds.IdDepartamento = @IdDepartamento
			order by s.IdServicio
		end
	end
END

/*
execute [prConsultarProductosServicios] 0
*/

GO

--Crear el procedimiento para consultar datos de usuario, menos pass 
CREATE procedure [dbo].[prConsultarSolicitud]
(@IdSolicitud integer, @NumeroSolicitud varchar(20))
AS
BEGIN
/*
La llave: @CodigoUsuario, será el medio para consultar los 
datos del usuario.
*/
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if @IdSolicitud > 0 
	begin
		SELECT 
		s.IdSolicitud, s.IdCliente, s.NumeroSolicitud, s.Fecha, s.Observacion
		FROM Solicitudes s inner join Clientes c
						   on s.IdCliente = c.IdCliente
		where
		s.IdSolicitud = @IdSolicitud 
	end
	else if len(@NumeroSolicitud) > 0 
	begin
		SELECT 
		s.IdSolicitud, s.IdCliente, s.NumeroSolicitud, s.Fecha, s.Observacion
		FROM Solicitudes s inner join Clientes c
						   on s.IdCliente = c.IdCliente
		where
		s.NumeroSolicitud = @NumeroSolicitud 
	end 
	else
	begin
		SELECT 
		s.IdSolicitud, s.IdCliente, s.NumeroSolicitud, s.Fecha, s.Observacion
		FROM Solicitudes s inner join Clientes c
						   on s.IdCliente = c.IdCliente
	end
END

/*
execute [prConsultarSolicitud] 1, ''
execute [prConsultarSolicitud] 0, 'SBS19-1'
execute [prConsultarSolicitud] 0, ''


*/

GO

--Crear el procedimiento para consultar datos de usuario, menos pass
CREATE procedure [dbo].[prConsultarSolicitudDetalle]
(@IdSolicitudDetalle integer, @IdSolicitud integer)
AS
BEGIN
/*
La llave: @CodigoUsuario, será el medio para consultar los 
datos del usuario.
*/
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if @IdSolicitud > 0 
	begin
		SELECT 
		sd.IdSolicitudDetalle, sd.IdSolicitud, sd.IdServicio, sd.IdDepartamento, ps.NombreServicio, d.NombreDepartamento, 
		sd.Precio, sd.Cantidad, sd.OtrosImportes, sd.ITMBS, Total = ( (sd.Cantidad * sd.Precio) + (sd.ITMBS + sd.OtrosImportes)), s.NumeroSolicitud
		FROM [dbo].SolicitudesDetalle sd inner join Solicitudes s
		                                on sd.IdSolicitud = s.IdSolicitud
										inner join Departamentos d
										on sd.IdDepartamento = d.IdDepartamento
										inner join Servicios ps
										on sd.IdServicio = ps.IdServicio
		where
		sd.IdSolicitud = @IdSolicitud 
	end
	else if @IdSolicitudDetalle > 0 
	begin
		SELECT 
		sd.IdSolicitudDetalle, sd.IdSolicitud, sd.IdServicio, sd.IdDepartamento, ps.NombreServicio, d.NombreDepartamento, 
		sd.Precio, sd.Cantidad, sd.OtrosImportes, sd.ITMBS, Total = ( (sd.Cantidad * sd.Precio) + (sd.ITMBS + sd.OtrosImportes)), s.NumeroSolicitud
		FROM [dbo].SolicitudesDetalle sd inner join Solicitudes s
		                                on sd.IdSolicitud = s.IdSolicitud
										inner join Departamentos d
										on sd.IdDepartamento = d.IdDepartamento
										inner join Servicios ps
										on sd.IdServicio = ps.IdServicio
		where
		sd.IdSolicitudDetalle = @IdSolicitudDetalle 
	end 
	else
	begin
		-- Se hizo temporalmente para hacer unas pruebas
		SELECT 
		sd.IdSolicitudDetalle, sd.IdSolicitud, sd.IdServicio, sd.IdDepartamento, ps.NombreServicio, d.NombreDepartamento, 
		sd.Precio, sd.Cantidad, sd.OtrosImportes, sd.ITMBS, Total = ( (sd.Cantidad * sd.Precio) + (sd.ITMBS + sd.OtrosImportes)), s.NumeroSolicitud
		FROM [dbo].SolicitudesDetalle sd inner join Solicitudes s
		                                on sd.IdSolicitud = s.IdSolicitud
										inner join Departamentos d
										on sd.IdDepartamento = d.IdDepartamento
										inner join Servicios ps
										on sd.IdServicio = ps.IdServicio
	end
END

/*
execute [prConsultarSolicitudDetalle] 0
*/

GO

-- Crea el procedimiento que elimina datos de usuario
CREATE procedure [dbo].[prEliminarSolicitudesDetalle]
(@IdSolicitudDetalle integer)
AS
BEGIN
/*
La llave: @CodigoUsuario, será el medio para eliminar los 
datos del usuario.
*/
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete sd
	FROM [dbo].SolicitudesDetalle sd
	where
	sd.IdSolicitudDetalle = @IdSolicitudDetalle
END
GO

-- Crear procedimiento de Inserción de datos de la Solicitud de Servicios
CREATE procedure [dbo].[prInsertarSolicitud]
( 
@IdSolicitud integer output,			-- Se generará dentro del procedimiento
@IdCliente integer,
@NumeroSolicitud varchar(20) output,	-- Se generará dentro del procedimiento
@Fecha datetime,
@Observacion varchar(300)
)
--WITH ENCRYPTION
as
begin
	declare @Secuencial integer 
	-- Generar el @NumeroSolicitud basado en el formato: SBSNN-secuencial
	-- SBS: Solicitud de bienes o servicios
	-- NN: dos dígitos del año
	-- Secuencial: de 1 a N
	-- Insertar los datos en la tabla con la contraseña encriptada con la llave simetrica
	select @Secuencial = convert( integer, substring( NumeroSolicitud, 7, 13) ) + 1
	from Solicitudes

	set @NumeroSolicitud = 'SBS' + right( convert(varchar(4), year(@Fecha)), 2 ) + '-' + convert(varchar(17), @Secuencial)

	insert into Solicitudes
	(
	--IdSolicitud, Este dato no se inserta ya que es un Identity, se genera automáticamente y se devuelve al programa
	IdCliente, NumeroSolicitud, Fecha, Observacion
	)
	values
	(
	@IdCliente, @NumeroSolicitud, @Fecha, @Observacion
	)
	
	set @IdSolicitud = SCOPE_IDENTITY() -- obtiene el nuevo valor generado para @IdSolicitud
	
end
GO

-- Crear procedimiento de Inserción de datos de la Solicitud de Servicios
CREATE procedure [dbo].[prInsertarSolicitudDetalle]
( 
@IdSolicitudDetalle int output,			-- Se generará dentro del procedimiento
@IdSolicitud int,			
@IdServicio int,
@IdDepartamento int,	
@Precio decimal(19,2),
@Cantidad int,
@OtrosImportes decimal(19,2),
@ITMBS decimal(19,2)
)
--WITH ENCRYPTION
as
begin

	insert into SolicitudesDetalle
	(
	--IdSolicitudDetalle, Este dato no se inserta ya que es un Identity, se genera automáticamente y se devuelve al programa
	IdSolicitud, IdServicio, IdDepartamento, Precio, Cantidad, OtrosImportes, ITMBS
	)
	values
	(
	@IdSolicitud, @IdServicio, @IdDepartamento, @Precio, @Cantidad, @OtrosImportes, @ITMBS
	)
	
	set @IdSolicitudDetalle = SCOPE_IDENTITY() -- obtiene el nuevo valor generado para @IdSolicitudDetalle
	
end
GO

