-- selecciono la base pubs por defecto
use pubs;

-- listo las tablas
show tables;

-- listo todos los autores
select * from authors;

-- listar el titulo y precio de los libros de 
-- cocina
select	title titulo,
		price as precio
from	titles
where	type like '%cook%';

-- listar los empleados que ingresaron en 1990
select 	* 
from 	employee
-- where	year(hire_date) = 1990;
where	hire_date like '%1990%';

-- listar los empleados que ingresaron en 
-- en el 1er semestre de 1990
select 	* 
from 	employee
where	year(hire_date) = 1990
and		month(hire_date) between 1 and 6;

-- listar los empleados cuyo nombre empiece con m
select	*
from	employee
where	fname like 'm%';

-- listar los empleados cuyo apellido termine con z
select	*
from	employee
where	lname like '%z';

-- listar los empleados cuyo nombre empiece con m,
-- el 2do caracter sea cualquiera, el 3er caracter
-- sea un r y no importa como termine
select	*
from	employee
where	fname rlike '^m.r.*$'; 

/*
	Moria
    Mirtha
    Marcos
    Marcelo
    Mercedes
*/


-- TP Nro. 2 Consultas Condicionadas

-- Consultas Simples

-- 1. Posicionar el Analizador de Consultas en la base de datos PUBS. 
use pubs;
-- 2. Mostrar todos los autores. 
select * from authors;
-- 3. Mostrar todas las editoriales.
 select * from publishers;
-- 4. Mostrar la estructura de la tabla STORES. 
describe stores;
-- 5. Mostrar la estructura de la tabla SALES. 
describe sales;

-- 6.	Mostrar el código, nombre completo y fecha de ingreso de los 
-- empleados que trabajan para la editorial 877. Tener en cuenta que el 
-- nombre completo es el resultado de la concatenación del nombre y 
-- apellido. Las columnas deben estar apodadas según las siguientes 
-- leyendas: "Número de Empleado", "Nombre de Empleado" y "Fecha de Inicio". 
select	emp_id as 'Número de Empleado',
		concat(fname,' ',lname) as 'Nombre de Empleado',
		hire_date 'Fecha de Inicio'
from	employee
where	pub_id = 877;

-- 7.	Mostrar el título, precio bruto y precio con IVA de los libros. Ninguna columna 
-- debe contener valores nulos. las columnas deben estar apodadas por las siguientes 
-- palabras: Título, Precio y Precio lVA. 
select	title as titulo,
		price as precio,
        truncate(price * 1.21, 2) as 'Precio IVA'
from	titles
where	title is not null and price is not null;

-- 8.  Mostrar los tipos de libros existentes. (diferentes categorias)
select	distinct type as categoria from titles;

-- 9. Listar los países de residencia de las editoriales. Evitar las 
-- repeticiones. 
select	distinct country as pais from publishers;

-- 10.	 Listar las ciudades y estados de residencia de los autores. Evitar 
-- las repeticiones.
select		distinct city as ciudad, 
			state as estado 
from 		authors
order by	2;


-- Consultas condicionadas 

-- 11.	  Listar todos los empleados del editorial número 877. Ordenar por 
-- nivel de trabajo descendente y por fecha de incorporación ascendente. 
select		*
from		employee
where		pub_id = 877
order by	job_lvl desc, hire_date asc;

-- 12.	Listar el número, apellido, nombre y teléfono de los autores que NO tengan contrato y que su estado de residencia sea California (CA). 
-- 13.	   Listar los empleados cuyo año de incorporación fue 1990 y cuyo nivel de trabajo esté entre 100 Y 200. 
-- 14.	   Listar los libros vendidos cuya condición de pago es sobre facturación y cuya cantidad de venta esté entre 13 y 40. No utilizar el operador BETWEEN. 
-- 15.	   Listar número y nombre de las editoriales cuyo estado de residencia contenga valor nulo. 
-- 16.	   Listar el título y precio de los libros de cocina cuyo título no figure la palabra "sushi". Ordenar por precio descendente. 
-- 17.	   Listar todos los empleados cuyo nombre empiece con la letra P y termine con la letra O, y su apellido termine con la letra O. 
-- 18.	   Listar todos los autores cuya dirección termine con un número y que la segunda letra de su apellido sea R. 

-- 19.	   Mostrar todos los empleados cuyo nombre empiece con la letra P ó A.
--  La segunda letra no sea A y la última letra esté entre la H y la Z. 
select	*
from	employee
where	fname rlike '^[p,a][^a].*[h-z]$';

-- 20.	   Listar todas las facturas que su condición de pago es a 30 días que hayan facturado durante el año 1992 y 1993 ó los que su condición de pago es a 60 días que han facturado durante el segundo semestre del año 1994. Ordenar la consulta por código de libro.







