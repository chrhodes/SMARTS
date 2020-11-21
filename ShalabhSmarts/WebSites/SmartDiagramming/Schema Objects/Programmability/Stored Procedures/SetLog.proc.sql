
CREATE PROCEDURE [dbo].[SetLog](@Table as int, @ID as int, @Function as int, @Value as varchar(1000), @Note as varchar(1000), @Contact as varchar(500)) AS

/*

OBJECTIVE
	logs database changes

INPUTS
	@Table - table being changed
	@ID - ID being changed
	@Function - LOGFUNCTION_SET_RELATION
	@Value - see NOTE
	@Note - see NOTE
	@Contact - user

OUTPUTS
	
TASKS
	1. LOG entry

NOTES
	to be called by other SPs
	@Value & @Note have multiple meanings, refer to the calling SP for specifics

*/


INSERT INTO SDLog VALUES (@Table, @ID, @Function, @Value, @Note, @Contact, getDate())
