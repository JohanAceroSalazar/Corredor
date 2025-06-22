CREATE DATABASE Biblioteca;
USE Biblioteca;

CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100)
);

CREATE TABLE Libro (
    id_libro INT PRIMARY KEY,
    titulo VARCHAR(150),
    año_publicacion INT
);

CREATE TABLE Prestamo (
    id_prestamo INT PRIMARY KEY,
    id_usuario INT,
    id_libro INT,
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro)
);

CREATE TABLE Categoria (
    id_categoria INT PRIMARY KEY,
    nombre_categoria VARCHAR(100),
    descripcion VARCHAR (100)
);

CREATE TABLE Autor (
    id_autor INT PRIMARY KEY,
    nombre_autor VARCHAR(100),
    nacionalidad VARCHAR(50)
);

CREATE TABLE Categoria_Libro (
    id_libro INT,
    id_categoria INT,
    PRIMARY KEY (id_libro, id_categoria),
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro),
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
);

CREATE TABLE Libro_Autor (
    id_libro INT,
    id_autor INT,
    PRIMARY KEY (id_libro, id_autor),
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro),
    FOREIGN KEY (id_autor) REFERENCES Autor(id_autor)
);

INSERT INTO Usuario (id_usuario, nombre, correo) VALUES
(1, 'ana pérez',  'ana@correo.com'),
(2, 'luis gómez', 'luis@correo.com'),
(3, 'maría díaz', 'maria@correo.com');

INSERT INTO Libro (id_libro, titulo, año_publicacion) VALUES
(101, 'cien años de soledad', 1967),
(102, 'el principito',        1943),
(103, 'la sombra del viento', 2001);

INSERT INTO Autor (id_autor, nombre_autor, nacionalidad) VALUES
(201, 'gabriel garcía márquez', 'colombiana'),
(202, 'antoine de saint‑exupéry', 'francesa'),
(203, 'carlos ruiz zafón', 'española');

INSERT INTO Categoria (id_categoria, nombre_categoria, descripcion) VALUES
(301, 'novela',   'ficción narrativa'),
(302, 'infantil', 'lectura para niños'),
(303, 'misterio', 'novela de suspense');

INSERT INTO Prestamo
(id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion) VALUES
(401, 1, 101, '2025-07-01', '2025-07-15'),
(402, 2, 102, '2025-07-02', '2025-07-12'),
(403, 3, 103, '2025-07-03', NULL);   

INSERT INTO Categoria_Libro (id_libro, id_categoria) VALUES
(101, 301),   
(102, 302),  
(103, 303);  

INSERT INTO Libro_Autor (id_libro, id_autor) VALUES
(101, 201), 
(102, 202),   
(103, 203);

--5 SELECT

SELECT u.nombre AS usuario, l.titulo AS libro
FROM Usuario u
INNER JOIN Prestamo p ON u.id_usuario = p.id_usuario
INNER JOIN Libro l ON p.id_libro = l.id_libro;

SELECT l.titulo AS libro, a.nombre_autor AS autor
FROM Libro l
INNER JOIN Libro_Autor la ON l.id_libro = la.id_libro
INNER JOIN Autor a ON la.id_autor = a.id_autor;

SELECT l.titulo AS libro, c.nombre_categoria AS categoria
FROM Libro l
INNER JOIN Categoria_Libro cl ON l.id_libro = cl.id_libro
INNER JOIN Categoria c ON cl.id_categoria = c.id_categoria;

SELECT p.id_prestamo, u.nombre AS usuario, l.titulo AS libro, p.fecha_prestamo
FROM Prestamo p
INNER JOIN Usuario u ON p.id_usuario = u.id_usuario
INNER JOIN Libro l ON p.id_libro = l.id_libro;

SELECT a.nombre_autor AS autor, c.nombre_categoria AS categoria
FROM Autor a
INNER JOIN Libro_Autor la ON a.id_autor = la.id_autor
INNER JOIN Categoria_Libro cl ON la.id_libro = cl.id_libro
INNER JOIN Categoria c ON cl.id_categoria = c.id_categoria;

--5 Subconsultas

SELECT titulo
FROM Libro
WHERE id_libro IN (
  SELECT id_libro
  FROM Prestamo
  WHERE id_usuario = (
    SELECT id_usuario
    FROM Usuario
    WHERE nombre = 'ana pérez'
  )
);

SELECT nombre_autor
FROM Autor
WHERE id_autor IN (
  SELECT id_autor
  FROM Libro_Autor
  WHERE id_libro IN (
    SELECT id_libro
    FROM Libro
    WHERE año_publicacion > 2000
  )
);

SELECT nombre_categoria
FROM Categoria
WHERE id_categoria IN (
  SELECT id_categoria
  FROM Categoria_Libro
  WHERE id_libro IN (
    SELECT id_libro
    FROM Prestamo
  )
);

SELECT titulo
FROM Libro
WHERE id_libro IN (
  SELECT id_libro
  FROM Prestamo
  GROUP BY id_libro
  HAVING COUNT(*) > 1
);

SELECT titulo
FROM Libro
WHERE id_libro IN(
  SELECT id_libro
  FROM Libro_Autor
  WHERE id_autor IN(
    SELECT id_autor
    FROM Autor
    WHERE nacionalidad = 'colombiana'
    )
);

--10 Select con Funciones

-- 1. Total de préstamos por usuario
SELECT u.nombre AS usuario,
       COUNT(p.id_prestamo) AS total_prestamos
FROM Usuario u
LEFT JOIN Prestamo p ON u.id_usuario = p.id_usuario
GROUP BY u.id_usuario, u.nombre;

-- 2. Año promedio de publicación por autor
SELECT a.nombre_autor AS autor,
       AVG(l.año_publicacion) AS promedio_año
FROM Autor a
JOIN Libro_Autor la ON a.id_autor = la.id_autor
JOIN Libro l ON la.id_libro = l.id_libro
GROUP BY a.id_autor, a.nombre_autor;

-- 3. Año más reciente de publicación de un libro
SELECT MAX(año_publicacion) AS año_maximo
FROM Libro;

--4. Total de categoria por libros
SELECT l.titulo,
        COUNT(cl.id_categoria) AS total_categorias
FROM Libro l
LEFT JOIN Categoria_Libro cl ON l.id_libro = cl.id_libro
GROUP BY l.id_libro, l.titulo;

-- 5. Nombre de autor concatenado con su nacionalidad
SELECT CONCAT(a.nombre_autor, ' - ', a.nacionalidad) AS autor_info
FROM Autor a;

-- 6. Nombre de categoria concatenado con su descripcion
SELECT CONCAT (c.nombre_categoria, ' - ' , c.descripcion) AS categoria_informacion
FROM Categoria c;

-- 7. Número de libros por nacionalidad del autor
SELECT a.nacionalidad,
       COUNT(la.id_libro) AS total_libros
FROM Autor a
JOIN Libro_Autor la ON a.id_autor = la.id_autor
GROUP BY a.nacionalidad;

-- 8. Fecha minima de prestamo
SELECT MIN(fecha_prestamo) AS fecha_minima_prestamo
FROM Prestamo;

--9  Fecha maxima de prestamo
SELECT MAX(fecha_devolucion) AS fecha_maxima_prestamo
FROM Prestamo;

--10. Nombre de autores de mayuscula
SELECT UPPER(nombre_autor) AS autor_mayuscula
FROM Autor;

--PROCEDIMIENTO
CREATE PROCEDURE RegistrarLibro
  @id_libro         INT,
  @titulo           VARCHAR(150),
  @anio_publicacion INT
AS
BEGIN
  INSERT INTO Libro (id_libro, titulo, año_publicacion)
  VALUES (@id_libro, @titulo, @anio_publicacion);
END;
GO

EXEC RegistrarLibro @id_libro = 104,
                    @titulo = 'el señor de los anillos',
                    @anio_publicacion = 1954;
-- 5 UPDATE
UPDATE Usuario SET nombre = 'ana p. pérez' 
WHERE id_usuario=1;
UPDATE Libro SET año_publicacion = 2005 
WHERE id_libro=103;
UPDATE Prestamo SET fecha_devolucion = '2025-07-20' 
WHERE id_prestamo=401;
UPDATE Categoria SET nombre_categoria = 'clasicos' 
WHERE id_categoria=301;
UPDATE Autor SET nacionalidad = 'mexicana' 
WHERE id_autor=201;

-- 5 DELETE
DELETE FROM Prestamo WHERE id_prestamo=403;
DELETE FROM Categoria_Libro WHERE id_libro=102 AND id_categoria=302;
DELETE FROM Libro_Autor WHERE id_libro=101 AND id_autor=201;
DELETE FROM Libro WHERE id_libro=103;
DELETE FROM Usuario WHERE id_usuario=3;

--5 ALTER
ALTER TABLE Usuario ADD telefono VARCHAR(20);
ALTER TABLE Categoria DROP COLUMN descripcion;
ALTER TABLE Libro ADD isbn VARCHAR(20);
ALTER TABLE Prestamo DROP COLUMN fecha_devolucion;
ALTER TABLE Usuario ADD fecha_registro DATE;

-- 5 TRUNCATE
TRUNCATE TABLE Prestamo;
TRUNCATE TABLE Categoria_Libro;
TRUNCATE TABLE Libro_Autor;
TRUNCATE TABLE Categoria;
TRUNCATE TABLE Autor;

--5 DROP
DROP TABLE Libro;
DROP TABLE Categoria_Libro;
DROP TABLE Libro_Autor;
DROP TABLE Categoria;
DROP TABLE Prestamo;