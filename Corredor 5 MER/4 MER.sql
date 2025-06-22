CREATE DATABASE StreamingMusical;
USE StreamingMusical;

CREATE TABLE Usuario (
  id_usuario INT PRIMARY KEY,
  nombre_usuario VARCHAR(100),
  correo VARCHAR(100),
  pais VARCHAR(50)
);

CREATE TABLE Artista (
  id_artista INT PRIMARY KEY,
  nombre_artista VARCHAR(100),
  genero_musical VARCHAR(50)
);

CREATE TABLE Album (
  id_album INT PRIMARY KEY,
  titulo_album VARCHAR(150),
  año INT
);

CREATE TABLE Cancion (
  id_cancion INT PRIMARY KEY,
  titulo_cancion VARCHAR(150),
  duracion_seg INT,
  id_album INT,
  FOREIGN KEY (id_album) REFERENCES Album(id_album)
);

CREATE TABLE Lista (
  id_lista INT PRIMARY KEY,
  nombre_lista VARCHAR(100),
  id_usuario INT,
  FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Usuario_Album (
  id_usuario INT,
  id_album INT,
  fecha_guardado DATE,
  PRIMARY KEY (id_usuario, id_album),
  FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
  FOREIGN KEY (id_album) REFERENCES Album(id_album)
);

CREATE TABLE Artista_Cancion (
  id_artista INT,
  id_cancion INT,
  rol VARCHAR(50),
  PRIMARY KEY (id_artista, id_cancion),
  FOREIGN KEY (id_artista) REFERENCES Artista(id_artista),
  FOREIGN KEY (id_cancion) REFERENCES Cancion(id_cancion)
);

INSERT INTO Usuario (id_usuario,nombre_usuario,correo,pais) VALUES
(1,'ana rodríguez','ana@correo.com','colombia'),
(2,'luis martínez','luis@correo.com','mexico'),
(3,'maría pérez','maria@correo.com','argentina');

INSERT INTO Artista (id_artista,nombre_artista,genero_musical) VALUES
(10,'coldplay','rock'),
(11,'shakira','pop'),
(12,'eminem','rap');

INSERT INTO Album (id_album,titulo_album,año) VALUES
(100,'viva la vida',2008),
(101,'laundry service',2001),
(102,'the marshall mathers lp',2000);

INSERT INTO Cancion (id_cancion,titulo_cancion,duracion_seg,id_album) VALUES
(200,'viva la vida',242,100),
(201,'whenever wherever',215,101),
(202,'stan',404,102);

INSERT INTO Lista (id_lista,nombre_lista,id_usuario) VALUES
(300,'favoritos',1),
(301,'entrenamiento',2),
(302,'relax',3);

INSERT INTO Usuario_Album (id_usuario,id_album,fecha_guardado) VALUES
(1,100,'2025-08-01'),
(2,101,'2025-08-02'),
(3,102,'2025-08-03');

INSERT INTO Artista_Cancion (id_artista,id_cancion,rol) VALUES
(10,200,'principal'),
(11,201,'principal'),
(12,202,'principal');

-- 5 SELECT

SELECT u.nombre_usuario, a.titulo_album
FROM Usuario u
INNER JOIN Usuario_Album ua ON u.id_usuario = ua.id_usuario
INNER JOIN Album a ON ua.id_album = a.id_album;

SELECT c.titulo_cancion, a.titulo_album
FROM Cancion c
INNER JOIN Album a ON c.id_album = a.id_album;

SELECT ar.nombre_artista, c.titulo_cancion
FROM Artista ar
INNER JOIN Artista_Cancion ac ON ar.id_artista = ac.id_artista
INNER JOIN Cancion c ON ac.id_cancion = c.id_cancion;

SELECT al.titulo_album, ar.nombre_artista
FROM Album al
INNER JOIN Cancion c ON al.id_album = c.id_album
INNER JOIN Artista_Cancion ac ON c.id_cancion = ac.id_cancion
INNER JOIN Artista ar ON ac.id_artista = ar.id_artista;

SELECT l.nombre_lista, u.nombre_usuario
FROM Lista l
INNER JOIN Usuario u ON l.id_usuario = u.id_usuario;

-- 5 SUBCONSULTAS

SELECT titulo_album
FROM Album
WHERE id_album IN (
  SELECT id_album
  FROM Usuario_Album
);

SELECT nombre_usuario
FROM Usuario
WHERE id_usuario IN (--
  SELECT id_usuario
  FROM Usuario_Album
  WHERE id_album IN(
SELECT id_album
FROM Album
WHERE año > 2000
	)
);

SELECT nombre_artista
FROM Artista
WHERE id_artista IN (
  SELECT id_artista
  FROM Artista_Cancion
  WHERE id_cancion = 202
);

SELECT titulo_cancion
FROM Cancion
WHERE id_album = (
  SELECT id_album
  FROM Album
  WHERE titulo_album = 'viva la vida'
);

SELECT titulo_cancion
FROM Cancion
WHERE id_cancion IN (
  SELECT id_cancion
  FROM Artista_Cancion
  WHERE rol = 'principal'
);

-- 10 SELECT CON FUNCIONES

-- 1. Álbumes guardados por cada usuario
SELECT u.nombre_usuario,
       COUNT(ua.id_album) AS total_albums
FROM Usuario u
LEFT JOIN Usuario_Album ua ON u.id_usuario = ua.id_usuario
GROUP BY u.id_usuario, u.nombre_usuario;

-- 2. Duración total de canciones por álbum
SELECT a.titulo_album,
       SUM(c.duracion_seg) AS duracion_total_seg
FROM Album a
JOIN Cancion c ON a.id_album = c.id_album
GROUP BY a.id_album, a.titulo_album;

-- 3. Canción más larga en cada álbum
SELECT a.titulo_album,
       MAX(c.duracion_seg) AS duracion_max_seg
FROM Album a
JOIN Cancion c ON a.id_album = c.id_album
GROUP BY a.id_album, a.titulo_album;

-- 4. Promedio global de duración de canciones
SELECT AVG(duracion_seg) AS duracion_promedio_seg
FROM Cancion;

-- 5. Año más reciente de publicación
SELECT MAX(año) AS año_mas_reciente
FROM Album;

-- 6. Nombre del usuario concatenado con país
SELECT CONCAT(u.nombre_usuario,' - ',u.pais,' ') AS usuario_pais
FROM Usuario u;

-- 7. Cancion con menos duracion en segundos
SELECT MIN(duracion_seg) AS duracion_min_seg 
FROM Cancion;

-- 8. Títulos de canciones en mayúsculas
SELECT UPPER(titulo_cancion) AS titulo_mayuscula
FROM Cancion;

-- 9. Primera fecha en que se guardó algún álbum
SELECT MIN(fecha_guardado) AS fecha_mas_antigua
FROM Usuario_Album;

-- 10. nombre de lista por cada usuario
SELECT l.nombre_lista,
       COUNT(l.id_lista) AS total_lista
FROM lista l
LEFT JOIN Usuario u ON u.id_usuario = l.id_usuario
GROUP BY u.id_usuario, l.nombre_lista;

--PROCEDIMIENTO
CREATE PROCEDURE RegistrarAlbum
  @id_album      INT,
  @titulo_album  VARCHAR(150),
  @año          INT
AS
BEGIN
  INSERT INTO Album (id_album, titulo_album, año)
  VALUES (@id_album, @titulo_album, @año);
END;
GO

EXEC RegistrarAlbum
     @id_album     = 103,
     @titulo_album = 'thriller',
     @año         = 2009;

-- 5 UPDATE
UPDATE Usuario SET pais='chile' 
WHERE id_usuario=3;
UPDATE Artista SET genero_musical='indie'
WHERE id_artista=10;
UPDATE Album SET año=2012 
WHERE id_album=101;
UPDATE Cancion SET duracion_seg=250 
WHERE id_cancion=201;
UPDATE Lista SET nombre_lista='hits 2025' 
WHERE id_lista=300;

-- 5 DELETE
DELETE FROM Usuario_Album WHERE id_usuario=2 AND id_album=101;
DELETE FROM Artista_Cancion WHERE id_artista=11 AND id_cancion=201;
DELETE FROM Lista WHERE id_lista=302;
DELETE FROM Cancion WHERE id_cancion=202;
DELETE FROM Artista WHERE id_artista=12;

-- 5 ALTER
ALTER TABLE Usuario ADD fecha_registro DATE;
ALTER TABLE Album ADD sello VARCHAR(80);
ALTER TABLE Cancion DROP COLUMN duracion_seg;
ALTER TABLE Lista ADD descripcion VARCHAR (50);
ALTER TABLE Artista DROP COLUMN genero_musical;

-- 5 TRUNCATE
TRUNCATE TABLE Usuario_Album;
TRUNCATE TABLE Artista_Cancion;
TRUNCATE TABLE Lista;
TRUNCATE TABLE Cancion;
TRUNCATE TABLE Album;

-- 5 DROP
DROP TABLE Cancion;
DROP TABLE Artista;
DROP TABLE Lista;
DROP TABLE Album;
DROP TABLE Usuario;