CREATE OR ALTER VIEW OrderListing AS SELECT 

	"Order".OrderNumber AS 'Order Number', 
	"Order".OrderDate AS 'Order Date', 
	"Order".TotalAmount AS 'Order Amount', 
	(SELECT SUM(Quantity) FROM OrderItem WHERE OrderId = "Order".Id) AS 'Item Amount', 
	CONCAT(Customer.FirstName, ' ', Customer.LastName) AS 'Full Name', 
	Customer.Phone

	FROM "Order"
	JOIN Customer
	ON "Order".CustomerId = Customer.Id