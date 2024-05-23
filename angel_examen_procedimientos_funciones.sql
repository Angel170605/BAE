-- crea la database donación:

DROP DATABASE IF EXISTS donacion;

Create database donacion;

use donacion;

-- crea la tabla persona

DROP TABLE IF EXISTS persona;
CREATE TABLE  persona (
  id INT AUTO_INCREMENT NOT NULL,
    identificador VARCHAR(50),
    peso int,
    admitido varchar(2),
    sexo varchar(1),
    fecha_ultima_donacion DATE,
    PRIMARY KEY (id)
    );

-- creando la tabla total_donaciones para su uso posterior

DROP TABLE IF EXISTS total_donaciones
CREATE TABLE total_donaciones(
    id_persona VARCHAR(50),
    cantidad_total INT,
    PRIMARY KEY (id_persona)
);


-- PROCEDIMIENTOS:


-- Realizar un procedimiento que realice la inserción de datos aleatorios en la tabla. El procedimiento debe de recibir como parámetro de entrada, al menos, el número de registros que se desea insertar y se debe de lanzar, al menos, en     dos ocasiones, para verificar su correcto funcionamiento. Los datos deben de ser aleatorios, es decir, en cada inserción de debe de auto generar o seleccionar uno al azar, de los campos requeridos.



-- Realiza un procedimiento que permita actualizar el la fecha de última donación, teniendo como parámetro de entrada el identificador de la persona, y una fecha.

            DELIMITER //
            CREATE PROCEDURE ActualizarFechaDonacion(IN id_donante VARCHAR(50))
            FOR EACH ROW
            BEGIN
                    UPDATE persona SET ultima_fecha_donacion = DATATIME WHERE identificador = id_donante;
                END; //

-- Crea un procedimiento llamado CalcularTotalDonaciones que calcule la cantidad total de donaciones realizadas por cada persona y la almacene en una tabla llamada total_donaciones. La tabla total_donaciones debe tener dos columnas: id_persona (texto) y cantidad_total (integer).

            DELIMITER //
            CREATE PROCEDURE CalcularTotalDonaciones()
            DECLARE id_donante VARCHAR(50);
            DECLARE total_donaciones INT;
            FOR EACH ROW
            BEGIN
                SET id_donante=(SELECT identificador FROM persona);
                SET total_donaciones=(SELECT COUNT(identificador) FROM persona);
                    INSERT INTO total_donaciones(id_persona, cantidad_total) VALUES(id_donante, total_donaciones);
                END; //

        -- Crea un procedimiento que me permita eliminar una persona de la tabla total_donaciones. 

            DELIMITER //
            CREATE PROCEDURE UnDonanteMenos(IN id_donante INT)
            FOR EACH ROW
            BEGIN
                    DELETE FROM persona where id = id_donante;
                END; //


-- FUNCIONES:


-- Realiza una función que determine si una persona almacenada en la tabla persona puede realizar una donación. Para ello la función recibe como parámetro de entrada el identificador de esta persona, y una fecha de donación. Revisa las condiciones para que una persona pueda o no donar. Posteriormente actualice el valor de la última donación de la persona indicada con el parámetro de entrada.

        DELIMITER //        
        
        CREATE FUNCTION ComprobarAptitud(IN id_donante INT, INOUT fecha_ult_donacion DATE)
        DECLARE peso_candidato INT
        FOR EACH ROW 
        BEGIN
            SET peso_candidato = (SELECT peso FROM persona WHERE id = id_donante);
            SET sexo_candidato = (SELECT sexo FROM persona WHERE id = id_donante);
            SET fecha_actual = DATATIME;
            SET tiempo_transcurrido = (fecha_actual - fecha_ult_donacion);
            IF peso_candidato >= 50
            THEN
            IF sexo_candidato = 'H' AND tiempo_transcurrido <= 90
                THEN INSERT INTO persona(admitido) VALUES('si');
            IF sexo_candidato = 'M' AND tiempo_transcurrido <= 120
                THEN INSERT INTO persona(admitido) VALUES('si'); 
            ELSE INSERT INTO persona(admitido) VALUES ('no');
          END IF;
        END; //
            
            

-- Realiza una función que determine que persona es la que más donaciones ha realizado.


        DELIMITER //

       CREATE FUNCTION MaximoDonante(OUT nombre_maximo_donante VARCHAR(50))
       FOR EACH ROW
       BEGIN
            SET nombre_maximo_donante = (SELECT nombre FROM total_donaciones WHERE cantidad_total = (SELECT MAX(cantidad_total) FROM total_donaciones));
       END; //

-- TRIGGERS:


-- Realiza un trigger que actualiza total_donaciones con cada una de las inserciones que se realicen en la tabla Persona.

            DELIMITER //

            CREATE TRIGGER trigger_nueva_donacion
            AFTER INSERT ON persona
            FOR EACH ROW
            BEGIN
                INSERT INTO total_donaciones(id_persona, total_donaciones) VALUES(new.identificador, 0);
            END; //

-- Realiza un trigger que elimine todos los registros en la tabla persona cuando se elimine un registro de la tabla total_donaciones.

            DELIMITER //
            CREATE TRIGGER trigger_eliminar_donante
            AFTER DELETE ON total_donaciones
            FOR EACH ROW
            DELETE FROM persona WHERE identificador = old.id_persona;
            END; //

