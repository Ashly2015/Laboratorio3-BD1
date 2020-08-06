drop database comercio;
create database comercio;
use comercio;

create table caja(
id_caja varchar(128) primary key,
estatus varchar(1) not null
)engine=innodb;



create table grupo_empresa(
id_grupo varchar(128) primary key,
nombre_grupo varchar(128) not null
)engine=innodb;

create table empresa(
id_empresa varchar(128) primary key not null,
id_grupo varchar(128) not null,
nombre varchar(128) not null,
telefono varchar(128) not null,
correo varchar(128) not null,
foreign key (id_grupo) references
grupo_empresa(id_grupo)
)engine=innodb;



create table moneda(
id_moneda varchar(128) primary key,
nombre varchar(128) not null,
tipo_cambio double not null,
estatus varchar(1) not null
)engine=innodb;

create table moneda_movimiento(
id_moneda varchar(128)  not null,
fecha date not null,
movimiento_cambio double not null,
foreign key (id_moneda) references
moneda(id_moneda),
primary key(id_moneda,fecha)
)engine=innodb;

create table marca(
id_marca varchar(128) primary key,
nombre varchar(128) not null,
stock varchar(1) not null
)engine=innodb;
create table linea(
id_linea varchar(128) primary key,
nombre varchar(128) not null,
stock varchar(1) not null
)engine=innodb;

create table puesto(
id_puesto varchar(128) primary key,
nombre varchar(128) not null,
estatus varchar(1) not null
)engine=innodb;

create table empleado(
id_empleado varchar(128) primary key,
id_puesto varchar(128) not null,
nombre varchar(128) not null,
telefono varchar(128) not null,
direccion varchar(128) not null,
email varchar (128) not null,
estatus varchar(1) not null,
foreign key(id_puesto) references
puesto(id_puesto)
)engine=Innodb;

create table producto(
id_producto varchar(128) primary key,
id_linea varchar(128) not null,
id_marca varchar(128) not null,
nombre_producto varchar(128) not null,
precio double not null,
costo double not null,
fecha_compra date not null,
fecha_venta date not null,
foreign key(id_linea) references
linea(id_linea),
foreign key(id_marca) references
marca(id_marca)
)engine=Innodb;

create table tienda(
id_tienda varchar(128) primary key,
id_empresa varchar(128) not null,
nombre varchar(128) not null,
direccion varchar(128) not null,
telefono varchar(128) not null,
foreign key(id_empresa) references
empresa(id_empresa)
)engine=Innodb;

create table serie(
id_serie varchar(128) primary key,
id_tienda varchar(128) not null,
id_caja varchar(128) not null,
tipo Varchar(2) not null,
foreign key (id_tienda) references
tienda(id_tienda),
foreign key (id_caja) references
caja(id_caja)
)engine=innodb;

create table existencia(
id_existencia varchar(128) primary key,
id_producto varchar(128) not null,
id_tienda varchar(128) not null,
stock int not null,
foreign key (id_producto) references
producto(id_producto),
foreign key (id_tienda) references
tienda(id_tienda)
)engine=Innodb;

create table proveedor(
nit_proveedor varchar(128) primary key,
nombre_proveedor varchar(128) not null,
direccion varchar(128) not null
)engine=Innodb;

create table compra_encabezado(
id_compraE varchar(128) primary key,
nit_proveedor varchar(128) not null,
id_moneda varchar(128) not null,
total double not null,
fecha date not null,
foreign key (id_moneda) references
moneda_movimiento(id_moneda),
foreign key (nit_proveedor) references
proveedor(nit_proveedor)
)engine=Innodb;


create table compra_detalle(
id_producto varchar(128) primary key not null,
id_compraE varchar(128) not null,
foreign key (id_producto) references
producto(id_producto),
foreign key (id_compraE) references
compra_encabezado(id_compraE)
)engine=Innodb;

create table cliente(
nit_cliente varchar(128) primary key,
nombre varchar(128) not null,
direccion varchar(128) not null,
telefono varchar(128) not null,
correo varchar(128) not null
)engine=Innodb;




create table division(
id_division varchar(128) primary key,
nombre varchar(128) not null

)engine=Innodb;

create table cartera(
id_empleado varchar (128) not null,
nit_cliente varchar (128) not null,
id_division varchar(128) not null,
foreign key (id_empleado) references
empleado(id_empleado),
foreign key (nit_cliente) references
cliente(nit_cliente),
foreign key (id_division) references
division(id_division)
)engine=Innodb;

create table venta_encabezado (
id_ventaE varchar(128) ,
id_tienda varchar(128) ,
nit_cliente varchar(128) not null,
id_empleado varchar(128) ,
id_serie varchar(128) ,
id_moneda varchar(128) ,
cambio double not null,
fecha date not null,
total double not null,
foreign key (id_empleado) references
empleado(id_empleado),
foreign key (id_moneda) references
moneda_movimiento(id_moneda),
foreign key (id_serie) references
serie(id_serie),
foreign key (nit_cliente) references
cliente(nit_cliente),
foreign key (id_tienda) references
tienda(id_tienda),
primary key(id_ventaE,id_tienda,nit_cliente,id_empleado,id_serie,id_moneda)
)engine=Innodb;

create table venta_detalle(
id_ventaE varchar(128) ,
id_empleado varchar(128) ,
id_tienda varchar(128) ,
id_serie varchar(128) ,
id_producto varchar(128) ,
cantidad int not null,
costo double not null,
precio double not null,
foreign key (id_producto) references
producto(id_producto),
foreign key (id_tienda) references
tienda(id_tienda),
foreign key (id_serie) references
serie(id_serie),
foreign key (id_empleado) references
empleado(id_empleado),
foreign key (id_ventaE) references
venta_encabezado(id_ventaE),
primary key(id_ventaE,id_empleado,id_tienda,id_serie,id_producto)
)engine=Innodb;

create table rol(
id_rol varchar(128) primary key,
nombre varchar(128) not null,
estatus varchar(1) not null
)engine=innodb;

create table usuario(
id_usuario varchar(128) primary key,
id_empleado varchar(128) not null,
id_rol varchar(128) not null,
nombre_usuario varchar(128) not null,
contraseña varchar(128) not null,
foreign key (id_rol) references
rol(id_rol),
foreign key (id_empleado) references
empleado(id_empleado)
)engine=innodb;

