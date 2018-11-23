CREATE  PROCEDURE buscar_movimiento
@fechaInicial as date,
@fechaFin as date,	
@email as nvarchar(100),
@cuenta as bigint
as

select 
	nombre, 
	SUM(monto) AS MontoTotal	

from 
	Movimientos m
	
inner join Usuarios u
on m.idUsuario=u.email

inner join Cuentas c
on m.idCuenta =c.ID

where 
	fecha between @fechaInicial and  @fechaFin 
	and c.ID=@cuenta 
	and u.email=@email

GROUP BY nombre

