<div align="center">
# TAREA3 DE SQLITE


## ÍNDICE



## 1.CREANDO_LA_BASE_DE_DATOS
</div>

<div align="justify">

El primer paso que hay que seguir para la realización de esta tarea es la creación de las bases de datos de la misma, con su respectiva información. Para ello, primero creé el archivo **empleados-dump.sql**
> sqlite3 empleados-dump.sql

Hecho esto, había que crear las tablas con sus repectivos inserts, con los comandos **create table** e **INSERT** de la siguiente forma:

```sql
CREATE TABLE empleados (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    salario REAL,
    departamento TEXT
);

INSERT INTO empleados (nombre, salario, departamento) VALUES ('Juan', 50000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('María', 60000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carlos', 55000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Ana', 48000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Pedro', 70000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Laura', 52000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Javier', 48000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carmen', 65000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Miguel', 51000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Elena', 55000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Diego', 72000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Sofía', 49000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Andrés', 60000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Isabel', 53000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Raúl', 68000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Patricia', 47000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Alejandro', 71000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Natalia', 54000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Roberto', 49000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Beatriz', 63000, 'TI');
```
  
</div>

<div align="center">

# 2.READ

</div>

<div align="justify"> 

Ahora, desde el fichero **tarea3.db** había que hacer un read del sql creado enteriormente. Lo que se hace de la siguiente forma:

> .read empleados-dump.sql

De esta forma, ya la tabla e información de **empleados-dump.sql** está en este nuevo archivo.

<div align="center">

# 3.CONSULTAS
</div>

Como ya están creados tanto **empleados-dump.sql** como **tarea3.db**, es hora de empezar con las consultas:

1. Muestra el nombre de todos los empleados en mayúsculas
> select upper(nombre) as nombre_empleados from empleados;

```sql
┌──────────────────┐
│ nombre_empleados │
├──────────────────┤
│ JUAN             │
│ MARíA            │
│ CARLOS           │
│ ANA              │
│ PEDRO            │
│ LAURA            │
│ JAVIER           │
│ CARMEN           │
│ MIGUEL           │
│ ELENA            │
│ DIEGO            │
│ SOFíA            │
│ ANDRéS           │
│ ISABEL           │
│ RAúL             │
│ PATRICIA         │
│ ALEJANDRO        │
│ NATALIA          │
│ ROBERTO          │
│ BEATRIZ          │
└──────────────────┘
```
2. Calcular el valor absolutro del salario de todos los empleados
> sqlite> select ABS(salario) as valor_absoluto_salario from empleados;

```sql
┌────────────────────────┐
│ valor_absoluto_salario │
├────────────────────────┤
│ 50000.0                │
│ 60000.0                │
│ 55000.0                │
│ 48000.0                │
│ 70000.0                │
│ 52000.0                │
│ 48000.0                │
│ 65000.0                │
│ 51000.0                │
│ 55000.0                │
│ 72000.0                │
│ 49000.0                │
│ 60000.0                │
│ 53000.0                │
│ 68000.0                │
│ 47000.0                │
│ 71000.0                │
│ 54000.0                │
│ 49000.0                │
│ 63000.0                │
└────────────────────────┘
```
3.Muestra la fecha actual
> select current_date as fecha_actual from empleados limit 1;
```sql
┌──────────────┐
│ fecha_actual │
├──────────────┤
│ 2024-01-17   │
└──────────────┘
```
4.1 Calcular el salario promedrio de los empleados
> select AVG(salario) as salario_promedio from empleados;
```sql
┌──────────────────┐
│ salario_promedio │
├──────────────────┤
│ 57000.0          │
└──────────────────┘
```
4.2 Convertir la cadena '123' a un valor numércio
> select cast(123 as integer) as entero from empleados limit 1;
```sql
┌────────┐
│ entero │
├────────┤
│ 123    │
└────────┘
```
5.Concatenar el nombre y departamento de cada empleado
> select nombre, departamento, CONCAT(nombre, ' ', departamento) as nombre_departamento from empleados;

6.Concatenar el nombre de y departamento de cada empleado con unguión como separador
> select nombre, departamento, CONCAT_WT(nombre, ' ', departamento) as nombre_departamento from empleados;

7.Categorizar a los empleados según sus salarios
> select nombre, CASE when salario < 5500 then 'bajo' else 'alto' end as rango_salarios  from empleados;
```sql
┌───────────┬────────────────┐
│  nombre   │ rango_salarios │
├───────────┼────────────────┤
│ Juan      │ alto           │
│ María     │ alto           │
│ Carlos    │ alto           │
│ Ana       │ alto           │
│ Pedro     │ alto           │
│ Laura     │ alto           │
│ Javier    │ alto           │
│ Carmen    │ alto           │
│ Miguel    │ alto           │
│ Elena     │ alto           │
│ Diego     │ alto           │
│ Sofía     │ alto           │
│ Andrés    │ alto           │
│ Isabel    │ alto           │
│ Raúl      │ alto           │
│ Patricia  │ alto           │
│ Alejandro │ alto           │
│ Natalia   │ alto           │
│ Roberto   │ alto           │
│ Beatriz   │ alto           │
└───────────┴────────────────┘
```
8. Calcular la suma total del salario de todos los empleados
> select sum(salario) as suma_total_salarios from empleados;
```sql
┌─────────────────────┐
│ suma_total_salarios │
├─────────────────────┤
│ 1140000.0           │
└─────────────────────┘

```

9.Redondeando todos los salarios a 2 decimales
>select nombre, round(salario, 2) as salario_redondeado from empleados;
```sql
┌───────────┬────────────────────┐
│  nombre   │ salario_redondeado │
├───────────┼────────────────────┤
│ Juan      │ 50000.0            │
│ María     │ 60000.0            │
│ Carlos    │ 55000.0            │
│ Ana       │ 48000.0            │
│ Pedro     │ 70000.0            │
│ Laura     │ 52000.0            │
│ Javier    │ 48000.0            │
│ Carmen    │ 65000.0            │
│ Miguel    │ 51000.0            │
│ Elena     │ 55000.0            │
│ Diego     │ 72000.0            │
│ Sofía     │ 49000.0            │
│ Andrés    │ 60000.0            │
│ Isabel    │ 53000.0            │
│ Raúl      │ 68000.0            │
│ Patricia  │ 47000.0            │
│ Alejandro │ 71000.0            │
│ Natalia   │ 54000.0            │
│ Roberto   │ 49000.0            │
│ Beatriz   │ 63000.0            │
│ Juan      │ 50000.0            │
│ María     │ 60000.0            │
│ Carlos    │ 55000.0            │
│ Ana       │ 48000.0            │
│ Pedro     │ 70000.0            │
│ Laura     │ 52000.0            │
│ Javier    │ 48000.0            │
│ Carmen    │ 65000.0            │
│ Miguel    │ 51000.0            │
│ Elena     │ 55000.0            │
│ Diego     │ 72000.0            │
│ Sofía     │ 49000.0            │
│ Andrés    │ 60000.0            │
│ Isabel    │ 53000.0            │
│ Raúl      │ 68000.0            │
│ Patricia  │ 47000.0            │
│ Alejandro │ 71000.0            │
│ Natalia   │ 54000.0            │
│ Roberto   │ 49000.0            │
│ Beatriz   │ 63000.0            │
└───────────┴────────────────────┘

```
10. Mostrando la longitud del nombre de cada uno de los empleados
> select nombre, length(nombre) as longitud_nombre_empleado from empleados;
```sql
┌───────────┬──────────────────────────┐
│  nombre   │ longitud_nombre_empleado │
├───────────┼──────────────────────────┤
│ Juan      │ 4                        │
│ María     │ 5                        │
│ Carlos    │ 6                        │
│ Ana       │ 3                        │
│ Pedro     │ 5                        │
│ Laura     │ 5                        │
│ Javier    │ 6                        │
│ Carmen    │ 6                        │
│ Miguel    │ 6                        │
│ Elena     │ 5                        │
│ Diego     │ 5                        │
│ Sofía     │ 5                        │
│ Andrés    │ 6                        │
│ Isabel    │ 6                        │
│ Raúl      │ 4                        │
│ Patricia  │ 8                        │
│ Alejandro │ 9                        │
│ Natalia   │ 7                        │
│ Roberto   │ 7                        │
│ Beatriz   │ 7                        │
│ Juan      │ 4                        │
│ María     │ 5                        │
│ Carlos    │ 6                        │
│ Ana       │ 3                        │
│ Pedro     │ 5                        │
│ Laura     │ 5                        │
│ Javier    │ 6                        │
│ Carmen    │ 6                        │
│ Miguel    │ 6                        │
│ Elena     │ 5                        │
│ Diego     │ 5                        │
│ Sofía     │ 5                        │
│ Andrés    │ 6                        │
│ Isabel    │ 6                        │
│ Raúl      │ 4                        │
│ Patricia  │ 8                        │
│ Alejandro │ 9                        │
│ Natalia   │ 7                        │
│ Roberto   │ 7                        │
│ Beatriz   │ 7                        │
└───────────┴──────────────────────────┘

```

11. Contando los empleados que hay por departamento
>
sql```

```
12.
> select current_time as fecha_actual from empleados limit 1;
sql```
┌──────────────┐
│ fecha_actual │
├──────────────┤
│ 20:11:49     │
└──────────────┘

```
13. Convirtiendo el salario a un valor flotante
> SELECT CAST(salario as float) AS salario_redondeado FROM empleados;
sql```
┌────────────────────┐
│ salario_redondeado │
├────────────────────┤
│ 50000.0            │
│ 60000.0            │
│ 55000.0            │
│ 48000.0            │
│ 70000.0            │
│ 52000.0            │
│ 48000.0            │
│ 65000.0            │
│ 51000.0            │
│ 55000.0            │
│ 72000.0            │
│ 49000.0            │
│ 60000.0            │
│ 53000.0            │
│ 68000.0            │
│ 47000.0            │
│ 71000.0            │
│ 54000.0            │
│ 49000.0            │
│ 63000.0            │
│ 50000.0            │
│ 60000.0            │
│ 55000.0            │
│ 48000.0            │
│ 70000.0            │
│ 52000.0            │
│ 48000.0            │
│ 65000.0            │
│ 51000.0            │
│ 55000.0            │
│ 72000.0            │
│ 49000.0            │
│ 60000.0            │
│ 53000.0            │
│ 68000.0            │
│ 47000.0            │
│ 71000.0            │
│ 54000.0            │
│ 49000.0            │
│ 63000.0            │
└────────────────────┘

```
14. Mostrando los primeros tres caracteres del nombre de los empleados
> select substr(nombre, 0, 4) as primeros_digitos from empleados;
sql```
┌──────────────────┐
│ primeros_digitos │
├──────────────────┤
│ Jua              │
│ Mar              │
│ Car              │
│ Ana              │
│ Ped              │
│ Lau              │
│ Jav              │
│ Car              │
│ Mig              │
│ Ele              │
│ Die              │
│ Sof              │
│ And              │
│ Isa              │
│ Raú              │
│ Pat              │
│ Ale              │
│ Nat              │
│ Rob              │
│ Bea              │
│ Jua              │
│ Mar              │
│ Car              │
│ Ana              │
│ Ped              │
│ Lau              │
│ Jav              │
│ Car              │
│ Mig              │
│ Ele              │
│ Die              │
│ Sof              │
│ And              │
│ Isa              │
│ Raú              │
│ Pat              │
│ Ale              │
│ Nat              │
│ Rob              │
│ Bea              │
└──────────────────┘

```
<div align="center">

# 4.ORDER_BY


</div>
