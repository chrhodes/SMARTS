
CREATE PROCEDURE  [dbo].[GetReport_EnterpriseAttributeNew] (@A1 as int, @A2 as int, @A3 as int, @A4 as int, @A5 as int, @A6 as int)  AS

DECLARE @intDummy int
DECLARE @varDummy varchar(100)
DECLARE @AttributeName varchar(100)
DECLARE @AttributeID int
DECLARE @AbsID int
DECLARE @SDColumn varchar(100)
DECLARE @AbsName varchar(100)
DECLARE @SQL varchar(1000)


IF @A1 IS NOT NULL 
	BEGIN

		SET @AbsID = (select abstraction_id from abstraction where abstraction_id = (select abstraction_id from shapetype where shapetype_id = (select shapetype_id from shapetypeattribute where shapetypeattribute_id = @A1)))
		SET @AbsName = (select abstraction_name from abstraction where abstraction_id = @AbsID)
		SET @AttributeID =  (select shapetypeattribute.attribute_id from shapetypeattribute left join attribute on shapetypeattribute.attribute_id = attribute.attribute_id where shapetypeattribute_id = @A1)
		SET @AttributeName = @AbsName + ' ' + (select attribute_name from attribute where attribute_id = @AttributeID)
	END


SELECT 
	*,
	@varDummy as "Attribute1",
	@varDummy as "Attribute2", 
	@varDummy as "Attribute3", 
	@varDummy as "Attribute4", 
	@varDummy as "Attribute5", 
	@varDummy as "Attribute6"
INTO #tempReport
FROM vwEnterprise



IF @A1 IS NOT NULL 
	BEGIN

		SET @AbsID = (select abstraction_id from abstraction where abstraction_id = (select abstraction_id from shapetype where shapetype_id = (select shapetype_id from shapetypeattribute where shapetypeattribute_id = @A1)))
		SET @AbsName = (select abstraction_name from abstraction where abstraction_id = @AbsID)
		SET @AttributeID =  (select shapetypeattribute.attribute_id from shapetypeattribute left join attribute on shapetypeattribute.attribute_id = attribute.attribute_id where shapetypeattribute_id = @A1)
		SET @AttributeName = @AbsName + ' ' + (select attribute_name from attribute where attribute_id = @AttributeID)

		IF @@ERROR = 0
		BEGIN
			SET @SDColumn = 
				CASE
					WHEN @AbsID = 1 THEN 'systemid'
					WHEN @AbsID = 2 THEN 'objectid'
					WHEN @AbsID = 3 THEN 'infrastructureid'
					WHEN @AbsID = 10 THEN 'businessprocessid'
					WHEN @AbsID = 11 THEN 'stepid'
				END
			
			set @SQL = 'UPDATE #tempReport SET Attribute1 = (select attributevalue_value  from attributevalue where sdtable_id = 4 and sd_id = '
				+ @SDColumn + ' and shapetypeattribute_id in 
				(select shapetypeattribute_id from shapetypeattribute where attribute_id =  ' + CAST(@AttributeID as char(5)) 
				+ ' and shapetype_id in (select shapetype_id from shapetype where abstraction_id = ' +  CAST(@AbsID as char(5))  + ')))'

			exec (@sql)
		END

	END


--set @sql = 'SELECT *, Attribute1 AS [' + @AttributeName + '] FROM #tempreport'
--exec (@sql)

select * from #tempReport

DROP TABLE #tempReport
