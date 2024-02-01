## TAERA 6

## 1. Obtener todos los clientes.
```sql
select * from Clientes;
┌────┬─────────────────┬───────────────────────────┐
│ id │     nombre      │           email           │
├────┼─────────────────┼───────────────────────────┤
│ 1  │ Juan Pérez      │ juan@example.com          │
│ 2  │ María Gómez     │ maria@example.com         │
│ 3  │ Carlos López    │ carlos@example.com        │
│ 4  │ Ana Rodríguez   │ ana@example.com           │
│ 5  │ Luisa Martínez  │ luisa@example.com         │
│ 6  │ Pedro Sánchez   │ pedro@example.com         │
│ 7  │ Laura García    │ laura@example.com         │
│ 8  │ Miguel Martín   │ miguel@example.com        │
│ 9  │ Elena González  │ elena@example.com         │
│ 10 │ David Torres    │ david@example.com         │
│ 11 │ Sofía Ruiz      │ sofia@example.com         │
│ 12 │ Javier López    │ javier@example.com        │
│ 13 │ Carmen Vargas   │ carmen@example.com        │
│ 14 │ Daniel Muñoz    │ daniel@example.com        │
│ 15 │ Isabel Serrano  │ isabel@example.com        │
│ 16 │ Alejandro Muñoz │ alejandro@example.com     │
│ 17 │ Raquel Herrera  │ raquel@example.com        │
│ 18 │ Francisco Mora  │ francisco@example.com     │
│ 19 │ Marina Díaz     │ marina@example.com        │
│ 20 │ Antonio Jiménez │ antonio@example.com       │
│ 21 │ Beatriz Romero  │ beatriz@example.com       │
│ 22 │ Carlos Gómez    │ carlos.gomez@example.com  │
│ 23 │ Clara Sánchez   │ clara.sanchez@example.com │
│ 24 │ Andrés Martínez │ andres@example.com        │
│ 25 │ Lucía Díaz      │ lucia@example.com         │
│ 26 │ Mario Serrano   │ mario@example.com         │
│ 27 │ Eva Torres      │ eva.torres@example.com    │
│ 28 │ Roberto Ruiz    │ roberto@example.com       │
│ 29 │ Celia García    │ celia@example.com         │
└────┴─────────────────┴───────────────────────────┘

```
## 2. Obtener la cantidad total de productos en todos los pedidos
```sql
select sum(cantidad) as total_productos_pedidos from pedidos;
┌─────────────────────────┐
│ total_productos_pedidos │
├─────────────────────────┤
│ 54                      │
└─────────────────────────┘
```
## 3. Obtener el precio promedio de los productos:
```sql
select avg(precio) as precio_medio from productos;
┌──────────────────┐
│   precio_medio   │
├──────────────────┤
│ 188.294285714286 │
└──────────────────┘
```
## 4. Obtener los clientes que tienen un email válido (contiene '@'):
```sql
select * from Clientes where email regexp '@';
┌────┬─────────────────┬───────────────────────────┐
│ id │     nombre      │           email           │
├────┼─────────────────┼───────────────────────────┤
│ 1  │ Juan Pérez      │ juan@example.com          │
│ 2  │ María Gómez     │ maria@example.com         │
│ 3  │ Carlos López    │ carlos@example.com        │
│ 4  │ Ana Rodríguez   │ ana@example.com           │
│ 5  │ Luisa Martínez  │ luisa@example.com         │
│ 6  │ Pedro Sánchez   │ pedro@example.com         │
│ 7  │ Laura García    │ laura@example.com         │
│ 8  │ Miguel Martín   │ miguel@example.com        │
│ 9  │ Elena González  │ elena@example.com         │
│ 10 │ David Torres    │ david@example.com         │
│ 11 │ Sofía Ruiz      │ sofia@example.com         │
│ 12 │ Javier López    │ javier@example.com        │
│ 13 │ Carmen Vargas   │ carmen@example.com        │
│ 14 │ Daniel Muñoz    │ daniel@example.com        │
│ 15 │ Isabel Serrano  │ isabel@example.com        │
│ 16 │ Alejandro Muñoz │ alejandro@example.com     │
│ 17 │ Raquel Herrera  │ raquel@example.com        │
│ 18 │ Francisco Mora  │ francisco@example.com     │
│ 19 │ Marina Díaz     │ marina@example.com        │
│ 20 │ Antonio Jiménez │ antonio@example.com       │
│ 21 │ Beatriz Romero  │ beatriz@example.com       │
│ 22 │ Carlos Gómez    │ carlos.gomez@example.com  │
│ 23 │ Clara Sánchez   │ clara.sanchez@example.com │
│ 24 │ Andrés Martínez │ andres@example.com        │
│ 25 │ Lucía Díaz      │ lucia@example.com         │
│ 26 │ Mario Serrano   │ mario@example.com         │
│ 27 │ Eva Torres      │ eva.torres@example.com    │
│ 28 │ Roberto Ruiz    │ roberto@example.com       │
│ 29 │ Celia García    │ celia@example.com         │
└────┴─────────────────┴───────────────────────────┘
```
## 5. Obtener el producto más caro.
```sql
select max(precio) as producto_mas_caro from productos;
┌───────────────────┐
│ producto_mas_caro │
├───────────────────┤
│ 1200.0            │
└───────────────────┘
```
## 6. Obtener los pedidos realizados en febrero de 2024.
```sql
select * from pedidos where fecha_pedido regexp '^2024-02';
┌───────────┬────────────┬─────────────┬──────────┬──────────────┐
│ id_pedido │ id_cliente │ id_producto │ cantidad │ fecha_pedido │
├───────────┼────────────┼─────────────┼──────────┼──────────────┤
│ 1         │ 1          │ 1           │ 2        │ 2024-02-01   │
│ 2         │ 2          │ 2           │ 1        │ 2024-02-02   │
│ 3         │ 3          │ 3           │ 3        │ 2024-02-03   │
│ 4         │ 4          │ 4           │ 1        │ 2024-02-04   │
│ 5         │ 5          │ 5           │ 2        │ 2024-02-05   │
│ 6         │ 6          │ 6           │ 1        │ 2024-02-06   │
│ 7         │ 7          │ 7           │ 3        │ 2024-02-07   │
│ 8         │ 8          │ 8           │ 2        │ 2024-02-08   │
│ 9         │ 9          │ 9           │ 1        │ 2024-02-09   │
│ 10        │ 10         │ 10          │ 2        │ 2024-02-10   │
│ 11        │ 11         │ 11          │ 1        │ 2024-02-11   │
│ 12        │ 12         │ 12          │ 3        │ 2024-02-12   │
│ 13        │ 13         │ 13          │ 1        │ 2024-02-13   │
│ 14        │ 14         │ 14          │ 2        │ 2024-02-14   │
│ 15        │ 15         │ 15          │ 1        │ 2024-02-15   │
│ 16        │ 16         │ 16          │ 3        │ 2024-02-16   │
│ 17        │ 17         │ 17          │ 2        │ 2024-02-17   │
│ 18        │ 18         │ 18          │ 1        │ 2024-02-18   │
│ 19        │ 19         │ 19          │ 2        │ 2024-02-19   │
│ 20        │ 20         │ 20          │ 1        │ 2024-02-20   │
│ 21        │ 21         │ 21          │ 3        │ 2024-02-21   │
│ 22        │ 22         │ 22          │ 1        │ 2024-02-22   │
│ 23        │ 23         │ 23          │ 2        │ 2024-02-23   │
│ 24        │ 24         │ 24          │ 1        │ 2024-02-24   │
│ 25        │ 25         │ 25          │ 3        │ 2024-02-25   │
│ 26        │ 26         │ 26          │ 2        │ 2024-02-26   │
│ 27        │ 27         │ 27          │ 1        │ 2024-02-27   │
│ 28        │ 28         │ 28          │ 2        │ 2024-02-28   │
│ 29        │ 29         │ 29          │ 1        │ 2024-02-29   │
└───────────┴────────────┴─────────────┴──────────┴──────────────┘
```
## 7. Obtener la cantidad total de productos en todos los pedidos por producto.
```sql
select nombre, cantidad from productos as prod, pedidos as ped where ped.id_producto = prod.id;
┌───────────────────────────────────┬──────────┐
│              nombre               │ cantidad │
├───────────────────────────────────┼──────────┤
│ Laptop                            │ 2        │
│ Smartphone                        │ 1        │
│ TV LED                            │ 3        │
│ Tablet                            │ 1        │
│ Auriculares Bluetooth             │ 2        │
│ Impresora                         │ 1        │
│ Cámara Digital                    │ 3        │
│ Reproductor de Audio              │ 2        │
│ Altavoces Inalámbricos            │ 1        │
│ Reloj Inteligente                 │ 2        │
│ Teclado Inalámbrico               │ 1        │
│ Ratón Óptico                      │ 3        │
│ Monitor LED                       │ 1        │
│ Mochila para Portátil             │ 2        │
│ Disco Duro Externo                │ 1        │
│ Router Wi-Fi                      │ 3        │
│ Lámpara LED                       │ 2        │
│ Batería Externa                   │ 1        │
│ Estuche para Auriculares          │ 2        │
│ Tarjeta de Memoria                │ 1        │
│ Cargador Inalámbrico              │ 3        │
│ Kit de Limpieza para Computadoras │ 1        │
│ Funda para Tablet                 │ 2        │
│ Soporte para Teléfono             │ 1        │
│ Hub USB                           │ 3        │
│ Webcam HD                         │ 2        │
│ Funda para Laptop                 │ 1        │
│ Adaptador HDMI                    │ 2        │
└───────────────────────────────────┴──────────┘
```
## 8. Obtener los clientes que han realizado más de un pedido.
```sql
select nombre, cantidad as cantidad_productos_pedidos from Clientes as cli, pedidos as ped where ped.id_cliente = cli.id and cantidad > 1;
┌─────────────────┬────────────────────────────┐
│     nombre      │ cantidad_productos_pedidos │
├─────────────────┼────────────────────────────┤
│ Juan Pérez      │ 2                          │
│ Carlos López    │ 3                          │
│ Luisa Martínez  │ 2                          │
│ Laura García    │ 3                          │
│ Miguel Martín   │ 2                          │
│ David Torres    │ 2                          │
│ Javier López    │ 3                          │
│ Daniel Muñoz    │ 2                          │
│ Alejandro Muñoz │ 3                          │
│ Raquel Herrera  │ 2                          │
│ Marina Díaz     │ 2                          │
│ Beatriz Romero  │ 3                          │
│ Clara Sánchez   │ 2                          │
│ Lucía Díaz      │ 3                          │
│ Mario Serrano   │ 2                          │
│ Roberto Ruiz    │ 2                          │
└─────────────────┴────────────────────────────┘
```
## 9. Obtener los productos que tienen un precio registrado.
```sql

```
## 10. Obtener la fecha del primer pedido realizado:
```sql
select fecha_pedido from pedidos where id_pedido = 1;
┌──────────────┐
│ fecha_pedido │
├──────────────┤
│ 2024-02-01   │
└──────────────┘

```
## 11. Obtener los productos cuyos nombres comienzan con 'A' o 'B':
```sql

```
## 12. Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.
```sql

```
## 13. Obtener los clientes que han realizado más de un pedido en febrero de 2024.
```sql

```
## 14. Obtener los productos con precio entre 100 y 500.
```sql

```
## 15. Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cantidad descendente.
```sql

```
## 16. Obtener los clientes que tienen una 'a' en cualquier posición de su nombre.
```sql

```
## 17. Obtener el precio máximo de los productos.
```sql

```
## 18. Obtener los pedidos realizados por el cliente con ID 1 en febrero de 2024.
```sql

```
## 19. Obtener la cantidad total de productos en todos los pedidos por producto ordenado por total de productos descendente.
```sql

```
## 20. Obtener los productos que no tienen un precio registrado.
```sql

```
## 21. Obtener la fecha del último pedido realizado.
```sql

```
## 22. Obtener los clientes cuyo nombre tiene al menos 5 caracteres.
```sql

```
## 23. Obtener los productos que tienen la letra 'o' en cualquier posición del nombre.
```sql

```
## 24. Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.
```sql

```
## 25. Obtener los clientes cuyos nombres no contienen la letra 'i':
```sql

```
## 26. Obtener los pedidos realizados por el cliente con ID 2 en febrero de 2024.
```sql

```
## 27. Obtener el precio mínimo de los productos.
```sql

```
## 28. Obtener los clientes que han realizado al menos un pedido en febrero de 2024.
```sql

```
## 29. Obtener la fecha del último pedido realizado por el cliente con ID 3.
```sql

```
## 30. Obtener los productos que tienen una 'a' al final del nombre.
```sql

```
## 31. Obtener los clientes cuyos nombres tienen al menos 4 vocales (mayúsculas|minúsculas).
```sql

```
## 32. Obtener los productos cuyo precio tenga al menos 4 números sin contrar los decimales.
```sql

```
## 33. Obtener los clientes cuyos nombres tienen al menos una 'a' seguida de una 'e'.
```sql

```
## 34. Obtener los productos cuyos nombres terminan con una consonante.
```sql

```
## 35. Obtener los productos cuyos nombres empiezan con una vocal.
```sql

```
