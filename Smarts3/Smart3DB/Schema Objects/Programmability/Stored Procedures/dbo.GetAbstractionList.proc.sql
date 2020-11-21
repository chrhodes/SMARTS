
CREATE PROCEDURE [dbo].[GetAbstractionList] AS

/*

OBJECTIVE
	retrieve list of Abstractions

INPUTS

OUTPUTS
	all fields in Abstraction Table
TASKS

NOTES
*/

SELECT 	
*
FROM 	
	Abstraction
ORDER BY
	Abstraction_Name
