
CREATE PROCEDURE [dbo].[SetShapeTypeAttribute](@Table as int, @A_ID as int, @ST_ID as int,  @Function as int, @Contact as varchar(100),@NewID as int out) AS

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
	@NewID - ID of new ShapeTypeAttribute
	
TASKS
	1. IF ShapeTypeAttribute does not already exist
	2. RETURN new ShapeTypeAttribute ID
	3. prep for LOG entry, set name of new shapetypeattribute :  Attribute - ShapeType
	4. LOG ShapeTypeAttribute entry : Name
	5. LOG ShapeTypeAttribute entry : ShapeType
	6. LOG ShapeTypeAttribute entry : Attribute

NOTES

*/


BEGIN TRAN
	
--- 1
IF (SELECT COUNT(*) FROM ShapeTypeAttribute WHERE ShapeType_ID = @ST_ID AND Attribute_ID = @A_ID) = 0
   BEGIN
	--- 2
	INSERT INTO ShapeTypeAttribute VALUES (@ST_ID, @A_ID, NULL)
	SET @NewID = SCOPE_IDENTITY()
	--- 3
	DECLARE @Name varchar(200)
	SET @Name  = (SELECT Attribute_Name FROM Attribute WHERE Attribute_ID = @A_ID) + ' - ' + (SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = @ST_ID)
	DECLARE @ST_Table int
	SET @ST_Table  = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'ShapeType')
	DECLARE @A_Table int
	SET @A_Table  = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name =  'Attribute')
	--- 4
	EXEC SetLog @Table, @NewID, @Function, @Name, NULL, @Contact
	--- 5
	EXEC SetLog @Table, @NewID, @Function, @ST_Table, @ST_ID, @Contact
	--- 6
	EXEC SetLog @Table, @NewID, @Function, @A_Table, @A_ID, @Contact

    END

COMMIT TRAN

SET NOCOUNT OFF
