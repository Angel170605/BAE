## Consultas de una única tabla

1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
```sql
select nombre, apellido1, apellido2 from persona where tipo = "alumno" order by(apellido1);
┌──────────┬───────────┬───────────┐
│  nombre  │ apellido1 │ apellido2 │
├──────────┼───────────┼───────────┤
│ Antonio  │ Domínguez │ Guerrero  │
│ Sonia    │ Gea       │ Ruiz      │
│ Juan     │ Gutiérrez │ López     │
│ Pedro    │ Heller    │ Pagac     │
│ Daniel   │ Herman    │ Pacocha   │
│ Irene    │ Hernández │ Martínez  │
│ Ramón    │ Herzog    │ Tremblay  │
│ José     │ Koss      │ Bayer     │
│ Inma     │ Lakin     │ Yundt     │
│ Juan     │ Saez      │ Vega      │
│ Ismael   │ Strosin   │ Turcotte  │
│ Salvador │ Sánchez   │ Pérez     │
└──────────┴───────────┴───────────┘

```
2. Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
```sql
select nombre, apellido1, apellido2 from persona where tipo = "alumno" and telefono is null ;
┌────────┬───────────┬───────────┐
│ nombre │ apellido1 │ apellido2 │
├────────┼───────────┼───────────┤
│ Pedro  │ Heller    │ Pagac     │
│ Ismael │ Strosin   │ Turcotte  │
└────────┴───────────┴───────────┘

```
3. Devuelve el listado de los alumnos que nacieron en 1999.
```sql
select nombre, apellido1, apellido2 from persona where tipo = 'alumno' and fecha_nacimiento regexp '^1999' ;
┌─────────┬───────────┬───────────┐
│ nombre  │ apellido1 │ apellido2 │
├─────────┼───────────┼───────────┤
│ Ismael  │ Strosin   │ Turcotte  │
│ Antonio │ Domínguez │ Guerrero  │
└─────────┴───────────┴───────────┘


```
4. Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y además su nif termina en K.
```sql
select nombre, apellido1, apellido2 from persona where tipo = "profesor" and telefono is null and nif regexp 'K$';
┌───────────┬───────────┬───────────┐
│  nombre   │ apellido1 │ apellido2 │
├───────────┼───────────┼───────────┤
│ Antonio   │ Fahey     │ Considine │
│ Guillermo │ Ruecker   │ Upton     │
└───────────┴───────────┴───────────┘

```
5. Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
```sql
select * from asignatura where cuatrimestre = '1' and curso = '3' and id_grado = '7'; 
┌────┬───────────────────────────────────────────┬──────────┬─────────────┬───────┬──────────────┬─────────────┬──────────┐
│ id │                  nombre                   │ creditos │    tipo     │ curso │ cuatrimestre │ id_profesor │ id_grado │
├────┼───────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 72 │ Bases moleculares del desarrollo vegetal  │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 73 │ Fisiología animal                         │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 74 │ Metabolismo y biosíntesis de biomoléculas │ 6.0      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 75 │ Operaciones de separación                 │ 6.0      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 76 │ Patología molecular de plantas            │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 77 │ Técnicas instrumentales básicas           │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
└────┴───────────────────────────────────────────┴──────────┴─────────────┴───────┴──────────────┴─────────────┴──────────┘

```
## Consultas multitabla (Join)
```sql

```
1. Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).
```sql
select p.nif, p.nombre, p.apellido1, p.apellido2, g.nombre  from persona as p, alumno_se_matricula_asignatura as asma, asignatura as a, grado as g where p.id = asma.id_alumno and asma.id_asignatura = a.id and a.id_grado = g.id and p.sexo = 'M' and g.nombre = 'Grado en Ingeniería Informática (Plan 2015)' group by p.nif;
┌───────────┬────────┬───────────┬───────────┬─────────────────────────────────────────────┐
│    nif    │ nombre │ apellido1 │ apellido2 │                   nombre                    │
├───────────┼────────┼───────────┼───────────┼─────────────────────────────────────────────┤
│ 11578526G │ Inma   │ Lakin     │ Yundt     │ Grado en Ingeniería Informática (Plan 2015) │
│ 64753215G │ Irene  │ Hernández │ Martínez  │ Grado en Ingeniería Informática (Plan 2015) │
│ 85135690V │ Sonia  │ Gea       │ Ruiz      │ Grado en Ingeniería Informática (Plan 2015) │
└───────────┴────────┴───────────┴───────────┴─────────────────────────────────────────────┘


```
1. Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).
```sql
select a.nombre as asignaturas_grado_informática from asignatura as a, grado as g where g.id = a.id_grado and g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
┌────────────────────────────────────────────────────────────────────────┐
│                     asignaturas_grado_informática                      │
├────────────────────────────────────────────────────────────────────────┤
│ Álgegra lineal y matemática discreta                                   │
│ Cálculo                                                                │
│ Física para informática                                                │
│ Introducción a la programación                                         │
│ Organización y gestión de empresas                                     │
│ Estadística                                                            │
│ Estructura y tecnología de computadores                                │
│ Fundamentos de electrónica                                             │
│ Lógica y algorítmica                                                   │
│ Metodología de la programación                                         │
│ Arquitectura de Computadores                                           │
│ Estructura de Datos y Algoritmos I                                     │
│ Ingeniería del Software                                                │
│ Sistemas Inteligentes                                                  │
│ Sistemas Operativos                                                    │
│ Bases de Datos                                                         │
│ Estructura de Datos y Algoritmos II                                    │
│ Fundamentos de Redes de Computadores                                   │
│ Planificación y Gestión de Proyectos Informáticos                      │
│ Programación de Servicios Software                                     │
│ Desarrollo de interfaces de usuario                                    │
│ Ingeniería de Requisitos                                               │
│ Integración de las Tecnologías de la Información en las Organizaciones │
│ Modelado y Diseño del Software 1                                       │
│ Multiprocesadores                                                      │
│ Seguridad y cumplimiento normativo                                     │
│ Sistema de Información para las Organizaciones                         │
│ Tecnologías web                                                        │
│ Teoría de códigos y criptografía                                       │
│ Administración de bases de datos                                       │
│ Herramientas y Métodos de Ingeniería del Software                      │
│ Informática industrial y robótica                                      │
│ Ingeniería de Sistemas de Información                                  │
│ Modelado y Diseño del Software 2                                       │
│ Negocio Electrónico                                                    │
│ Periféricos e interfaces                                               │
│ Sistemas de tiempo real                                                │
│ Tecnologías de acceso a red                                            │
│ Tratamiento digital de imágenes                                        │
│ Administración de redes y sistemas operativos                          │
│ Almacenes de Datos                                                     │
│ Fiabilidad y Gestión de Riesgos                                        │
│ Líneas de Productos Software                                           │
│ Procesos de Ingeniería del Software 1                                  │
│ Tecnologías multimedia                                                 │
│ Análisis y planificación de las TI                                     │
│ Desarrollo Rápido de Aplicaciones                                      │
│ Gestión de la Calidad y de la Innovación Tecnológica                   │
│ Inteligencia del Negocio                                               │
│ Procesos de Ingeniería del Software 2                                  │
│ Seguridad Informática                                                  │
└────────────────────────────────────────────────────────────────────────┘

```
2. Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.
```sql

```
3. Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M.
```sql

```   
5. Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).
```sql

```
6. Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.
```sql

```
## Consultas multitabla (Where)

1. Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
```sql

```
2. Devuelve un listado con los profesores que no están asociados a un departamento.
 ```sql

```
3. Devuelve un listado con los departamentos que no tienen profesores asociados.
```sql

```
4. Devuelve un listado con los profesores que no imparten ninguna asignatura.
```sql

```
5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.
```sql

```
6. Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.
```sql

```

## Consultas resúmen (Funciones)

1. Devuelve el número total de alumnas que hay.
```sql

```
2. Calcula cuántos alumnos nacieron en 1999.
```sql

```
3. Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.
```sql

```
4. Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.
```sql

```
5. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
```sql

```
6. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
```sql

```
7. Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. Ordene el resultado de mayor a menor por el número total de crédidos.
```sql

```
8. Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
```sql

```
9. Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.
```sql

```
## Subconsultas

1. Devuelve todos los datos del alumno más joven.
```sql

```
2. Devuelve un listado con los profesores que no están asociados a un departamento.
```sql

```
3. Devuelve un listado con los departamentos que no tienen profesores asociados.
 ```sql

```   
4. Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.
```sql

```
5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.
```sql

```    
6. Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
```sql

```
