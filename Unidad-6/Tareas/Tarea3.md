<div align="center">

# TAREA 3

## CONSULTAS:

### Realiza las siguientes consultas:
</div>

- Mostrar todos los clientes.

```sql
select * from clientes;
+------------+----------------+----------------+
| id_cliente | nombre_cliente | ciudad_cliente |
+------------+----------------+----------------+
|          1 | Juan           | Ciudad A       |
|          2 | María          | Ciudad B       |
|          3 | Pedro          | Ciudad C       |
+------------+----------------+----------------+

```

- Mostrar todas las órdenes.

```sql
select * from ordenes;
+----------+------------+-------------+
| id_orden | id_cliente | fecha_orden |
+----------+------------+-------------+
|        1 |          1 | 2024-03-01  |
|        2 |          2 | 2024-03-02  |
|        3 |          3 | 2024-03-03  |
+----------+------------+-------------+

```

- Mostrar todos los productos.
```sql
select * from productos;
+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           1 | Producto A      |           50.00 |
|           2 | Producto B      |           75.00 |
|           3 | Producto C      |          100.00 |
+-------------+-----------------+-----------------+

```
- Mostrar todos los detalles de las órdenes.
```sql
select * from detalles_ordenes;
+------------+----------+-------------+----------+
| id_detalle | id_orden | id_producto | cantidad |
+------------+----------+-------------+----------+
|          1 |        1 |           1 |        2 |
|          2 |        2 |           2 |        1 |
|          3 |        3 |           3 |        3 |
+------------+----------+-------------+----------+

```
- Mostrar los primeros 5 clientes ordenados por nombre.
```sql
select * from clientes limit 5;
+------------+----------------+----------------+
| id_cliente | nombre_cliente | ciudad_cliente |
+------------+----------------+----------------+
|          1 | Juan           | Ciudad A       |
|          2 | María          | Ciudad B       |
|          3 | Pedro          | Ciudad C       |
+------------+----------------+----------------+

```
- Mostrar los productos con un precio mayor a 50.
```sql
select * from productos where precio_producto > 50.00;
+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           2 | Producto B      |           75.00 |
|           3 | Producto C      |          100.00 |
+-------------+-----------------+-----------------+

```
- Mostrar todas las órdenes realizadas por el cliente con ID 1.
```sql
select * from ordenes where id_cliente = 1;
+----------+------------+-------------+
| id_orden | id_cliente | fecha_orden |
+----------+------------+-------------+
|        1 |          1 | 2024-03-01  |
+----------+------------+-------------+

```
- Mostrar los clientes cuyos nombres comienzan con la letra "A".
```sql
 select * from clientes where nombre_cliente regexp '^A';
Empty set
```
- Mostrar las órdenes que contienen más de 2 productos.
```sql
select o.id_orden, o.id_cliente, o.fecha_orden from ordenes as o join detalles_ordenes as do on do.id_orden = o.id_orden where do.cantidad > 2;
+----------+------------+-------------+
| id_orden | id_cliente | fecha_orden |
+----------+------------+-------------+
|        3 |          3 | 2024-03-03  |
+----------+------------+-------------+

```
- Mostrar los productos ordenados por precio de forma descendente.
```sql
select * from productos order by precio_producto desc;
+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           3 | Producto C      |          100.00 |
|           2 | Producto B      |           75.00 |
|           1 | Producto A      |           50.00 |
+-------------+-----------------+-----------------+

```
- Seleccionar todos los clientes y sus órdenes, incluso si no tienen órdenes.
```sql
select * from clientes as c join ordenes as o where c.id_cliente = o.id_cliente;
+------------+----------------+----------------+----------+------------+-------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden |
+------------+----------------+----------------+----------+------------+-------------+
|          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |
|          2 | María          | Ciudad B       |        2 |          2 | 2024-03-02  |
|          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |
+------------+----------------+----------------+----------+------------+-------------+

```
- Seleccionar todas las órdenes junto con los productos correspondientes.
```sql
select p.id_producto, p.nombre_producto, p.precio_producto, o.id_orden, o.fecha_orden from detalles_ordenes as do join ordenes as o on o.id_orden = do.id_orden join productos as p on p.id_producto = do.id_producto;
+-------------+-----------------+-----------------+----------+-------------+
| id_producto | nombre_producto | precio_producto | id_orden | fecha_orden |
+-------------+-----------------+-----------------+----------+-------------+
|           1 | Producto A      |           50.00 |        1 | 2024-03-01  |
|           2 | Producto B      |           75.00 |        2 | 2024-03-02  |
|           3 | Producto C      |          100.00 |        3 | 2024-03-03  |
+-------------+-----------------+-----------------+----------+-------------+

```
- Mostrar el nombre de los clientes que han realizado órdenes de productos que cuestan más de 50.
```sql
select c.nombre_cliente from clientes as c join ordenes as o on c.id_cliente = o.id_cliente join detalles_ordenes as do on do.id_orden = o.id_orden join productos as p on p.id_producto = do.id_producto where p.precio_pro
ducto > 50;
+----------------+
| nombre_cliente |
+----------------+
| María          |
| Pedro          |
+----------------+

```
- Obtener el nombre de los productos que no se han ordenado aún.
```sql
select p.nombre_producto from productos as p where p.id_producto not in(select id_producto from detalles_ordenes);
Empty set
```
- Mostrar el nombre del cliente, el producto y la cantidad para todas las órdenes.
```sql

```
- Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos.
```sql

```
- Mostrar todas las órdenes con sus clientes y productos, incluso si no hay órdenes.
```sql

```
- Obtener el nombre de los clientes junto con el número total de órdenes que han realizado.
```sql

```
- Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto.
```sql

```
- Mostrar todas las órdenes con sus productos y clientes, incluso si no hay información de cliente.
```sql

```
- Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos, incluyendo los productos que no han sido ordenados.
```sql

```
- Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto, incluyendo las órdenes sin productos.
```sql

```
- Obtener el nombre de los clientes junto con el número total de órdenes que han realizado, incluyendo los clientes que no han realizado órdenes.
```sql

```
- Mostrar todas las órdenes con sus clientes y productos, incluyendo las órdenes y productos que no tienen información.
```sql

```
- Realizar un inner join entre clientes y órdenes.
```sql

```
- Realizar un left join entre órdenes y detalles de órdenes.
```sql

```
- Realizar un right join entre productos y detalles de órdenes.
```sql

```
- Realizar un full join entre clientes y órdenes.
```sql

```
- Realizar un full join entre órdenes y detalles de órdenes.
```sql

```
- Realizar un full join entre productos y detalles de órdenes.
