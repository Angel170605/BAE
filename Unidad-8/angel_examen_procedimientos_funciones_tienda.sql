CREATE DATABASE IF NOT EXISTS tienda;
USE tienda;

-- Tabla de Productos
CREATE TABLE IF NOT EXISTS productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10, 2),
    stock INT
);

-- Tabla de Clientes
CREATE TABLE IF NOT EXISTS clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100)
);

-- Tabla de Ventas
CREATE TABLE IF NOT EXISTS ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    producto_id INT,
    cantidad INT,
    fecha DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

-- Datos de ejemplo
INSERT INTO productos (nombre, precio, stock) VALUES
('Camiseta', 19.99, 50),
('Pantalón', 29.99, 30),
('Zapatos', 49.99, 20);

INSERT INTO clientes (nombre, email) VALUES
('Juan Pérez', 'juan@example.com'),
('María Gómez', 'maria@example.com'),
('Carlos López', 'carlos@example.com');

INSERT INTO ventas (cliente_id, producto_id, cantidad, fecha) VALUES
(1, 1, 2, '2024-05-01'),
(2, 2, 1, '2024-05-02'),
(3, 3, 1, '2024-05-03');

-- Crea un procedimiento que permita añadir datos aleatorios, en la tabla clientes.

  DELIMITER //
  CREATE PROCEDURE anhadir_datos_aleatorios(IN n_datos INT)
  BEGIN
      DECLARE nuevo_cliente VARCHAR(100);
      DECLARE nuevo_email VARCHAR(100);

          WHILE n_datos > 0 DO
              SET nuevo_cliente=(SELECT CONCAT('Cliente', RAND()));
              SET nuevo_email=(SELECT CONCAT(nuevo_cliente, '@gmail.com'));
              INSERT INTO clientes(nombre, email) VALUES(nuevo_cliente, nuevo_email);
              SET n_datos=n_datos-1;
          END WHILE;
  END //
  DELIMITER ;

-- Crea un procedimiento que permita actualizar el número de elementos de un producto, teniendo como parámetros de entrada el id del producto,  y la cantidad de elementos a restar del producto.

DELIMITER //
  CREATE PROCEDURE restar_stock(IN id_producto INT, IN cantidad_productos INT)
  BEGIN
       IF id_producto != 0 and cantidad_productos != 0 THEN
          UPDATE productos SET stock = cantidad_productos WHERE id = id_producto;
       END IF;
  END //
  DELIMITER ;

-- Crea un trigger que actualice la tabla de productos cuando se realice una venta, restando de un producto (id_producto) el número de elementos que se debe de restar (cantidad).

DELIMITER //
CREATE TRIGGER actualizar_stock
AFTER INSERT ON ventas
FOR EACH ROW
BEGIN
    CALL restar_stock(new.producto_id, new.cantidad);
END;//

-- Crea una función que calcule el total de las ventas de un cliente.

DELIMITER //
CREATE FUNCTION total_ventas_cliente(id_cliente INT) RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE ventas INT DEFAULT 0;
    SET ventas = (SELECT count(cliente_id) from ventas where cliente_id = id_cliente);
    RETURN ventas;
END//
DELIMITER ;

-- Crea una función que calcule la cantidad de productos en stock de un producto (producto_id).

DELIMITER //
CREATE FUNCTION productos_en_stock(id_producto INT) RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE cantidad INT DEFAULT 0;
    SET cantidad = (SELECT stock from productos where id = id_producto);
    RETURN cantidad;
END//
DELIMITER ;   

