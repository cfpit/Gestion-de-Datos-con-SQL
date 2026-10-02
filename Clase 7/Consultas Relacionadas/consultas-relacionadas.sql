-- consultas relacionadas
create database relaciones;

use relaciones;

create table sucursales(suc_id int, suc_nombre char(20));
create table empleados(emp_id int, emp_nombre char(20), suc_id int);

insert into sucursales values(1,'Centro'),(2,'Congreso'),(3,'Caballito'),(4,'Palermo');
insert into empleados values(1,'Juan',1),(2,'Carlos',2),(3,'Jose',2),(4,'Maria',null);


select * from sucursales;
select * from empleados;


-- INNER JOIN
-- Listar el nombre de las sucursales y de los emplados que trabajan en ellas
select		s.suc_nombre,
			e.emp_nombre
from		sucursales as s
join		empleados as e
on			s.suc_id = e.suc_id;







