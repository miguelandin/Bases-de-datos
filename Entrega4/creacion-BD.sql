DROP DATABASE IF EXISTS BlocNotas;
CREATE DATABASE BlocNotas;
USE BlocNotas;

--- crear tablas ---
CREATE TABLE Usuario (
    usuarioID INT NOT NULL PRIMARY KEY,
    nombre_completo CHAR(50),
    nombre_usuario CHAR(50),
    contraseña CHAR(50) NOT NULL,
    fecha_alta DATE
);

CREATE TABLE Bloc (
    blocID INT NOT NULL PRIMARY KEY,
    usuarioID INT,
    fecha_creacion DATE,
    nombre CHAR(50),
    FOREIGN KEY (usuarioID) REFERENCES Usuario(usuarioID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Adjunto (
    adjuntoID INT NOT NULL PRIMARY KEY,
    fecha_modificacion DATE,
    ruta_al_contenido CHAR(50)
);

CREATE TABLE Tag (
    tagID INT NOT NULL PRIMARY KEY,
    nombre CHAR(50)
);

CREATE TABLE Nota (
    notaID INT NOT NULL PRIMARY KEY,
    blocID INT,
    tagID INT,
    adjuntoID INT,
    texto TEXT,
    titulo CHAR(50),
    fecha_alta DATE,
    fecha_modificacion DATE,
    FOREIGN KEY (blocID) REFERENCES Bloc(blocID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (tagID) REFERENCES Tag(tagID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (adjuntoID) REFERENCES Adjunto(adjuntoID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Cambio (
    cambioID INT NOT NULL PRIMARY KEY,
    notaID INT,
    FOREIGN KEY (notaID) REFERENCES Nota(notaID) ON UPDATE CASCADE ON DELETE CASCADE
);

--- insertar datos --- 
INSERT INTO Usuario(usuarioID, nombre_completo, nombre_usuario, contraseña, fecha_alta) VALUES
(1, 'Jhon Pork', 'stinkyFattas69', '12341231', '2020-01-01'),
(2, 'María López', 'marial', 'password2', '2023-01-02'),
(3, 'Carlos García', 'carlosg', 'password3', '2023-01-03'),
(4, 'Ana Martínez', 'anam', 'password4', '2023-01-04'),
(5, 'Luis Fernández', 'luisf', 'password5', '2023-01-05'),
(6, 'Sofía Torres', 'sofiat', 'password6', '2023-01-06');

INSERT INTO Bloc(blocID, usuarioID, fecha_creacion, nombre) VALUES
(1, 1, '2023-01-01', 'Bloc Personal'),
(2, 1, '2023-01-02', 'Bloc de Trabajo'),
(3, 2, '2023-01-03', 'Bloc de Estudio'),
(4, 3, '2023-01-04', 'Bloc de Proyectos'),
(5, 4, '2023-01-05', 'Bloc de Ideas'),
(6, 5, '2023-01-06', 'Bloc de Notas'),
(7, 6, '2023-01-07', 'Bloc de Viajes'),
(8, 6, '2023-01-08', 'Bloc de Recetas');

INSERT INTO Adjunto(adjuntoID, fecha_modificacion, ruta_al_contenido) VALUES
(1, '2023-01-01', '/path/to/adjunto1.pdf'),
(2, '2023-01-02', '/path/to/adjunto2.pdf'),
(3, '2023-01-03', '/path/to/adjunto3.pdf'),
(4, '2023-01-04', '/path/to/adjunto4.pdf'),
(5, '2023-01-05', '/path/to/adjunto5.pdf');

INSERT INTO Tag(tagID, nombre) VALUES
(1, 'Importante'),
(2, 'Urgente'),
(3, 'Revisar'),
(4, 'Finalizado'),
(5, 'Pendiente'),
(6, 'Ideas'),
(7, 'Notas'),
(8, 'Trabajo'),
(9, 'Personal'),
(10, 'Estudio');

INSERT INTO Nota (notaID, blocID, tagID, adjuntoID, texto, titulo, fecha_alta, fecha_modificacion) VALUES
(1, 1, 1, 1, 'Texto de la nota 1', 'Nota 1', '2023-01-01', '2023-01-01'),
(2, 1, 2, 2, 'Texto de la nota 2', 'Nota 2', '2023-01-02', '2023-01-02'),
(3, 2, 3, 3, 'Texto de la nota 3', 'Nota 3', '2023-01-03', '2023-01-03'),
(4, 3, 4, 4, 'Texto de la nota 4', 'Nota 4', '2023-01-04', '2023-01-04'),
(5, 4, 5, 5, 'Texto de la nota 5', 'Nota 5', '2023-01-05', '2023-01-05'),
(6, 5, 6, NULL, 'Texto de la nota 6', 'Nota 6', '2023-01-06', '2023-01-06'),
(7, 6, 7, NULL, 'Texto de la nota 7', 'Nota 7', '2023-01-07', '2023-01-07');

INSERT INTO Cambio(cambioID, notaID) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 5),
(6, 5);
