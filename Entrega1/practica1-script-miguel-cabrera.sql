/* Crear la base de datos y usarla */
CREATE DATABASE MySalud;
USE MySalud;

/* Crear tablas */
CREATE TABLE Hospital (
    hospital_ID INT NOT NULL PRIMARY KEY,
    nombre CHAR(50),
    ciudad CHAR(50),
    direccion CHAR(50),
    capacidad INT
);

CREATE TABLE Paciente (
    paciente_DNI CHAR(50) NOT NULL PRIMARY KEY,
    nombre CHAR(50),
    telefono CHAR(15),
    nacimiento DATE,
    email CHAR(50)
);

CREATE TABLE Doctor (
    doctor_ID INT NOT NULL PRIMARY KEY,
    nombre CHAR(50),
    especialidad CHAR(50),
    hospital_ID INT,  -- Agregar la columna hospital_ID para la clave foránea
    FOREIGN KEY (hospital_ID) REFERENCES Hospital(hospital_ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Cita (
    cita_ID INT NOT NULL PRIMARY KEY,
    paciente_DNI CHAR(50),
    doctor_ID INT,
    fecha DATE,
    hora TIME,
    estado BOOL,
    importe INT,
    FOREIGN KEY (paciente_DNI) REFERENCES Paciente(paciente_DNI) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (doctor_ID) REFERENCES Doctor(doctor_ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Tratamiento (
    tratamiento_ID INT NOT NULL PRIMARY KEY,
    descripcion CHAR(50),
    precio INT,
    cita_ID INT,
    FOREIGN KEY (cita_ID) REFERENCES Cita(cita_ID) ON UPDATE CASCADE ON DELETE CASCADE
);

/* Mostrar resultado */
SHOW TABLES;
