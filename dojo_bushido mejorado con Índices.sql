-- Creando la base de datos
CREATE DATABASE BojoBushidoDB;
USE BojoBushidoDB;

-- Creando la tabla de Clientes
CREATE TABLE Clientes (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellidos VARCHAR(100),
    Direccion VARCHAR(100),
    Ciudad VARCHAR(50),
    Codigo_Postal VARCHAR(10),
    Email VARCHAR(100),
    Telefono VARCHAR(15)
);

-- Creación de índices en Clientes
CREATE INDEX idx_cliente_ciudad ON Clientes(Ciudad); -- Índice en la columna Ciudad
CREATE INDEX idx_cliente_nombre_apellidos ON Clientes(Nombre, Apellidos); -- Índice compuesto en Nombre y Apellidos

-- Creación de la tabla de Productos
CREATE TABLE Productos (
    ID_Producto INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripcion TEXT,
    Precio DECIMAL(10,2),
    Stock INT
);

-- Creación de índice en Productos
CREATE INDEX idx_producto_precio ON Productos(Precio); -- Índice en la columna Precio

-- Creación de la tabla de Pedidos
CREATE TABLE Pedidos (
    ID_Pedido INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    Fecha_Pedido DATE,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)
);

-- Creando de índice en Pedidos
CREATE INDEX idx_pedido_cliente ON Pedidos(ID_Cliente); -- Índice en la columna ID_Cliente de Pedidos

-- Creación de la tabla de DetallesPedidos
CREATE TABLE DetallesPedidos (
    ID_Detalle INT AUTO_INCREMENT PRIMARY KEY,
    ID_Pedido INT,
    ID_Producto INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10,2),
    Subtotal DECIMAL(10,2),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido),
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
);

-- Creación de índices en DetallesPedidos
CREATE INDEX idx_detalle_pedido ON DetallesPedidos(ID_Pedido); -- Índice en ID_Pedido
CREATE INDEX idx_detalle_producto ON DetallesPedidos(ID_Producto); -- Índice en ID_Producto

-- Datos en la tabla Clientes
INSERT INTO Clientes (Nombre, Apellidos, Direccion, Ciudad, Codigo_Postal, Email, Telefono) VALUES
('Marc', 'García López', 'Carrer de la Indústria, 25', 'Sabadell', '08201', 'marc.garcia@gmail.com', '+34 9372 123456'),
('Laura', 'Martínez Fernández', 'Carrer de Gràcia, 10', 'Sabadell', '08202', 'laura.martinez@outlook.com', '+34 9371 654321'),
('Pau', 'Sánchez Ruiz', 'Carrer de Sant Antoni, 15', 'Sabadell', '08203', 'pau.sanchez@yahoo.es', '+34 9374 112233'),
('Marta', 'López García', 'Carrer de la Creu, 8', 'Sabadell', '08204', 'marta.lopez@hotmail.com', '+34 9385 445566'),
('Jordi', 'Hernández Gómez', 'Carrer Major, 50', 'Sabadell', '08205', 'jordi.hernandez@gmail.com', '+34 9372 778899'),
('Anna', 'Pérez Díaz', 'Carrer de Sant Pau, 22', 'Sabadell', '08206', 'anna.perez@outlook.com', '+34 9371 334455'),
('David', 'González Martín', 'Carrer de la Salut, 30', 'Sabadell', '08207', 'david.gonzalez@yahoo.es', '+34 9374 667788'),
('Cristina', 'Rodríguez López', 'Carrer de les Paus, 12', 'Sabadell', '08208', 'cristina.rodriguez@hotmail.com', '+34 9385 990011'),
('Oriol', 'Fernández Pérez', 'Carrer de la República, 5', 'Sabadell', '08209', 'oriol.fernandez@gmail.com', '+34 9372 223344'),
('Sílvia', 'García Sánchez', 'Carrer de la Llibertat, 18', 'Sabadell', '08210', 'silvia.garcia@outlook.com', '+34 9371 556677');

-- Datos en la tabla Productos
INSERT INTO Productos (Nombre, Descripcion, Precio, Stock) VALUES
('Katana', 'Espada samurái tradicional', 150.00, 10),
('Yari', 'Lanza japonesa para combate', 120.00, 5),
('Wakizashi', 'Espada corta samurái', 100.00, 8),
('Naginata', 'Arma de asta japonesa', 200.00, 4),
('Bo', 'Bastón de madera largo', 50.00, 20),
('Tanto', 'Daga japonesa', 80.00, 15),
('Shuriken', 'Estrella arrojadiza', 30.00, 50),
('Sai', 'Daga tridente tradicional', 90.00, 12),
('Nunchaku', 'Arma de dos palos conectados', 40.00, 25),
('Fukiya', 'Cerbatana japonesa', 70.00, 10);

-- Datos en la tabla Pedidos insertados
INSERT INTO Pedidos (ID_Cliente, Fecha_Pedido) VALUES
(1, '2024-12-01'),
(2, '2024-12-02'),
(3, '2024-12-03'),
(4, '2024-12-04'),
(5, '2024-12-05'),
(6, '2024-12-06'),
(7, '2024-12-07'),
(8, '2024-12-08'),
(9, '2024-12-09'),
(10, '2024-12-10');

-- Finalmente insertando los datos en la tabla DetallesPedidos
INSERT INTO DetallesPedidos (ID_Pedido, ID_Producto, Cantidad, PrecioUnitario, Subtotal) VALUES
(1, 1, 1, 250.00, 250.00),
(2, 2, 2, 75.00, 150.00),
(3, 3, 1, 250.00, 250.00),
(4, 4, 3, 15.00, 45.00),
(5, 5, 4, 100.00, 100.00),
(6, 6, 5, 30.00, 60.00),
(7, 7, 1, 250.00, 250.00),
(8, 8, 2, 75.00, 75.00),
(9, 9, 3, 15.00, 30.00),
(10, 10, 4, 100.00, 200.00);
