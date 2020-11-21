
CREATE PROCEDURE [dbo].[SetShape] (@Table as int, @ShapeType as int, @Lifecycle as int, @Function as int, @Value as varchar(1000), @Contact as varchar(1000), @NewID as int out) 

AS
/*
		- setlog ShapeTable, ShapeID, Function_SET_XXX, Name,
		- setlog ShapeTable, ShapeID, Function_SET_XXX, ShapeType_Table, ShapeType_ID
		- setlog ShapeTable, ShapeID, Function_SET_XXX, Lifecycle_Table, LifeCycle_ID
*/


DECLARE @Table_ShapeType int
DECLARE @Table_Lifecycle int
DECLARE @Function_Lifecycle int

INSERT INTO Shape (ShapeType_ID, Shape_Name, Lifecycle_ID) VALUES (@ShapeType,@Value,@Lifecycle)
SET @NewID = SCOPE_IDENTITY()
SET @Table_ShapeType = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'ShapeType')
SET @Table_Lifecycle = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Lifecycle')
SET @Function_Lifecycle = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_LIFECYCLE')
EXEC SetLog @Table, @NewID, @Function, @Value, NULL, @Contact
EXEC SetLog @Table, @NewID, @Function, @Table_ShapeType, @ShapeType, @Contact
EXEC SetLog @Table, @NewID, @Function_Lifecycle, @Table_Lifecycle, @Lifecycle, @Contact
