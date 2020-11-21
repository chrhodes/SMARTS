
CREATE PROCEDURE [dbo].[GetItem_Relation] (@Relation as int, @Table as int, @ID as int, @Abstraction as int) 


/*

OBJECTIVE
	retrieve relation info

INPUTS
	@Relation - relation ID to search for
	@Table - Table to search for
	@ID - ID to search for
	@Abstraction - type of relation

OUTPUTS
	Assoc_ID,Assoc_Name,Assoc_Desc,Assoc_TypeID,Assoc_AbstractionID,Assoc_Direction,
	Container_ID_Principal
	Principal_TableID,Principal_ID,Principal_Name,Principal_Desc,Principal_TypeID,Principal_TypeName,Principal_AbstractionID,Principal_Environment,
	PrincipalContainer_TableID,PrincipalContainer_ID,PrincipalContainer_Name,PrincipalContainer_Desc,PrincipalContainer_TypeID,PrincipalContainer_TypeName,PrincipalContainer_AbstractionID,
	Container_ID_Related
	Related_TableID,Related_ID,Related_Name,Related_Desc,Related_TypeID,Related_TypeName,Related_AbstractionID,Related_Environment,
	RelatedContainer_TableID,RelatedContainer_ID,RelatedContainer_Name,RelatedContainer_Desc,RelatedContainer_TypeID,RelatedContainer_TypeName,RelatedContainer_AbstractionID

TASKS
	1. IF @Relation IS NOT NULL get that Relation only
		1. create a temptable first with just the items
		2. ADD TEMP COLUMN OF Container_ID to look for for each item
		3. DELETE temptable
	2. ELSE get all Relation of that item, setting Begin as Principal and End as Related
		1. create a temptable first with just the items
		2. ADD TEMP COLUMN OF Container_ID to look for for each item
		3. IF abstraction is specified, delete rows that do not match
		4. FILL in previously NULL columns
		5. DELETE temptable

NOTES

*/

AS


DECLARE @Column_var varchar(2000)
DECLARE @Column_int int

--- 1
IF @Relation  IS NOT NULL
	BEGIN
                               ---- 1.1
		SELECT  DISTINCT
			Relation_ID as "Assoc_ID",
			IsNULL(Relation_Name,'') as "Assoc_Name",	
			IsNULL(Relation_Desc,'') as "Assoc_Desc",
			(CASE 
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'STEPRELATION')
				WHEN Abstraction_ID =  (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'DEVICERELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'OBJECTRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESS') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'BUSINESSRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEM') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'SYSTEMRELATION')
			 END) as "Assoc_TypeID",
			Abstraction_ID as "Assoc_AbstractionID",
			"TO" as "Assoc_Direction",

			--- 1.2
			(SELECT Container_ID FROM Container 
				WHERE SDTable_ID_Contained = SDTable_ID_Begin 
					AND SD_ID_Contained = SD_ID_Begin 
					AND Container.Abstraction_ID = (CASE 
					WHEN  (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @Relation) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESSSTEP')
					WHEN  (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @Relation) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE')
					WHEN  (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @Relation) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT')THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEMOBJECT')
					 END)
			) as "Container_ID_Principal",
	
			SDTable_ID_Begin  as "Principal_TableID",
			SD_ID_Begin as "Principal_ID",
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = SD_ID_Begin) as "Principal_Name",
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = SD_ID_Begin) as "Principal_Desc",
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Begin) as "Principal_TypeID",
			(SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Begin)) as "Principal_TypeName",
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Begin))  as "Principal_AbstractionID",
			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue 
				WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
					WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') 
						AND ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Begin))
						 AND SDTable_ID = SDTable_ID_Begin 
						AND SD_ID = SD_ID_Begin) as "Principal_Environment",

			--- 1.2
			(SELECT Container_ID FROM Container 
				WHERE SDTable_ID_Contained = SDTable_ID_End
					AND SD_ID_Contained = SD_ID_End
					AND Abstraction_ID = (CASE 
					WHEN (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @Relation) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESSSTEP')
					WHEN (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @Relation) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE')
					WHEN (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @Relation) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT')THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEMOBJECT')
				 END)
			) as "Container_ID_Related",

			SDTable_ID_End as "Related_TableID",
			SD_ID_End as "Related_ID",
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = SD_ID_End) as "Related_Name",
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = SD_ID_End) as "Related_Desc",
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_End) as "Related_TypeID",
			(SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_End)) as "Related_TypeName",
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_End))  as "Related_AbstractionID",
			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue 
				WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
					WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') 
						AND ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_End))
						 AND SDTable_ID = SDTable_ID_End 
						AND SD_ID = SD_ID_End) as "Related_Environment"
	
		 INTO #TempTable1 
		FROM Relation NOLOCK
		WHERE Relation_ID = @Relation

		/* * * 2nd table has items' container info  * * */
		SELECT  DISTINCT *,

			(SELECT SDTable_ID_Container FROM Container WHERE Container_ID = Container_ID_Principal) as "PrincipalContainer_TableID",
			(SELECT SD_ID_Container FROM Container WHERE  Container_ID = Container_ID_Principal) as "PrincipalContainer_ID",
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Principal)) as "PrincipalContainer_Name",
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Principal)) as "PrincipalContainer_Desc",
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Principal)) as "PrincipalContainer_TypeID",
			(SELECT ShapeType_Name FROM ShapeType  WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE  Container_ID = Container_ID_Principal))) as "PrincipalContainer_TypeName",
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Principal)))  as "PrincipalContainer_AbstractionID",

			(SELECT SDTable_ID_Container FROM Container WHERE Container_ID = Container_ID_Related) as "RelatedContainer_TableID",
			(SELECT SD_ID_Container FROM Container WHERE  Container_ID = Container_ID_Related) as "RelatedContainer_ID",
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Related)) as "RelatedContainer_Name",
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Related)) as "RelatedContainer_Desc",
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Related)) as "RelatedContainer_TypeID",
			(SELECT ShapeType_Name FROM ShapeType  WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE  Container_ID = Container_ID_Related))) as "RelatedContainer_TypeName",
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Related)))  as "RelatedContainer_AbstractionID"
	
	  	FROM #TempTable1 ORDER BY RelatedContainer_Name, Related_Name, Assoc_Name
		
		--- 1.3
		DROP TABLE #TempTable1

	END
--- 2
ELSE

	BEGIN
		--- 2.1

		DECLARE @NULL_varchar  VARCHAR(50)
		DECLARE @NULL_int  INT

		SELECT  DISTINCT

			Relation_ID  as "Assoc_ID",
			Relation_Name as "Assoc_Name",	
			Relation_Desc as  "Assoc_Desc",

			(CASE 
				WHEN (Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP')) THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'STEPRELATION')
				WHEN (Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE')) THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'DEVICERELATION')
				WHEN (Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT')) THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'OBJECTRELATION')
				WHEN (Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESS')) THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'BUSINESSRELATION')
				WHEN (Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEM')) THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'SYSTEMRELATION')
			 END) as "Assoc_TypeID",

			Abstraction_ID as "Assoc_AbstractionID",
			(CASE
				WHEN SD_ID_Begin = @ID THEN 'TO'
				ELSE  'FROM'
			END) as "Assoc_Direction",

			@NULL_int as "Container_ID_Principal",
	

			@Table  as "Principal_TableID",
			@ID as "Principal_ID",
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = @ID) as "Principal_Name",
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = @ID) as "Principal_Desc",
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID) as "Principal_TypeID",
			(SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) as "Principal_TypeName",
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID))  as "Principal_AbstractionID",

			@NULL_varchar as "Principal_Environment",

			@NULL_int as "Container_ID_Related",

			(CASE
				WHEN @ID = SD_ID_End THEN SDTable_ID_Begin
				ELSE  SDTable_ID_End
			END) as "Related_TableID",
			(CASE
				WHEN @ID = SD_ID_End THEN SD_ID_Begin
				ELSE  SD_ID_End
			END) as "Related_ID",
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = 
				(CASE
					WHEN @ID = SD_ID_End THEN SD_ID_Begin
					ELSE  SD_ID_End
				END)) as "Related_Name",
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID =
				(CASE
					WHEN @ID = SD_ID_End THEN SD_ID_Begin
					ELSE  SD_ID_End
				END)) as "Related_Desc",
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = 
				(CASE
					WHEN @ID = SD_ID_End THEN SD_ID_Begin
					ELSE  SD_ID_End
				END)) as "Related_TypeID",
			(SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = 
				(CASE
					WHEN @ID = SD_ID_End THEN SD_ID_Begin
					ELSE  SD_ID_End
				END))) as "Related_TypeName",
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = 
				(CASE
					WHEN @ID = SD_ID_End THEN SD_ID_Begin
					ELSE  SD_ID_End
				END)))  as "Related_AbstractionID",

		@NULL_varchar as "Related_Environment"

		 INTO #TempTable3 
		FROM Relation NOLOCK
		WHERE (SDTable_ID_Begin = @Table AND SD_ID_Begin = @ID) OR (SDTable_ID_End = @Table AND SD_ID_End = @ID)


		--- 2.2

		IF @Abstraction IS NOT NULL
			BEGIN
				DELETE FROM #TempTable3 WHERE Assoc_AbstractionID <> @Abstraction
			END

		--- 2.3

		UPDATE #TempTable3 SET Container_ID_Principal =
			(SELECT Container_ID FROM Container 
				WHERE SDTable_ID_Contained = #TempTable3.Principal_TableID
					AND SD_ID_Contained = #TempTable3.Principal_ID
					AND Abstraction_ID = (CASE 
					WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESSSTEP')
					WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE')
					WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEMOBJECT')
				 END)
			) 

		UPDATE #TempTable3 SET Principal_Environment =
			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue 
				WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
					WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') 
						AND ShapeType_ID = #TempTable3.Principal_TypeID)
						 AND SDTable_ID = #TempTable3.Principal_TableID
						AND SD_ID = #TempTable3.Principal_ID) 

		UPDATE #TempTable3 SET Container_ID_Related =
			(SELECT Container_ID FROM Container 
				WHERE SDTable_ID_Contained = #TempTable3.Related_TableID
					AND SD_ID_Contained = #TempTable3.Related_ID
					AND Abstraction_ID = (CASE 
					WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESSSTEP')
					WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE')
					WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEMOBJECT')
				 END)
			) 

		UPDATE #TempTable3 SET Related_Environment =
			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue 
				WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
					WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') 
						AND ShapeType_ID = #TempTable3.Related_TypeID)
						 AND SDTable_ID = #TempTable3.Related_TableID
						AND SD_ID = #TempTable3.Related_ID) 

		/* * * 2nd table has items' container info  * * */


		SELECT  DISTINCT *,

			(SELECT SDTable_ID_Container FROM Container WHERE Container_ID = Container_ID_Principal) as "PrincipalContainer_TableID",
			(SELECT SD_ID_Container FROM Container WHERE  Container_ID = Container_ID_Principal) as "PrincipalContainer_ID",
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Principal)) as "PrincipalContainer_Name",
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Principal)) as "PrincipalContainer_Desc",
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Principal)) as "PrincipalContainer_TypeID",
			(SELECT ShapeType_Name FROM ShapeType  WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE  Container_ID = Container_ID_Principal))) as "PrincipalContainer_TypeName",
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Principal)))  as "PrincipalContainer_AbstractionID",

			(SELECT SDTable_ID_Container FROM Container WHERE Container_ID = Container_ID_Related) as "RelatedContainer_TableID",
			(SELECT SD_ID_Container FROM Container WHERE  Container_ID = Container_ID_Related) as "RelatedContainer_ID",
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Related)) as "RelatedContainer_Name",
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Related)) as "RelatedContainer_Desc",
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Related)) as "RelatedContainer_TypeID",
			(SELECT ShapeType_Name FROM ShapeType  WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE  Container_ID = Container_ID_Related))) as "RelatedContainer_TypeName",
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Related)))  as "RelatedContainer_AbstractionID"
	
	  	FROM #TempTable3  ORDER BY RelatedContainer_Name, Related_Name, Assoc_Name
		
		--- 2.4
		DROP TABLE #TempTable3

	END
