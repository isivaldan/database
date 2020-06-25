DROP TABLE prueba;
DROP TABLE alumno;
DROP TABLE curso;
DROP TABLE profesor;
DROP TABLE depto;

CREATE TABLE depto
(id INT PRIMARY KEY,
 nombre VARCHAR(20)
);

CREATE TABLE profesor
(rut VARCHAR(15)PRIMARY KEY,
 nombre VARCHAR(20),
 id_depto INT,
 FOREIGN KEY (id_depto) REFERENCES depto(id)
);

CREATE TABLE curso
(id  INT PRIMARY KEY,
 nombre VARCHAR(30),
 rut_prof VARCHAR(15),
 FOREIGN KEY (rut_prof) REFERENCES profesor(rut)
);


CREATE TABLE alumno
(rut VARCHAR(15)PRIMARY KEY ,
 nombre VARCHAR(20),
 id_curso INT,
 FOREIGN KEY (id_curso) REFERENCES curso(id)
);

CREATE TABLE prueba
(id  INT PRIMARY KEY,
 puntaje INT,
 rut_alu VARCHAR(15),
 rut_prof VARCHAR(15),
 FOREIGN KEY (rut_alu) REFERENCES alumno(rut),
 FOREIGN KEY (rut_prof) REFERENCES profesor(rut)
);