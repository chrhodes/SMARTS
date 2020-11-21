
CREATE PROCEDURE [dbo].[GetItem_Contained] (@Table as int, @ID as int, @Abstraction as int) 
AS


/*

OBJECTIVE
	retrieve item(s) contained by ID

INPUTS
	@Table - Table to search for
	@ID - ID to search for
	@Abstraction - type of container (artifact or other)

OUTPUTS
	Assoc_ID,Assoc_Name,Assoc_Desc,Assoc_TypeID,Assoc_AbstractionID,Assoc_Direction,
	Principal_TableID,Principal_ID,Principal_Name,Principal_Desc,Principal_TypeID,Principal_TypeName,Principal_AbstractionID,Principal_Environment,
	PrincipalContainer_TableID,PrincipalContainer_ID,PrincipalContainer_Name,PrincipalContainer_Desc,PrincipalContainer_TypeID,PrincipalContainer_TypeName,PrincipalContainer_AbstractionID,
	Related_TableID,Related_ID,Related_Name,Related_Desc,Related_TypeID,Related_TypeName,Related_AbstractionID,Related_Environment,
	RelatedContainer_TableID,RelatedContainer_ID,RelatedContainer_Name,RelatedContainer_Desc,RelatedContainer_TypeID,RelatedContainer_TypeName,RelatedContainer_AbstractionID

TASKS
	1. IF association is an artifact container
	2. ELSE (association is a shape container)
		1. CREATE temptable
		2. DELETE temptable

NOTES

*/

BEGIN TRAN

--- 1
IF @Abstraction = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'ARTIFACT') 
	BEGIN

		SELECT  DISTINCT

			Container_ID  as "Assoc_ID",
			NULL as "Assoc_Name",	
			NULL  as  "Assoc_Desc",
			NULL as "Assoc_TypeID",
			Abstraction_ID as "Assoc_AbstractionID",
			 'TO' as "Assoc_Direction",
	
			@Table  as "Principal_TableID",
			@ID as "Principal_ID",
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = @ID) as "Principal_Name",
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = @ID) as "Principal_Desc",
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID) as "Principal_TypeID",
			(SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) as "Principal_TypeName",
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID))  as "Principal_AbstractionID",
			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') AND ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) AND SDTable_ID = @Table AND SD_ID = @ID) as "Principal_Environment",

			NULL as "PrincipalContainer_TableID",
			NULL as "PrincipalContainer_ID",
			NULL as "PrincipalContainer_Name",
			NULL as "PrincipalContainer_Desc",
			NULL as "PrincipalContainer_TypeID",
			NULL as "PrincipalContainer_TypeName",
			NULL as "PrincipalContainer_AbstractionID",

			SDTable_ID_Contained as "Related_TableID",
			SD_ID_Contained as "Related_ID",
			(SELECT Artifact_Name FROM Artifact WHERE Artifact_ID = SD_ID_Contained) as "Related_Name",
			(SELECT Artifact_Loc FROM Artifact WHERE Artifact_ID = SD_ID_Contained) as "Related_Desc",
			NULL as "Related_TypeID",
			NULL as "Related_TypeName",
			@Abstraction  as "Related_AbstractionID",
			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') AND ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained)) AND SDTable_ID = SDTable_ID_Contained AND SD_ID = SD_ID_Contained) as "Related_Environment",

			NULL as "RelatedContainer_TableID",
			NULL as "RelatedContainer_ID",
			NULL as "RelatedContainer_Name",
			NULL as "RelatedContainer_Desc",
			NULL as "RelatedContainer_TypeID",
			NULL as "RelatedContainer_TypeName",
			NULL as "RelatedContainer_AbstractionID"

		FROM Container NOLOCK
		WHERE SDTable_ID_Container = @Table 
			AND SD_ID_Container = @ID 
			AND Abstraction_ID  = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'ARTIFACT')
		 ORDER BY Related_Name

	END
--- 2
ELSE
	BEGIN
		--- 2.1
		SELECT  DISTINCT

			Container_ID  as "Assoc_ID",
			NULL as "Assoc_Name",	
			NULL  as  "Assoc_Desc",

			(CASE 
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEPOBJECT') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'CROSSRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICEOBJECT') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'CROSSRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'DEVICERELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'STEPRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'OBJECTRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEMOBJECT') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'CROSSRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESSSTEP') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'CROSSRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESS') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'BUSINESSRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEM') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'SYSTEMRELATION')
			 END) as "Assoc_TypeID",
			Abstraction_ID as "Assoc_AbstractionID",
			 'TO' as "Assoc_Direction",
	
			@Table  as "Principal_TableID",
			@ID as "Principal_ID",
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = @ID) as "Principal_Name",
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = @ID) as "Principal_Desc",
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID) as "Principal_TypeID",
			(SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) as "Principal_TypeName",
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID))  as "Principal_AbstractionID",
			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') AND ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) AND SDTable_ID = @Table AND SD_ID = @ID) as "Principal_Environment", 

			(CASE
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='SYSTEMOBJECT')
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID))= (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='BUSINESSSTEP')
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID))= (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'PIECE') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='OBJECTPIECE')
			 END) as "Container_Principal_AbstractionID",


			SDTable_ID_Contained as "Related_TableID",
			SD_ID_Contained as "Related_ID",
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = SD_ID_Contained) as "Related_Name",
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = SD_ID_Contained) as "Related_Desc",
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained)  as "Related_TypeID",
			(SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained)) as "Related_TypeName",
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID =(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained))  as "Related_AbstractionID",

			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue 
				WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
					WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') 
						AND ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Container))
						 AND SDTable_ID = SDTable_ID_Container 
						AND SD_ID = SD_ID_Container) as "Related_Environment",


			(CASE
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID =(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='SYSTEMOBJECT')
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID =(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='BUSINESSSTEP')
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID =(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'PIECE') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='OBJECTPIECE')
			 END) as "Container_Related_AbstractionID"


		 INTO #TempTable1 
		FROM Container NOLOCK
		WHERE SDTable_ID_Container = @Table 
			AND SD_ID_Container = @ID 
			AND Abstraction_ID  <> (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'ARTIFACT')

		IF @Abstraction IS NOT NULL
			BEGIN
				DELETE FROM #TempTable1 WHERE Assoc_AbstractionID <> @Abstraction
			END


		SELECT  DISTINCT  *,

			(SELECT SDTable_ID_Container FROM Container 
				WHERE SDTable_ID_Contained = Principal_TableID  AND SD_ID_Contained = Principal_ID AND Abstraction_ID = Container_Principal_AbstractionID
			) as "PrincipalContainer_TableID",
			(SELECT SD_ID_Container FROM Container 
				WHERE SDTable_ID_Contained = Principal_TableID  AND SD_ID_Contained = Principal_ID AND Abstraction_ID = Container_Principal_AbstractionID
			) as "PrincipalContainer_ID",
			(SELECT Shape_Name FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained = Principal_TableID  AND SD_ID_Contained = Principal_ID AND Abstraction_ID = Container_Principal_AbstractionID
				)
			) as "PrincipalContainer_Name",
			(SELECT Shape_Desc FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained = Principal_TableID  AND SD_ID_Contained = Principal_ID AND Abstraction_ID = Container_Principal_AbstractionID
				)
			) as "PrincipalContainer_Desc",
			(SELECT ShapeType_ID FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained = Principal_TableID  AND SD_ID_Contained = Principal_ID AND Abstraction_ID = Container_Principal_AbstractionID
				)
			) as "PrincipalContainer_TypeID",
			(SELECT ShapeType_Name FROM ShapeType  
				WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape 
					WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
						WHERE SDTable_ID_Contained = Principal_TableID  AND SD_ID_Contained = Principal_ID AND Abstraction_ID = Container_Principal_AbstractionID
					)
				)
			) as "PrincipalContainer_TypeName",
			(SELECT Abstraction_ID FROM ShapeType 
				WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape 
					WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
						WHERE SDTable_ID_Contained = Principal_TableID  AND SD_ID_Contained = Principal_ID AND Abstraction_ID = Container_Principal_AbstractionID
					)
				)
			)  as "PrincipalContainer_AbstractionID",

			(SELECT SDTable_ID_Container FROM Container 
				WHERE SDTable_ID_Contained = Related_TableID  AND SD_ID_Contained = Related_ID AND Abstraction_ID = Container_Related_AbstractionID
			) as "RelatedContainer_TableID",
			(SELECT SD_ID_Container FROM Container 
				WHERE SDTable_ID_Contained = Related_TableID  AND SD_ID_Contained = Related_ID AND Abstraction_ID = Container_Related_AbstractionID
			) as "RelatedContainer_ID",
			(SELECT Shape_Name FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained = Related_TableID  AND SD_ID_Contained = Related_ID AND Abstraction_ID = Container_Related_AbstractionID
				)
			) as "RelatedContainer_Name",
			(SELECT Shape_Desc FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained = Related_TableID  AND SD_ID_Contained = Related_ID AND Abstraction_ID = Container_Related_AbstractionID
				)
			) as "RelatedContainer_Desc",
			(SELECT ShapeType_ID FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained = Related_TableID  AND SD_ID_Contained = Related_ID AND Abstraction_ID = Container_Related_AbstractionID
				)
			) as "RelatedContainer_TypeID",
			(SELECT ShapeType_Name FROM ShapeType  
				WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape 
					WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
						WHERE SDTable_ID_Contained = Related_TableID  AND SD_ID_Contained = Related_ID AND Abstraction_ID = Container_Related_AbstractionID
					)
				)
			) as "RelatedContainer_TypeName",
			(SELECT Abstraction_ID FROM ShapeType 
				WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape 
					WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
						WHERE SDTable_ID_Contained = Related_TableID  AND SD_ID_Contained = Related_ID AND Abstraction_ID = Container_Related_AbstractionID
					)
				)
			)  as "RelatedContainer_AbstractionID"

	  	FROM #TempTable1 ORDER BY RelatedContainer_Name, Related_Name, Assoc_Name

		--- 2.2
		DROP TABLE #TempTable1

	END

COMMIT TRAN
