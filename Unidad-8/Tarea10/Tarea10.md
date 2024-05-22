<div align="center">

# TAREA 10

</div>

### 1. CREANDO TABLAS NECESARIAS:

#### 1.1 TABLA log_cambios_email:

  ```sql
    CREATE TABLE log_cambios_email(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT,
    fecha_hora DATETIME,
    old_email VARCHAR(100),
    new_email VARCHAR(100)
       );
  ```

   ```sql
    CREATE TABLE log_alumnos_eliminados(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT,
    fecha_hora DATETIME,
    nombre VARCHAR(100),
    apellido1 VARCHAR(100),
    apellido2 VARCHAR(100),
    email VARCHAR(100)
       );
  ```

### 2. CREANDO TRIGGERS:

#### 2.1 TRIGGER QUE ALMACENA LOS EMAILS EN LA TABLA 'LOG CAMBIOS EMAIL' TRAS SU ACTUALIZACIÓN:

  ```sql
  DELIMITER $$
  
  CREATE TRIGGER trigger_guardar_email_after_update
  AFTER UPDATE ON alumnos
  FOR EACH ROW 
  BEGIN
      IF OLD.email != NEW.email THEN
        INSERT INTO log_cambio_email (old_email, new_email) VALUES (OLD.email, NEW.email);
    END IF;
  END; $$

DELIMITER //
  ```

#### 2.2 TRIGGER QUE ALMACENA LOS EMAILS EN LA TABLA 'LOG CAMBIOS EMAIL' TRAS SU ACTUALIZACIÓN:

  ```sql
  DELIMITER $$
  
  CREATE TRIGGER trigger_guardar_email_after_update
  AFTER DELETE ON alumnos
  FOR EACH ROW 
  BEGIN
      IF OLD.email != NEW.email THEN
        INSERT INTO log_alumnos_eliminados (id_alumno, fecha_hora, nombre, apellido1, apellido2, email) VALUES ();
    END IF;
  END; $$

DELIMITER //
  ```
