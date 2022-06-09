CREATE DATABASE JBecerraExamenGrupoReforma

CREATE TABLE Proveedor(
IdProveedor INT IDENTITY(1,1) PRIMARY KEY,
RazonSocial VARCHAR(50) NOT NULL,
Direccion VARCHAR(50) NOT NULL,
Telefono VARCHAR(15),
)

CREATE TABLE Factura(
FolioFactura INT PRIMARY KEY NOT NULL,
Fecha DATE NOT NULL,
IdProveedor INT REFERENCES Proveedor (IdProveedor)
)

CREATE TABLE Producto(
IdProducto INT IDENTITY(1,1) PRIMARY KEY,
Descripcion VARCHAR(100) NOT NULL,
PrecioUnitario DECIMAL(18,2) NOT NULL
)

CREATE TABLE DetalleFactura(
IdDetalleFactura INT IDENTITY(1,1) PRIMARY KEY,
FolioFactura INT REFERENCES Factura(FolioFactura),
IdProducto INT REFERENCES Producto(IdProducto),
Cantidad INT NOT NULL
)


INSERT INTO Proveedor
VALUES ('Gamesa','Calle trueno','5511223344'),
	   ('Cocacola','Calle Gomez','5544556677'),
	   ('Barcel','Calle Flores','5577889944')

INSERT INTO Factura
VALUES ('12','12/21/2021',1),
	   ('15','12/12/2020',2),
	   ('17','12/23/2022',2),
	   ('124','12/21/2021',3),
	   ('100','12/19/2020',1),
	   ('99','12/01/2018',2),
	   ('201','12/05/2019',3),
	   ('101','12/05/2015',3),
	   ('102','12/05/2021',2),
	   ('104','12/04/2000',1)

INSERT INTO Producto
VALUES ('Coca',13),
		('Fanta',22),
		('Doritos',16),
		('Takis',16),
		('Emperador Chocolate',14),
		('Emperador Vainilla',14),
		('Agua Ciel',6),
		('Mamut',10),
		('Chips', 14),
		('Hot-Nuts',10)

INSERT INTO DetalleFactura
VALUES (12,2,10),
		(12,1,3),
		(15,6,6),
		(17,7,1),
		(17,9,4),
		(99,1,8),
		(99,6,8),
		(100,1,3),
		(100,3,12),
		(100,6,1),
		(101,2,10),
		(102,5,12),
		(104,10,2),
		(124,2,1),
		(201,10,12),
		(201,8,12),
		(201,2,6)

SELECT Factura.FolioFactura,
	   Factura.Fecha,
	   Proveedor.RazonSocial,
	   Proveedor.Direccion,
	   Proveedor.Telefono
FROM Factura
INNER JOIN Proveedor ON (Factura.IdProveedor = Proveedor.IdProveedor)
WHERE Factura.FolioFactura BETWEEN 100 AND 105

--B
SELECT DetalleFactura.FolioFactura,
	   DetalleFactura.Cantidad,
	   Producto.Descripcion,
	   Producto.PrecioUnitario,
	   (Producto.PrecioUnitario * DetalleFactura.Cantidad) AS Importe
FROM Producto
INNER JOIN DetalleFactura ON (DetalleFactura.IdProducto = Producto.IdProducto)
WHERE DetalleFactura.FolioFactura = 201

--C

SELECT DetalleFactura.FolioFactura,
	   SUM(Producto.PrecioUnitario * DetalleFactura.Cantidad) AS ImporteTotal
FROM Producto
INNER JOIN DetalleFactura ON (DetalleFactura.IdProducto = Producto.IdProducto)
WHERE DetalleFactura.FolioFactura BETWEEN 200 AND 250
GROUP BY DetalleFactura.FolioFactura

--D

SELECT Proveedor.IdProveedor,
	   Proveedor.RazonSocial,
	   AVG(DetalleFactura.Cantidad * Producto.PrecioUnitario) AS PagoPromedio
FROM DetalleFactura
INNER JOIN Producto ON (DetalleFactura.IdProducto = Producto.IdProducto)
INNER JOIN Factura ON (DetalleFactura.FolioFactura = Factura.FolioFactura)
INNER JOIN Proveedor ON ( Factura.IdProveedor = Proveedor.IdProveedor)
GROUP BY Proveedor.IdProveedor, Proveedor.RazonSocial

CREATE TABLE Persona(
IdPersona INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(50),
Direccion VARCHAR(50),
Edad INT,
Correo VARCHAR(50),
Habilidad VARCHAR(50),
IdTipo VARCHAR(50),
)

SELECT * FROM Persona
GO
CREATE PROCEDURE PersonasSP 'ADD',null,'Jose','Calle Rayo',24,'jose@becerra.com','Lectura','Programación'
@Accion VARCHAR(10),
@IdPersona INT,
@Nombre VARCHAR(50),
@Direccion VARCHAR(50),
@Edad INT,
@Correo VARCHAR(50),
@HabilidadPrincial VARCHAR(50),
@HabilidadSecundaria VARCHAR(50)
AS
	DECLARE @IdTipo INT;
	IF(@Edad <= 30)
	BEGIN
		SET @IdTipo = 1;
	END
	ELSE IF (@Edad > 30 AND @Edad < 60)
	BEGIN
		SET @IdTipo = 2;
	END
	ELSE IF (@Edad > 60)
	BEGIN
		SET @IdTipo = 3;
	END
	
	DECLARE @Habilidad vARCHAR(50)
	SET @Habilidad = @HabilidadPrincial + '/' + @HabilidadSecundaria;
	IF(@Accion = 'ADD')
		BEGIN
			INSERT INTO [dbo].[Persona]
				([Nombre]
				,[Direccion]
				,[Edad]
				,[Correo]
				,[Habilidad]
				,[IdTipo])
				VALUES (@Nombre,
				@Direccion,
				@Edad ,
				@Correo,
				@Habilidad ,
				@IdTipo)
		END
	ELSE IF (@Accion = 'UPDATE')
		BEGIN
			UPDATE [dbo].[Persona]
			SET [Nombre] = @Nombre,
				[Direccion] = @Direccion,
				[Edad] = @Edad,
				[Correo] = @Correo,
				[Habilidad] = @Habilidad,
				[IdTipo] = @IdTipo
			WHERE IdPersona = @IdPersona
		END
	ELSE IF (@Accion = 'DELETE')
		BEGIN
			DELETE FROM Persona
			WHERE IdPersona = @IdPersona
		END
	ELSE PRINT 'Accion no Valida';
SELECT * FROM Persona

EXEC PersonasSP 'DELETE',2,'Jose','Calle Rayo',31,'jose@becerra.com','Lectura','Programación'