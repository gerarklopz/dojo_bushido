
# README - Consultas SQL para Reportes

Este archivo contiene consultas SQL optimizadas para obtener reportes prácticos relacionados con clientes, productos, pedidos y detalles de ventas. Las consultas están diseñadas para proporcionar información clave para supervisores o análisis de datos.

# Prepare the SQL queries with changes as per the user's request

-- 1. Listar todos los clientes
SELECT 
    ID_Cliente, 
    Nombre, 
    Apellidos, 
    Ciudad, 
    Email, 
    Telefono
FROM Clientes
ORDER BY Apellidos, Nombre
LIMIT 10;
-- Comentarios: Añadimos un orden alfabético y limitamos a 10 clientes, ya que solo hay 10 disponibles.

-- 2. Mostrar los productos disponibles en stock
SELECT 
    Nombre, 
    Stock, 
    Precio
FROM Productos 
WHERE Stock > 0
ORDER BY Nombre
LIMIT 10;
-- Comentarios: Ordenamos por nombre y limitamos a 10 productos disponibles.

-- 3. Obtener los pedidos realizados por un cliente específico (ID=2)
SELECT 
    ID_Pedido, 
    Fecha_Pedido
FROM Pedidos 
WHERE ID_Cliente = 2
ORDER BY Fecha_Pedido DESC
LIMIT 10;
-- Comentarios: Mostramos los pedidos del cliente con ID=2, ordenados por fecha (descendente) y limitados a 10.

-- 4. Listar los productos incluidos en un pedido específico (ID_Pedido=5)
SELECT 
    P.Nombre AS Producto, 
    D.Cantidad, 
    D.PrecioUnitario, 
    D.Subtotal 
FROM DetallesPedidos D
JOIN Productos P ON D.ID_Producto = P.ID_Producto
WHERE D.ID_Pedido = 5
ORDER BY P.Nombre
LIMIT 10;
-- Comentarios: Mostramos los productos de un pedido específico (ID=5) y los ordenamos alfabéticamente por nombre.

-- 5. Calcular el valor total de un pedido específico (ID_Pedido=5)
SELECT 
    SUM(D.Subtotal) AS TotalPedido
FROM DetallesPedidos D
WHERE D.ID_Pedido = 5;
-- Comentarios: Calculamos el total del pedido con ID=5.

-- 6. Obtener los clientes que realizaron al menos un pedido
SELECT C.Nombre, 
       C.Apellidos
FROM Clientes C
WHERE EXISTS (
    SELECT 1
    FROM Pedidos P
    WHERE P.ID_Cliente = C.ID_Cliente
)
LIMIT 10;
-- Comentarios: Usamos EXISTS para mejorar la eficiencia y limitamos el número de clientes a 10.

-- 7. Listar los productos más vendidos
SELECT 
    P.Nombre AS Producto, 
    SUM(D.Cantidad) AS TotalCantidad
FROM DetallesPedidos D
JOIN Productos P ON D.ID_Producto = P.ID_Producto
GROUP BY P.Nombre
ORDER BY TotalCantidad DESC
LIMIT 10;
-- Comentarios: Mostramos los 10 productos más vendidos, ordenados por cantidad vendida.

-- 8. Mostrar el total gastado por cada cliente
SELECT 
    C.Nombre, 
    C.Apellidos, 
    SUM(D.Subtotal) AS TotalGastado
FROM Clientes C
JOIN Pedidos P ON C.ID_Cliente = P.ID_Cliente
JOIN DetallesPedidos D ON P.ID_Pedido = D.ID_Pedido
GROUP BY C.ID_Cliente
HAVING SUM(D.Subtotal) > 0
ORDER BY TotalGastado DESC
LIMIT 10;
-- Comentarios: Mostramos los clientes con el total gastado, limitando a los 10 clientes con mayor gasto.

-- 9. Identificar productos sin ventas
SELECT 
    P.Nombre 
FROM Productos P
LEFT JOIN DetallesPedidos D ON P.ID_Producto = D.ID_Producto
WHERE D.ID_Producto IS NULL
ORDER BY P.Nombre
LIMIT 10;
-- Comentarios: Mostramos los productos sin ventas registradas, ordenados por nombre y limitados a 10.

-- 10. Obtener el promedio de productos por pedido
SELECT 
    AVG(TotalProductos) AS PromedioPorPedido
FROM (
    SELECT 
        ID_Pedido, 
        SUM(Cantidad) AS TotalProductos
    FROM DetallesPedidos
    GROUP BY ID_Pedido
    HAVING SUM(Cantidad) > 0
) AS Subconsulta;
-- Comentarios: Mostramos el promedio de productos por pedido, sin necesidad de limitaciones.



