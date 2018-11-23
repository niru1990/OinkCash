USE [ProyectoORT]
GO

/****** Object:  StoredProcedure [dbo].[buscar_movimiento]    Script Date: 11/19/2018 9:43:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[buscar_movimiento]
@fechaInicial as datetime,
@fechaFin as datetime,	
@email as nvarchar(128),
@cuenta as bigint



as
declare @ingresos as decimal(18,2)
declare @egresos as decimal(18,2)

set @ingresos = (select SUM(monto) AS MontoTotal from Movimientos m inner join dbo.AspNetUsers u on m.idUsuario=u.Id inner join Cuentas c on m.idCuentaIngreso =c.id where fecha between @fechaInicial and  @fechaFin and c.id=@cuenta and u.Id=@email )

if @ingresos is null
begin
set @ingresos = 0
end

set @egresos =( select	SUM(monto) AS MontoTotal from Movimientos m inner join dbo.AspNetUsers u on m.idUsuario=u.Id inner join Cuentas c on m.idCuentaEgreso =c.id where fecha between @fechaInicial and  @fechaFin and c.id=@cuenta and u.Id=@email)
	
if @egresos is null
begin 
	set @egresos = 0
end

--select nombre,	@ingresos as ingreso, @egresos AS egreso


select nombre,	(@ingresos - @egresos) AS [Monto total]

from 
	CuentasPorUsuario cu
	
inner join dbo.AspNetUsers u
on cu.idUsuario=u.Id

inner join Cuentas c
on cu.idCuenta =c.id

inner join Movimientos m
on cu.idUsuario= m.idUsuario

where 
	fecha between @fechaInicial and  @fechaFin 
	and c.id=@cuenta 
	and u.Id=@email

	group by nombre
	

GO


