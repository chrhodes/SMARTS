
CREATE PROCEDURE [dbo].[SetRelation_Desc] (@Table as int, @ID as int, @Function as int, @Value as varchar(1000), @Contact as varchar(500)) 
AS

/*

OBJECTIVE
	set description for a  Relation

INPUTS
	@Table -TABLE_RELATION
	@ID - Relation ID
	@Function - LOGFUNCTION_SET_DESCRIPTION
	@Value - description
	@Contact - user

OUTPUTS
	
TASKS
	1. UPDATE description of Relation
	2. LOG entry

NOTES

*/

BEGIN TRAN

UPDATE Relation SET Relation_Desc = @Value WHERE Relation_ID = @ID
EXEC SetLog @Table, @ID, @Function, @Value, NULL, @Contact

COMMIT TRAN
