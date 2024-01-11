<div align ="center">

#TAREA 2

</div>

<div align="justify">

sqlite3 tarea2.db

sqlite> create table propietario (
   ...> id integer primary key autoincrement,
   ...> nombre text not null,
   ...> apellidos text not null,
   ...> dni text unique);


sqlite> create table vehiculos (
   ...> id integer primary key autoincrement,
   ...> marca text not null,
   ...> modelo text not null,
   ...> anio integer not null,
   ...> id_propietario integer,
   ...> foreign key (id_propietario) references propietario(id));


sqlite> insert into propietario (nombre, apellidos, dni) values ('Juan', 'Perez', '12345678A');
sqlite> insert into propietario (nombre, apellidos, dni) values ('Maria', 'Lopez', '87654321B');
sqlite> insert into propietario (nombre, apellidos, dni) values ('Carlos', 'Ruiz', '11111111C');
sqlite> insert into propietario (nombre, apellidos, dni) values ('Laura', 'Gomez', '22222222D');
sqlite> insert into propietario (nombre, apellidos, dni) values ('Pedro', 'Martinez', '33333333E');
sqlite> insert into propietario (nombre, apellidos, dni) values ('Ana', 'Fernandez', '44444444F');
sqlite> insert into propietario (nombre, apellidos, dni) values ('Diego', 'Sanchez', '55555555G');
sqlite> insert into propietario (nombre, apellidos, dni) values ('Sofia', 'Torres', '66666666H');
sqlite> insert into propietario (nombre, apellidos, dni) values ('Javier', 'Leon', '77777777I');
sqlite> insert into propietario (nombre, apellidos, dni) values ('Lucia', 'Castillo', '88888888J');
sqlite> insert into propietario (nombre, apellidos, dni) values ('Luis', 'Gonzalez', '99999999K');
sqlite> insert into propietario (nombre, apellidos, dni) values ('Marta', 'Diaz', '10101010L');
sqlite> insert into propietario (nombre, apellidos, dni) values ('Victor', 'Vargas', '11111112M');
sqlite> insert into propietario (nombre, apellidos, dni) values ('Elena', 'Castro', '12121212N');
sqlite> insert into propietario (nombre, apellidos, dni) values ('Roberto', 'Blanco', '13131313O');
sqlite> insert into propietario (nombre, apellidos, dni) values ('Natalia', 'Paredes', '14141414P');
sqlite> insert into propietario (nombre, apellidos, dni) values ('Fernando', 'Herrera', '15151515Q');
sqlite> insert into propietario (nombre, apellidos, dni) values ('Clara', 'Soto', '16161616R');
sqlite> insert into propietario (nombre, apellidos, dni) values ('Sergio', 'Mendoza', '17171717S');
sqlite> insert into propietario (nombre, apellidos, dni) values ('Patricia', 'Navarro', '18181818T');


sqlite> insert into vehiculos (marca, modelo, anio) values ('Ford', 'Fiesta', '2019');
sqlite> insert into vehiculos (marca, modelo, anio) values ('Toyota', 'Corolla', '2018');
sqlite> insert into vehiculos (marca, modelo, anio) values ('Nissan', 'Sentra', '2020');
sqlite> insert into vehiculos (marca, modelo, anio) values ('Chevrolet', 'Spark', '2017');
sqlite> insert into vehiculos (marca, modelo, anio) values ('Honda', 'Civic', '2016');
sqlite> insert into vehiculos (marca, modelo, anio) values ('Ford', 'Mustang', '2021');
sqlite> insert into vehiculos (marca, modelo, anio) values ('Toyota', 'RAV4', '2019');
sqlite> insert into vehiculos (marca, modelo, anio) values ('Volkswagen', 'Golf', '2020');
sqlite> insert into vehiculos (marca, modelo, anio) values ('Honda', 'CR-V', '2018');
sqlite> insert into vehiculos (marca, modelo, anio) values ('Nissan', 'Altima', '2017');
sqlite> insert into vehiculos (marca, modelo, anio) values ('Nissan', 'Malibu', '2019');
sqlite> insert into vehiculos (marca, modelo, anio) values ('Toyota', 'Camry', '2020');
sqlite> insert into vehiculos (marca, modelo, anio) values ('Honda', 'Accord', '2018');
sqlite> insert into vehiculos (marca, modelo, anio) values ('Ford', 'Explorer', '2021');
sqlite> insert into vehiculos (marca, modelo, anio) values ('Nissan', 'Rogue', '2017');
sqlite> insert into vehiculos (marca, modelo, anio) values ('Volkswagen', 'Jetta', '2019');
sqlite> insert into vehiculos (marca, modelo, anio) values ('Chevrolet', 'Equinox', '2018');
sqlite> insert into vehiculos (marca, modelo, anio) values ('Toyota', 'Highlander', '2020');
sqlite> insert into vehiculos (marca, modelo, anio) values ('Honda', 'Odyssey', '2016');
sqlite> insert into vehiculos (marca, modelo, anio) values ('Nissan', 'Murano', '2019');

</div>