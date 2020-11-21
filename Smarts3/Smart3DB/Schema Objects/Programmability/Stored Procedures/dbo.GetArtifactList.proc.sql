
CREATE PROCEDURE [dbo].[GetArtifactList] AS

/*

OBJECTIVE
	retrieve list of Artifacts

INPUTS

OUTPUTS
	all fields in Artifact table
TASKS

NOTES
*/

SELECT 
	* 
FROM 
	Artifact
ORDER BY 
	Artifact_Name
