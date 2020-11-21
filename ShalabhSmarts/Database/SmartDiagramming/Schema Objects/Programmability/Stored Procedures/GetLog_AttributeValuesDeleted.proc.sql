
CREATE PROCEDURE [dbo].[GetLog_AttributeValuesDeleted](@Table as int, @ID as int) AS


DECLARE @intFunctionSet int
DECLARE @intFunctionDel int
DECLARE @strTable varchar(6)
DECLARE @strID varchar(6)

SET @intFunctionSet = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_ATTRIBUTEVALUE')
SET @intFunctionDel = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_DELETE_ATTRIBUTEVALUE')
SET @strTable = CAST(@Table as varchar(6))
SET @strID = CAST(@ID as varchar(6))

select 	sdlog_id,
	sdtable_id,
	sd_id,
	sdlogfunction_id,
	sdlog_value,
	sdlog_note,
	sdlog_contact,
	sdlog_datetime,
	sta.shapetypeattribute_id,
	a.attribute_id,
	a.attribute_name
into #temptable
from sdlog nolock
	left join shapetypeattribute as sta on sta.shapetypeattribute_id = CAST(sdlog_note as int) 
	left join attribute as a on a.attribute_id = sta.attribute_id 
where sdtable_id in
(select sdtable_id from sdlog 
	where sdtable_id in (select sdtable_id from sdlog where sdlogfunction_id = @intFunctionSet and sdlog_value = @strTable and sdlog_note = @strID)
		and sd_id in (select sd_id from sdlog where sdlogfunction_id = @intFunctionSet and sdlog_value = @strTable and sdlog_note = @strID)
		and sdlogfunction_id = @intFunctionDel)
and 
sd_id in
(select sd_id from sdlog 
	where sdtable_id in (select sdtable_id from sdlog where sdlogfunction_id = @intFunctionSet and sdlog_value = @strTable and sdlog_note = @strID)
		and sd_id in (select sd_id from sdlog where sdlogfunction_id = @intFunctionSet and sdlog_value = @strTable and sdlog_note = @strID)
		and sdlogfunction_id = @intFunctionDel)


DECLARE @intFunctionSetSTA int
DECLARE @strFunctionSetSTA varchar(6)
DECLARE @strTableSTA varchar(6)
DECLARE @intFunctionSetA int
DECLARE @strTableA varchar(6)

/* grab the STA from SDLOG in case it has already been deleted from the STA table */
SET @intFunctionSetSTA = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_SHAPETYPEATTRIBUTE') 
SET @strFunctionSetSTA = CAST(@intFunctionSetSTA as varchar(6))
SET @strTableSTA = CAST((SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'ShapeTypeAttribute') as varchar(6))
SET @intFunctionSetA = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_ATTRIBUTE') 
SET @strTableA = CAST((SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Attribute') as varchar(6))

UPDATE #temptable set shapetypeattribute_id = 
	CASE
		WHEN (sdlog_value = @strFunctionSetSTA) THEN cast(sdlog_note as int) 
	END

update #temptable set attribute_id = 
	CASE
		WHEN attribute_id IS NULL THEN (SELECT sdlog_note FROM sdlog where sdtable_id = @strTableSTA and sd_id = #temptable.shapetypeattribute_id and sdlogfunction_id = @intFunctionSetSTA and sdlog_value = @strTableA )
		WHEN attribute_id is NOT NULL then attribute_id
	END 

/* grab the Attribute from SDLOG in case it has already been deleted from the Attribute table */
update #temptable set attribute_name = 
	CASE
		WHEN attribute_name is NULL then (SELECT sdlog_value FROM sdlog where sdtable_id = @strTableA and sd_id = #temptable.attribute_id and sdlogfunction_id = @intFunctionSetA)
		WHEN attribute_name is NOT NULL then attribute_name
	END 

select * from #temptable order by sdlog_id

drop table #temptable

/*

select * from sdlog
where sdtable_id in
(select sdtable_id from sdlog 
	where sdtable_id in (select sdtable_id from sdlog where sdlogfunction_id = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_ATTRIBUTEVALUE') 
		and (sdlog_value = CAST(@Table as varchar(6))) and (sdlog_note = CAST(@ID as varchar(6)))
		and sd_id in (select sd_id from sdlog where sdlogfunction_id = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_ATTRIBUTEVALUE') 
		and (sdlog_value = CAST(@Table as varchar(6))) and (sdlog_note = CAST(@ID as varchar(6)))
		and sdlogfunction_id = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_DELETE_ATTRIBUTEVALUE') )
and 
sd_id in
(select sd_id from sdlog 
	where sdtable_id in (select sdtable_id from sdlog where sdlogfunction_id = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_ATTRIBUTEVALUE') 
		and (sdlog_value = CAST(@Table as varchar(6))) and (sdlog_note = CAST(@ID as varchar(6)))
		and sd_id in (select sd_id from sdlog where sdlogfunction_id = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_ATTRIBUTEVALUE') 
		and (sdlog_value = CAST(@Table as varchar(6))) and (sdlog_note = CAST(@ID as varchar(6)))
		and sdlogfunction_id = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_DELETE_ATTRIBUTEVALUE') )

order by sdlog_id

*/
