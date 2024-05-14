<div align="center">

# TAREA 6

</div>

### 1.Inserta cinco filas en la tabla empleados con nombres aleatorios generados usando la función CONCAT( ) junto con RAND( ):

#### Código:

```sql
DELIMITER //

CREATE PROCEDURE contratar(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        INSERT INTO empleados (nombre, salario) VALUES (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);
        SELECT counter;

        SET counter = counter + 1;
    END WHILE;
END //

DELIMITER ;

CALL contratar(5);
```

#### Ejecución:

```sql
select * from empleados;
+----+-----------------------------+---------+
| id | nombre                      | salario |
+----+-----------------------------+---------+
|  1 | Juan                        | 3000.00 |
|  2 | María                       | 3500.00 |
|  3 | Pedro                       | 3200.00 |
|  4 | Empleado0.683490463237735   | 6863.00 |
|  5 | Empleado0.9886115146694812  | 2956.00 |
|  6 | Empleado0.6322048861833335  | 8418.00 |
|  7 | Empleado0.11438948206081007 | 3322.00 |
|  8 | Empleado0.4835564601081949  | 9374.00 |
+----+-----------------------------+---------+

```

### 2. Inserta tres filas en la tabla empleados con nombres aleatorios generados usando la función UUID( ):

#### Código:

```sql
DELIMITER //

CREATE PROCEDURE contratar_uuid(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        INSERT INTO empleados (nombre, salario) VALUES (UUID(), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);
        SELECT counter;

        SET counter = counter + 1;
    END WHILE;
END //

DELIMITER ;

CALL contratar_uuid(3);
```

#### Ejecución:

```sql
select * from empleados;
+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3000.00 |
|  2 | María                                | 3500.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | Empleado0.683490463237735            | 6863.00 |
|  5 | Empleado0.9886115146694812           | 2956.00 |
|  6 | Empleado0.6322048861833335           | 8418.00 |
|  7 | Empleado0.11438948206081007          | 3322.00 |
|  8 | Empleado0.4835564601081949           | 9374.00 |
|  9 | 4ee1f990-1203-11ef-bd56-080027077231 | 3264.00 |
| 10 | 4ee3f604-1203-11ef-bd56-080027077231 | 2200.00 |
| 11 | 4ee49c76-1203-11ef-bd56-080027077231 | 7210.00 |
+----+--------------------------------------+---------+

```

### 3. Inserta dos filas en la tabla empleados con nombres aleatorios generados usando la función RAND( ) junto con ORDER BY RAND( ):

#### Código:

```sql
DELIMITER //

CREATE PROCEDURE contratar_rand(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        INSERT INTO empleados (nombre, salario)
        SELECT CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000
        FROM (SELECT 1 UNION SELECT 2) AS sub
        ORDER BY RAND()
        LIMIT 2;
        SELECT counter;

        SET counter = counter + 1;
    END WHILE;
END //

DELIMITER ;

CALL contratar_rand(2);
```

#### Ejecución

```sql
select * from empleados;
+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3000.00 |
|  2 | María                                | 3500.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | Empleado0.683490463237735            | 6863.00 |
|  5 | Empleado0.9886115146694812           | 2956.00 |
|  6 | Empleado0.6322048861833335           | 8418.00 |
|  7 | Empleado0.11438948206081007          | 3322.00 |
|  8 | Empleado0.4835564601081949           | 9374.00 |
|  9 | 4ee1f990-1203-11ef-bd56-080027077231 | 3264.00 |
| 10 | 4ee3f604-1203-11ef-bd56-080027077231 | 2200.00 |
| 11 | 4ee49c76-1203-11ef-bd56-080027077231 | 7210.00 |
| 12 | Empleado0.9516742527034825           | 3720.00 |
| 13 | Empleado0.45634405078025914          | 6966.00 |
+----+--------------------------------------+---------+

```

### 4. Inserta cuatro filas en la tabla empleados con nombres aleatorios generados usando la función SUBSTRING_INDEX(UUID( ), '-', -1):

#### Código

```sql
DELIMITER //

CREATE PROCEDURE contratar_substring(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        INSERT INTO empleados (nombre, salario) VALUES (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);
        SELECT counter;

        SET counter = counter + 1;
    END WHILE;
END //

DELIMITER ;

CALL contratar_substring(4);
```

#### Ejecución

```sql
select * from empleados;
+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3000.00 |
|  2 | María                                | 3500.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | Empleado0.683490463237735            | 6863.00 |
|  5 | Empleado0.9886115146694812           | 2956.00 |
|  6 | Empleado0.6322048861833335           | 8418.00 |
|  7 | Empleado0.11438948206081007          | 3322.00 |
|  8 | Empleado0.4835564601081949           | 9374.00 |
|  9 | 4ee1f990-1203-11ef-bd56-080027077231 | 3264.00 |
| 10 | 4ee3f604-1203-11ef-bd56-080027077231 | 2200.00 |
| 11 | 4ee49c76-1203-11ef-bd56-080027077231 | 7210.00 |
| 12 | Empleado0.9516742527034825           | 3720.00 |
| 13 | Empleado0.45634405078025914          | 6966.00 |
| 18 | 080027077231                         | 9298.00 |
| 19 | 080027077231                         | 3741.00 |
| 20 | 080027077231                         | 4815.00 |
| 21 | 080027077231                         | 2850.00 |
+----+--------------------------------------+---------+

```

### 5. Inserta seis filas en la tabla empleados con nombres aleatorios generados usando la función RAND( ) y una semilla diferente:

#### Código:

```sql
DELIMITER //

CREATE PROCEDURE contratar_mas_rand(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
      INSERT INTO empleados (nombre, salario) VALUES (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);
        SELECT counter;

        SET counter = counter + 1;
    END WHILE;
END //

DELIMITER ;

CALL contratar_mas_rand(6);
```

#### Ejecución:

```sql
select * from empleados;
+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3000.00 |
|  2 | María                                | 3500.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | Empleado0.683490463237735            | 6863.00 |
|  5 | Empleado0.9886115146694812           | 2956.00 |
|  6 | Empleado0.6322048861833335           | 8418.00 |
|  7 | Empleado0.11438948206081007          | 3322.00 |
|  8 | Empleado0.4835564601081949           | 9374.00 |
|  9 | 4ee1f990-1203-11ef-bd56-080027077231 | 3264.00 |
| 10 | 4ee3f604-1203-11ef-bd56-080027077231 | 2200.00 |
| 11 | 4ee49c76-1203-11ef-bd56-080027077231 | 7210.00 |
| 12 | Empleado0.9516742527034825           | 3720.00 |
| 13 | Empleado0.45634405078025914          | 6966.00 |
| 18 | 080027077231                         | 9298.00 |
| 19 | 080027077231                         | 3741.00 |
| 20 | 080027077231                         | 4815.00 |
| 21 | 080027077231                         | 2850.00 |
| 22 | 080027077231                         | 5808.00 |
| 23 | 080027077231                         | 2487.00 |
| 24 | 080027077231                         | 9014.00 |
| 25 | 080027077231                         | 3604.00 |
| 26 | 080027077231                         | 4983.00 |
| 27 | 080027077231                         | 4101.00 |
+----+--------------------------------------+---------+

```
