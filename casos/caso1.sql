DROP TABLE liquidacion;
DROP TABLE trabajador;
DROP TABLE departamento;



CREATE TABLE departamento
(id INT PRIMARY KEY,
 nombre VARCHAR(20)
);

CREATE TABLE trabajador
(rut VARCHAR(15)PRIMARY KEY ,
 nombre VARCHAR(30),
 direccion VARCHAR(50),
 id_depto INT,
 FOREIGN KEY (id_depto) REFERENCES departamento(id)
);

CREATE TABLE liquidacion
(id  INT PRIMARY KEY,
 rut_t VARCHAR(15),
 monto INT,
 FOREIGN KEY (rut_t) REFERENCES trabajador(rut)
);