
# README - Consultas SQL para Reportes

Este archivo contiene consultas SQL optimizadas para obtener reportes prácticos relacionados con clientes, productos, pedidos y detalles de ventas. Las consultas están diseñadas para proporcionar información clave para supervisores o análisis de datos.

## 1. Listar todos los clientes

SELECT 
    ID_Cliente, 
    Nombre, 
    Apellidos, 
    Ciudad, 
    Email, 
    Telefono
FROM Clientes;
-- Consulta para obtener un listado general de clientes con información clave.


## 2. Mostrar los productos disponibles en stock

SELECT 
    Nombre, 
    Stock, 
    Precio
FROM Productos 
WHERE Stock > 0
ORDER BY Nombre;
-- Se listan los productos disponibles en stock con su cantidad y precio, ordenados alfabéticamente.


## 3. Obtener los pedidos realizados por un cliente específico (ID=1)

SELECT 
    ID_Pedido, 
    Fecha_Pedido
FROM Pedidos 
WHERE ID_Cliente = 1;
-- Muestra los pedidos realizados por el cliente con ID=1, indicando la fecha de cada pedido.


## Consultas Intermedias

## 4. Listar los productos incluidos en un pedido específico (ID=1)

SELECT 
    P.Nombre AS Producto, 
    D.Cantidad, 
    D.PrecioUnitario, 
    D.Subtotal 
FROM DetallesPedidos D
JOIN Productos P ON D.ID_Producto = P.ID_Producto
WHERE D.ID_Pedido = 1;
-- Muestra los productos, cantidad y subtotales de un pedido específico (ID=1).


## 5. Calcular el valor total de un pedido específico (ID=1)

SELECT 
    SUM(D.Subtotal) AS TotalPedido
FROM DetallesPedidos D
WHERE D.ID_Pedido = 1;
-- Calcula el total de un pedido específico sumando los subtotales de sus productos.


## 6. Obtener los clientes que realizaron al menos un pedido

SELECT DISTINCT 
    C.Nombre, 
    C.Apellidos
FROM Clientes C
JOIN Pedidos P ON C.ID_Cliente = P.ID_Cliente;
-- Lista los clientes que han realizado al menos un pedido.


## Consultas Avanzadas

## 7. Listar los productos más vendidos (ordenados por cantidad)

SELECT 
    P.Nombre AS Producto, 
    SUM(D.Cantidad) AS TotalCantidad
FROM DetallesPedidos D
JOIN Productos P ON D.ID_Producto = P.ID_Producto
GROUP BY P.Nombre
ORDER BY TotalCantidad DESC;
-- Muestra los productos más vendidos ordenados por la cantidad total de ventas.


## 8. Mostrar el total gastado por cada cliente

SELECT 
    C.Nombre, 
    C.Apellidos, 
    SUM(D.Subtotal) AS TotalGastado
FROM Clientes C
JOIN Pedidos P ON C.ID_Cliente = P.ID_Cliente
JOIN DetallesPedidos D ON P.ID_Pedido = D.ID_Pedido
GROUP BY C.ID_Cliente
ORDER BY TotalGastado DESC;
-- Calcula el total gastado por cada cliente y lo ordena de mayor a menor gasto.


## 9. Identificar productos sin ventas

SELECT 
    P.Nombre 
FROM Productos P
LEFT JOIN DetallesPedidos D ON P.ID_Producto = D.ID_Producto
WHERE D.ID_Producto IS NULL;
-- Lista los productos que no tienen ventas registradas (sin detalles en pedidos).


## 10. Obtener el promedio de productos por pedido

SELECT 
    AVG(TotalProductos) AS PromedioPorPedido
FROM (
    SELECT 
        ID_Pedido, 
        SUM(Cantidad) AS TotalProductos
    FROM DetallesPedidos
    GROUP BY ID_Pedido
) AS Subconsulta;
-- Calcula el promedio de productos solicitados por pedido.




