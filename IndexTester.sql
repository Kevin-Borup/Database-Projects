DECLARE @BeforeTime datetime;
DECLARE @MidTime datetime;
DECLARE @AfterTime datetime;

SET @BeforeTime = CURRENT_TIMESTAMP;
SELECT * from Product;
SET @MidTime = CURRENT_TIMESTAMP;
SELECT ProductId from Product;
SET @AfterTime = CURRENT_TIMESTAMP;

PRINT 'Set 1: First Procedure Duraction:  ' + missms_timeDifference(@BeforeTime, @MidTime);
PRINT 'Set 1: Second Procedure Duraction: ' + missms_timeDifference(@BeforeTime, @MidTime);

CREATE INDEX SalesIndexID
	ON Product (ProductId); 

SET @BeforeTime = CURRENT_TIMESTAMP;
SELECT * from Product;
SET @MidTime = CURRENT_TIMESTAMP;
SELECT ProductId from Product;
SET @AfterTime = CURRENT_TIMESTAMP;

PRINT 'Set 2: First Procedure Duraction:  ' + missms_timeDifference(@BeforeTime, @MidTime);
PRINT 'Set 2: Second Procedure Duraction: ' + missms_timeDifference(@BeforeTime, @MidTime);