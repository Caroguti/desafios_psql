--1. Crear base de datos llamada películas (1 punto)

CREATE DATABASE peliculas
\c peliculas

--2. Revisar los archivos peliculas.csv y reparto.csv para crear las tablas correspondientes, determinando la relación entre ambas tablas. (2 puntos)
-- 3. Cargar ambos archivos a su tabla correspondiente (1 punto)

CREATE TABLE peliculas(
    id SERIAL,
    Película VARCHAR(100),
    Año_estreno INT,
    Director VARCHAR(50),
    PRIMARY KEY (id)
);

\copy peliculas FROM '/Users/jose/Desktop/DesafioLatam/Modulo3_Database/Desafíos/desafio_2/peliculas.csv' csv header;

CREATE TABLE repartos(
    id INT,
    nombre_actor VARCHAR(50),
    FOREIGN KEY (id) REFERENCES peliculas (id)
);

\copy reparto FROM '/Users/jose/Desktop/DesafioLatam/Modulo3_Database/Desafíos/desafio_2/reparto.csv' csv;

-- 4. Listar todos los actores que aparecen en la película "Titanic", indicando el título de la película, año de estreno, director y todo el reparto. (0.5 puntos)
SELECT Película, Año_estreno, Director,nombre_actor 
FROM peliculas 
JOIN repartos ON peliculas.id=repartos.id 
WHERE Película='Titanic';

-- 5. Listar los titulos de las películas donde actúe Harrison Ford.(0.5 puntos)
SELECT Película
FROM peliculas 
JOIN repartos 
ON peliculas.id=repartos.id 
WHERE nombre_actor='Harrison Ford';

-- 6. Listar los 10 directores mas populares, indicando su nombre y cuántas películas aparecen en el top 100.(1 puntos)

SELECT Director, COUNT(Director) AS numero_pelicula
FROM peliculas
GROUP BY Director
ORDER BY numero_pelicula DESC
LIMIT 10;

-- 7. Indicar cuantos actores distintos hay (1 puntos)
SELECT COUNT (DISTINCT nombre_actor) 
FROM repartos;
 
-- 8. Indicar las películas estrenadas entre los años 1990 y 1999 (ambos incluidos) ordenadas por título de manera ascendente.(1 punto)
SELECT Película, Año_estreno
FROM peliculas 
WHERE Año_estreno BETWEEN '1990' AND '1999' 
ORDER BY Película ASC;

-- 9. Listar el reparto de las películas lanzadas el año 2001 (1 punto)
SELECT Película, nombre_actor 
FROM peliculas 
JOIN repartos 
ON peliculas.id=repartos.id 
WHERE Año_estreno='2001';

-- 10. Listar los actores de la película más nueva (1 punto)
SELECT Año_estreno, Película, nombre_actor 
FROM peliculas 
JOIN repartos 
ON peliculas.id=repartos.id 
WHERE Año_estreno=(SELECT max(Año_estreno) 
FROM peliculas);
