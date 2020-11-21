
CREATE PROCEDURE [dbo].[GetShapeTypeList] (@Abstraction as int)  AS

/*

OBJECTIVE
	retrieve list of ShapeTypes

INPUTS
	@Abstraction - AbstractionID to look for

OUTPUTS
	all fields in ShapeType table

TASKS
	1. IF Abstraction is not specified, return all shapetypes
	2. ELSE, return all shapetypes of this Abstraction

NOTES
*/

-- 1
IF @Abstraction IS NULL 
	BEGIN
		SELECT * FROM ShapeType ORDER BY ShapeType_Name
	END
-- 2
ELSE
	BEGIN
		SELECT * FROM ShapeType WHERE Abstraction_ID = @Abstraction  ORDER BY ShapeType_Name
	END
