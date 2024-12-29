# 📊 Consultas SQL para Reportes

## **Descripción General**
Este archivo contiene consultas SQL optimizadas para obtener reportes prácticos relacionados con **clientes**, **productos**, **pedidos** y **detalles de ventas**. Estas consultas están diseñadas para proporcionar información clave a supervisores o para análisis de datos en sistemas empresariales.

---

## 📖 Índice de Consultas
1. [Listar Todos los Clientes](#1-listar-todos-los-clientes)
2. [Mostrar los Productos Disponibles en Stock](#2-mostrar-los-productos-disponibles-en-stock)
3. [Obtener Pedidos Realizados por un Cliente Específico](#3-obtener-pedidos-realizados-por-un-cliente-específico)
4. [Listar Productos en un Pedido Específico](#4-listar-productos-en-un-pedido-específico)
5. [Calcular el Valor Total de un Pedido](#5-calcular-el-valor-total-de-un-pedido)
6. [Clientes que Realizaron al Menos un Pedido](#6-clientes-que-realizaron-al-menos-un-pedido)
7. [Productos Más Vendidos](#7-productos-más-vendidos)
8. [Mostrar el Total Gastado por Cada Cliente](#8-mostrar-el-total-gastado-por-cada-cliente)
9. [Identificar Productos sin Ventas](#9-identificar-productos-sin-ventas)
10. [Promedio de Productos por Pedido](#10-promedio-de-productos-por-pedido)

---

## 1. Listar Todos los Clientes
```sql
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
```
- **Descripción:** Lista hasta 10 clientes, ordenados alfabéticamente.
- **Uso:** Identificar clientes principales.

---

## 2. Mostrar los Productos Disponibles en Stock
```sql
SELECT
    Nombre,
    Stock,
    Precio
FROM Productos
WHERE Stock > 0
ORDER BY Nombre
LIMIT 6;
```
- **Descripción:** Lista productos con stock disponible, limitando la salida a 6 registros.
- **Uso:** Visualizar disponibilidad de inventario.

---

## 3. Obtener Pedidos Realizados por un Cliente Específico
```sql
SELECT
    ID_Pedido,
    Fecha_Pedido
FROM Pedidos
WHERE ID_Cliente = 2
ORDER BY Fecha_Pedido DESC
LIMIT 10;
```
- **Descripción:** Muestra hasta 10 pedidos recientes del cliente con ID=2.
- **Uso:** Analizar historial de compras de un cliente.

---

## 4. Listar Productos en un Pedido Específico
```sql
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
```
- **Descripción:** Lista productos incluidos en el pedido con ID=5.
- **Uso:** Detallar los artículos en una orden específica.

---

## 5. Calcular el Valor Total de un Pedido
```sql
SELECT
    SUM(D.Subtotal) AS TotalPedido
FROM DetallesPedidos D
WHERE D.ID_Pedido = 5;
```
- **Descripción:** Calcula el monto total del pedido con ID=5.
- **Uso:** Obtener el valor monetario de una orden específica.

---

## 6. Clientes que Realizaron al Menos un Pedido
```sql
SELECT C.Nombre,
       C.Apellidos
FROM Clientes C
WHERE EXISTS (
    SELECT 1
    FROM Pedidos P
    WHERE P.ID_Cliente = C.ID_Cliente
)
LIMIT 10;
```
- **Descripción:** Lista clientes que tienen al menos un pedido.
- **Uso:** Identificar clientes activos.

---

## 7. Productos Más Vendidos
```sql
SELECT
    P.Nombre AS Producto,
    SUM(D.Cantidad) AS TotalCantidad
FROM DetallesPedidos D
JOIN Productos P ON D.ID_Producto = P.ID_Producto
GROUP BY P.Nombre
ORDER BY TotalCantidad DESC
LIMIT 5;
```
- **Descripción:** Lista los 5 productos más vendidos, ordenados por cantidad.
- **Uso:** Detectar artículos más demandados.

---

## 8. Mostrar el Total Gastado por Cada Cliente
```sql
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
LIMIT 3;
```
- **Descripción:** Muestra los 3 clientes con mayor gasto acumulado.
- **Uso:** Identificar a los clientes más valiosos.

---

## 9. Identificar Productos sin Ventas
```sql
SELECT
    P.Nombre
FROM Productos P
LEFT JOIN DetallesPedidos D ON P.ID_Producto = D.ID_Producto
WHERE D.ID_Producto IS NULL
ORDER BY P.Nombre
LIMIT 5;
```
- **Descripción:** Lista 5 productos que no tienen ventas registradas.
- **Uso:** Detectar productos menos populares.

---

## 10. Promedio de Productos por Pedido
```sql
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
```
- **Descripción:** Calcula el promedio de productos por pedido.
- **Uso:** Analizar el comportamiento de compra por pedido.

---




