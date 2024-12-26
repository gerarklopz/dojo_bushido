-- Crear la base de datos
CREATE DATABASE BojoBushidoDB; -- Crea una base de datos llamada 'BojoBushidoDB'.
USE BojoBushidoDB; -- Selecciona la base de datos recién creada para trabajar con ella.

-- Crear la tabla de Clientes
CREATE TABLE Clientes (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único para cada cliente, se incrementa automáticamente.
    Nombre VARCHAR(50), -- Almacena el nombre del cliente, hasta 50 caracteres.
    Apellidos VARCHAR(100), -- Almacena los apellidos del cliente, hasta 100 caracteres.
    Direccion VARCHAR(100), -- Almacena la dirección del cliente, hasta 100 caracteres.
    Ciudad VARCHAR(50), -- Almacena el nombre de la ciudad, hasta 50 caracteres.
    Codigo_Postal VARCHAR(10), -- Almacena el código postal, hasta 10 caracteres.
    Email VARCHAR(100), -- Almacena el correo electrónico del cliente, hasta 100 caracteres.
    Telefono VARCHAR(15) -- Almacena el número de teléfono del cliente, hasta 15 caracteres.
);

-- Insertar datos en la tabla de Clientes
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

-- Crear la tabla de Productos
CREATE TABLE Productos (
    ID_Producto INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único para cada producto, se incrementa automáticamente.
    Nombre VARCHAR(100), -- Almacena el nombre del producto, hasta 100 caracteres.
    Descripcion TEXT, -- Almacena la descripción del producto.
    Precio DECIMAL(10,2), -- Almacena el precio del producto con dos decimales.
    Stock INT -- Almacena la cantidad disponible del producto.
);

-- Inserta datos en la tabla Productos
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

-- Crear la tabla de Pedidos
CREATE TABLE Pedidos (
    ID_Pedido INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único para cada pedido, se incrementa automáticamente.
    ID_Cliente INT, -- Identificador del cliente que realiza el pedido.
    Fecha_Pedido DATE, -- Almacena la fecha en que se realizó el pedido.
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente) -- Establece una clave foránea vinculando al cliente.
);

-- Insertar datos en la tabla de Pedidos
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

-- Crear la tabla de DetallesPedidos
CREATE TABLE DetallesPedidos (
    ID_Detalle INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único para cada detalle del pedido.
    ID_Pedido INT, -- Identificador del pedido al que pertenece el detalle.
    ID_Producto INT, -- Identificador del producto solicitado.
    Cantidad INT, -- Almacena la cantidad del producto solicitado.
    PrecioUnitario DECIMAL(10,2), -- Precio por unidad del producto solicitado.
    Subtotal DECIMAL(10,2), -- Almacena el subtotal calculado.
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido), -- Clave foránea vinculando al pedido.
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto) -- Clave foránea vinculando al producto.
);

-- Insertar datos en la tabla de DetallesPedidos
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



