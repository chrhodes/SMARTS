
CREATE PROCEDURE [dbo].[GetLog_Shape](@Table as int,@ID as int) AS


DECLARE @varDummy  varchar(1000)

select  *, @varDummy as "FunctionName", @varDummy as "FunctionValue"	
	into #temptable2
from sdlog 
where sdtable_id = @Table and sd_id = @ID
order by sdlog_datetime

UPDATE #temptable2 SET FunctionName = 
	CASE
		WHEN (SDLogFunction_ID <> 9 AND SDLog_Note IS NULL)  THEN (SELECT SDLogFunction_Name FROM SDLogFunction WHERE SDLogFunction_ID =#temptable2.SDLogFunction_ID)
		WHEN (SDLogFunction_ID <> 9 AND SDLog_Note IS NOT NULL)  THEN (SELECT SDLogFunction_Name FROM SDLogFunction WHERE SDLogFunction_ID =#temptable2.SDLogFunction_ID)
		WHEN (SDLogFunction_ID =  9 AND SDLog_Note IS NULL)  THEN (SELECT SDLogFunction_Name FROM SDLogFunction WHERE SDLogFunction_ID = #temptable2.SDLogFunction_ID)
		WHEN (SDLogFunction_ID =  9 AND SDLog_Note IS NOT NULL)  THEN (SELECT SDLogFunction_Name FROM SDLogFunction WHERE SDLogFunction_ID =5)
	END

UPDATE #temptable2 SET FunctionValue = 
	CASE
		WHEN (SDLog_Note IS NULL)  THEN #temptable2.SDLog_Value
		WHEN (FunctionName =  'LOGFUNCTION_SET_LIFECYCLE')  THEN (SELECT LifeCycle_Name FROM LifeCycle WHERE LifeCycle_ID =CAST(#temptable2.SDLog_Note as INT))
		WHEN (FunctionName =  'LOGFUNCTION_SET_SHAPETYPEATTRIBUTE')  THEN (SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID =CAST(#temptable2.SDLog_Note as INT))
	END 

select * from #temptable2

drop table #temptable2
