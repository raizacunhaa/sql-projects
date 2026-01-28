#EmpresaDB

Proyecto SQL basado en un banco de datos ficticios, diseñado para practicar y consolidar conceptos fundamentales y avanzados de SQL.

## 🎯 Objetivo

El objetivo de este proyecto es ejercer consultas SQL en un contexto empresarial realista, explorando relaciones entre funcionarios, departamentos, proyectos y ubicaciones de trabajo.

El banco fue utilizado como base para la creación de ejercicios organizados por nivel de dificultad, con foco en el aprendizaje progresivo y construcción de portafólio.

## 🗂 Estructura del Proyecto

- `esquema.sql` 
Contiene la creación de la base de datos **EmpresaDB**  y de todas las tablas, incluso claves primarias y foraneas.
- `datos.sql` 
Script de inserción de datos ficticios para populares como tablas y permitir la ejecución de consultas.

- `consultas/` 
Pasta contendo ejercicios SQL organizados por nivel: 
- `nivel_basico.sql` – consultas simples (`SELECT`, `WHERE`) 
- `nivel_intermediario.sql` – funciones de agregado como: `GROUP BY`, `COUNT`, `CASE` 
- `nivel_avancado.sql` – subconsultas, CTE y funciones de ventana

## 🧱 Modelo de Datos

El banco de datps esta compuesto por las siguientes entidades:

- **Departamentos** – áreas de la empresa
- **Empleados** – funciones vinculadas a departamentos
- **Proyectos** – proyectos corporativos
- **AsignacionesDeProyectos** – relación entre funciones y proyectos, con horas asignadas
- **LogEmpleados** – tabla de apoyo para registros de funcionários

## 🧠 Conceptos Trabalhados

- Modelo relacional
- Claves primarias y foranes
- Consultas básicas y filtrado de datos
- Relacionamentos entre tablas (JOINs)
- Funciones de agregación
- Subconsultas
- CTE (Common Table Expressions)
- Funciones de ventana (Window Functions)

