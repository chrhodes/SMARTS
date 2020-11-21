
CREATE PROCEDURE [dbo].[SetArtifact_Contact] (@Table as int, @ID as int, @Function as int, @Value as varchar(1000), @Contact as varchar(500)) 
AS

/*

OBJECTIVE
	set contact for artifact

INPUTS
	@Table  - TABLE_ARTIFACT
	@ID  - Artifact ID
	@Function - LOGFUNCTION_SET_CONTACT
	@Value - contact
	@Contact - user

OUTPUTS
	
TASKS
	1.UPDATE new contact of artifact
	2. LOG entry

NOTES

*/

UPDATE Artifact SET Artifact_Contact = @Value WHERE Artifact_ID = @ID
EXEC SetLog @Table, @ID, @Function, @Value, NULL, @Contact
