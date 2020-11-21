
CREATE PROCEDURE [dbo].[DeleteRelation] (@Table as int, @ID as int, @Abstraction as int, @Function as int, @Contact as varchar(500)) AS

/*

OBJECTIVE
	to delete an item relation, and if necessary, any container relation

INPUTS
	@Table - Relation Table ID
	@ID - Relation ID
	@Abstraction - Relation Abstraction ID
	@Function - LOGFUNCTION_DELETE_RELATION
	@Contact - User 

OUTPUTS

TASKS
	1. IF relation exists
	   1. SET some local vars first in case relations between containers also need to be deleted
	   2. LOG deletion entry
	   3. DELETE relation
	
		2. IF there are BUSINESS and SYSTEM container relations that need to be deleted
	   	   1. IF there are no other related items between these two containers
		   2. LOG deletion entry
		   3. DELETE container relation

NOTES

*/

---- 1
IF (SELECT COUNT(*) FROM Relation WHERE Relation_ID = @ID) > 0
	BEGIN
		--- 1.1
		declare @container_abstractionid int
		set @container_abstractionid =
			case
				WHEN @Abstraction = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESSSTEP')
				WHEN @Abstraction = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEMOBJECT')
			end
		declare @container1 int
		set @container1 = (select sd_id_container from container where sd_id_contained = (select sd_id_begin from relation where relation_id = @ID) and abstraction_id =@container_abstractionid )
		declare @container2 int
		set @container2 = (select sd_id_container from container where sd_id_contained = (select sd_id_end from relation where relation_id = @ID) and abstraction_id =@container_abstractionid)

		--- 1.2
		EXEC SetLog @Table, @ID, @Function, NULL, NULL, @Contact
		--- 1.3
		DELETE FROM Relation WHERE Relation_ID = @ID

		--- 2
		IF @Abstraction <> (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE') AND (@container1 <> @container2)
			BEGIN
				--- 2.1
				if (select count(*) from relation 
					where  abstraction_id = @Abstraction
						and (sd_id_begin in (select sd_id_contained from container where sd_id_container = @container1) 
						 	and sd_id_end in (select sd_id_contained from container where sd_id_container = @container2)) 
						or (sd_id_begin in (select sd_id_contained from container where sd_id_container = @container2) 
							and sd_id_end in (select sd_id_contained from container where sd_id_container = @container1)) ) = 0

				BEGIN

					declare @relation_abstractionid int
					set @relation_abstractionid = 
						case 
							WHEN @Abstraction = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESS')
							WHEN @Abstraction = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEM')
						end
					declare @relationid int
					set @relationid = 
						(select relation_id from relation 
							where 	abstraction_id = @relation_abstractionid
								and (sd_id_begin = @container1 and sd_id_end = @container2) 
								or (sd_id_end = @container1 and sd_id_begin = @container2))

					if  ( select count(*) from relation where relation_id = @relationid ) > 0
					begin
						--- 2.2
						EXEC SetLog @Table, @relationid, @Function, NULL, NULL, @Contact
						--- 2.3
						DELETE FROM Relation WHERE Relation_ID = @relationid
					end
				END

			END
		END
