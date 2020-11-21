
CREATE PROCEDURE [dbo].[GetConstrainedValues] (@Table as int, @ID as int)  AS

/*

OBJECTIVE
	retrieve list of ConstrainedValues

INPUTS

OUTPUTS
	all fields in ConstrainedValues table
TASKS

NOTES
*/

SELECT DISTINCT 
	*
	 
FROM 
	ConstrainedValues
