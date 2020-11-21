
CREATE PROCEDURE [dbo].[SetItem_Name] (@Table as int, @ID as int, @Function as int, @Value as varchar(1000), @Contact as varchar(500)) 
AS

/*

OBJECTIVE
	set name for a  Shape

INPUTS
	@Table -TABLE_SHAPE
	@ID - Shape ID
	@Function - LOGFUNCTION_SET_NAME
	@Value - name
	@Contact - user

OUTPUTS
	
TASKS
	1. UPDATE name of Shape	
	2. LOG entry

NOTES

*/

UPDATE Shape SET Shape_Name = @Value WHERE Shape_ID = @ID
EXEC SetLog @Table, @ID, @Function, @Value, NULL, @Contact
