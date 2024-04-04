# TAREA 3

- Crea una base de datos que tendrá por nombre __Base_Indices__.

create database Base_Indices;
Query OK, 1 row affected (0,02 sec)

- En la BD crea una tabla de nombre MOVIMIENTO con la siguiente estructura:

    | Nombre del campo | Tipo de dato | Propiedades                |
    |------------------|--------------|----------------------------|
    | Identificador    | int       | AUTO_INCREMENT, Clave primaria (PK_MOVIMIENTO) |
    | Articulo         | varchar(50)  | Obligatorio                |
    | Fecha            | date         | Obligatorio                |
    | Cantidad         | int     | Obligatorio                |

```sql
create table movimiento(
    -> Identificador int auto_increment,
    -> articulo varchar(50) not null,
    -> fecha date not null,
    -> cantidad int not null,
    -> primary key(identificador)
    -> );
Query OK, 0 rows affected (0,04 sec)
```

- Aplica la sentencia adecuada para visualizar los índices que hay en la tabla

```sql
show index from movimiento;
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table      | Non_unique | Key_name | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| movimiento |          0 | PRIMARY  |            1 | Identificador | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
```

- Ejecuta la siguiente sentencia sql para generar datos de prueba:

    ```
    CREATE TABLE NumerosUnicos (
    Numero INT AUTO_INCREMENT PRIMARY KEY
    );

    INSERT INTO NumerosUnicos (Numero)
    SELECT NULL FROM INFORMATION_SCHEMA.COLUMNS LIMIT 5000;

    INSERT INTO movimiento (Identificador, Articulo, Fecha, Cantidad)
    SELECT 
        n.Numero,
        CONCAT('Producto', n.Numero),
        DATE_ADD('2012-01-01', INTERVAL FLOOR(RAND() * 120) DAY),
        FLOOR(RAND() * 1000000) + 1
    FROM 
        NumerosUnicos n;

        DROP TABLE NumerosUnicos;
    ```

```sql
+---------------+--------------+------------+----------+
| Identificador | articulo     | fecha      | cantidad |
+---------------+--------------+------------+----------+
|             1 | Producto1    | 2012-02-19 |   927313 |
|             2 | Producto2    | 2012-02-17 |   196181 |
|             3 | Producto3    | 2012-04-05 |   381615 |
|             4 | Producto4    | 2012-03-04 |   485059 |
|             5 | Producto5    | 2012-04-11 |   781576 |
|             6 | Producto6    | 2012-02-13 |   484411 |
|             7 | Producto7    | 2012-02-08 |   169618 |
|             8 | Producto8    | 2012-04-14 |   863031 |
|             9 | Producto9    | 2012-03-24 |   871028 |
|            10 | Producto10   | 2012-02-03 |   782250 |
|            11 | Producto11   | 2012-01-09 |    23497 |


                            |
                            |
                            |
                            V

|          3604 | Producto3604 | 2012-04-23 |   757002 |
+---------------+--------------+------------+----------+
(La tabla tiene muchas consultas)
```

- Crea con la sentencia CREATE TABLE…SELECT… un duplicado de la tabla MOVIMIENTO a
la que llamaremos MOVIMIENTO_BIS.

```sql
create table MOVIMIENTO_BIS select * from movimiento;
```
```sql
+---------------+--------------+------------+----------+
| Identificador | articulo     | fecha      | cantidad |
+---------------+--------------+------------+----------+
|             1 | Producto1    | 2012-02-19 |   927313 |
|             2 | Producto2    | 2012-02-17 |   196181 |
|             3 | Producto3    | 2012-04-05 |   381615 |
|             4 | Producto4    | 2012-03-04 |   485059 |
|             5 | Producto5    | 2012-04-11 |   781576 |
|             6 | Producto6    | 2012-02-13 |   484411 |
|             7 | Producto7    | 2012-02-08 |   169618 |
|             8 | Producto8    | 2012-04-14 |   863031 |
|             9 | Producto9    | 2012-03-24 |   871028 |
|            10 | Producto10   | 2012-02-03 |   782250 |
|            11 | Producto11   | 2012-01-09 |    23497 |

                            |
                            |
                            |
                            V

|          3604 | Producto3604 | 2012-04-23 |   757002 |
+---------------+--------------+------------+----------+
(La tabla tiene muchas consultas (De nuevo, es una copia))
```

- Con la cláusula __DESCRIBE__ observa cuál es la situación de la tabla clonada, ¿Qué le pasa al
índice y a la propiedad __AUTO_INCREMENT__?

```sql
describe MOVIMIENTO_BIS;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| Identificador | int         | NO   |     | 0       |       |
| articulo      | varchar(50) | NO   |     | NULL    |       |
| fecha         | date        | NO   |     | NULL    |       |
| cantidad      | int         | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
```

#### Como se puede apreciar, tanto la columna "Key" como "Extra" están vacías. Por tanto, el índice que existía sobre "Identificador" en la tabla original y la propiedad AUTO_INCREMENT de la misma han desaparecido de esta nueva tabla duplicada.

- Utilizando EXPLAIN observa el plan de ejecución de la consulta que devuelve toda la información de los movimientos con identificador=3. Tanto en la tabla MOVIMIENTOS como en la tabla MOVIMIENTOS_bis. Escribe tus conclusiones al respecto.

```sql
explain select * from movimiento where identificador=3;
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
| id | select_type | table      | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | movimiento | NULL       | const | PRIMARY       | PRIMARY | 4       | const |    1 |   100.00 | NULL  |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
```

```sql
explain select * from MOVIMIENTO_BIS where identificador=3;
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3604 |    10.00 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
```

#### La tabla original, "movimiento", tenía la primary key "identificador", mientras que la copia de la tabla, "MOVIMIENTO_BIS" no tiene ninguna. Es por ello por lo que podemos ver en los resultados de _EXPLAIN_ que en el apartado "EXTRA" aparece "NULL" en el caso de la tabla que tiene PK y "Using where" en el caso de la tabla que no tiene la PK. Por tanto, se puede deducir que en el caso de la primera tabla, el resultado de esta consulta se podría obtener simplemente con el uso de los índices, mientras que en la tabla duplicada haría falta usar un _where_. Esta conclusión podría ser corroborada por el uso del _EXPLAIN_, puesto que esta función devuelve información sobre cómo trabajaría una determinada consulta en una determinada tabla.

- Supongamos que las consultas de rango que se van a hacer en nuestra tabla son frecuentes y además no por el identificador, sino por la fecha. Este es motivo suficiente para que sea la fecha un índice de tabla y así mejorar el tiempo de respuesta de nuestras consultas.
En la tabla MOVIMIENTO_BIS creamos un índice para la fecha (IX_FECHA_BIS) y otro índice para el identificador (IX_IDENTIFICADOR).

- 8.- Analiza el plan de ejecución de las siguientes consultas y observa la diferencia:
- 
Consulta1

```sql
select * from MOVIMIENTO_BIS where identificador=3;
```

```sql
select * from MOVIMIENTO_BIS where identificador=3;
+---------------+-----------+------------+----------+
| Identificador | articulo  | fecha      | cantidad |
+---------------+-----------+------------+----------+
|             3 | Producto3 | 2012-04-05 |   381615 |
+---------------+-----------+------------+----------+
```

Consulta 2

```sql
select identificador from MOVIMIENTO_BIS where identificador=3;
```

```sql
select identificador from MOVIMIENTO_BIS where identificador=3;
+---------------+
| identificador |
+---------------+
|             3 |
+---------------+
```

Fíjata en que en la consulta 1 pedimos todos los campos. ¿A través de que indice se busca?

#### En la Consulta 1, la búsqueda se realiza mediante "identificador", que realmente NO es un índice, dado que en esta tabla, como se puede apreciar en el apartado anterior, no los hay. 

 ¿Por qué crees que lo hace así?

#### Lo hace de esta forma debido a que es la forma más sencilla de dar con los resultados de esta consulta.

En la consulta 2 solo pedimos el identificador. ¿A través de que índice busca?

> respuesta

¿Por qué crees que lo hace así? Analiza la ejecución.

> respuesta

- Analiza el plan de ejecución de las siguientes consultas y observa la diferencia:

Consulta 1:

```sql
SELECT fecha FROM MOVIMIENTO WHERE fecha BETWEEN ‘01/01/2012’ and ‘01/03/2012’;
```

Consulta 2

```sql
SELECT * FROM MOVIMIENTO WHERE fecha BETWEEN ‘01/01/2012’ and ‘01/03/2012’;
```

Fijate que en la consulta 2 pedimos todos los campos. ¿A través de que índice busca?

> respuesta

¿Por qué crees que lo hace así?

> respuesta

En la consulta 1 solo pedimos la fecha. ¿A través de que índice busca?

> respuesta

¿Por qué crees que lo hace así? Analiza la ejecución.

> respuesta

- Vamos a crear un índice por fecha (IX_FECHA) en la tabla MOVIMIENTO, puesto que no lo tenía, en este caso la tabla ya tenía un indice, la clave primaria.

- Visualiza los indices de las tablas MOVIMIENTO y MOVIMIENTO_BIS.

- Analiza el plan de ejecución de las siguientes consultas y observa la diferencia:

Consulta 1:

```sql
SELECT fecha FROM MOVIMIENTO WHERE fecha BETWEEN ‘01/01/2012’ AND ‘01/03/2012’;
```

Consulta 2:

```sql
SELECT * FROM MOVIMIENTO WHERE fecha BETWEEN ‘01/01/2012’ AND ‘01/03/2012’;
```

Consulta 3:

```sql
SELECT fecha FROM MOVIMIENTO_BIS WHERE fecha BETWEEN ‘01/01/2012’ AND ‘01/03/2012’;
```

Consulta 4:

```sql
SELECT * FROM MOVIMIENTO_BIS WHERE fecha BETWEEN ‘01/01/2012’ AND ‘01/03/2012’;
```

> respuesta

