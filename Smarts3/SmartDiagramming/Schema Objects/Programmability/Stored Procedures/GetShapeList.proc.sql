
CREATE PROCEDURE [dbo].[GetShapeList]  (@Abstraction as int, @ShapeType as int)

AS

/*

OBJECTIVE
	retrieve list of shapes according to shapetype/abstraction filter

INPUTS
	@ShapeType  - shapetype filter
	@Abstraction  - abstraction filter

OUTPUTS
	shape_id, shape_name, shape_desc,
	shapetype_id, shapetype_name,
	abstraction_id, abstraction_name 

TASKS
	1. IF abstraction is not specified
		1. IF shapetype is also not specified, RETURN all shapes
		2. ELSE (only shapetype is specified), RETURN shapes of this shapetype
	2. ELSE (abstraction is specified)
		1. IF shapetype is not specifed, RETURN all shapes of this abstraction
		2. ELSE  (shapetype is specified), RETURN all shapes of this abstraction and shapetype

NOTES

*/

--- 1
IF @Abstraction is not null 
	BEGIN
		--- 1.1
		IF @ShapeType is not null
			BEGIN
				select shape_id, shape_name, shape_desc,
					shapetype.shapetype_id, shapetype.shapetype_name,
					abstraction.abstraction_id, abstraction.abstraction_name  
				from abstraction
					left join shapetype on abstraction.abstraction_ID = shapetype.abstraction_ID 
					left join shape on shapetype.shapetype_id = shape.shapetype_id 
				where shape_name is not null 
					and abstraction.abstraction_id =@Abstraction
					and shapetype.shapetype_id = @ShapeType
				order by shape_name
			END
		--- 1.2
		ELSE
			BEGIN
				select shape_id, shape_name, shape_desc,
					shapetype.shapetype_id, shapetype.shapetype_name,
					abstraction.abstraction_id, abstraction.abstraction_name  
				from abstraction
					left join shapetype on abstraction.abstraction_ID = shapetype.abstraction_ID 
					left join shape on shapetype.shapetype_id = shape.shapetype_id 
				where shape_name is not null 
					and abstraction.abstraction_id =@Abstraction
				order by shape_name
			END
	END
--- 2
ELSE
	BEGIN
		--- 2.1
		IF @ShapeType is not null
			BEGIN
				select shape_id, shape_name, shape_desc,
					shapetype.shapetype_id, shapetype.shapetype_name,
					abstraction.abstraction_id, abstraction.abstraction_name  
				from abstraction
					left join shapetype on abstraction.abstraction_ID = shapetype.abstraction_ID 
					left join shape on shapetype.shapetype_id = shape.shapetype_id 
				where shape_name is not null 
					and shapetype.shapetype_id = @ShapeType
				order by shape_name
			END
		--- 2.2
		ELSE
			BEGIN
				select shape_id, shape_name, shape_desc,
					shapetype.shapetype_id, shapetype.shapetype_name,
					abstraction.abstraction_id, abstraction.abstraction_name  
				from abstraction
					left join shapetype on abstraction.abstraction_ID = shapetype.abstraction_ID 
					left join shape on shapetype.shapetype_id = shape.shapetype_id 
				where shape_name is not null 
				order by shape_name
			END
	END
