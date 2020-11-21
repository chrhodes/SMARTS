
CREATE PROCEDURE [dbo].[SetArtifact] (@Table as int, @ID as int, @Function as int, @Name as varchar(100), @Contact as varchar(500),@NewID as 

int out) 
AS

/*

OBJECTIVE
	set artifact

INPUTS
	@Table  - TABLE_ARTIFACT
	@ID  - Artifact ID
	@Function - LOGFUNCTION_SET_ARTIFACT
	@Value - name
	@Contact - user

OUTPUTS
	
TASKS
	1. INSERT new artifact
	2. RETURN new artifact ID 
	3. LOG entry

NOTES
	does not check for duplicate. checks (if any) should be done in the business logic level
*/

	--- 1
	INSERT INTO Artifact (Artifact_Name) VALUES (@Name)
	--- 2
	SET @NewID = SCOPE_IDENTITY()
	--- 3
	EXEC SetLog @Table, @NewID, @Function, @Name, NULL, @Contact
