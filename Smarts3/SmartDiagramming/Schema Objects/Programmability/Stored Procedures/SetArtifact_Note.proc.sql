
CREATE PROCEDURE [dbo].[SetArtifact_Note] (@Table as int, @ID as int, @Function as int, @Value as varchar(1000), @Contact as varchar(500)) 
AS

/*

OBJECTIVE
	set note for artifact

INPUTS
	@Table  - TABLE_ARTIFACT
	@ID  - Artifact ID
	@Function - LOGFUNCTION_SET_NOTE
	@Value - note
	@Contact - user

OUTPUTS
	
TASKS
	1.UPDATE new note of artifact
	2. LOG entry

NOTES

*/

-- 1
UPDATE Artifact SET Artifact_Note = @Value WHERE Artifact_ID = @ID
-- 2
EXEC SetLog @Table, @ID, @Function, @Value, NULL, @Contact
