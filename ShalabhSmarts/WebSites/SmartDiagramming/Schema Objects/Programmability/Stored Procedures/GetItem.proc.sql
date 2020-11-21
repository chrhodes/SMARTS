

CREATE PROCEDURE [dbo].[GetItem] (@Table as int, @ID as int) 
AS

/*

OBJECTIVE
	retrieve item selected

INPUTS
	@Table - Table to search for
	@ID - ID to search for

OUTPUTS
	IF in Shape Table :  Shape, Lifecycle,ShapeType
	ElSE, all fields in  table

TASKS

NOTES

*/

DECLARE @T varchar(100)
DECLARE @T_ID varchar(103)
DECLARE @ProcSelect varchar(2000)

SET @T = (SELECT SDTable_Name FROM SDTable WHERE SDTable_ID = @Table)
SET @T_ID = @T + '_ID'

IF @T = 'Shape' 
	BEGIN
		SET @ProcSelect = "SELECT * FROM Shape, Lifecycle,ShapeType WHERE Shape_ID = " +  CAST(@ID as varchar(100)) + " AND Lifecycle.Lifecycle_ID = Shape.Lifecycle_ID AND ShapeType.ShapeType_ID = Shape.ShapeType_ID " 
	END
ELSE
	BEGIN
		SET @ProcSelect = "SELECT * FROM " + @T + " WHERE " + @T_ID + " = " +  CAST(@ID as varchar(100))
	END


EXEC (@ProcSelect)
