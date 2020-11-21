
CREATE PROCEDURE [dbo].[DeleteShapeTypeAttribute_ConstrainedValue] (@Table as int, @ID as int, @Function as int, @Contact as varchar(500)) AS

/*

OBJECTIVE
	delete constrained value list

INPUTS
	@Table - TABLE_ConstrainedValue
	@ID - ContainerValue ID
	@Function - LOGFUNCTION_DELETE_CONSTRAINEDVALUE
	@Contact - User 

OUTPUTS

TASKS
	1. IF entry exists, LOG ConstrainedValue list to be delete
	2. DELETE entry 

NOTES
	called from within sp DeleteShapeTypeAttribute
*/

IF (SELECT COUNT(*) FROM ConstrainedValue WHERE ConstrainedValue_ID = @ID) > 0
	BEGIN
		--- 1
		EXEC SetLog @Table, @ID, @Function, NULL, NULL, @Contact
		--- 2
		DELETE FROM ConstrainedValue WHERE ConstrainedValue_ID = @ID
	END
