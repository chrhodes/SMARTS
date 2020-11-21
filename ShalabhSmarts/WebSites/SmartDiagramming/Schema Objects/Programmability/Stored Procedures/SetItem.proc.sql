
CREATE PROCEDURE [dbo].[SetItem] (@Table as int, @ShapeType as int, @Lifecycle as int, @Function as int, @Value as varchar(1000), @Contact as varchar(1000), @NewID as int out) 

AS

/*

OBJECTIVE
	set description for a  ShapeTypeAttribute

INPUTS
	@Table - TABLE_SHAPETYPEATTRIBUTE
	@A_ID - Attribute ID
	@ST_ID - ShapeType ID
	@Function - LOGFUNCTION_SET_SHAPETYPEATTRIBUTE
	@Contact - user

OUTPUTS
	@NewID - ID of new Shape
	
TASKS
	1. INSERT new Shape
	2. SET/RETURN New ID 
	3. prep for LOG entries
	4. LOG Shape entry : Name
	5. LOG Shape entry : ShapeType
	6. LOG Shape entry : Lifecycle

NOTES
	this function does not check for duplicates. whether duplicates should/should not be allowed is determined in the business layer
*/

--- 1
INSERT INTO Shape (ShapeType_ID, Shape_Name, Lifecycle_ID) VALUES (@ShapeType,@Value,@Lifecycle)
--- 2
SET @NewID = SCOPE_IDENTITY()
--- 3
DECLARE @Table_ShapeType int
SET @Table_ShapeType = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'ShapeType')
DECLARE @Table_Lifecycle int
SET @Table_Lifecycle = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Lifecycle')
DECLARE @Function_Lifecycle int
SET @Function_Lifecycle = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_LIFECYCLE')
--- 4
EXEC SetLog @Table, @NewID, @Function, @Value, NULL, @Contact
--- 5
EXEC SetLog @Table, @NewID, @Function, @Table_ShapeType, @ShapeType, @Contact
--- 6
EXEC SetLog @Table, @NewID, @Function_Lifecycle, @Table_Lifecycle, @Lifecycle, @Contact
