USE [selldb]
GO
CREATE PROCEDURE GetOrderDetails 
(@OrderID Integer)
AS
SELECT o.OrderID, o.OrderDate, o.CustomerID, c.CustomerName, c.Contact, p.ProductID, p.ProductName, p.Price, od.QTY
FROM Orders o
     INNER JOIN Customers c ON o.CustomerID = c.CustomerID
	 INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
	 INNER JOIN Products p ON od.ProductID = p.ProductID
WHERE o.OrderID = @OrderID
ORDER BY p.ProductID ASC 
RETURN