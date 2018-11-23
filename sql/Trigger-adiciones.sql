USE [ProyectoORT]
GO
/****** Object:  Trigger [dbo].[AgregarCuentas]    Script Date: 19/11/2018 16:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER trigger AgregarCuentas
on [dbo].[AspNetUsers]
for insert 
as
begin                                                
--Creo variable para guardar el mail
declare @id nvarchar(128)
--Seteo valor del mail ingresado
set @id = (select Id from inserted)
declare @cuentaIngreso as bigint
set @cuentaIngreso =(SELECT id FROM Cuentas WHERE nombre ='sueldo')
declare @cuentaEgreso as bigint
--Inserto asociacon con cuentas base
--Trabajo con cuenta Comida
IF EXISTS (SELECT * FROM Cuentas WHERE nombre = 'comida' ) 
	begin
		set @cuentaEgreso =(SELECT ID FROM Cuentas WHERE nombre = 'comida' )
		insert CuentasPorUsuario(idUsuario,idCuenta,limite,monto) values (@id,@cuentaEgreso,'200','0')
		insert Movimientos (idUsuario,idCuentaEgreso,idcuentaIngreso,monto,fecha) values(@id,@cuentaIngreso,null, 0,SYSDATETIME())

	end
ELSE
	begin
		set @cuentaEgreso =(SELECT ID FROM Cuentas WHERE nombre = 'comida' )
		IF  not exists  ( select * from TiposCuentas where nombre='egreso')
			begin
				insert into TiposCuentas(nombre) select 'egreso' 
			end
		insert into Cuentas(idTipoCuenta,nombre) select (SELECT id FROM TiposCuentas where nombre='egreso'),'comida'
		insert CuentasPorUsuario(idUsuario,idCuenta,limite,monto) values (@id,@cuentaEgreso,'200','0')
		insert Movimientos (idUsuario,idCuentaEgreso,idcuentaIngreso,monto,fecha) values(@id,@cuentaIngreso,@cuentaEgreso, 0,SYSDATETIME())
	end
 

--Cuenta Sueldo
IF EXISTS (SELECT * FROM Cuentas WHERE nombre = 'sueldo' ) 
	begin
		set @cuentaEgreso=(SELECT ID FROM Cuentas WHERE nombre= 'sueldo' )
		insert CuentasPorUsuario(idUsuario,idCuenta,limite,monto) values (@id,@cuentaEgreso,'200','0')
	end
ELSE
	begin
		set @cuentaEgreso=(SELECT ID FROM Cuentas WHERE nombre= 'sueldo' )
		IF not exists (select * from TiposCuentas where nombre='ingreso')
			begin
				insert into TiposCuentas(nombre) select 'ingreso' 
			end
		insert into Cuentas(idTipoCuenta,nombre) select (SELECT id FROM TiposCuentas where nombre='ingreso'),'sueldo'
		insert CuentasPorUsuario(idUsuario,idCuenta,limite,monto) values (@id,@cuentaEgreso,'200','0')
		insert Movimientos (idUsuario,idCuentaEgreso,idcuentaIngreso,monto,fecha) values(@id,@cuentaIngreso,@cuentaEgreso,0 ,SYSDATETIME())
   
	end


IF EXISTS (SELECT * FROM Cuentas WHERE nombre = 'impuestos' ) 
	begin
		set @cuentaEgreso=(SELECT ID FROM Cuentas WHERE nombre= 'impuestos' )
		insert CuentasPorUsuario(idUsuario,idCuenta,limite,monto) values (@id,@cuentaEgreso,'200','0')  
	end
ELSE
	begin
		set @cuentaEgreso=(SELECT ID FROM Cuentas WHERE nombre= 'impuestos' )
		insert into Cuentas(idTipoCuenta,nombre) select (SELECT id FROM TiposCuentas where nombre='egreso'),'impuestos'
		insert CuentasPorUsuario(idUsuario,idCuenta,limite,monto) values (@id,@cuentaEgreso,'200','0')
		insert Movimientos (idUsuario,idCuentaEgreso,idcuentaIngreso,monto,fecha) values(@id,@cuentaIngreso,@cuentaEgreso, 0,SYSDATETIME())
   	
	end
 
IF EXISTS (SELECT * FROM Cuentas WHERE nombre = 'ahorros' ) 
	begin
		set @cuentaEgreso=(SELECT ID FROM Cuentas WHERE nombre= 'ahorros' )
		insert CuentasPorUsuario(idUsuario,idCuenta,limite,monto) values (@id,@cuentaEgreso,'200','0')
	end
ELSE
	begin
		set @cuentaEgreso=(SELECT ID FROM Cuentas WHERE nombre= 'ahorros' )
		IF not exists (select * from TiposCuentas where nombre='ganancia')
			begin
				insert into TiposCuentas(nombre) select 'ganancia' 
			end
		insert into Cuentas(idTipoCuenta,nombre) select (SELECT id FROM TiposCuentas where nombre='ganancia'),'ahorros'
		insert CuentasPorUsuario(idUsuario,idCuenta,limite,monto) values (@id,@cuentaEgreso,'200','0')
		insert Movimientos (idUsuario,idCuentaEgreso,idcuentaIngreso,monto,fecha) values(@id,@cuentaIngreso,@cuentaEgreso, 0,SYSDATETIME())
   		end

--Inserto movimiento inicial en 0
end