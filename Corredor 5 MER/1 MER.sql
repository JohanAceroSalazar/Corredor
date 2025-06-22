
--1 MER 
CREATE DATABASE Gimnasio1;
USE Gimnasio1;

CREATE TABLE Cliente (
  id_cliente INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);

CREATE TABLE Actividad (
  id_actividad INT PRIMARY KEY,
  nombre_actividad VARCHAR(100),
  nivel VARCHAR(20)
);

CREATE TABLE Entrenador (
  id_entrenador INT PRIMARY KEY,
  nombre_entrenador VARCHAR(100),
  especialidad VARCHAR(50)
);

CREATE TABLE Sala (
  id_sala INT PRIMARY KEY,
  nombre_sala VARCHAR(100),
  capacidad INT
);

CREATE TABLE Horario (
  id_horario INT PRIMARY KEY,
  dia DATE,
  hora_inicio VARCHAR(10),
  hora_fin VARCHAR(10)
);

CREATE TABLE Actividad_Cliente (
  id_cliente INT,
  id_actividad INT,
  PRIMARY KEY (id_cliente, id_actividad),
  FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
  FOREIGN KEY (id_actividad) REFERENCES Actividad(id_actividad)
);

CREATE TABLE Entrenador_Sala (
  id_entrenador INT,
  id_sala INT,
  PRIMARY KEY (id_entrenador, id_sala),
  FOREIGN KEY (id_entrenador) REFERENCES Entrenador(id_entrenador),
  FOREIGN KEY (id_sala) REFERENCES Sala(id_sala)
);

--INSERT

INSERT INTO Cliente (id_cliente, nombre, edad) VALUES
(1,   'juan pérez',28),
(2,   'maría lópez',32),
(3,   'carlos gómez',24);

INSERT INTO Actividad (id_actividad, nombre_actividad, nivel) VALUES
(101, 'yoga','básico'),
(102, 'spinning','intermedio'),
(103, 'pilates','avanzado');

INSERT INTO Entrenador (id_entrenador, nombre_entrenador, especialidad) VALUES
(201, 'ana suárez','fuerza'),
(202, 'roberto daza','cardio'),
(203, 'luis torres','funcional');

INSERT INTO Sala (id_sala, nombre_sala, capacidad) VALUES
(301, 'sala 1', 20),
(302, 'sala 2', 15),
(303, 'sala 3', 25);

INSERT INTO Horario (id_horario, dia, hora_inicio, hora_fin) VALUES
(401, '2025-07-01', '08:00', '09:00'),
(402, '2025-07-02', '09:00', '10:00'),
(403, '2025-07-03', '18:00', '19:00');

INSERT INTO Actividad_Cliente (id_cliente, id_actividad) VALUES
(1, 101),   
(2, 102),   
(3, 103);   

INSERT INTO Entrenador_Sala (id_entrenador, id_sala) VALUES
(201, 301),
(202, 302), 
(203, 303);

--SELECT
SELECT c.nombre AS cliente, a.nombre_actividad AS actividad, a.nivel
FROM Cliente c
INNER JOIN Actividad_Cliente ac ON c.id_cliente   = ac.id_cliente
INNER JOIN Actividad a ON ac.id_actividad = a.id_actividad;

SELECT e.nombre_entrenador AS entrenador, s.nombre_sala AS sala,
       s.capacidad
FROM Entrenador e
INNER JOIN Entrenador_Sala es ON e.id_entrenador = es.id_entrenador
INNER JOIN Sala s ON es.id_sala = s.id_sala;

SELECT a.nombre_actividad   AS actividad,
       COUNT(ac.id_cliente) AS total_clientes
FROM Actividad a
INNER JOIN Actividad_Cliente ac ON a.id_actividad = ac.id_actividad
GROUP BY a.id_actividad, a.nombre_actividad;

SELECT e.nombre_entrenador  AS entrenador,
       COUNT(es.id_sala) AS salas_asignadas
FROM Entrenador e
INNER JOIN Entrenador_Sala es ON e.id_entrenador = es.id_entrenador
GROUP BY e.id_entrenador, e.nombre_entrenador;

SELECT s.nombre_sala AS sala, e.nombre_entrenador AS entrenador
FROM Sala s
INNER JOIN Entrenador_Sala es ON s.id_sala = es.id_sala
INNER JOIN Entrenador e ON es.id_entrenador = e.id_entrenador;

--5 SUBCONSULTAS

SELECT nombre_entrenador
FROM   Entrenador
WHERE  id_entrenador IN (
    SELECT id_entrenador
    FROM   Entrenador_Sala
    WHERE  id_sala IN (
        SELECT id_sala
        FROM   Sala
        WHERE  capacidad > 20
    )
);

SELECT nombre
FROM   Cliente
WHERE  id_cliente IN (
    SELECT id_cliente
    FROM   Actividad_Cliente
    WHERE  id_actividad IN (
        SELECT id_actividad
        FROM   Actividad
        WHERE  nivel = 'avanzado'
    )
);

SELECT nombre_actividad
FROM   Actividad
WHERE  id_actividad IN (
    SELECT id_actividad
    FROM   Actividad_Cliente
    WHERE  id_cliente IN (
        SELECT id_cliente
        FROM   Cliente
        WHERE  edad < 26
    )
);

SELECT nombre_sala
FROM   Sala
WHERE  id_sala IN (
    SELECT id_sala
    FROM   Entrenador_Sala
    WHERE  id_entrenador IN (
        SELECT id_entrenador
        FROM   Entrenador
        WHERE  especialidad = 'cardio'
    )
);

SELECT nombre
FROM   Cliente
WHERE  id_cliente IN (
    SELECT id_cliente
    FROM   Actividad_Cliente
    WHERE  id_actividad IN (
        SELECT id_actividad
        FROM   Actividad
        WHERE  nivel = 'básico'
    )
);

--10 SELECT CON FUNCIONES                            

-- 1. Mayor capacidad entre todas las salas
SELECT MAX(capacidad) AS capacidad_maxima
FROM Sala;

-- 2. EDAD PROMEDIO DE LOS CLIENTES POR NIVEL DE ACTIVIDAD
SELECT a.nivel,
       AVG(c.edad) AS edad_promedio
FROM Cliente c
JOIN Actividad_Cliente ac ON c.id_cliente = ac.id_cliente
JOIN Actividad a          ON a.id_actividad = ac.id_actividad
GROUP BY a.nivel;

-- 3. CAPACIDAD MÁXIMA ENTRE TODAS LAS SALAS
SELECT MAX(nombre_actividad) AS actividades_maximas
FROM Actividad;

-- 4. LISTA DE ENTRENADORES CON ESPECIALIDAD CONCATENADA
SELECT CONCAT(nombre_entrenador, ' - ', especialidad) AS entrenador_info
FROM Entrenador;

-- 5. NOMBRES DE ACTIVIDADES EN MAYÚSCULA
SELECT id_actividad,
       UPPER(nombre_actividad) AS actividad_mayuscula
FROM Actividad;

-- 6. Edad mínima registrada entre todos los clientes  
SELECT MIN(edad) AS edad_minima
FROM Cliente;

-- 7. Hora maxima de los horarios de inicio
SELECT MAX(hora_inicio) AS hora_maxima
FROM Horario;

-- 8. Cantidad total de actividades
SELECT COUNT(*) AS total_actividades
FROM Actividad;

-- 9. TOTAL DE ACTIVIDADES QUE CADA CLIENTE PRACTICA (SUBCONSULTA ESCALAR)
SELECT c.nombre,
       (SELECT COUNT(*)
        FROM Actividad_Cliente ac
        WHERE ac.id_cliente = c.id_cliente) AS total_actividades
FROM Cliente c;

-- 10. Devuelve nombre y edad del cliente
SELECT CONCAT(nombre, ' - edad: ', edad) AS cliente_info
FROM Cliente;

--PROCEDIMIENTO
CREATE PROCEDURE RegistrarCliente (
  IN p_id_cliente INT,
  IN P_nombre VARCHAR (100),
  IN p_edad INT
)
BEGIN
  INSERT INTO Cliente(id_cliente, nombre, edad)
  VALUES (p_id_cliente, P_nombre, p_edad);
END
EXEC RegistrarCliente (4, 'johan acero', 18);

--5 UPDATE

UPDATE Cliente SET edad = 30           
WHERE id_cliente = 1;
UPDATE Actividad SET nivel = 'intermedio'
WHERE id_actividad = 101;
UPDATE Entrenador SET especialidad = 'yoga'
WHERE id_entrenador = 202;
UPDATE Sala SET capacidad = 30      
WHERE id_sala = 302;
UPDATE Horario SET hora_fin = '10:30' 
WHERE id_horario = 402;

--5 DELETE

DELETE FROM Actividad_Cliente WHERE id_cliente = 3 AND id_actividad = 103;
DELETE FROM Entrenador_Sala WHERE id_entrenador = 202 AND id_sala = 302;
DELETE FROM Horario WHERE id_horario = 403;
DELETE FROM Sala WHERE id_sala = 303;
DELETE FROM Cliente WHERE id_cliente = 3;

--5 ALTER

ALTER TABLE Cliente ADD telefono VARCHAR(20);
ALTER TABLE Actividad DROP COLUMN nivel;
ALTER TABLE Sala ADD piso INT;
ALTER TABLE Entrenador ADD edad INT;
ALTER TABLE Horario DROP COLUMN hora_fin;

--5 TRUNCATE

TRUNCATE TABLE Actividad_Cliente;
TRUNCATE TABLE Entrenador_Sala;
TRUNCATE TABLE Horario;
TRUNCATE TABLE Sala;
TRUNCATE TABLE Cliente;

--5 DROP

DROP TABLE Actividad_Cliente;
DROP TABLE Entrenador_Sala;
DROP TABLE Actividad;
DROP TABLE Entrenador;
DROP TABLE Cliente;