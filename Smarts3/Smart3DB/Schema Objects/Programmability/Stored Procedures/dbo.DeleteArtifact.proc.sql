

CREATE PROCEDURE [dbo].[DeleteArtifact](@Table as int, @ID as int, @Function as int, @Name as varchar(1000), @Note as varchar(1000), @Contact as varchar(500)) AS

/*

OBJECTIVE
	TO DELETE AN ARTIFACT

INPUTS
	@Table - Artifact Table ID
	@ID - Artifact ID
	@Function - LOGFUNCTION_DELETE_ARTIFACT
	@Name - Artifact Name
	@Note - Artifact Location
	@Contact - User 

OUTPUTS

TASKS
	1. DELETE ASSOCIATIONS TO THE ARTIFACT (ASSOCIATION IS NOT LOGGED)
	2. LOG ARTIFACT TO BE DELETED 
	3. DELETE ARTIFACT FROM ARTIFACT TABLE

NOTES

*/


IF (SELECT COUNT(*) FROM Container WHERE SDTable_ID_Contained = @Table AND SD_ID_Contained = @ID) > 0
	BEGIN
		--TASK 1
		DELETE FROM Container WHERE Container_ID IN (SELECT Container_ID FROM Container WHERE SDTable_ID_Contained = @Table AND SD_ID_Contained = @ID)
	END 

IF (SELECT COUNT(*) FROM Artifact WHERE Artifact_ID = @ID) > 0
	BEGIN
		-- TASK 2
		EXEC SetLog @Table, @ID, @Function, @Name, @Note, @Contact
		-- TASK 3
		DELETE FROM Artifact WHERE Artifact_ID = @ID
	END
