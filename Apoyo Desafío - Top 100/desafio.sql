-- Requerimientos
-- 1. Crear base de datos llamada películas.
CREATE DATABASE peliculas_db;
-- con \c nos vamos a la database
\c peliculas_db

-- 2. Cargar ambos archivos a su tabla correspondiente.
CREATE TABLE peliculas(
    id SERIAL NOT NULL PRIMARY KEY,
    pelicula VARCHAR(100) NOT NULL,
    anio_estreno INT NOT NULL,
    director VARCHAR(100) NOT NULL
);

CREATE TABLE reparto(
    id SERIAL NOT NULL PRIMARY KEY,-- identificador tabla actual
    peliculas_fk BIGINT NOT NULL,-- nombre de la tabla a la que hacemos referencia
    nombre_actor VARCHAR(100) NOT NULL,
    FOREIGN KEY (peliculas_fk) REFERENCES peliculas(id)
);

-- Importando datos de un .csv
-- COPY autos FROM 'C:\Users\melan\Desktop\sql02\autos.csv' csv header; no me funciono por permisos
\copy peliculas TO 'C:\Users\melan\Desktop\desafio_top100\Apoyo Desafío - Top 100\peliculas.csv' csv header;
\copy reparto TO 'C:\Users\melan\Desktop\desafio_top100\Apoyo Desafío - Top 100\reparto.csv' csv header;


--Consultando tabla autos para verificar que se cargaron los datos
SELECT * FROM peliculas;
SELECT * FROM reparto;

-- 3. Obtener el ID de la película “Titanic”.






-- 4. Listar a todos los actores que aparecen en la película "Titanic".



-- 5. Consultar en cuántas películas del top 100 participa Harrison Ford.



-- 6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de
-- manera ascendente.
SELECT *
FROM peliculas
ORDER BY anio_estreno ASC;


-- 7. Hacer una consulta SQL que muestre los títulos con su longitud que debe ser
-- nombrado para la consulta como “longitud_titulo”.

SELECT * FROM pelicula LIMIT 20;

-- 8. Consultar cual es la longitud más grande entre todos los títulos de las películas.