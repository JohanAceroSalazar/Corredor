CREATE DATABASE Hotel;
USE Hotel;

CREATE TABLE Huesped (
  id_huesped INT PRIMARY KEY,
  nombre VARCHAR(100),
  correo VARCHAR(100)
);

CREATE TABLE Habitacion (
  id_habitacion INT PRIMARY KEY,
  numero INT,
  tipo VARCHAR(50),
  capacidad INT,
  precio_noche DECIMAL(8,2)
);

CREATE TABLE Empleado (
  id_empleado INT PRIMARY KEY,
  nombre_empleado VARCHAR(100),
  puesto VARCHAR(50)
);

CREATE TABLE Servicio (
  id_servicio INT PRIMARY KEY,
  nombre_servicio VARCHAR(100),
  costo DECIMAL(8,2)
);

CREATE TABLE Reserva (
  id_reserva INT PRIMARY KEY,
  id_huesped INT,
  id_empleado INT,
  fecha_ingreso DATE,
  fecha_salida DATE,
  FOREIGN KEY (id_huesped) REFERENCES Huesped(id_huesped),
  FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

CREATE TABLE Reserva_Habitacion (
  id_reserva INT,
  id_habitacion INT,
  noches INT,
  PRIMARY KEY (id_reserva,id_habitacion),
  FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva),
  FOREIGN KEY (id_habitacion) REFERENCES Habitacion(id_habitacion)
);

CREATE TABLE Huesped_Servicio (
  id_huesped INT,
  id_servicio INT,
  fecha DATE,
  cantidad INT,
  PRIMARY KEY (id_huesped,id_servicio,fecha),
  FOREIGN KEY (id_huesped) REFERENCES Huesped(id_huesped),
  FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio)
);

INSERT INTO Huesped (id_huesped, nombre, correo) VALUES
(1, 'ana rodríguez', 'ana@correo.com'),
(2, 'luis martínez', 'luis@correo.com'),
(3, 'maría pérez', 'maria@correo.com');

INSERT INTO Habitacion (id_habitacion, numero, tipo, capacidad, precio_noche) VALUES
(101, 101, 'individual', 1, 150.00),
(102, 102, 'doble', 2, 220.00),
(103, 103, 'suite', 4, 450.00);

INSERT INTO Empleado (id_empleado, nombre_empleado, puesto) VALUES
(201, 'pedro gonzález', 'recepcionista'),
(202, 'carla suárez', 'supervisor'),
(203, 'javier lópez', 'recepcionista');

INSERT INTO Servicio (id_servicio, nombre_servicio, costo) VALUES
(301, 'room service', 25.000),
(302, 'lavandería', 15.000),
(303, 'spa', 60.000);

INSERT INTO Reserva (id_reserva, id_huesped, id_empleado, fecha_ingreso, fecha_salida) VALUES
(401, 1, 201, '2025-07-10', '2025-07-12'),
(402, 2, 202, '2025-07-11', '2025-07-15'),
(403, 3, 203, '2025-07-12', '2025-07-13');

INSERT INTO Reserva_Habitacion (id_reserva, id_habitacion, noches) VALUES
(401, 101, 2),
(402, 102, 4),
(403, 103, 1);

INSERT INTO Huesped_Servicio (id_huesped, id_servicio, fecha, cantidad) VALUES
(1, 301, '2025-07-10', 1),
(2, 302, '2025-07-12', 2),
(3, 303, '2025-07-13', 1);

-- 5 SELECT

SELECT r.id_reserva,h.nombre,e.nombre_empleado
FROM Reserva r
JOIN Huesped h ON r.id_huesped=h.id_huesped
JOIN Empleado e ON r.id_empleado=e.id_empleado;

SELECT h.nombre,hab.numero,hab.tipo
FROM Reserva_Habitacion rh
JOIN Reserva r ON rh.id_reserva=r.id_reserva
JOIN Huesped h ON r.id_huesped=h.id_huesped
JOIN Habitacion hab ON rh.id_habitacion=hab.id_habitacion;

SELECT hu.nombre,s.nombre_servicio,hs.fecha,hs.cantidad
FROM Huesped_Servicio hs
JOIN Huesped hu ON hs.id_huesped=hu.id_huesped
JOIN Servicio s ON hs.id_servicio=s.id_servicio;

SELECT r.id_reserva,hab.numero,hab.precio_noche,rh.noches,hab.precio_noche*rh.noches AS costo
FROM Reserva r
JOIN Reserva_Habitacion rh ON r.id_reserva=rh.id_reserva
JOIN Habitacion hab ON rh.id_habitacion=hab.id_habitacion;

SELECT h.nombre AS nombre_huesped, e.nombre_empleado, r.fecha_ingreso
FROM Reserva r
JOIN Huesped h ON r.id_huesped = h.id_huesped
JOIN Empleado e ON r.id_empleado = e.id_empleado;

-- 5 SUBCONSULTAS

SELECT id_reserva
FROM Reserva_Habitacion
WHERE id_habitacion IN (
  SELECT id_habitacion
  FROM Habitacion
  WHERE capacidad > 2
);

SELECT nombre_servicio
FROM Servicio
WHERE costo > (
  SELECT AVG(costo)
  FROM Servicio
);

SELECT id_reserva
FROM Reserva
WHERE id_empleado IN (
  SELECT id_empleado
  FROM Empleado
  WHERE puesto = 'recepcionista'
);

SELECT nombre_empleado
FROM Empleado
WHERE id_empleado IN (
  SELECT id_empleado
  FROM Reserva
  WHERE id_reserva IN (
    SELECT id_reserva
    FROM Reserva_Habitacion
    WHERE noches > 2
  )
);

SELECT nombre_servicio
FROM Servicio
WHERE id_servicio IN (
  SELECT id_servicio
  FROM Huesped_Servicio
  WHERE id_huesped IN (
    SELECT id_huesped
    FROM Huesped
    WHERE correo = 'ana@correo.com'
  )
);

-- 10 SELECT CON FUNCIONES

SELECT AVG(rh.noches) AS noches_promedio
FROM Reserva_Habitacion rh;

SELECT MAX(precio_noche) AS precio_maximo
FROM Habitacion;

SELECT MIN(precio_noche) AS precio_minimo
FROM Habitacion;

SELECT CONCAT(nombre_servicio,'- $',costo) AS servicio_precio
FROM Servicio;

SELECT AVG(costo) AS costo_promedio
FROM Servicio;

SELECT UPPER(nombre) AS nombre_huesped_mayuscula
FROM Huesped;

SELECT tipo,COUNT(*) AS habitaciones_tipo
FROM Habitacion
GROUP BY tipo;

SELECT h.numero,SUM(rh.noches) AS noches_reservadas
FROM Habitacion h
LEFT JOIN Reserva_Habitacion rh ON h.id_habitacion=rh.id_habitacion
GROUP BY h.id_habitacion,h.numero;

SELECT e.nombre_empleado,COUNT(r.id_reserva) AS total_reservas
FROM Empleado e
LEFT JOIN Reserva r ON e.id_empleado=r.id_empleado
GROUP BY e.id_empleado,e.nombre_empleado;

SELECT CONCAT(UPPER(nombre_empleado),' - ',UPPER (puesto)) AS empleado_puesto
FROM Empleado;

--PROCEDIMIENTO
CREATE PROCEDURE RegistrarEmpleado
  @id_empleado     INT,
  @nombre_empleado VARCHAR(100),
  @puesto          VARCHAR(50)
AS
BEGIN
  INSERT INTO Empleado (id_empleado, nombre_empleado, puesto)
  VALUES (@id_empleado, @nombre_empleado, @puesto);
END;
GO

EXEC RegistrarEmpleado
     @id_empleado     = 204,
     @nombre_empleado = 'lucía garcía',
     @puesto          = 'gerente';

-- 5 UPDATE
UPDATE Huesped SET correo='ana@nuevo.com' 
WHERE id_huesped=1;
UPDATE Habitacion SET precio_noche=180.000 
WHERE id_habitacion=101;
UPDATE Reserva SET fecha_salida='2025-07-13' 
WHERE id_reserva=401;
UPDATE Servicio SET costo=30.000 
WHERE id_servicio=301;
UPDATE Empleado SET puesto='gerente' 
WHERE id_empleado=202;

-- 5 DELETE
DELETE FROM Huesped_Servicio WHERE id_huesped=2 AND id_servicio=302;
DELETE FROM Reserva_Habitacion WHERE id_reserva=402 AND id_habitacion=102;
DELETE FROM Reserva WHERE id_reserva=403;
DELETE FROM Habitacion WHERE id_habitacion=103;
DELETE FROM Servicio WHERE id_servicio=303;

-- 5 ALTER
ALTER TABLE Huesped ADD telefono VARCHAR(20);
ALTER TABLE Habitacion DROP COLUMN capacidad;
ALTER TABLE Reserva_Habitacion ADD importe DECIMAL(8,2);
ALTER TABLE Empleado DROP COLUMN puesto;
ALTER TABLE Servicio ADD descripcion VARCHAR(100);

-- 5 TRUNCATE
TRUNCATE TABLE Huesped_Servicio;
TRUNCATE TABLE Reserva_Habitacion;
TRUNCATE TABLE Reserva;
TRUNCATE TABLE Habitacion;
TRUNCATE TABLE Servicio;

-- 5 DROP 
DROP TABLE Habitacion;
DROP TABLE Huesped;
DROP TABLE Reserva_Habitacion;
DROP TABLE Reserva;
DROP TABLE Empleado;