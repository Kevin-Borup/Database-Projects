
DECLARE @BeforeTime datetime
DECLARE @MidTime datetime
DECLARE @AfterTime datetime

SET @BeforeTime = '2021-09-25 19:43:19.562'
SET @MidTime = '2021-09-25 19:45:21.470'
SET @AfterTime = '2021-09-25 19:45:21.571'

PRINT 'Set 1: First Procedure Duraction:  ' + dbo.timeDifference(@BeforeTime, @MidTime);
PRINT 'Set 1: Second Procedure Duraction: ' + dbo.timeDifference(@MidTime, @AfterTime);