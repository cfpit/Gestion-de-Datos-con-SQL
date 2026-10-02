-- consultas relacionadas
create database relaciones;

use relaciones;

create table sucursales(suc_id int, suc_nombre char(20));
create table empleados(emp_id int, emp_nombre char(20), suc_id int);

insert into sucursales values(1,'Centro'),(2,'Congreso'),(3,'Caballito'),(4,'Palermo');
insert into empleados values(1,'Juan',1),(2,'Carlos',2),(3,'Jose',2),(4,'Maria',null);


select * from sucursales;
select * from emlpeados;
