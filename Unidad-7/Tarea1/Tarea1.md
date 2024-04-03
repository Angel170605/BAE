# TAREA 1

##### - Elimine la tabla "alumno" si existe. 

```sql
drop table if exists alumno;
Query OK, 0 rows affected, 1 warning (0,01 sec)
```

##### - Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de 
inscripción).

```sql
create table alumno(
    -> numero_inscripcion int,
    -> año_inscripcion datetime,
    -> nombre varchar(100),
    -> dni varchar(100),
    -> ciudad varchar(100),
    -> provincia varchar(100),
    -> primary key(numero_inscripcion, año_inscripcion)
    -> );
Query OK, 0 rows affected (0,09 sec)

```

##### - Define los siguientes indices:

  - Un índice único por el campo "documento" y un índice común por ciudad y provincia.

```sql
create index dni_indx on alumno(dni);
Query OK, 0 rows affected (0,08 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

```sql
create index city_prov_index on alumno(ciudad, provincia);
Query OK, 0 rows affected (0,04 sec)
Records: 0  Duplicates: 0  Warnings: 0

```

  - Vea los índices de la tabla.

```sql
show index from alumno;
+--------+------------+-----------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name        | Seq_in_index | Column_name        | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+-----------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| alumno |          0 | PRIMARY         |            1 | numero_inscripcion | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          0 | PRIMARY         |            2 | año_inscripcion    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          1 | dni_indx        |            1 | dni                | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| alumno |          1 | city_prov_index |            1 | ciudad             | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| alumno |          1 | city_prov_index |            2 | provincia          | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+--------+------------+-----------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

```

##### - Intente ingresar un alumno con clave primaria repetida.

```sql
insert into alumno( numero_inscripcion, año_inscripcion, nombre, dni, ciudad, provincia)
    -> values ('1706', '2023-05-04', 'Angel', '16022024L', 'Los Realejos', 'Santa Cruz de Tenerife');
Query OK, 1 row affected (0,01 sec)

```

```sql
nsert into alumno( numero_inscripcion, año_inscripcion, nombre, dni, ciudad, provincia) values ('1706', '2023-05-04', 'Oric', '28102005U', 'La Orotava', 'Santa Cruz de Tenerife');
ERROR 1062 (23000): Duplicate entry '1706-2023-05-04 00:00:00' for key 'alumno.PRIMARY'
```

##### - Intente ingresar un alumno con documento repetido.

```sql
insert into alumno( numero_inscripcion, año_inscripcion, nombre, dni, ciudad, provincia) values ('0808', '2023-04-03', 'Daniel', '16022024L', 'Los Realejos', 'Santa Cruz de Tenerife');
Query OK, 1 row affected (0,01 sec)
+--------------------+---------------------+--------+-----------+--------------+------------------------+
| numero_inscripcion | año_inscripcion     | nombre | dni       | ciudad       | provincia              |
+--------------------+---------------------+--------+-----------+--------------+------------------------+
|                808 | 2023-04-03 00:00:00 | Daniel | 16022024L | Los Realejos | Santa Cruz de Tenerife |
|               1706 | 2023-05-04 00:00:00 | Angel  | 16022024L | Los Realejos | Santa Cruz de Tenerife |
+--------------------+---------------------+--------+-----------+--------------+------------------------+
```

##### - Ingrese varios alumnos de la misma ciudad y provincia.

```sql
insert into alumno( numero_inscripcion, año_inscripcion, nombre, dni, ciudad, provincia) values ('1202', '2023-04-04', 'Mario', '12022005M', 'Los Realejos', 'Santa Cruz de Tenerife');
Query OK, 1 row affected (0,02 sec)

insert into alumno( numero_inscripcion, año_inscripcion, nombre, dni, ciudad, provincia) values ('2805', '2023-04-05', 'Dailos', '28052005G', 'Los Realejos', 'Santa Cruz de Tenerife');
Query OK, 1 row affected (0,02 sec)

insert into alumno( numero_inscripcion, año_inscripcion, nombre, dni, ciudad, provincia) values ('1601', '2023-04-06', 'Omar', '16012005A', 'Los Realejos', 'Santa Cruz de Tenerife');
Query OK, 1 row affected (0,02 sec)

+--------------------+---------------------+--------+-----------+--------------+------------------------+
| numero_inscripcion | año_inscripcion     | nombre | dni       | ciudad       | provincia              |
+--------------------+---------------------+--------+-----------+--------------+------------------------+
|                808 | 2023-04-03 00:00:00 | Daniel | 16022024L | Los Realejos | Santa Cruz de Tenerife |
|               1202 | 2023-04-04 00:00:00 | Mario  | 12022005M | Los Realejos | Santa Cruz de Tenerife |
|               1601 | 2023-04-06 00:00:00 | Omar   | 16012005A | Los Realejos | Santa Cruz de Tenerife |
|               1706 | 2023-05-04 00:00:00 | Angel  | 16022024L | Los Realejos | Santa Cruz de Tenerife |
|               2805 | 2023-04-05 00:00:00 | Dailos | 28052005G | Los Realejos | Santa Cruz de Tenerife |
+--------------------+---------------------+--------+-----------+--------------+------------------------+

```

##### - Elimina los indices creados, y muestra que ya no se encuentran.

```sql
drop index dni_indx on alumno;
Query OK, 0 rows affected (0,03 sec)
Records: 0  Duplicates: 0  Warnings: 0

```
```sql
drop index city_prov_index on alumno;
Query OK, 0 rows affected (0,01 sec)
Records: 0  Duplicates: 0  Warnings: 0

```
```sql
show index from alumno;
+--------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name | Seq_in_index | Column_name        | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| alumno |          0 | PRIMARY  |            1 | numero_inscripcion | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          0 | PRIMARY  |            2 | año_inscripcion    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+--------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0,00 sec)

```
