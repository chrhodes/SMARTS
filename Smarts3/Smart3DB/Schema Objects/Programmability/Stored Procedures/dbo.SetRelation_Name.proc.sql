
CREATE PROCEDURE [dbo].[SetRelation_Name] (@Table as int, @ID as int, @Function as int, @Value as varchar(1000), @Contact as varchar(500)) 
AS

/*

OBJECTIVE
	set name for a  Relation

INPUTS
	@Table -TABLE_RELATION
	@ID - Relation ID
	@Function - LOGFUNCTION_SET_NAME
	@Value - name
	@Contact - user

OUTPUTS
	
TASKS
	1. UPDATE name of Relation
	2. LOG entry

NOTES

*/

BEGIN TRAN 

UPDATE Relation SET Relation_Name = @Value WHERE Relation_ID = @ID
EXEC SetLog @Table, @ID, @Function, @Value, NULL, @Contact

COMMIT TRAN
