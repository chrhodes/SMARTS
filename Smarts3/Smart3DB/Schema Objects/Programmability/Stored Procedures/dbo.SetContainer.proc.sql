
CREATE PROCEDURE [dbo].[SetContainer]
(
	@Table_Container as int, 
	@ID_Container as int, 
	@Table_Contained as int, 
	@ID_Contained as int, 
	@Abstraction_ID as int, 
	@Function as int, 
	@Contact as varchar(100)
) AS

/*

OBJECTIVE
	set/reset item (shape or artifact) into its container

INPUTS
	@Table_Container - TABLE_SHAPE
	@ID_Container    - ID of item container
	@Table_Contained - TABLE_ARTIFACT, TABLE_SHAPE 
	@ID_Contained    - ID item/artifact contained
	@Abstraction_ID  -  abstraction type of this container
	@Function        - LOGFUNCTION_SET_CONTAINER
	@Contact         - user

OUTPUTS
	
TASKS
	1. get container assoc id

	2. IF this is an artifact containment OR if the Contained already belongs to another container, change container (this does not hand Artifact containers)
		1. LOG entry : delete old container
		2. get principal container (old)
		3. switch to new container
			1. LOG entry : Abstraction	
			2. LOG entry : Container (new container)
			3. LOG entry : Contained	(item)
		4. prep local vars: relation table, abstraction of container relations,delete function name
		5. get related containers
		6. validate pre-switch container relation
			1.  if no other items contained have relations, delete this container relation by calling DeleteRelation
		7. validate post-switch containers
			1. if it does not already exist, add it by calling SetRelation
		8. add new container's artifacts to item, if necessary
			1. INSERT new container
			2. LOG entry : Abstraction	
			3. LOG entry : Container (contained item)
			4. LOG entry : Contained	(artifact)

	2. ELSE (container does not exist) or is an artifact container
		1. insert new container association
		2. prep local vars for LOG entry
		3. LOG entry : Abstraction	
		4. LOG entry : Container 
		5. LOG entry : Contained	
		6. IF this is an sys/bp container-artifact association, propagate artifacts to their dependents
			1. find the contained items of this container
			2. grab the first contained item		
			3. insert artifact association
			4. LOG entry : Abstraction	
			5. LOG entry : Container (contained item)
			6. LOG entry : Contained	(artifact)


NOTES
	does not check if the new container is the same as the old container, this is done in the business layer
	if switching containers,  the new container's artifacts will automatically be added to the item; however, user must manually delete artifacts of the old container

*/

--- 1

--- 1.1
declare @assoc_id int

IF  (@Abstraction_ID <> (select Abstraction_ID from Abstraction where Abstraction_Name = 'ARTIFACT')) 
begin
	set @assoc_id = (select Container_ID from Container where  SDTable_ID_Contained = @Table_Contained AND SD_ID_Contained = @ID_Contained AND  Abstraction_ID= @Abstraction_ID)
end

--IF  (@assoc_id is NULL) or (@Abstraction_ID =  (select Abstraction_ID from Abstraction where Abstraction_Name = 'ARTIFACT'))
IF  (@assoc_id is NULL)
	BEGIN
		--- 2.1
		INSERT INTO Container VALUES (@Table_Container, @ID_Container, @Table_Contained, @ID_Contained, @Abstraction_ID)
		--- 2.2
		DECLARE @Table int
		SET @Table = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Container')
		DECLARE @New int
		SET @New  = SCOPE_IDENTITY()
		DECLARE @AbstractionTable int
		SET @AbstractionTable = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Abstraction')
		--- 2.3
		EXEC SetLog @Table, @New, @Function, @AbstractionTable, @Abstraction_ID, @Contact
		-- 2.4
		EXEC SetLog @Table, @New, @Function, @Table_Container, @ID_Container, @Contact
		-- 2.5
		EXEC SetLog @Table, @New, @Function, @Table_Contained, @ID_Contained, @Contact
		---- 2.6
		--IF @Abstraction_ID = (select Abstraction_ID from Abstraction WHERE Abstraction_Name = 'ARTIFACT') 
		--	begin
		--		 IF (select ShapeType_ID from Shape where Shape_ID = @ID_Container) IN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name IN ('SYSTEM','BUSINESSPROCESS'))
		--			begin
		--				--- 2.6.1
		--				declare temp1 cursor for select SD_ID_Contained from Container where SD_ID_Container = @ID_Container and Abstraction_ID in (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name IN ('SYSTEMOBJECT','BUSINESSPROCESS'))
		--				open temp1
		--				--- 2.6.2
		--				declare @contained int
		--				fetch next from temp1 into @contained
		--				while @@fetch_status = 0 
		--					begin
		--						--- 2.6.3
		--						insert into Container(SDTable_ID_Container, SD_ID_Container, SDTable_ID_Contained, SD_ID_Contained, Abstraction_ID)
		--							select @Table_Container, @contained, @Table_Contained, @ID_Contained, @Abstraction_ID
		--						--- 2.6.4
		--						exec  SetLog @Table, @New, @Function, @AbstractionTable, @Abstraction_ID, @Contact
		--						-- 2.6.5
		--						exec SetLog @Table, @New, @Function, @Table_Container, @contained, @Contact
		--						-- 2.6.6
		--						exec SetLog @Table, @New, @Function, @Table_Contained, @ID_Contained, @Contact
		--						fetch next from temp1 into @contained
		--					end

		--				close temp1
		--				deallocate temp1
		--			end
		--	end

		END
--ELSE
--	BEGIN
--		--- 1.1
--		declare @oldcontainer int
--		set @oldcontainer = (select SD_ID_Container from Container where Container_ID = @assoc_id)

--		--- 1.2
--		declare @sdtable_container  int
-- 		set @sdtable_container = (select SDTable_ID from SDTable where SDTable_Name = 'Container')
--		declare @function_delete int
-- 		set @function_delete = (select SDLogFunction_ID from SDLogFunction where SDLogFunction_Name = 'LOGFUNCTION_DELETE_CONTAINER')
--		EXEC SetLog @sdtable_container, @assoc_id, @function_delete, NULL, 'Switch Container', @Contact

--		--- 1.3
--		update Container set SDTable_ID_Container = @Table_Container, SD_ID_Container = @ID_Container where Container_ID = @assoc_id
	
--			--- 1.3.1
--			declare @assoc_abstractionid int
--			set @assoc_abstractionid = (select Abstraction_ID from Container where Container_ID = @assoc_id)
--			declare @sdtable_abstraction int
--			set @sdtable_abstraction = (select SDTable_ID from SDTable where SDTable_Name = 'Abstraction')
--			EXEC SetLog @sdtable_container, @assoc_id, @Function, @sdtable_abstraction, @assoc_abstractionid, @Contact
--			--- 1.3.2
--			EXEC SetLog @sdtable_container, @assoc_id, @Function, @Table_Container, @ID_Container, @Contact
--			--- 1.3.3
--			EXEC SetLog @sdtable_container, @assoc_id, @Function, @Table_Contained, @ID_Contained, @Contact
	

--		--- 1.4 	
--		declare @abstraction_containerrelation int
--		set @abstraction_containerrelation = (select 
--			case	
--				when @Abstraction_ID = (select Abstraction_ID from Abstraction where Abstraction_Name = 'SYSTEMOBJECT') then (select Abstraction_ID from Abstraction where Abstraction_Name = 'SYSTEM')
--				when @Abstraction_ID = (select Abstraction_ID from Abstraction where Abstraction_Name = 'BUSINESSSTEP') then (select Abstraction_ID from Abstraction where Abstraction_Name = 'BUSINESS')
--			end)
--		declare @sdtable_relation int
--		set @sdtable_relation = (select SDTable_ID from SDTable where SDTable_Name = 'Relation')
--		set @function_delete = (select SDLogFunction_ID from SDLogFunction where SDLogFunction_Name = 'LOGFUNCTION_DELETE_RELATION')
--		declare @function_set int
--		set @function_set = (select SDLogFunction_ID from SDLogFunction where SDLogFunction_Name = 'LOGFUNCTION_SET_RELATION')

--		--- 1.5
--		declare related cursor for
--		select distinct sd_id_container 
--		from container 
--		where sd_id_contained 
--			in (select 
--				case
--					when sd_id_begin = @ID_Contained then sd_id_end
--					when sd_id_end = @ID_Contained then sd_id_begin

--				end 
--				from relation 
--				where sd_id_end = @ID_Contained or sd_id_begin = @ID_Contained) 
--			and abstraction_id 
--				in (select abstraction_id from abstraction where abstraction_name in ('SYSTEMOBJECT', 'BUSINESSSTEP'))

--		open related
		
--		declare @related_id int
		
--		fetch next from related into @related_id
		
--		while @@fetch_status = 0
--		begin
--			--- 1.6
--			if (select count(*) from relation 
--				where ( sd_id_begin in (select sd_id_contained from Container where sd_id_container = @related_id and abstraction_id = @Abstraction_ID)
--						and sd_id_end in (select sd_id_contained from Container where sd_id_container = @oldcontainer and abstraction_id = @Abstraction_ID) )
--					or ( sd_id_end in (select sd_id_contained from Container where sd_id_container = @related_id and abstraction_id = @Abstraction_ID)
--						and sd_id_begin in (select sd_id_contained from Container where sd_id_container = @oldcontainer and abstraction_id = @Abstraction_ID) )
--					and abstraction_id 
--						in (select abstraction_id from abstraction where abstraction_name in ('OBJECT', 'STEP')) ) = 0
--				begin
--					--- 1.6.1
--					declare @oldrelation int
--					set @oldrelation = (select Relation_ID from Relation where 
--						(SD_ID_Begin = @oldcontainer and SD_ID_End = @related_id)
--						or (SD_ID_End = @oldcontainer and SD_ID_Begin = @related_id)
--						and abstraction_id in (select abstraction_id from abstraction where abstraction_name in ('SYSTEM', 'BUSINESSPROCESS')) )
--				--	delete from Relation where Relation_ID = @oldrelation
--					exec DeleteRelation  @sdtable_relation, @oldrelation, @abstraction_containerrelation, @function_delete, @Contact
--				end
--			--- 1.7
--			if (select count(*) from relation 
--				where (sd_id_begin = @ID_Container and sd_id_end = @related_id)
--					or (sd_id_begin = @related_id and sd_id_end = @ID_Container)
--					and abstraction_id = @abstraction_containerrelation) = 0
--				begin
--					--- 1.7.1
--					exec SetRelation  NULL, NULL, @Table_Container, @ID_Container, @Table_Container, @related_id, @abstraction_containerrelation, @function_set, @Contact 
--				end

--			fetch next from related into @related_id
--		end
		
--		close related
--		deallocate related

--		----- 1.8
--		--declare @abstraction_artifact int
--		--set @abstraction_artifact = (select Abstraction_ID from Abstraction where Abstraction_Name = 'ARTIFACT')
--		--declare @sdtable_artifact int
--		--set @sdtable_artifact = (select SDTable_ID from SDTable where SDTable_Name = 'Artifact')
--		--declare @function_set_artifact int
--		--set @function_set_artifact = (select SDLogFunction_ID from SDLogFunction where SDLogFunction_Name = 'LOGFUNCTION_SET_ARTIFACT')
		

--		--declare newartifacts cursor for
--		--select distinct SD_ID_Contained 
--		--from Container 
--		--where SD_ID_Container = @ID_Container and Abstraction_ID = @abstraction_artifact

--		--open newartifacts

--		--declare @newartifact_id int

--		--fetch next from newartifacts into @newartifact_id
		
--		--while @@fetch_status = 0
--		--begin
--		--	if (select count(*) from Container where Abstraction_ID = @abstraction_artifact and SD_ID_Container = @ID_Contained and SD_ID_Contained = @newartifact_id) = 0
--		--	begin
--		--		--- 1.8.1
--		--		insert into Container values (@Table_Contained, @ID_Contained, @sdtable_artifact, @newartifact_id, @abstraction_artifact)
--		--		--- 1.8.2
--		--		declare @newcontainer int
--		--		set @newcontainer  = SCOPE_IDENTITY()
--		--		exec SetLog @sdtable_container, @newcontainer, @function_set_artifact, @sdtable_abstraction, @abstraction_artifact, @Contact
--		--		--- 1.8.3
--		--		exec SetLog @sdtable_container, @newcontainer, @function_set_artifact, @Table_Contained, @ID_Contained, @Contact
--		--		--- 1.8.4
--		--		exec SetLog @sdtable_container, @newcontainer, @function_set_artifact, @sdtable_artifact, @newartifact_id, @Contact
				
--		--		fetch next from newartifacts into @newartifact_id
				
--		--	end
--		--end

--		--close newartifacts
--		--deallocate newartifacts

--	END
