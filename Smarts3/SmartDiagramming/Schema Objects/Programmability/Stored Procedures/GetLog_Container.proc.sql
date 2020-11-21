
CREATE PROCEDURE [dbo].[GetLog_Container](@ContainType as int, @Table as int, @ID as int) AS

DECLARE @dummyint INT	
DECLARE @dummyvar varchar(500)

DECLARE @intFunction_SetShape INT
SET @intFunction_SetShape= (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_SHAPE')
DECLARE @intFunction_SetArtifact INT
SET @intFunction_SetArtifact= (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_ARTIFACT')
DECLARE @intFunction_SetContainer INT
SET @intFunction_SetContainer= (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_CONTAINER')

DECLARE @intTable_Shape INT 
SET @intTable_Shape= (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Shape')
DECLARE @intTable_ShapeType INT 
SET @intTable_ShapeType= (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'ShapeType')
DECLARE @intTable_Container INT
SET @intTable_Container= (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Container')
DECLARE @intTable_Abstraction  INT
SET @intTable_Abstraction= (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Abstraction')
DECLARE @intTable_Artifact INT
SET @intTable_Artifact= (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Artifact')

DECLARE @strTable_Shape varchar(3)
SET @strTable_Shape= CAST(@intTable_Shape as varchar(3))
DECLARE @strTable_ShapeType varchar(3)
SET @strTable_ShapeType= CAST(@intTable_ShapeType as varchar(3))
DECLARE @strTable_Abstraction varchar(3)
SET @strTable_Abstraction= CAST(@intTable_Abstraction as varchar(3))
DECLARE @strTable_Artifact varchar(3)
SET @strTable_Artifact= CAST(@intTable_Artifact as varchar(3))

-- GET ALL CONTAINER RELATIONSHIPS  OF SELECTED TABLE AND ID

select * into #temptable1
from sdlog 
where sdlog_note = CAST(@ID as varchar(10)) 
	and sdlog_value = CAST(@Table as varchar(5)) 
	and sdtable_id = @intTable_Container


-- IF CONTAINERTYPE IS SPECIFIED, DELETE ALL OTHER CONTAINERTYPES
IF @ContainType IS NOT NULL
BEGIN
	DELETE FROM #temptable1 WHERE sdlogfunction_id <> @ContainType
END

-- CREATE ANOTHER TEMPTABLE WITH EXTRA COLUMNS
select *, 
	@dummyint as "ItemFunction", @dummyint as "ItemFunction2", @dummyvar as "FunctionName",
	@dummyint as "ItemTableID",  @dummyint as "ItemID", @dummyvar as "ItemName", @dummyint as "ItemType", @dummyint as "ItemAbstraction" 
	into #temptable2
from sdlog 
where sdtable_id = @intTable_Container
	and sd_id in (select distinct sd_id from #temptable1) 
order by sd_id, sdlog_datetime 


UPDATE #temptable2 SET ItemFunction2 =
	CASE
		WHEN SDLog_Value = @strTable_Artifact THEN @intFunction_SetArtifact
		WHEN SDLog_Value = @strTable_Shape THEN @intFunction_SetShape
	END


UPDATE #temptable2 SET ItemFunction = 
	CASE
		WHEN SDLog_Value = @strTable_Abstraction and SDLog_Note = '7' THEN @intFunction_SetArtifact
		ELSE SDLogFunction_ID
	END

UPDATE #temptable2 SET FunctionName = (SELECT SDLogFunction_Name FROM SDLogFunction WHERE SDLogFunction_ID = #temptable2.ItemFunction)


UPDATE #temptable2 SET ItemTableID =
	CASE
		WHEN ItemFunction2 IS NULL THEN NULL
		ELSE  CAST(#temptable2.SDLog_Value as int)
	END


UPDATE #temptable2 SET ItemID =
	CASE
		WHEN ItemFunction2 IS NULL THEN NULL
		ELSE  CAST(#temptable2.SDLog_Note as int)
	END



UPDATE #temptable2 SET ItemName = 
	CASE
		WHEN SDLog_Value = @strTable_Shape THEN (SELECT Shape_Name FROM Shape WHERE Shape_ID = CAST (#temptable2.SDLog_Note as int))
		WHEN SDLog_Value = @strTable_Artifact THEN (SELECT Artifact_Name FROM Artifact WHERE Artifact_ID = CAST (#temptable2.SDLog_Note as int))
	END

--IF TEMP NAME IS STILL NULL, CHECK IN LOG TO GET OLD (DELETED) NAME
UPDATE #temptable2 SET ItemName = 
	CASE
		WHEN #temptable2.ItemName IS NULL THEN (SELECT SDLog_Value FROM SDLog WHERE SD_ID = #temptable2.ItemID AND SDLogFunction_ID = #temptable2.ItemFunction2 AND SDTable_ID = #temptable2.ItemTableID AND SDLog_Note IS NULL)	
   		ELSE  #temptable2.ItemName
	END

update #temptable2 set ItemType = (SELECT SDLog_Note FROM SDLog WHERE SD_ID= #temptable2.ItemID  AND SDLogFunction_ID =  #temptable2.ItemFunction AND SDTable_ID = #temptable2.ItemTableID AND SDLog_Value = @strTable_ShapeType)	


update #temptable2 set ItemAbstraction =
	CASE
		WHEN SDLog_Value = @strTable_Abstraction THEN CAST(#temptable2.SDLog_Note as int)
		WHEN SDLog_Value = @strTable_Shape THEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID= ItemType)	
		WHEN SDLog_Value = @strTable_Artifact THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'ARTIFACT')
	END 




select * from #temptable2

drop table #temptable1
drop table #temptable2
