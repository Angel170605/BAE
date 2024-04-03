# TAREA 2

- Elimine la tabla "cliente" si existe.

```sql
drop table if exists cliente;
Query OK, 0 rows affected, 1 warning (0,00 sec)
```

- Cree la tabla si clave primaria y incluye a posteriori esta.
  
```sql
create table cliente( 
    -> documento varchar(8) not null,
    -> nombre varchar(30) not null,
    -> domicilio varchar(30),
    -> ciudad varchar(20),
    -> provincia varchar(20),
    -> telefono varchar(11)
    -> );
Query OK, 0 rows affected (0,10 sec)
```
```sql
alter table cliente add primary key (documento);
Query OK, 0 rows affected (0,09 sec)
Records: 0  Duplicates: 0  Warnings: 0

```

- Define los siguientes indices:
   
   - Un índice único por el campo "documento" y un índice común por ciudad y provincia.

```sql
create index dni_index on cliente(documento);
Query OK, 0 rows affected (0,04 sec)
Records: 0  Duplicates: 0  Warnings: 0

```
```sql
create index location_index on cliente(ciudad, provincia);
Query OK, 0 rows affected (0,04 sec)
Records: 0  Duplicates: 0  Warnings: 0
```
   - Vea los índices de la tabla.

```sql
show index from cliente;
+---------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table   | Non_unique | Key_name       | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| cliente |          0 | PRIMARY        |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| cliente |          1 | dni_index      |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| cliente |          1 | location_index |            1 | ciudad      | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| cliente |          1 | location_index |            2 | provincia   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+---------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
4 rows in set (0,02 sec)

```
- Agregue un índice único por el campo "telefono".

```sql
create index tlf_index on cliente(telefono);
Query OK, 0 rows affected (0,12 sec)
Records: 0  Duplicates: 0  Warnings: 0

```

- Elimina los índices.

```sql
drop index tlf_index on cliente;
Query OK, 0 rows affected (0,02 sec)
Records: 0  Duplicates: 0  Warnings: 0

```
```sql
drop index location_index on cliente;
Query OK, 0 rows affected (0,03 sec)
Records: 0  Duplicates: 0  Warnings: 0

```
```sql
drop index dni_index on cliente;
Query OK, 0 rows affected (0,02 sec)
Records: 0  Duplicates: 0  Warnings: 0

```    
