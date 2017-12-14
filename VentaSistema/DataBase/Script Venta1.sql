USE MASTER
DROP DATABASE VENTA1
CREATE DATABASE VENTA1
USE VENTA1
CREATE TABLE RANGO (
	idrango int PRIMARY KEY,
	descrip varchar(15)
)
INSERT INTO RANGO (idrango,descrip)
values(1,'Administrador'),
	  (2,'Vendedor')
CREATE TABLE USUARIO (
	idusuario int PRIMARY KEY,
	nombusuario char(30),
	apelliusuario char(40),
	correo varchar(40),
	dni varchar(8),
	pwd varchar(15),
	idrango int FOREIGN KEY REFERENCES RANGO(idrango)
)
INSERT INTO USUARIO VALUES(3001,'Alex','Cu','alex@abc.com','76466445','123',1),
						  (2001,'Josue','Cu','josue@abc.com','78451261','111',2 )
CREATE TABLE DETALLE_RANGO (
	idrango int FOREIGN KEY REFERENCES RANGO(idrango),
	idmodulo int,
	modulo varchar(30)
)
INSERT INTO DETALLE_RANGO VALUES(1,101,'Mant. de Articulos'),
								(1,201,'Mant. de Usuarios'),
								(1,102,'Consulta Articulos'),
								(2,102,'Consulta Articulos'),
							    (1,301,'Mant. de Cliente'),
								(2,301,'Mant. de Cliente')
								select * from DETALLE_RANGO
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
INSERT INTO CLIENTE VALUES(4001,'Luis','Bejarano','78945615','45625874145','Av. Siempre Viva 123','4562587','988456123','LuisBeja@hotmail.com')
INSERT INTO CLIENTE VALUES(4000,'Generico','','','','','','','')
select * from cliente
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
INSERT INTO VENTA VALUES(70001,4000,2001,'Boleta','B0001','2017-12-14 12:01:15',80.50,'Cancelado')
SELECT * 
FROM VENTA
CREATE TABLE CATEGORIA (
	idcategoria int PRIMARY KEY,
	nombre char(15),
	descripcion TEXT,
	condicion INT  
)
INSERT INTO CATEGORIA VALUES(1,'Prenda Vestir','Polos, pantalones, camisas y gorras',1),
							(2,'Accesorios', 'Llaveros etc',0)								
CREATE TABLE DESCUENTOS (
	id_descuento int PRIMARY KEY,
	temporada varchar(50),
	temp_inicio varchar(8),
	temp_fin varchar(8),
	descuento_inicio varchar(8),
	descuento_fin varchar(8),
	pocentaje varchar(4)
)
INSERT INTO DESCUENTOS VALUES('1001','Verano','22-12-17','21-03-18','28-12-17','01-02-18','20%'),
							 ('1002','Otoño','22-03-18','21-06-18','01-05-18','05-05-18','30%')
							 
							 	
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
INSERT INTO ARTICULO VALUES(11001,1,'102030405060','Polo Cuello V',20,'S','imagen.jpg','Disponible','1001')
CREATE TABLE DETALLE_VENTA (
	iddetalle int PRIMARY KEY,
	idventa int FOREIGN KEY REFERENCES VENTA(idventa),
	idarticulo int FOREIGN KEY REFERENCES ARTICULO(idarticulo),
	cantidad int,
	precio_uni decimal(5,2),
	descuento_venta varchar(4)
)
INSERT INTO DETALLE_VENTA VALUES(70001,70001,11001,4,25.50,'5%')

