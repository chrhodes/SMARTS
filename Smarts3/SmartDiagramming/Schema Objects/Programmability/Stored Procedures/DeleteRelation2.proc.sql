

CREATE PROCEDURE [dbo].[DeleteRelation2] (@RelationID as int, @Table as int, @ID as int, @Abstraction as int, @Function as int, @Contact as varchar(500)) AS


IF (SELECT COUNT(*) FROM Relation WHERE Relation_ID = @ID) > 0
	BEGIN
		DECLARE @ItemAbstractionID int 			
		DECLARE @ItemTable int
		DECLARE @ItemIDBegin int 
		DECLARE @ItemIDEnd int 
		DECLARE @ContainerAbstractionID int 			
		DECLARE @ContainerRelationID int 			
		DECLARE @ContainerTable int
		DECLARE @ContainerIDBegin int
		DECLARE @ContainerIDEnd int 			
	
		SET @ItemAbstractionID =
		CASE 
			WHEN @Abstraction = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESSSTEP')
			WHEN @Abstraction = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEMOBJECT')
		END
		SET @ContainerAbstractionID =
		CASE 
			WHEN @Abstraction = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESS')
			WHEN @Abstraction = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEM')
		END
		SET @ItemIDBegin = (SELECT SD_ID_Begin FROM Relation WHERE Relation_ID = @ID)
		SET @ItemIDEnd = (SELECT SD_ID_End FROM Relation WHERE Relation_ID = @ID)
		SET @ItemTable = (SELECT SDTable_ID_Begin FROM Relation WHERE Relation_ID = @ID)
		SET @ContainerIDBegin= (SELECT SD_ID_Container FROM Container WHERE SD_ID_Contained = @ItemIDBegin AND SDTable_ID_Contained = @ItemTable AND Abstraction_ID = @ItemAbstractionID) 
		SET @ContainerIDEnd = (SELECT SD_ID_Container FROM Container WHERE SD_ID_Contained = @ItemIDEnd AND SDTable_ID_Contained = @ItemTable AND Abstraction_ID = @ItemAbstractionID) 
		SET @ContainerTable = (SELECT SDTable_ID_Container FROM Container WHERE SD_ID_Contained = @ItemIDBegin AND SDTable_ID_Contained = @ItemTable AND Abstraction_ID = @ItemAbstractionID) 
		EXEC SetLog @Table, @ID, @Function, NULL, NULL, @Contact
		DELETE FROM Relation WHERE Relation_ID = @ID
	
		--- IF THIS WAS THE ONLY RELATION LINKING THE CONTAINER RELATION, DELETE CONTAINER RELATION
		--- ONLY KEEP TRACK OF SYSTEM AND BUSINESS PROCESS CONTAINER RELATIONS
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
		END
/*
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
					SET @ContainerRelationID = (SELECT Relation_ID FROM Relation WHERE (SDTable_ID_End = @ContainerTable AND SD_ID_End = @ContainerIDEnd AND SDTable_ID_Begin = @ContainerTable AND SD_ID_Begin = @ContainerIDBegin AND Abstraction_ID = @ContainerAbstractionID) OR (SDTable_ID_End = @ContainerTable AND SD_ID_End = @ContainerIDEnd AND SDTable_ID_Begin = @ContainerTable AND SD_ID_Begin = @ContainerIDBegin AND Abstraction_ID = @ContainerAbstractionID) )
					IF @ContainerRelationID IS NOT NULL
					BEGIN
						select * from #temp2
						EXEC SetLog @Table, @ContainerRelationID, @Function, NULL, NULL, @Contact
						DELETE FROM Relation WHERE Relation_ID = @ContainerRelationID 
					END
				END
*/
/*
			
			IF (SELECT COUNT(*) FROM #Temp2 WHERE Container_Begin = @ContainerIDBegin AND Container_End = @ContainerIDEnd) = 0
				BEGIN
					-- SINCE SYSTEM/BUSINESS RELATIONS ARE NOT DIRECTION-SENSITIVE, CHECK FOR REVERSE ORDER
					DECLARE @Column_int2 int
						SELECT DISTINCT
						SD_ID_Begin, @Column_int2 as "Container_Begin",
						SD_ID_End, @Column_int2 as "Container_End"
					INTO #Temp3
					FROM Relation 
						WHERE (SD_ID_Begin IN (SELECT SD_ID_Contained FROM Container WHERE SD_ID_Container = @ContainerIDBegin AND Abstraction_ID = @ItemAbstractionID)) OR
							(SD_ID_End IN (SELECT SD_ID_Contained FROM Container WHERE SD_ID_Container = @ContainerIDBegin AND Abstraction_ID = @ItemAbstractionID)) 

					UPDATE #Temp3 SET Container_Begin = (SELECT SD_ID_Container FROM Container WHERE SD_ID_Contained=SD_ID_Begin AND Abstraction_ID = @ItemAbstractionID)
					UPDATE #Temp3 SET Container_End = (SELECT SD_ID_Container FROM Container WHERE SD_ID_Contained=SD_ID_End AND Abstraction_ID = @ItemAbstractionID)

					IF (SELECT COUNT(*) FROM #Temp3 WHERE Container_Begin = @ContainerIDBegin AND Container_End = @ContainerIDEnd) = 0
						-- ITEM RELATION WAS THE ONLY RELATION SYSTEM-WISE , DELETE CONTAINER RELATION	
						BEGIN
							IF @ContainerRelationID IS NOT NULL
							BEGIN
								EXEC SetLog @Table, @ContainerRelationID, @Function, NULL, NULL, @Contact
								DELETE FROM Relation WHERE Relation_ID = @ContainerRelationID
							END
						END
				END
*/
