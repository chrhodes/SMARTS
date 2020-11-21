
CREATE PROCEDURE [dbo].[GetLifecycleList] AS

/*

OBJECTIVE
	retrieve list of Lifecycle

INPUTS

OUTPUTS
	all fields in Lifecycle table
TASKS

NOTES
*/

SELECT 
	* 
FROM 
	Lifecycle
ORDER BY 
	Lifecycle_ID
