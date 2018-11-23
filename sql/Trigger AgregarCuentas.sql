CREATE trigger [AgregarCuentas]
on [dbo].[Usuarios]
for insert 
as
begin                                                

--Creo variable para guardar el mail
declare @email nvarchar(100)
--Seteo valor del mail ingresado
set @email = (select email from inserted)

--Inserto asociacon con cuentas base
insert CuentasPorUsuarios(idUsuario,idCuenta) values (@email,1)
insert CuentasPorUsuarios(idUsuario,idCuenta) values (@email,2)
insert CuentasPorUsuarios(idUsuario,idCuenta) values (@email,3)
insert CuentasPorUsuarios(idUsuario,idCuenta) values (@email,4)
--Inserto movimiento inicial en 0
insert Movimientos (idCuenta, idUsuario, monto, fecha) values(1, @email, 0, SYSDATETIME())
insert Movimientos (idCuenta, idUsuario, monto, fecha) values(2, @email, 0, SYSDATETIME())
insert Movimientos (idCuenta, idUsuario, monto, fecha) values(3, @email, 0, SYSDATETIME())
insert Movimientos (idCuenta, idUsuario, monto, fecha) values(4, @email, 0, SYSDATETIME())

end