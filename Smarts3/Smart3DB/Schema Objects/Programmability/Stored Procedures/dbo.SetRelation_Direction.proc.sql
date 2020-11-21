
CREATE PROCEDURE [dbo].[SetRelation_Direction] (@Table as int, @ID as int, @Function as int, @Begin_ID as int, @Contact as varchar(500)) 
AS

/*

OBJECTIVE
	set/reset direction for a  Relation

INPUTS
	@Table -TABLE_RELATION
	@ID - Relation ID
	@Function - LOGFUNCTION_SET_RELATION
	@Begin_ID - gets the current BeginID, to be switched to EndID later
	@Contact - user

OUTPUTS
	
TASKS
	1. prep local vars for direction switch
	2. UPDATE relation
	3. LOG entry : "NULL,NULL" SHOWS THAT RELATION HAS CHANGED DIRECTION
	4. LOG entry : Begin 
	5. LOG entry : End

NOTES

*/

--- 1
DECLARE @Table_Begin int
SET @Table_Begin = 
	CASE 
		WHEN @Begin_ID = (SELECT SD_ID_Begin FROM Relation WHERE Relation_ID = @ID) THEN (SELECT SDTable_ID_End FROM Relation WHERE Relation_ID = @ID)
		ELSE (SELECT SDTable_ID_Begin FROM Relation WHERE Relation_ID = @ID)
	END

DECLARE @Table_End int
SET @Table_End = 
	CASE 
		WHEN @Begin_ID = (SELECT SD_ID_Begin FROM Relation WHERE Relation_ID = @ID) THEN (SELECT SDTable_ID_Begin FROM Relation WHERE Relation_ID = @ID)
		ELSE (SELECT SDTable_ID_End FROM Relation WHERE Relation_ID = @ID)
	END

DECLARE @ID_Begin int
SET @ID_Begin = 
	CASE 
		WHEN @Begin_ID = (SELECT SD_ID_Begin FROM Relation WHERE Relation_ID = @ID) THEN (SELECT SD_ID_End FROM Relation WHERE Relation_ID = @ID)
		ELSE (SELECT SD_ID_Begin FROM Relation WHERE Relation_ID = @ID)
	END

DECLARE @ID_End int
SET @ID_End = 
	CASE 
		WHEN  @Begin_ID = (SELECT SD_ID_Begin FROM Relation WHERE Relation_ID = @ID) THEN @Begin_ID
		ELSE (SELECT SD_ID_End FROM Relation WHERE Relation_ID = @ID)
	END

BEGIN TRAN

--- 2
UPDATE Relation SET SDTable_ID_Begin = @Table_Begin, SD_ID_Begin = @ID_Begin, SDTable_ID_End = @Table_End, SD_ID_End = @ID_End WHERE Relation_ID = @ID

--- 3
EXEC SetLog @Table, @ID, @Function, NULL, NULL, @Contact
--- 4
EXEC SetLog @Table, @ID, @Function, @Table_Begin, @ID_Begin, @Contact
--- 5
EXEC SetLog @Table, @ID, @Function, @Table_End, @ID_End, @Contact

COMMIT TRAN
