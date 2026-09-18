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

-- 12.	Listar el número, apellido, nombre y teléfono de los autores que NO tengan 
-- contrato y que su estado de residencia sea California (CA). 
select	au_id as numero,
		concat(au_fname,' ',au_lname) as autor,
        phone telefono,
        state estado
from	authors
where	contract = 0 and state = 'CA';

-- 13. Listar los empleados cuyo año de incorporación fue 1990 y cuyo nivel de 
-- trabajo esté entre 100 Y 200.
 select		*
 from		employee
 where		year(hire_date) = 1990 and job_lvl between 100 and 200;
 
-- 14.Listar los libros vendidos cuya condición de pago es sobre facturación 
-- y cuya cantidad de venta esté entre 13 y 40. No utilizar el operador BETWEEN. 
select 	* 
from 	sales
where	payterms like '%invoice%' and qty >= 13 and qty <= 40;

-- 15. Listar número y nombre de las editoriales cuyo estado de residencia 
-- contenga valor nulo. 
select	pub_id as 'numero de editorial',
		pub_name as editorial
from	publishers
where	state is null;

-- 16.	Listar el título y precio de los libros de cocina cuyo título no figure la 
-- palabra "sushi". Ordenar por precio descendente. 
select		title as titulo,
			price precio,
			type categoria
from		titles
where		title not like '%sushi%' and type like '%cook%'
order by	price desc;

-- 17.Listar todos los empleados cuyo nombre empiece con la letra P y termine con la 
-- letra O, y su apellido termine con la letra O. 
select	*
from	employee
where	fname like 'p%o' and lname like '%o';

-- 18. Listar todos los autores cuya dirección termine con 
-- un número y que la segunda letra de su apellido sea R. 
select	*
from	authors
where	address rlike '[0-9]$' and au_lname like '__e%';


-- 19.	   Mostrar todos los empleados cuyo nombre empiece con la letra P ó A.
--  La segunda letra no sea A y la última letra esté entre la H y la Z. 
select	*
from	employee
where	fname rlike '^[p,a][^a].*[h-z]$';

-- 20. Listar todas las facturas que su condición de pago es a 30 días que hayan 
-- facturado durante el año 1992 y 1993 ó los que su condición de pago es a 60 días 
-- que han facturado durante el segundo semestre del año 1994. Ordenar la consulta por 
-- código de libro.
select 	* 
from 	sales
where	payterms = 'net 30' and year(ord_date) in (1992,1993)
or		payterms = 'net 60' and year(ord_date) = 1994 and month(ord_date) between 7 and 12
order by	title_id asc;

/*
	. del rlike es equivalente a _ del like
    .* del rlike es equivalente a % del like
    
    _ es comodin de un solo caracter
    % es comodin de N caracteres

*/
