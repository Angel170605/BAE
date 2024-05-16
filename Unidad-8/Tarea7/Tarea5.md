<div align="center">

# TAREA 7

</div>

- Crea una base datos llamada __salario__:

```sql
  create database salario;
  use salario;
```
   
- Crea una tabla llamada persona con los siguientes campos:
    - Identificador. (Texto)__(PK)__.
    - Nombre (Texto).
    - Salario_base. (__Escoge el tipo de dato__).
    - Subsidio(__Escoge el tipo de dato__).
    - Salud(__Escoge el tipo de dato__).
    - Pensión(__Escoge el tipo de dato__).
    - Bono(__Escoge el tipo de dato__).
    - Integral(__Escoge el tipo de dato__).


  ```sql
  CREATE TABLE salario(
   id VARCHAR(100) PRIMARY KEY,
   nombre VARCHAR(100),
   salario_base INT,
   subsidio FLOAT,
   salud FLOAT,
   pension FLOAT,
   bono FLOAT,
   integral FLOAT
  );
  ```

- Creación de un __procedimiento__ de forma aleatoria con las siguientes características:
    - Parámetro de entrada el número de registros (_Mínimo 10, y realiza la prueba varias veces_).
 
    ```sql
  DELIMITER //
  create procedure insert_people(IN n_inserts INT) 
   BEGIN
    if n_inserts > 0 then
    INSERT INTO salario(id, nombre, salario_base)
    SELECT FLOOR(RAND() * (10000 - 2000 + 1)) + 2000, CONCAT('Empleado', FLOOR(RAND() * (100 - 1 + 1)) + 1, FLOOR(RAND() * (3000 - 1 + 1)) + 1
    FROM (SELECT 1 UNION SELECT 2) AS sub
    ORDER BY RAND()
    LIMIT 2;
    set n_inserts=n_inserts-1;
    end if;
    end //
    DELIMITER ; 
    ```

- Cree una función para cada punto teniendo en cuenta que:
    - Función __subsidio_transporte__: El subsidio de transporte equivale al __7%__ al salario básico. _Actualiza el valor en la tabla_.

      ```sql

      ```
      
    - Función __salud__: La salud que corresponde al __4%__ al salario básico.  _Actualiza el valor en la tabla_.

      ```sql

      ```
      
    - Función __pension__: La pensión que corresponde al __4%__ al salario básico.  _Actualiza el valor en la tabla_.

      ```sql

      ```
      
    - Función __bono__: Un bono que corresponde al __8%__ al salario básico. _Actualiza el valor en la tabla_.
 
      ```sql

      ```
      
    - Función __integral__: El salario integral es la ___suma del salario básico - salud - pension + bono + sub de transporte___. _Actualiza el valor en la tabla_.

      ```sql

      ```
      
    - ___Crea cada uno de las funciones anteriores para una persona en específico___.
 
      ```sql

      ```
      
    - El parámetro de entrada debe de ser un identificar de la persona.
 
      ```sql

      ```
