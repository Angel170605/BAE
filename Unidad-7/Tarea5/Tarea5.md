# TAREA 5

### Carga de datos

<div align="justify">

- Realiza la carga de la BBDD de Jardineria y describe los pasos que has realizado.

1. Creación y uso de la base de datos "Unidad7Tarea5".

2. ```sql source jardineria.sql ```

```sql
  show tables;
+----------------------+
| Tables_in_jardineria |
+----------------------+
| cliente              |
| detalle_pedido       |
| empleado             |
| gama_producto        |
| oficina              |
| pago                 |
| pedido               |
| producto             |
+----------------------+
```

### Índices

- Consulte cuáles son los índices que hay en la tabla producto utilizando las instrucciones SQL que nos permiten obtener esta información de la tabla.

```sql
show index from producto;
+----------+------------+----------+--------------+-----------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table    | Non_unique | Key_name | Seq_in_index | Column_name     | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------+------------+----------+--------------+-----------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| producto |          0 | PRIMARY  |            1 | codigo_producto | A         |         276 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| producto |          1 | gama     |            1 | gama            | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+----------+------------+----------+--------------+-----------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

```

- Haga uso de EXPLAIN para obtener información sobre cómo se están realizando las consultas y diga cuál de las dos consultas realizará menos comparaciones para encontrar el producto que estamos buscando. ¿Cuántas comparaciones se realizan en cada caso? ¿Por qué?.

En el caso de la primera consulta sólo se hace una comparación (tal y como podemos ver en la columna 'rows', que tiene '1' como valor.), mientras que en el caso de la segunda se hacne un total de 276 comparaciones. 

Esto se debe a que, como se puede deducir gracias a las columnas 'Key' y 'Extra' en cada tabla, la primera consulta se hizo mediante una Primary Key (Se puede ver en la columna 'Key', que tiene el valor 'PRIMARY') y no tiene nada en la columna 'EXTRA'. 

Mientras tanto, en las columnas de la segunda consulta, la columna 'Key' tiene el valor 'NULL' (lo que se traduce en que no cuenta con Primary Key) y la columna 'EXTRA' cuenta con 'WHERE', que es la sentencia que se usó para hacer la consulta.

##### Explain de la primera consulta:

```sql
explain select * from producto where codigo_producto = 'OR-114';
+----+-------------+----------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
| id | select_type | table    | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra |
+----+-------------+----------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | producto | NULL       | const | PRIMARY       | PRIMARY | 62      | const |    1 |   100.00 | NULL  |
+----+-------------+----------+------------+-------+---------------+---------+---------+-------+------+----------+-------+

```

##### Explain de la segunda consulta:

```sql
explain select * from producto where nombre = 'Evonimujs Pulchellus';
+----+-------------+----------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table    | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | producto | NULL       | ALL  | NULL          | NULL | NULL    | NULL |  276 |    10.00 | Using where |
+----+-------------+----------+------------+------+---------------+------+---------+------+------+----------+-------------+

```

- Suponga que estamos trabajando con la base de datos jardineria y queremos saber optimizar las siguientes consultas. ¿Cuál de las dos sería más eficiente?. Se recomienda hacer uso de EXPLAIN para obtener información sobre cómo se están realizando las consultas.

En el caso de estas dos consultas, resultaría más eficiente la primera dado que se hace mediante un año en concreto (en este caso 2008), siendo la segunda realizada con dos where (si la fecha es posterior al 01/01/2008 y anterior al 31/12/2008), por lo que comparará todas y cada unas de las fechas de la tabla, para ver si están o no dentro de este rango. Esta misma consulta se podría haber realizado con la sentencia 'BETWEEN'.

Esto se ve reflejado en la columna 'filtered' (que hace referencia al porcentaje de coincidencias entre la consulta y las filas/columnas consultadas; algo así como "aciertos") de cada tabla; ya que en la primera consulta hay un 100% y en la segunda un 11.11%; lo que equivaldría a una coincidencia de cada 10 comprobaciones.

##### Explain de la primera consulta:

```sql
explain select avg(total) from pago where year(fecha_pago) = 2008;
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | pago  | NULL       | ALL  | NULL          | NULL | NULL    | NULL |   26 |   100.00 | Using where |
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+

```

##### Explain de la segunda consulta:

```sql
explain select avg(total) from pago where fecha_pago >= 2008-01-01 AND fecha_pago <= '2008-12-31';
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | pago  | NULL       | ALL  | NULL          | NULL | NULL    | NULL |   26 |    11.11 | Using where |
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+

```

- Optimiza la siguiente consulta creando índices cuando sea necesario. Se recomienda hacer uso de EXPLAIN para obtener información sobre cómo se están realizando las consultas. ¿Por qué no es posible optimizar el tiempo de ejecución de las siguientes consultas, incluso haciendo uso de índices?

Consulta original:

```sql
select * from cliente inner join pedido on cliente.codigo_cliente = pedido.codigo_cliente where cliente.nombre_cliente like 'A%';

```

Explain de la consulta original:

```sql
explain select * from cliente inner join pedido on cliente.codigo_cliente = pedido.codigo_cliente where cliente.nombre_cliente like 'A%';
+----+-------------+---------+------------+------+----------------+----------------+---------+-----------------------------------+------+----------+-------------+
| id | select_type | table   | partitions | type | possible_keys  | key            | key_len | ref                               | rows | filtered | Extra       |
+----+-------------+---------+------------+------+----------------+----------------+---------+-----------------------------------+------+----------+-------------+
|  1 | SIMPLE      | cliente | NULL       | ALL  | PRIMARY        | NULL           | NULL    | NULL                              |   36 |    11.11 | Using where |
|  1 | SIMPLE      | pedido  | NULL       | ref  | codigo_cliente | codigo_cliente | 4       | jardineria.cliente.codigo_cliente |    1 |   100.00 | NULL        |
+----+-------------+---------+------------+------+----------------+----------------+---------+-----------------------------------+------+----------+-------------+

```

Consulta optimizada:

```sql
select * from cliente as c, pedido as p where c.codigo_cliente = p.codigo_cliente and c.nombre_cliente regexp '^a';
```

Explain de la consulta optimizada:

```sql
+----+-------------+-------+------------+--------+----------------+---------+---------+-----------------------------+------+----------+-------------+
| id | select_type | table | partitions | type   | possible_keys  | key     | key_len | ref                         | rows | filtered | Extra       |
+----+-------------+-------+------------+--------+----------------+---------+---------+-----------------------------+------+----------+-------------+
|  1 | SIMPLE      | p     | NULL       | ALL    | cl_pedido_indx | NULL    | NULL    | NULL                        |  115 |   100.00 | NULL        |
|  1 | SIMPLE      | c     | NULL       | eq_ref | PRIMARY        | PRIMARY | 4       | jardineria.p.codigo_cliente |    1 |   100.00 | Using where |
+----+-------------+-------+------------+--------+----------------+---------+---------+-----------------------------+------+----------+-------------+

```

- ¿Por qué no es posible optimizar el tiempo de ejecución de las siguientes consultas, incluso haciendo uso de índices?

a

- Crea un índice de tipo FULLTEXT sobre las columnas nombre y descripcion de la tabla producto.

```sql
create fulltext index prodcut_tx_index on producto(nombre, descripcion);
```

- Una vez creado el índice del ejercicio anterior realiza las siguientes consultas haciendo uso de la función MATCH, para buscar todos los productos que:

  - Contienen la palabra planta en el nombre o en la descripción.

  ```sql
    select from * producto where match(nombre, descripcion) against('planta');
  ```

  - Realice una consulta para cada uno de los modos de búsqueda full-text que existen en MySQL (IN NATURAL LANGUAGE MODE, IN BOOLEAN MODE y WITH QUERY EXPANSION) y compare los resultados que ha obtenido en cada caso.

  ```sql
    
  ```

  - Contienen la palabra planta seguida de cualquier carácter o conjunto de caracteres, en el nombre o en la descripción.



  - Empiezan con la palabra planta en el nombre o en la descripción.



  - Contienen la palabra tronco o la palabra árbol en el nombre o en la descripción.



  - Contienen la palabra tronco y la palabra árbol en el nombre o en la descripción.



  - Contienen la palabra tronco pero no contienen la palabra árbol en el nombre o en la descripción.



  - Contiene la frase proviene de las costas en el nombre o en la descripción.



  - Crea un índice de tipo INDEX compuesto por las columnas apellido_contacto y nombre_contacto de la tabla cliente.



  - Una vez creado el índice del ejercicio anterior realice las siguientes consultas haciendo uso de EXPLAIN:
  


    - Busca el cliente Javier Villar. ¿Cuántas filas se han examinado hasta encontrar el resultado?



    - Busca el cliente anterior utilizando solamente el apellido Villar.



    - ¿Cuántas filas se han examinado hasta encontrar el resultado?



    - Busca el cliente anterior utilizando solamente el nombre Javier. ¿Cuántas filas se han examinado hasta encontrar el resultado? ¿Qué ha ocurrido en este caso?



  - Calcula cuál podría ser un buen valor para crear un índice sobre un prefijo de la columna nombre_cliente de la tabla cliente. Tenga en cuenta que un buen valor será aquel que nos permita utilizar el menor número de caracteres para diferenciar todos los valores que existen en la columna sobre la que estamos creando el índice.



    - En primer lugar calculamos cuántos valores distintos existen en la columna nombre_cliente. Necesitarás utilizar la función COUNT y DISTINCT.



    - Haciendo uso de la función LEFT ve calculando el número de caracteres que necesitas utilizar como prefijo para diferenciar todos los valores de la columna. Necesitarás la función COUNT, DISTINCT y LEFT.



    - Una vez que hayas encontrado el valor adecuado para el prefijo, crea el índice sobre la columna nombre_cliente de la tabla cliente.



    - Ejecuta algunas consultas de prueba sobre el índice que acabas de crear.

### Vistas

- Escriba una vista que se llame listado_pagos_clientes que muestre un listado donde aparezcan todos los clientes y los pagos que ha realizado cada uno de ellos. La vista deberá tener las siguientes columnas: nombre y apellidos del cliente concatenados, teléfono, ciudad, pais, fecha_pago, total del pago, id de la transacción



- Escriba una vista que se llame listado_pedidos_clientes que muestre un listado donde aparezcan todos los clientes y los pedidos que ha realizado cada uno de ellos. La vista deberá tener las siguientes columnas: código del cliente, nombre y apellidos del cliente concatendados, teléfono, ciudad, pais, código del pedido, fecha del pedido, fecha esperada, fecha de entrega y la cantidad total del pedido, que será la suma del producto de todas las cantidades por el precio de cada unidad, que aparecen en cada línea de pedido.



- Utilice las vistas que ha creado en los pasos anteriores para devolver un listado de los clientes de la ciudad de Madrid que han realizado pagos.



- Utilice las vistas que ha creado en los pasos anteriores para devolver un listado de los clientes que todavía no han recibido su pedido.



- Utilice las vistas que ha creado en los pasos anteriores para calcular el número de pedidos que se ha realizado cada uno de los clientes.



- Utilice las vistas que ha creado en los pasos anteriores para calcular el valor del pedido máximo y mínimo que ha realizado cada cliente.



- Modifique el nombre de las vista listado_pagos_clientes y asígnele el nombre listado_de_pagos. Una vez que haya modificado el nombre de la vista ejecute una consulta utilizando el nuevo nombre de la vista para comprobar que sigue funcionando correctamente.



- Elimine las vistas que ha creado en los pasos anteriores.



</div>
