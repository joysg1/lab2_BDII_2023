Create database lab2


use lab2

CREATE Table Personas(   ----- Creacion de tabla Personas

PersonaCodigo INT PRIMARY KEY,
Email VARCHAR(50) NOT NULL,
Nombre VARCHAR(50) NOT NULL,
Apellido VARCHAR(50) NOT NULL,
Telefono VARCHAR(50) NOT NULL,
Genero CHAR (1) NOT NULL,
Dirreccion VARCHAR(50) NOT NULL,
CONSTRAINT U_Email UNIQUE(Email),
CONSTRAINT U_Telefono UNIQUE(Telefono),
CONSTRAINT CK_Genero CHECK (Genero in ('F', 'M')),

);



Create table vehiculos (   ----- Creacion de tabla vehiculo

Placa varchar(50) NOT NULL,
Num_Motor varchar(50) NOT NULL,
Marca varchar(50) NOT NULL,
Color varchar(50) NOT NULL,
Tipo_poliza varchar(50) NOT NULL,
Modelo varchar(50) NOT NULL,
Clase varchar(50) NOT NULL,
CONSTRAINT CK_Tipo_poliza CHECK (Tipo_poliza in ('Full' , 'Terceros')),
CONSTRAINT CK_Modelo CHECK (Modelo in ('Sedan', 'SUV', '4X4')),
PersonaCod int,
CONSTRAINT PK_vehiculos PRIMARY KEY(Placa,Num_Motor), 
CONSTRAINT FK_PersonaCodigo FOREIGN KEY(PersonaCod) REFERENCES Personas(PersonaCodigo)


)

Alter table vehiculos   --- Agregado de restriccion al campo clase tras creacion de tabla vehiculos
add Constraint CK_Clase
CHECK (Clase in('Media','Alta','Lujo'))



Create Table Entidades_Multas (  --- Creacion de tabla entidades multas

Ruc int PRIMARY KEY,
Nombre varchar(50),
Dirreccion varchar(50),
Telefono varchar(50),
Metodo_Pago varchar(50),
CONSTRAINT CK_Metodo_Pago CHECK (Metodo_Pago in('Efectivo','Tarjeta de Credito','Tarjeta de Debito'))

)


Alter table Entidades_Multas     --- Establecimiento de criterio NOT NULL a columnas de la tabla Entidades_Multas
alter column Nombre varchar(50) NOT NULL

Alter table Entidades_Multas
alter column Dirreccion varchar(50) NOT NULL

Alter table Entidades_Multas
alter column Metodo_Pago varchar(50) NOT NULL

Alter table Entidades_Multas
alter column Telefono varchar(50) NOT NULL

Alter table Entidades_Multas  --- Establecimiento de criterio unico al campo telefono de la tabla entidades_multas
add Constraint UQ_Telefono
Unique (Telefono)

Alter table Entidades_Multas  --- Eliminacion de Unique en tabla entidades multas
Drop Constraint UQ_Telefono

Alter table Entidades_Multas ----- Nuevamente se establece critero unico al campo telefono de la tabla entidades multas
add Constraint UQ_Telefono
Unique (Telefono) 




Create table Policias(   --- Creacion de tabla Policias  -
Cod_Policia int PRIMARY KEY,
Nombre varchar(50),
Apellido varchar(50),
Dirreccion varchar(50),
Rango varchar(50),
Telefono varchar(50)


)

Alter table Policias                --- Establecimiento de criterio NOT NULL a los campos de la tabla Policias
alter column nombre varchar(50) not null

Alter table Policias                
alter column apellido varchar(50) not null

Alter table Policias                
alter column dirreccion varchar(50) not null

Alter table Policias                
alter column rango varchar(50) not null

Alter table Policias
alter column telefono varchar(50) not null



Alter table Policias     ----> Establecimiento de constraint unique al telefono de la tabla policias
add constraint U_pol_Telefono
unique(Telefono)

Alter table Policias  --- Restriccion al campo Rango de la tabla Policias
add constraint CK_Rango
CHECK (Rango in('Cabo','Sargento','Sub-Teniente','Teniente'))








CREATE Table Multa(    ---- Creacion de tabla Codigo Multa 
Codigo_Multa int PRIMARY KEY,
Descripcion_Multa VARCHAR(100) NOT NULL,
Importe decimal (5,2) NOT NULL,
Fecha date NOT NULL,
Lugar varchar(50) NOT NULL,
Hora time NOT NULL, 
Num_Motor varchar(50) NOT NULL,
Placa varchar (50) NOT NULL,
cod_policia int NOT NULL,
ruc int NOT NULL,
CONSTRAINT FK_Cod_Policia FOREIGN KEY(cod_policia) REFERENCES Policias(Cod_Policia),
CONSTRAINT FK_Vehiculo FOREIGN KEY(Placa,Num_Motor) REFERENCES Vehiculos(Placa,Num_Motor),
CONSTRAINT FK_Ent_Multas FOREIGN KEY(ruc) REFERENCES Entidades_Multas(Ruc)


)

Alter Table Multa    ---- Asignacion de valor por default a Importe
add Constraint D_Importe
Default 50.00 for Importe


---- INSERT DE REGISTROS TABLA PERSONAS ----

INSERT INTO Personas("PersonaCodigo", "Email", "Nombre", "Apellido", "Telefono", "Genero", "Dirreccion")
VALUES('101','maria.martinez@gmail.com', 'Maria', 'Martinez', '328-4587', 'F', 'San Miguelito')

INSERT INTO Personas("PersonaCodigo", "Email", "Nombre", "Apellido", "Telefono", "Genero", "Dirreccion")
VALUES('102','marcos.sanchez@gmail.com', 'Marcos', 'Sanchez', '302-1323', 'M', 'Colon')

INSERT INTO Personas("PersonaCodigo", "Email", "Nombre", "Apellido", "Telefono", "Genero", "Dirreccion")
VALUES('103','rodrigo.perez@gmail.com', 'Rodrigo', 'Perez', '234-1256', 'M', 'Arraijan')

INSERT INTO Personas("PersonaCodigo", "Email", "Nombre", "Apellido", "Telefono", "Genero", "Dirreccion")
VALUES('104','karla.barrios@gmail.com', 'Karla', 'Barrios', '257-4590', 'F', 'Capira')

INSERT INTO Personas("PersonaCodigo", "Email", "Nombre", "Apellido", "Telefono", "Genero", "Dirreccion")
VALUES('105','joel.velez@gmail.com', 'Joel', 'Velez', '234-5321', 'M', 'Chame')

INSERT INTO Personas("PersonaCodigo", "Email", "Nombre", "Apellido", "Telefono", "Genero", "Dirreccion")
VALUES('106','yasmin.pinzon@gmail.com', 'Yasmin', 'Pinzon', '200-3481', 'F', 'Nuevo Emperador')

INSERT INTO Personas("PersonaCodigo", "Email", "Nombre", "Apellido", "Telefono", "Genero", "Dirreccion")
VALUES('107','vanessa.villarreal@gmail.com', 'Vanessa', 'Villarreal', '242-2189', 'F', 'Boquete')


INSERT INTO Personas("PersonaCodigo", "Email", "Nombre", "Apellido", "Telefono", "Genero", "Dirreccion")
VALUES('108','luisa.figueroa@gmail.com', 'Luisa', 'Figueroa', '242-2189', 'F', 'Anton')   ---> Prueba de unique en telefono

INSERT INTO Personas("PersonaCodigo", "Email", "Nombre", "Apellido", "Telefono", "Genero", "Dirreccion")
VALUES('109','raul.pinzon@gmail.com', 'Raul', 'Pinzon', '232-1567', 'I', 'Nuevo Chorrillo') ---> Prueba de check en genero

Select * from personas


------- INSERT DE REGISTROS TABLA VEHICULOS


INSERT INTO vehiculos ("Placa", "Num_Motor", "Marca", "Color", "Tipo_poliza", "Modelo", "Clase", "PersonaCod")
VALUES ('A5321', '1001', 'Toyota', 'Rojo', 'Full', '4x4', 'Media', '101')

INSERT INTO vehiculos ("Placa", "Num_Motor", "Marca", "Color", "Tipo_poliza", "Modelo", "Clase", "PersonaCod")
VALUES ('A4210', '1002', 'Nissan', 'Blaco', 'Terceros', 'Sedan', 'Media', '102')

INSERT INTO vehiculos ("Placa", "Num_Motor", "Marca", "Color", "Tipo_poliza", "Modelo", "Clase", "PersonaCod")
VALUES ('A2315', '1003', 'Suzuki', 'Negro', 'Full', 'SUV', 'Media', '103')

INSERT INTO vehiculos ("Placa", "Num_Motor", "Marca", "Color", "Tipo_poliza", "Modelo", "Clase", "PersonaCod")
VALUES ('A3159', '2001', 'Subaru', 'Gris', 'Full', '4x4', 'Alta', '104')

INSERT INTO vehiculos ("Placa", "Num_Motor", "Marca", "Color", "Tipo_poliza", "Modelo", "Clase", "PersonaCod")
VALUES ('A3698', '2002', 'Toyota', 'Verde', 'Terceros', 'SUV', 'Lujo', '105')

INSERT INTO vehiculos ("Placa", "Num_Motor", "Marca", "Color", "Tipo_poliza", "Modelo", "Clase", "PersonaCod")
VALUES ('A5234', '2003', 'Ferrari', 'Amarillo', 'Full', 'Sedan', 'Lujo', '106')

INSERT INTO vehiculos ("Placa", "Num_Motor", "Marca", "Color", "Tipo_poliza", "Modelo", "Clase", "PersonaCod")
VALUES ('B2459', '2004', 'Nissan', 'Azul', 'Terceros', '4x4', 'Media', '107')

INSERT INTO vehiculos ("Placa", "Num_Motor", "Marca", "Color", "Tipo_poliza", "Modelo", "Clase", "PersonaCod")
VALUES ('B1034', '2005', 'Subaru', 'Blaco', 'Full', '4x4', 'Baja', '107') ---> Prueba de criterio check en clase 


INSERT INTO vehiculos ("Placa", "Num_Motor", "Marca", "Color", "Tipo_poliza", "Modelo", "Clase", "PersonaCod")
VALUES ('C4034', '2006', 'Toyota', 'Gris', 'No tiene', 'SUV', 'Media', '105') ---> Prueba de crterio check en Poliza

INSERT INTO vehiculos ("Placa", "Num_Motor", "Marca", "Color", "Tipo_poliza", "Modelo", "Clase", "PersonaCod")
VALUES ('D2031', '2007', 'Subaru', 'Celeste', 'Full', 'Deportivo', 'Alta', '102')  ---> Prueba de criterio check en Modelo



---- INSERT DE REGISTROS TABLA ENTIDADES MULTA

INSERT INTO Entidades_Multas("Ruc", "Nombre", "Dirreccion", "Telefono", "Metodo_Pago")
VALUES('501', 'Autoridad Vial', 'Ciudad de Panama' , '357-2176', 'Efectivo')

INSERT INTO Entidades_Multas("Ruc", "Nombre", "Dirreccion", "Telefono", "Metodo_Pago")
VALUES('502', 'Autoridad Reguladora', 'Veracruz' , '320-3477', 'Tarjeta de Debito')

INSERT INTO Entidades_Multas("Ruc", "Nombre", "Dirreccion", "Telefono", "Metodo_Pago")
VALUES('503', 'Asociacion de Vigilancia', 'Nuevo Emperador' , '315-2016', 'Tarjeta de Credito')

INSERT INTO Entidades_Multas("Ruc", "Nombre", "Dirreccion", "Telefono", "Metodo_Pago")
VALUES('504', 'ATTT', 'Ciudad de Panama' , '300-1267', 'Efectivo')

INSERT INTO Entidades_Multas("Ruc", "Nombre", "Dirreccion", "Telefono", "Metodo_Pago")
VALUES('505', ' Asociacion de Ciudadanos Unidos', 'Chiriqui' , '234-8976', 'Tarjeta de Debito')

INSERT INTO Entidades_Multas("Ruc", "Nombre", "Dirreccion", "Telefono", "Metodo_Pago")
VALUES('506', 'Fiscalia General', 'Arraijan' , '267-5432', 'Efectivo')

INSERT INTO Entidades_Multas("Ruc", "Nombre", "Dirreccion", "Telefono", "Metodo_Pago")
VALUES('507', 'Proteccion Civil', 'Ancon' , '226-1689', 'Tarjeta de Credito')

INSERT INTO Entidades_Multas("Ruc", "Nombre", "Dirreccion", "Telefono", "Metodo_Pago")
VALUES('508', 'Asociacion Independiente', 'Miraflores' , '200-5234', 'Cheque') ---> Prueba de criterio check en metodo de pago


INSERT INTO Entidades_Multas("Ruc", "Nombre", "Dirreccion", "Telefono", "Metodo_Pago")
VALUES('509', 'Proteccion Autonoma', 'San Miguelito' , '226-1689', 'Tarjeta de Credito')  ---> Prueba de criterio unique en telefono


-------- INSERT DE REGISTROS TABLA POLICIAS

INSERT INTO Policias("Cod_Policia", "Nombre", "Apellido", "Dirreccion", "Rango", "Telefono")
VALUES('301', 'Jose', 'Marquez', 'Santa Maria', 'Cabo', '234-5671')

INSERT INTO Policias("Cod_Policia", "Nombre", "Apellido", "Dirreccion", "Rango", "Telefono")
VALUES('302', 'Luis', 'Mejia', 'Veracruz', 'Teniente', '321-7832')

INSERT INTO Policias("Cod_Policia", "Nombre", "Apellido", "Dirreccion", "Rango", "Telefono")
VALUES('303', 'Marcos', 'Lopez', 'Vista Alegre', 'Sub-Teniente', '300-4589')

INSERT INTO Policias("Cod_Policia", "Nombre", "Apellido", "Dirreccion", "Rango", "Telefono")
VALUES('304', 'Victor', 'Sanchez', 'Nuevo Emperador', 'Teniente', '367-2190')

INSERT INTO Policias("Cod_Policia", "Nombre", "Apellido", "Dirreccion", "Rango", "Telefono")
VALUES('305', 'Carlos', 'Vargas', 'Cerro Silvestre', 'Cabo', '321-6216')

INSERT INTO Policias("Cod_Policia", "Nombre", "Apellido", "Dirreccion", "Rango", "Telefono")
VALUES('306', 'Mario', 'Martinez', 'Darien', 'Sargento', '320-0015')

INSERT INTO Policias("Cod_Policia", "Nombre", "Apellido", "Dirreccion", "Rango", "Telefono")
VALUES('307', 'Danilo', 'Perez', 'Chiriqui', 'Sargento', '342-2189')

INSERT INTO Policias("Cod_Policia", "Nombre", "Apellido", "Dirreccion", "Rango", "Telefono")
VALUES('308', 'Felipe', 'Martinez', 'San Vicente', 'General', '300-5345') ---> Prueba de check en rango

INSERT INTO Policias("Cod_Policia", "Nombre", "Apellido", "Dirreccion", "Rango", "Telefono")
VALUES('309', 'Fernando', 'Gomez', 'Chorrera', 'Teniente', '342-2189') ---> Prueba de unique en telefono



--- INSERT DE DATOS TABLA MULTA ---

INSERT INTO Multa("Codigo_Multa", "Descripcion_Multa", "Importe", "Fecha", "Lugar", "Hora", "Num_Motor", "Placa", "cod_policia", "ruc")
VALUES('901', 'Invasion de carril', '60', '12-12-2006', 'Ciudad de Panama', '17:20', '1003', 'A2315', '301', '501')

INSERT INTO Multa("Codigo_Multa", "Descripcion_Multa", "Importe", "Fecha", "Lugar", "Hora", "Num_Motor", "Placa", "cod_policia", "ruc")
VALUES('902', 'Limite de velocidad sobrepasado', default , '3-4-2012', 'Veracruz', '13:00', '2001', 'A3159', '302', '502')

INSERT INTO Multa("Codigo_Multa", "Descripcion_Multa", "Importe", "Fecha", "Lugar", "Hora", "Num_Motor", "Placa", "cod_policia", "ruc")
VALUES('903', 'Uso incorrecto de luces delanteras', '100' , '10-2-2014', 'Nuevo Emperador', '14:45', '2002', 'A3698', '303', '503')

INSERT INTO Multa("Codigo_Multa", "Descripcion_Multa", "Importe", "Fecha", "Lugar", "Hora", "Num_Motor", "Placa", "cod_policia", "ruc")
VALUES('904', 'Salto de luz roja', default , '8-3-2010', 'Ciudad de Panama', '15:00', '1002', 'A4210', '304', '504')

INSERT INTO Multa("Codigo_Multa", "Descripcion_Multa", "Importe", "Fecha", "Lugar", "Hora", "Num_Motor", "Placa", "cod_policia", "ruc")
VALUES('905', 'Manejo agresivo', '150' , '2-6-2016', 'Chiriqui', '18:30', '2003', 'A5234', '305', '505')

INSERT INTO Multa("Codigo_Multa", "Descripcion_Multa", "Importe", "Fecha", "Lugar", "Hora", "Num_Motor", "Placa", "cod_policia", "ruc")
VALUES('906', 'Insultos a unidad policial', default , '4-1-2019', 'Ancon', '14:15', '1001', 'A5321', '306', '507')

INSERT INTO Multa("Codigo_Multa", "Descripcion_Multa", "Importe", "Fecha", "Lugar", "Hora", "Num_Motor", "Placa", "cod_policia", "ruc")
VALUES('907', 'Luces traseras descompuestas', '120' , '2-2-2020', 'Arraijan', '14:15', '2004', 'B2459', '307', '506')


--- Visualizacion de datos

Select * from Policias

Select * from Vehiculos

Select * from Entidades_Multas

Select * from Multa


---- Consultas de prueba

Select Codigo_Multa, Importe    --- Seleccion de multas con un importe distinto a 50.00
from Multa
where importe <> 50.00


Select marca, color    --- Seleccion de autos de marca toyota o que tengan color negro
from vehiculos
where marca = 'Toyota' or color = 'negro'


Select dbo.Policias.Rango, dbo.Policias.Apellido as unidad ---- Seleccion de policias con el rango de teniente
from Policias
where rango ='Teniente'   

Select ruc, nombre as Nombre_de_Entidad, metodo_pago
from Entidades_Multas
where metodo_pago = 'Tarjeta de credito' or metodo_pago = 'Tarjeta de debito'  --- Seleccion de entidades de multa con metodos de pago por tarjeta de credito o debito


select * from personas

select nombre, apellido, genero   --- Seleccion de personas con genero femenino
from personas
where genero <> 'M'

select email, PersonaCodigo  --- Seleccion de personas cuyos correos no inician con m
from personas
where email not like 'm%' 
