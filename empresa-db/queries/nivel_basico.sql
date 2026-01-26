-- =====================================================
-- QUERIES SQL - EMPRESA DATABASE
-- =====================================================


-- ============================
-- NIVEL BÁSICO
-- ============================

-- ENUNCIADO 1:
-- Liste todos os departamentos cadastrados na empresa.
SELECT * FROM departamentos;


-- ENUNCIADO 2:
-- Liste o nome e o email de todos os funcionários.
SELECT nombre, email FROM empleados; 


-- ENUNCIADO 3:
-- Liste os funcionários que pertencem a um departamento específico.
SELECT nombre, apellido FROM empleados WHERE depto_id = 1;


-- ENUNCIADO 4:
-- Liste os nomes dos projetos que já possuem data de início definida.
SELECT nombre FROM Proyectos WHERE fecha_inicio IS NOT NULL;


-- ENUNCIADO 5:
-- Liste todas as atribuições de projetos com mais de 20 horas alocadas.
select proyecto_id, empleado_id, horas_asignadas from asignacionesdeproyectos where horas_asignadas >= 20;

