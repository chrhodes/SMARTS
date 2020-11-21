


CREATE PROCEDURE [dbo].[GetItem_AttributeValue] (@Table as int, @ID as int, @STA as int) 
AS

/*

OBJECTIVE
	retrieve shapetypeattribute(s) of an item (shape or relation)

INPUTS
	@Table - Table to search for
	@ID - ID to search for
	@STA - ShapeTypeAttribute to search for

OUTPUTS
	ShapeTypeAttribute_ID, ShapeTypeAttribute_Desc, 
	Attribute_ID, Attribute_Name, AttributeValue_ID, AttributeValue_Value

TASKS
	1. IF this is a shape
		1. IF STA is not specified, GET all attributes w/ their values if @STA is null
		2. ELSE GET specified @STA if value is not null
	2. ELSE this is a relation
		1. IF STA is not specified, GET all attributes w/ their values if @STA is null
		2. ELSE GET specified @STA if value is not null

NOTES
	GET all attributes w/ their values if @STA is null
	GET specified @STA if value is not null

*/
--- 1
IF @Table = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name='Shape')
	BEGIN
		IF @STA IS NULL
			BEGIN
				--- 1.1
				SELECT DISTINCT STA.ShapeTypeAttribute_ID, STA.ShapeTypeAttribute_Desc,
					A.Attribute_ID, A.Attribute_Name,
					AV.AttributeValue_ID, AV.AttributeValue_Value
				FROM AttributeValue AS AV 
					RIGHT JOIN ShapeTypeAttribute AS STA ON AV.ShapeTypeAttribute_ID = STA.ShapeTypeAttribute_ID
						AND AV.SDTable_ID = @Table AND AV.SD_ID = @ID 
					LEFT JOIN ShapeType AS ST ON STA.ShapeType_ID = ST.ShapeType_ID  				
					LEFT JOIN Attribute AS A ON STA.Attribute_ID = A.Attribute_ID
				WHERE ST.ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)
				ORDER BY A.Attribute_Name
			END
		ELSE
			BEGIN
				--- 1.2
				SELECT DISTINCT STA.ShapeTypeAttribute_ID, STA.ShapeTypeAttribute_Desc, 
					A.Attribute_ID, A.Attribute_Name,
					AV.AttributeValue_ID, AV.AttributeValue_Value
				FROM AttributeValue AS AV 
					RIGHT JOIN ShapeTypeAttribute AS STA ON AV.ShapeTypeAttribute_ID = STA.ShapeTypeAttribute_ID
						AND AV.SDTable_ID = @Table AND AV.SD_ID = @ID 
					LEFT JOIN ShapeType AS ST ON STA.ShapeType_ID = ST.ShapeType_ID  				
					LEFT JOIN Attribute AS A ON STA.Attribute_ID = A.Attribute_ID
				WHERE STA.ShapeTypeAttribute_ID = @STA
				ORDER BY A.Attribute_Name
			END
	END
ELSE
--- 2
	BEGIN
		IF @Table = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name='Relation')
			BEGIN
				DECLARE @Abstraction int
				DECLARE @Type int
				SET @Abstraction = (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @ID)
				SET @Type =
					CASE 
						WHEN @Abstraction = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='DEVICE') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'DEVICERELATION')
						WHEN @Abstraction = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='OBJECT') THEN  (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'OBJECTRELATION')
						WHEN @Abstraction = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='SYSTEM') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'SYSTEMRELATION')
						WHEN @Abstraction = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='BUSINESS') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'BUSINESSRELATION')
						WHEN @Abstraction = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='STEP') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'STEPRELATION')
					END
				--- 2.1
				IF @STA IS NULL
					BEGIN
						SELECT DISTINCT STA.ShapeTypeAttribute_ID, STA.ShapeTypeAttribute_Desc, 
							A.Attribute_ID, A.Attribute_Name,
							AV.AttributeValue_ID, AV.AttributeValue_Value
						FROM AttributeValue AS AV 
							RIGHT JOIN ShapeTypeAttribute AS STA ON AV.ShapeTypeAttribute_ID = STA.ShapeTypeAttribute_ID
								AND AV.SDTable_ID = @Table AND AV.SD_ID = @ID 
							LEFT JOIN ShapeType AS ST ON STA.ShapeType_ID = ST.ShapeType_ID  			
							LEFT JOIN Attribute AS A ON STA.Attribute_ID = A.Attribute_ID
						WHERE ST.ShapeType_ID = @Type
						ORDER BY A.Attribute_Name
					END
				--- 2.2
				ELSE
					BEGIN
						SELECT DISTINCT STA.ShapeTypeAttribute_ID, STA.ShapeTypeAttribute_Desc, 
							A.Attribute_ID, A.Attribute_Name,
							AV.AttributeValue_ID, AV.AttributeValue_Value
						FROM AttributeValue AS AV 
							RIGHT JOIN ShapeTypeAttribute AS STA ON AV.ShapeTypeAttribute_ID = STA.ShapeTypeAttribute_ID
								AND AV.SDTable_ID = @Table AND AV.SD_ID = @ID 
							LEFT JOIN ShapeType AS ST ON STA.ShapeType_ID = ST.ShapeType_ID  			
							LEFT JOIN Attribute AS A ON STA.Attribute_ID = A.Attribute_ID
						WHERE STA.ShapeTypeAttribute_ID = @STA
						ORDER BY A.Attribute_Name
					END
			END
	END
