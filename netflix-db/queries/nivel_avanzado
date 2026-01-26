-- =====================================================
-- QUERIES SQL - NETFLIX DATABASE
-- =====================================================

-- ============================
-- NIVEL AVANZADO
-- ============================

WITH PrimerEpisodio AS (
    SELECT serie_id, MIN(fecha_estreno) AS fecha_primer_episodio
    FROM Episodios
    GROUP BY serie_id
)
SELECT
    s.titulo AS `Título de la Serie`,
    p.fecha_primer_episodio AS `Fecha del Primer Episodio`
FROM Series s
JOIN PrimerEpisodio p ON s.serie_id = p.serie_id
ORDER BY p.fecha_primer_episodio;

WITH SeriesPorAño AS (
    SELECT año_lanzamiento, COUNT(*) AS total_series
    FROM Series
    WHERE genero = 'Ciencia ficción'
    GROUP BY año_lanzamiento
)
SELECT * FROM SeriesPorAño
ORDER BY año_lanzamiento;

SELECT
    titulo,
    año_lanzamiento,
    ROW_NUMBER() OVER (ORDER BY año_lanzamiento DESC) AS clasificacion_global
FROM Series;

SELECT
    temporada,
    titulo,
    fecha_estreno,
    ROW_NUMBER() OVER (
        PARTITION BY temporada
        ORDER BY fecha_estreno DESC
    ) AS ranking_temporada
FROM Episodios;

SELECT
    temporada,
    titulo,
    rating_imdb,
    ROW_NUMBER() OVER (
        PARTITION BY temporada
        ORDER BY rating_imdb DESC
    ) AS ranking_imdb
FROM Episodios
WHERE serie_id = 2;

SELECT
    titulo,
    rating_imdb,
    RANK() OVER (ORDER BY rating_imdb DESC) AS ranking_imdb
FROM Episodios;

SELECT
    titulo,
    duracion,
    DENSE_RANK() OVER (ORDER BY duracion DESC) AS ranking_por_duracion
FROM Episodios
ORDER BY ranking_por_duracion;
