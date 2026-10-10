-- TPN4 Consultas Relacionadas
use pubs;
-- 1. Seleccionar todos los libros junto a todos los datos de la editorial la cual 
-- lo publicó.
select 		*
from		titles t
inner join	publishers p
on			p.pub_id = t.pub_id;

-- 2. Mostrar el nombre del libro y el nombre de la editorial la cual lo publicó 
-- sólo de las editoriales que tengan residencia en USA. Mostrar un apodo para 
-- cada columna.
select		t.title as titulo,
			p.pub_name as editorial
from		titles t
inner join 	publishers p
on			t.pub_id = p.pub_id
where		p.country = 'USA';

-- 3. Listar los autores que residan en el mismo estado que las tiendas. 
-- Mostrar el nombre y apellido del autor en una columna y el nombre de la 
-- tienda en otra. Apodar ambas columnas. Ordenar por la columna 1.
select		concat(a.au_fname,' ',a.au_lname) as autor,
			s.stor_name as tienda
from		stores s
inner join	authors a
on			s.state = a.state
order by	1;

-- 4. Mostrar el nombre y apellido del autor y el nombre de los libros publicados 
-- por el mismo. Mostrar un apodo para cada columna. Ordenar por la primera columna 
-- de la consulta.
select		concat(a.au_fname,' ',a.au_lname) as autor,
			t.title as titulo
from		authors a
inner join	titleauthor ta on a.au_id = ta.au_id
inner join	titles t on t.title_id = ta.title_id
order by	1;	

-- 5 Mostrar los libros junto a su autor y su editorial. 
-- Se debe mostrar los datos en una unica columna de la siguiente manera con los 
-- siguientes textos literales: 'El libro XXXXXXXXXXXXX fue escrito por 
-- XXXXXXXXXXXXX y publicado por la editorial XXXXXXXXXXXXX' 
select		concat('El libro ', t.title, ' fue escrito por ', 
			a.au_fname,' ',a.au_lname,' y publicado por la editorial ',p.pub_name) as consulta
			
from		authors a
inner join	titleauthor ta on a.au_id = ta.au_id
inner join	titles t on t.title_id = ta.title_id
inner join	publishers p on p.pub_id = t.pub_id
order by	1;


















