
CREATE PROCEDURE [dbo].[DeleteItem](@Table as int, @ID as int, @Function as int, @Name as varchar(1000), @Note as varchar(1000), @Contact as varchar(500), @NewID as int out) AS

/*

OBJECTIVE
	to delete an item shape

INPUTS
	@Table - Shape Table ID
	@ID - Shape ID
	@Function - LOGFUNCTION_DELETE_SHAPE
	@Name - Shape Name
	@Name - Deletion Comment
	@Contact - User 

OUTPUTS
	@NewID  : RETURNS 0  if items already has existing assoc(s), 1 if item does not

TASKS
	1. IF item does not have existing relations
		1. RETURN @NewID as 0
	ELSE 
	    2. IF item has dependent containees
		1. RETURN @NewID as 0
	    3. ELSE
		1.CREATE a temptable of assocations to delete
			1. SELECT ASSOCS OF IPs TO BE DELETED
			2. SELECT ASSOCS OF IPs CONTAINED  TO BE DELETED
			3. SELECT ASSOCS OF ARTIFACT CONTAINED TO BE DELETED
			4. SELECT LIST OF ATTRIBUTEVALUEs TO BE DELETED
			5. SELECT ASSOC OF THE SHAPE THAT CONTAINS IT TO BE DELETED
			6. SELECT SHAPE TO BE DELETED
		2. INSERT DELETION ENTRY INTO LOG
		3. DELETE IPs AND SHAPE MATCHING THOSE IN THE TEMPTABLE
		4. DELETE ATTRIBUTE VALUES MATCHING THOSE IN THE TEMPTABLE
		5. DELETE SHAPE CONTAINER MATCHING THOSE IN THE TEMPTABLE
		6. RETURN @NewID as 1

NOTES
	--- undeleteable items return 0  (FALSE), user is notified that deletion was unsuccessful
	--- deleteable items return 1 (TRUE), user is notified that deletion was successful

*/

	IF (SELECT COUNT(*) FROM Relation WHERE (SDTable_ID_Begin = @Table AND SD_ID_Begin = @ID) OR (SDTable_ID_End = @Table AND SD_ID_End = @ID)) > 0
		-- 1.1
		BEGIN
			SET @NewID = 0	
		END
	ELSE
		BEGIN
			IF (SELECT COUNT(*) FROM Container WHERE (SDTable_ID_Container = @Table AND SD_ID_Container = @ID) AND (Abstraction_ID NOT IN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name IN ('ARTIFACT','IP')))) > 0		
				--- 2.1
				BEGIN
					SET @NewID = 0				
				END
			ELSE
				BEGIN
					-- 3.1
					DECLARE @ShapeTableID INT
					DECLARE @ContainerTableID INT
					SET @ShapeTableID =  (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Shape')
					SET @ContainerTableID = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Container')
					-- 3.1.1
					SELECT 
						SDTable_ID_Contained as "DeleteTable",
						SD_ID_Contained as "DeleteID",
						(SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_DELETE_SHAPE') as "DeleteFunction",
						@Name as "DeleteValue",
						@Note as "DeleteNote",
						@Contact as "DeleteContact",
						getDate() as "DeleteDateTime"
					INTO #TempTable
					FROM Container
					WHERE SDTable_ID_Contained =@ShapeTableID AND SDTable_ID_Container = @Table and SD_ID_Container = @ID AND Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'IP')
					-- 3.1.2 
					UNION SELECT 
						@ContainerTableID as "DeleteTable",
						Container_ID as "DeleteID",
						(SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_DELETE_CONTAINER') as "DeleteFunction",
						@Name as "DeleteValue",
						@Note as "DeleteNote",
						@Contact as "DeleteContact",
						getDate() as "DeleteDateTime"
					FROM Container
					WHERE SDTable_ID_Contained = @ShapeTableID AND SDTable_ID_Container = @Table and SD_ID_Container = @ID AND Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'IP')
					-- 3.1.3
					UNION SELECT 
						@ContainerTableID as "DeleteTable",
						Container_ID as "DeleteID",
						(SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_DELETE_CONTAINER') as "DeleteFunction",
						@Name as "DeleteValue",
						@Note as "DeleteNote",
						@Contact as "DeleteContact",
						getDate() as "DeleteDateTime"
					FROM Container
					WHERE SDTable_ID_Contained = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'ARTIFACT') AND SDTable_ID_Container = @Table and SD_ID_Container = @ID AND Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'ARTIFACT')
					-- 3.1.4 
					UNION SELECT 
						(SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'AttributeValue') as "DeleteTable",
						AttributeValue_ID as "DeleteID",
						(SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_DELETE_ATTRIBUTEVALUE') as "DeleteFunction",
						@Name as "DeleteValue",
						@Note as "DeleteNote",
						@Contact as "DeleteContact",
						getDate() as "DeleteDateTime"
					FROM AttributeValue
					WHERE SDTable_ID = @Table AND SD_ID = @ID 
					--  3.1.5
					UNION SELECT 
						@ContainerTableID as "DeleteTable",
						Container_ID as "DeleteID",
						(SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_DELETE_CONTAINER') as "DeleteFunction",
						@Name as "DeleteValue",
						@Note as "DeleteNote",
						@Contact as "DeleteContact",
						getDate() as "DeleteDateTime"
					FROM Container
					WHERE SDTable_ID_Contained = @Table and SD_ID_Contained = @ID 
					-- 3.1.6 
					UNION SELECT
						@Table as "DeleteTable",
						@ID as "DeleteID",
						@Function as "DeleteFunction",
						@Name as "DeleteValue",
						@Note as "DeleteNote",
						@Contact as "DeleteContact",
						getDate() as "DeleteDateTime"
					FROM Shape
					WHERE Shape_ID = @ID
					
					-- 3.2
					INSERT INTO SDLog(SDTable_ID, SD_ID, SDLogFunction_ID, SDLog_Value, SDLog_Note, SDLog_Contact, SDLog_DateTime)
						SELECT   DeleteTable, DeleteID, DeleteFunction, DeleteValue, DeleteNote, DeleteContact, DeleteDateTime FROM #TempTable
					-- 3.3
					DELETE FROM Shape WHERE Shape_ID IN (SELECT DeleteID FROM #TempTable WHERE DeleteFunction = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_DELETE_SHAPE') )
					-- 3.4
					DELETE FROM AttributeValue WHERE AttributeValue_ID IN (SELECT DeleteID FROM #TempTable WHERE DeleteFunction = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_DELETE_ATTRIBUTEVALUE') )
					-- 3.5
					DELETE FROM Container WHERE Container_ID IN (SELECT DeleteID FROM #TempTable WHERE DeleteFunction = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_DELETE_CONTAINER') )
					-- 3.6
					SET @NewID = 1
		
				END
	END
