## TAREA 8

## 1. Consulta para obtener el nombre y la edad de los clientes que han comprado coches de la marca Toyota.
```sql
select cl.nombre, cl.edad from clientes as cl, coches as co, ventas as v where co.id_coche = v.id_coche and cl.id_cliente = v.id_cliente and co.marca = "Toyota";
┌────────────┬──────┐
│   nombre   │ edad │
├────────────┼──────┤
│ Juan Pérez │ 30   │
└────────────┴──────┘

```
## 2. Consulta para calcular el precio promedio de los coches vendidos.
```sql
select avg(co.precio) as precio_medio_coches_vendidos from coches as co, ventas as v where co.id_coche = v.id_coche;
┌──────────────────────────────┐
│ precio_medio_coches_vendidos │
├──────────────────────────────┤
│ 28777.7777777778             │
└──────────────────────────────┘

```
## 3. Consulta para obtener el modelo y la marca de los coches vendidos a clientes menores de 30 años.
```sql
select co.modelo, co.marca from clientes as cl, coches as co, ventas as v where co.id_coche = v.id_coche and cl.id_cliente = v.id_cliente and cl.edad < "30";
┌────────────────┬───────────┐
│     modelo     │   marca   │
├────────────────┼───────────┤
│ Hatchback 2021 │ Honda     │
│ Coupé 2022     │ Chevrolet │
│ Híbrido 2022   │ Hyundai   │
│ Eléctrico 2021 │ Tesla     │
└────────────────┴───────────┘

```
## 4. Consulta para contar el número de coches vendidos de cada marca.
```sql
select co.marca, count(co.marca) as coches_vendidos from coches as co, ventas as v where v.id_coche group by(co.marca);
┌────────────┬─────────────────┐
│   marca    │ coches_vendidos │
├────────────┼─────────────────┤
│ Chevrolet  │ 9               │
│ Ford       │ 9               │
│ Honda      │ 9               │
│ Hyundai    │ 9               │
│ Mazda      │ 9               │
│ Nissan     │ 9               │
│ Ram        │ 9               │
│ Tesla      │ 9               │
│ Toyota     │ 9               │
│ Volkswagen │ 9               │
└────────────┴─────────────────┘

```
## 5. Consulta para obtener el nombre y la dirección de los clientes que han llevado a reparar sus coches en 2024.
```sql
select cl.nombre, cl.direccion, r.fecha_reparación from clientes as cl, reparacion as r where cl.id_cliente = r.id_cliente and r.fecha_reparación regexp '^2024';
┌─────────────────┬────────────────┬──────────────────┐
│     nombre      │   direccion    │ fecha_reparación │
├─────────────────┼────────────────┼──────────────────┤
│ Francisco Ruiz  │ Calle I #222   │ 2024-01-05       │
│ Elena Torres    │ Avenida J #333 │ 2024-02-10       │
│ Juan Pérez      │ Calle A #123   │ 2024-03-15       │
│ María Gómez     │ Avenida B #456 │ 2024-04-20       │
│ Carlos López    │ Calle C #789   │ 2024-05-25       │
│ Ana Martínez    │ Avenida D #101 │ 2024-06-10       │
│ Pedro Rodríguez │ Calle E #234   │ 2024-07-05       │
│ Laura Sánchez   │ Avenida F #567 │ 2024-08-15       │
│ Miguel González │ Calle G #890   │ 2024-09-20       │
│ Isabel Díaz     │ Avenida H #111 │ 2024-10-25       │
│ Francisco Ruiz  │ Calle I #222   │ 2024-11-05       │
│ Elena Torres    │ Avenida J #333 │ 2024-12-10       │
└─────────────────┴────────────────┴──────────────────┘

```
## 6. Consulta para calcular el total gastado en reparaciones por cada cliente.
```sql
(NO HAY COLUMNA DE GASTOS EN REPARACIONES)
```
## 7. Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros.
```sql
select cl.nombre, cl.edad from clientes as cl, coches as co, ventas as v where co.id_coche = v.id_coche and cl.id_cliente = v.id_cliente and co.precio > "30000";
┌─────────────────┬──────┐
│     nombre      │ edad │
├─────────────────┼──────┤
│ Pedro Rodríguez │ 40   │
│ Isabel Díaz     │ 38   │
│ Elena Torres    │ 29   │
└─────────────────┴──────┘
```
## 8. Consulta para calcular el precio medio de los coches vendidos en 2023.
```sql
select avg(co.precio) as precio_medio_coches_vendidos_2024 from coches as co, ventas as v where co.id_coche = v.id_coche;
┌───────────────────────────────────┐
│ precio_medio_coches_vendidos_2024 │
├───────────────────────────────────┤
│ 28777.7777777778                  │
└───────────────────────────────────┘

```
## 9. Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de la marca Ford.
```sql
select cl.nombre, cl.direccion, co.marca from coches as co, clientes as cl, ventas as v where v.id_coche = co.id_coche and v.id_cliente = cl.id_cliente and co.marca = "Ford";
┌──────────────┬──────────────┬───────┐
│    nombre    │  direccion   │ marca │
├──────────────┼──────────────┼───────┤
│ Carlos López │ Calle C #789 │ Ford  │
└──────────────┴──────────────┴───────┘

```
## 10. Consulta para contar el número de coches vendidos por año.
```sql
select count(co.id_coche), v.fecha_venta from coches as co, ventas as v where v.id_coche = co.id_coche group by(fecha_venta regexp '^....$');
┌────────────────────┬─────────────┐
│ count(co.id_coche) │ fecha_venta │
├────────────────────┼─────────────┤
│ 9                  │ 2023-01-15  │
└────────────────────┴─────────────┘
```
## 11. Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches.
```sql
select distinct cl.nombre, cl.edad, co.marca from clientes as cl, coches as co, ventas as v, reparacion as r where co.id_coche = v.id_coche and cl.id_cliente = v.id_cliente and cl.id_cliente = r.id_cliente and co.precio > "30000";
┌─────────────────┬──────┬────────┐
│     nombre      │ edad │ marca  │
├─────────────────┼──────┼────────┤
│ Pedro Rodríguez │ 40   │ Nissan │
│ Isabel Díaz     │ 38   │ Mazda  │
│ Elena Torres    │ 29   │ Tesla  │
└─────────────────┴──────┴────────┘

```
## 12. Consulta para calcular el precio total de los coches vendidos a clientes menores de 30 años.
```sql
select sum(co.precio) as precio_total_ventas_menores_30 from clientes as cl, coches as co, ventas as v where co.id_coche = v.id_coche and cl.id_cliente = v.id_cliente and cl.edad < "30";
┌────────────────────────────────┐
│ precio_total_ventas_menores_30 │
├────────────────────────────────┤
│ 117000.0                       │
└────────────────────────────────┘

```
## 13. Consulta para obtener el modelo y el año de los coches vendidos en 2023 y llevados a reparar.
```sql
select co.modelo, co.año from coches as co, ventas as v, reparacion as r where v.id_coche = co.id_coche = r.id_coche and r.fecha_reparación regexp '^2023';
┌────────────────┬──────┐
│     modelo     │ año  │
├────────────────┼──────┤
│ Sedán 2022     │ 2022 │
│ Hatchback 2021 │ 2021 │
│ SUV 2023       │ 2023 │
│ Coupé 2022     │ 2022 │
│ Camioneta 2023 │ 2023 │
│ Compacto 2021  │ 2021 │
│ Híbrido 2022   │ 2022 │
│ Deportivo 2023 │ 2023 │
│ Eléctrico 2021 │ 2021 │
└────────────────┴──────┘

```
## 14. Consulta para contar el número de coches vendidos por cliente.
```sql
select co.marca, count(v.id_coche) as ventas from coches as co, ventas as v where v.id_coche =co.id_coche group by(co.marca);
┌────────────┬────────┐
│   marca    │ ventas │
├────────────┼────────┤
│ Chevrolet  │ 1      │
│ Ford       │ 1      │
│ Honda      │ 1      │
│ Hyundai    │ 1      │
│ Mazda      │ 1      │
│ Nissan     │ 1      │
│ Tesla      │ 1      │
│ Toyota     │ 1      │
│ Volkswagen │ 1      │
└────────────┴────────┘

```
## 15. Consulta para obtener el nombre y el precio de los coches vendidos a clientes mayores de 35 años.
```sql
select co.marca, co.precio from clientes as cl, coches as co, ventas as v where co.id_coche = v.id_coche and cl.id_cliente = v.id_cliente and cl.edad > "35";
┌────────┬─────────┐
│ marca  │ precio  │
├────────┼─────────┤
│ Nissan │ 32000.0 │
│ Mazda  │ 35000.0 │
└────────┴─────────┘

```
## 16. Consulta para calcular el precio total de los coches vendidos a clientes que viven en una calle (en la dirección).
```sql
select sum(co.precio) as precio_total_clientes_calles from ventas as v, clientes as cl, coches as co where v.id_coche = co.id_coche and v.id_cliente = cl.id_cliente and cl.direccion regexp 'Calle';
┌──────────────────────────────┐
│ precio_total_clientes_calles │
├──────────────────────────────┤
│ 114000.0                     │
└──────────────────────────────┘

```
## 17. Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches en 2024.
```sql
select cl.nombre, cl.direccion from coches as co, clientes as cl, reparacion as r where r.id_coche = co.id_coche and r.id_cliente = cl.id_cliente and r.fecha_reparación regexp '^2024';
┌─────────────────┬────────────────┐
│     nombre      │   direccion    │
├─────────────────┼────────────────┤
│ Francisco Ruiz  │ Calle I #222   │
│ Elena Torres    │ Avenida J #333 │
│ Juan Pérez      │ Calle A #123   │
│ María Gómez     │ Avenida B #456 │
│ Carlos López    │ Calle C #789   │
│ Ana Martínez    │ Avenida D #101 │
│ Pedro Rodríguez │ Calle E #234   │
│ Laura Sánchez   │ Avenida F #567 │
│ Miguel González │ Calle G #890   │
│ Isabel Díaz     │ Avenida H #111 │
│ Francisco Ruiz  │ Calle I #222   │
│ Elena Torres    │ Avenida J #333 │
└─────────────────┴────────────────┘
```
## 18. Consulta para calcular el precio medio de los coches vendidos en 2023 y llevados a reparar por clientes menores de 30 años..
```sql
select avg(co.precio) as prec_medio_clientes_menores_30_taller_2024 from coches as co, clientes as cl, ventas as v, reparacion as r where r.id_cliente = cl.id_cliente = v.id_cliente and r.id_coche = co.id_coche = v.id_coche and cl.edad < "30" and v.fecha_venta regexp '^2023';
┌────────────────────────────────────────────┐
│ prec_medio_clientes_menores_30_taller_2024 │
├────────────────────────────────────────────┤
│ 29250.0                                    │
└────────────────────────────────────────────┘

```
## 19. Consulta para obtener el modelo y el año de los coches *comprados* por clientes que tienen una dirección que contiene la palabra "Avenida".
```sql
select co.modelo, co.precio from ventas as v, clientes as cl, coches as co where v.id_coche = co.id_coche and v.id_cliente = cl.id_cliente and cl.direccion regexp 'Avenida';
┌────────────────┬─────────┐
│     modelo     │ precio  │
├────────────────┼─────────┤
│ Hatchback 2021 │ 22000.0 │
│ Coupé 2022     │ 28000.0 │
│ Compacto 2021  │ 20000.0 │
│ Deportivo 2023 │ 35000.0 │
│ Eléctrico 2021 │ 40000.0 │
└────────────────┴─────────┘
```
## 20. Consulta para contar el número de reparaciones realizadas en 2024 por cada cliente.
```sql
select cl.nombre, count(r.id_cliente) as reparaciones_2024 from clientes as cl, reparacion as r where r.id_cliente= cl.id_cliente and r.fecha_reparación regexp '^2024' group by(r.id_cliente);
┌─────────────────┬───────────────────┐
│     nombre      │ reparaciones_2024 │
├─────────────────┼───────────────────┤
│ Juan Pérez      │ 1                 │
│ María Gómez     │ 1                 │
│ Carlos López    │ 1                 │
│ Ana Martínez    │ 1                 │
│ Pedro Rodríguez │ 1                 │
│ Laura Sánchez   │ 1                 │
│ Miguel González │ 1                 │
│ Isabel Díaz     │ 1                 │
│ Francisco Ruiz  │ 2                 │
│ Elena Torres    │ 2                 │
└─────────────────┴───────────────────┘

```
