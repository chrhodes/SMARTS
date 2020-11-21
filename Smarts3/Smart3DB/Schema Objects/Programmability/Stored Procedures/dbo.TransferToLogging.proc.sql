
CREATE PROCEDURE [dbo].[TransferToLogging] AS


/*
--- change sdlogfunction_id = 11 for artifacts
update sdlog set sdlogfunction_id = 11 where sdlog_id in (select sdlog_id from sdlog where sdtable_id = 12 and sd_id in (select sd_id from sdlog where sdtable_id = 12 and sdlog_value = '1' and sdlog_note = '7' ))
*/

--- sdlogfunction_id = 1 : funnel into dbo.logging
insert into logging (SDLogFunction_ID, SDTable_ID, SD_ID, Abstraction_ID, Name1_Table_ID, Name1_ID, Name2_Table_ID, Name2_ID, Logging_Value, Logging_Contact, Logging_DateTime)
select SDLogFunction_ID, SDTable_ID, SD_ID, 7,SDTable_ID, SD_ID, NULL, NULL, SDLog_Value, SDLog_Contact, SDLog_DateTime
from sdlog
where sdlogfunction_id = 1


--- sdlogfunction_id = 2 : funnel into dbo.logging
insert into logging (SDLogFunction_ID, SDTable_ID, SD_ID, Abstraction_ID, Name1_Table_ID, Name1_ID, Name2_Table_ID, Name2_ID, Logging_Value, Logging_Contact, Logging_DateTime)
select SDLogFunction_ID, SDTable_ID, SD_ID, 7,SDTable_ID, SD_ID, NULL, NULL, SDLog_Value, SDLog_Contact, SDLog_DateTime
from sdlog
where sdlogfunction_id = 2


--- sdlogfunction_id = 3 : funnel into dbo.logging
