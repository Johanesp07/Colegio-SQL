create database Colegio

use Colegio

CREATE TABLE Estudiantes (
    EstudianteID INT IDENTITY(1,1) PRIMARY KEY, -- PK
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    FechaNacimiento DATE,
    Direccion VARCHAR(255),
    Telefono VARCHAR(15),
    Email VARCHAR(100) UNIQUE
)

CREATE TABLE Profesores (
    ProfesorID INT IDENTITY(1,1) PRIMARY KEY, -- PK
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Especialidad VARCHAR(100),
    Telefono VARCHAR(15),
    Email VARCHAR(100) UNIQUE
)

CREATE TABLE Cursos (
    CursoID INT IDENTITY(1,1) PRIMARY KEY, -- PK
    NombreCurso VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(255),
    ProfesorID INT, 
    FOREIGN KEY (ProfesorID) REFERENCES Profesores(ProfesorID) -- FK
)

CREATE TABLE Matriculas (
    MatriculaID INT IDENTITY(1,1) PRIMARY KEY, -- PK
    EstudianteID INT, 
    CursoID INT, 
    FechaMatricula DATE NOT NULL,
    FOREIGN KEY (EstudianteID) REFERENCES Estudiantes(EstudianteID), -- FK
    FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID) -- FK
)

CREATE TABLE Clases (
    ClaseID INT IDENTITY(1,1) PRIMARY KEY, -- PK
    CursoID INT, 
    FechaClase DATE NOT NULL,
    HoraInicio TIME NOT NULL,
    HoraFin TIME NOT NULL,
    FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID) -- FK
)

CREATE TABLE Asistencias (
    AsistenciaID INT IDENTITY(1,1) PRIMARY KEY, -- PK
    ClaseID INT, 
    EstudianteID INT, 
    Asistio BIT NOT NULL,
    FOREIGN KEY (ClaseID) REFERENCES Clases(ClaseID), -- FK
    FOREIGN KEY (EstudianteID) REFERENCES Estudiantes(EstudianteID) -- FK
)
