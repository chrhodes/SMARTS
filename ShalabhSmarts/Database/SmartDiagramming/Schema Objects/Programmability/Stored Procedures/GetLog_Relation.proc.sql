
CREATE PROCEDURE [dbo].[GetLog_Relation](@Table as int, @ID as int) AS

DECLARE @dummyint INT	
DECLARE @dummyvar varchar(500)

DECLARE @intFunction INT

DECLARE @intTable_Relation INT 
DECLARE @intTable_Shape INT 
DECLARE @intTable_ShapeType INT 
DECLARE @intTable_Abstraction  INT

DECLARE @strTable_Shape varchar(3) 
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
	and sdlog_value = CAST(@Table as varchar(5)) 
	and sdtable_id = @intTable_Relation


-- CREATE ANOTHER TEMPTABLE WITH EXTRA COLUMNS
select *, 
	@dummyint as "ItemFunction", @dummyint as "ItemFunction2", @dummyvar as "FunctionName", 
	@dummyint as "ItemTableID",  @dummyint as "ItemID", @dummyvar as "ItemName", @dummyint as "ItemType", @dummyint as "ItemAbstraction" 
	into #temptable2
from sdlog 
where sdtable_id = @intTable_Relation
	and sd_id in (select distinct sd_id from #temptable1) 
order by sd_id, sdlog_datetime


UPDATE #temptable2 SET ItemFunction =
	CASE
		WHEN #temptable2.SDLog_Note IS NULL THEN NULL
		ELSE @intFunction
	END  

UPDATE #temptable2 SET FunctionName = (SELECT SDLogFunction_Name FROM SDLogFunction WHERE SDLogFunction_ID = #temptable2.SDLogFunction_ID)


UPDATE #temptable2 SET ItemFunction2 =
	CASE
		WHEN SDLog_Value = @strTable_Shape AND SDLog_Note IS NOT NULL THEN (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_SHAPE')
	END

UPDATE #temptable2 SET ItemTableID =
	CASE
		WHEN #temptable2.ItemFunction IS NULL THEN NULL
		ELSE  CAST(#temptable2.SDLog_Value as int)
	END


UPDATE #temptable2 SET ItemID =
	CASE
		WHEN #temptable2.ItemFunction IS NULL THEN NULL
		ELSE  CAST(#temptable2.SDLog_Note as int)
	END

--UPDATE #temptable2 SET ItemName = (SELECT Shape_Name FROM Shape WHERE Shape_ID = CAST (#temptable2.SDLog_Note as int))
UPDATE #temptable2 SET ItemName = 
	CASE
		WHEN #temptable2.ItemFunction IS NULL THEN SDLog_Value
		ELSE (SELECT Shape_Name FROM Shape WHERE Shape_ID = #temptable2.ItemID)
	END

--IF TEMP NAME IS STILL NULL, CHECK IN LOG TO GET OLD (DELETED) NAME
UPDATE #temptable2 SET ItemName = 
	CASE
		WHEN #temptable2.ItemName IS NULL THEN (SELECT SDLog_Value FROM SDLog WHERE SD_ID = #temptable2.ItemID AND SDLogFunction_ID = #temptable2.ItemFunction2 AND SDTable_ID = #temptable2.ItemTableID AND SDLog_Note IS NULL)	
   		ELSE  #temptable2.ItemName
	END

update #temptable2 set ItemType = (SELECT SDLog_Note FROM SDLog WHERE SD_ID= #temptable2.ItemID AND SDLogFunction_ID =  (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_SHAPE') AND SDTable_ID = #temptable2.ItemTableID AND SDLog_Value = @strTable_ShapeType)	


update #temptable2 set ItemAbstraction =
	CASE
		WHEN #temptable2.ItemTableID = @intTable_Abstraction THEN CAST(#temptable2.SDLog_Note as int)
		WHEN #temptable2.ItemTableID = @intTable_Shape THEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID= #temptable2.ItemType)	
		WHEN #temptable2.ItemTableID IS NULL THEN NULL
	END 


-- CREATE ANOTHER TEMPTABLE WITH EXTRA COLUMNS
select * from #temptable2 order by sd_id, sdlog_datetime

drop table #temptable1
drop table #temptable2
