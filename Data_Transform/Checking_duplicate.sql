SELECT
	OrderID,
    OrderStatus,
    LastUpdated,
    COUNT(*)
FROM Orders
GROUP BY OrderId, OrderStatus, LastUpdated
HAVING COUNT(*) > 1;