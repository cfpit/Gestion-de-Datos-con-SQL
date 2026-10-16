-- TPN4 Consultas Relacionadas
use pubs;
-- 1. Seleccionar todos los libros junto a todos los datos de la editorial la cual 
-- lo publicó.
-- ANSI
select 		p.*,t.*
from		titles t
inner join	publishers p
on			p.pub_id = t.pub_id;

select 		p.*,t.*
from		titles t, publishers p
where		p.pub_id = t.pub_id;

-- 2. Mostrar el nombre del libro y el nombre de la editorial la cual lo publicó 
-- sólo de las editoriales que tengan residencia en USA. Mostrar un apodo para 
-- cada columna.
select		t.title as titulo,
			p.pub_name as editorial,
            p.country pais
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

-- 6. Mostrar el nombre de las editoriales que no hayan publicado ningún libro.
-- tabla ppal: publishers
-- tabla secundaria: titles
select	p.pub_name as editorial
		-- ,t.*
from	publishers p left join titles t
on		p.pub_id = t.pub_id
where	t.title_id is null;-- pk de tabla secundaria q sea null

-- 7. Mostrar el nombre de los libros que nunca fueron vendidos
-- tabla ppal: titles
-- tabla secundaria: sales
select		t.title as titulo
			-- ,s.*
from		sales s 
right join 	titles t
on			s.title_id = t.title_id
where		s.stor_id is null;

-- 8. Mostrar el nombre y apellido de los empleados y la 
-- descripción del trabajo que realiza. Basar la relación 
-- en el nivel de trabajo. 
select		concat(e.fname,' ',e.lname) as empleado,
			j.job_desc as puesto,
            e.job_lvl as carga_horaria
from		employee e
inner join	jobs j
on			e.job_id = j.job_id
where		e.job_lvl between j.min_lvl and j.max_lvl
order by	3 desc;

-- 9. Mostrar el producto cartesiano entre los libros de 
-- negocio (business) y las tiendas ubicadas en California (CA). 
-- Mostrar el nombre de la tienda y el nombre del libro. Ordenar 
-- por nombre de tienda.
select		st.stor_name as tienda,
			t.title as titulo,
			t.type as tipo,
			st.state as estado
from		titles t
cross join	stores st
where		st.state = 'CA' and t.type = 'business';-- 12

select * from titles;-- 19
select * from stores;-- 6


-- 10 .Listar todas las ciudades mencionadas en la base de datos.
select city from publishers
union
select city from stores
union
select city from authors;
	






















