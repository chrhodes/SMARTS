
CREATE PROCEDURE [dbo].[SetAttribute] (@Table as int,@Function as int, @Value as varchar(1000), @Contact as varchar(1000) , @NewID as int 

out)
AS

/*

OBJECTIVE
	set  attribute

INPUTS
	@SDTable_ID - TABLE_ATTRIBUTE
	@Function - LOGFUNCTION_SET_NAME
	@Values - name of attribute
	@Contact - user

OUTPUTS
	@NewID - ID of new attribute
	
TASKS
	1.INSERT new attribute
	2. RETURN new ID
	3. LOG entry

NOTES

*/


	INSERT INTO Attribute VALUES(@Value)
	SET @NewID = SCOPE_IDENTITY()
	EXEC SetLog @Table, @NewID, @Function, @Value, NULL, @Contact
