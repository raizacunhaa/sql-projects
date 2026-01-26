-- =====================================================
-- QUERIES SQL - NETFLIX DATABASE
-- Proyecto educativo - Curso de SQL
-- =====================================================

-- ============================
-- NIVEL INTERMEDIO
-- ============================

SELECT titulo
FROM Series
WHERE serie_id IN (
    SELECT serie_id
    FROM Episodios
    GROUP BY serie_id
    HAVING AVG(rating_imdb) > 8
);

SELECT
    titulo,
    CASE
        WHEN año_lanzamiento < 2010 THEN 'Antigua'
        ELSE 'Reciente'
    END AS Antigüedad
FROM Series;

SELECT
    titulo,
    CASE
        WHEN genero = 'Drama' THEN 'Dramático'
        WHEN genero = 'Comedia' THEN 'Divertido'
        ELSE 'Otro'
    END AS `Categoría de Género`
FROM Series;

SELECT titulo, CAST(año_lanzamiento AS CHAR) AS año_lanzamiento_texto
FROM Series;

SELECT UPPER(titulo) AS titulo_mayusculas
FROM Series;

SELECT SUBSTR(titulo, 1, 5) AS primeros_cinco_caracteres
FROM Episodios;

SELECT titulo, CEILING(rating_imdb) AS rating_redondeado
FROM Episodios;
