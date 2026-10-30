-- TP N5 Consultas Anidadas
-- 2. Listar los 5 libros más caros. 
use pubs;

select		*
from		titles
order by	price desc
limit		5;

-- 3. Listar la mitad de los empleados.
SET @inicio=0; SET @cantidadRegistros=(select (count(*) div 2 + 1) from employee);
PREPARE sentencia FROM 'SELECT * FROM employee LIMIT ? , ?';
EXECUTE sentencia USING @inicio, @cantidadRegistros;

-- 4. Listar todos los libros vendidos, su nombre y la cantidad vendida por cada 
-- uno. Los apodos para las columnas son las siguientes: "Código del libro", 
-- "Nombre del libro" y "Cantidad vendida".
select		t.title_id as codigo_libro,
			t.title as nombre_libro,
			s.qty as cantidad_vendida
from		titles t
inner join	sales s
on			s.title_id = t.title_id
order by	3 desc;

-- 7. Listar la cantidad de libros vendidos por cada tienda, sólo de aquellas 
-- tiendas que su cantidad de venta sea mayor al promedio de venta general. 
select		st.stor_name as tienda,
			sum(s.qty) as cantidad
from		stores st
inner join	sales s
on			st.stor_id = s.stor_id
group by	st.stor_name
having		sum(s.qty) > (select sum(qty) / count( distinct stor_id) from sales)
order by	2 desc;

select count(stor_id) from sales;-- 15
select count(distinct stor_id) from sales;-- 6

-- 9. Mostrar el nombre de los libros junto a su categoría de precio de aquellos libros 
-- que son categorizados como "Normal". La categoría de los precios es la misma del 
-- ejercicio 1.
SELECT	*
FROM	(
			select	title as titulo,
					price as precio,
					(case
						when price < 10 then 'Economica'
						when price between 10 and 20 then 'Normal'
						when price > 20 then 'Cara'
						else 'No categorizado'
					end) as categoria
			from	titles
		) as miSubconsulta
WHERE	miSubconsulta.categoria = 'Normal';

-- 10.	Listar título del libro, categoría de precio, precio unitario y cantidad ejemplares vendidos. Mostrar 
-- sólo aquellos libros que sean económicos y cuya cantidad de ejemplares vendidos sea mayor a cero. Se deben 
-- apodar las columnas de la siguiente manera: 'Tít", "Cat", "Pr", "Cant". La categoría de los precios es la 
-- misma del ejercicio 1.
SELECT	*
FROM	(
			select		t.title as titulo,
						t.price as precio,
						s.qty as cantidad_vendida,
						(case
							when price < 10 then 'Economica'
							when price between 10 and 20 then 'Normal'
							when price > 20 then 'Cara'
							else 'No categorizado'
						end) as categoria
			from		titles t
			inner join	sales s 
			on 			s.title_id = t.title_id
			where		s.qty > 0
		) as miSubconsulta

WHERE	miSubconsulta.categoria = 'Economica';


        
        


















