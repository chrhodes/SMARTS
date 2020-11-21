
CREATE PROCEDURE [dbo].[SetAttribute_Name] (@Table as int, @ID as int, @Function as int, @Value as varchar(1000), @Contact as varchar(500)) 
AS

/*

OBJECTIVE
	set name of attribute

INPUTS
	@SDTable_ID - TABLE_ATTRIBUTE
	@SD_ID - Attribute  ID
	@Function - LOGFUNCTION_SET_NAME
	@Values - name of attribute
	@Contact - user

OUTPUTS
	
TASKS
	1. UPDATE name of attribute
	2. LOG entry

NOTES

*/

-- 1
UPDATE Attribute SET Attribute_Name = @Value WHERE Attribute_ID = @ID
-- 2
EXEC SetLog @Table, @ID, @Function, @Value, NULL, @Contact
