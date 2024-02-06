# TAREA 7
## 1. Listar los coches vendidos con sus modelos y precios, junto con los nombres de los clientes que los compraron.
```sql
select co.modelo, co.marca, co.precio from coches as co, clientes as cl, ventas as v where v.id_coche = co.id_coche and v.id_cliente = cl.id_cliente;
┌────────────────┬────────────┬─────────┐
│     modelo     │   marca    │ precio  │
├────────────────┼────────────┼─────────┤
│ Sedán 2022     │ Toyota     │ 25000.0 │
│ Hatchback 2021 │ Honda      │ 22000.0 │
│ SUV 2023       │ Ford       │ 30000.0 │
│ Coupé 2022     │ Chevrolet  │ 28000.0 │
│ Camioneta 2023 │ Nissan     │ 32000.0 │
│ Compacto 2021  │ Volkswagen │ 20000.0 │
│ Híbrido 2022   │ Hyundai    │ 27000.0 │
│ Deportivo 2023 │ Mazda      │ 35000.0 │
│ Eléctrico 2021 │ Tesla      │ 40000.0 │
└────────────────┴────────────┴─────────┘

```
## 2. Encontrar los clientes que han comprado coches con precios superiores al promedio de todos los coches vendidos.
```sql
select cl.nombre, co.marca, co.precio from coches as co, clientes as cl, ventas as v where v.id_coche = co.id_coche and v.id_cliente = cl.id_cliente and co.precio > (select AVG(precio) from coches);
┌─────────────────┬────────┬─────────┐
│     nombre      │ marca  │ precio  │
├─────────────────┼────────┼─────────┤
│ Carlos López    │ Ford   │ 30000.0 │
│ Pedro Rodríguez │ Nissan │ 32000.0 │
│ Isabel Díaz     │ Mazda  │ 35000.0 │
│ Elena Torres    │ Tesla  │ 40000.0 │
└─────────────────┴────────┴─────────┘

```
## 3. Mostrar los modelos de coches y sus precios que no han sido vendidos aún:
```sql
select modelo, precio from coches where id_coche not in (select id_coche from ventas);
┌─────────────┬─────────┐
│   modelo    │ precio  │
├─────────────┼─────────┤
│ Pickup 2022 │ 31000.0 │
└─────────────┴─────────┘

```
## 4. Calcular el total gastado por todos los clientes en coches:
```sql
select sum(precio) as gastos_totales_clientes from coches as c, ventas as v where c.id_coche = v.id_coche;
┌─────────────────────────┐
│ gastos_totales_clientes │
├─────────────────────────┤
│ 259000.0                │
└─────────────────────────┘

```
## 5. Listar los coches vendidos junto con la fecha de venta y el nombre del cliente, ordenados por fecha de venta de forma descendente:
```sql
select co.marca, co.modelo, v.fecha_venta, cl.nombre from coches as co, ventas as v, clientes as cl where cl.id_cliente = v.id_cliente and co.id_coche = v.id_coche order by(fecha_venta) desc;
┌────────────┬────────────────┬─────────────┬─────────────────┐
│   marca    │     modelo     │ fecha_venta │     nombre      │
├────────────┼────────────────┼─────────────┼─────────────────┤
│ Tesla      │ Eléctrico 2021 │ 2023-10-05  │ Elena Torres    │
│ Mazda      │ Deportivo 2023 │ 2023-08-25  │ Isabel Díaz     │
│ Hyundai    │ Híbrido 2022   │ 2023-07-20  │ Miguel González │
│ Volkswagen │ Compacto 2021  │ 2023-06-15  │ Laura Sánchez   │
│ Nissan     │ Camioneta 2023 │ 2023-05-05  │ Pedro Rodríguez │
│ Chevrolet  │ Coupé 2022     │ 2023-04-10  │ Ana Martínez    │
│ Ford       │ SUV 2023       │ 2023-03-25  │ Carlos López    │
│ Honda      │ Hatchback 2021 │ 2023-02-20  │ María Gómez     │
│ Toyota     │ Sedán 2022     │ 2023-01-15  │ Juan Pérez      │
└────────────┴────────────────┴─────────────┴─────────────────┘

```
## 6. Encontrar el modelo de coche más caro.
```sql
select modelo as modelo_mas_caro from coches  where precio = (select max(precio) from coches);

```
## 7. Mostrar los clientes que han comprado al menos un coche (un coche o más) y la cantidad de coches comprados.
```sql
sqlite> select c.nombre, count(v.id_coche) as cantidad_coches_comprados from clientes as c, ventas as v where c.id_cliente = v.id_cliente group by c.id_cliente;
┌─────────────────┬───────────────────────────┐
│     nombre      │ cantidad_coches_comprados │
├─────────────────┼───────────────────────────┤
│ Juan Pérez      │ 1                         │
│ María Gómez     │ 1                         │
│ Carlos López    │ 1                         │
│ Ana Martínez    │ 1                         │
│ Pedro Rodríguez │ 1                         │
│ Laura Sánchez   │ 1                         │
│ Miguel González │ 1                         │
│ Isabel Díaz     │ 1                         │
│ Elena Torres    │ 1                         │
└─────────────────┴───────────────────────────┘

```
## 8. Encontrar los clientes que han comprado coches de la marca 'Toyota':
```sql
select cl.nombre, co.marca from clientes as cl, coches as co, ventas as v where cl.id_cliente = v.id_cliente and co.id_coche = v.id_coche and co.marca = "Toyota";
┌────────────┬────────┐
│   nombre   │ marca  │
├────────────┼────────┤
│ Juan Pérez │ Toyota │
└────────────┴────────┘

```
## 9. Calcular el promedio de edad de los clientes que han comprado coches de más de 25,000.
```sql
select avg(cl.edad) as edad_media from clientes as cl, coches as co, ventas as v where cl.id_cliente = v.id_cliente and co.id_coche = v.id_coche and co.precio > "25.000";
┌──────────────────┐
│    edad_media    │
├──────────────────┤
│ 31.5555555555556 │
└──────────────────┘
```
## 10. Mostrar los modelos de coches y sus precios que fueron comprados por clientes mayores de 30 años.
```sql
select co.modelo, co.precio from clientes as cl, coches as co, ventas as v where cl.id_cliente = v.id_cliente and co.id_coche = v.id_coche and cl.edad > "30";
┌────────────────┬─────────┐
│     modelo     │ precio  │
├────────────────┼─────────┤
│ SUV 2023       │ 30000.0 │
│ Camioneta 2023 │ 32000.0 │
│ Compacto 2021  │ 20000.0 │
│ Deportivo 2023 │ 35000.0 │
└────────────────┴─────────┘

```
## 11. Encontrar los coches vendidos en el año 2022 junto con la cantidad total de ventas en ese año.
```sql
elect c.modelo, count(v.id_coche) as total_ventas_2022 from coches as c, ventas as v where c.id_coche = v.id_coche and v.fecha_venta regexp '^2022';
┌────────┬───────────────────┐
│ modelo │ total_ventas_2022 │
├────────┼───────────────────┤
│        │ 0                 │
└────────┴───────────────────┘

```
## 12. Listar los coches cuyos precios son mayores que el precio promedio de coches vendidos a clientes menores de 30 años.
```sql
select co.modelo, co.marca, co.precio from clientes as cl, coches as co, ventas as v where cl.id_cliente = v.id_cliente and co.id_coche = v.id_coche and cl.edad < "30" and co.precio > (select avg(precio) from coches);
┌────────────────┬───────┬─────────┐
│     modelo     │ marca │ precio  │
├────────────────┼───────┼─────────┤
│ Eléctrico 2021 │ Tesla │ 40000.0 │
└────────────────┴───────┴─────────┘

```
## 13. Calcular el total de ventas por marca de coche, ordenado de forma descendente por el total de ventas:
```sql
select c.marca, sum(v.id_coche) as total_ventas from coches as c, ventas as v where c.id_coche = v.id_coche group by c.marca order by total_ventas desc;┌────────────┬──────────────┐
│   marca    │ total_ventas │
├────────────┼──────────────┤
│ Tesla      │ 10           │
│ Mazda      │ 8            │
│ Hyundai    │ 7            │
│ Volkswagen │ 6            │
│ Nissan     │ 5            │
│ Chevrolet  │ 4            │
│ Ford       │ 3            │
│ Honda      │ 2            │
│ Toyota     │ 1            │
└────────────┴──────────────┘
```
