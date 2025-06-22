CREATE DATABASE Cine;
USE Cine;

CREATE TABLE Pelicula (
  id_pelicula INT PRIMARY KEY,
  titulo VARCHAR(100),
  duracion_min INT,
  clasificacion VARCHAR(10)
);

CREATE TABLE Cliente (
  id_cliente INT PRIMARY KEY,
  nombre_cliente VARCHAR(100),
  correo VARCHAR(100)
);

CREATE TABLE Sala (
  id_sala INT PRIMARY KEY,
  nombre_sala VARCHAR(50),
  capacidad INT
);

CREATE TABLE Funcion (
  id_funcion INT PRIMARY KEY,
  id_pelicula INT,
  id_sala INT,
  fecha DATE,
  hora TIME,
  precio_ticket DECIMAL(6,2),
  FOREIGN KEY (id_pelicula) REFERENCES Pelicula(id_pelicula),
  FOREIGN KEY (id_sala) REFERENCES Sala(id_sala)
);

CREATE TABLE Empleado (
  id_empleado INT PRIMARY KEY,
  nombre_empleado VARCHAR(100),
  cargo VARCHAR(50)
);

CREATE TABLE Pelicula_Empleado (
  id_pelicula INT,
  id_empleado INT,
  rol VARCHAR(50),
  PRIMARY KEY (id_pelicula, id_empleado),
  FOREIGN KEY (id_pelicula) REFERENCES Pelicula(id_pelicula),
  FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

CREATE TABLE Cliente_Funcion (
  id_cliente INT,
  id_funcion INT,
  boletos INT,
  PRIMARY KEY (id_cliente, id_funcion),
  FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
  FOREIGN KEY (id_funcion) REFERENCES Funcion(id_funcion)
);

INSERT INTO Pelicula (id_pelicula, titulo, duracion_min, clasificacion) VALUES
(1, 'inception', 148, 'PG-13'),
(2, 'avatar', 162, 'PG-13'),
(3, 'coco', 105, 'PG');

INSERT INTO Cliente (id_cliente, nombre_cliente, correo) VALUES
(10, 'ana rodríguez', 'ana@cine.com'),
(11, 'luis martínez', 'luis@cine.com'),
(12, 'maría pérez', 'maria@cine.com');

INSERT INTO Sala (id_sala, nombre_sala, capacidad) VALUES
(20, 'sala 1', 120),
(21, 'sala 2', 100),
(22, 'sala 3', 80);

INSERT INTO Empleado (id_empleado, nombre_empleado, cargo) VALUES
(40, 'pedro gonzález', 'proyeccionista'),
(41, 'carla suárez', 'taquilla'),
(42, 'javier lópez', 'limpieza');

INSERT INTO Funcion (id_funcion, id_pelicula, id_sala, fecha, hora, precio_ticket) VALUES
(30, 1, 20, '2025-08-01', '18:00', 9.500),
(31, 2, 21, '2025-08-01', '20:00', 12.000),
(32, 3, 22, '2025-08-02', '16:00', 8.000);

INSERT INTO Pelicula_Empleado (id_pelicula, id_empleado, rol) VALUES
(1, 40, 'proyección'),
(2, 41, 'venta boletos'),
(3, 42, 'mantenimiento');

INSERT INTO Cliente_Funcion (id_cliente, id_funcion, boletos) VALUES
(10, 30, 2),
(11, 31, 1),
(12, 32, 3);

-- 5 SELECT

SELECT f.id_funcion, f.fecha, f.hora, p.titulo, s.nombre_sala
FROM Funcion f
INNER JOIN Pelicula p ON f.id_pelicula = p.id_pelicula
INNER JOIN Sala s ON f.id_sala = s.id_sala;

SELECT c.nombre_cliente, p.titulo, f.fecha, f.hora
FROM Cliente c
INNER JOIN Cliente_Funcion cf ON c.id_cliente = cf.id_cliente
INNER JOIN Funcion f ON cf.id_funcion = f.id_funcion
INNER JOIN Pelicula p ON f.id_pelicula = p.id_pelicula;

SELECT e.nombre_empleado, p.titulo, pe.rol
FROM Empleado e
INNER JOIN Pelicula_Empleado pe ON e.id_empleado = pe.id_empleado
INNER JOIN Pelicula p ON pe.id_pelicula = p.id_pelicula;

SELECT s.nombre_sala, f.fecha, f.hora, f.precio_ticket
FROM Sala s
INNER JOIN Funcion f ON s.id_sala = f.id_sala;

SELECT c.nombre_cliente, f.id_funcion, f.fecha, f.hora, cf.boletos
FROM Cliente c
INNER JOIN Cliente_Funcion cf ON c.id_cliente = cf.id_cliente
INNER JOIN Funcion f ON cf.id_funcion = f.id_funcion;

-- 5 SUBCONSULTAS

SELECT nombre_cliente
FROM Cliente
WHERE id_cliente IN (
  SELECT id_cliente
  FROM Cliente_Funcion
  WHERE boletos > 1
);

SELECT titulo
FROM Pelicula
WHERE id_pelicula = (
  SELECT id_pelicula
  FROM Funcion
  WHERE id_funcion = 30
);

SELECT nombre_empleado
FROM Empleado
WHERE id_empleado IN (
  SELECT id_empleado
  FROM Pelicula_Empleado
);

SELECT precio_ticket
FROM Funcion
WHERE precio_ticket = (
  SELECT MAX(precio_ticket)
  FROM Funcion
);

SELECT nombre_cliente
FROM Cliente
WHERE id_cliente IN (
  SELECT id_cliente
  FROM Cliente_Funcion
  WHERE id_funcion = 32
);

-- 10 SELECT CON FUNCIONES

-- 1. Conteo de funciones por película
SELECT p.titulo,COUNT(f.id_funcion) AS funciones
FROM Pelicula p
JOIN Funcion f ON p.id_pelicula=f.id_pelicula
GROUP BY p.id_pelicula,p.titulo;

-- 2. Boletos vendidos por función
SELECT f.id_funcion,SUM(cf.boletos) AS boletos_vendidos
FROM Funcion f
JOIN Cliente_Funcion cf ON f.id_funcion=cf.id_funcion
GROUP BY f.id_funcion;

-- 3. Ingreso total por función
SELECT f.id_funcion,SUM(cf.boletos*f.precio_ticket) AS ingreso
FROM Funcion f
JOIN Cliente_Funcion cf ON f.id_funcion=cf.id_funcion
GROUP BY f.id_funcion;

-- 4. Precio promedio de ticket
SELECT AVG(precio_ticket) AS promedio_precio
FROM Funcion;

-- 5. Precio máximo y mínimo de ticket
SELECT MAX(precio_ticket) AS max_precio,MIN(precio_ticket) AS min_precio
FROM Funcion;

-- 6. Título en mayúscula concatenado con clasificación
SELECT CONCAT(titulo,' - ',clasificacion) AS titulo_full
FROM Pelicula;

-- 7.Titulo de pelicula en mayuscula
SELECT UPPER (titulo) AS titulo_mayuscula
FROM Pelicula;

-- 8. Total de películas registradas
SELECT COUNT(*) AS total_peliculas
FROM Pelicula;

-- 9. Mostrar el nombre del cliente en mayúsculas
SELECT UPPER(nombre_cliente) AS cliente_mayuscula
FROM Cliente;

--10. Número de empleados asignados a cada película
SELECT p.titulo,COUNT(pe.id_empleado) AS total_empleados
FROM Pelicula p
LEFT JOIN Pelicula_Empleado pe ON p.id_pelicula=pe.id_pelicula
GROUP BY p.id_pelicula,p.titulo;

--PROCEDIMIENTO
CREATE PROCEDURE RegistrarSala
  @id_sala     INT,
  @nombre_sala VARCHAR(50),
  @capacidad   INT
AS
BEGIN
  INSERT INTO Sala (id_sala, nombre_sala, capacidad)
  VALUES (@id_sala, @nombre_sala, @capacidad);
END;
GO

EXEC RegistrarSala @id_sala = 23,
                   @nombre_sala = 'Sala VIP',
                   @capacidad = 80;

-- 5 UPDATE
UPDATE Pelicula SET titulo='interestelar' 
WHERE id_pelicula=1;
UPDATE Cliente SET correo='ana@nuevo.com' 
WHERE id_cliente=10;
UPDATE Sala SET capacidad=90 
WHERE id_sala=22;
UPDATE Funcion SET precio_ticket=10.500 
WHERE id_funcion=32;
UPDATE Empleado SET cargo='supervisor' 
WHERE id_empleado=42;

-- 5 DELETE
DELETE FROM Pelicula_Empleado WHERE id_pelicula=2 AND id_empleado=41;
DELETE FROM Cliente_Funcion WHERE id_cliente=11 AND id_funcion=31;
DELETE FROM Funcion WHERE id_funcion=30;
DELETE FROM Pelicula WHERE id_pelicula=3;
DELETE FROM Cliente WHERE id_cliente=12;

-- 5 ALTER
ALTER TABLE Pelicula ADD idioma VARCHAR(30);
ALTER TABLE Cliente DROP COLUMN correo;
ALTER TABLE Sala ADD tipo VARCHAR(20);
ALTER TABLE Empleado ADD telefono VARCHAR(10);
ALTER TABLE Funcion DROP COLUMN hora;

-- 5 TRUNCATE
TRUNCATE TABLE Pelicula_Empleado;
TRUNCATE TABLE Cliente_Funcion;
TRUNCATE TABLE Funcion;
TRUNCATE TABLE Sala;
TRUNCATE TABLE Empleado;

-- 5 DROP
DROP TABLE Pelicula;
DROP TABLE Cliente;
DROP TABLE Funcion;
DROP TABLE Sala;
DROP TABLE Empleado;