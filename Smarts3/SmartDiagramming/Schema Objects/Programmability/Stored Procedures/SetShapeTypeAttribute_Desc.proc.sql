
CREATE PROCEDURE [dbo].[SetShapeTypeAttribute_Desc] (@Table as int, @ID as int, @Function as int, @Value as varchar(1000), @Contact as varchar(500)) 
AS

/*

OBJECTIVE
	set description for a  ShapeTypeAttribute

INPUTS
	@Table - ShapeTypeAttribute table
	@ID - ShapeTypeAttribute ID
	@Function - LOGFUNCTION_SET_DESCRIPTION
	@Value - description
	@Contact - user

OUTPUTS
	
TASKS
	1. UPDATE description of ShapeTypeAttribute
	2. LOG entry

NOTES

*/

--- 1
UPDATE ShapeTypeAttribute SET ShapeTypeAttribute_Desc = @Value WHERE ShapeTypeAttribute_ID = @ID
--- 2
EXEC SetLog @Table, @ID, @Function, @Value, NULL, @Contact
