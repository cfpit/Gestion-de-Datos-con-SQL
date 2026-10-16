-- Trabajar sobre la Base Negocio:
-- 1) Listar la cantidad de clientes que hicieron alguna compra en el segundo 
-- semestre de 2017. 
select	count(idcliente) as cantidad 
from 	facturas 
where	year(fecha) = 2017 and month(fecha) between 7 and 12;-- 3 clientes

  -- 2) Informar la cantidad de compras por cliente. Informar el nombre y 
  -- apellido en una única columna de dichos clientes. Ordenar por cantidad 
  -- de compras en forma descendente.
select		concat(c.nombre,' ',c.apellido) as cliente,
			count(f.numero) as cantidad_ventas
from		clientes c
inner join	facturas f
on			c.idcliente = f.idcliente
group by	cliente
order by	2 desc;
        
 -- 3) Informar las ventas por artículo. Cuál es el artículo más comprado? 
 -- Ordenar por cantidad de ventas del más vendido al menos vendido.
select		p.articulo,
			count(f.numero) as cantidad_ventas
from		productos p
inner join	facturas f
on			p.idproducto = f.idproducto
group by	p.articulo
order by	2 desc;

-- 4) Ídem ejercicio anterior pero incluir solo los artículos con una cantidad 
-- de ventas mayor o igual a 2. No incluir a los clientes que compraron 
-- camisas.
select		p.articulo,
			count(f.numero) as cantidad_ventas
from		productos p
inner join	facturas f
on			p.idproducto = f.idproducto
where		p.articulo <> 'camisa'
group by	p.articulo
having		cantidad_ventas >= 2
order by	2 desc;

-- 5) Listar nombre y apellido (en una sola columna) y teléfono de los clientes 
-- que compraron pantalones. Indicar cuanto pagaron y cuando compraron. Ordenar 
-- por fecha de compra, mostrando primero la compra más antigua.
select		concat(c.nombre,' ',c.apellido) as cliente,
			c.telefono as telefono,
			p.articulo as prenda,
			p.precio as precio,
			f.fecha as fecha
from		clientes c
inner join	facturas f on f.idcliente = c.idcliente
inner join	productos p on f.idproducto = p.idproducto
where		p.articulo like '%pantalon%'
order by	f.fecha asc;
        







