DROP TABLE prestamo;
DROP TABLE libro;
DROP TABLE lector;

CREATE DATABASE biblioteca;

\c biblioteca

CREATE TABLE lector
(id INT PRIMARY KEY,
 nombre VARCHAR(50)
);

CREATE TABLE libro
(cod INT PRIMARY KEY ,
 titulo VARCHAR(50),
 autor VARCHAR(50),
 editorial VARCHAR(50)
);

CREATE TABLE prestamo
(id  INT PRIMARY KEY,
 cod_lib INT,
 id_lec INT,
 fecha_dev DATE,
 FOREIGN KEY (cod_lib) REFERENCES libro(cod),
 FOREIGN KEY (id_lec) REFERENCES lector(id)
);