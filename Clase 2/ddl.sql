create database instituto;

use instituto;

CREATE TABLE alumnos(
id_alumno INT PRIMARY KEY,
nombre VARCHAR(50),
apellido VARCHAR(50),
ciudad VARCHAR(50));

CREATE TABLE materias(
id_materia INT PRIMARY KEY,
nombre VARCHAR(50),
profesor VARCHAR(50));

CREATE TABLE inscripciones(
id_inscripcion int primary key auto_increment,
id_alumno INT,
id_materia INT,
nota INT,
FOREIGN KEY(id_alumno) REFERENCES alumnos(id_alumno),
FOREIGN KEY(id_materia) REFERENCES materias(id_materia));

-- carga de 5 registros en cada tabla para mysql
INSERT INTO alumnos (id_alumno, nombre, apellido, ciudad) VALUES
(1, 'Juan', 'Pérez', 'Madrid'),
(2, 'María', 'Gómez', 'Barcelona'),
(3, 'Luis', 'Martínez', 'Valencia'),
(4, 'Ana', 'López', 'Sevilla'),
(5, 'Carlos', 'Sánchez', 'Bilbao');

INSERT INTO materias (id_materia, nombre, profesor) VALUES
(1, 'Matemáticas', 'Dr. García'),
(2, 'Física', 'Dra. Fernández'),
(3, 'Química', 'Dr. Rodríguez'),
(4, 'Historia', 'Dra. López'),
(5, 'Literatura', 'Dr. Martínez');

INSERT INTO inscripciones (id_alumno, id_materia, nota) VALUES
(1, 1, 85),
(2, 2, 90),
(3, 3, 78),
(4, 4, 88),
(5, 5, 92);

-- consulta a las 3 tablas para ver los registros
SELECT * FROM alumnos;
SELECT * FROM materias; 
SELECT * FROM inscripciones;