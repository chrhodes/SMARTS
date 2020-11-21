
CREATE PROCEDURE [dbo].[GetItem_Abstraction] (@Table as int, @ID as int) 
AS

/*

OBJECTIVE
	retrieve abstraction id of item

INPUTS
	@Table - Table to search for
	@ID - ID to search for

OUTPUTS
	Shape_ID, ShapeType_ID, Shape_Name, Shape_Desc, Lifecycle_ID, Abstraction_ID

TASKS

NOTES

*/


select Shape_ID, Shape.ShapeType_ID, Shape_Name, Shape_Desc, Lifecycle_ID, Abstraction_ID
from Shape 
	left join ShapeType  on Shape.ShapeType_ID = ShapeType.ShapeType_ID
where Shape_ID = @ID
