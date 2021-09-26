USE [Sales]
GO
 BEGIN
 TRUNCATE TABLE [Sales].[dbo].[ProductVarient]
 DECLARE @Record INT
 DECLARE @Repeater CHAR(4)
 SET @Record=1
 WHILE (1=1)
 BEGIN
 IF (@Record % 2 = 0) 
	SELECT @Repeater = 'test'; 
ELSE 
	SELECT @Repeater = '';
 INSERT INTO [Sales].[dbo].[ProductVarient]
 ([ProductName] ,[ProductDescription],[ProductPrice])
 VALUES ('Product ' + STR(@Record), 'Description ' + @Repeater + STR(@Record), @Record*100/3)
 SET @RECORD = @RECORD+1
 END
END

