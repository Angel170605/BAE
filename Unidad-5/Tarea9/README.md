# TAREA 9

# 1.Obtener el nombre del alumno y el nombre de la clase en la que está inscrito.
```sql
select a.nombre as nombre_alumno, c.nombre as nombre_clase from Alumnos as a join Inscripciones as i on a.id = i.id_alumno join Clases as c on i.id_clase = c.id;
┌───────────────┬────────────────────────┐
│ nombre_alumno │      nombre_clase      │
├───────────────┼────────────────────────┤
│ Juan          │ Matemáticas 101        │
│ Juan          │ Historia Antigua       │
│ María         │ Literatura Moderna     │
│ María         │ Biología Avanzada      │
│ Pedro         │ Química Orgánica       │
│ Pedro         │ Física Cuántica        │
│ Laura         │ Arte Contemporáneo     │
│ Laura         │ Inglés Avanzado        │
│ Carlos        │ Economía Internacional │
│ Ana           │ Derecho Penal          │
└───────────────┴────────────────────────┘

```
# 2.Obtener el nombre del alumno y la materia de las clases en las que está inscrito.
```sql
select a.nombre, c.materia  from Alumnos as a join Inscripciones as i on a.id = i.id_alumno join Clases as c on i.id_clase = c.id;
┌────────┬─────────────┐
│ nombre │   materia   │
├────────┼─────────────┤
│ Juan   │ Matemáticas │
│ Juan   │ Historia    │
│ María  │ Literatura  │
│ María  │ Biología    │
│ Pedro  │ Química     │
│ Pedro  │ Física      │
│ Laura  │ Arte        │
│ Laura  │ Idiomas     │
│ Carlos │ Economía    │
│ Ana    │ Derecho     │
└────────┴─────────────┘

```
# 3.Obtener el nombre del alumno, la edad y el nombre del profesor de las clases en las que está inscrito.
```sql
select a.nombre, a.edad, c.profesor  from Alumnos as a join Inscripciones as i on a.id = i.id_alumno join Clases as c on i.id_clase = c.id;
┌────────┬──────┬────────────┐
│ nombre │ edad │  profesor  │
├────────┼──────┼────────────┤
│ Juan   │ 20   │ Profesor X │
│ Juan   │ 20   │ Profesor Y │
│ María  │ 21   │ Profesor Z │
│ María  │ 21   │ Profesor W │
│ Pedro  │ 19   │ Profesor V │
│ Pedro  │ 19   │ Profesor U │
│ Laura  │ 22   │ Profesor T │
│ Laura  │ 22   │ Profesor S │
│ Carlos │ 20   │ Profesor R │
│ Ana    │ 19   │ Profesor Q │
└────────┴──────┴────────────┘

```
# 4.Obtener el nombre del alumno y la dirección de las clases en las que está inscrito.
```sql
select a.nombre, a.direccion from Alumnos as a join Inscripciones as i on a.id = i.id_alumno join Clases as c on i.id_clase = c.id;
┌────────┬───────────┐
│ nombre │ direccion │
├────────┼───────────┤
│ Juan   │ Calle A   │
│ Juan   │ Calle A   │
│ María  │ Calle B   │
│ María  │ Calle B   │
│ Pedro  │ Calle C   │
│ Pedro  │ Calle C   │
│ Laura  │ Calle D   │
│ Laura  │ Calle D   │
│ Carlos │ Calle E   │
│ Ana    │ Calle F   │
└────────┴───────────┘

```
# 5.Obtener el nombre del alumno y el nombre de la clase junto con el profesor.
```sql
select a.nombre, c.nombre, c.profesor from Alumnos as a join Inscripciones as i on a.id = i.id_alumno join Clases as c on i.id_clase = c.id;
┌────────┬────────────────────────┬────────────┐
│ nombre │         nombre         │  profesor  │
├────────┼────────────────────────┼────────────┤
│ Juan   │ Matemáticas 101        │ Profesor X │
│ Juan   │ Historia Antigua       │ Profesor Y │
│ María  │ Literatura Moderna     │ Profesor Z │
│ María  │ Biología Avanzada      │ Profesor W │
│ Pedro  │ Química Orgánica       │ Profesor V │
│ Pedro  │ Física Cuántica        │ Profesor U │
│ Laura  │ Arte Contemporáneo     │ Profesor T │
│ Laura  │ Inglés Avanzado        │ Profesor S │
│ Carlos │ Economía Internacional │ Profesor R │
│ Ana    │ Derecho Penal          │ Profesor Q │
└────────┴────────────────────────┴────────────┘

```
# 6.Obtener el nombre del alumno, la materia y el nombre del profesor de las clases en las que está inscrito.
```sql

```
# 7.Obtener el nombre del alumno, la edad y la materia de las clases en las que está inscrito.
```sql

```
# 8.Obtener el nombre del alumno, la dirección y el profesor de las clases en las que está inscrito.
```sql

```
# 9.Obtener el nombre del alumno y la materia de las clases en las que está inscrito, ordenado por el nombre del alumno.
```sql

```
# 10.Contar cuántos alumnos están inscritos en cada clase.
```sql

```
