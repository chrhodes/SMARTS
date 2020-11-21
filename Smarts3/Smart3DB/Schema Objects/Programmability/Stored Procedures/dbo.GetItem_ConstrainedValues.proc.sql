
CREATE PROCEDURE [dbo].[GetItem_ConstrainedValues] (@Table as int, @ID as int) 
AS

/*

OBJECTIVE
	retrieve ConstrainedValue id of item

INPUTS
	@Table - Table to search for
	@ID - ID to search for

OUTPUTS
	all fields of ConstrainedValue table

TASKS

NOTES

*/

SELECT *
FROM ConstrainedValue
WHERE SDTable_ID = @Table 
	AND SD_ID = @ID
