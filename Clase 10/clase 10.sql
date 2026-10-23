-- Consulta anidada = subconsulta = subquery = subselect
use pubs;

-- formato de tipo escalar
select max(price) from titles; -- 22.95

-- formato de tipo lista de valores
select fname from employee;

-- formato de tipo tabla de valores
select * from authors;

-- listar el titulo mas caro
select	title as titulo
from	titles
where	price = (select max(price) from titles);
-- where	price = 22.95;

-- Como se llama el empleado mas antiguo?
select	concat(fname,' ',lname) empleado
from	employee
where	hire_date = (select min(hire_date) from employee);

-- Quien escribio el ultimo libro de cocina?
select		concat(au_fname,' ',au_lname) autor
from		authors a
inner join	titleauthor ta on a.au_id = ta.au_id
inner join	titles t on t.title_id = ta.title_id
where		t.pubdate = (	select 	max(pubdate) 
							from 	titles
                            where	type like '%cook%'
						);
                        
-- uso de predicados
create table productos(codigo int, precio double);
create table ventas(codigo int, monto double);

insert into productos values(1,100),(2,200),(3,300),(4,1000);
insert into ventas values(1,300),(2,500),(3,400),(4,200);

select * from productos;
select * from ventas;

-- update ventas set monto = 100 where codigo = 4;

-- listar todos los productos cuyo precio supere algun monto
select	*
from	productos
where	precio > any (select monto from ventas);

-- listar todos los productos cuyo precio supere todos los montos
select	*
from	productos
where	precio > all (select monto from ventas);

-- listar todos los productos cuyo precio sea igual a algun monto
select	*
from	productos
-- where	precio in (select monto from ventas);
where	precio = any (select monto from ventas);

-- 		= any es equivalente a in

-- listar todos los productos cuyo precio sea distinto a algun monto
select	*
from	productos
-- where	precio not in (select monto from ventas);
where	precio <> all (select monto from ventas);

-- 		<> all es equivalente a not in

-- TPN5 Consultas Anidadas

-- 1.	Listar el nombre de los libros junto a su categoría de precio. La categoría de 
-- precio se calcula de la siguiente manera: Si el precio está entre 0 y 10 la categoría 
-- es Económica. Si la categoría está entre 10 Y 20, Normal y si su valor es mayor a 20 
-- la categoría es Caro. Colocar un apodo a las dos columnas.
use pubs;

select	title as titulo,
		price as precio,
        (case
			when price < 10 then 'Economica'
            when price between 10 and 20 then 'Normal'
            when price > 20 then 'Cara'
            else 'No categorizado'
        end) as categoria
from	titles;

-- 5.	Listar todos los libros cuyo precio sea inferior al 
-- precio promedio de todos los libros.
select	*
from	titles
where	price < (select avg(price) from titles);

-- 6.	Listar los empleados de aquellas editoriales que residan 
-- en USA. No usar relaciones para su resolución.

-- por join
select		e.*
from		employee e
inner join	publishers p
on			p.pub_id = e.pub_id
where		p.country = 'USA';

-- por subconsulta
select	*
from	employee
where	pub_id in (select pub_id from publishers where country = 'USA');

-- 48.	Listar todos los comprobantes de ventas emitidos para la venta del 
-- libro "Sushi, Anyone?". No utilizar relaciones.  

-- por join
select		s.ord_num as factura,
			t.title as titulo
from		titles t
inner join	sales s on t.title_id = s.title_id
where		t.title like '%anyone%';

-- por subconsulta
select	ord_num as comprobante
from	sales
where	title_id in (select title_id from titles where title like '%anyone%');








