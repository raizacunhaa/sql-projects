-- =====================================================
-- QUERIES SQL - NETFLIX DATABASE
-- =====================================================

-- ============================
-- NIVEL INTERMEDIO
-- ============================


-- ENUNCIADO 1:
-- Muestra el nombre completo (nombre y apellido) de cada empleado
-- junto con el nombre del departamento al que pertenece.

SELECT 
    CONCAT(e.nombre, ' ', e.apellido) AS funcionario,
    d.nombre AS departamento
FROM empleados e
JOIN departamentos d
    ON e.depto_id = d.depto_id;


-- ENUNCIADO 2:
-- Muestra el nombre de cada departamento y la cantidad total
-- de empleados que pertenecen a cada uno.

SELECT
    d.nombre AS departamento,
    COUNT(e.empleado_id) AS total_funcionarios
FROM empleados e
JOIN departamentos d
    ON e.depto_id = d.depto_id
GROUP BY d.nombre;


-- ENUNCIADO 3:
-- Calcula el total de horas asignadas por proyecto.
-- El resultado debe mostrar el identificador del proyecto
-- y el total de horas asignadas.

SELECT 
    a.proyecto_id AS proyecto,
    SUM(a.horas_asignadas) AS total_horas_por_proyecto
FROM asignacionesdeproyectos a
GROUP BY a.proyecto_id;


-- ENUNCIADO 4:
-- Muestra únicamente los proyectos cuyo total de horas asignadas
-- sea mayor a 100 horas.

SELECT 
    a.proyecto_id AS proyecto,
    SUM(a.horas_asignadas) AS total_horas_por_proyecto
FROM asignacionesdeproyectos a
GROUP BY a.proyecto_id
HAVING SUM(a.horas_asignadas) > 100;


-- ENUNCIADO 5:
-- Muestra el nombre de todos los empleados y una columna adicional
-- que indique si el empleado está asignado a algún proyecto o no.
-- La columna debe mostrar:
-- 'asignado' si tiene al menos una asignación,
-- 'sin proyecto' si no tiene ninguna.

SELECT 
    e.nombre,
    CASE 
        WHEN a.asignacion_id IS NOT NULL THEN 'asignado'
        ELSE 'sin proyecto'
    END AS situacion
FROM empleados e
LEFT JOIN asignacionesdeproyectos a
    ON e.empleado_id = a.empleado_id;
