
CREATE PROCEDURE [dbo].[GetAssociationIDs_DrillDowns] ( @Table as int, @Principal as varchar(4000), @Related as varchar(4000)) 

AS


/*

OBJECTIVE
	retrieve association IDs contained by the entered items

INPUTS
	@Table 	- Table ID to search in
	@Principal	- list of container item(s) search for  e.g.  '(1,2,3,4)'
	@Related	- list of container item(s) to search for  e.g.  '(1,2,3,4)'

OUTPUTS
	
	Assoc ID, Assoc Table

TASKS

		
NOTES

*/

DECLARE @strSQL varchar(8000)

SET @strSQL = 'SELECT Relation_ID as Assoc_ID,' + CAST( @Table as varchar(3)) +  ' as Assoc_Table FROM Relation 
	 WHERE 
		(
		SD_ID_Begin IN (select sd_id_contained from container 
			 where abstraction_id <> (select abstraction_id from abstraction where abstraction_name = ''ARTIFACT'' )
			and sd_id_container in (' +  @Principal + ')) 
		AND SD_ID_End IN (select sd_id_contained from container
			where abstraction_id <> (select abstraction_id from abstraction where abstraction_name = ''ARTIFACT '' )
			and sd_id_container in' + @Related + ')
		) 
	OR
		(
		SD_ID_End IN (select sd_id_contained from container 
			 where abstraction_id <> (select abstraction_id from abstraction where abstraction_name = ''ARTIFACT'' )
			and sd_id_container in (' +  @Principal + ')) 
		AND SD_ID_Begin IN (select sd_id_contained from container
			where abstraction_id <> (select abstraction_id from abstraction where abstraction_name = ''ARTIFACT '' )
			and sd_id_container in' + @Related + ')
		) 
	'

EXEC (@strSQL)
