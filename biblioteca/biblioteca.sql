DROP DATABASE biblioteca;
-- me salieron mas tablas en el prestamo porque no supe como hacer el 
-- muchos a muchos ahi lo deje con 2 tablas extra
CREATE DATABASE biblioteca;

\c biblioteca

CREATE TABLE lectores
(id_lector SERIAL PRIMARY KEY,
 nombre VARCHAR(20),
 apepat VARCHAR(20),
 apemat VARCHAR(20)
);

CREATE TABLE autores
(id_autor SERIAL PRIMARY KEY ,
 nombre VARCHAR(20),
 apepat VARCHAR(20),
 apemat VARCHAR(20)
);

CREATE TABLE editoriales
(id_editorial  SERIAL PRIMARY KEY,
 nomedit VARCHAR(20)
);


CREATE TABLE prestamos
(id_prestamo  SERIAL PRIMARY KEY,
 fecha_dev DATE
);

CREATE TABLE libros
(id_libro  SERIAL PRIMARY KEY,
 titulo VARCHAR(20)
);


CREATE TABLE libro_autor
(id_libro  INT,
 id_autor INT,
 FOREIGN KEY (id_autor) REFERENCES autores(id_autor),
 FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
 
);

CREATE TABLE editorial_libro
(id_editorial  INT,
 id_libro INT,
 FOREIGN KEY (id_editorial) REFERENCES editoriales(id_editorial),
 FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);

CREATE TABLE lector_libro
(id_lector  INT,
 id_libro INT,
 FOREIGN KEY (id_lector) REFERENCES lectores(id_lector),
 FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);

CREATE TABLE prestamo_libro
(id_prestamo  INT,
 id_libro INT,
 FOREIGN KEY (id_prestamo) REFERENCES prestamos(id_prestamo),
 FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);


