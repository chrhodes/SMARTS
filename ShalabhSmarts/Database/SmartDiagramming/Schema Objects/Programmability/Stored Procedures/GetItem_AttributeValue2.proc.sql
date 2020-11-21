

CREATE PROCEDURE [dbo].[GetItem_AttributeValue2] (@Table as int, @ID as int, @STA as int) 
AS

/* 
SDTable Shape = 4
GET all attribute w/ their values if @STA is null
GET specified @STA is value is not null
*/

IF @Table = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name='Shape')
	BEGIN
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
				WHERE ST.ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)
				ORDER BY A.Attribute_Name
			END
		ELSE
			BEGIN
				SELECT DISTINCT STA.ShapeTypeAttribute_ID, 
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
	BEGIN
		IF @Table = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name='Relation')
			BEGIN
				DECLARE @Abstraction int
				DECLARE @Type int
				DECLARE @TypeSystem int
				DECLARE @TypeObject int
				DECLARE @TypeMachine int
				SET @Abstraction = (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @ID)
				SET @TypeSystem = (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'SYSTEMRELATION')
				SET @TypeObject = (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'OBJECTRELATION')
				SET @TypeMachine = (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'SERVERRELATION')
				SET @Type =
					CASE 
						WHEN @Abstraction = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='MACHINE') THEN @TypeMachine
						WHEN @Abstraction = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='OBJECT') THEN @TypeObject
						WHEN @Abstraction = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='SYSTEM') THEN @TypeSystem
					END

				IF @STA IS NULL
					BEGIN
						SELECT DISTINCT STA.ShapeTypeAttribute_ID, 
							A.Attribute_ID, A.Attribute_Name,
							AV.AttributeValue_ID, AV.AttributeValue_Value
						FROM AttributeValue AS AV 
							RIGHT JOIN ShapeTypeAttribute AS STA ON AV.ShapeTypeAttribute_ID = STA.ShapeTypeAttribute_ID
								AND AV.SDTable_ID = @Table AND AV.SD_ID = @ID 
							LEFT JOIN ShapeType AS ST ON STA.ShapeType_ID = ST.ShapeType_ID  										LEFT JOIN Attribute AS A ON STA.Attribute_ID = A.Attribute_ID
						WHERE ST.ShapeType_ID = @Type
						ORDER BY A.Attribute_Name
					END
				ELSE
					BEGIN
						SELECT DISTINCT STA.ShapeTypeAttribute_ID, 
							A.Attribute_ID, A.Attribute_Name,
							AV.AttributeValue_ID, AV.AttributeValue_Value
						FROM AttributeValue AS AV 
							RIGHT JOIN ShapeTypeAttribute AS STA ON AV.ShapeTypeAttribute_ID = STA.ShapeTypeAttribute_ID
								AND AV.SDTable_ID = @Table AND AV.SD_ID = @ID 
							LEFT JOIN ShapeType AS ST ON STA.ShapeType_ID = ST.ShapeType_ID  										LEFT JOIN Attribute AS A ON STA.Attribute_ID = A.Attribute_ID
						WHERE STA.ShapeTypeAttribute_ID = @STA
						ORDER BY A.Attribute_Name
					END
			END
	END