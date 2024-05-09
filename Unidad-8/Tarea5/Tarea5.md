<div align="center">

# TAREA 5

</div>

1. Escribe un procedimiento almacenado que copie los nombres de todos los empleados cuyo salario sea superior a 3000 en una nueva tabla llamada 'empleados_destino'. Es necesario crear la tabla __empleados_destino__.

      ```sql
      CREATE TABLE empleados_destino (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    salario DECIMAL(10, 2)
      );
      ```
      ```sql
            delimiter //
            create procedure copiar_empleados()
            begin
                declare done int default false;
                declare n_emp varchar(100);
                declare cur cursor FOR SELECT nombre FROM empleados WHERE salario < 3000.;
                declare continue handler for not found set done = true;
          OPEN cur;
          read_loop: LOOP
              FETCH cur INTO n_emp;
              IF done THEN
                  LEAVE read_loop;
              END IF;
              INSERT INTO empleados_destino (nombre) values(n_emp);
          END LOOP;
          CLOSE cur;
      END //
      DELIMITER ;
      ```

2. Escribe un procedimiento almacenado que seleccione los empleados cuyos nombres contienen la letra 'a' y aumente sus salarios en un 10%.

      ```sql
      DELIMITER //
      CREATE PROCEDURE aumentar_salarios()
      BEGIN
          DECLARE done INT DEFAULT FALSE;
          DECLARE emp_id INT;
          DECLARE emp_salario DECIMAL(10, 2);
          DECLARE cur CURSOR FOR SELECT id, salario FROM empleados WHERE nombre regexp 'a';
          DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
      
          OPEN cur;
          read_loop: LOOP
              FETCH cur INTO emp_id, emp_salario;
              IF done THEN
                  LEAVE read_loop;
              END IF;
              UPDATE empleados SET salario = salario + ((salario * 10) / 100) WHERE id = emp_id;
          END LOOP;
          CLOSE cur;
      END //
      DELIMITER ;
      ```
      ```sql
      mysql> call aumentar_salarios();
      Query OK, 0 rows affected (0,03 sec)
      
      mysql> select * from empleados;
      +----+--------+---------+
      | id | nombre | salario |
      +----+--------+---------+
      |  1 | Juan   | 3300.00 |
      |  2 | María  | 3850.00 |
      |  3 | Pedro  | 3200.00 |
      +----+--------+---------+

      ```

3. Escribe un procedimiento almacenado que seleccione empleados cuyos IDs estén en un rango específico, por ejemplo, entre 2 y 3.

      ```sql
       
      ```

4. Escribe un procedimiento almacenado que elimine todos los empleados cuyo salario esté entre 2000 y 2500.

      ```sql
      DELIMITER //
      CREATE PROCEDURE despedir_empleados()
      BEGIN
          DECLARE done INT DEFAULT FALSE;
          DECLARE emp_id INT;
          DECLARE emp_salario DECIMAL(10, 2);
          DECLARE cur CURSOR FOR SELECT id, salario FROM empleados WHERE salario between 2000 and 2500;
          DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
      
          OPEN cur;
          read_loop: LOOP
              FETCH cur INTO emp_id, emp_salario;
              IF done THEN
                  LEAVE read_loop;
              END IF;
              delete from empleados WHERE id = emp_id;
          END LOOP;
          CLOSE cur;
      END //
      DELIMITER ;
      ```
      ```sql
      INSERT INTO empleados (nombre, salario) values('llados', '2500.00');
      Query OK, 1 row affected (0,02 sec)
      
      mysql> select * from empleados;
      +----+--------+---------+
      | id | nombre | salario |
      +----+--------+---------+
      |  1 | Juan   | 3630.00 |
      |  2 | María  | 4235.00 |
      |  3 | Pedro  | 3200.00 |
      |  4 | llados | 2500.00 |
      +----+--------+---------+
      4 rows in set (0,01 sec)
      
      mysql> call despedir_empleados();
      Query OK, 0 rows affected (0,03 sec)
      
      mysql> select * from empleados;
      +----+--------+---------+
      | id | nombre | salario |
      +----+--------+---------+
      |  1 | Juan   | 3630.00 |
      |  2 | María  | 4235.00 |
      |  3 | Pedro  | 3200.00 |
      +----+--------+---------+
      3 rows in set (0,00 sec)

      ```

5. Escribe un procedimiento almacenado que aumente el salario de un empleado específico cuyo nombre se pasa como parámetro en un 20%.

      ```sql
      DELIMITER //
      CREATE PROCEDURE aumentar_salario_de(IN nombre_emp VARCHAR(100))
      BEGIN
          DECLARE done INT DEFAULT FALSE;
          DECLARE emp_salario DECIMAL(10, 2);
          DECLARE cur CURSOR FOR SELECT nombre FROM empleados WHERE nombre = nombre_emp;
          DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
      
          OPEN cur;
          read_loop: LOOP
              FETCH cur INTO nombre_emp;
              IF done THEN
                  LEAVE read_loop;
              END IF;
              UPDATE empleados SET salario = salario + ((salario * 20) / 100) WHERE nombre = nombre_emp;
          END LOOP;
          CLOSE cur;
      END //
      DELIMITER ;
      ```
      ```sql
      select * from empleados;
      +----+--------+---------+
      | id | nombre | salario |
      +----+--------+---------+
      |  1 | Juan   | 3630.00 |
      |  2 | María  | 4235.00 |
      |  3 | Pedro  | 3200.00 |
      +----+--------+---------+
      
      mysql> call aumentar_salario_de('María');
      Query OK, 0 rows affected (0,01 sec)
      
      mysql> select * from empleados;
      +----+--------+---------+
      | id | nombre | salario |
      +----+--------+---------+
      |  1 | Juan   | 3630.00 |
      |  2 | María  | 5082.00 |
      |  3 | Pedro  | 3200.00 |
      +----+--------+---------+

      ```
