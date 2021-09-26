USE [master]
GO
USE [Sales]
GO

DECLARE @BeforeTime datetime;
DECLARE @MidTime datetime;
DECLARE @AfterTime datetime;

SET @BeforeTime = CURRENT_TIMESTAMP;
SELECT * from ProductVarient;
SET @MidTime = CURRENT_TIMESTAMP;
SELECT * from ProductVarient WHERE ProductDescription LIKE '%test%';
SET @AfterTime = CURRENT_TIMESTAMP;

PRINT 'Set 1: First Procedure Duraction:  ' + dbo.timeDifference(@BeforeTime, @MidTime);
PRINT 'Set 1: Second Procedure Duraction: ' + dbo.timeDifference(@BeforeTime, @MidTime);

CREATE INDEX ProductVIndex
	ON ProductVarient (ProductId); 

SET @BeforeTime = CURRENT_TIMESTAMP;
SELECT * from ProductVarient;
SET @MidTime = CURRENT_TIMESTAMP;
SELECT * from ProductVarient WHERE ProductDescription LIKE '%test%';
SET @AfterTime = CURRENT_TIMESTAMP;

PRINT 'Set 2: First Procedure Duraction:  ' + dbo.timeDifference(@BeforeTime, @MidTime);
PRINT 'Set 2: Second Procedure Duraction: ' + dbo.timeDifference(@BeforeTime, @MidTime);