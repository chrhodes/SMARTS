
CREATE PROCEDURE [dbo].[GetLog_AttributeValues](@Table as int, @ID as int) AS

DECLARE @dummyint INT	
DECLARE @dummyvar varchar(500)

DECLARE @intFunction INT

DECLARE @intTable_Relation INT 
DECLARE @intTable_Shape INT 
DECLARE @intTable_ShapeType INT 
DECLARE @intTable_Abstraction  INT

DECLARE @strTable_Shape INT 
DECLARE @strTable_ShapeType varchar(3)
DECLARE @strTable_Artifact varchar(3)
DECLARE @strTable_Abstraction varchar(3)

SET @intFunction= (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_RELATION')
SET @intTable_Relation= (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Relation')

SET @intTable_Shape= (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Shape')
SET @intTable_ShapeType= (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'ShapeType')
SET @intTable_Abstraction= (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Abstraction')

SET @strTable_Shape= CAST(@intTable_Shape as varchar(3))
SET @strTable_ShapeType= CAST(@intTable_ShapeType as varchar(3))
SET @strTable_Abstraction= CAST(@intTable_Abstraction as varchar(3))


-- GET ALL CONTAINER RELATIONSHIPS  OF SELECTED TABLE AND ID
select * into #temptable1
from sdlog 
where sdlog_note = CAST(@ID as varchar(10)) 
	and (sdlogfunction_id = 17 or sdlogfunction_id = 22)
	and sdtable_id = 6
	and sdlog_value = CAST(@Table as varchar(5)) 


-- CREATE ANOTHER TEMPTABLE WITH EXTRA COLUMNS
select *, 
	@dummyvar as "FunctionName", @dummyvar as "Attribute",  @dummyvar as "ItemName"
	into #temptable2
from sdlog 
where sdtable_id = 6
	and sd_id in (select distinct sd_id from #temptable1) 
order by sd_id, sdlog_datetime


UPDATE #temptable2 SET FunctionName = (SELECT SDLogFunction_Name FROM SDLogFunction WHERE SDLogFunction_ID = #temptable2.SDLogFunction_ID)

UPDATE #temptable2 SET ItemName = 
	CASE
		WHEN #temptable2.SDLog_Value = '4' AND #temptable2.SDLog_Note IS NOT NULL THEN (SELECT Shape_Name FROM Shape WHERE Shape_ID = CAST(#temptable2.SDLog_Note as int))
	END

--IF TEMP NAME IS STILL NULL, CHECK IN LOG TO GET OLD (DELETED) NAME

UPDATE #temptable2 SET ItemName = 
	CASE
		WHEN #temptable2.ItemName IS NULL AND #temptable2.SDLog_Value = '4' THEN (SELECT Top 1(SDLog_Value) FROM SDLog WHERE SDLogFunction_ID = 9 AND SDTable_ID = 4 AND SDLog_Note IS NULL AND SD_ID = CAST(#temptable2.SDLog_Note as int) ORDER BY SDLog_DateTime DESC )	
		ELSE #temptable2.ItemName
	END


UPDATE #temptable2 SET Attribute = 
	CASE
		WHEN #temptable2.SDLog_Value = '5' AND #temptable2.SDLog_Note IS NOT NULL THEN (SELECT TOP 1(SDLog_Value) FROM SDLog WHERE SDTable_ID = 5 AND SDLogFunction_ID =5 AND SDLog_Note IS NULL AND SD_ID = CAST(#temptable2.SDLog_Note as int) ORDER BY SDLog_DateTime DESC )	
	END


-- CREATE ANOTHER TEMPTABLE WITH EXTRA COLUMNS
select * from #temptable2

drop table #temptable1
drop table #temptable2
