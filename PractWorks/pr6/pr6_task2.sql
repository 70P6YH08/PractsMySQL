SELECT order_id, YEAR(datetime_order)
FROM orders
WHERE  YEAR(datetime_order) = 2026;