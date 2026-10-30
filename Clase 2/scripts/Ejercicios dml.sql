CREATE TABLE `clientes` (
  `idcliente` int NOT NULL,
  `nombre` varchar(45) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `apellido` varchar(45) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `direccion` varchar(45) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `telefono` varchar(45) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `email` varchar(45) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `dni` int DEFAULT NULL,
  `sexo` enum('hombre','mujer') CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Ejercicios DML

-- 1- Insertar 5 clientes en la tabla clientes utilizando el insert into 
-- sin utilizar campos como parte de la sentencias, es decir de la forma 
-- simplificada.
insert into clientes 
values(10,'Lionel','Messi','Medrano 162 CABA','911','m@gmail.com',12345678,1);

select * from clientes;

-- 2- Insertar 5 clientes en la tabla clientes utilizando los campos como 
-- parte de la sentencias, es decir de la forma extendida. Completar sólo 
-- los campos nombre, apellido y dni
insert into clientes(idcliente,nombre,apellido,dni) 
values(11,'Leandro','Paredes',23456789);

select * from clientes;


-- Insercion de multiples registros
insert into clientes values
(12,'Emiliano','Martinez','Bulnes 37 CABA','101','dibu@gmail.com',34567890,1),
(13,'Cuti','Romero','Diaz Velez 3761 CABA','107','cr@yahoo.com',45678901,1);

select * from clientes;

-- 3- Actualizar el nombre del cliente 1 a José.
update	clientes
set		nombre = 'Jose'
where	idcliente = 1;

select * from clientes;

-- 5- Eliminar los clientes con apellido Perez.
delete from clientes where apellido = 'Perez';
-- no se puede por integridad referencial









