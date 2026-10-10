-- consultas relacionadas
create database relaciones;

use relaciones;

create table sucursales(suc_id int, suc_nombre char(20));
create table empleados(emp_id int, emp_nombre char(20), suc_id int);

insert into sucursales values(1,'Centro'),(2,'Congreso'),(3,'Caballito'),(4,'Palermo');
insert into empleados values(1,'Juan',1),(2,'Carlos',2),(3,'Jose',2),(4,'Maria',null);


select * from sucursales;
select * from empleados;


-- INNER JOIN --> devuelve solo coincidencias
-- Devuelve aquellos registros en los cuales coinciden los valores de los
-- campos (en este ejemplo,suc_id) por los cuales se relacionan las tablas
-- Listar el nombre de las sucursales y de los empleados que trabajan en ellas
select		s.suc_nombre,
			e.emp_nombre
from		sucursales as s
join		empleados as e
on			s.suc_id = e.suc_id;


-- OUTER JOIN --> devuelve coincidencias y no coincidencias, pero me interesa
-- obtener solo las no coincidencias
-- Hay 2 tipos de outer join: left outer join y right outer join

-- tabla principal: es aquella de la cual quiero obtener datos
-- tabla secundaria: es la tabla que no es principal

-- listar el nombre de los empleados que no trabajan en ninguna sucursal
-- tabla principal: empleados
select	e.emp_nombre
		-- , s.* -- todos los campos de la tabla secundaria(en este ejemplo: sucursales)
from	sucursales s right join empleados e
on		s.suc_id = e.suc_id
where	s.suc_id is null;-- la clave ppal de la tabla secundaria

-- listar el nombre de las sucursales que no tienen empleados
-- tabla ppal: sucursales
select	s.suc_nombre
		-- , e.*
from	sucursales s left join empleados e
on		s.suc_id = e.suc_id
where	e.emp_id is null;

-- producto cartesiano
-- cross join
-- Devuelve todas las posibles combinaciones de valores de cada campo de una tabla
-- con cada campo de la otra tabla
select		e.*, s.*
from		sucursales as s
cross join 	empleados as e;










