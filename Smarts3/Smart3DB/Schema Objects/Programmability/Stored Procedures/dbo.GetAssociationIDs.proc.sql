
CREATE PROCEDURE [dbo].[GetAssociationIDs] ( @Table as int, @Principal as varchar(4000), @Related as varchar(4000)) 

AS

/*

OBJECTIVE
	retrieve association IDs (relation or container)

INPUTS
	@Table 	- Table ID to search for
	@Principal	- list of item(s) to search for  e.g.  '(1,2,3,4)'
	@Related	- list of item(s) to search for  e.g.  '(1,2,3,4)'

OUTPUTS
	
	Assoc ID, Assoc Table

TASKS

	1. IF table is not specified, search in both Container and Relation tables
	2. IF a relation
		2.1 IF only one item is specified
		2.2 IF both items are specified
	3. IF a container
		3.1 IF only one item is specified
		3.2 IF both items are specified
		
NOTES

*/

DECLARE @strSQL varchar(8000)
--- 1
IF @Table = NULL
	BEGIN
		SET @strSQL = 'SELECT Relation_ID as Assoc_ID,  (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = ''Relation'')as Assoc_Table FROM Relation 
				 WHERE (SD_ID_Begin IN ' +  @Principal + ' AND SD_ID_End IN ' + @Related + ') 
					OR (SD_ID_End IN ' + @Principal + ' AND SD_ID_Begin IN ' + @Related + ') 
				UNION
				SELECT Container_ID as Assoc_ID, (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = ''Container'') as Assoc_Table FROM Container
				 WHERE ( Abstraction_ID <> (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name =''ARTIFACT''))
					AND ((Abstraction_ID <> 7) AND (SD_ID_Container IN ' + @Principal + ' AND SD_ID_Contained IN ' + @Related + ') 
					OR (SD_ID_Contained IN ' + @Principal  + ' AND SD_ID_Container IN ' + @Related + ')) '

	END
ELSE
	BEGIN
		--- 2
		IF @Table = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Relation')
			--- 2.1
			IF @Related = NULL 
				BEGIN
					SET @strSQL = 'SELECT Relation_ID as Assoc_ID,' + CAST( @Table as varchar(3)) +  ' as Assoc_Table FROM Relation 
						 WHERE (SD_ID_Begin = ' +  @Principal + 'OR SD_ID_End = ' + @Principal  + ') '
				END
			--- 2.2
			ELSE
				BEGIN
					SET @strSQL = 'SELECT Relation_ID as Assoc_ID,' + CAST( @Table as varchar(3)) +  ' as Assoc_Table FROM Relation 
						 WHERE (SD_ID_Begin IN ' +  @Principal + ' AND SD_ID_End IN ' + @Related + ') 
							OR (SD_ID_End IN ' + @Principal + ' AND SD_ID_Begin IN ' + @Related + ') '
				END
		-- 3
		ELSE
			--- 3.1
			IF @Related = NULL 
				BEGIN
					SET @strSQL = 'SELECT Container_ID as Assoc_ID, ' + CAST( @Table as varchar(3)) +  ' as Assoc_Table FROM Container
						 WHERE ( Abstraction_ID <> (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name =''ARTIFACT''))
							AND ((SD_ID_Container = ' + @Principal + ') OR  (SD_ID_Contained = ' + @Principal  + ')) '
				END
			--- 3.2
			ELSE
				BEGIN
					SET @strSQL = 'SELECT Container_ID as Assoc_ID, ' + CAST( @Table as varchar(3)) +  ' as Assoc_Table FROM Container
						 WHERE ( Abstraction_ID <> (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name =''ARTIFACT''))
							AND ((SD_ID_Container IN ' + @Principal + ' AND SD_ID_Contained IN ' + @Related + ') 
							OR (SD_ID_Contained IN ' + @Principal  + ' AND SD_ID_Container IN ' + @Related + ')) '
				END
	END


EXEC (@strSQL)
