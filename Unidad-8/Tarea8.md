<div align="center">

# TAREA 8

</div>

### CREACIÓN DE LA TABLA ALUMNOS:

```sql
    CREATE TABLE alumnos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido1 VARCHAR(100),
    apellido2 VARCHAR(100),
    nota FLOAT
       );
```


<div align="center">

### trigger_check_nota_before_insert.

</div>

```sql
  DELIMITER $$
  
  CREATE TRIGGER trigger_check_nota_before_insert
  BEFORE INSERT ON alumnos
  FOR EACH ROW 
  BEGIN
      IF NEW.nota<0
        THEN SET NEW.nota = 0;
      IF NEW.nota>10
        THEN SET NEW.nota=10;
    END IF;
  END; $$

DELIMITER //
```

<div align="center">

### trigger_check_nota_before_update.

</div>

```sql
  DELIMITER $$
  
  CREATE TRIGGER trigger_check_nota_before_insert
  BEFORE UPDATE ON alumnos
  FOR EACH ROW 
  BEGIN
      IF NEW.nota<0
        THEN SET NEW.nota = 0;
      IF NEW.nota>10
        THEN SET NEW.nota=10;
    END IF;
  END; $$

DELIMITER //
```

<div align="center">
  
### Procedimiento1

</div>

```sql
   DELIMITER //

CREATE PROCEDURE matricular_alumnos(IN iterations INT, IN nota FLOAR)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        INSERT INTO alumnos (nombre, apellido1, apellido2) VALUES (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
        (CONCAT('Empleado', RAND()), FLOOR(RAND() * (100 - 20 + 1)) + 200),
        (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10 - 1 + 1)) + 3);
        SELECT counter;

        SET counter = counter + 1;
    END WHILE;
END //

DELIMITER ; 
```

