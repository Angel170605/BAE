<div align="center">
# TAREA 3
## CONSULTAS:
Realiza las siguientes consultas:
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

```
- Mostrar los primeros 5 clientes ordenados por nombre.
```sql

```
- Mostrar los productos con un precio mayor a 50.
```sql

```
- Mostrar todas las órdenes realizadas por el cliente con ID 1.
```sql

```
- Mostrar los clientes cuyos nombres comienzan con la letra "A".
```sql

```
- Mostrar las órdenes que contienen más de 2 productos.
```sql

```
- Mostrar los productos ordenados por precio de forma descendente.
```sql

```
- Seleccionar todos los clientes y sus órdenes, incluso si no tienen órdenes.
```sql

```
- Seleccionar todas las órdenes junto con los productos correspondientes.
```sql

```
- Mostrar el nombre de los clientes que han realizado órdenes de productos que cuestan más de 50.
```sql

```
- Obtener el nombre de los productos que no se han ordenado aún.
```sql

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
