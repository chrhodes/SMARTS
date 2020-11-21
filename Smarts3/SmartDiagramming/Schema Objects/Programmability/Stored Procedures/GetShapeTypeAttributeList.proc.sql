
CREATE PROCEDURE [dbo].[GetShapeTypeAttributeList](@ST_ID as int,@A_ID as int) AS

/*

OBJECTIVE
	retrieve list of ShapeTypeAttributes according to shapetype/attribute filter

INPUTS
	@ST_ID  - shapetype filter
	@A_ID  - attribtue filter

OUTPUTS


TASKS
	1. IF shapetype is not specified
		1. IF attribute is also not specified, RETURN non-null shapetypes & attributes
		2. ELSE (only attribute is specified), RETURN non-null shapetypes & all attributes
	2. ELSE (shapetype is specified)
		1. IF attribute is not specifed, RETURN non-null attributes & all shapetypes

NOTES
*/

--- 1
IF @ST_ID = 0 
	BEGIN
		--- 1.1
		IF @A_ID = 0
			BEGIN 
				SELECT DISTINCT 
						ShapeTypeAttribute.ShapeTypeAttribute_ID,
						ShapeTypeAttribute.ShapeTypeAttribute_Desc,
						Attribute.Attribute_Name + ' - ' + ShapeType.ShapeType_Name as ShapeTypeAttribute_Name,
						ShapeType.ShapeType_ID, 
						ShapeType.ShapeType_Name, 
						Attribute.Attribute_ID,
						Attribute.Attribute_Name
				FROM Attribute
				RIGHT JOIN ShapeTypeAttribute ON Attribute.Attribute_ID = ShapeTypeAttribute.Attribute_ID 
				LEFT JOIN ShapeType ON ShapeTypeAttribute.ShapeType_ID = ShapeType.ShapeType_ID 
				ORDER BY Attribute.Attribute_Name, ShapeType.ShapeType_Name
			END 
		--- 1.2
		ELSE
			BEGIN 
				SELECT DISTINCT 
					ShapeTypeAttribute.ShapeTypeAttribute_ID,
					ShapeTypeAttribute.ShapeTypeAttribute_Desc,
					ShapeType.ShapeType_ID, 
					ShapeType.ShapeType_Name, 
					Attribute.Attribute_ID,
					Attribute.Attribute_Name
				FROM ShapeType 
				LEFT JOIN ShapeTypeAttribute ON ShapeType.ShapeType_ID = ShapeTypeAttribute.ShapeType_ID 
					AND (ShapeTypeAttribute.Attribute_ID = @A_ID OR ShapeTypeAttribute.Attribute_ID IS NULL)
				LEFT JOIN Attribute ON ShapeTypeAttribute.Attribute_ID = Attribute.Attribute_ID
				ORDER BY ShapeType_Name
			END 
	END	
--- 2
ELSE
	BEGIN
		--- 2.1
		IF @A_ID = 0
			BEGIN --IF shapetype only criteria
				SELECT DISTINCT 
					ShapeTypeAttribute.ShapeTypeAttribute_ID,
					ShapeTypeAttribute.ShapeTypeAttribute_Desc,
					ShapeType.ShapeType_ID, 
					ShapeType.ShapeType_Name, 
					Attribute.Attribute_ID,
					Attribute.Attribute_Name
				FROM Attribute
				LEFT JOIN ShapeTypeAttribute ON Attribute.Attribute_ID = ShapeTypeAttribute.Attribute_ID AND ShapeTypeAttribute.ShapeType_ID = @ST_ID
				LEFT JOIN ShapeType ON ShapeTypeAttribute.ShapeType_ID = ShapeType.ShapeType_ID 
				ORDER BY Attribute.Attribute_Name
			END --IF shapetype only criteria
	END
