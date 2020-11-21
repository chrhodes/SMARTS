
CREATE PROCEDURE [dbo].[DeleteContainer] (@Table as int, @ID as int, @Function as int,@Contact as varchar(500)) AS

/*

OBJECTIVE
	TO DELETE A CONTAINER ASSOCIATION

INPUTS
	@Table - Container Table ID
	@ID - Container ID
	@Function - LOGFUNCTION_DELETE_CONTAINER
	@Contact - User 

OUTPUTS

TASKS
	1. LOG CONTAINER TO BE DELETED 
	2. DELETE CONTAINER FROM CONTAINER TABLE
NOTES

*/


IF (SELECT COUNT(*) FROM Container WHERE Container_ID = @ID) > 0
	BEGIN
		-- TASK 1
		EXEC SetLog @Table, @ID, @Function, NULL, NULL, @Contact
		-- TASK 2
		DELETE FROM Container WHERE Container_ID = @ID

	END
