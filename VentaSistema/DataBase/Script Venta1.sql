USE MASTER
DROP DATABASE VENTA1
CREATE DATABASE VENTA1
USE VENTA1
CREATE TABLE RANGO (
	idrango int PRIMARY KEY,
	descrip varchar(15)
)
CREATE TABLE usuario (
	idusuario int PRIMARY KEY,
	nombusuario char(30),
	apelliusuario char(40),
	correo varchar(40),
	dni varchar(8),
	pwd varchar(15),
	idrango int FOREIGN KEY REFERENCES RANGO(idrango)
)
CREATE TABLE DETALLE_RANGO (
	idrango int FOREIGN KEY REFERENCES RANGO(idrango),
	idmodulo int PRIMARY KEY,
	modulo varchar(20)
)
CREATE TABLE CLIENTE (
	idcliente int PRIMARY KEY,
	nombrecli char(50),
	apellicli char(50),
	DNI varchar(8),
	RUC varchar(11),
	direccion varchar(50),
	telefono varchar(7),
	celular varchar(12),
	email varchar(30)
)
CREATE TABLE VENTA (
	idventa int PRIMARY KEY,
	idcliente int FOREIGN KEY REFERENCES CLIENTE(idcliente),
	idusuario int FOREIGN KEY REFERENCES USUARIO(idusuario),
	tipo_compobante varchar(20),
	serie_comprobante varchar(20),
	fecha_hora datetime,
	total_venta decimal(5,2),
	estado varchar(20)
)
CREATE TABLE CATEGORIA(
	idcategoria int PRIMARY KEY,
	nombre char(15),
	descripcion TEXT,
	condicion INT  
)
CREATE TABLE DESCUENTOS (
	id_descuento int PRIMARY KEY,
	temporada varchar(50),
	temp_inicio datetime,
	temp_fin datetime,
	descuento_inicio datetime,
	descuento_fin datetime,
	pocentaje varchar(3)
)
CREATE TABLE ARTICULO (
	idarticulo int PRIMARY KEY ,
	idcategoria int FOREIGN KEY REFERENCES CATEGORIA(idcategoria),
	codigo varchar(50),
	nombre varchar(80),
	stock  int,
	descripcion text,
	imagen varchar(50),
	estado varchar(20),
	id_descuento int FOREIGN KEY REFERENCES DESCUENTOS(id_descuento)
)
CREATE TABLE DETALLE_VENTA (
	iddetalle int PRIMARY KEY,
	idventa int FOREIGN KEY REFERENCES VENTA(idventa),
	idarticulo int FOREIGN KEY REFERENCES ARTICULO(idarticulo),
	cantidad int,
	precio_uni decimal(5,2)
)
