-- 📌 Query 1: Monthly Revenue and Order Volume
SELECT
    STRFTIME('%Y', order_date) AS year,
    STRFTIME('%m', order_date) AS month,
    SUM(COALESCE(amount, 0)) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM orders
WHERE order_date IS NOT NULL
GROUP BY year, month
ORDER BY year, month;

-- 📌 Query 2: Top 3 Months by Highest Revenue
SELECT
    year,
    month,
    monthly_revenue
FROM (
    SELECT
        STRFTIME('%Y', order_date) AS year,
        STRFTIME('%m', order_date) AS month,
        SUM(COALESCE(amount, 0)) AS monthly_revenue
    FROM orders
    GROUP BY year, month
) AS monthly_summary
ORDER BY monthly_revenue DESC
LIMIT 3;
