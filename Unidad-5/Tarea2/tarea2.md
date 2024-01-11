<div align ="center">

# TAREA 2

<img src="https://www.openlogic.com/sites/default/files/image/2019-12/image-blog-ol-pro-con-key-open-source-database_0.jpg">

## INTRODUCCIÓN

</div>

<div align="justify">

En la Tarea 2, el objetivo era crear dos tablas, **propietarios** y **vehiculos**, insertar su información respectivamente, además de relacionarlas. Para ello, seguí los siguientes pasos:
<div align="center">
   
## 1. CREANDO TABLAS

</div>

### El primer paso es la creación de las tablas de la tarea, junto con la información que deben contener sus campos. Para ello está la función **create table**:

Creando la tabla propietario:

> sqlite> create table propietario (
   ...> id integer primary key autoincrement,
   ...> nombre text not null,
   ...> apellidos text not null,
   ...> dni text unique);


Creando la tabla vehículos:


> sqlite> create table vehiculos (
   ...> id integer primary key autoincrement,
   ...> marca text not null,
   ...> modelo text not null,
   ...> anio integer not null,
   ...> id_propietario integer,
   ...> foreign key (id_propietario) references propietario(id));

## 2. INSERTS

### Ahora, el siguiente paso es la inserción de información en las tablas con la función **insert**:

Primero añadí la información de los propietrarios
</div>

> sqlite> insert into propietario (nombre, apellidos, dni) values ('Juan', 'Perez', '12345678A');

>sqlite> insert into propietario (nombre, apellidos, dni) values ('Maria', 'Lopez', '87654321B');

>sqlite> insert into propietario (nombre, apellidos, dni) values ('Carlos', 'Ruiz', '11111111C');

>sqlite> insert into propietario (nombre, apellidos, dni) values ('Laura', 'Gomez', '22222222D');

>sqlite> insert into propietario (nombre, apellidos, dni) values ('Pedro', 'Martinez', '33333333E');

>sqlite> insert into propietario (nombre, apellidos, dni) values ('Ana', 'Fernandez', '44444444F');

>sqlite> insert into propietario (nombre, apellidos, dni) values ('Diego', 'Sanchez', '55555555G');

>sqlite> insert into propietario (nombre, apellidos, dni) values ('Sofia', 'Torres', '66666666H');

>sqlite> insert into propietario (nombre, apellidos, dni) values ('Javier', 'Leon', '77777777I');

>sqlite> insert into propietario (nombre, apellidos, dni) values ('Lucia', 'Castillo', '88888888J');

>sqlite> insert into propietario (nombre, apellidos, dni) values ('Luis', 'Gonzalez', '99999999K');

>sqlite> insert into propietario (nombre, apellidos, dni) values ('Marta', 'Diaz', '10101010L');

>sqlite> insert into propietario (nombre, apellidos, dni) values ('Victor', 'Vargas', '11111112M');

>sqlite> insert into propietario (nombre, apellidos, dni) values ('Elena', 'Castro', '12121212N');

>sqlite> insert into propietario (nombre, apellidos, dni) values ('Roberto', 'Blanco', '13131313O');

>sqlite> insert into propietario (nombre, apellidos, dni) values ('Natalia', 'Paredes', '14141414P');

>sqlite> insert into propietario (nombre, apellidos, dni) values ('Fernando', 'Herrera', '15151515Q');

>sqlite> insert into propietario (nombre, apellidos, dni) values ('Clara', 'Soto', '16161616R');

>sqlite> insert into propietario (nombre, apellidos, dni) values ('Sergio', 'Mendoza', '17171717S');

>sqlite> insert into propietario (nombre, apellidos, dni) values ('Patricia', 'Navarro', '18181818T');

Hecho esto, ya pasé a la inserción de la información de los vehículos:

>sqlite> insert into vehiculos (marca, modelo, anio) values ('Ford', 'Fiesta', '2019');

>sqlite> insert into vehiculos (marca, modelo, anio) values ('Toyota', 'Corolla', '2018');

>sqlite> insert into vehiculos (marca, modelo, anio) values ('Nissan', 'Sentra', '2020');

>sqlite> insert into vehiculos (marca, modelo, anio) values ('Chevrolet', 'Spark', '2017');

>sqlite> insert into vehiculos (marca, modelo, anio) values ('Honda', 'Civic', '2016');

>sqlite> insert into vehiculos (marca, modelo, anio) values ('Ford', 'Mustang', '2021');

>sqlite> insert into vehiculos (marca, modelo, anio) values ('Toyota', 'RAV4', '2019');

>sqlite> insert into vehiculos (marca, modelo, anio) values ('Volkswagen', 'Golf', '2020');

>sqlite> insert into vehiculos (marca, modelo, anio) values ('Honda', 'CR-V', '2018');

>sqlite> insert into vehiculos (marca, modelo, anio) values ('Nissan', 'Altima', '2017');

>sqlite> insert into vehiculos (marca, modelo, anio) values ('Nissan', 'Malibu', '2019');

>sqlite> insert into vehiculos (marca, modelo, anio) values ('Toyota', 'Camry', '2020');

>sqlite> insert into vehiculos (marca, modelo, anio) values ('Honda', 'Accord', '2018');

>sqlite> insert into vehiculos (marca, modelo, anio) values ('Ford', 'Explorer', '2021');

>sqlite> insert into vehiculos (marca, modelo, anio) values ('Nissan', 'Rogue', '2017');

>sqlite> insert into vehiculos (marca, modelo, anio) values ('Volkswagen', 'Jetta', '2019');

>sqlite> insert into vehiculos (marca, modelo, anio) values ('Chevrolet', 'Equinox', '2018');

>sqlite> insert into vehiculos (marca, modelo, anio) values ('Toyota', 'Highlander', '2020');

>sqlite> insert into vehiculos (marca, modelo, anio) values ('Honda', 'Odyssey', '2016');

>sqlite> insert into vehiculos (marca, modelo, anio) values ('Nissan', 'Murano', '2019');

<div align="center">

## 3. CONSULTAS

</div>

### El siguiente paso a seguir era la realización de 10 consultas:

### 1. Seleccionar todos los propietarios:

> select * from propietario

### 2. Listar todos los vehículos:

> select * from vehiculos

### 3. Seleccionar solo los nombres y apellidos de los propietarios:

> select nombre, apellidos from propietario

### 4. Listar todas las marcas y modelos de vehículos

> select marca, modelo from vehiculos

### 5. Seleccionar todos los propietarios con el apellido "Pérez":

> select * from propietario where apellido = 'Perez'

 ### 6. Listar todos los vehículos del año 2019

 > select * from vehiculos where anio = '2019'

### 7. Seleccionar los propietarios que tienen vehículos de la marca Toyota:

> select * from propietario as p, vehiculos as v where v.id_propietario = p.id;

### 8. Listar vehículos de la marca "Ford" y modelo "Fiesta":

> select * from table where marca = 'Ford' and modelo = 'Fiesta'

### 9.Seleccionar propietarios con DNI "12345678A":

> select * from propietario where dni = '12345678A'

### 10. Listar vehículos que pertenezcan al propietario con ID "5":

> select * from vehiculos as v, propietario as p where v.id_propietario = 5;

<div align="center">

## 4.MODFIFICACIONES:

</div>

Por último, queda modificar algunos de los datos que pertenecen a las distintas tablas de la base de datos

### 1. Actualizar el nombre del proppietario con DNI "12345678A":

> update propietarios
set nombre = Angel
where dni = '12345678A'

### 2. Modificar el año de un vehículo con ID "3" a 2022:

> update vehiculos
set anio = '2022'
where id = '3'

### 3. Cambiar el nombre de todos los vehículos Nissan a "Micra":

> update vehiculos
set modelo = 'Micra'
where marca = 'Nissan'

### 4. Actualizar el apellido de un propietario con ID 7 a "Gómez":

> update propietario
set apellidos = 'Gómez'
where id = '7'

### 5. Modificar la marca de un modelo "Fiesta" a "Renault":

> update vehiculos
set marca = 'Renault'
where modelo = 'Fiesta'



</div>

</div>
