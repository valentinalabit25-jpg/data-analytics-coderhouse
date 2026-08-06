-- ==========================================
-- Consulta 1: Resumen ejecutivo mensual
-- ==========================================

SELECT
    EXTRACT(MONTH FROM fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY EXTRACT(MONTH FROM fecha_venta)
ORDER BY mes;

-- ==========================================
-- Consulta 2: Ranking de productos
-- ==========================================

SELECT
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC
LIMIT 5;

-- ==========================================
-- Consulta 3: Clientes recurrentes
-- ==========================================

SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY total_gastado DESC;

-- ==========================================
-- Consulta 4: Meses por encima / debajo del promedio
-- ==========================================

WITH ventas_mensuales AS (
    SELECT
        EXTRACT(MONTH FROM fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY EXTRACT(MONTH FROM fecha_venta)
)

SELECT
    mes,
    total_facturado,
    CASE
        WHEN total_facturado >
            (SELECT AVG(total_facturado) FROM ventas_mensuales)
        THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_promedio
FROM ventas_mensuales
ORDER BY mes;

-- ==========================================
-- Hallazgos
-- ==========================================

-- Hallazgo 1:
-- El producto con mayor facturación se posiciona como el más importante del período analizado.

-- Hallazgo 2:
-- Existen clientes que realizaron más de una compra, mostrando un comportamiento recurrente.

-- Hallazgo 3:
-- El total facturado varía entre los meses, permitiendo identificar períodos por encima y por debajo del promedio.
