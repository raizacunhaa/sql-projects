-- =====================================================
-- QUERIES SQL - NETFLIX DATABASE
-- =====================================================


-- ============================
-- NIVEL BÁSICO
-- ============================

SELECT * FROM Actores;

SELECT titulo, temporada FROM Episodios;

SELECT DISTINCT año_lanzamiento
FROM Series
ORDER BY año_lanzamiento DESC;

SELECT nombre, fecha_nacimiento
FROM Actores
ORDER BY fecha_nacimiento DESC;

SELECT nombre
FROM Actores
LIMIT 5;

SELECT *
FROM Series
WHERE genero = 'Comedia';

SELECT titulo, año_lanzamiento
FROM Series
WHERE año_lanzamiento > 2020;

SELECT *
FROM Series
WHERE genero IN ('Drama', 'Ciencia ficción');

SELECT *
FROM Series
WHERE genero NOT IN ('Drama', 'Drama histórico');

SELECT titulo
FROM Series
WHERE titulo LIKE '%The%';

SELECT SUM(duracion) AS duracion_total
FROM Episodios;

SELECT año_lanzamiento, COUNT(*) AS total_series
FROM Series
GROUP BY año_lanzamiento;

SELECT temporada, SUM(duracion) AS duracion_total
FROM Episodios
WHERE serie_id = 2
GROUP BY temporada
HAVING SUM(duracion) > 400;


-- ============================
-- JOINS
-- ============================

SELECT *
FROM Series s
JOIN Episodios e ON s.serie_id = e.serie_id;

SELECT
    s.titulo AS titulo_serie,
    e.titulo AS titulo_episodio,
    e.duracion
FROM Series s
JOIN Episodios e ON s.serie_id = e.serie_id
WHERE s.titulo = 'Stranger Things';

SELECT
    s.titulo AS `Título de la Serie`,
    e.titulo AS `Título del Episodio`,
    e.rating_imdb AS `Rating IMDB`
FROM Series s
JOIN Episodios e ON s.serie_id = e.serie_id
WHERE s.titulo = 'Stranger Things'
ORDER BY e.rating_imdb DESC;
