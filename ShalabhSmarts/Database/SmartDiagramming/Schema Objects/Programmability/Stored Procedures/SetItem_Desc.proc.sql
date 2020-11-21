
CREATE PROCEDURE [dbo].[SetItem_Desc] (@Table as int, @ID as int, @Function as int, @Value as varchar(1000), @Contact as varchar(500)) 
AS

/*

OBJECTIVE
	set description for a  Shape

INPUTS
	@Table -TABLE_SHAPE
	@ID - Shape ID
	@Function - LOGFUNCTION_SET_DESCRIPTION
	@Value - description
	@Contact - user

OUTPUTS
	
TASKS
	1. UPDATE description of Shape	
	2. LOG entry

NOTES

*/

--- 1
UPDATE Shape SET Shape_Desc = @Value WHERE Shape_ID = @ID
--- 2
EXEC SetLog @Table, @ID, @Function, @Value, NULL, @Contact
