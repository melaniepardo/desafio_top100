-- Requerimientos desafio
-- 1. Crear base de datos llamada películas.
CREATE DATABASE peliculas_db;

-- con \c nos vamos a la database
\ c peliculas_db -- 2. Cargar ambos archivos a su tabla correspondiente.
CREATE TABLE peliculas(
    id BIGINT NOT NULL PRIMARY KEY,
    pelicula VARCHAR(100) NOT NULL,
    anio_estreno INT NOT NULL,
    director VARCHAR(100) NOT NULL
);

CREATE TABLE reparto(
    peliculas_fk BIGINT NOT NULL,
    nombre_actor VARCHAR(255) NOT NULL,
    FOREIGN KEY (peliculas_fk) REFERENCES peliculas(id)
);

-- Importando datos de un .csv
\ COPY peliculas
FROM
    'C:/Users/melan/Desktop/peliculas.csv' csv header;

-- no me funciono por permisos \ COPY reparto
-- FROM
'C:/Users/melan/Desktop/reparto.csv' csv;

--Consultando tablas para verificar que se cargaron los datos
SELECT
    *
FROM
    peliculas;

SELECT
    *
FROM
    reparto;

-- 3. Obtener el ID de la película “Titanic”. (no poner con comillas doble Titanic)
SELECT
    id
FROM
    peliculas
WHERE
    pelicula = 'Titanic';

-- 4. Listar a todos los actores que aparecen en la película "Titanic".
SELECT
    *
FROM
    reparto
WHERE
    peliculas_fk = 2;

-- 5. Consultar en cuántas películas del top 100 participa Harrison Ford.
SELECT
    COUNT(nombre_actor)
FROM
    reparto
WHERE
    nombre_actor = 'Harrison Ford';

-- 6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de
-- SELECT peliculas
-- FROM peliculas
-- [WHERE anio_estreno >=1990 y <=1999]
-- ORDER BY titulo [DESC | ASC];
SELECT
    *
FROM
    peliculas
WHERE
    anio_estreno BETWEEN 1990
    AND 1999
ORDER BY
    pelicula ASC;

-- 7. Hacer una consulta SQL que muestre los títulos con su longitud que debe ser
-- nombrado para la consulta como “longitud_titulo”.
-- seleccionaremos el largo de los titulos
SELECT
    LENGTH(pelicula) -- y le asignaremos el nombre longitud_titulo
    AS longitud_titulo -- de la tabla peliculas
FROM
    peliculas;

SELECT
    LENGTH(pelicula) AS longitud_titulo
FROM
    peliculas;

-- 8. Consultar cual es la longitud más grande entre todos los títulos de las películas.
SELECT
    MAX(LENGTH(pelicula)) AS longitud_titulo_max
FROM
    peliculas;

-- o tambien si usted quisiera ver los titulos de las peliculas en orden descendente, usar el siguiente codigo:
-- SELECT
--     pelicula,
--     MAX(LENGTH(pelicula)) AS longitud_titulo_max
-- FROM
--     peliculas
-- GROUP BY
--     pelicula
-- ORDER BY
--     longitud_titulo_max DESC;