SELECT * FROM Cuentas
SELECT * FROM Usuarios
SELECT * FROM CuentasPorUsuarios
SELECT * FROM TipoCuentas

 
 SELECT  monto, idCuenta
FROM Movimientos
INNER JOIN Cuentas ON Movimientos.idCuenta = Cuentas.ID
where Cuentas.ID='1'

