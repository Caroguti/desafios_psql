--1.PARTE 1

--1.1.CREACION BASE DE DATOS

CREATE DATABASE posts;
CREATE DATABASE
\c posts

--1.2. CREACION TABLA
CREATE TABLE posts (
id SERIAL,
nombre_de_usuario VARCHAR(25),
fecha_de_creación DATE,
contenido VARCHAR(100),
descripción VARCHAR(100)
);

SELECT * FROM posts;
-- id | nombre_de_usuario | fecha_de_creación | contenido | descripción 
----+-------------------+-------------------+-----------+-------------
--(0 rows)

--1.3. INSERTAR 3 POSTS
INSERT INTO posts (nombre_de_usuario,fecha_de_creación,contenido,descripción) VALUES ('Pamela','2020-05-02','Me gustó mucho el sitio! Muy útil para aprender a usar PostgreSQL y lo básico en bases de datos','positivo');

SELECT * FROM posts;
-- id | nombre_de_usuario | fecha_de_creación |                                            contenido                                            | descripción 
----+-------------------+-------------------+-------------------------------------------------------------------------------------------------+-------------
--  1 | Pamela            | 2020-05-02        | Me gustó mucho el sitio! Muy útil para aprender a usar PostgreSQL y lo básico en bases de datos | positivo
--(1 row)

INSERT INTO posts (nombre_de_usuario,fecha_de_creación,contenido,descripción) VALUES ('Pamela','2020-05-04','Hola, alguien me puede ayudar con un comando que no me funciona? Gracias!','neutro');

SELECT * FROM posts;                                                     
--id | nombre_de_usuario | fecha_de_creación |                                            contenido                                            | descripción 
----+-------------------+-------------------+-------------------------------------------------------------------------------------------------+-------------
 -- 1 | Pamela            | 2020-05-02        | Me gustó mucho el sitio! Muy útil para aprender a usar PostgreSQL y lo básico en bases de datos | positivo
 -- 2 | Pamela            | 2020-05-04        | Hola, alguien me puede ayudar con un comando que no me funciona? Gracias!                       | neutro
--(2 rows)

INSERT INTO posts (nombre_de_usuario,fecha_de_creación,contenido,descripción) VALUES ('Carlos','2020-05-02','Hola,felicitaciones por el nuevo sitio!');

INSERT INTO posts (nombre_de_usuario,fecha_de_creación,contenido,descripción) VALUES ('Felicitaciones por el nuevo sitio!','positivo');

SELECT * FROM posts; 

--id | nombre_de_usuario | fecha_de_creación | contenido |  descripción                                       
----+-------------------+-------------------+-------------------------------------------------------------------------------------------------+-------------
  --1 | Pamela            | 2020-05-02        | Me gustó mucho el sitio! Muy útil para aprender a usar PostgreSQL y lo básico en bases de datos | positivo
  --2 | Pamela            | 2020-05-04        | Hola, alguien me puede ayudar con un comando que no me funciona? Gracias!                       | neutro
  --3 | Carlos            | 2020-05-02        | Hola,felicitaciones por el nuevo sitio!                                                         | positivo
--(3 rows)


--1.4 AGREGAR COLUMNA
ALTER TABLE posts ADD título VARCHAR(25);

SELECT * FROM posts;
 --id | nombre_de_usuario | fecha_de_creación |                                            contenido                                            | descripción | título 
----+-------------------+-------------------+-------------------------------------------------------------------------------------------------+-------------+--------
  --1 | Pamela            | 2020-05-02        | Me gustó mucho el sitio! Muy útil para aprender a usar PostgreSQL y lo básico en bases de datos | positivo    | 
  --2 | Pamela            | 2020-05-04        | Hola, alguien me puede ayudar con un comando que no me funciona? Gracias!                       | neutro      | 
  --3 | Carlos            | 2020-05-02        | Hola,felicitaciones por el nuevo sitio!                                                         | positivo    | 
--(3 rows)

--1.5 AGREGAR TÍTULO A PUBLICACIONES

UPDATE posts SET título='Buenísimo sitio!' WHERE id=1;

UPDATE posts SET título='Ayuda!' WHERE id=2;

UPDATE posts SET título='Felicitaciones!!!!!!' WHERE id=3;

SELECT título FROM posts;
-- título        
----------------------
--Buenísimo sitio!
--Ayuda!
--Felicitaciones!!!!!!
--(3 rows)

--1.6 AGREGAR USUARIO

INSERT INTO posts (nombre_de_usuario,fecha_de_creación,contenido,descripción,título) VALUES ('Pedro','2020-05-10','nada especial este sitio.. más de lo mismo','negativo','Nada nuevo ;(');

--SELECT * FROM posts;
--id | nombre_de_usuario | fecha_de_creación |                                            contenido                                            | descripción |        título        
----+-------------------+-------------------+-------------------------------------------------------------------------------------------------+-------------+----------------------
  --1 | Pamela            | 2020-05-02        | Me gustó mucho el sitio! Muy útil para aprender a usar PostgreSQL y lo básico en bases de datos | positivo    | Buenísimo sitio!
  --2 | Pamela            | 2020-05-04        | Hola, alguien me puede ayudar con un comando que no me funciona? Gracias!                       | neutro      | Ayuda!
  --3 | Carlos            | 2020-05-02        | Hola,felicitaciones por el nuevo sitio!                                                         | positivo    | Felicitaciones!!!!!!
  --5 | Pedro             | 2020-05-10        | nada especial este sitio.. más de lo mismo                                                      | negativo    | Nada nuevo ;(
  --6 | Pedro             | 2020-05-10        | nada especial este sitio.. más de lo mismo                                                      | negativo    | Nada nuevo ;(
--(5 rows)

--1.7 BORRAR POST

DELETE FROM posts WHERE nombre_de_usuario='Carlos';

--1.8 AGREGAR POST

INSERT INTO posts (nombre_de_usuario,fecha_de_creación,contenido,descripción,título) VALUES ('Carlos','2020-05-02','Hello, I like the new site!!','positivo','Congratulationssss!');

SELECT * FROM posts;

 --id | nombre_de_usuario | fecha_de_creación |                                            contenido                                            | descripción |       título        
----+-------------------+-------------------+-------------------------------------------------------------------------------------------------+-------------+---------------------
 -- 1 | Pamela            | 2020-05-02        | Me gustó mucho el sitio! Muy útil para aprender a usar PostgreSQL y lo básico en bases de datos | positivo    | Buenísimo sitio!
-- 2 | Pamela            | 2020-05-04        | Hola, alguien me puede ayudar con un comando que no me funciona? Gracias!                       | neutro      | Ayuda!
-- 5 | Pedro             | 2020-05-10        | nada especial este sitio.. más de lo mismo                                                      | negativo    | Nada nuevo ;(
-- 6 | Pedro             | 2020-05-10        | nada especial este sitio.. más de lo mismo                                                      | negativo    | Nada nuevo ;(
-- 7 | Carlos            | 2020-05-02        | Hello, I like the new site!!                                                                    | positivo    | Congratulationssss!
--(5 rows)
