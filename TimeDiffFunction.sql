CREATE FUNCTION missms_timeDifference (
	@before datetime,
	@after datetime
)

RETURNS TEXT AS
	BEGIN
		DECLARE @timeDiff CHAR(9);
		SET @timeDiff = CONVERT(TEXT, DATEDIFF(minute, @before, @after)); 
		SET @timeDiff += ':' + CONVERT(TEXT, DATEDIFF(second, @before, @after)); 
		SET @timeDiff += ':' + CONVERT(TEXT, DATEDIFF(millisecond, @before, @after)); 
		RETURN @timeDiff;
	END;