
CREATE PROCEDURE [dbo].[SetContainer2](@Table_Container as int, @ID_Container as int, @Table_Contained as int, @ID_Contained as int, @Abstraction_ID as int, @Function as int, @Contact as varchar(100)) AS

/*

OBJECTIVE
	set/reset Item to a Container

INPUTS
	@Table_Container - TableID of Item Container
	@ID_Container - ID of Item Container
	@Table_Contained - TableID of Item Contained
	@ID_Contained - ID of Item Contained
	@Abstraction_ID - Abstraction Type of this Container association
	@Function - Log Function
	@Contact - User 

OUTPUTS

TASKS
	1. IF Contained already belongs to another container, change container
		change container
		add new container-container relation if necessary, log it
	2.ELSE
		if the container does not exist
			insert into Container table	
				- setlog Container_Table, Container_ID, Function_SetContainer, Abstraction_Table, Abstraction_ID
				- setlog Container_Table, Container_ID, Function_SetContainer, Item_Table_Container, Item_ID_Container
				- setlog Container_Table, Container_ID, Function_SetContainer, Item_Table_Contained, Item_ID_Contained

NOTES
	clean-up of old container-container relation is done in sp Cleanup_Containers
*/


DECLARE @AbstractionID_Artifact int
SET @AbstractionID_Artifact = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'ARTIFACT')

/*
TASK 1: 
	1. move Item to another Container
	2. if new Container-Container relation(s) not already in DB
		
	3. check for new Container-Container relation
		3.1 get siblings of this Item
		3.2 get related Items of these siblings -> get list of their Containers
		3.3 if list does not include existing Container-Container relation
			3.3.1 delete existing Container-Container relation
			3.3.2 get new Item Container, get existing related Container
			3.3.3 insert new Container-Container relation
*/


IF  (SELECT COUNT(*) FROM Container WHERE SDTable_ID_Contained = @Table_Contained AND SD_ID_Contained = @ID_Contained AND Abstraction_ID= @Abstraction_ID AND Abstraction_ID <> @AbstractionID_Artifact) > 0 
	BEGIN
		-- TASK 1.1
		DECLARE @Container_ID int
		SET @Container_ID =(SELECT Container_ID  FROM Container WHERE SDTable_ID_Contained = @Table_Contained AND SD_ID_Contained = @ID_Contained AND Abstraction_ID= @Abstraction_ID)
		UPDATE Container 
			SET	SDTable_ID_Container = @Table_Container,
				SD_ID_Container = @ID_Container
			WHERE Container_ID = @Container_ID 
		-- TASK	1.2
		
/*
	IF @Abstraction <> (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE') AND (@ContainerIDBegin <> @ContainerIDEnd)
			BEGIN

				DECLARE @Column_int int
					SELECT DISTINCT
					SD_ID_Begin, @Column_int as "Container_Begin",
					SD_ID_End, @Column_int as "Container_End"
				INTO #Temp2
				FROM Relation 
					WHERE (SD_ID_Begin IN (SELECT SD_ID_Contained FROM Container WHERE SD_ID_Container = @ContainerIDBegin AND Abstraction_ID = @ItemAbstractionID)) OR
						(SD_ID_End IN (SELECT SD_ID_Contained FROM Container WHERE SD_ID_Container = @ContainerIDBegin AND Abstraction_ID = @ItemAbstractionID)) 
	
				UPDATE #Temp2 SET Container_Begin = (SELECT SD_ID_Container FROM Container WHERE SD_ID_Contained=SD_ID_Begin AND Abstraction_ID = @ItemAbstractionID)
				UPDATE #Temp2 SET Container_End = (SELECT SD_ID_Container FROM Container WHERE SD_ID_Contained=SD_ID_End AND Abstraction_ID = @ItemAbstractionID)
	
				IF (SELECT COUNT(*) FROM #Temp2 WHERE (Container_Begin = @ContainerIDBegin AND Container_End = @ContainerIDEnd) OR (Container_Begin = @ContainerIDEnd AND Container_End = @ContainerIDBegin)) = 0
				BEGIN
					--- IS THERE A CONTAINER RELATION ?
					IF (SELECT COUNT(*) FROM Relation WHERE SD_ID_Begin = @ContainerIDBegin AND SD_ID_End = @ContainerIDEnd AND Abstraction_ID = @ContainerAbstractionID) > 0
						BEGIN
							SET @ContainerRelationID = (SELECT Relation_ID FROM Relation WHERE (SDTable_ID_End = @ContainerTable AND SD_ID_End = @ContainerIDEnd AND SDTable_ID_Begin = @ContainerTable AND SD_ID_Begin = @ContainerIDBegin AND Abstraction_ID = @ContainerAbstractionID)  )
							EXEC SetLog @Table, @ContainerRelationID, @Function, NULL, NULL, @Contact
							DELETE FROM Relation WHERE Relation_ID = @ContainerRelationID
						END
					ELSE IF (SELECT COUNT(*) FROM Relation WHERE SD_ID_Begin = @ContainerIDEnd AND SD_ID_End = @ContainerIDBegin AND Abstraction_ID = @ContainerAbstractionID) > 0
					--- TRY LOOKING IN REVERSE DIRECTION
						BEGIN
							SET @ContainerRelationID = (SELECT Relation_ID FROM Relation WHERE (SDTable_ID_End = @ContainerTable AND SD_ID_End = @ContainerIDBegin AND SDTable_ID_Begin = @ContainerTable AND SD_ID_Begin = @ContainerIDEnd AND Abstraction_ID = @ContainerAbstractionID) )
							EXEC SetLog @Table, @ContainerRelationID, @Function, NULL, NULL, @Contact
							DELETE FROM Relation WHERE Relation_ID = @ContainerRelationID
						END
				END

				DROP TABLE #Temp2
			END

*/

/*
		--- IF OBJECT/STEP RELATION, CHECK TO SEE IF SYSTEM/BP RELATION EXISTS, IF NOT, CREATE IT
		IF @Abstraction_ID IN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT' OR Abstraction_Name ='STEP')  
			BEGIN
				SET @Container_Abstraction = 
					CASE
						WHEN @Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT')  THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEMOBJECT')
						WHEN @Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP')  THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESSSTEP')
					END
				SET @TempID_Begin  = (SELECT SD_ID_Container FROM Container WHERE Abstraction_ID = @Container_Abstraction AND SDTable_ID_Contained = @Table_Begin AND SD_ID_Contained = @ID_Begin )
				SET @TempID_End  = (SELECT SD_ID_Container FROM Container WHERE Abstraction_ID = @Container_Abstraction AND SDTable_ID_Contained = @Table_End AND SD_ID_Contained = @ID_End )
				IF @TempID_Begin <> @TempID_End 
					--- DONT BOTHER IF FROM SAME SYSTEM
					BEGIN
						SET @TempAbstraction =
							CASE
								WHEN @Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT')  THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEM')
								WHEN @Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP')  THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESS')
							END
						IF ((SELECT COUNT(*) FROM Relation WHERE SDTable_ID_Begin = @Table_Begin AND SD_ID_Begin = @TempID_Begin AND SDTable_ID_End = @Table_End AND SD_ID_End = @TempID_End) = 0 )
							AND ((SELECT COUNT(*) FROM Relation WHERE SDTable_ID_Begin = @Table_End AND SD_ID_Begin = @TempID_End AND SDTable_ID_End = @Table_Begin AND SD_ID_End = @TempID_Begin) = 0 )
							--- CREATE SYSTEM RELATION
							BEGIN
								INSERT INTO RELATION VALUES (@Table_Begin, @TempID_Begin, @Table_End, @TempID_End, NULL,  NULL, @TempAbstraction)
								SET @New  = SCOPE_IDENTITY()
								EXEC SetLog @Table, @New, @Function, NULL, NULL, @Contact
								EXEC SetLog @Table, @New, @Function, @Table_Abstraction, @TempAbstraction, @Contact
								EXEC SetLog @Table, @New, @Function, @Table_Begin, @TempID_Begin, @Contact
								EXEC SetLog @Table, @New, @Function, @Table_End, @TempID_End, @Contact
							END
					END
			END


*/
				
	END
ELSE
	BEGIN
	IF (SELECT COUNT(*) FROM Container WHERE SDTable_ID_Container = @Table_Container AND SD_ID_Container = @ID_Container AND SDTable_ID_Contained = @Table_Contained AND SD_ID_Contained = @ID_Contained AND Abstraction_ID= @Abstraction_ID) = 0
		BEGIN
			DECLARE @Table int
			DECLARE @New int
			DECLARE @AbstractionTable int
	
					
			INSERT INTO Container VALUES (@Table_Container, @ID_Container, @Table_Contained, @ID_Contained, @Abstraction_ID)
			SET @Table = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Container')
			SET @New  = SCOPE_IDENTITY()
			SET @AbstractionTable = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Abstraction')
			EXEC SetLog @Table, @New, @Function, @AbstractionTable, @Abstraction_ID, @Contact
			EXEC SetLog @Table, @New, @Function, @Table_Container, @ID_Container, @Contact
			EXEC SetLog @Table, @New, @Function, @Table_Contained, @ID_Contained, @Contact
	
			-- IF THIS IS A SYSTEM OR BUSINESS PROCESS SHAPE, AND AN ARTIFACT CONTAINED : PROPAGATE CONTAINER TO ITS OBJECTS AND STEPS
			IF @Table_Contained = (SELECT SDTable_ID FROM SDTABLE WHERE SDTable_Name = 'Artifact') AND @Table_Container = (SELECT SDTable_ID FROM SDTABLE WHERE SDTable_Name = 'Shape')
				BEGIN
					DECLARE @ContainedShapeType int
					SET @ContainedShapeType = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID_Container)
					IF  @ContainedShapeType IN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name IN ('SYSTEM','BUSINESSPROCESS'))
						BEGIN
							-- GET ALL CONTAINED SHAPES INTO A TEMPTABLE FIRST
							DECLARE @ContainedAbstraction int
							SET @ContainedAbstraction =
								CASE
									WHEN @ContainedShapeType = (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'SYSTEM') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEMOBJECT')
									WHEN @ContainedShapeType = (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'BUSINESSPROCESS') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESSSTEP')
								END
							SELECT 
								SDTable_ID_Contained as "SDTable_ID_Container",
								SD_ID_Contained as "SD_ID_Container",
								@Table_Contained as "SDTable_ID_Contained",
								@ID_Contained as "SD_ID_Contained",	
								@Abstraction_ID as "Abstraction_ID"
							INTO #TempTable
							FROM Container WHERE SDTable_ID_Container = @Table_Container AND SD_ID_Container = @ID_Container AND Abstraction_ID = @ContainedAbstraction											
							-- INSERT INTO CONTAINER TABLE
	
							INSERT INTO Container(SDTable_ID_Container, SD_ID_Container, SDTable_ID_Contained, SD_ID_Contained, Abstraction_ID)
								SELECT  SDTable_ID_Container, SD_ID_Container, SDTable_ID_Contained, SD_ID_Contained, Abstraction_ID FROM #TempTable
	
							-- CANT FIND A CLEAN WAY TO INSERT THIS INTO THE LOG TABLE SO DONE TRYING FOR NOW
	
	
						END
	
				END 
		END
	END
