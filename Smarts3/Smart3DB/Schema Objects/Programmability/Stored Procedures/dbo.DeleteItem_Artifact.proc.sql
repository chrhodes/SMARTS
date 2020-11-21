
CREATE PROCEDURE [dbo].[DeleteItem_Artifact] (@ArtifactID as int, @Table as int, @ItemID as int, @Function as int,@Contact as varchar(500)) AS

/*

OBJECTIVE
	to delete the artifact associated with this item

INPUTS
	@ArtifactID - Artifact ID 
	@Table - Shape Table ID
	@ID - Shape ID
	@Function - LOGFUNCTION_DELETE_CONTAINER
	@Contact - User 

OUTPUTS

TASKS
	IF there is an artifact associated with this item
		1. LOG SHAPE-ARTIFACT CONTAINER ASSOC TO BE DELETED 
		2. DELETE SHAPE-ARTIFACT CONTAINER FROM CONTAINER TABLE

NOTES

*/


BEGIN TRAN

	DECLARE @ContainerID int
	SET @ContainerID = (SELECT Container_ID FROM Container WHERE SDTable_ID_Contained=(SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Artifact') AND SD_ID_Contained=@ArtifactID AND SDTable_ID_Container = @Table AND SD_ID_Container = @ItemID AND Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'ARTIFACT'))
	
	IF @ContainerID IS NOT NULL
		BEGIN
			-- 1
			DECLARE @ContainerTable int
			SET @ContainerTable = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Container')
			EXEC SetLog @ContainerTable, @ContainerID, @Function, NULL, NULL, @Contact
			-- 2
			DELETE FROM Container WHERE Container_ID = @ContainerID
		END

COMMIT TRAN
