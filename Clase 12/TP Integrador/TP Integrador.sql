-- TP Integrador

-- 1

select		v.id_venta,
			v.precio_facturacion_final,
			te.nombre as tipo_empanada
from		venta v
inner join	tipoempanada te
on			te.id_tipo_empanada = v.id_tipo_empanada
where		v.cantidad_vendida between 1000 and 2000
order by	te.nombre;

-- 2
select		v.id_venta,
			v.precio_facturacion_final,
			p.nombre as postre
from		venta v
inner join	postre p
on			v.id_postre = p.id_postre
where		v.precio_facturacion_final between 80 and 200
order by	p.nombre;

-- 3
select		e.id_empleado,
			c.valor_hora,
			c.valor_hora_extra,
from		empleado e
inner join	cargo c
on			c.id_cargo = e.id_cargo
where		(c.id_cargo between 1 and 5) or (c.id_cargo between 20 and 28);

-- 4
-- a
select		c.nombre,
			p.comentario,
            p.fecha
from		cliente c
inner join	pedido p
on			c.id = p.id_cliente
where		month(p.fecha) = month(curdate());

-- b
select		month(p.fecha) as mes,
			c.nombre,
            count(p.id) cantidad_pedidos
from		cliente c
inner join	pedido p
on			c.id = p.id_cliente
group by	month(p.fecha) , c.nombre
order by	month(p.fecha) , c.nombre;

-- c
select		id_cliente,
			count(id) cantidad_pedidos
from		pedidos
group by	id_cliente
having		cantidad_pedidos > 10
order by	2;




 
