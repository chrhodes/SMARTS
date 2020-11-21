
CREATE PROCEDURE [dbo].[DeleteShapeTypeAttribute] (@Table as int, @ID as int, @Function as int, @Name as varchar(1000), @Note as varchar(1000),  @Contact as varchar(500)) AS

/*

OBJECTIVE
	to delete a shapetypeattribute and its corresponding constrained values

INPUTS
	@Table - Relation Table ID
	@ID - Relation ID
	@Function - LOGFUNCTION_DELETE_SHAPETYPEATTRIBUTE
	@Name - name of ShapeTypeAttribute to be deleted
	@Note - reason for deletion
	@Contact - User 

OUTPUTS

TASKS
	1. IF ShapeTypeAttribue exists
	   1. DELETE ConstrainedValue of ShapeTypeAttribute
	   2. LOG deletion entry
	   3. DELETE ShapeTypeAttribue

NOTES
	this function is only called when there are no items dependent on this shapetype
*/

--- 1
IF (SELECT COUNT(*) FROM ShapeTypeAttribute WHERE ShapeTypeAttribute_ID = @ID) > 0
	BEGIN
		-- 1.1
		DECLARE @CVTable int
		DECLARE @CVID  int
		DECLARE @CVFunction int
		SET @CVTable = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'ConstrainedValue')
		SET @CVID = (SELECT ConstrainedValue_ID FROM ConstrainedValue WHERE SDTable_ID = @Table AND SD_ID = @ID )
		SET @CVFunction = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_DELETE_CONSTRAINEDVALUE')
		EXEC DeleteShapeTypeAttribute_ConstrainedValue @CVTable, @CVID, @CVFunction, @Contact

		-- 1.2
		EXEC SetLog @Table, @ID, @Function, NULL, @Note, @Contact
		-- 1.3
		DELETE FROM ShapeTypeAttribute WHERE ShapeTypeAttribute_ID = @ID
		
	END
