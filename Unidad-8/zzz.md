--crea la bases de datos donacion

DROP DATABASE IF EXISTS donacion;

Create database donacion;

use donacion;

-- crea la tabla persona


-- creando la tabla total_donaciones para su uso posterior


-- PROCEDIMIENTOS:


-- Realizar un procedimiento que realice la inserción de datos aleatorios en la tabla. El procedimiento debe de recibir como parámetro de entrada, al menos, el número de registros que se desea insertar y se debe de lanzar, al menos, en     dos ocasiones, para verificar su correcto funcionamiento. Los datos deben de ser aleatorios, es decir, en cada inserción de debe de auto generar o seleccionar uno al azar, de los campos requeridos.



-- Realiza un procedimiento que permita actualizar el la fecha de última donación, teniendo como parámetro de entrada el identificador de la persona, y una fecha.


-- Crea un procedimiento llamado CalcularTotalDonaciones que calcule la cantidad total de donaciones realizadas por cada persona y la almacene en una tabla llamada total_donaciones. La tabla total_donaciones debe tener dos columnas: id_persona (texto) y cantidad_total (integer).


        -- Crea un procedimiento que me permita eliminar una persona de la tabla total_donaciones. 


-- FUNCIONES:


-- Realiza una función que determine si una persona almacenada en la tabla persona puede realizar una donación. Para ello la función recibe como parámetro de entrada el identificador de esta persona, y una fecha de donación. Revisa las condiciones para que una persona pueda o no donar. Posteriormente actualice el valor de la última donación de la persona indicada con el parámetro de entrada.
            
            

-- Realiza una función que determine que persona es la que más donaciones ha realizado.


-- TRIGGERS:


-- Realiza un trigger que actualiza total_donaciones con cada una de las inserciones que se realicen en la tabla Persona.



-- Realiza un trigger que elimine todos los registros en la tabla persona cuando se elimine un registro de la tabla total_donaciones.

