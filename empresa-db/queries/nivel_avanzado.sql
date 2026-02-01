-- =========================================
-- NIVEL AVANÇADO - EmpresaDB
-- =========================================

-- ENUNCIADO 1:
-- Genere un ranking de empleados basado en el total de horas asignadas
-- a proyectos.

SELECT empleado_id, 
	SUM(horas_asignadas) AS total_horas,
	DENSE_RANK() OVER(ORDER BY SUM(horas_asignadas) DESC) AS ranking_asignaciones
FROM asignacionesdeproyectos
GROUP BY empleado_id;



-- ENUNCIADO 2:
-- Para cada departamento, genere un ranking de los empleados con mayor
-- cantidad de horas asignadas a proyectos.

WITH Ranking_por_Proyecto AS(
	SELECT 
		proyecto_id, 
		SUM(horas_asignadas) AS total_horas_xproyecto
	FROM asignacionesdeproyectos
	GROUP BY proyecto_id
)
SELECT 
	proyecto_id, 
	total_horas_xproyecto,
	ROW_NUMBER() OVER(ORDER BY total_horas_xproyecto DESC) AS ranking_proyectos
FROM Ranking_por_Proyecto;


-- ENUNCIADO 3:
-- Calcular el total de horas asignadas a cada empleado y, a partir de ese resultado, clasifique a los empleados según su nivel de carga de trabajo.

-- La clasificación debe ser:

-- Alta carga: más de 40 horas

-- Carga media: entre 20 y 40 horas

-- Baja carga: menos de 20 horas

-- Sin asignaciones: empleados sin proyectos asignados


WITH ResumenHoras AS (
    SELECT 
        e.nombre,
        IFNULL(SUM(a.horas_asignadas), 0) AS total_horas
    FROM empleados e
    LEFT JOIN asignacionesdeproyectos a ON e.empleado_id = a.empleado_id
    GROUP BY e.empleado_id, e.nombre
)
SELECT 
    nombre,
    total_horas,
    CASE 
        WHEN total_horas > 40 THEN 'Alta carga'
        WHEN total_horas >= 20 THEN 'Carga media'
		WHEN total_horas > 0 THEN 'Baja carga'
        ELSE 'Sin asignaciones'
    END AS clasificacion_carga
FROM ResumenHoras
ORDER BY total_horas DESC;


-- ENUNCIADO 4:
-- Haz un ranking de proyectos basado en la cantidad de empleados
-- involucrados en cada uno.

SELECT 
    proyecto_id, 
    COUNT(empleado_id) AS cantidad_funcionarios,
    DENSE_RANK() OVER(ORDER BY COUNT(empleado_id) DESC) AS ranking_equipe
FROM asignacionesdeproyectos
GROUP BY proyecto_id;
