
CREATE PROCEDURE [dbo].[SetItem_Lifecycle] (@Table as int, @ID as int, @Function as int, @Value as varchar(1000), @Contact as varchar(500)) 
AS

/*

OBJECTIVE
	set lifecycle for a  Shape

INPUTS
	@Table -TABLE_SHAPE
	@ID - Shape ID
	@Function - LOGFUNCTION_SET_LIFECYCLE
	@Value - lifecycle
	@Contact - user

OUTPUTS
	
TASKS
	1. UPDATE lifecycle of Shape	
	2. prep local var for LOG entry
	3. LOG entry

NOTES

*/

-- 1
UPDATE Shape SET Lifecycle_ID = @Value WHERE Shape_ID = @ID
--- 2
DECLARE @TableLifecycle int
SET @TableLifecycle = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Lifecycle')
--- 3
EXEC SetLog @Table, @ID, @Function, @TableLifecycle, @Value, @Contact
