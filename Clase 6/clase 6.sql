-- funciones de agrupacion

-- informar el precio del libro mas caro
select max(price) as 'precio mas caro' from titles;-- 22.95 U$s

-- informar la fecha en la que ingreso el 1er empleado
select min(hire_date) as 'primer ingreso' from employee;-- 1988-10-09

-- informar el precio promedio de todos los libros
select truncate(avg(price),2) as promedio from titles;-- 14.76 U$s

-- informar la cantidad de autores de esta base de datos
select count(au_id) cantidad from authors;-- 23

-- informar el precio total de todos los titulos
select sum(price) total from titles;-- 236.26 U$s

-- todas las funciones de agrupacion en una sola query
select	max(price) 'precio mas caro',
		min(price) 'precio mas barato',
		count(title_id) cantidad,
		truncate(avg(price), 2) promedio,
		sum(price) total
from	titles;

-- Agrupacion
-- listar la cantidad de titulos y el titulo mas caro por categoria de libro.
-- No incluir aquellas categorias sin definir. Listar solo aquellas categorias
-- q tengan 3 o mas titulos en su haber. Ordenar por cantidad de titulos 
-- pertenecientes en forma descendente

select		type as categoria,
			count(title_id) cantidad,
            max(price) 'libro mas caro'
from		titles
where		type != ''
group by	type
-- having		cantidad > 2
having		count(title_id) > 2
-- order by	2 desc;
-- order by	count(title_id) desc;
order by	cantidad desc
limit		3;



-- TP N3 Consultas Agrupadas
-- Consultas agrupadas 

-- 21. Contar la cantidad de autores que su estado de residencia sea California 
-- (CA). Poner un apodo al nombre de columna. 
select	count(au_id) 'cantidad de autores' 
from	authors
where	state = 'ca';

-- 22. Mostrar la fecha de inicio de facturación y el último número de 
-- comprobante emitido. Poner un apodo a cada columna. 
select	min(ord_date) as 'inicio de facturación',
		max(ord_num) as 'último comprobante'
from	sales;

-- 23.  Contar la cantidad de países que residen alguna editorial. 
select distinct country pais from publishers;

select count(distinct country) 'cantidad de paises' from publishers;-- 3 

-- 24. Listar las categorías de libros y el valor promedio para cada 
-- tipo de libro. 
select		type categoria,
			truncate(avg(price), 2) promedio
from		titles
group by	type;

-- 25. ldem ejercicio 24 pero no incluir dentro de la lista los libros 
-- que no tienen decidida una categoría. 
select		type categoria,
			truncate(avg(price), 2) promedio
from		titles
where		type <> ''
group by	type;

-- 26.  Listar los locales que hayan vendido más de 100 libros. 
select		stor_id as local,
			sum(qty) as 'ventas por local'
from		sales
group by	stor_id
having		sum(qty) > 100;


-- 27. Listar la cantidad de ejemplares vendidos de cada libro en cada 
-- tienda. Poner apodos a las columnas. 
select		stor_id as local,
			title_id as titulo,
			sum(qty) as ventas
from		sales
group by	stor_id, title_id;

        
-- 28. Listar el valor promedio de los libros agrupados por tipo de 
-- libro cuyo promedio esté entre 12 y 14. Poner alias a los encabezados.
--  Ordenar la consulta por promedio. 
select		type categoria,
			truncate(avg(price),2) promedio
from		titles
group by	type
having		avg(price) between 12 and 14
order by	2 desc;


-- 29. Listar las categorías de libros junto con el precio del libro 
-- más caro, el más barato y la cantidad de libros existentes para esa 
-- categoría. Mostrar solo aquellas categorías de libros cuyo precio de 
-- los libros económicos sea inferior a $10 Y cuya cantidad de libros 
-- pertenecientes sean mayor a 2. 
select		type categoria,
			max(price) 'precio mas caro',
            min(price) 'precio mas barato',
            count(title_id) cantidad
from		titles
group by	type
having		min(price) < 10  and count(title_id) > 2
order by	2 desc;

-- 30. Contar la cantidad de empleados que trabajen en la compañía.
select count(emp_id) as 'cantidad de empleados' from employee;







