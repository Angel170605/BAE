# Base de Datos
Repositorio creado para la asignatura de Base de Datos

## Unidades
- [Unidad-1.](Unidad-1)
- Unidad-5
  - Tarea1:
    <div align="justify">

# INFORME DE CREACIÓN DE UNA BBDD
## PASO 1: INICIALIZAR EL PROYECTO:

El primero de los pasos que seguí para poder crear la base de datos fue inicializar el proyecto. Para ello, abrí la terminal y escribí el siguiente código:

``` 
sqlite3 tarea1.db
```

## 2. CREANDO LA TABLA:

Ya creado el proyecto, era hora de crear la tabla 'Ejemplo' de la base de datos. 
Obviamente, toda base de datos debe contener mínimamente un campo que contendrá información que se introducirá (con mucha paciencia) posteriormente.

En el caso de la BBDD que he creado, esta debía contener determinados campos que, a su vez, sólo aceptaran un determinado tipo de valor. Estos son:

- ID
    - Primary Key
    - Tipo de dato: INTEGER
    - Se autoincrementa 
        > Gracias a "AUTOINCREMENT", no hace falta estar escribierndo su valos en cada campo, sino que este aumentará de forma automática.
- Texto
    - Tipo de dato: TEXT
- Entero
    - Tipo de dato: INTEGER
- Flotante
    - Tipo de dato: REAL
    - Este será un número con decimal
- Fecha
    - Tipo de dato: DATE
    - Incluye día, mes y año
- Booleano
    - Tipo: BOOLEAN
    - Este sólo puede ser '1' o '0'  

    En resumen, para crear la tabla Ejemplo con los campos mencionados en el apartado anterior, hice uso del comando create table de la siguiente manera:

    ```
    create table Ejemplo (
        id integer,
        texto text,
        entero integer,
        flotante real, 
        fecha date,
        booleano boolean,
    );

## 3. INSERTANDO LOS VALORES EN LA TABLA:

Ya llegamos al tercer paso; la insersión de valores. En caso de la BBDD que he creado, había que insertar un total de 50 valores, para lo que empleé la siguiente función: 

```
INSERT VALUES (id, texto, entero, flotante, fecha, booleano)
VALUES (1, Ejemplo 1, 25, 10.5, 2022-05-15, 0),
(2, Ejemplo2, 63, 45.7, 2022-06-22, 1),
(3, Ejemplo3, 12, 30.0, 2022-07-10, 0)
.
..
...
(50, Ejemplo50, 75, 85.3, 2026-06-11);
```
Cabe destacar que dicha función nos permitiría introuducir datos a sólo algunos campos y no a todos. 
- *Por ejemplo, se podría añadir información a las columnas "id" y "fecha", dejando el resto de columnas de esa fila vacías* 

## JUGANDO CON LA BASE DE DATOS

Una vez ya terminé de crear e insertar los valores en mi BBDD, el próximo paso era empezar a "jugar" con esta, ya sea consultando datos, modificándolos, eliminándolos, etc.

## 4 CONSULTAS

### 4.1 OBTENIENDO TODOS LOS REGISTROS DE LA TABLA

Para obtener todas las entradas de la tabla Ejemplo, usé el comando

```
select * from Ejemplo;
```

Como resultado, obtuve lo siguiente:

```
+----+-----------+--------+---------+--------------+----------+
| id |   texto   | entero | decimal |    fecha     | booleano |
+----+-----------+--------+---------+--------------+----------+
| 1  | Ejemplo1  | 25     | 10.5    | 2022-05-15   | 1        |
| 2  | Ejemplo2  | 63     | 45.7    | 2022-06-22   | 0        |
| 3  | Ejemplo3  | 12     | 30.0    | 2022-07-10   | 1        |
| 4  | Ejemplo4  | 78     | 75.2    | 2022-08-05   | 0        |
| 5  | Ejemplo5  | 42     | 18.9    | 2022-09-12   | 1        |
| 6  | Ejemplo6  | 55     | 60.3    | 2022-10-08   | 0        |
| 7  | Ejemplo7  | 10     | 40.1    | 2022-11-17   | 1        |
| 8  | Ejemplo8  | 87     | 22.6    | 2022-12-03   | 0        |
| 9  | Ejemplo9  | 31     | 55.0    | 2023-01-20   | 1        |
| 10 | Ejemplo10 | 68     | 90.4    |  2023-02-14  | 0        |
| 11 | Ejemplo11 | 15     | 12.8    | 2023-03-22   | 1        |
| 12 | Ejemplo12 | 72     | 48.6    | 2023-04-09   | 0        |
| 13 | Ejemplo13 | 22     | 33.7    | 2023-05-01   | 1        |
| 14 | Ejemplo14 | 93     | 70.2    | 2023-06-18   | 0        |
| 15 | Ejemplo15 | 37     | 15.4    | 2023-07-05   | 1        |
| 16 | Ejemplo16 | 81     | 82.9    | 2023-08-11   | 0        |
| 17 | Ejemplo17 | 45     | 28.3    | 2023-09-27   | 1        |
| 18 | Ejemplo18 | 60     | 50.6    | 2023-10-15   | 0        |
| 19 | Ejemplo19 | 5      | 8.7     | 2023-11-22   | 1        |
| 20 | Ejemplo20 | 76     | 65.1    | 2023-12-08   | 0        |
| 21 | Ejemplo21 | 33     | 20.3    | 2024-01-14   | 1        |
| 22 | Ejemplo22 | 70     | 55.8    | 2024-02-29   | 0        |
| 23 | Ejemplo23 | 13     | 42.7    | 2024-03-18   | 1        |
| 24 | Ejemplo24 | 89     | 78.4    | 2024-04-25   | 0        |
| 25 | Ejemplo25 | 49     | 15.9    | 2024-05-12   | 1        |
| 26 | Ejemplo26 | 62     | 60.7    | 2024-06-20   | 1        |
| 27 | Ejemplo27 | 8      | 35.2    | 2024-07-07   | 0        |
| 28 | Ejemplo28 | 95     | 25.6    | 2024-08-23   | 1        |
| 29 | Ejemplo29 | 27     | 50.0    | 2024-09-10   | 0        |
| 30 | Ejemplo30 | 74     | 85.3    | 2024-10-05   | 1        |
| 31 | Ejemplo31 | 18     | 11.8    | 2024-11-12   | 0        |
| 32 | Ejemplo32 | 83     | 47.6    | 2024-12-28   | 1        |
| 33 | Ejemplo33 | 38     | 32.7    | 2025-01-15   | 0        |
| 34 | Ejemplo34 | 101    | 70.2    | 2025-02-01   | 1        |
| 35 | Ejemplo35 | 38     | 18.4    | 2025-03-20   | 0        |
| 36 | Ejemplo36 | 67     | 83.9    | 2025-04-06   | 1        |
| 37 | Ejemplo37 | 43     | 28.3    | 2025-05-13   | 0        |
| 38 | Ejemplo38 | 58     | 50.6    | 2025-06-30   | 1        |
| 39 | Ejemplo39 | 9      | 8.7     | 2025-07-17   | 0        |
| 40 | Ejemplo40 | 82     | 65.1    | 2025-08-23   | 1        |
| 41 | Ejemplo41 | 26     | 20.3    | 2025-09-09   | 0        |
| 42 | Ejemplo42 | 73     | 55.8    | 2025-10-26   | 1        |
| 43 | Ejemplo43 | 14     | 42.7    | 2025-11-13   | 0        |
| 44 | Ejemplo44 | 90     | 78.4    | 2025-12-30   | 1        |
| 45 | Ejemplo45 | 50     | 15.9    | 2026-01-16   | 0        |
| 46 | Ejemplo46 | 63     | 60.7    | 2026-02-03   | 1        |
| 47 | Ejemplo47 | 7      | 35.2    | 2026-03-22   | 0        |
| 48 | Ejemplo48 | 96     | 25.6    | 2026-04-08   | 1        |
| 49 | Ejemplo49 | 28     | 50.0    | 2026-05-25   | 0        |
| 50 | Ejemplo50 | 75     | 85.3    | 2026-06-11   | 1        |
+----+-----------+--------+---------+--------------+----------+
```
### 4.2 OBTENIENDO TODAS LAS ENTRADAS MAYORES A 50:

En esta ocasión haremos de nuevo uso de **select**, aunque esta vez añadiremos **where** para establecer la condición de que los valores que obtnegamos sean mayores de 50:

```
SELECT from usuario where entero > 50;
```
El resultado obtenido tras el uso de este comando fue el siguiente:
```
+--------+
| entero |
+--------+
| 63     |
| 78     |
| 55     |
| 87     |
| 68     |
| 72     |
| 93     |
| 81     |
| 60     |
| 76     |
| 70     |
| 89     |
| 62     |
| 95     |
| 74     |
| 83     |
| 101    |
| 67     |
| 58     |
| 82     |
| 73     |
| 90     |
| 63     |
| 96     |
| 75     |
+--------+
```
## 5. MODIFICANDO Y ELIMINANDO DATOS:

### 5.1 ELIMINANDO LOS CAMPOS DONDE EL BOOLEANO ES TRUE:

Dado que cuando un booleano es 'True', su valor numérico será 1, eliminar todos los campos de la tabla donde se diera esta condición es más sencillo de lo que puede parecer a simple vista:

> booleano = 'True' = 1

```
delete from Ejemplo where booleano = '1';
```
El resultado cada vez se iba quedando con menos filas:

```
+----+-----------+--------+---------+--------------+----------+
| id |   texto   | entero | decimal |    fecha     | booleano |
+----+-----------+--------+---------+--------------+----------+
| 2  | Ejemplo2  | 63     | 45.7    | 2022-06-22   | 0        |
| 4  | Ejemplo4  | 78     | 75.2    | 2022-08-05   | 0        |
| 6  | Ejemplo6  | 55     | 60.3    | 2022-10-08   | 0        |
| 8  | Ejemplo8  | 87     | 22.6    | 2022-12-03   | 0        |
| 10 | Ejemplo10 | 68     | 90.4    |  2023-02-14  | 0        |
| 12 | Ejemplo12 | 72     | 48.6    | 2023-04-09   | 0        |
| 14 | Ejemplo14 | 93     | 70.2    | 2023-06-18   | 0        |
| 16 | Ejemplo16 | 81     | 82.9    | 2023-08-11   | 0        |
| 18 | Ejemplo18 | 60     | 50.6    | 2023-10-15   | 0        |
| 20 | Ejemplo20 | 76     | 65.1    | 2023-12-08   | 0        |
| 22 | Ejemplo22 | 70     | 55.8    | 2024-02-29   | 0        |
| 24 | Ejemplo24 | 89     | 78.4    | 2024-04-25   | 0        |
| 27 | Ejemplo27 | 8      | 35.2    | 2024-07-07   | 0        |
| 29 | Ejemplo29 | 27     | 50.0    | 2024-09-10   | 0        |
| 31 | Ejemplo31 | 18     | 11.8    | 2024-11-12   | 0        |
| 33 | Ejemplo33 | 38     | 32.7    | 2025-01-15   | 0        |
| 35 | Ejemplo35 | 38     | 18.4    | 2025-03-20   | 0        |
| 37 | Ejemplo37 | 43     | 28.3    | 2025-05-13   | 0        |
| 39 | Ejemplo39 | 9      | 8.7     | 2025-07-17   | 0        |
| 41 | Ejemplo41 | 26     | 20.3    | 2025-09-09   | 0        |
| 43 | Ejemplo43 | 14     | 42.7    | 2025-11-13   | 0        |
| 45 | Ejemplo45 | 50     | 15.9    | 2026-01-16   | 0        |
| 47 | Ejemplo47 | 7      | 35.2    | 2026-03-22   | 0        |
| 49 | Ejemplo49 | 28     | 50.0    | 2026-05-25   | 0        |
+----+-----------+--------+---------+--------------+----------+
```

### 5.2 MODIFICANDO 'TEXTO' CUANDO 'ENTERO' ES MENOR A 30

Al igual que en el caso anterior, utilizé la función **where** para establecer la condición, salvo que en este caso recurrí a la función **update** para modificar los campos. Así, quedó de esta forma:

```
update Ejemplo set entero="modificado" where entero < 30;
```

Y me devolvió lo siguiente:

```
+----+-----------+------------+---------+--------------+----------+
| id |   texto   |   entero   | decimal |    fecha     | booleano |
+----+-----------+------------+---------+--------------+----------+
| 2  | Ejemplo2  | 63         | 45.7    | 2022-06-22   | 0        |
| 4  | Ejemplo4  | 78         | 75.2    | 2022-08-05   | 0        |
| 6  | Ejemplo6  | 55         | 60.3    | 2022-10-08   | 0        |
| 8  | Ejemplo8  | 87         | 22.6    | 2022-12-03   | 0        |
| 10 | Ejemplo10 | 68         | 90.4    |  2023-02-14  | 0        |
| 12 | Ejemplo12 | 72         | 48.6    | 2023-04-09   | 0        |
| 14 | Ejemplo14 | 93         | 70.2    | 2023-06-18   | 0        |
| 16 | Ejemplo16 | 81         | 82.9    | 2023-08-11   | 0        |
| 18 | Ejemplo18 | 60         | 50.6    | 2023-10-15   | 0        |
| 20 | Ejemplo20 | 76         | 65.1    | 2023-12-08   | 0        |
| 22 | Ejemplo22 | 70         | 55.8    | 2024-02-29   | 0        |
| 24 | Ejemplo24 | 89         | 78.4    | 2024-04-25   | 0        |
| 27 | Ejemplo27 | Modificado | 35.2    | 2024-07-07   | 0        |
| 29 | Ejemplo29 | Modificado | 50.0    | 2024-09-10   | 0        |
| 31 | Ejemplo31 | Modificado | 11.8    | 2024-11-12   | 0        |
| 33 | Ejemplo33 | 38         | 32.7    | 2025-01-15   | 0        |
| 35 | Ejemplo35 | 38         | 18.4    | 2025-03-20   | 0        |
| 37 | Ejemplo37 | 43         | 28.3    | 2025-05-13   | 0        |
| 39 | Ejemplo39 | Modificado | 8.7     | 2025-07-17   | 0        |
| 41 | Ejemplo41 | Modificado | 20.3    | 2025-09-09   | 0        |
| 43 | Ejemplo43 | Modificado | 42.7    | 2025-11-13   | 0        |
| 45 | Ejemplo45 | 50         | 15.9    | 2026-01-16   | 0        |
| 47 | Ejemplo47 | Modificado | 35.2    | 2026-03-22   | 0        |
| 49 | Ejemplo49 | Modificado | 50.0    | 2026-05-25   | 0        |
+----+-----------+------------+---------+--------------+----------+
```

### 5.3 ELIMINANDO LOS CAMPOS EN LOS QUE 'ENTERO' ES 50:

En esta ocasión, lo que había que hacer era una 'mezcla' de algunos de las funciones utilizadas anteriormente; **delete** y **where** junto con **'='** :

```
delete from Ejemplo where entero = 50;
```
Resultando lo siguiente:

```
+----+-----------+------------+---------+--------------+----------+
| id |   texto   |   entero   | decimal |    fecha     | booleano |
+----+-----------+------------+---------+--------------+----------+
| 2  | Ejemplo2  | 63         | 45.7    | 2022-06-22   | 0        |
| 4  | Ejemplo4  | 78         | 75.2    | 2022-08-05   | 0        |
| 6  | Ejemplo6  | 55         | 60.3    | 2022-10-08   | 0        |
| 8  | Ejemplo8  | 87         | 22.6    | 2022-12-03   | 0        |
| 10 | Ejemplo10 | 68         | 90.4    |  2023-02-14  | 0        |
| 12 | Ejemplo12 | 72         | 48.6    | 2023-04-09   | 0        |
| 14 | Ejemplo14 | 93         | 70.2    | 2023-06-18   | 0        |
| 16 | Ejemplo16 | 81         | 82.9    | 2023-08-11   | 0        |
| 18 | Ejemplo18 | 60         | 50.6    | 2023-10-15   | 0        |
| 20 | Ejemplo20 | 76         | 65.1    | 2023-12-08   | 0        |
| 22 | Ejemplo22 | 70         | 55.8    | 2024-02-29   | 0        |
| 24 | Ejemplo24 | 89         | 78.4    | 2024-04-25   | 0        |
| 27 | Ejemplo27 | Modificado | 35.2    | 2024-07-07   | 0        |
| 29 | Ejemplo29 | Modificado | 50.0    | 2024-09-10   | 0        |
| 31 | Ejemplo31 | Modificado | 11.8    | 2024-11-12   | 0        |
| 33 | Ejemplo33 | 38         | 32.7    | 2025-01-15   | 0        |
| 35 | Ejemplo35 | 38         | 18.4    | 2025-03-20   | 0        |
| 37 | Ejemplo37 | 43         | 28.3    | 2025-05-13   | 0        |
| 39 | Ejemplo39 | Modificado | 8.7     | 2025-07-17   | 0        |
| 41 | Ejemplo41 | Modificado | 20.3    | 2025-09-09   | 0        |
| 43 | Ejemplo43 | Modificado | 42.7    | 2025-11-13   | 0        |
| 47 | Ejemplo47 | Modificado | 35.2    | 2026-03-22   | 0        |
| 49 | Ejemplo49 | Modificado | 50.0    | 2026-05-25   | 0        |
+----+-----------+------------+---------+--------------+----------+
```
### 5.4 INCREMENTAR EN 10 EL VALOR DE ENTERO CUANDO EL BOOLEANO SEA FALSO

Al igual que en un caso previo, en el que comentamos que un booleano 'True' es 1, cuando este es 'False', su valor numérico será 0. 

> booleano = 'False' = 0

Por otro lado, para incrementar en 10 el valor de los enteros, basta con sumarle 10.

De esta forma, usé:

```
update Ejemplo set entero= entero + 10 where booleano='0';
```
Lo que dio lugar a lo siguiente:
```
----+-----------+--------+---------+--------------+----------+
| id |   texto   | entero | decimal |    fecha     | booleano |
+----+-----------+--------+---------+--------------+----------+
| 2  | Ejemplo2  | 73     | 45.7    | 2022-06-22   | 0        |
| 4  | Ejemplo4  | 88     | 75.2    | 2022-08-05   | 0        |
| 6  | Ejemplo6  | 65     | 60.3    | 2022-10-08   | 0        |
| 8  | Ejemplo8  | 97     | 22.6    | 2022-12-03   | 0        |
| 10 | Ejemplo10 | 78     | 90.4    |  2023-02-14  | 0        |
| 12 | Ejemplo12 | 82     | 48.6    | 2023-04-09   | 0        |
| 14 | Ejemplo14 | 103    | 70.2    | 2023-06-18   | 0        |
| 16 | Ejemplo16 | 91     | 82.9    | 2023-08-11   | 0        |
| 18 | Ejemplo18 | 70     | 50.6    | 2023-10-15   | 0        |
| 20 | Ejemplo20 | 86     | 65.1    | 2023-12-08   | 0        |
| 22 | Ejemplo22 | 80     | 55.8    | 2024-02-29   | 0        |
| 24 | Ejemplo24 | 99     | 78.4    | 2024-04-25   | 0        |
| 27 | Ejemplo27 | 10     | 35.2    | 2024-07-07   | 0        |
| 29 | Ejemplo29 | 10     | 50.0    | 2024-09-10   | 0        |
| 31 | Ejemplo31 | 10     | 11.8    | 2024-11-12   | 0        |
| 33 | Ejemplo33 | 48     | 32.7    | 2025-01-15   | 0        |
| 35 | Ejemplo35 | 48     | 18.4    | 2025-03-20   | 0        |
| 37 | Ejemplo37 | 53     | 28.3    | 2025-05-13   | 0        |
| 39 | Ejemplo39 | 10     | 8.7     | 2025-07-17   | 0        |
| 41 | Ejemplo41 | 10     | 20.3    | 2025-09-09   | 0        |
| 43 | Ejemplo43 | 10     | 42.7    | 2025-11-13   | 0        |
| 47 | Ejemplo47 | 10     | 35.2    | 2026-03-22   | 0        |
| 49 | Ejemplo49 | 10     | 50.0    | 2026-05-25   | 0        |
+----+-----------+--------+---------+--------------+----------+
```
### 5.5 ELIMINANDO LOS REGISTROS DE LAS FILAS CUYO ENTERO SEA MAYOR QUE 50:

Ahora, para eliminar las filas cuyos respectivos enteros sean mayores a 50, usé:

```
delete from Ejemplo where entero > 50;
```

Quedando lo siguiente:

```
+----+-----------+--------+---------+--------------+----------+
| id |   texto   | entero | decimal |    fecha     | booleano |
+----+-----------+--------+---------+--------------+----------+
| 2  | Ejemplo2  | 73     | 45.7    | 2022-06-22   | 0        |
| 4  | Ejemplo4  | 88     | 75.2    | 2022-08-05   | 0        |
| 6  | Ejemplo6  | 65     | 60.3    | 2022-10-08   | 0        |
| 8  | Ejemplo8  | 97     | 22.6    | 2022-12-03   | 0        |
| 10 | Ejemplo10 | 78     | 90.4    |  2023-02-14  | 0        |
| 12 | Ejemplo12 | 82     | 48.6    | 2023-04-09   | 0        |
| 14 | Ejemplo14 | 103    | 70.2    | 2023-06-18   | 0        |
| 16 | Ejemplo16 | 91     | 82.9    | 2023-08-11   | 0        |
| 18 | Ejemplo18 | 70     | 50.6    | 2023-10-15   | 0        |
| 20 | Ejemplo20 | 86     | 65.1    | 2023-12-08   | 0        |
| 22 | Ejemplo22 | 80     | 55.8    | 2024-02-29   | 0        |
| 24 | Ejemplo24 | 99     | 78.4    | 2024-04-25   | 0        |
| 37 | Ejemplo37 | 53     | 28.3    | 2025-05-13   | 0        |
+----+-----------+--------+---------+--------------+----------+
```
### 5.6 CAMBIANDO TODAS LAS FECHAS POR LA ACTUAL:

Por último, para cambiar todas las fechas por la actual me bastó con usar:

```
update Ejemplo set fecha= 2023-12-14;
```

Siendo este el resultado final:
```
+----+-----------+--------+---------+-------+----------+
| id |   texto   | entero | decimal | fecha | booleano |
+----+-----------+--------+---------+-------+----------+
| 2  | Ejemplo2  | 73     | 45.7    | 1997  | 0        |
| 4  | Ejemplo4  | 88     | 75.2    | 1997  | 0        |
| 6  | Ejemplo6  | 65     | 60.3    | 1997  | 0        |
| 8  | Ejemplo8  | 97     | 22.6    | 1997  | 0        |
| 10 | Ejemplo10 | 78     | 90.4    | 1997  | 0        |
| 12 | Ejemplo12 | 82     | 48.6    | 1997  | 0        |
| 14 | Ejemplo14 | 103    | 70.2    | 1997  | 0        |
| 16 | Ejemplo16 | 91     | 82.9    | 1997  | 0        |
| 18 | Ejemplo18 | 70     | 50.6    | 1997  | 0        |
| 20 | Ejemplo20 | 86     | 65.1    | 1997  | 0        |
| 22 | Ejemplo22 | 80     | 55.8    | 1997  | 0        |
| 24 | Ejemplo24 | 99     | 78.4    | 1997  | 0        |
| 37 | Ejemplo37 | 53     | 28.3    | 1997  | 0        |
+----+-----------+--------+---------+-------+----------+
```

De esta forma concluyó la creación y modificación de mi primera BBDD.

</div>
