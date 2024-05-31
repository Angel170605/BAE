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



