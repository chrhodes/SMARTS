
CREATE PROCEDURE [dbo].[GetAssociation] (@Table as int, @ID as int)  AS

/*

OBJECTIVE
	retrieve an association (Relation or Container)

INPUTS
	@Table 	- Table ID
	@ID		- ID 

OUTPUTS
	
	Item1Container TableID, Item1Container ID, Item1Container Name, Item1Container Desc, Item1Container TypeID, Item1Container TypeName, Item1Container AbstractionID
	Item1 TableID, Item1 ID, Item1 Name, Item1 Desc, Item1 TypeID, Item1 TypeName, Item1 AbstractionID
	Item2Container TableID, Item2 Container ID, Item2Container Name, Item2Container Desc, Item2Container TypeID, Item2Container TypeName, Item2Container AbstractionID
	Item2 TableID, Item2 ID, Item2 Name, Item2 Desc, Item2 TypeID, Item2 TypeName, Item2 AbstractionID

TASKS

	1. determine if association is a relation or a container, and populate accordingly

NOTES
	if the association is a container, Item1 would be the container of Item2. 
*/



--- 1
IF @Table =  (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Relation')
	BEGIN
                               ---- create a temptable first with just the items
		SELECT  DISTINCT
			Relation_ID as [Assoc ID],
			IsNULL(Relation_Name,'') as [Assoc Name],	
			IsNULL(Relation_Desc,'') as [Assoc Desc],
			(CASE 
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'STEPRELATION')
				WHEN Abstraction_ID =  (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'DEVICERELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'OBJECTRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESS') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'BUSINESSRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEM') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'SYSTEMRELATION')
			 END) as [Assoc TypeID],
			Abstraction_ID as [Assoc AbstractionID],
			"TO" as [Assoc Direction],

			--- ADD TEMP COLUMN OF Container_ID to look for
			(SELECT Container_ID FROM Container 
				WHERE SDTable_ID_Contained = SDTable_ID_Begin 
					AND SD_ID_Contained = SD_ID_Begin 
					AND Container.Abstraction_ID = (CASE 
					WHEN  (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @ID) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESSSTEP')
					WHEN  (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @ID) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE')
					WHEN  (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @ID) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT')THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEMOBJECT')
					 END)
			) as [Container ID Item1],
	
			SDTable_ID_Begin  as [Item1 TableID],
			SD_ID_Begin as [Item1 ID],
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = SD_ID_Begin) as [Item1 Name],
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = SD_ID_Begin) as [Item1 Desc],
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Begin) as [Item1 TypeID],
			(SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Begin)) as [Item1 TypeName],
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Begin))  as [Item1 AbstractionID],
			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue 
				WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
					WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') 
						AND ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Begin))
						 AND SDTable_ID = SDTable_ID_Begin 
						AND SD_ID = SD_ID_Begin) as [Item1 Environment],

			(SELECT Container_ID FROM Container 
				WHERE SDTable_ID_Contained = SDTable_ID_End
					AND SD_ID_Contained = SD_ID_End
					AND Abstraction_ID = (CASE 
					WHEN (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @ID) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESSSTEP')
					WHEN (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @ID) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE')
					WHEN (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @ID) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT')THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEMOBJECT')
				 END)
			) as [Container ID Item2],

			SDTable_ID_End as [Item2 TableID],
			SD_ID_End as [Item2 ID],
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = SD_ID_End) as [Item2 Name],
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = SD_ID_End) as [Item2 Desc],
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_End) as [Item2 TypeID],
			(SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_End)) as [Item2 TypeName],
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_End))  as [Item2 AbstractionID],
			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue 
				WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
					WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') 
						AND ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_End))
						 AND SDTable_ID = SDTable_ID_End 
						AND SD_ID = SD_ID_End) as [Item2 Environment]
	
		 INTO #TempTable1 
		FROM Relation NOLOCK
		WHERE Relation_ID = @ID

		/* * * 2nd table has items' container info  * * */
		SELECT  DISTINCT 

			(SELECT SDTable_ID_Container FROM Container WHERE Container_ID = [Container ID Item1]) as [Item1Container TableID],
			(SELECT SD_ID_Container FROM Container WHERE  Container_ID =  [Container ID Item1]) as [Item1Container ID],
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID =  [Container ID Item1])) as [Item1Container Name],
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID =  [Container ID Item1])) as [Item1Container Desc],
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID =  [Container ID Item1])) as [Item1Container TypeID],
			(SELECT ShapeType_Name FROM ShapeType  WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE  Container_ID =  [Container ID Item1]))) as [Item1Container TypeName],
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID =  [Container ID Item1])))  as [Item1Container AbstractionID],

			[Item1 TableID],
			[Item1 TypeID],
			[Item1 TypeName],
			[Item1 ID],
			[Item1 Name],
			[Item1 Desc],
			[Item1 AbstractionID],

			(SELECT SDTable_ID_Container FROM Container WHERE Container_ID =   [Container ID Item2]) as [Item2Container TableID],
			(SELECT SD_ID_Container FROM Container WHERE  Container_ID =   [Container ID Item2]) as [Item2Container ID],
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID =  [Container ID Item2])) as [Item2Container Name],
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID =   [Container ID Item2])) as [Item2Container Desc],
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID =   [Container ID Item2])) as [Item2Container TypeID],
			(SELECT ShapeType_Name FROM ShapeType  WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE  Container_ID =   [Container ID Item2]))) as [Item2Container TypeName],
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID =   [Container ID Item2])))  as [Item2Container AbstractionID],

			[Item2 TableID],
			[Item2 TypeID],
			[Item2 TypeName],
			[Item2 ID],
			[Item2 Name],
			[Item2 Desc],
			[Item2 AbstractionID],

			[Assoc ID],
			[Assoc Name],
			[Assoc Desc],
			[Assoc TypeID],
			[Assoc AbstractionID],
			[Assoc Direction]

	  	FROM #TempTable1 ORDER BY [Item2Container Name], [Item2 Name], [Assoc Name]
		
		DROP TABLE #TempTable1

	END

ELSE
	BEGIN

		SELECT  DISTINCT

			Container_ID as [Assoc ID],
			NULL as [Assoc Name],	
			NULL as [Assoc Desc],

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
			 END) as [Assoc TypeID],
			Abstraction_ID as [Assoc AbstractionID],
			 'TO' as [Assoc Direction],
	
			SDTable_ID_Container  as [Item1 TableID],
			SD_ID_Container as [Item1 ID],
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = SD_ID_Container) as [Item1 Name],
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = SD_ID_Container) as [Item1 Desc],
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Container) as [Item1 TypeID],
			(SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Container)) as [Item1 TypeName],
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Container))  as [Item1 AbstractionID],
			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') AND ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Container)) AND SDTable_ID = SDTable_ID_Container AND SD_ID = SD_ID_Container) as [Item1 Environment],

			(CASE
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Container)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='SYSTEMOBJECT')
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Container))= (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='BUSINESSSTEP')
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Container))= (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'PIECE') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='OBJECTPIECE')
			 END) as [Container Item1 AbstractionID],


			SDTable_ID_Contained as[Item2 TableID],
			SD_ID_Contained as [Item2 ID],
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = SD_ID_Contained) as [Item2 Name],
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = SD_ID_Contained) as [Item2 Desc],
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained)  as [Item2 TypeID],
			(SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained)) as [Item2 TypeName],
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID =(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained))  as [Item2 AbstractionID],
			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue 
				WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
					WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') 
						AND ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Container))
						 AND SDTable_ID = SDTable_ID_Container 
						AND SD_ID = SD_ID_Container) as [Item2 Environment],

			(CASE
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID =(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='SYSTEMOBJECT')
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID =(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='BUSINESSSTEP')
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID =(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'PIECE') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='OBJECTPIECE')
			 END) as [Container Item2 AbstractionID]


		 INTO #TempTable3 
		FROM Container NOLOCK
		WHERE Container_ID = @ID 
			AND Abstraction_ID <> (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'ARTIFACT')


		SELECT  DISTINCT

			(SELECT SDTable_ID_Container FROM Container 
				WHERE SDTable_ID_Contained = [Item1 TableID]  AND SD_ID_Contained =  [Item1 ID] AND Abstraction_ID = [Container Item1 AbstractionID]
			) as[Item1Container TableID],
			(SELECT SD_ID_Container FROM Container 
				WHERE SDTable_ID_Contained =  [Item1 TableID]  AND SD_ID_Contained =  [Item1 ID] AND Abstraction_ID =  [Container Item1 AbstractionID]
			) as [Item1Container ID],
			(SELECT Shape_Name FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained =  [Item1 TableID]  AND SD_ID_Contained =  [Item1 ID] AND Abstraction_ID =  [Container Item1 AbstractionID]
				)
			) as [Item1Container Name],
			(SELECT Shape_Desc FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained =  [Item1 TableID]  AND SD_ID_Contained =  [Item1 ID] AND Abstraction_ID =  [Container Item1 AbstractionID]
				)
			) as [Item1Container Desc],
			(SELECT ShapeType_ID FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained =  [Item1 TableID]  AND SD_ID_Contained =  [Item1 ID] AND Abstraction_ID =  [Container Item1 AbstractionID]
				)
			) as [Item1Container TypeID],
			(SELECT ShapeType_Name FROM ShapeType  
				WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape 
					WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
						WHERE SDTable_ID_Contained =  [Item1 TableID]  AND SD_ID_Contained =  [Item1 ID] AND Abstraction_ID =  [Container Item1 AbstractionID]
					)
				)
			) as [Item1Container TypeName],
			(SELECT Abstraction_ID FROM ShapeType 
				WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape 
					WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
						WHERE SDTable_ID_Contained =   [Item1 TableID]  AND SD_ID_Contained =   [Item1 ID] AND Abstraction_ID =  [Container Item1 AbstractionID]
					)
				)
			)  as [Item1Container AbstractionID],

			[Item1 TableID],
			[Item1 TypeID],
			[Item1 TypeName],
			[Item1 ID],
			[Item1 Name],
			[Item1 Desc],
			[Item1 AbstractionID],
			[Container Item1 AbstractionID],
			[Container Item2 AbstractionID],

			(SELECT SDTable_ID_Container FROM Container 
				WHERE SDTable_ID_Contained = [Item2 TableID]  AND SD_ID_Contained = [Item2 ID] AND Abstraction_ID = [Container Item2 AbstractionID]
			) as  [Item2Container TableID],
			(SELECT SD_ID_Container FROM Container 
				WHERE SDTable_ID_Contained = [Item2 TableID]  AND SD_ID_Contained =  [Item2 ID] AND Abstraction_ID = [Container Item2 AbstractionID]
			) as  [Item2Container ID],
			(SELECT Shape_Name FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained = [Item2 TableID]  AND SD_ID_Contained =  [Item2 ID] AND Abstraction_ID = [Container Item2 AbstractionID]
				)
			) as  [Item2Container Name],
			(SELECT Shape_Desc FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained = [Item2 TableID]  AND SD_ID_Contained =  [Item2 ID] AND Abstraction_ID = [Container Item2 AbstractionID]
				)
			) as [Item2Container Desc],
			(SELECT ShapeType_ID FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained = [Item2 TableID]  AND SD_ID_Contained =  [Item2 ID] AND Abstraction_ID =  [Container Item2 AbstractionID]
				)
			) as [Item2Container TypeID],
			(SELECT ShapeType_Name FROM ShapeType  
				WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape 
					WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
						WHERE SDTable_ID_Contained = [Item2 TableID]  AND SD_ID_Contained =  [Item2 ID] AND Abstraction_ID = [Container Item2 AbstractionID]
					)
				)
			) as  [Item2Container TypeName],
			(SELECT Abstraction_ID FROM ShapeType 
				WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape 
					WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
						WHERE SDTable_ID_Contained = [Item2 TableID]  AND SD_ID_Contained =  [Item2 ID] AND Abstraction_ID = [Container Item2 AbstractionID]
					)
				)
			)  as [Item2Container AbstractionID],

			[Item2 TableID],
			[Item2 TypeID],
			[Item2 TypeName],
			[Item2 ID],
			[Item2 Name],
			[Item2 Desc],
			[Item2 AbstractionID],

			[Assoc ID],
			[Assoc Name],
			[Assoc Desc],
			[Assoc TypeID],
			[Assoc AbstractionID],
			[Assoc Direction]

	  	FROM #TempTable3 ORDER BY [Item2Container Name], [Item2 Name], [Assoc Name]

		DROP TABLE #TempTable3

	END
