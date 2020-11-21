
CREATE PROCEDURE [dbo].[GetAttributeList] AS

/*

OBJECTIVE
	retrieve list of Attributes

INPUTS

OUTPUTS
	all fields in Attributes table
TASKS

NOTES
*/


SELECT 	
*
FROM 	
	Attribute
ORDER BY
	Attribute_Name
