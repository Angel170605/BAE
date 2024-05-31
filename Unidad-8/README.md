<div align="center">
    
# APUNTES

<img src="https://media.tenor.com/9qZTKKgW2OUAAAAM/ibai-yo.gif" width= 50%>

</div>

### CURSORES:

#### 1. CREAR 

```sql
    DECLARE nome_cursor CURSOR FOR 
   sentencia_SELECT;
```

#### 2. APERTURA DEL CURSOR 

```sql
    OPEN nombre_cursor;
```
#### 3. ACCESO A DATOS

```sql
    FETCH nombre_cursor INTO variable1 ,variable2;
```
#### 4. CIERRE DEL CURSOR

```sql
    CLOSE nombre_cursor;
```

Cosas a tener en cuenta:

- Los cursores se delaran después de las variables de la función.
- Primero se abre el bucle y luego el cursor.
- Primero se cierra el bucle y luego el cursor.
Son sólo de lectura, los cursores no pueden modificar los datos por sí mismos.
- El jamón tiene muchas proteínas, así que es importante comerlo.

### TRIGGERS:

#### 1. CREAR:

```sql
DELIMITER //
CREATE TRIGGER nombre
AFTER INSERT ON tabla
FOR EACH ROW
BEGIN
    Matraca que vayamos a hacer
END;//
```
**IMPORTANTE**:

- En la tercera línea, podemos ver 'AFTER INSERT'. Esto es para que el trigger se ejcute **después** de **insertar** valores en la tabla. Sin embargo, hay otras opciones:

  - CUÁNDO: BEFORE (antes de la matraca) | AFTER (después de la matraca)
  - CONDICIONES DE ACTIVACIÓN: INSERT (cuando insertas datos) | DELETE (cuando eliminas datos) | UPDATE (cuando modificas datos)

- Luego, en la caurta línea vemos un 'EACH ROW'. Esto como un bucle for de python que recorre todas las lineas de la tabla.

### PROCEDIMIENTOS

#### 1. CREAR

```sql
DELIMITER //
CREATE PROCEDURE nombre
BEGIN
  matraca
END //
```

#### 2. LLAMAR

```sql
CALL procedimiento(parametro)
```

EJ:

```sql
  DELIMITER //
  CREATE PROCEDURE aumentar_salarios(IN porcentaje DECIMAL(5,2))
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_id INT;
      DECLARE emp_nombre VARCHAR(100);
      DECLARE emp_salario DECIMAL(10, 2);
      DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_id, emp_nombre, emp_salario;
          IF done THEN
              LEAVE read_loop;
          END IF;
          UPDATE empleados SET salario = salario * (1 + porcentaje / 100) WHERE id = emp_id;
      END LOOP;
      CLOSE cur;
  END //
  DELIMITER ;
```

### FUNCIONES

#### 1. CREAR

```sql
DELIMITER //

CREATE FUNCTION holaMundo() RETURNS VARCHAR(30)
BEGIN
  DECLARE salida VARCHAR(30) DEFAULT 'Hola mundo';
;
  SET salida = ‘Hola mundo con variables’;
  RETURN salida;
END
//
```

#### 2. LLAMAR

```sql
SELECT funcion(parametro1, parametro2)
```

EJ:

  ```sql
  DELIMITER $$
  CREATE FUNCTION eliminar_acentos(cadena VARCHAR(255)) RETURNS VARCHAR(255)
  BEGIN
      SET cadena = REPLACE(cadena, 'á', 'a');
      SET cadena = REPLACE(cadena, 'é', 'e');
      SET cadena = REPLACE(cadena, 'í', 'i');
      SET cadena = REPLACE(cadena, 'ó', 'o');
      SET cadena = REPLACE(cadena, 'ú', 'u');
      RETURN cadena;
  END$$
  DELIMITER ;   
```

**IMPORTANTE**: Hay que poner alguna de estas tres cosas en la creación de la función:

- DETERMINISTIC:

> La función siempre devolverá lo mismo si recibe los mismos parámetros
  
- NO SQL:

> La función no contiene sentencias SQL

- READS SQL DATA:

> La función no modifica la tabla, sólo ejecuta sentencias de lectura; como SELECT

### ALEATORIEDAD

Generar datos aleatorios en MySQL puede ser útil para pruebas, demostraciones o simulaciones.

- __RAND()__. Esta función devuelve un valor de punto flotante aleatorio entre 0 y 1. Se puede usar para generar valores aleatorios en general.

```sql
SELECT RAND(); -- Genera un número aleatorio entre 0 y 1
-- Ejemplo de salida: 0.712345
```

- __RAND(N)__. Similar a RAND(), pero toma una semilla N como argumento para generar números pseudo-aleatorios.

```sql
SELECT RAND(1); -- Genera un número aleatorio basado en la semilla 1
-- Ejemplo de salida: 0.659217
```

- __RAND() con ORDER BY__. Si necesitas una lista de filas en un orden aleatorio, puedes usar RAND() junto con ORDER BY.

```sql
SELECT * FROM tabla ORDER BY RAND();
-- SELECT * FROM tabla ORDER BY RAND(); -- Ejemplo de salida: Filas de la tabla en un orden aleatorio
```

- __FLOOR(RAND() * (max - min + 1)) + min__. Esta fórmula te permite generar un número entero aleatorio dentro de un rango específico.

```sql
SELECT FLOOR(RAND() * (100 - 1 + 1)) + 1; -- Genera un número aleatorio entre 1 y 100
-- Ejemplo de salida: 42
```

- __UUID()__. Esta función genera un identificador único universal (UUID) en formato hexadecimal.

```sql
SELECT UUID(); -- Genera un UUID único
-- Ejemplo de salida: 123e4567-e89b-12d3-a456-426614174000
```

- __CONCAT() con RAND()__. Puedes usar CONCAT() junto con RAND() para generar datos aleatorios combinando valores.

```sql
SELECT CONCAT('Usuario', RAND()); -- Genera un nombre de usuario aleatorio
-- Ejemplo de salida: Usuario0.123456
```

- __SUBSTRING_INDEX(UUID(), '-', -1)__. Esta expresión toma el UUID generado por UUID() y extrae la última parte, que es la parte aleatoria. Esto puede ser útil si necesitas solo la parte aleatoria de un UUID.

```sql
SELECT SUBSTRING_INDEX(UUID(), '-', -1); -- Extrae la parte aleatoria de un UUID
-- Ejemplo de salida: 426614174000
```

</div>

### COSAS EXÓTICAS:

#### 1. VALORES DE DOMINIO


Estos valores tan exóticos se ppueden crear en una tabla de esta forma:

```sql
CREATE TABLE jamon(
    marca ENUM('Argal', 'El Pozo')
)
```

Esto se hace con ENUM('opcion_1', 'opcion_2'...).

Yo Pierre! You Wanna Come Out Here? Ten en cuenta estas cositas ;)

- Estos valores siempre serán del tipo VARCHAR, no se puede poner ningún otro tipo de valor.
- Pueden ser un Primary Key; pero no tendría demasiado sentido. Pero sí; por poder, puedes.
- Le puedes endecar un NOT NULL 
- Si pones un valor distinto; por ejemplo 'HACENDADO', te rellenará ese campo con 'NULL'

#### 2. HANDLER:

Esta matraca se usa en los cursores, para cuando estos no encuentran algún dato en la consulta. Es parecido al bloque try-except de Python; siendo el pana Fetch el Try y el Handler el except.

```sql
DECLARE CONTINUE HANDLER FOR NOT FOUND SET variable = valor
```

<div align="center">



