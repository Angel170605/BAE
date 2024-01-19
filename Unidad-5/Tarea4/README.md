<div align="center">

# TAREA 4 


## ÍNDICE



## 1.CREANDO_LA_BASE_DE_DATOS
</div>

<div align="justify">

El primer paso que hay que seguir para la realización de esta tarea es la creación de las bases de datos de la misma, con su respectiva información. Para ello, primero creé el archivo **supermercado-dump.sql**
> sqlite3 supermercado-dump.sql

Ya era hora de crear las tablas **ventas** y **productos** con sus repectivos inserts, gracias a los comandos los comandos ``create table`` e ``INSERT``:

```sql
CREATE TABLE productos (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    categoria TEXT,
    precio REAL
);

CREATE TABLE ventas (
    id INTEGER PRIMARY KEY,
    id_producto INTEGER,
    cantidad INTEGER,
    fecha DATE,
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);

INSERT INTO productos (id, nombre, categoria, precio) VALUES 
    (1, 'Arroz', 'Alimentos', 2.5),
    (2, 'Leche', 'Lácteos', 1.8),
    (3, 'Pan', 'Panadería', 1.2),
    (4, 'Manzanas', 'Frutas', 3.0),
    (5, 'Pollo', 'Carnes', 5.5),
    (6, 'Huevos', 'Lácteos', 1.0),
    (7, 'Yogurt', 'Lácteos', 2.0),
    (8, 'Tomates', 'Verduras', 2.2),
    (9, 'Queso', 'Lácteos', 4.0),
    (10, 'Cereal', 'Desayuno', 3.5),
    (11, 'Papel Higiénico', 'Hogar', 1.5),
    (12, 'Cepillo de Dientes', 'Higiene', 2.0),
    (13, 'Detergente', 'Limpieza', 2.8),
    (14, 'Galletas', 'Snacks', 1.7),
    (15, 'Aceite de Oliva', 'Cocina', 4.5),
    (16, 'Café', 'Bebidas', 5.0),
    (17, 'Sopa enlatada', 'Conservas', 2.3),
    (18, 'Jabón de Baño', 'Higiene', 1.2),
    (19, 'Botellas de Agua', 'Bebidas', 1.0),
    (20, 'Cerveza', 'Bebidas', 3.8);

INSERT INTO ventas (id_producto, cantidad, fecha) VALUES 
    (1, 5, '2024-01-17'),
    (2, 3, '2024-01-17'),
    (4, 2, '2024-01-17'),
    (5, 1, '2024-01-17'),
    (6, 10, '2024-01-18'),
    (8, 4, '2024-01-18'),
    (10, 2, '2024-01-18'),
    (14, 7, '2024-01-19'),
    (16, 3, '2024-01-19'),
    (18, 6, '2024-01-20');
```
  
</div>

<div align="center">

# 2.READ

</div>

<div align="justify"> 

Ahora, desde el fichero **tarea4.db** había que hacer un `.read` del sql creado enteriormente. Lo que se hace de la siguiente forma:

> .read empleados-dump.sql

De esta forma, ya la tabla e información de **empleados-dump.sql** está en este nuevo archivo.

<div align="center">

# 3.DIAGRAMAS

</div>

<div align="center">

# 4.CONSULTAS
</div>

Ahora, lo siguiente que había que hacer eran las distintas consultas de las tablas de la base de datos:

1. Mostrando todos los productos de la categoría **Bebidas**:
> select * from productos where categoria = "Bebidas";

```sql
┌────┬──────────────────┬───────────┬────────┐
│ id │      nombre      │ categoria │ precio │
├────┼──────────────────┼───────────┼────────┤
│ 16 │ Café             │ Bebidas   │ 5.0    │
│ 19 │ Botellas de Agua │ Bebidas   │ 1.0    │
│ 20 │ Cerveza          │ Bebidas   │ 3.8    │
└────┴──────────────────┴───────────┴────────┘
```
2. Listando los productos por su precio en orden descendente:
> select nombre, precio from productos order by precio desc;

```sql
┌────────────────────┬────────┐
│       nombre       │ precio │
├────────────────────┼────────┤
│ Pollo              │ 5.5    │
│ Café               │ 5.0    │
│ Aceite de Oliva    │ 4.5    │
│ Queso              │ 4.0    │
│ Cerveza            │ 3.8    │
│ Cereal             │ 3.5    │
│ Manzanas           │ 3.0    │
│ Detergente         │ 2.8    │
│ Arroz              │ 2.5    │
│ Sopa enlatada      │ 2.3    │
│ Tomates            │ 2.2    │
│ Yogurt             │ 2.0    │
│ Cepillo de Dientes │ 2.0    │
│ Leche              │ 1.8    │
│ Galletas           │ 1.7    │
│ Papel Higiénico    │ 1.5    │
│ Pan                │ 1.2    │
│ Jabón de Baño      │ 1.2    │
│ Huevos             │ 1.0    │
│ Botellas de Agua   │ 1.0    │
└────────────────────┴────────┘
```
3. Sumando el precio de todos los productos:
> select sum(precio) as precio_total_productos from productos;
```sql
┌────────────────────────┐
│ precio_total_productos │
├────────────────────────┤
│ 52.5                   │
└────────────────────────┘
```
4. Encontrando los productos que tienen la letra 'a' en su nombre:
> select from productos where nombre like ('%a%')
```sql
┌────┬──────────────────┬───────────┬────────┐
│ id │      nombre      │ categoria │ precio │
├────┼──────────────────┼───────────┼────────┤
│ 1  │ Arroz            │ Alimentos │ 2.5    │
│ 3  │ Pan              │ Panadería │ 1.2    │
│ 4  │ Manzanas         │ Frutas    │ 3.0    │
│ 8  │ Tomates          │ Verduras  │ 2.2    │
│ 10 │ Cereal           │ Desayuno  │ 3.5    │
│ 11 │ Papel Higiénico  │ Hogar     │ 1.5    │
│ 14 │ Galletas         │ Snacks    │ 1.7    │
│ 15 │ Aceite de Oliva  │ Cocina    │ 4.5    │
│ 16 │ Café             │ Bebidas   │ 5.0    │
│ 17 │ Sopa enlatada    │ Conservas │ 2.3    │
│ 18 │ Jabón de Baño    │ Higiene   │ 1.2    │
│ 19 │ Botellas de Agua │ Bebidas   │ 1.0    │
│ 20 │ Cerveza          │ Bebidas   │ 3.8    │
└────┴──────────────────┴───────────┴────────┘
```
5. Calculando el total de productos vendidos en cualquier fecha:
> select sum(cantidad) from ventas;
```sql
┌───────────────┐
│ sum(cantidad) │
├───────────────┤
│ 43            │
└───────────────┘
```
6. Encontrando el producto más caro por categoría:
> select nombre,  max(precio) as producto_mas_caro_por_categoria, categoria from productos group by categoria;
```sql
┌────────────────────┬─────────────────────────────────┬───────────┐
│       nombre       │ producto_mas_caro_por_categoria │ categoria │
├────────────────────┼─────────────────────────────────┼───────────┤
│ Arroz              │ 2.5                             │ Alimentos │
│ Café               │ 5.0                             │ Bebidas   │
│ Pollo              │ 5.5                             │ Carnes    │
│ Aceite de Oliva    │ 4.5                             │ Cocina    │
│ Sopa enlatada      │ 2.3                             │ Conservas │
│ Cereal             │ 3.5                             │ Desayuno  │
│ Manzanas           │ 3.0                             │ Frutas    │
│ Cepillo de Dientes │ 2.0                             │ Higiene   │
│ Papel Higiénico    │ 1.5                             │ Hogar     │
│ Detergente         │ 2.8                             │ Limpieza  │
│ Queso              │ 4.0                             │ Lácteos   │
│ Pan                │ 1.2                             │ Panadería │
│ Galletas           │ 1.7                             │ Snacks    │
│ Tomates            │ 2.2                             │ Verduras  │
└────────────────────┴─────────────────────────────────┴───────────┘
```
7. Listando los productos que no han sideo vendidos:
> select
```sql

```
8. Calculando el precio medio de los snacks:
> select avg(precio) from productos as precio_medio where categoria = "Snacks";
```sql
┌─────────────┐
│ avg(precio) │
├─────────────┤
│ 1.7         │
└─────────────┘

```

9. Encontrando los productos que hayan sido vendidos ,ás de 5 veces:
> select * from ventas where "cantidad" > 5;
```sql
┌────┬─────────────┬──────────┬────────────┐
│ id │ id_producto │ cantidad │   fecha    │
├────┼─────────────┼──────────┼────────────┤
│ 5  │ 6           │ 10       │ 2024-01-18 │
│ 8  │ 14          │ 7        │ 2024-01-19 │
│ 10 │ 18          │ 6        │ 2024-01-20 │
└────┴─────────────┴──────────┴────────────┘
```

10. A
> select
```sql

```

11. Encontrando los productos cuyo precio es igual o menor que 2:
> select * from productos where precio <= 2;
```sql
┌────┬────────────────────┬───────────┬────────┐
│ id │       nombre       │ categoria │ precio │
├────┼────────────────────┼───────────┼────────┤
│ 2  │ Leche              │ Lácteos   │ 1.8    │
│ 3  │ Pan                │ Panadería │ 1.2    │
│ 6  │ Huevos             │ Lácteos   │ 1.0    │
│ 7  │ Yogurt             │ Lácteos   │ 2.0    │
│ 11 │ Papel Higiénico    │ Hogar     │ 1.5    │
│ 12 │ Cepillo de Dientes │ Higiene   │ 2.0    │
│ 14 │ Galletas           │ Snacks    │ 1.7    │
│ 18 │ Jabón de Baño      │ Higiene   │ 1.2    │
│ 19 │ Botellas de Agua   │ Bebidas   │ 1.0    │
└────┴────────────────────┴───────────┴────────┘
```
12. Calculando todas las ventas hechas por fecha:
> select fecha, sum(cantidad) as productos_vendidos from ventas group by fecha;
```sql
┌────────────┬────────────────────┐
│   fecha    │ productos_vendidos │
├────────────┼────────────────────┤
│ 2024-01-17 │ 11                 │
│ 2024-01-18 │ 16                 │
│ 2024-01-19 │ 10                 │
│ 2024-01-20 │ 6                  │
└────────────┴────────────────────┘

```
13. Seleccinando todos los productos cuyo nombre empieza por **P**:
> select nombre from productos where nombre like ('P%');
```sql
┌─────────────────┐
│     nombre      │
├─────────────────┤
│ Pan             │
│ Pollo           │
│ Papel Higiénico │
└─────────────────┘
```
14. Obteniendo el producto más vendido en cuanto a cantidad se refiere:
> select id_producto, max(cantidad) from ventas;
```sql
┌─────────────┬───────────────┐
│ id_producto │ max(cantidad) │
├─────────────┼───────────────┤
│ 6           │ 10            │
└─────────────┴───────────────┘
```

15. Mostrando los productos vendidos el **18/1/2024**:
> select * from ventas where fecha = "2024-01-18";
```sql
┌────┬─────────────┬──────────┬────────────┐
│ id │ id_producto │ cantidad │   fecha    │
├────┼─────────────┼──────────┼────────────┤
│ 5  │ 6           │ 10       │ 2024-01-18 │
│ 6  │ 8           │ 4        │ 2024-01-18 │
│ 7  │ 10          │ 2        │ 2024-01-18 │
└────┴─────────────┴──────────┴────────────┘
```
16. Calcular el total de ventas por producto
> select id_producto, sum(cantidad) as ventas_totales from ventas group by id_producto;
```sql
┌─────────────┬────────────────┐
│ id_producto │ ventas_totales │
├─────────────┼────────────────┤
│ 1           │ 5              │
│ 2           │ 3              │
│ 4           │ 2              │
│ 5           │ 1              │
│ 6           │ 10             │
│ 8           │ 4              │
│ 10          │ 2              │
│ 14          │ 7              │
│ 16          │ 3              │
│ 18          │ 6              │
└─────────────┴────────────────┘
```
17. Encontrando los productos cuyo precio oscile entre 3 y 4:
> select nombre, precio from productos where 3 < precio and precio < 4;
```sql
┌─────────┬────────┐
│ nombre  │ precio │
├─────────┼────────┤
│ Cereal  │ 3.5    │
│ Cerveza │ 3.8    │
└─────────┴────────┘

```
18. Listando los productos y categorías ordenados alfabéticamente por estas últimas:
> select nombre, categoria from productos order by categoria;
```sql
┌────────────────────┬───────────┐
│       nombre       │ categoria │
├────────────────────┼───────────┤
│ Arroz              │ Alimentos │
│ Café               │ Bebidas   │
│ Botellas de Agua   │ Bebidas   │
│ Cerveza            │ Bebidas   │
│ Pollo              │ Carnes    │
│ Aceite de Oliva    │ Cocina    │
│ Sopa enlatada      │ Conservas │
│ Cereal             │ Desayuno  │
│ Manzanas           │ Frutas    │
│ Cepillo de Dientes │ Higiene   │
│ Jabón de Baño      │ Higiene   │
│ Papel Higiénico    │ Hogar     │
│ Detergente         │ Limpieza  │
│ Leche              │ Lácteos   │
│ Huevos             │ Lácteos   │
│ Yogurt             │ Lácteos   │
│ Queso              │ Lácteos   │
│ Pan                │ Panadería │
│ Galletas           │ Snacks    │
│ Tomates            │ Verduras  │
└────────────────────┴───────────┘
```
19. Calculando el precio total de los productos vendidos el **19/01/2024**:
> select sum(
```sql

```
20. Seleccionando los productos que no pertenecen a la categoría **Higiene**:
> select nombre, categoria from productos where categoria != "Higiene";
```sql
┌──────────────────┬───────────┐
│      nombre      │ categoria │
├──────────────────┼───────────┤
│ Arroz            │ Alimentos │
│ Leche            │ Lácteos   │
│ Pan              │ Panadería │
│ Manzanas         │ Frutas    │
│ Pollo            │ Carnes    │
│ Huevos           │ Lácteos   │
│ Yogurt           │ Lácteos   │
│ Tomates          │ Verduras  │
│ Queso            │ Lácteos   │
│ Cereal           │ Desayuno  │
│ Papel Higiénico  │ Hogar     │
│ Detergente       │ Limpieza  │
│ Galletas         │ Snacks    │
│ Aceite de Oliva  │ Cocina    │
│ Café             │ Bebidas   │
│ Sopa enlatada    │ Conservas │
│ Botellas de Agua │ Bebidas   │
│ Cerveza          │ Bebidas   │
└──────────────────┴───────────┘

```

21. Contando todos los productos que hay por categoría:
> select categoria, count(*) as productos_por_categoria from productos group by categoria;
```sql
┌───────────┬─────────────────────────┐
│ categoria │ productos_por_categoria │
├───────────┼─────────────────────────┤
│ Alimentos │ 1                       │
│ Bebidas   │ 3                       │
│ Carnes    │ 1                       │
│ Cocina    │ 1                       │
│ Conservas │ 1                       │
│ Desayuno  │ 1                       │
│ Frutas    │ 1                       │
│ Higiene   │ 2                       │
│ Hogar     │ 1                       │
│ Limpieza  │ 1                       │
│ Lácteos   │ 4                       │
│ Panadería │ 1                       │
│ Snacks    │ 1                       │
│ Verduras  │ 1                       │
└───────────┴─────────────────────────┘

```
22. Listando los productos cuyo precio es igual a la media de precios:
> 
</div>
