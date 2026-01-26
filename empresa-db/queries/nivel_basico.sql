-- =====================================================
-- QUERIES SQL - EMPRESA DATABASE
-- =====================================================


-- ============================
-- NIVEL BÁSICO
-- ============================

-- ENUNCIADO 1:
-- Liste todos los departamentos registrados en la empresa.
SELECT * FROM departamentos;


-- ENUNCIADO 2:
-- Liste el nombre y el correo electrónico de todos los empleados.
SELECT nombre, email FROM empleados; 


-- ENUNCIADO 3:
-- Liste los empleados que pertenecen a un departamento específico.
SELECT nombre, apellido FROM empleados WHERE depto_id = 1;


-- ENUNCIADO 4:
-- Liste los nombres de los proyectos que ya tienen una fecha de inicio definida.
SELECT nombre FROM Proyectos WHERE fecha_inicio IS NOT NULL;


-- ENUNCIADO 5:
-- Liste todas las asignaciones de proyectos con más de 20 horas asignadas.
SELECT proyecto_id, empleado_id, horas_asignadas
FROM asignacionesdeproyectos
WHERE horas_asignadas >= 20;
