-- funciones de agrupacion

-- informar el precio del libro mas caro
select max(price) as 'precio mas caro' from titles;-- 22.95 U$s

-- informar la fecha en la que ingreso el 1er empleado
select min(hire_date) as 'primer ingreso' from employee;-- 1988-10-09

-- informar el precio promedio de todos los libros
select avg(price) as promedio from titles;-- 14.76 U$s

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
having 		cantidad >= 3
order by	2 desc;




