create table tbl_producto (
  idProducto int IDENTITY(1,1) primary key, 
  nombre varchar(50),
  precio decimal(10,2),
  fecha_creacion datetime,
  estado varchar(50)
);

CREATE PROCEDURE GetAllProducts
AS
BEGIN
    SELECT * FROM tbl_producto WHERE estado != 'Eliminado'
END

create table producto (
  idProducto int IDENTITY(1,1) primary key, 
  nombre varchar(50),
  precio decimal(10,2),
  fecha_creacion datetime,
  estado varchar(50)
);

CREATE PROCEDURE AllProducts
AS
BEGIN
    SELECT * FROM producto WHERE estado != 'Eliminado'
END


CREATE PROCEDURE InsertProducto
(
    @nombre VARCHAR(50),
    @precio DECIMAL(10, 2),
	@estado VARCHAR(50)	
)
AS
BEGIN
    DECLARE @fecha_creacion DATETIME
    SET @fecha_creacion = CONVERT(DATETIME, GETDATE())

    INSERT INTO producto (nombre, precio, fecha_creacion, estado)
    VALUES (@nombre, @precio, @fecha_creacion, @estado)
END


CREATE PROCEDURE UpdateProducto
    @idProducto INT,
    @nombre VARCHAR(50),
    @precio DECIMAL(10,2),
    @estado VARCHAR(20)
AS
BEGIN
    UPDATE producto
    SET nombre = @nombre,
        precio = @precio,
        estado = @estado
    WHERE idProducto = @idProducto
END

CREATE PROCEDURE DeleteProducto
    @idProducto INT
AS
BEGIN
    UPDATE producto
    SET estado = 'Eliminado'
    WHERE idProducto = @idProducto
END
