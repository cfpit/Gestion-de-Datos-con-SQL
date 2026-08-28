-- selecciono la base negocio por defecto
use negocio;

-- muestro las tablas
show tables;

-- listar todos los campos de la tabla clientes
-- * significa todos los campos
select * from clientes;

-- listar nombre, apellido y telefono de los clientes
select  nombre, apellido, telefono from clientes;

/*
	Operadores Aritmenticos: + - * /
    Operadores Relacionales: >  <  >=  <=  =  !=  <>
    Operadores Logicos: and, or, not
    Operador de rango: between
    Operador de lista: in
    Operador de similitud: like
    Operador de nulidad: is null - is not null
*/

-- La clausula WHERE filtra registros de la tabla
-- condicionando campos

-- TPN1
-- TP N1 Consultas Simples

-- 1 - Basándose en la tabla productos obtener los siguientes listados.
-- a- artículos con precio mayor a 100
select 	* 
from 	productos 
where 	precio > 100;

-- b- artículos con precio entre 100 y 200 (usar < y >)
select 	* 
from 	productos 
where 	precio > 100 and precio < 200;

-- c- artículos con precio entre 100 y 200 (usar BETWEEN)
-- El operador between incluye extremos
select 	* 
from 	productos 
-- where 	precio between 100 and 200;
where 	precio not between 100 and 200;

-- d- artículos con precio >= 200 y stock mayor a 15
select 	* 
from 	productos 
where 	precio >= 200 and stock > 15;

-- e- artículos con precio (120,200,300) no usar IN
select 	* 
from 	productos 
where	precio = 120 or precio = 200 or precio = 300;

-- f- artículos con precio (120,200,300) usar el IN
select 	* 
from 	productos 
where	precio in (120,200,300);

-- g- artículos que su precio no sea (120,200,300)
select 	* 
from 	productos 
where	precio not in (120,200,300);

-- 2- Listar los artículos ordenados por precio de mayor a menor, 
-- y si hubiera precio iguales deben quedar ordenados por nombre.
select 		* 
from 		productos 
-- order by	precio; -- orden ascendente x defecto
-- order by	precio asc;
order by	precio desc, articulo asc;

-- 3- Listar todos los artículos incluyendo una columna denominada 
-- precio con IVA, la cual deberá tener el monto con el iva del 
-- producto.
select	*
		, truncate(precio * 1.21, 2) as 'precio con IVA' 
from 	productos;

-- 4- Listar todos los artículos incluyendo una columna denominada 
-- “cantidad de cuotas” y otra “valor de cuota”, la cantidad es fija y 
-- es 3, el valor de cuota corresponde a 1/3 del precio con un 
-- 5% de interés.
select	*
		, 3 as 'cantidad de cuotas'
        , round((precio / 3) * 1.05, 2) as 'valor de cuota'
from 	productos;








