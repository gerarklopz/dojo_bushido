
# README - Consultas SQL para Reportes

Este archivo contiene consultas SQL optimizadas para obtener reportes prácticos relacionados con clientes, productos, pedidos y detalles de ventas. Las consultas están diseñadas para proporcionar información clave para supervisores o análisis de datos.

## 1. Listar todos los clientes
```sql
SELECT 
    ID_Cliente, 
    Nombre, 
    Apellidos, 
    Ciudad, 
    Email, 
    Telefono
FROM Clientes;
-- Consulta para obtener un listado general de clientes con información clave.
```

## 2. Mostrar los productos disponibles en stock
```sql
SELECT 
    Nombre, 
    Stock, 
    Precio
FROM Productos 
WHERE Stock > 0
ORDER BY Nombre;
-- Se listan los productos disponibles en stock con su cantidad y precio, ordenados alfabéticamente.
```

## 3. Obtener los pedidos realizados por un cliente específico (ID=1)
```sql
SELECT 
    ID_Pedido, 
    Fecha_Pedido
FROM Pedidos 
WHERE ID_Cliente = 1;
-- Muestra los pedidos realizados por el cliente con ID=1, indicando la fecha de cada pedido.
```

## Consultas Intermedias

## 4. Listar los productos incluidos en un pedido específico (ID=1)
```sql
SELECT 
    P.Nombre AS Producto, 
    D.Cantidad, 
    D.PrecioUnitario, 
    D.Subtotal 
FROM DetallesPedidos D
JOIN Productos P ON D.ID_Producto = P.ID_Producto
WHERE D.ID_Pedido = 1;
-- Muestra los productos, cantidad y subtotales de un pedido específico (ID=1).
```

## 5. Calcular el valor total de un pedido específico (ID=1)
```sql
SELECT 
    SUM(D.Subtotal) AS TotalPedido
FROM DetallesPedidos D
WHERE D.ID_Pedido = 1;
-- Calcula el total de un pedido específico sumando los subtotales de sus productos.
```

## 6. Obtener los clientes que realizaron al menos un pedido
```sql
SELECT DISTINCT 
    C.Nombre, 
    C.Apellidos
FROM Clientes C
JOIN Pedidos P ON C.ID_Cliente = P.ID_Cliente;
-- Lista los clientes que han realizado al menos un pedido.
```

## Consultas Avanzadas

## 7. Listar los productos más vendidos (ordenados por cantidad)
```sql
SELECT 
    P.Nombre AS Producto, 
    SUM(D.Cantidad) AS TotalCantidad
FROM DetallesPedidos D
JOIN Productos P ON D.ID_Producto = P.ID_Producto
GROUP BY P.Nombre
ORDER BY TotalCantidad DESC;
-- Muestra los productos más vendidos ordenados por la cantidad total de ventas.
```

## 8. Mostrar el total gastado por cada cliente
```sql
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
```

## 9. Identificar productos sin ventas
```sql
SELECT 
    P.Nombre 
FROM Productos P
LEFT JOIN DetallesPedidos D ON P.ID_Producto = D.ID_Producto
WHERE D.ID_Producto IS NULL;
-- Lista los productos que no tienen ventas registradas (sin detalles en pedidos).
```

## 10. Obtener el promedio de productos por pedido
```sql
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
```

## Explicación General y Enfoque para un Reporte

- **Claridad**: Las consultas ahora están optimizadas para reportes y análisis, incluyendo la información más relevante de cada entidad (cliente, producto, pedido) sin sobrecargar la consulta con datos innecesarios.
- **Orden y Legibilidad**: Se ha incluido un orden específico en las consultas cuando es necesario (por ejemplo, `ORDER BY`), para presentar la información de forma más estructurada y fácil de analizar.
- **Enfoque Directo**: Las consultas están diseñadas para proporcionar información específica para un reporte, como totales de ventas, productos sin ventas, y clientes que han realizado pedidos.

## Mejoras adicionales sugeridas:
- **Filtros de fecha**: En consultas como la de clientes o pedidos, podrías añadir un filtro de fecha para realizar análisis dentro de rangos específicos (por ejemplo, ventas mensuales, clientes que compraron en el último trimestre).
- **Agregados por categorías**: Si los productos tienen categorías, podrías agregar agrupaciones para obtener los totales por tipo de producto.

