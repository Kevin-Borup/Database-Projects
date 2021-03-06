USE [Sales]
GO
/****** Object:  UserDefinedFunction [dbo].[timeDifference]    Script Date: 25-09-2021 19:41:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kevin Borup Hansen
-- Create date: 25/09/21 - 18:16
-- Description:	TimeDifference calculation
-- =============================================
ALTER FUNCTION [dbo].[timeDifference] 
(
	-- Add the parameters for the function here
	@before datetime,
	@after datetime
)
RETURNS CHAR(9)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @timeDiff CHAR(9)

	-- Add the T-SQL statements to compute the return value here
	SET @timeDiff = CONCAT_WS(':', CONVERT(CHAR(2), DATEDIFF(minute, @before, @after)), CONVERT(CHAR(2), DATEDIFF(second, @before, @after)), CONVERT(CHAR(3), DATEDIFF(millisecond, @before, @after))); 

	-- Return the result of the function
	RETURN @timeDiff

END
