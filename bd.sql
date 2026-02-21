CREATE DATABASE SGIAC;
GO

USE SGIAC;
GO

CREATE TABLE Categorias (
    IdCategoria INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Productos (
    IdProducto INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(250),
    Precio DECIMAL(10,2) NOT NULL,
    StockActual INT NOT NULL,
    StockMinimo INT NOT NULL,
    IdCategoria INT FOREIGN KEY REFERENCES Categorias(IdCategoria)
);

CREATE TABLE Usuarios (
    IdUsuario INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Rol VARCHAR(20) NOT NULL
);

CREATE TABLE Movimientos (
    IdMovimiento INT PRIMARY KEY IDENTITY(1,1),
    IdProducto INT FOREIGN KEY REFERENCES Productos(IdProducto),
    TipoMovimiento VARCHAR(10),
    Cantidad INT NOT NULL,
    FechaRegistro DATETIME DEFAULT GETDATE()
);

INSERT INTO Categorias (Nombre) VALUES ('Hardware'), ('Software'), ('Accesorios');

INSERT INTO Productos (Nombre, Descripcion, Precio, StockActual, StockMinimo, IdCategoria)
VALUES 
('Monitor', 'Monitor LED Full HD', 150.00, 10, 3, 1),
('Teclado', 'Teclado RGB Switch Blue', 45.00, 2, 5, 3),
('Licencia', 'Serial OEM Pro', 120.00, 20, 5, 2),
('Mouse', 'Mouse Optico 2.4GHz', 25.00, 15, 4, 3);

INSERT INTO Usuarios (Username, Password, Rol)
VALUES ('admin', 'admin123', 'Administrador');

SELECT * FROM Productos;