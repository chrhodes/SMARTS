
CREATE PROCEDURE [dbo].[GetTableList] AS

/*

OBJECTIVE
	retrieve list of SDTable

INPUTS


OUTPUTS
	all fields in SDTable table

TASKS

NOTES
*/

SELECT 	
*
FROM 	
	SDTable
ORDER BY
	SDTable_Name
