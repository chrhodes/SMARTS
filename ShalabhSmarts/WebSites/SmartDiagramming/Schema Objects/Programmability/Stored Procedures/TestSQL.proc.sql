CREATE PROCEDURE [dbo].[TestSQL] AS

select  shape_id, shape_name, attribute_name, attributevalue_value into #temptable from shapetypeattribute 
	left join attribute on shapetypeattribute.attribute_id = attribute.attribute_id
	left join shapetype on shapetype.shapetype_id  = shapetypeattribute.shapetype_id
	left join shape on shape.shapetype_id = shapetype.shapetype_id
	left join attributevalue on attributevalue.sdtable_id = 4 and attributevalue.sd_id = shape.shape_id and shapetypeattribute.shapetypeattribute_id = attributevalue.shapetypeattribute_id
where  shapetypeattribute.shapetype_id = 1

SET NOCOUNT ON
SET CONCAT_NULL_YIELDS_NULL OFF
DECLARE @SELECT_FROM_TABLE nvarchar(1000)

CREATE TABLE #columns (col1 int identity(1,1),col2 varchar(100) default 'No data')

SET @SELECT_FROM_TABLE='INSERT INTO #Columns(col2) SELECT DISTINCT [' + 'Attribute_Name' + '] FROM [' + '#temptable' + ']'

EXEC sp_executesql @SELECT_FROM_TABLE

DECLARE @LoopCount int
DECLARE @RecordCount int
DECLARE @ColumnsToSelect varchar(2000)
DECLARE @SumStatements varchar(4000)
DECLARE @QUERY nvarchar(4000)
DECLARE @Column_Value varchar(100)

SET @ColumnsToSelect=''
SET @RecordCount=(Select Count(*) FROM #Columns)
SET @LoopCount=0

WHILE @LoopCount<=@RecordCount
BEGIN
SET @LoopCount= @LoopCount + 1
SET @Column_Value=(Select col2 from #Columns where col1=@LoopCount)
if DataLength(@Column_Value)>0
BEGIN
SET @ColumnsToSelect= @ColumnsToSelect + ' P1.[' + @Column_Value + '] + '
SET @SumStatements=@SumStatements + ' MAX(CASE P.[' + 'Attribute_Name' + '] WHEN ''' + @Column_Value + ''' THEN ' + 'AttributeValue_Value' + ' ELSE NULL END) AS [' + @Column_Value + '], '

END
END

SET @ColumnsToSelect='P1.* '

SET @SumStatements=LEFT(@SumStatements,len(@SumStatements)-1) + ' FROM [' + '#temptable' + '] AS P GROUP BY P.[' +  'Shape_Name' + '] WITH CUBE) AS P1'

SET @QUERY='SELECT ' + @columnsToSelect + ' FROM (SELECT ISNULL([' + 'Shape_Name' + '],''TOTAL'') As [' +  'Shape_Name' +'] '

IF CHARINDEX('MAX',@SumStatements)>0
SET @QUERY=@QUERY + ',' + @SumStatements
ELSE
SET @QUERY=@QUERY + @SumStatements


exEC sp_executesql @QUERY

drop table #temptable

/*
-- SET ATTRIBUTE VALUES ENTRIES WITH DESCRIPTION IF ANY  INTO LOG
select distinct * into #temptable from AttributeValue nolock
	where AttributeValue_ID < 657
order by AttributeValue_ID 

DECLARE @Counter INT
DECLARE @Value varchar(1000)
DECLARE @Table INT
DECLARE @ID INT
DECLARE @STA_ID INT
DECLARE @Contact varchar(50)


SET @Counter = 0
SET @Contact = 'PACIFICMUTUAL\PLIN'

WHILE @Counter <  657
BEGIN
	IF (SELECT COUNT(*) FROM #temptable WHERE AttributeValue_ID = @Counter) > 0 
	BEGIN
		SET @Value = (SELECT AttributeValue_Value from #temptable WHERE AttributeValue_ID = @Counter)
		SET @Table = (SELECT SDTable_ID from #temptable WHERE AttributeValue_ID = @Counter)
		SET @ID = (SELECT SD_ID from #temptable WHERE AttributeValue_ID = @Counter)
		SET @STA_ID = (SELECT ShapeTypeAttribute_ID from #temptable WHERE AttributeValue_ID = @Counter)
		-- LOG  VALUE
		EXEC SetLog 6, @Counter, 17, @Value, NULL, @Contact
		-- LOG ITEM THAT HAS THIS VALUE
		EXEC SetLog 6, @Counter, 17, @Table, @ID, @Contact
		-- LOG SHAPETYPEATTRIBUTE OF THIS VALUE
		EXEC SetLog 6, @Counter, 17, 5, @STA_ID, @Contact
	END
	SET @Counter = @Counter + 1
END 


drop table #temptable
*/

/*
-- SET RELATION  ENTRIES WITH DESCRIPTION IF ANY  INTO LOG
select distinct * into #temptable from relation  nolock
	where relation_id < 1021
order by relation_id 

DECLARE @Counter INT
SET @Counter = 0

DECLARE @Value varchar(1000)
DECLARE @Table INT
DECLARE @ID INT

WHILE @Counter <  1021
BEGIN
	IF (SELECT COUNT(*) FROM #temptable WHERE Relation_ID = @Counter) > 0 
	BEGIN
		SET @Value = (SELECT Relation_Name from #temptable WHERE Relation_ID = @Counter)
		EXEC SetLog 7, @Counter, 13, @Value, NULL, 'PACIFICMUTUAL\PLIN'
		SET @ID = (SELECT Abstraction_ID  from #temptable WHERE Relation_ID = @Counter)
		EXEC SetLog 7, @Counter, 13, 1,  @ID, 'PACIFICMUTUAL\PLIN'
		SET @Table = (SELECT SDTable_ID_Begin from #temptable WHERE Relation_ID = @Counter)
		SET @ID = (SELECT SD_ID_Begin from #temptable WHERE Relation_ID = @Counter)
		EXEC SetLog 7, @Counter, 13, @Table,  @ID, 'PACIFICMUTUAL\PLIN'
		SET @Table = (SELECT SDTable_ID_End from #temptable WHERE Relation_ID = @Counter)
		SET @ID = (SELECT SD_ID_End from #temptable WHERE Relation_ID = @Counter)
		EXEC SetLog 7, @Counter, 13, @Table,  @ID, 'PACIFICMUTUAL\PLIN'
		SET @Value = (SELECT Relation_Desc from #temptable WHERE Relation_ID = @Counter)
		IF @Value <> ''  and @Value is not null
		BEGIN
			EXEC SetLog 7, @Counter, 15, @Value, NULL, 'PACIFICMUTUAL\PLIN'
		END

	END
	SET @Counter = @Counter + 1
END 	


drop table #temptable

*/

/*
DECLARE @dummyint INT	
DECLARE @dummyvar varchar(500)

select *, 
	@dummyvar as "ItemName", @dummyint as "ItemType", @dummyint as "ItemAbstraction" 
	into #temptable
from sdlog 
where sdtable_id = 12 
	and sd_id in (select sd_id from sdlog where sdlog_note = '361' and sdlog_value = '4' and sdtable_id = 12) 
order by sd_id, sdlog_datetime


Update #temptable set ItemName =
	CASE
--		WHEN SDLog_Value = '1' THEN CAST(SDLog_Note as int)
		WHEN SDLog_Value = '4' THEN (SELECT SDLog_Value FROM SDLog WHERE SD_ID= CAST(#temptable.SDLog_Note as int) AND SDLogFunction_ID = 9 AND SDTable_ID = 4 AND SDLog_Note IS NULL)	
--		WHEN SDLog_Value = '11' THEN CAST(#temptable.SDLog_Note as int)
	END 

update #temptable set ItemType =
	CASE
--		WHEN SDLog_Value = '1' THEN (SELECT Abstraction_Name FROM Abstraction WHERE Abstraction_ID = #temptable.TempID)
		WHEN SDLog_Value = '4' THEN (SELECT SDLog_Note FROM SDLog WHERE SD_ID= CAST(#temptable.SDLog_Note as int) AND SDLogFunction_ID = 9 AND SDTable_ID = 4 AND SDLog_Value = '3')	
--		WHEN SDLog_Value = '11' THEN (SELECT Artifact_Name FROM Artifact WHERE Artifact_ID = #temptable.TempID)
	END 

update #temptable set ItemAbstraction =
	CASE
--		WHEN SDLog_Value = '1' THEN (SELECT Abstraction_Name FROM Abstraction WHERE Abstraction_ID = #temptable.TempID)
		WHEN SDLog_Value = '4' THEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID= ItemType)	
--		WHEN SDLog_Value = '11' THEN (SELECT Artifact_Name FROM Artifact WHERE Artifact_ID = #temptable.TempID)
	END 

--IF TEMP NAME IS STILL NULL, CHECK IN LOG TO GET OLD (DELETED) NAME


select * from #temptable

drop table #temptable

*/

/*

--DELETE_CONTAINER LOG ENTRIES THAT HAD NO CORRESPONDING SET_CONTAINER ENTRIES

declare @dummyint  INT

select *, @dummyint as "SDLogID"
 	into #temptable 
	from sdlog 
	where sdtable_id = 12 and sdlogfunction_id = 12
	order by sd_id, sdlog_id

update #temptable set SDLogID =
	CASE
		WHEN sdlogfunction_id = 12 THEN (Select Sdlog_id from sdlog where sdlog.sdlogfunction_id = 11 and sdlog.sdlog_value = '1' and sdlog.sd_id = #temptable.sd_id)
	END 
	
delete from sdlog where sdlog_id in (select sdlog_id from #temptable where sdlogid is null)

drop table #temptable
*/

/*
-- SET_CONTAINER ENTRIES INTO LOG

DECLARE @Table INT
DECLARE @New INT
DECLARE @Function INT
DECLARE @AbstractionTable INT
DECLARE @Abstraction_ID INT
DECLARE @Table_Container INT
DECLARE @Table_Contained INT
DECLARE @ID_Container INT
DECLARE @ID_Contained INT
DECLARE @Contact varchar(50)
DECLARE @Counter INT

SET @Counter = 16

WHILE @Counter < 655

BEGIN

	SET @Table = 12
	SET @New = @Counter
	
	IF (SELECT COUNT(*) FROM Container WHERE Container_ID = @New) > 0 
		BEGIN
			SET @Abstraction_ID = (SELECT Abstraction_ID FROM Container WHERE Container_ID = @New)
			SET @AbstractionTable = 1
			SET @Table_Container = (SELECT SDTable_ID_Container FROM Container WHERE Container_ID = @New)
			SET @Table_Contained = (SELECT SDTable_ID_Contained FROM Container WHERE Container_ID = @New)
			SET @ID_Container = (SELECT SD_ID_Container FROM Container WHERE Container_ID = @New)
			SET @ID_Contained = (SELECT SD_ID_Contained FROM Container WHERE Container_ID = @New)
			SET @Contact = 'PACIFICMUTUAL\PLIN'
			SET @Function = 
				CASE
					WHEN @Abstraction_ID = 1 THEN 11
					WHEN @Abstraction_ID = 2 THEN 11
					WHEN @Abstraction_ID = 3 THEN 11
					WHEN @Abstraction_ID = 4 THEN 9
					WHEN @Abstraction_ID = 5 THEN 9
					WHEN @Abstraction_ID = 6 THEN 9
					WHEN @Abstraction_ID = 7 THEN 11
					WHEN @Abstraction_ID = 8 THEN 11
					WHEN @Abstraction_ID = 9 THEN 9
					WHEN @Abstraction_ID = 10 THEN 11
					WHEN @Abstraction_ID = 11 THEN 11
					WHEN @Abstraction_ID = 12 THEN 9
					WHEN @Abstraction_ID = 14 THEN 9
					WHEN @Abstraction_ID = 15 THEN 11
				END
			
			EXEC SetLog @Table, @New, @Function, @AbstractionTable, @Abstraction_ID, @Contact
			EXEC SetLog @Table, @New, @Function, @Table_Container, @ID_Container, @Contact
			EXEC SetLog @Table, @New, @Function, @Table_Contained, @ID_Contained, @Contact
		
		END

	SET @Counter = @Counter + 1
END

*/


/*
-- SET_CONTAINER ENTRIES INTO LOG
select distinct sd_id into #temptable from sdlog nolock
	left join container on sd_id = container_id
where sdtable_id = 12 and container_id is null and sdlog_value = '1'
order by sd_id 

DECLARE @Counter INT
SET @Counter = 0

WHILE @Counter < 1982
BEGIN
	IF (SELECT COUNT(*) FROM #temptable WHERE sd_id = @Counter) > 0 
	BEGIN
		EXEC SetLog 12, @Counter, 12, NULL, NULL, 'PACIFICMUTUAL\PLIN'
	END
	SET @Counter = @Counter + 1
END 	

drop table #temptable
*/

/* 

-- LOGS SHAPE NAME, SHAPETYPE, DESC, LIFECYCLE ENTRIES INTO LOG TABLE 
select * into #temptable
from shape 
where shape_id < 758

DECLARE @Counter INT
DECLARE @Value varchar(500)
DECLARE @ShapeType INT
DECLARE @Desc varchar(500)
DECLARE @Lifecycle INT
DECLARE @Contact varchar(50)

SET @Counter = 0
SET @Contact = 'PACIFICMUTUAL\PLIN'

WHILE @Counter < 758
BEGIN
	IF (SELECT COUNT(*) FROM #temptable WHERE shape_id = @Counter) > 0 
	BEGIN
		SET @Value = (SELECT Shape_Name FROM Shape WHERE Shape_ID = @Counter)
		IF (SELECT COUNT(*) from sdlog WHERE sdtable_id = 4 and sd_id = @Counter and sdlogfunction_id = 9 and sdlog_value = @Value and sdlog_note is null) = 0
		BEGIN
			EXEC SetLog 4, @Counter, 9, @Value, NULL, @Contact
		END
		SET @ShapeType = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @Counter)
		IF (SELECT COUNT(*) from sdlog WHERE sdtable_id = 4 and sd_id = @Counter and sdlogfunction_id = 9 and sdlog_value = '3' and sdlog_note = @ShapeType ) = 0 
		BEGIN
			EXEC SetLog 4, @Counter, 9, 3, @ShapeType, @Contact
		END

		SET @Lifecycle = (SELECT LifeCycle_ID FROM Shape WHERE Shape_ID = @Counter)
		IF (SELECT COUNT(*) from sdlog WHERE sdtable_id = 4 and sd_id = @Counter and sdlogfunction_id = 18 and sdlog_value = '14' and sdlog_note = @Lifecycle ) = 0 
		BEGIN
			EXEC SetLog 4, @Counter, 18, 14, @Lifecycle, @Contact
		END

		SET @Desc = (SELECT Shape_Desc FROM Shape WHERE Shape_ID = @Counter)
		IF (@Desc IS NOT NULL) AND  ((SELECT COUNT(*) from sdlog WHERE sdtable_id = 4 and sd_id = @Counter and sdlogfunction_id = 15 and sdlog_value = @Desc and sdlog_note is null) = 0 )
		BEGIN
			EXEC SetLog 4, @Counter, 15, @Desc, NULL, @Contact
		END

	END
	SET @Counter = @Counter + 1
END

drop table #temptable

*/



/*
-- LOGS ARTIFACT ENTRIES INTO LOG TABLE 
select * into #temptable
from artifact 
where artifact_id < 256

DECLARE @Counter INT
DECLARE @Value varchar(500)
DECLARE @Contact varchar(50)

SET @Counter = 0
SET @Contact = 'PACIFICMUTUAL\PLIN'

WHILE @Counter < 256
BEGIN
	IF (SELECT COUNT(*) FROM #temptable WHERE artifact_id = @Counter) > 0 
	BEGIN
		SET @Value = (SELECT Artifact_Name FROM Artifact WHERE Artifact_ID = @Counter)
		EXEC SetLog 11, @Counter, 1, @Value, NULL, @Contact

		IF (SELECT Artifact_Desc from Artifact where Artifact_ID = @Counter) IS NOT NULL
		BEGIN
			SET @Value = (SELECT Artifact_Desc FROM Artifact WHERE Artifact_ID = @Counter)
			EXEC SetLog 11, @Counter, 15, @Value, NULL, @Contact
		END

		IF (SELECT Artifact_Loc from Artifact where Artifact_ID = @Counter) IS NOT NULL
		BEGIN
			SET @Value = (SELECT Artifact_Loc FROM Artifact WHERE Artifact_ID = @Counter)
			EXEC SetLog 11, @Counter, 19, @Value, NULL, @Contact
		END

		IF (SELECT Artifact_Contact from Artifact where Artifact_ID = @Counter) IS NOT NULL
		BEGIN
			SET @Value = (SELECT Artifact_Contact FROM Artifact WHERE Artifact_ID = @Counter)
			EXEC SetLog 11, @Counter, 20, @Value, NULL, @Contact
		END

		IF (SELECT Artifact_Note from Artifact where Artifact_ID = @Counter) IS NOT NULL
		BEGIN
			SET @Value = (SELECT Artifact_Note FROM Artifact WHERE Artifact_ID = @Counter)
			EXEC SetLog 11, @Counter, 21, @Value, NULL, @Contact
		END

	END
	SET @Counter = @Counter + 1
END

drop table #temptable
*/

/*
-- LOGS ARTIFACT ENTRIES INTO LOG TABLE FROM DELETED ARTIFACTS LOG ENTRY

DECLARE @ID INT
DECLARE @Counter INT
DECLARE @Value varchar(500)
DECLARE @Contact varchar(50)


select * 
	into #temptable
from sdlog 
where sdlog_id in (select sdlog_id from sdlog where sdtable_id = 11 and sdlogfunction_id = 2 and (sd_id = 2)) order by sd_id

select IDENTITY(INT, 1, 1) as "TempID", sdtable_id, sd_id, sdlogfunction_id, sdlog_value, sdlog_note 
	into #temptable2
from #temptable


SET @Counter = 1
SET @Contact = 'PACIFICMUTUAL\PLIN'

WHILE @Counter <= (SELECT COUNT(*) FROM #temptable2)
BEGIN
	SET @ID = (SELECT sd_id from #temptable2 WHERE TempID = @Counter)
	SET @Value = (SELECT sdlog_value from #temptable2 WHERE TempID = @Counter)
	EXEC SetLog 11, @ID, 1, @Value, NULL, @Contact
	SET @Value = (SELECT sdlog_note from #temptable2 WHERE TempID = @Counter)
	EXEC SetLog 11, @ID, 19, @Value, NULL, @Contact
	SET @Counter = @Counter + 1
END


select * from #temptable2
	
drop table #temptable2
drop table #temptable
*/