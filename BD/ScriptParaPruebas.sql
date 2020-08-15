-- LLENANDO LA BASE DE DATOS PARA PRUEBAS
use comercio;
select * from compra_detalle;
select * from marca;
select * from compra_encabezado;
select * from compra_detalle;
select * from producto;

insert into marca values ("1", "Incasa", "a");
insert into linea values ("1", "Instantaneo", "a");
insert into producto values("1","1", "1","Cafe", 6.00, 10.00, 14/08/2020, 14/08/2020);
insert into producto values("2","1", "1","Azucar", 4.00, 12.00, 14/08/2020, 14/08/2020);
insert into producto values("3","1", "1","Leche", 8.00, 10.00, 14/08/2020, 14/08/2020);
insert into producto values("4","1", "1","Canela", 3.00, 5.00, 14/08/2020, 14/08/2020);

insert into grupo_empresa values("1", "Grupo1");
insert into empresa values("1", "1", "Starbucks", "58545454", "starbucks@gmail.com");
insert into proveedor values ("1", "CafeGuate", "Ruta Atlantico");

insert into moneda values ("1", "Quetzal", 8.00, "a");