-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kevin Borup Hansen
-- Create date: 25/09/21 - 18:16
-- Description:	TimeDifference Calculation
-- =============================================
CREATE FUNCTION timeDifference 
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
	SELECT @timeDiff = CONVERT(CHAR(2), DATEDIFF(minute, @before, @after)); 
	SELECT @timeDiff += ':' + CONVERT(CHAR(2), DATEDIFF(second, @before, @after)); 
	SELECT @timeDiff += ':' + CONVERT(CHAR(3), DATEDIFF(millisecond, @before, @after)); 

	-- Return the result of the function
	RETURN @timeDiff

END
GO

