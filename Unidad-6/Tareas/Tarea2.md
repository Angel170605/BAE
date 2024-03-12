<div align="center">

# TAREA 2 

    
## 1. MIGRACIÓN DE LA TABLA A MYSQL

</div>

``` sql
CREATE DATABASE IF NOT EXISTS practica_joins;

-- Usar la base de datos
USE practica_joins;

-- Crear la tabla de clientes
CREATE TABLE clientes (
id_cliente INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    direccion VARCHAR(100),
    primary key(id_cliente)
);

-- Insertar 20 registros de ejemplo en la tabla de clientes
INSERT INTO clientes (nombre, direccion) VALUES
    ('Cliente 1', 'Dirección 1'),
    ('Cliente 2', 'Dirección 2'),
    ('Cliente 3', 'Dirección 3'),
    ('Cliente 4', 'Dirección 4'),
    ('Cliente 5', 'Dirección 5'),
    ('Cliente 6', 'Dirección 6'),
    ('Cliente 7', 'Dirección 7'),
    ('Cliente 8', 'Dirección 8'),
    ('Cliente 9', 'Dirección 9'),
    ('Cliente 10', 'Dirección 10'),
    ('Cliente 11', 'Dirección 11'),
    ('Cliente 12', 'Dirección 12'),
    ('Cliente 13', 'Dirección 13'),
    ('Cliente 14', 'Dirección 14'),
    ('Cliente 15', 'Dirección 15'),
    ('Cliente 16', 'Dirección 16'),
    ('Cliente 17', 'Dirección 17'),
    ('Cliente 18', 'Dirección 18'),
    ('Cliente 19', 'Dirección 19'),
    ('Cliente 20', 'Dirección 20');

-- Crear la tabla de productos
CREATE TABLE IF NOT EXISTS productos (
id_producto INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    precio FLOAT,
    PRIMARY KEY(id_producto)
);

-- Insertar 20 registros de ejemplo en la tabla de productos
INSERT INTO productos (nombre, precio) VALUES
    ('Producto 1', 10.99),
    ('Producto 2', 20.50),
    ('Producto 3', 30.99),
    ('Producto 4', 40.50),
    ('Producto 5', 50.99),
    ('Producto 6', 60.50),
    ('Producto 7', 70.99),
    ('Producto 8', 80.50),
    ('Producto 9', 90.99),
    ('Producto 10', 100.50),
    ('Producto 11', 110.99),
    ('Producto 12', 120.50),
    ('Producto 13', 130.99),
    ('Producto 14', 140.50),
    ('Producto 15', 150.99),
    ('Producto 16', 160.50),
    ('Producto 17', 170.99),
    ('Producto 18', 180.50),
    ('Producto 19', 190.99),
    ('Producto 20', 200.50);

-- Crear la tabla de órdenes
CREATE TABLE IF NOT EXISTS ordenes (
id_orden INT AUTO_INCREMENT,
    id_cliente INT,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    PRIMARY KEY(id_orden)
);

-- Insertar 20 registros de ejemplo en la tabla de órdenes
INSERT INTO ordenes (id_cliente, id_producto, cantidad) VALUES
    (1, 1, 2),
    (2, 2, 1),
    (3, 3, 3),
    (4, 4, 2),
    (5, 5, 1),
    (6, 6, 2),
    (7, 7, 3),
    (8, 8, 2),
    (9, 9, 1),
    (10, 10, 2),
    (11, 11, 3),
    (12, 12, 2),
    (13, 13, 1),
    (14, 14, 2),
    (15, 15, 3),
    (16, 16, 2),
    (17, 17, 1),
    (18, 18, 2),
    (19, 19, 3),
    (20, 20, 2);
```

<div align="center">

## 2. CONSULTAS

</div>
<div align="justify">

Realiza la migración a __MySql__ y realiza las siguientes consultas:

- Consultas simples:
  - 1. Mostrar todos los clientes.
    
```sql
select * from clientes;
+------------+------------+---------------+
| id_cliente | nombre     | direccion     |
+------------+------------+---------------+
|          1 | Cliente 1  | Dirección 1   |
|          2 | Cliente 2  | Dirección 2   |
|          3 | Cliente 3  | Dirección 3   |
|          4 | Cliente 4  | Dirección 4   |
|          5 | Cliente 5  | Dirección 5   |
|          6 | Cliente 6  | Dirección 6   |
|          7 | Cliente 7  | Dirección 7   |
|          8 | Cliente 8  | Dirección 8   |
|          9 | Cliente 9  | Dirección 9   |
|         10 | Cliente 10 | Dirección 10  |
|         11 | Cliente 11 | Dirección 11  |
|         12 | Cliente 12 | Dirección 12  |
|         13 | Cliente 13 | Dirección 13  |
|         14 | Cliente 14 | Dirección 14  |
|         15 | Cliente 15 | Dirección 15  |
|         16 | Cliente 16 | Dirección 16  |
|         17 | Cliente 17 | Dirección 17  |
|         18 | Cliente 18 | Dirección 18  |
|         19 | Cliente 19 | Dirección 19  |
|         20 | Cliente 20 | Dirección 20  |
+------------+------------+---------------+
  ```
  
  - 2. Mostrar todos los productos.
     
  ```sql
select * from productos;
+-------------+-------------+--------+
| id_producto | nombre      | precio |
+-------------+-------------+--------+
|           1 | Producto 1  |  10.99 |
|           2 | Producto 2  |   20.5 |
|           3 | Producto 3  |  30.99 |
|           4 | Producto 4  |   40.5 |
|           5 | Producto 5  |  50.99 |
|           6 | Producto 6  |   60.5 |
|           7 | Producto 7  |  70.99 |
|           8 | Producto 8  |   80.5 |
|           9 | Producto 9  |  90.99 |
|          10 | Producto 10 |  100.5 |
|          11 | Producto 11 | 110.99 |
|          12 | Producto 12 |  120.5 |
|          13 | Producto 13 | 130.99 |
|          14 | Producto 14 |  140.5 |
|          15 | Producto 15 | 150.99 |
|          16 | Producto 16 |  160.5 |
|          17 | Producto 17 | 170.99 |
|          18 | Producto 18 |  180.5 |
|          19 | Producto 19 | 190.99 |
|          20 | Producto 20 |  200.5 |
+-------------+-------------+--------+

  ```
  
  - 3. Mostrar todas las órdenes.
   
  ```sql
select * from ordenes;
+----------+------------+-------------+----------+
| id_orden | id_cliente | id_producto | cantidad |
+----------+------------+-------------+----------+
|        1 |          1 |           1 |        2 |
|        2 |          2 |           2 |        1 |
|        3 |          3 |           3 |        3 |
|        4 |          4 |           4 |        2 |
|        5 |          5 |           5 |        1 |
|        6 |          6 |           6 |        2 |
|        7 |          7 |           7 |        3 |
|        8 |          8 |           8 |        2 |
|        9 |          9 |           9 |        1 |
|       10 |         10 |          10 |        2 |
|       11 |         11 |          11 |        3 |
|       12 |         12 |          12 |        2 |
|       13 |         13 |          13 |        1 |
|       14 |         14 |          14 |        2 |
|       15 |         15 |          15 |        3 |
|       16 |         16 |          16 |        2 |
|       17 |         17 |          17 |        1 |
|       18 |         18 |          18 |        2 |
|       19 |         19 |          19 |        3 |
|       20 |         20 |          20 |        2 |
+----------+------------+-------------+----------+

  ```
  
  - 4. Mostrar los primeros 5 clientes ordenados por nombre.
   
  ```sql
select * from clientes order by nombre limit 5;
+------------+------------+---------------+
| id_cliente | nombre     | direccion     |
+------------+------------+---------------+
|          1 | Cliente 1  | Dirección 1   |
|         10 | Cliente 10 | Dirección 10  |
|         11 | Cliente 11 | Dirección 11  |
|         12 | Cliente 12 | Dirección 12  |
|         13 | Cliente 13 | Dirección 13  |
+------------+------------+---------------+

  ```
  
  - 5. Mostrar los productos con un precio mayor a 50.
   
  ```sql
select * from productos where precio > 50;
+-------------+-------------+--------+
| id_producto | nombre      | precio |
+-------------+-------------+--------+
|           5 | Producto 5  |  50.99 |
|           6 | Producto 6  |   60.5 |
|           7 | Producto 7  |  70.99 |
|           8 | Producto 8  |   80.5 |
|           9 | Producto 9  |  90.99 |
|          10 | Producto 10 |  100.5 |
|          11 | Producto 11 | 110.99 |
|          12 | Producto 12 |  120.5 |
|          13 | Producto 13 | 130.99 |
|          14 | Producto 14 |  140.5 |
|          15 | Producto 15 | 150.99 |
|          16 | Producto 16 |  160.5 |
|          17 | Producto 17 | 170.99 |
|          18 | Producto 18 |  180.5 |
|          19 | Producto 19 | 190.99 |
|          20 | Producto 20 |  200.5 |
+-------------+-------------+--------+

  ```
  
  - 6. Mostrar todas las órdenes realizadas por el cliente con ID 1.
   
  ```sql

  ```
  
  - 7. Mostrar los clientes cuyos nombres comienzan con la letra "M".
   
  ```sql
select * from clientes where nombre regexp '^M';
Empty set (0,01 sec)

  ```
  
  - 8. Mostrar las órdenes que contienen más de 2 productos.
   
  ```sql
select * from ordenes where cantidad > 2;
+----------+------------+-------------+----------+
| id_orden | id_cliente | id_producto | cantidad |
+----------+------------+-------------+----------+
|        3 |          3 |           3 |        3 |
|        7 |          7 |           7 |        3 |
|       11 |         11 |          11 |        3 |
|       15 |         15 |          15 |        3 |
|       19 |         19 |          19 |        3 |
+----------+------------+-------------+----------+

  ```
  
  - 9. Mostrar los productos ordenados por precio de forma descendente.
   
  ```sql
select * from productos order by precio desc;
+-------------+-------------+--------+
| id_producto | nombre      | precio |
+-------------+-------------+--------+
|          20 | Producto 20 |  200.5 |
|          19 | Producto 19 | 190.99 |
|          18 | Producto 18 |  180.5 |
|          17 | Producto 17 | 170.99 |
|          16 | Producto 16 |  160.5 |
|          15 | Producto 15 | 150.99 |
|          14 | Producto 14 |  140.5 |
|          13 | Producto 13 | 130.99 |
|          12 | Producto 12 |  120.5 |
|          11 | Producto 11 | 110.99 |
|          10 | Producto 10 |  100.5 |
|           9 | Producto 9  |  90.99 |
|           8 | Producto 8  |   80.5 |
|           7 | Producto 7  |  70.99 |
|           6 | Producto 6  |   60.5 |
|           5 | Producto 5  |  50.99 |
|           4 | Producto 4  |   40.5 |
|           3 | Producto 3  |  30.99 |
|           2 | Producto 2  |   20.5 |
|           1 | Producto 1  |  10.99 |
+-------------+-------------+--------+

  ```
  

- Consultas de ejemplo para practicar joins

  - 1. Seleccionar todos los clientes y sus órdenes, incluso si no tienen órdenes
   
```sql
select * from clientes as c join ordenes as o on c.id_cliente = o.id_clie
nte;
+------------+------------+---------------+----------+------------+-------------+----------+
| id_cliente | nombre     | direccion     | id_orden | id_cliente | id_producto | cantidad |
+------------+------------+---------------+----------+------------+-------------+----------+
|          1 | Cliente 1  | Dirección 1   |        1 |          1 |           1 |        2 |
|          2 | Cliente 2  | Dirección 2   |        2 |          2 |           2 |        1 |
|          3 | Cliente 3  | Dirección 3   |        3 |          3 |           3 |        3 |
|          4 | Cliente 4  | Dirección 4   |        4 |          4 |           4 |        2 |
|          5 | Cliente 5  | Dirección 5   |        5 |          5 |           5 |        1 |
|          6 | Cliente 6  | Dirección 6   |        6 |          6 |           6 |        2 |
|          7 | Cliente 7  | Dirección 7   |        7 |          7 |           7 |        3 |
|          8 | Cliente 8  | Dirección 8   |        8 |          8 |           8 |        2 |
|          9 | Cliente 9  | Dirección 9   |        9 |          9 |           9 |        1 |
|         10 | Cliente 10 | Dirección 10  |       10 |         10 |          10 |        2 |
|         11 | Cliente 11 | Dirección 11  |       11 |         11 |          11 |        3 |
|         12 | Cliente 12 | Dirección 12  |       12 |         12 |          12 |        2 |
|         13 | Cliente 13 | Dirección 13  |       13 |         13 |          13 |        1 |
|         14 | Cliente 14 | Dirección 14  |       14 |         14 |          14 |        2 |
|         15 | Cliente 15 | Dirección 15  |       15 |         15 |          15 |        3 |
|         16 | Cliente 16 | Dirección 16  |       16 |         16 |          16 |        2 |
|         17 | Cliente 17 | Dirección 17  |       17 |         17 |          17 |        1 |
|         18 | Cliente 18 | Dirección 18  |       18 |         18 |          18 |        2 |
|         19 | Cliente 19 | Dirección 19  |       19 |         19 |          19 |        3 |
|         20 | Cliente 20 | Dirección 20  |       20 |         20 |          20 |        2 |
+------------+------------+---------------+----------+------------+-------------+----------+

  ```
  
  - 2. Seleccionar todas las órdenes junto con los productos correspondientes
   
  ```sql
select * from productos as p join ordenes as o on p.id_producto = o.id_producto;
+-------------+-------------+--------+----------+------------+-------------+----------+
| id_producto | nombre      | precio | id_orden | id_cliente | id_producto | cantidad |
+-------------+-------------+--------+----------+------------+-------------+----------+
|           1 | Producto 1  |  10.99 |        1 |          1 |           1 |        2 |
|           2 | Producto 2  |   20.5 |        2 |          2 |           2 |        1 |
|           3 | Producto 3  |  30.99 |        3 |          3 |           3 |        3 |
|           4 | Producto 4  |   40.5 |        4 |          4 |           4 |        2 |
|           5 | Producto 5  |  50.99 |        5 |          5 |           5 |        1 |
|           6 | Producto 6  |   60.5 |        6 |          6 |           6 |        2 |
|           7 | Producto 7  |  70.99 |        7 |          7 |           7 |        3 |
|           8 | Producto 8  |   80.5 |        8 |          8 |           8 |        2 |
|           9 | Producto 9  |  90.99 |        9 |          9 |           9 |        1 |
|          10 | Producto 10 |  100.5 |       10 |         10 |          10 |        2 |
|          11 | Producto 11 | 110.99 |       11 |         11 |          11 |        3 |
|          12 | Producto 12 |  120.5 |       12 |         12 |          12 |        2 |
|          13 | Producto 13 | 130.99 |       13 |         13 |          13 |        1 |
|          14 | Producto 14 |  140.5 |       14 |         14 |          14 |        2 |
|          15 | Producto 15 | 150.99 |       15 |         15 |          15 |        3 |
|          16 | Producto 16 |  160.5 |       16 |         16 |          16 |        2 |
|          17 | Producto 17 | 170.99 |       17 |         17 |          17 |        1 |
|          18 | Producto 18 |  180.5 |       18 |         18 |          18 |        2 |
|          19 | Producto 19 | 190.99 |       19 |         19 |          19 |        3 |
|          20 | Producto 20 |  200.5 |       20 |         20 |          20 |        2 |
+-------------+-------------+--------+----------+------------+-------------+----------+

  ```
  
  - 3. Mostrar el nombre de los clientes que han realizado órdenes de productos que cuestan más de 50
   
  ```sql
select c.nombre from clientes as c join ordenes as o on c.id_cliente = o.id_cliente join productos as p on p.id_producto = o.id_producto where precio > 50;
+------------+
| nombre     |
+------------+
| Cliente 5  |
| Cliente 6  |
| Cliente 7  |
| Cliente 8  |
| Cliente 9  |
| Cliente 10 |
| Cliente 11 |
| Cliente 12 |
| Cliente 13 |
| Cliente 14 |
| Cliente 15 |
| Cliente 16 |
| Cliente 17 |
| Cliente 18 |
| Cliente 19 |
| Cliente 20 |
+------------+

  ```
  
  - 4. Obtener el nombre de los productos que no se han ordenado aún
   
  ```sql

  ```
  
  - 5. Mostrar el nombre del cliente, el producto y la cantidad para todas las órdenes
   
  ```sql

  ```
  
  - 6. Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos
   
  ```sql

  ```
  
  - 7. Mostrar todas las órdenes con sus clientes y productos, incluso si no hay órdenes
   
  ```sql

  ```
  
  - 8. Obtener el nombre de los clientes junto con el número total de órdenes que han realizado
   
  ```sql

  ```
  
  - 9. Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto
   
  ```sql

  ```
  
  - 10. Mostrar todas las órdenes con sus productos y clientes, incluso si no hay información de cliente.
   
  ```sql

  ```
  
  - 11. Obtener el nombre de los productos junto con el nombre de los clientes que han realizado órdenes de esos productos, incluyendo los productos que no han sido ordenados
   
  ```sql

  ```
  
  - 12. Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto, incluyendo las órdenes sin productos
   
  ```sql

  ```
  
  - 13. Obtener el nombre de los clientes junto con el número total de órdenes que han realizado, incluyendo los clientes que no han realizado órdenes.
   
  ```sql

  ```
  
  - 14. Mostrar todas las órdenes con sus clientes y productos, incluyendo las órdenes y productos que no tienen información.
   
  ```sql

  ```
  
</div>
