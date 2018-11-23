--INSERT INTO Usuarios VALUES ('jorge@gmail.com','jorge','primera')
--ALTER TABLE Cuentas 
--ADD ID bigint IDENTITY(1,1) PRIMARY KEY;
--ALTER TABLE Movimientos 
--ADD ID bigint IDENTITY(1,1) PRIMARY KEY;
--INSERT INTO Cuentas(nombre,idTipoCuenta) VALUES ('INGRESO','1')
--INSERT INTO Cuentas(nombre,idTipoCuenta) VALUES ('egreso','2')

--INSERT INTO Cuentas(nombre,idTipoCuenta) VALUES ('Ganancia','3')
--INSERT INTO Cuentas(nombre,idTipoCuenta) VALUES ('ahorro','4')
--insert into CuentasPorUsuario (id_Cuenta,id_Usuario) values ('1','jorge@gmail.com')
--insert into CuentasPorUsuario (id_Cuenta,id_Usuario) values ('2','jorge@gmail.com')
--insert into CuentasPorUsuario (id_Cuenta,id_Usuario) values ('3','jorge@gmail.com')
--insert into CuentasPorUsuario (id_Cuenta,id_Usuario) values ('4','jorge@gmail.com')


--ALTER TABLE  TipoCuentas
--ADD ID int IDENTITY(1,1) PRIMARY KEY;

--insert into TipoCuentas (nombre) values ('Ganancia')
--insert into TipoCuentas (nombre) values ('Ahorro')
-- UPDATE Cuentas
--SET limite = 200 
--WHERE limite is null

--insert into Movimientos (idCuenta,idUsuario,monto, fecha)values(1,'jorge@gmail.com',0,'1998/02/25')
--insert into Movimientos (idCuenta,idUsuario,monto, fecha) values(2,'jorge@gmail.com',2000,'2012/02/25')
--insert into Movimientos (idCuenta,idUsuario,monto, fecha) values(3,'jorge@gmail.com',2000,'1998/02/25')
--insert into Movimientos (idCuenta,idUsuario,monto, fecha) values(4,'jorge@gmail.com',2000,'2016/02/25')
--los insert parecen empezar en id 5(probablemente se confunde con los de cuenta)

--EXEC dbo.buscar_movimiento '2011/02/25','2018/11/14','jorge@gmail.com','3'
--la cuenta 1 fuera de rango, la cuenta 4 devuelve la suma, la cuenta 3 solo las q estan en rango