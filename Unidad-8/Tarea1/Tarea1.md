<div align="center">

# TAREA 1

</div>

### 1. CREANDO LA BASE DE DATOS Y SUS TABLAS:

```sql
CREATE DATABASE IF NOT EXISTS SimpleDB;

USE SimpleDB;

CREATE TABLE IF NOT EXISTS Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);
```

### 2. INSERTANDO ALGUNOS CASOS DE PRUEBA:

```sql

INSERT INTO Users (UserName, Email) VALUES ('Juan', 'juan@example.com');
INSERT INTO Users (UserName, Email) VALUES ('María', 'maria@example.com');
INSERT INTO Users (UserName, Email) VALUES ('Pedro', 'pedro@example.com');

INSERT INTO Products (ProductName, Price) VALUES ('Producto 1', 10.99);
INSERT INTO Products (ProductName, Price) VALUES ('Producto 2', 20.50);
INSERT INTO Products (ProductName, Price) VALUES ('Producto 3', 15.75);

```

```sql
select * from Products;
+-----------+-------------+-------+
| ProductID | ProductName | Price |
+-----------+-------------+-------+
|         1 | Producto 1  | 10.99 |
|         2 | Producto 2  | 20.50 |
|         3 | Producto 3  | 15.75 |
+-----------+-------------+-------+

select * from Users;
+--------+----------+-------------------+
| UserID | UserName | Email             |
+--------+----------+-------------------+
|      1 | Juan     | juan@example.com  |
|      2 | María    | maria@example.com |
|      3 | Pedro    | pedro@example.com |
+--------+----------+-------------------+

```

### 3. CREANDO FUNCIONES:

- Procedimiento para insertar un nuevo usuario.

    ```sql
    mysql> delimiter //
    -> create procedure create_user
    -> (IN name varchar(50), IN email varchar(50))
    -> begin
    -> insert into Users (UserName, Email) values (name, email);
    -> end
    -> //
    -> delimiter;
  ```

  ```sql
  call create_user('Daniel', 'daniel@example.com');
  ```

  ```sql
  select * from Users;
  +--------+----------+--------------------+
  | UserID | UserName | Email              |
  +--------+----------+--------------------+
  |      1 | Juan     | juan@example.com   |
  |      2 | María    | maria@example.com  |
  |      3 | Pedro    | pedro@example.com  |
  |      4 | Daniel   | daniel@example.com |
  +--------+----------+--------------------+
  ```

- Procedimiento para actualizar el nombre de un usuario.
   ```sql
    mysql> delimiter //
    -> create procedure update_username
    -> (IN target_name varchar(50), IN new_name varchar(50))
    -> begin
    -> update Users set UserName = new_name where UserName = target_name;
    -> end
    -> //
    -> delimiter;
  ```

  ```sql
  call update_username('Daniel', 'Diego');
  ```

  ```sql
  select * from Users;
  +--------+----------+--------------------+
  | UserID | UserName | Email              |
  +--------+----------+--------------------+
  |      1 | Juan     | juan@example.com   |
  |      2 | María    | maria@example.com  |
  |      3 | Pedro    | pedro@example.com  |
  |      4 | Diego    | daniel@example.com |
  +--------+----------+--------------------+

  ```

  - a
 
  ```sql
  mysql> delimiter //
    -> create procedure products_total_price 
    -> (OUT total_price int unsigned)
    -> begin
    -> set total_price = (
    -> select sum(Price) from Products);
    -> end
    -> //
    -> delimiter;;

  ```

  ```sql

  ```

  ```sql

  ```
