
CREATE PROCEDURE [dbo].[DeleteAttribute] (@Table as int, @ID as int, @Function as int, @Name as varchar(1000), @Note as varchar(1000),@Contact as varchar(500)) AS

/*

OBJECTIVE
	TO DELETE AN ATTRIBUTE

INPUTS
	@Table - Attribute Table ID
	@ID - Attribute ID
	@Function - LOGFUNCTION_DELETE_ATTRIBUTE
	@Name - Attribute Name
	@Note - Comment reason for deletion
	@Contact - User 

OUTPUTS

TASKS
	1. LOG ATTRIBUTE TO BE DELETED 
	2. DELETE ATTRIBUTE FROM ATTRIBUTE TABLE

NOTES
	-THIS STORED PROC IS ONLY CALLED WHEN THERE ARE NO DEPENDENT SHAPETYPES

*/


IF (SELECT COUNT(*) FROM Attribute WHERE Attribute_ID = @ID) > 0
	BEGIN
		-- TASK 1
		EXEC SetLog @Table, @ID, @Function, @Name, @Note, @Contact
		-- TASK 2
		DELETE FROM Attribute WHERE Attribute_ID = @ID
	END
