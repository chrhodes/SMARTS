
CREATE PROCEDURE [dbo].[SetRelation](@ID as int, @Relation as varchar(100), @Table_Begin as int, @ID_Begin as int, @Table_End as int, @ID_End as int, @Abstraction_ID as int, @Function as int, @Contact as varchar(100)) AS

/*

OBJECTIVE
	set/resets a relation

INPUTS
	@ID - Relation ID
	@Relation - name of relation
	@Table_Begin - table of the beginning ID (FROM)
	@ID_Begin - beginning ID (FROM)
	@Table_End - table of the end ID (TO)
	@ID_End - end ID (TO)
	@AbstractionID - abstraction type of relation
	@FUNCTION - LOGFUNCTION_SET_RELATION
	@Contact - user

OUTPUTS
	
TASKS
	1. do not allow for relation to connect to itself
	2. if @ID is null, this is to be a new relation, INSERT into Relations table
	3. prep local vars for LOG entry
	4. LOG entry : relation name
	5. LOG entry : relation abstraction
	6. LOG entry : relation beginning
	7. LOG entry : relation end
	8. IF this is an OBJECT/STEP RELATION, a relation between their containers might be necessary
		1. IF they have different containers,
			1. IF this container relation does not exist
			2. INSERT into Relations table
			3. LOG entry : relation name
			4. LOG entry : relation abstraction
			5. LOG entry : relation beginning
			6. LOG entry : relation end

NOTES
	currently, this is only used to set (create) a new relation, so NULL should be the @ID input

*/


BEGIN TRAN

--- 1
IF @Table_Begin <> @Table_End OR @ID_Begin <> @ID_End 
BEGIN
	--- 2
	IF @ID IS NULL 
	BEGIN
		INSERT INTO RELATION VALUES (@Table_Begin, @ID_Begin, @Table_End, @ID_End, @Relation,  NULL, @Abstraction_ID)
		--- 3
		DECLARE @New int
		SET @New  = SCOPE_IDENTITY()
		DECLARE @Table int
		SET @Table = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Relation')
		DECLARE @Table_Abstraction int
		SET @Table_Abstraction = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Abstraction')
		--- 4
		EXEC SetLog @Table, @New, @Function, @Relation, NULL, @Contact
		--- 5
		EXEC SetLog @Table, @New, @Function, @Table_Abstraction, @Abstraction_ID, @Contact
		--- 6
		EXEC SetLog @Table, @New, @Function, @Table_Begin, @ID_Begin, @Contact
		--- 7
		EXEC SetLog @Table, @New, @Function, @Table_End, @ID_End, @Contact
	

		--- 8
		IF @Abstraction_ID IN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT' OR Abstraction_Name ='STEP')  
			BEGIN
				DECLARE @Container_Abstraction int
				SET @Container_Abstraction = 
					CASE
						WHEN @Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT')  THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEMOBJECT')
						WHEN @Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP')  THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESSSTEP')
					END
				DECLARE @TempID_Begin int
				SET @TempID_Begin  = (SELECT SD_ID_Container FROM Container WHERE Abstraction_ID = @Container_Abstraction AND SDTable_ID_Contained = @Table_Begin AND SD_ID_Contained = @ID_Begin )
				DECLARE @TempID_End int
				SET @TempID_End  = (SELECT SD_ID_Container FROM Container WHERE Abstraction_ID = @Container_Abstraction AND SDTable_ID_Contained = @Table_End AND SD_ID_Contained = @ID_End )
				--- 8.1
				IF @TempID_Begin <> @TempID_End 
					BEGIN
						DECLARE @TempAbstraction int
						SET @TempAbstraction =
							CASE
								WHEN @Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT')  THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEM')
								WHEN @Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP')  THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESS')
							END
						--- 8.1.1
						IF ((SELECT COUNT(*) FROM Relation WHERE SDTable_ID_Begin = @Table_Begin AND SD_ID_Begin = @TempID_Begin AND SDTable_ID_End = @Table_End AND SD_ID_End = @TempID_End AND Abstraction_ID = @TempAbstraction) = 0 )
							AND ((SELECT COUNT(*) FROM Relation WHERE SDTable_ID_Begin = @Table_End AND SD_ID_Begin = @TempID_End AND SDTable_ID_End = @Table_Begin AND SD_ID_End = @TempID_Begin AND Abstraction_ID = @TempAbstraction) = 0 )
							--- CREATE SYSTEM RELATION
							BEGIN
								--- 8.1.2
								INSERT INTO RELATION VALUES (@Table_Begin, @TempID_Begin, @Table_End, @TempID_End, NULL,  NULL, @TempAbstraction)
								SET @New  = SCOPE_IDENTITY()
								--- 8.1.3
								EXEC SetLog @Table, @New, @Function, NULL, NULL, @Contact
								--- 8.1.4
								EXEC SetLog @Table, @New, @Function, @Table_Abstraction, @TempAbstraction, @Contact
								--- 8.1.5
								EXEC SetLog @Table, @New, @Function, @Table_Begin, @TempID_Begin, @Contact
								--- 8.1.6
								EXEC SetLog @Table, @New, @Function, @Table_End, @TempID_End, @Contact
							END
					END
			END
	END
END

COMMIT TRAN
