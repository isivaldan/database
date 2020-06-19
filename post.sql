DROP DATABASE posts
DROP TABLE post;
DROP TABLE comments;
--Parte 1
--1. Crear Base de datos posts 
CREATE DATABASE posts;
--2. Crear tabla post, con los atributos id, nombre de usuario, fecha de creación, contenido,descripción 
\c posts

CREATE TABLE post
(id INT PRIMARY KEY,
 username VARCHAR(30),
 creation_date DATE,
 post VARCHAR(300),
 descript VARCHAR(100)
);
--3. Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos" (0.6 puntos)

INSERT INTO post
(id, username, creation_date, post, descript) 
VALUES (1,'Pamela', '2020-06-08','"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','Excepteur sint occaecat cupidatat non proident');

INSERT INTO post
(id, username, creation_date, post, descript) 
VALUES(2,'Pamela', '2020-05-20','"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','Excepteur sint occaecat cupidatat non proident');

INSERT INTO post
(id, username, creation_date, post, descript) 
VALUES(3,'Carlos', '2020-03-08','"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','Excepteur sint occaecat cupidatat non proident');
--4. Modificar la tabla post, agregando la columna título (1 punto)

ALTER TABLE post
ADD title VARCHAR(50);

--5. Agregar título a las publicaciones ya ingresadas ( (1 punto)
UPDATE post
SET title='Lorem ipsum'
WHERE id= 1;
UPDATE post
SET title='Lorem ipsum'
WHERE id= 2;
UPDATE post
SET title='Lorem ipsum'
WHERE id= 3;
--6. Insertar 2 post para el usuario "Pedro" (0.4 puntos)
INSERT INTO post
(id, username, creation_date, post, descript,title) 
VALUES(4,'Pedro', '2020-06-10','"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','Excepteur sint occaecat cupidatat non proident','Lorem ipsum');
INSERT INTO post
(id, username, creation_date, post, descript,title) 
VALUES(5,'Pedro', '2020-01-23','"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','Excepteur sint occaecat cupidatat non proident','Lorem ipsum');

--7. Eliminar el post de Carlos (1 punto)

DELETE FROM post WHERE username='Carlos';

--8. Ingresar un nuevo post para el usuario "Carlos" (0.6 puntos)
INSERT INTO post (id, username, creation_date, post, descript,title) 
VALUES(6,'Carlos', '2020-04-23','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','Excepteur sint occaecat cupidatat non proident','Lorem ipsum');



--Parte 2

--9. Crear una nueva tabla, llamada comentarios, con los atributos id, fecha y hora de creación,contenido, que se relacione con la tabla posts. (1 punto)

CREATE TABLE comments
(id SERIAL,
 creation_time TIMESTAMP,
 post VARCHAR(300),
 post_id INT,
FOREIGN KEY (post_id) REFERENCES post(id)
);
--10. Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos" (0.4 puntos)
--Pamela
INSERT INTO comments (creation_time, post, post_id) 
VALUES( '2020-01-01 12:00:00+00','Lorem ipsum dolor sit amet, consectetur.',1);
INSERT INTO comments (creation_time, post, post_id) 
VALUES( '2020-01-14 18:00:00+00','Lorem ipsum dolor sit amet, consectetur.',1);
--Carlos
INSERT INTO comments (creation_time, post, post_id) 
VALUES( '2020-01-14 18:00:00+00','Lorem ipsum dolor sit amet, consectetur.',6);
INSERT INTO comments (creation_time, post, post_id) 
VALUES( '2020-01-14 18:00:00+00','Lorem ipsum dolor sit amet, consectetur.',6);
INSERT INTO comments (creation_time, post, post_id) 
VALUES( '2020-01-14 18:00:00+00','Lorem ipsum dolor sit amet, consectetur.',6);
INSERT INTO comments (creation_time, post, post_id) 
VALUES( '2020-01-14 18:00:00+00','Lorem ipsum dolor sit amet, consectetur.',6);
--11. Crear un nuevo post para "Margarita" (1 punto)

INSERT INTO post (id, username, creation_date, post, descript,title) 
VALUES(7,'Matgarita', '2020-04-23','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','Excepteur sint occaecat cupidatat non proident','Lorem ipsum');


--12. Ingresar 5 comentarios para el post de Margarita. (1 punto)
INSERT INTO comments (creation_time, post, post_id) 
VALUES( '2020-01-14 18:00:00+00','Lorem ipsum dolor sit amet, consectetur.',7);
INSERT INTO comments (creation_time, post, post_id) 
VALUES('2020-01-14 18:00:00+00','Lorem ipsum dolor sit amet, consectetur.',7);
INSERT INTO comments (creation_time, post, post_id) 
VALUES( '2020-01-14 18:00:00+00','Lorem ipsum dolor sit amet, consectetur.',7);
INSERT INTO comments (creation_time, post, post_id) 
VALUES( '2020-01-14 18:00:00+00','Lorem ipsum dolor sit amet, consectetur.',7);
INSERT INTO comments (creation_time, post, post_id) 
VALUES( '2020-01-14 18:00:00+00','Lorem ipsum dolor sit amet, consectetur.',7);