/*
Top 10 de gastos mensuales

Tablas: 
	* Movimientos
	* Cuentas

Parametros: 
	* Fecha de principio de Mes
	* Fecha final
	* email del usuario
*/

USE [OinkCash]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE reporteMayoresGastosMensuales
@fechaInicial as datetime,
@fechaFin as datetime,
@email as nvarchar(100)
as

select 
	top 10
	c.nombre, sum(monto) as monto
from
	Movimientos as m
inner join Cuentas as c
on idCuenta = m.idCuenta
where
	idUsuario = @email
	and fecha between @fechaInicial and @fechaFin
group by c.nombre
order by monto 
