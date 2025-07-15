--1 MER
CREATE DATABASE Taller;
USE Taller;

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE Vehiculo (
    id_vehiculo INT PRIMARY KEY,
    id_cliente INT,
    placa VARCHAR(10),
    marca VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Taller (
    id_taller INT PRIMARY KEY,
    nombre_taller VARCHAR(100),
    direccion VARCHAR(200)
);

CREATE TABLE Vehiculo_Taller (
    id_vehiculo INT,
    id_taller INT,
    fecha_ingreso DATE,
    fecha_salida DATE,
    PRIMARY KEY (id_vehiculo, id_taller),
    FOREIGN KEY (id_vehiculo) REFERENCES Vehiculo(id_vehiculo),
    FOREIGN KEY (id_taller) REFERENCES Taller(id_taller)
);

CREATE TABLE Servicio (
    id_servicio INT PRIMARY KEY,
    descripcion VARCHAR(200),
    costo DECIMAL(10,2)
);

CREATE TABLE Repuesto (
    id_repuesto INT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10,2)
);

CREATE TABLE Servicio_Repuesto (
    id_servicio INT,
    id_repuesto INT,
    cantidad INT,
    PRIMARY KEY (id_servicio, id_repuesto),
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio),
    FOREIGN KEY (id_repuesto) REFERENCES Repuesto(id_repuesto)
);

INSERT INTO Cliente VALUES
(1, 'Carlos Pérez', 'carlos@mail.com', '3001234567'),
(2, 'Laura Gómez', 'laura@mail.com', '3017654321');

INSERT INTO Vehiculo VALUES
(10, 'ABC123', 'Toyota', 'Corolla', 1), 
(20, 'XYZ789', 'Mazda', '3', 1); 

INSERT INTO Taller VALUES
(101, 'Taller Motor', 'Cra 10 #23-45'), 
(102, 'AutoFix', 'Calle 50 #15-30'); 

INSERT INTO Vehiculo_Taller VALUES
(10, 101, '2025-06-01', '2025-06-05'); 

INSERT INTO Servicio VALUES
(201, 'Cambio de aceite', 80000), 
(202, 'Alineación y balanceo', 120000); 

INSERT INTO Repuesto VALUES
(301, 'Filtro de aceite', 35000), 
(302, 'Llanta Rin 15', 180000);

INSERT INTO Servicio_Repuesto VALUES 
(201, 301, 1);

SELECT nombre
FROM Cliente
WHERE id_cliente IN (
    SELECT id_cliente
    FROM Vehiculo
);

SELECT placa
FROM Vehiculo
WHERE id_vehiculo IN (
    SELECT id_vehiculo
    FROM Vehiculo_Taller
);

SELECT v.placa, v.marca, c.nombre AS cliente
FROM Vehiculo v
INNER JOIN Cliente c ON v.id_cliente = c.id_cliente;

SELECT s.descripcion, r.nombre AS repuesto, sr.cantidad
FROM Servicio s
INNER JOIN Servicio_Repuesto sr ON s.id_servicio = sr.id_servicio
INNER JOIN Repuesto r ON sr.id_repuesto = r.id_repuesto;

UPDATE Cliente SET telefono = '3029999999'
WHERE id_cliente = 1;

UPDATE Servicio SET costo = 95000
WHERE id_servicio = 201;

DELETE FROM Repuesto WHERE id_repuesto = 302;

DELETE FROM Vehiculo WHERE id_vehiculo = 20;

SELECT UPPER(nombre) AS nombre_mayuscula
FROM Cliente;

SELECT CONCAT(marca, ' ', modelo) AS vehiculo
FROM Vehiculo;

SELECT MAX(costo) AS costo_maximo_servicio
FROM Servicio;

ALTER TABLE Cliente ADD email VARCHAR(100);

ALTER TABLE Taller DROP COLUMN ubicacion;

TRUNCATE TABLE Servicio_Repuesto;

TRUNCATE TABLE Vehiculo_Taller;

DROP TABLE Cliente;

DROP TABLE Vehiculo;

--2 MER
CREATE DATABASE Club;
USE Club;

CREATE TABLE Socio (
    id_socio INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50)
);

CREATE TABLE Disciplina (
    id_disciplina INT PRIMARY KEY,
    nombre VARCHAR(50),
    categoria VARCHAR(30)
);

CREATE TABLE Monitor (
    id_monitor INT PRIMARY KEY,
    nombre VARCHAR(50),
    especialidad VARCHAR(50)
);

CREATE TABLE Sala (
    id_sala INT PRIMARY KEY,
    nombre VARCHAR(50),
    capacidad INT
);

CREATE TABLE socio_disciplina (
    id_socio INT,
    id_disciplina INT,
    fecha_inicio DATE,
    PRIMARY KEY (id_socio, id_disciplina),
    FOREIGN KEY (id_socio) REFERENCES Socio(id_socio),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina)
);

CREATE TABLE monitor_disciplina (
    id_monitor INT,
    id_disciplina INT,
    fecha_asignacion DATE,
    PRIMARY KEY (id_monitor, id_disciplina),
    FOREIGN KEY (id_monitor) REFERENCES Monitor(id_monitor),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina)
);

CREATE TABLE Reserva (
    id_reserva INT PRIMARY KEY,
    id_sala INT,
    id_disciplina INT,
    fecha_reserva DATE,
    FOREIGN KEY (id_sala) REFERENCES Sala(id_sala),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina)
);

INSERT INTO Socio VALUES
(1, 'Carlos', 'Gómez'),
(2, 'Lucía', 'Ramírez');

INSERT INTO Disciplina VALUES
(10, 'Natación', 'Acuática'),
(11, 'Tenis', 'Deporte de raqueta');

INSERT INTO Monitor VALUES
(100, 'Andrés Torres', 'Natación'),
(101, 'Diana López', 'Tenis');

INSERT INTO Sala VALUES
(200, 'Piscina Olímpica', 30),
(201, 'Cancha de Tenis #1', 4);

INSERT INTO socio_disciplina VALUES
(1, 10, '2025-06-01'),
(2, 11, '2025-06-02');

INSERT INTO monitor_disciplina VALUES
(100, 10, '2025-05-15'),
(101, 11, '2025-05-20');

INSERT INTO Reserva VALUES
(1, 200, 10, '2025-07-10'),
(2, 201, 11, '2025-07-11');

SELECT nombre
FROM Socio
WHERE id_socio IN (
    SELECT id_socio FROM socio_disciplina
);

SELECT nombre
FROM Disciplina
WHERE id_disciplina IN (
    SELECT id_disciplina FROM monitor_disciplina
);

SELECT nombre
FROM Sala
WHERE id_sala IN (
    SELECT id_sala FROM Reserva
);

SELECT s.nombre, d.nombre AS disciplina
FROM Socio s
INNER JOIN socio_disciplina sd ON s.id_socio = sd.id_socio
INNER JOIN Disciplina d ON sd.id_disciplina = d.id_disciplina;

SELECT r.fecha_reserva, sa.nombre AS sala, d.nombre AS disciplina
FROM Reserva r
INNER JOIN Sala sa ON r.id_sala = sa.id_sala
INNER JOIN Disciplina d ON r.id_disciplina = d.id_disciplina;

UPDATE Socio SET apellido = 'Martínez'
WHERE id_socio = 1;

UPDATE Sala SET capacidad = 50
WHERE id_sala = 200;

DELETE FROM Reserva WHERE id_reserva = 1;

DELETE FROM Monitor WHERE id_monitor = 101;

SELECT UPPER(nombre) AS nombre_mayuscula FROM Monitor;

SELECT CONCAT(nombre, ' ', apellido) AS nombre_completo FROM Socio;

SELECT MIN (capacidad) AS capacidad_minima FROM Sala;

ALTER TABLE Socio ADD email VARCHAR(100);

ALTER TABLE Reserva DROP COLUMN fecha_reserva;

TRUNCATE TABLE monitor_disciplina;

TRUNCATE TABLE Reserva;

DROP TABLE socio_disciplina;

DROP TABLE Sala;

--3 MER
CREATE TABLE Adoptante (
    id_adoptante INT PRIMARY KEY,
    nombre VARCHAR(100),
    documento VARCHAR(20)
);

CREATE TABLE Refugio (
    id_refugio INT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(150)
);

CREATE TABLE Mascota (
    id_mascota INT PRIMARY KEY,
    nombre VARCHAR(50),
    especie VARCHAR(50),
    id_refugio INT,
    FOREIGN KEY (id_refugio) REFERENCES Refugio(id_refugio)
);

CREATE TABLE Adoptante_Mascota (
    id_adoptante INT,
    id_mascota INT,
    fecha_adopcion DATE,
    PRIMARY KEY (id_adoptante, id_mascota),
    FOREIGN KEY (id_adoptante) REFERENCES Adoptante(id_adoptante),
    FOREIGN KEY (id_mascota) REFERENCES Mascota(id_mascota)
);

CREATE TABLE Veterinario (
    id_veterinario INT PRIMARY KEY,
    nombre VARCHAR(100),
    especialidad VARCHAR(100)
);

CREATE TABLE Mascota_Veterinario (
    id_mascota INT,
    id_veterinario INT,
    fecha_revision DATE,
    PRIMARY KEY (id_mascota, id_veterinario),
    FOREIGN KEY (id_mascota) REFERENCES Mascota(id_mascota),
    FOREIGN KEY (id_veterinario) REFERENCES Veterinario(id_veterinario)
);

CREATE TABLE Seguimiento (
    id_seguimiento INT PRIMARY KEY,
    id_mascota INT,
    nota TEXT,
    FOREIGN KEY (id_mascota) REFERENCES Mascota(id_mascota)
);

INSERT INTO Refugio (id_refugio, nombre, direccion) VALUES
(100, 'Refugio Patitas Felices', 'Calle 123 #45-67'),
(101, 'Hogar Animalito', 'Avenida 10 #20-30');

INSERT INTO Adoptante (id_adoptante, nombre, documento) VALUES
(200, 'María López', '123456789'),
(201, 'Carlos Ramírez', '987654321');

INSERT INTO Mascota (id_mascota, nombre, especie, id_refugio) VALUES
(300, 'Luna', 'Perro', 100),
(301, 'Milo', 'Gato', 101);

INSERT INTO Adoptante_Mascota (id_adoptante, id_mascota, fecha_adopcion) VALUES
(200, 300, '2025-07-01'),
(201, 301, '2025-07-05');

INSERT INTO Veterinario (id_veterinario, nombre, especialidad) VALUES
(400, 'Dra. Camila Pérez', 'Medicina Felina'),
(401, 'Dr. Andrés Soto', 'Medicina Canina');

INSERT INTO Mascota_Veterinario (id_mascota, id_veterinario, fecha_revision) VALUES
(300, 401, '2025-06-20'),
(301, 400, '2025-06-22');

INSERT INTO Seguimiento(id_seguimiento, id_mascota, nota) VALUES
(500, 300, 'Mascota se encuentra en buen estado de salud.'),
(501, 301, 'Requiere vacunación de refuerzo el próximo mes.');

SELECT nombre FROM Adoptante
WHERE id_adoptante IN (
    SELECT id_adoptante FROM Adoptante_Mascota
);

SELECT nombre FROM Mascota
WHERE id_mascota IN (
    SELECT id_mascota FROM Mascota_Veterinario
);

SELECT nombre FROM Refugio
WHERE id_refugio IN (
    SELECT id_refugio FROM Mascota
);

SELECT m.nombre AS mascota, v.nombre AS veterinario
FROM Mascota m
JOIN Mascota_Veterinario mv ON m.id_mascota = mv.id_mascota
JOIN Veterinario v ON mv.id_veterinario = v.id_veterinario;

SELECT m.nombre AS mascota, r.nombre AS refugio
FROM Mascota m
JOIN Refugio r ON m.id_refugio = r.id_refugio;

UPDATE Refugio SET direccion = 'Calle Nueva #10-20'
WHERE id_refugio = 100;

UPDATE Veterinario SET especialidad = 'Cirugía Veterinaria'
WHERE id_veterinario = 401;

DELETE FROM Seguimiento WHERE id_seguimiento = 501;

DELETE FROM Mascota WHERE id_mascota = 301;

SELECT UPPER(nombre) AS nombre_mayus FROM Mascota;

SELECT CONCAT(nombre, ' - ', documento) AS info FROM Adoptante;

ALTER TABLE Adoptante ADD telefono VARCHAR(20);

ALTER TABLE Mascota DROP COLUMN especie;

TRUNCATE TABLE Seguimiento;

TRUNCATE TABLE Mascota_Veterinario;

DROP TABLE Seguimiento;

DROP TABLE Mascota_Veterinario;

--4 MER
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100)
);

CREATE TABLE Producto (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10,2)
);

CREATE TABLE Empleado (
    id_empleado INT PRIMARY KEY,
    nombre VARCHAR(100),
    cargo VARCHAR(50)
);

CREATE TABLE Factura (
    id_factura INT PRIMARY KEY,
    id_cliente INT,
    id_empleado INT,
    fecha DATE,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

CREATE TABLE Proveedor (
    id_proveedor INT PRIMARY KEY,
    nombre VARCHAR(100),
    contacto VARCHAR(100)
);

CREATE TABLE Factura_Producto (
    id_factura INT,
    id_producto INT,
    cantidad INT,
    PRIMARY KEY (id_factura, id_producto),
    FOREIGN KEY (id_factura) REFERENCES Factura(id_factura),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

CREATE TABLE Producto_Proveedor (
    id_producto INT,
    id_proveedor INT,
    PRIMARY KEY (id_producto, id_proveedor),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor)
);

INSERT INTO Cliente (id_cliente, nombre, correo) VALUES
(100, 'Laura Torres', 'laura@mail.com'),
(101, 'Juan Martínez', 'juan@mail.com');

INSERT INTO Producto (id_producto, nombre, precio) VALUES
(200, 'Camisa Blanca', 45000.00),
(201, 'Pantalón Negro', 80000.00);

INSERT INTO Empleado (id_empleado, nombre, cargo) VALUES
(300, 'Sofía Herrera', 'Vendedor'),
(301, 'Carlos Díaz', 'Cajero');

INSERT INTO Factura (id_factura, id_cliente, id_empleado, fecha) VALUES
(400, 100, 300, '2025-07-01'),
(401, 101, 301, '2025-07-02');

INSERT INTO Proveedor (id_proveedor, nombre, contacto) VALUES
(500, 'Textiles S.A.S.', 'textiles@proveedor.com'),
(501, 'RopaFina Ltda.', 'ropafina@proveedor.com');

INSERT INTO Factura_Producto (id_factura, id_producto, cantidad) VALUES
(400, 200, 2),
(401, 201, 1);

INSERT INTO Producto_Proveedor (id_producto, id_proveedor) VALUES
(200, 500),
(201, 501);

SELECT nombre FROM Producto
WHERE id_producto IN (
    SELECT id_producto FROM Factura_Producto
);

SELECT nombre FROM Proveedor
WHERE id_proveedor IN (
    SELECT id_proveedor FROM producto_proveedor
    WHERE id_producto IN (SELECT id_producto FROM Factura_Producto)
);

SELECT f.id_factura, c.nombre AS cliente, e.nombre AS empleado
FROM Factura f
JOIN Cliente c ON f.id_cliente = c.id_cliente
JOIN Empleado e ON f.id_empleado = e.id_empleado;

SELECT f.id_factura, p.nombre AS producto, fp.cantidad
FROM Factura_Producto fp
JOIN Factura f ON fp.id_factura = f.id_factura
JOIN Producto p ON fp.id_producto = p.id_producto;

UPDATE Producto
SET precio = 49000.00
WHERE id_producto = 200;

UPDATE Empleado
SET cargo = 'Gerente'
WHERE id_empleado = 301;

DELETE FROM Cliente WHERE id_cliente = 101;

DELETE FROM Empleado WHERE id_empleado = 300;

SELECT UPPER(nombre) AS producto_mayus FROM Producto;

SELECT CONCAT(nombre, ' - ', cargo) AS info FROM Empleado;

ALTER TABLE Cliente ADD telefono VARCHAR(20);

ALTER TABLE Empleado DROP COLUMN cargo;

TRUNCATE TABLE Producto_Proveedor;

TRUNCATE TABLE Empleado;

DROP TABLE Factura_Producto;

DROP TABLE Factura;

--5 MER
CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100)
);

CREATE TABLE Perfil (
    id_perfil INT PRIMARY KEY,
    id_usuario INT,
    nombre VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Pelicula (
    id_pelicula INT PRIMARY KEY,
    titulo VARCHAR(100),
    duracion_min INT
);

CREATE TABLE Categoria (
    id_categoria INT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE Dispositivo (
    id_dispositivo INT PRIMARY KEY,
    nombre VARCHAR(100),
    tipo VARCHAR(50)
);

CREATE TABLE Pelicula_Categoria (
    id_pelicula INT,
    id_categoria INT,
    PRIMARY KEY (id_pelicula, id_categoria),
    FOREIGN KEY (id_pelicula) REFERENCES Pelicula(id_pelicula),
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
);

CREATE TABLE Perfil_Pelicula (
    id_perfil INT,
    id_pelicula INT,
    id_dispositivo INT,
    fecha DATETIME,
    PRIMARY KEY (id_perfil, id_pelicula, fecha),
    FOREIGN KEY (id_perfil) REFERENCES Perfil(id_perfil),
    FOREIGN KEY (id_pelicula) REFERENCES Pelicula(id_pelicula),
    FOREIGN KEY (id_dispositivo) REFERENCES Dispositivo(id_dispositivo)
);

INSERT INTO Usuario (id_usuario, nombre, correo) VALUES
(1, 'Ana Gómez', 'ana@example.com'),
(2, 'Luis Torres', 'luis@example.com');

INSERT INTO Perfil (id_perfil, id_usuario, nombre) VALUES
(10, 1, 'Ana Kids'),
(11, 2, 'Luis HD');

INSERT INTO Pelicula (id_pelicula, titulo, duracion_min) VALUES
(100, 'Inception', 148),
(101, 'Toy Story', 81);

INSERT INTO Categoria (id_categoria, nombre) VALUES
(200, 'Ciencia Ficción'),
(201, 'Animación');

INSERT INTO Dispositivo (id_dispositivo, nombre, tipo) VALUES
(300, 'Smart TV Samsung', 'TV'),
(301, 'iPhone 14', 'Móvil');

INSERT INTO Pelicula_Categoria (id_pelicula, id_categoria) VALUES
(100, 200),
(101, 201);

INSERT INTO Perfil_Pelicula (id_perfil, id_pelicula, id_dispositivo, fecha) VALUES
(10, 101, 301, '2025-07-08 18:30:00'),
(11, 100, 300, '2025-07-07 21:00:00');

SELECT titulo FROM Pelicula
WHERE id_pelicula IN (
    SELECT id_pelicula FROM Perfil_Pelicula
);

SELECT nombre FROM Categoria
WHERE id_categoria IN (
    SELECT id_categoria FROM Pelicula_Categoria
    WHERE id_pelicula IN (SELECT id_pelicula FROM Perfil_Pelicula)
);

SELECT p.nombre AS perfil, u.nombre AS usuario
FROM Perfil p
JOIN Usuario u ON p.id_usuario = u.id_usuario;

SELECT pl.titulo, c.nombre AS categoria
FROM Pelicula_Categoria pc
JOIN Pelicula pl ON pc.id_pelicula = pl.id_pelicula
JOIN Categoria c ON pc.id_categoria = c.id_categoria;

UPDATE Dispositivo
SET tipo = 'Smartphone'
WHERE id_dispositivo = 301;

UPDATE Pelicula
SET duracion_min = 150
WHERE id_pelicula = 100;

DELETE FROM Categoria WHERE id_categoria = 201;

DELETE FROM Dispositivo WHERE id_dispositivo = 300;

SELECT UPPER(titulo) AS titulo_mayus FROM Pelicula;

SELECT CONCAT(nombre, ' - ', correo) AS usuario_info FROM Usuario;

ALTER TABLE Usuario ADD pais VARCHAR(50);

ALTER TABLE Dispositivo DROP COLUMN tipo;

TRUNCATE TABLE Perfil_Pelicula;

TRUNCATE TABLE Dispositivo;

DROP TABLE Pelicula_Categoria;

DROP COLUMN Usuario;

--6 MER
CREATE TABLE Pasajero (
    id_pasajero INT PRIMARY KEY,
    nombre VARCHAR(100),
    tarjeta_id VARCHAR(50)
);

CREATE TABLE Ruta (
    id_ruta INT PRIMARY KEY,
    nombre VARCHAR(100),
    duracion_estimada INT
);

CREATE TABLE Bus (
    id_bus INT PRIMARY KEY,
    placa VARCHAR(20),
    capacidad INT
);

CREATE TABLE Conductor (
    id_conductor INT PRIMARY KEY,
    nombre VARCHAR(100),
    licencia VARCHAR(50)
);

CREATE TABLE Estacion (
    id_estacion INT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(150)
);

CREATE TABLE Bus_Ruta (
    id_bus INT,
    id_ruta INT,
    hora_salida TIME,
    PRIMARY KEY (id_bus, id_ruta),
    FOREIGN KEY (id_bus) REFERENCES Bus(id_bus),
    FOREIGN KEY (id_ruta) REFERENCES Ruta(id_ruta)
);

CREATE TABLE Ruta_Estacion (
    id_ruta INT,
    id_estacion INT,
    orden INT,
    PRIMARY KEY (id_ruta, id_estacion),
    FOREIGN KEY (id_ruta) REFERENCES Ruta(id_ruta),
    FOREIGN KEY (id_estacion) REFERENCES Estacion(id_estacion)
);

INSERT INTO Pasajero (id_pasajero, nombre, tarjeta_id) VALUES
(1, 'María Rodríguez', 'TAR123'),
(2, 'Javier Méndez', 'TAR456');

INSERT INTO Ruta (id_ruta, nombre, duracion_estimada) VALUES
(10, 'Ruta Norte', 45),
(11, 'Ruta Sur', 60);

INSERT INTO Bus (id_bus, placa, capacidad) VALUES
(100, 'ABC-123', 40),
(101, 'XYZ-789', 50);

INSERT INTO Conductor (id_conductor, nombre, licencia) VALUES
(200, 'Luis Torres', 'LIC998'),
(201, 'Diana Gómez', 'LIC887');

INSERT INTO Estacion (id_estacion, nombre, direccion) VALUES
(300, 'Estación Central', 'Cra 10 #20-30'),
(301, 'Parada Norte', 'Av 15 #45-60');

INSERT INTO Bus_Ruta (id_bus, id_ruta, hora_salida) VALUES
(100, 10, '06:30:00'),
(101, 11, '07:15:00');

INSERT INTO Ruta_Estacion (id_ruta, id_estacion, orden) VALUES
(10, 300, 1),
(10, 301, 2);

SELECT nombre FROM Ruta
WHERE id_ruta IN (
    SELECT id_ruta FROM Bus_Ruta
);

SELECT nombre FROM Estacion
WHERE id_estacion IN (
    SELECT id_estacion FROM Ruta_Estacion
);

SELECT c.nombre AS conductor, b.placa
FROM Conductor c
JOIN Bus b ON c.id_conductor = b.id_bus;

SELECT b.placa, r.nombre AS ruta
FROM Bus b
JOIN Bus_Ruta br ON b.id_bus = br.id_bus
JOIN Ruta r ON br.id_ruta = r.id_ruta;

UPDATE Estacion
SET nombre = 'Estación Norte'
WHERE id_estacion = 301;

UPDATE Bus
SET capacidad = 60
WHERE id_bus = 100;

DELETE FROM Estacion WHERE id_estacion = 300;

DELETE FROM Conductor WHERE id_conductor = 200;

SELECT MAX(duracion_estimada) AS duracion_maxima FROM Ruta;

SELECT MIN(capacidad) AS menor_capacidad FROM Bus;

ALTER TABLE Pasajero ADD telefono VARCHAR(20);

ALTER TABLE Estacion DROP COLUMN direccion;

TRUNCATE TABLE Ruta_Estacion;

TRUNCATE TABLE Conductor;

DROP TABLE Bus_Ruta;

DROP TABLE Pasajero;

--7 MER
CREATE TABLE Asistente (
    id_asistente INT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100)
);

CREATE TABLE Sala (
    id_sala INT PRIMARY KEY,
    nombre VARCHAR(50),
    capacidad INT
);

CREATE TABLE Organizador (
    id_organizador INT PRIMARY KEY,
    nombre VARCHAR(100),
    contacto VARCHAR(100)
);

CREATE TABLE Conferencia (
    id_conferencia INT PRIMARY KEY,
    id_sala INT,
    id_organizador INT,
    titulo VARCHAR(100),
    FOREIGN KEY (id_sala) REFERENCES Sala(id_sala),
    FOREIGN KEY (id_organizador) REFERENCES Organizador(id_organizador)
);

CREATE TABLE Ponente (
    id_ponente INT PRIMARY KEY,
    nombre VARCHAR(100),
    especialidad VARCHAR(100)
);

CREATE TABLE Asistente_Conferencia (
    id_asistente INT,
    id_conferencia INT,
    asistencia_confirmada BOOLEAN,
    PRIMARY KEY (id_asistente, id_conferencia),
    FOREIGN KEY (id_asistente) REFERENCES Asistente(id_asistente),
    FOREIGN KEY (id_conferencia) REFERENCES Conferencia(id_conferencia)
);

CREATE TABLE Ponente_Conferencia (
    id_ponente INT,
    id_conferencia INT,
    tema VARCHAR(100),
    PRIMARY KEY (id_ponente, id_conferencia),
    FOREIGN KEY (id_ponente) REFERENCES Ponente(id_ponente),
    FOREIGN KEY (id_conferencia) REFERENCES Conferencia(id_conferencia)
);

INSERT INTO Asistente (id_asistente, nombre, correo) VALUES
(1, 'Laura Pérez', 'laura@example.com'),
(2, 'Carlos Ríos', 'carlos@example.com');

INSERT INTO Sala (id_sala, nombre, capacidad) VALUES
(10, 'Auditorio A', 150),
(11, 'Sala B', 80);

INSERT INTO Organizador (id_organizador, nombre, contacto) VALUES
(100, 'Mariana López', 'mariana@eventos.com'),
(101, 'Sergio Díaz', 'sergio@conferencias.com');

INSERT INTO Conferencia (id_conferencia, id_sala, id_organizador, titulo) VALUES
(1000, 10, 100, 'Transformación Digital'),
(1001, 11, 101, 'Ciberseguridad en la nube');

INSERT INTO Ponente (id_ponente, nombre, especialidad) VALUES
(200, 'Dr. Andrés Vega', 'Transformación Digital'),
(201, 'Ing. Paula León', 'Ciberseguridad');

INSERT INTO Asistente_Conferencia (id_asistente, id_conferencia, asistencia_confirmada) VALUES
(1, 1000, TRUE),
(2, 1001, FALSE);

INSERT INTO Ponente_Conferencia (id_ponente, id_conferencia, tema) VALUES
(200, 1000, 'Innovación en la era digital'),
(201, 1001, 'Seguridad Zero Trust');

SELECT nombre FROM Asistente
WHERE id_asistente IN (
    SELECT id_asistente FROM Asistente_Conferencia
);

SELECT nombre FROM Sala
WHERE id_sala IN (
    SELECT id_sala FROM Conferencia
    WHERE id_organizador = (
        SELECT id_organizador FROM Organizador
        WHERE nombre = 'Sergio Díaz'
    )
);

SELECT c.titulo, o.nombre AS organizador
FROM Conferencia c
JOIN Organizador o ON c.id_organizador = o.id_organizador;

SELECT a.nombre AS asistente, cf.titulo AS conferencia
FROM Asistente_Conferencia ac
JOIN Asistente a ON ac.id_asistente = a.id_asistente
JOIN Conferencia cf ON ac.id_conferencia = cf.id_conferencia;

UPDATE Conferencia
SET titulo = 'Tecnologías Emergentes'
WHERE id_conferencia = 1000;

UPDATE Organizador
SET contacto = 'mariana@club-eventos.com'
WHERE id_organizador = 100;

DELETE FROM Asistente WHERE id_asistente = 2;

DELETE FROM Sala WHERE id_sala = 11;

SELECT UPPER(nombre) AS ponente_mayus FROM Ponente;

SELECT CONCAT(nombre, '  ', correo) AS info FROM Asistente;

ALTER TABLE Asistente ADD telefono VARCHAR(20);

ALTER TABLE Organizador DROP COLUMN contacto;

TRUNCATE TABLE Asistente_Conferencia;

TRUNCATE TABLE Sala;

DROP TABLE Ponente;

DROP TABLE Conferencia;

--8 MER
CREATE TABLE Candidato (
    id_candidato INT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100)
);

CREATE TABLE Empresa (
    id_empresa INT PRIMARY KEY,
    nombre VARCHAR(100),
    sector VARCHAR(50)
);

CREATE TABLE Vacante (
    id_vacante INT PRIMARY KEY,
    titulo VARCHAR(100),
    salario DECIMAL(10, 2),
    id_empresa INT,
    FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa)
);

CREATE TABLE Habilidad (
    id_habilidad INT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE Evaluacion (
    id_evaluacion INT PRIMARY KEY,
    id_candidato INT,
    tipo VARCHAR(50),
    resultado VARCHAR(50),
    FOREIGN KEY (id_candidato) REFERENCES Candidato(id_candidato)
);

CREATE TABLE Candidato_Habilidad (
    id_candidato INT,
    id_habilidad INT,
    nivel VARCHAR(20),
    PRIMARY KEY (id_candidato, id_habilidad),
    FOREIGN KEY (id_candidato) REFERENCES Candidato(id_candidato),
    FOREIGN KEY (id_habilidad) REFERENCES Habilidad(id_habilidad)
);

CREATE TABLE Candidato_Vacante (
    id_candidato INT,
    id_vacante INT,
    fecha_aplicacion DATE,
    PRIMARY KEY (id_candidato, id_vacante),
    FOREIGN KEY (id_candidato) REFERENCES Candidato(id_candidato),
    FOREIGN KEY (id_vacante) REFERENCES Vacante(id_vacante)
);

INSERT INTO Candidato (id_candidato, nombre, correo) VALUES
(1, 'Lucía Ramírez', 'lucia.ramirez@mail.com'),
(2, 'Andrés Torres', 'andres.torres@mail.com');

INSERT INTO Empresa (id_empresa, nombre, sector) VALUES
(10, 'TechNova', 'Tecnología'),
(11, 'Financorp', 'Finanzas');

INSERT INTO Vacante (id_vacante, titulo, salario, id_empresa) VALUES
(100, 'Desarrollador Backend', 4500000, 10),
(101, 'Analista Financiero', 3800000, 11);

INSERT INTO Habilidad (id_habilidad, nombre) VALUES
(200, 'Java'),
(201, 'Excel Avanzado');

INSERT INTO Evaluacion (id_evaluacion, id_candidato, tipo, resultado) VALUES
(300, 1, 'Entrevista Técnica', 'Aprobado'),
(301, 2, 'Prueba Psicotécnica', 'Pendiente');

INSERT INTO Candidato_Habilidad (id_candidato, id_habilidad, nivel) VALUES
(1, 200, 'Avanzado'),
(2, 201, 'Intermedio');

INSERT INTO Candidato_Vacante (id_candidato, id_vacante, fecha_aplicacion) VALUES
(1, 100, '2025-07-01'),
(2, 101, '2025-07-03');

SELECT nombre FROM Candidato
WHERE id_candidato IN (
    SELECT id_candidato FROM Candidato_Vacante
);

SELECT titulo FROM Vacante
WHERE id_empresa = (
    SELECT id_empresa FROM Empresa
    WHERE nombre = 'TechNova'
);

SELECT c.nombre, h.nombre AS habilidad, ch.nivel
FROM Candidato c
JOIN Candidato_Habilidad ch ON c.id_candidato = ch.id_candidato
JOIN Habilidad h ON ch.id_habilidad = h.id_habilidad;

SELECT v.titulo, e.nombre AS empresa
FROM Vacante v
JOIN Empresa e ON v.id_empresa = e.id_empresa;

UPDATE Vacante
SET salario = 5000000
WHERE id_vacante = 100;

UPDATE Evaluacion
SET resultado = 'Aprobado'
WHERE id_evaluacion = 301;

DELETE FROM Vacante WHERE id_vacante = 101;
 
DELETE FROM Empresa WHERE id_empresa = 11;

SELECT UPPER(nombre) AS nombre_mayuscula FROM Candidato;

SELECT CONCAT(nombre, ' - ', correo) AS datos FROM Candidato;

ALTER TABLE Empresa ADD telefono VARCHAR(20);

ALTER TABLE Evaluacion DROP COLUMN resultado;

TRUNCATE TABLE Candidato_Habilidad;

TRUNCATE TABLE Evaluacion;

DROP TABLE Vacante;

DROP TABLE Empresa;

--9 MER
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE Dispositivo (
    id_dispositivo INT PRIMARY KEY,
    tipo VARCHAR(50),
    marca VARCHAR(50),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Tecnico (
    id_tecnico INT PRIMARY KEY,
    nombre VARCHAR(100),
    especialidad VARCHAR(50)
);

CREATE TABLE Servicio (
    id_servicio INT PRIMARY KEY,
    descripcion VARCHAR(100),
    costo DECIMAL(10, 2)
);

CREATE TABLE Repuesto (
    id_repuesto INT PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL(10,2)
);

CREATE TABLE Dispositivo_Servicio (
    id_dispositivo INT,
    id_servicio INT,
    id_tecnico INT,
    fecha DATE,
    estado VARCHAR(20),
    PRIMARY KEY (id_dispositivo, id_servicio),
    FOREIGN KEY (id_dispositivo) REFERENCES Dispositivo(id_dispositivo),
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio),
    FOREIGN KEY (id_tecnico) REFERENCES Tecnico(id_tecnico)
);

CREATE TABLE Servicio_Repuesto (
    id_servicio INT,
    id_repuesto INT,
    cantidad INT,
    PRIMARY KEY (id_servicio, id_repuesto),
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio),
    FOREIGN KEY (id_repuesto) REFERENCES Repuesto(id_repuesto)
);

INSERT INTO Cliente (id_cliente, nombre, telefono) VALUES
(1, 'Carlos López', '3101234567'),
(2, 'Marta Gómez', '3209876543');

INSERT INTO Dispositivo (id_dispositivo, tipo, marca, id_cliente) VALUES
(100, 'Celular', 'Samsung', 1),
(101, 'Laptop', 'HP', 2);

INSERT INTO Tecnico (id_tecnico, nombre, especialidad) VALUES
(200, 'Luis Ramírez', 'Hardware'),
(201, 'Ana Torres', 'Software');

INSERT INTO Servicio (id_servicio, descripcion, costo) VALUES
(300, 'Cambio de pantalla', 180000),
(301, 'Formateo y optimización', 90000);

INSERT INTO Repuesto (id_repuesto, nombre, precio) VALUES
(400, 'Pantalla Samsung A12', 120000),
(401, 'SSD 256GB', 150000);

INSERT INTO Dispositivo_Servicio (id_dispositivo, id_servicio, id_tecnico, fecha, estado) VALUES
(100, 300, 200, '2025-07-01', 'Completado'),
(101, 301, 201, '2025-07-02', 'En proceso');

INSERT INTO Servicio_Repuesto (id_servicio, id_repuesto, cantidad) VALUES
(300, 400, 1),
(301, 401, 1);

SELECT descripcion FROM Servicio
WHERE id_servicio IN (
    SELECT id_servicio FROM Dispositivo_Servicio
    WHERE id_dispositivo IN (
        SELECT id_dispositivo FROM Dispositivo
        WHERE marca = 'HP'
    )
);

SELECT nombre FROM Tecnico
WHERE id_tecnico IN (
    SELECT id_tecnico FROM Dispositivo_Servicio
);

SELECT c.nombre, d.tipo, d.marca
FROM Cliente c
JOIN Dispositivo d ON c.id_cliente = d.id_cliente;

SELECT s.descripcion, r.nombre AS repuesto, sr.cantidad
FROM Servicio_Repuesto sr
JOIN Servicio s ON sr.id_servicio = s.id_servicio
JOIN Repuesto r ON sr.id_repuesto = r.id_repuesto;

UPDATE Cliente
SET telefono = '3001122334'
WHERE id_cliente = 1;

UPDATE Servicio
SET costo = costo + 10000
WHERE id_servicio = 301;

DELETE FROM Tecnico WHERE id_tecnico = 201;

DELETE FROM Dispositivo WHERE id_dispositivo = 100;

SELECT LOWER(nombre) AS cliente_min FROM Cliente;

SELECT CONCAT(tipo, ' - ', marca) AS dispositivo FROM Dispositivo;

ALTER TABLE Cliente ADD email VARCHAR(100);

ALTER TABLE Tecnico DROP COLUMN especialidad;

TRUNCATE TABLE Dispositivo_Servicio;

TRUNCATE TABLE Servicio_Repuesto;

DROP TABLE Servicio;

DROP TABLE Tecnico;

--10 MER
CREATE TABLE Estudiante (
    id_estudiante INT PRIMARY KEY,
    nombre VARCHAR(100),
    fecha_nacimiento DATE
);

CREATE TABLE Profesor (
    id_profesor INT PRIMARY KEY,
    nombre VARCHAR(100),
    especialidad VARCHAR(50)
);

CREATE TABLE Curso (
    id_curso INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT
);

CREATE TABLE Grado (
    id_grado INT PRIMARY KEY,
    nombre VARCHAR(20),
    nivel INT
);

CREATE TABLE Evaluacion (
    id_evaluacion INT PRIMARY KEY,
    id_estudiante INT,
    id_curso INT,
    nota DECIMAL(4,2),
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

CREATE TABLE Estudiante_Curso (
    id_estudiante INT,
    id_curso INT,
    fecha_inscripcion DATE,
    PRIMARY KEY (id_estudiante, id_curso),
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

CREATE TABLE Profesor_Curso (
    id_profesor INT,
    id_curso INT,
    periodo VARCHAR(20),
    PRIMARY KEY (id_profesor, id_curso),
    FOREIGN KEY (id_profesor) REFERENCES Profesor(id_profesor),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

INSERT INTO Estudiante (id_estudiante, nombre, fecha_nacimiento) VALUES
(1, 'Mariana Pérez', '2010-03-15'),
(2, 'Juan Rodríguez', '2009-09-20');

INSERT INTO Profesor (id_profesor, nombre, especialidad) VALUES
(10, 'Carlos Gómez', 'Matemáticas'),
(11, 'Laura Sánchez', 'Lengua Castellana');

INSERT INTO Curso (id_curso, nombre, descripcion) VALUES
(100, 'Álgebra', 'Curso de operaciones y ecuaciones algebraicas'),
(101, 'Literatura', 'Análisis de obras literarias clásicas y modernas');

INSERT INTO Grado (id_grado, nombre, nivel) VALUES
(1, 'Sexto', 6),
(2, 'Séptimo', 7);

INSERT INTO Evaluacion (id_evaluacion, id_estudiante, id_curso, nota) VALUES
(1000, 1, 100, 4.5),
(1001, 2, 101, 3.8);

INSERT INTO Estudiante_Curso (id_estudiante, id_curso, fecha_inscripcion) VALUES
(1, 100, '2025-01-10'),
(2, 101, '2025-01-12');

INSERT INTO Profesor_Curso (id_profesor, id_curso, periodo) VALUES
(10, 100, '2025-1'),
(11, 101, '2025-1');

SELECT nombre FROM Estudiante
WHERE id_estudiante IN (
    SELECT id_estudiante FROM Estudiante_Curso
);

SELECT nombre FROM Curso
WHERE id_curso IN (
    SELECT id_curso FROM Evaluacion
    WHERE nota > 4.0
);

SELECT e.nombre AS estudiante, c.nombre AS curso
FROM Estudiante e
JOIN Estudiante_Curso ec ON e.id_estudiante = ec.id_estudiante
JOIN Curso c ON ec.id_curso = c.id_curso;

SELECT est.nombre AS estudiante, cur.nombre AS curso, ev.nota
FROM Evaluacion ev
JOIN Estudiante est ON ev.id_estudiante = est.id_estudiante
JOIN Curso cur ON ev.id_curso = cur.id_curso;

UPDATE Estudiante
SET nombre = 'Mariana P. Pérez'
WHERE id_estudiante = 1;

UPDATE Evaluacion
SET nota = 4.8
WHERE id_evaluacion = 1000;

DELETE FROM Evaluacion WHERE id_evaluacion = 1001;

DELETE FROM Grado WHERE id_grado = 2;

SELECT UPPER(nombre) AS profesor_mayus FROM Profesor;

SELECT CONCAT(nombre, ' Nacido: ', fecha_nacimiento) AS info FROM Estudiante;

ALTER TABLE Profesor ADD correo VARCHAR(100);

ALTER TABLE Curso DROP COLUMN descripcion;

TRUNCATE TABLE Evaluacion;

TRUNCATE TABLE Estudiante_Curso;

DROP TABLE Profesor_Curso;

DROP TABLE Grado;