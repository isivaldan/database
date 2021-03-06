
DROP DATABASE ventas;
--Parte 1: Crear modelo lógico para el siguiente caso
CREATE DATABASE ventas;
\c ventas

CREATE TABLE categorias
(id INT PRIMARY KEY,
 nombre VARCHAR(20),
 descrip VARCHAR(50)
);

CREATE TABLE clientes
( id INT PRIMARY KEY,
rut VARCHAR(15),
 nombre VARCHAR(20),
 direccion VARCHAR(30)
);

CREATE TABLE productos
(id  INT PRIMARY KEY,
 nombre VARCHAR(20),
 descrip VARCHAR(50),
 valor FLOAT,
 id_cat INT,
 FOREIGN KEY (id_cat) REFERENCES categorias(id)
);


CREATE TABLE facturas
(num_fact INT PRIMARY KEY ,
 fecha_fact DATE,
 sub_total FLOAT,
 iva FLOAT,
 total FLOAT,
 id_cliente INT,
 FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

CREATE TABLE ventas
(id_fact  INT ,
 id_prod INT,
 cantidad INT,
 FOREIGN KEY (id_fact) REFERENCES facturas(num_fact),
 FOREIGN KEY (id_prod) REFERENCES productos(id)
);

-- Parte 2: Creando el modelo en la base de datos
-- Se debe crear el modelo en la base de datos, en una base de datos llamada prueba, e insertar los siguientes registros:


-- 5 clientes
INSERT INTO clientes (id, rut, nombre, direccion) 
    VALUES  ( 1,    '9512238-8',   'Daniela',  'Toesca 267'),
            ( 2,    '19814388-k',   'Andres',   'Padre las casas 321'),
            ( 3,    '17333539-3',   'Carlos',   'Alameda 455'),
            ( 4,    '19116377-k',   'Trinidad', 'Pajaritos 267'),
            ( 5,    '18597094-9',   'Mariela',  'Padre Hurtado 267');




-- 3 categorias
INSERT INTO categorias (id, nombre, descrip) 
    VALUES  ( 1,    'Vestuario',    'Ropa distinta'), 
            ( 2,    'Electronica',  'Celulares, notebooks, TV'), 
            ( 3,    'Deportes',     'Accesorios para deportes');



-- 8 productos
INSERT INTO productos (id, nombre, descrip, valor, id_cat) 
    VALUES  ( 1,    'Camisa',           'camisa formal',        20,     1), 
            ( 2,    'Pantalon',         'Pantalon formal',      25,     1), 
            ( 3,    'baston trekking',  'baston de trekking ',  15,     3), 
            ( 4,    'Pelota',           'Pelota futbol ',       10,     3), 
            ( 5,    'Celular',          'Celular I Phone',      100,    2), 
            ( 6,    'TV',               'TV AOC',               150,    2), 
            ( 7,    'Camara',           'Camara Canon',         130,    2), 
            ( 8,    'Notebook',         'Notebook HP',          200,    2);


-- 10 facturas



-- Para el cliente 1: 2 facturas con 2 y 3 productos respectivamente
INSERT INTO facturas (num_fact, fecha_fact, sub_total, iva, total,id_cliente ) 
    VALUES  ( 1, '2020-02-02', 45, 0.19, 53.55, 1);

INSERT INTO ventas (id_fact, id_prod, cantidad ) 
    VALUES  ( 1, 1, 1),
            ( 1, 2, 1);

INSERT INTO facturas (num_fact, fecha_fact, sub_total, iva, total,id_cliente ) 
    VALUES  ( 2, '2020-02-18', 135, 0.19, 160.65, 1);

INSERT INTO ventas (id_fact, id_prod, cantidad ) 
    VALUES  ( 2, 3, 1), 
            ( 2, 4, 1), 
            ( 2, 5, 1);



-- Para el cliente 2: 3 facturas con 3, 2 y 3 productos respectivamente
INSERT INTO facturas (num_fact, fecha_fact, sub_total, iva, total,id_cliente ) 
    VALUES( 3, '2020-02-18', 50, 0.19, 58, 2); 

INSERT INTO ventas (id_fact, id_prod, cantidad ) 
    VALUES  ( 3, 2, 1), 
            ( 3, 3, 1), 
            ( 3, 4, 1);

INSERT INTO facturas (num_fact, fecha_fact, sub_total, iva, total,id_cliente ) 
    VALUES  ( 4, '2020-02-18', 110, 0.19, 130.9, 2);

INSERT INTO ventas (id_fact, id_prod, cantidad ) 
    VALUES  ( 4, 5, 1), 
            ( 4, 6, 1);

INSERT INTO facturas (num_fact, fecha_fact, sub_total, iva, total,id_cliente ) 
    VALUES  ( 5,'2020-02-18', 60, 0.19, 62.85, 2);

INSERT INTO ventas (id_fact, id_prod, cantidad ) 
    VALUES  ( 5, 1, 1), 
            ( 5, 2, 1), 
            ( 5, 3, 1);




-- para el cliente 3: 1 factura con 1 producto
INSERT INTO facturas (num_fact, fecha_fact, sub_total, iva, total,id_cliente ) 
    VALUES  ( 6, '2020-02-18', 200, 0.19, 238, 3);

INSERT INTO ventas (id_fact, id_prod, cantidad ) 
    VALUES  ( 6, 8, 1);




-- para el cliente 4: 4 facturas con 2, 3, 4 y 1 productos respectivamente
INSERT INTO facturas (num_fact, fecha_fact, sub_total, iva, total,id_cliente ) 
    VALUES  ( 7, '2020-02-04', 45, 0.19, 53.55, 4);
INSERT INTO ventas (id_fact, id_prod, cantidad ) 
    VALUES  ( 7, 1, 1), 
            ( 7, 2, 1);

INSERT INTO facturas (num_fact, fecha_fact, sub_total, iva, total,id_cliente ) 
    VALUES  ( 8, '2020-04-18', 60, 0.19, 62.85, 4);
INSERT INTO ventas (id_fact, id_prod, cantidad ) 
    VALUES  ( 8, 1, 1), 
            ( 8, 2, 1),        
            ( 8, 3, 1);

INSERT INTO facturas (num_fact, fecha_fact, sub_total, iva, total,id_cliente ) 
    VALUES  ( 9, '2020-05-18', 580, 0.19, 690.2, 4);
INSERT INTO ventas (id_fact, id_prod, cantidad ) 
    VALUES  ( 9, 5, 1), 
            ( 9, 6, 1), 
            ( 9, 7, 1), 
            ( 9, 8, 1);

INSERT INTO facturas (num_fact, fecha_fact, sub_total, iva, total,id_cliente ) 
    VALUES  ( 10, '2020-02-18', 100, 0.19, 119, 4);
INSERT INTO ventas (id_fact, id_prod, cantidad ) 
    VALUES  ( 10, 5, 1);

-- Parte 3: Consultas q
-- Realizar las siguientes consultas:
-- ¿Que cliente realizó la compra más cara?
SELECT nombre FROM clientes
JOIN facturas ON clientes.id=facturas.id_cliente 
WHERE facturas.total=(SELECT MAX(total) FROM facturas);

-- ¿Que cliente pagó sobre 100 de monto?
SELECT DISTINCT nombre FROM clientes
JOIN facturas ON clientes.id=facturas.id_cliente 
WHERE facturas.total>100;

-- ¿Cuantos clientes han comprado el producto 6.
SELECT DISTINCT count(nombre) FROM clientes
JOIN facturas ON clientes.id=facturas.id_cliente 
JOIN ventas ON facturas.num_fact=ventas.id_fact 
WHERE ventas.id_prod=6;