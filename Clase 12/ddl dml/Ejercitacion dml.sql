-- Ejercicios DML
use negocio;
-- 4- Actualizar el nombre apellido y cuit del cliente 3 a Pablo 
-- Fuentes 20-21053119-0.
update	clientes
set		nombre = 'Pablo', apellido = 'Fuentes', dni = 21053119
where	idcliente = 3;

select * from clientes;

-- 6-  Eliminar los clientes con CUIT Terminan en 0.
delete from	clientes where dni like '%0';

select * from clientes;

-- 7- Aumentar un 20% los precios de los artículos con 
-- precio menor o igual a 100.
update	productos
set		precio = precio * 1.2
where	precio <= 100;

select * from productos;

-- 8- Aumentar un 15% los precios de los artículos con precio 
-- mayor a 50.
update	productos
set		precio = precio * 1.15
where	precio > 50;

select * from productos;

-- 9- Bajar un 5% los precios de los artículos con precio mayor 
-- a 200.
update	productos
set		precio = precio * 0.95
where	precio > 200;

select * from productos;

-- 10- Eliminar los artículos con stock igual a 10.
delete from productos where stock = 10;

select * from productos;


