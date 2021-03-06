if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeleteItem_Artifact]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DeleteItem_Artifact]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeleteArtifact]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DeleteArtifact]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeleteAttribute]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DeleteAttribute]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeleteContainer]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DeleteContainer]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeleteItem]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DeleteItem]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeleteRelation]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DeleteRelation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeleteShapeTypeAttribute]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DeleteShapeTypeAttribute]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeleteShapeTypeAttribute_ConstrainedValue]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DeleteShapeTypeAttribute_ConstrainedValue]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetAbstractionList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetAbstractionList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetArtifactList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetArtifactList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetAssociation]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetAssociation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetAssociationIDs]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetAssociationIDs]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetAssociationIDs_DrillDowns]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetAssociationIDs_DrillDowns]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetAttributeList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetAttributeList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetConstrainedValues]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetConstrainedValues]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetItem]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetItem]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetItem_Abstraction]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetItem_Abstraction]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetItem_AttributeValue]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetItem_AttributeValue]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetItem_ConstrainedValues]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetItem_ConstrainedValues]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetItem_Contained]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetItem_Contained]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetItem_Container]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetItem_Container]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetItem_Relation]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetItem_Relation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetItem_Search]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetItem_Search]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetLifecycleList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetLifecycleList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetLog_AttributeValues]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetLog_AttributeValues]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetLog_AttributeValuesDeleted]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetLog_AttributeValuesDeleted]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetLog_AttributeValuesExisting]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetLog_AttributeValuesExisting]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetLog_Container]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetLog_Container]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetLog_Relation]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetLog_Relation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetLog_Shape]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetLog_Shape]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetReport_EnterpriseAttribute]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetReport_EnterpriseAttribute]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetReport_EnterpriseAttributeNew]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetReport_EnterpriseAttributeNew]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetReport_LevelAttributeList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetReport_LevelAttributeList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetReport_LevelRelationBusinessProcess]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetReport_LevelRelationBusinessProcess]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetReport_LevelRelationInfrastructure]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetReport_LevelRelationInfrastructure]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetReport_LevelRelationSystem]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetReport_LevelRelationSystem]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetReport_ShapeTypeAttribute]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetReport_ShapeTypeAttribute]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetShape]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetShape]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetShapeList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetShapeList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetShapeList_Browser]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetShapeList_Browser]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetShapeList_Deletable]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetShapeList_Deletable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetShapeTypeAttribute]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetShapeTypeAttribute]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetShapeTypeAttributeList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetShapeTypeAttributeList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetShapeTypeList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetShapeTypeList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetTableList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetTableList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SetArtifact]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SetArtifact]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SetArtifact_Contact]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SetArtifact_Contact]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SetArtifact_Desc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SetArtifact_Desc]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SetArtifact_Loc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SetArtifact_Loc]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SetArtifact_Name]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SetArtifact_Name]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SetArtifact_Note]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SetArtifact_Note]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SetAttribute]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SetAttribute]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SetAttributeValue]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SetAttributeValue]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SetAttribute_Name]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SetAttribute_Name]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SetConstrainedValue]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SetConstrainedValue]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SetContainer]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SetContainer]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SetItem]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SetItem]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SetItem_Desc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SetItem_Desc]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SetItem_Lifecycle]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SetItem_Lifecycle]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SetItem_Name]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SetItem_Name]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SetLog]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SetLog]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SetRelation]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SetRelation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SetRelation_Desc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SetRelation_Desc]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SetRelation_Direction]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SetRelation_Direction]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SetRelation_Name]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SetRelation_Name]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SetShapeTypeAttribute]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SetShapeTypeAttribute]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SetShapeTypeAttribute_Desc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SetShapeTypeAttribute_Desc]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TransferToLogging]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[TransferToLogging]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[crosstab]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[crosstab]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[DeleteItem_Artifact] (@ArtifactID as int, @Table as int, @ItemID as int, @Function as int,@Contact as varchar(500)) AS

/*

OBJECTIVE
	to delete the artifact associated with this item

INPUTS
	@ArtifactID - Artifact ID 
	@Table - Shape Table ID
	@ID - Shape ID
	@Function - LOGFUNCTION_DELETE_CONTAINER
	@Contact - User 

OUTPUTS

TASKS
	IF there is an artifact associated with this item
		1. LOG SHAPE-ARTIFACT CONTAINER ASSOC TO BE DELETED 
		2. DELETE SHAPE-ARTIFACT CONTAINER FROM CONTAINER TABLE

NOTES

*/


BEGIN TRAN

	DECLARE @ContainerID int
	SET @ContainerID = (SELECT Container_ID FROM Container WHERE SDTable_ID_Contained=(SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Artifact') AND SD_ID_Contained=@ArtifactID AND SDTable_ID_Container = @Table AND SD_ID_Container = @ItemID AND Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'ARTIFACT'))
	
	IF @ContainerID IS NOT NULL
		BEGIN
			-- 1
			DECLARE @ContainerTable int
			SET @ContainerTable = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Container')
			EXEC SetLog @ContainerTable, @ContainerID, @Function, NULL, NULL, @Contact
			-- 2
			DELETE FROM Container WHERE Container_ID = @ContainerID
		END

COMMIT TRAN
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE [dbo].[DeleteArtifact](@Table as int, @ID as int, @Function as int, @Name as varchar(1000), @Note as varchar(1000), @Contact as varchar(500)) AS

/*

OBJECTIVE
	TO DELETE AN ARTIFACT

INPUTS
	@Table - Artifact Table ID
	@ID - Artifact ID
	@Function - LOGFUNCTION_DELETE_ARTIFACT
	@Name - Artifact Name
	@Note - Artifact Location
	@Contact - User 

OUTPUTS

TASKS
	1. DELETE ASSOCIATIONS TO THE ARTIFACT (ASSOCIATION IS NOT LOGGED)
	2. LOG ARTIFACT TO BE DELETED 
	3. DELETE ARTIFACT FROM ARTIFACT TABLE

NOTES

*/


IF (SELECT COUNT(*) FROM Container WHERE SDTable_ID_Contained = @Table AND SD_ID_Contained = @ID) > 0
	BEGIN
		--TASK 1
		DELETE FROM Container WHERE Container_ID IN (SELECT Container_ID FROM Container WHERE SDTable_ID_Contained = @Table AND SD_ID_Contained = @ID)
	END 

IF (SELECT COUNT(*) FROM Artifact WHERE Artifact_ID = @ID) > 0
	BEGIN
		-- TASK 2
		EXEC SetLog @Table, @ID, @Function, @Name, @Note, @Contact
		-- TASK 3
		DELETE FROM Artifact WHERE Artifact_ID = @ID
	END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[DeleteAttribute] (@Table as int, @ID as int, @Function as int, @Name as varchar(1000), @Note as varchar(1000),@Contact as varchar(500)) AS

/*

OBJECTIVE
	TO DELETE AN ATTRIBUTE

INPUTS
	@Table - Attribute Table ID
	@ID - Attribute ID
	@Function - LOGFUNCTION_DELETE_ATTRIBUTE
	@Name - Attribute Name
	@Note - Comment reason for deletion
	@Contact - User 

OUTPUTS

TASKS
	1. LOG ATTRIBUTE TO BE DELETED 
	2. DELETE ATTRIBUTE FROM ATTRIBUTE TABLE

NOTES
	-THIS STORED PROC IS ONLY CALLED WHEN THERE ARE NO DEPENDENT SHAPETYPES

*/


IF (SELECT COUNT(*) FROM Attribute WHERE Attribute_ID = @ID) > 0
	BEGIN
		-- TASK 1
		EXEC SetLog @Table, @ID, @Function, @Name, @Note, @Contact
		-- TASK 2
		DELETE FROM Attribute WHERE Attribute_ID = @ID
	END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[DeleteContainer] (@Table as int, @ID as int, @Function as int,@Contact as varchar(500)) AS

/*

OBJECTIVE
	TO DELETE A CONTAINER ASSOCIATION

INPUTS
	@Table - Container Table ID
	@ID - Container ID
	@Function - LOGFUNCTION_DELETE_CONTAINER
	@Contact - User 

OUTPUTS

TASKS
	1. LOG CONTAINER TO BE DELETED 
	2. DELETE CONTAINER FROM CONTAINER TABLE
NOTES

*/


IF (SELECT COUNT(*) FROM Container WHERE Container_ID = @ID) > 0
	BEGIN
		-- TASK 1
		EXEC SetLog @Table, @ID, @Function, NULL, NULL, @Contact
		-- TASK 2
		DELETE FROM Container WHERE Container_ID = @ID

	END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[DeleteItem](@Table as int, @ID as int, @Function as int, @Name as varchar(1000), @Note as varchar(1000), @Contact as varchar(500), @NewID as int out) AS

/*

OBJECTIVE
	to delete an item shape

INPUTS
	@Table - Shape Table ID
	@ID - Shape ID
	@Function - LOGFUNCTION_DELETE_SHAPE
	@Name - Shape Name
	@Name - Deletion Comment
	@Contact - User 

OUTPUTS
	@NewID  : RETURNS 0  if items already has existing assoc(s), 1 if item does not

TASKS
	1. IF item does not have existing relations
		1. RETURN @NewID as 0
	ELSE 
	    2. IF item has dependent containees
		1. RETURN @NewID as 0
	    3. ELSE
		1.CREATE a temptable of assocations to delete
			1. SELECT ASSOCS OF IPs TO BE DELETED
			2. SELECT ASSOCS OF IPs CONTAINED  TO BE DELETED
			3. SELECT ASSOCS OF ARTIFACT CONTAINED TO BE DELETED
			4. SELECT LIST OF ATTRIBUTEVALUEs TO BE DELETED
			5. SELECT ASSOC OF THE SHAPE THAT CONTAINS IT TO BE DELETED
			6. SELECT SHAPE TO BE DELETED
		2. INSERT DELETION ENTRY INTO LOG
		3. DELETE IPs AND SHAPE MATCHING THOSE IN THE TEMPTABLE
		4. DELETE ATTRIBUTE VALUES MATCHING THOSE IN THE TEMPTABLE
		5. DELETE SHAPE CONTAINER MATCHING THOSE IN THE TEMPTABLE
		6. RETURN @NewID as 1

NOTES
	--- undeleteable items return 0  (FALSE), user is notified that deletion was unsuccessful
	--- deleteable items return 1 (TRUE), user is notified that deletion was successful

*/

	IF (SELECT COUNT(*) FROM Relation WHERE (SDTable_ID_Begin = @Table AND SD_ID_Begin = @ID) OR (SDTable_ID_End = @Table AND SD_ID_End = @ID)) > 0
		-- 1.1
		BEGIN
			SET @NewID = 0	
		END
	ELSE
		BEGIN
			IF (SELECT COUNT(*) FROM Container WHERE (SDTable_ID_Container = @Table AND SD_ID_Container = @ID) AND (Abstraction_ID NOT IN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name IN ('ARTIFACT','IP')))) > 0		
				--- 2.1
				BEGIN
					SET @NewID = 0				
				END
			ELSE
				BEGIN
					-- 3.1
					DECLARE @ShapeTableID INT
					DECLARE @ContainerTableID INT
					SET @ShapeTableID =  (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Shape')
					SET @ContainerTableID = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Container')
					-- 3.1.1
					SELECT 
						SDTable_ID_Contained as "DeleteTable",
						SD_ID_Contained as "DeleteID",
						(SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_DELETE_SHAPE') as "DeleteFunction",
						@Name as "DeleteValue",
						@Note as "DeleteNote",
						@Contact as "DeleteContact",
						getDate() as "DeleteDateTime"
					INTO #TempTable
					FROM Container
					WHERE SDTable_ID_Contained =@ShapeTableID AND SDTable_ID_Container = @Table and SD_ID_Container = @ID AND Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'IP')
					-- 3.1.2 
					UNION SELECT 
						@ContainerTableID as "DeleteTable",
						Container_ID as "DeleteID",
						(SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_DELETE_CONTAINER') as "DeleteFunction",
						@Name as "DeleteValue",
						@Note as "DeleteNote",
						@Contact as "DeleteContact",
						getDate() as "DeleteDateTime"
					FROM Container
					WHERE SDTable_ID_Contained = @ShapeTableID AND SDTable_ID_Container = @Table and SD_ID_Container = @ID AND Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'IP')
					-- 3.1.3
					UNION SELECT 
						@ContainerTableID as "DeleteTable",
						Container_ID as "DeleteID",
						(SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_DELETE_CONTAINER') as "DeleteFunction",
						@Name as "DeleteValue",
						@Note as "DeleteNote",
						@Contact as "DeleteContact",
						getDate() as "DeleteDateTime"
					FROM Container
					WHERE SDTable_ID_Contained = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'ARTIFACT') AND SDTable_ID_Container = @Table and SD_ID_Container = @ID AND Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'ARTIFACT')
					-- 3.1.4 
					UNION SELECT 
						(SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'AttributeValue') as "DeleteTable",
						AttributeValue_ID as "DeleteID",
						(SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_DELETE_ATTRIBUTEVALUE') as "DeleteFunction",
						@Name as "DeleteValue",
						@Note as "DeleteNote",
						@Contact as "DeleteContact",
						getDate() as "DeleteDateTime"
					FROM AttributeValue
					WHERE SDTable_ID = @Table AND SD_ID = @ID 
					--  3.1.5
					UNION SELECT 
						@ContainerTableID as "DeleteTable",
						Container_ID as "DeleteID",
						(SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_DELETE_CONTAINER') as "DeleteFunction",
						@Name as "DeleteValue",
						@Note as "DeleteNote",
						@Contact as "DeleteContact",
						getDate() as "DeleteDateTime"
					FROM Container
					WHERE SDTable_ID_Contained = @Table and SD_ID_Contained = @ID 
					-- 3.1.6 
					UNION SELECT
						@Table as "DeleteTable",
						@ID as "DeleteID",
						@Function as "DeleteFunction",
						@Name as "DeleteValue",
						@Note as "DeleteNote",
						@Contact as "DeleteContact",
						getDate() as "DeleteDateTime"
					FROM Shape
					WHERE Shape_ID = @ID
					
					-- 3.2
					INSERT INTO SDLog(SDTable_ID, SD_ID, SDLogFunction_ID, SDLog_Value, SDLog_Note, SDLog_Contact, SDLog_DateTime)
						SELECT   DeleteTable, DeleteID, DeleteFunction, DeleteValue, DeleteNote, DeleteContact, DeleteDateTime FROM #TempTable
					-- 3.3
					DELETE FROM Shape WHERE Shape_ID IN (SELECT DeleteID FROM #TempTable WHERE DeleteFunction = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_DELETE_SHAPE') )
					-- 3.4
					DELETE FROM AttributeValue WHERE AttributeValue_ID IN (SELECT DeleteID FROM #TempTable WHERE DeleteFunction = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_DELETE_ATTRIBUTEVALUE') )
					-- 3.5
					DELETE FROM Container WHERE Container_ID IN (SELECT DeleteID FROM #TempTable WHERE DeleteFunction = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_DELETE_CONTAINER') )
					-- 3.6
					SET @NewID = 1
		
				END
	END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

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
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[DeleteShapeTypeAttribute] (@Table as int, @ID as int, @Function as int, @Name as varchar(1000), @Note as varchar(1000),  @Contact as varchar(500)) AS

/*

OBJECTIVE
	to delete a shapetypeattribute and its corresponding constrained values

INPUTS
	@Table - Relation Table ID
	@ID - Relation ID
	@Function - LOGFUNCTION_DELETE_SHAPETYPEATTRIBUTE
	@Name - name of ShapeTypeAttribute to be deleted
	@Note - reason for deletion
	@Contact - User 

OUTPUTS

TASKS
	1. IF ShapeTypeAttribue exists
	   1. DELETE ConstrainedValue of ShapeTypeAttribute
	   2. LOG deletion entry
	   3. DELETE ShapeTypeAttribue

NOTES
	this function is only called when there are no items dependent on this shapetype
*/

--- 1
IF (SELECT COUNT(*) FROM ShapeTypeAttribute WHERE ShapeTypeAttribute_ID = @ID) > 0
	BEGIN
		-- 1.1
		DECLARE @CVTable int
		DECLARE @CVID  int
		DECLARE @CVFunction int
		SET @CVTable = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'ConstrainedValue')
		SET @CVID = (SELECT ConstrainedValue_ID FROM ConstrainedValue WHERE SDTable_ID = @Table AND SD_ID = @ID )
		SET @CVFunction = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_DELETE_CONSTRAINEDVALUE')
		EXEC DeleteShapeTypeAttribute_ConstrainedValue @CVTable, @CVID, @CVFunction, @Contact

		-- 1.2
		EXEC SetLog @Table, @ID, @Function, NULL, @Note, @Contact
		-- 1.3
		DELETE FROM ShapeTypeAttribute WHERE ShapeTypeAttribute_ID = @ID
		
	END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[DeleteShapeTypeAttribute_ConstrainedValue] (@Table as int, @ID as int, @Function as int, @Contact as varchar(500)) AS

/*

OBJECTIVE
	delete constrained value list

INPUTS
	@Table - TABLE_ConstrainedValue
	@ID - ContainerValue ID
	@Function - LOGFUNCTION_DELETE_CONSTRAINEDVALUE
	@Contact - User 

OUTPUTS

TASKS
	1. IF entry exists, LOG ConstrainedValue list to be delete
	2. DELETE entry 

NOTES
	called from within sp DeleteShapeTypeAttribute
*/

IF (SELECT COUNT(*) FROM ConstrainedValue WHERE ConstrainedValue_ID = @ID) > 0
	BEGIN
		--- 1
		EXEC SetLog @Table, @ID, @Function, NULL, NULL, @Contact
		--- 2
		DELETE FROM ConstrainedValue WHERE ConstrainedValue_ID = @ID
	END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

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
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[GetArtifactList] AS

/*

OBJECTIVE
	retrieve list of Artifacts

INPUTS

OUTPUTS
	all fields in Artifact table
TASKS

NOTES
*/

SELECT 
	* 
FROM 
	Artifact
ORDER BY 
	Artifact_Name
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[GetAssociation] (@Table as int, @ID as int)  AS

/*

OBJECTIVE
	retrieve an association (Relation or Container)

INPUTS
	@Table 	- Table ID
	@ID		- ID 

OUTPUTS
	
	Item1Container TableID, Item1Container ID, Item1Container Name, Item1Container Desc, Item1Container TypeID, Item1Container TypeName, Item1Container AbstractionID
	Item1 TableID, Item1 ID, Item1 Name, Item1 Desc, Item1 TypeID, Item1 TypeName, Item1 AbstractionID
	Item2Container TableID, Item2 Container ID, Item2Container Name, Item2Container Desc, Item2Container TypeID, Item2Container TypeName, Item2Container AbstractionID
	Item2 TableID, Item2 ID, Item2 Name, Item2 Desc, Item2 TypeID, Item2 TypeName, Item2 AbstractionID

TASKS

	1. determine if association is a relation or a container, and populate accordingly

NOTES
	if the association is a container, Item1 would be the container of Item2. 
*/



--- 1
IF @Table =  (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Relation')
	BEGIN
                               ---- create a temptable first with just the items
		SELECT  DISTINCT
			Relation_ID as [Assoc ID],
			IsNULL(Relation_Name,'') as [Assoc Name],	
			IsNULL(Relation_Desc,'') as [Assoc Desc],
			(CASE 
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'STEPRELATION')
				WHEN Abstraction_ID =  (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'DEVICERELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'OBJECTRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESS') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'BUSINESSRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEM') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'SYSTEMRELATION')
			 END) as [Assoc TypeID],
			Abstraction_ID as [Assoc AbstractionID],
			"TO" as [Assoc Direction],

			--- ADD TEMP COLUMN OF Container_ID to look for
			(SELECT Container_ID FROM Container 
				WHERE SDTable_ID_Contained = SDTable_ID_Begin 
					AND SD_ID_Contained = SD_ID_Begin 
					AND Container.Abstraction_ID = (CASE 
					WHEN  (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @ID) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESSSTEP')
					WHEN  (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @ID) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE')
					WHEN  (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @ID) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT')THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEMOBJECT')
					 END)
			) as [Container ID Item1],
	
			SDTable_ID_Begin  as [Item1 TableID],
			SD_ID_Begin as [Item1 ID],
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = SD_ID_Begin) as [Item1 Name],
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = SD_ID_Begin) as [Item1 Desc],
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Begin) as [Item1 TypeID],
			(SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Begin)) as [Item1 TypeName],
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Begin))  as [Item1 AbstractionID],
			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue 
				WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
					WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') 
						AND ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Begin))
						 AND SDTable_ID = SDTable_ID_Begin 
						AND SD_ID = SD_ID_Begin) as [Item1 Environment],

			(SELECT Container_ID FROM Container 
				WHERE SDTable_ID_Contained = SDTable_ID_End
					AND SD_ID_Contained = SD_ID_End
					AND Abstraction_ID = (CASE 
					WHEN (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @ID) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESSSTEP')
					WHEN (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @ID) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE')
					WHEN (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @ID) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT')THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEMOBJECT')
				 END)
			) as [Container ID Item2],

			SDTable_ID_End as [Item2 TableID],
			SD_ID_End as [Item2 ID],
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = SD_ID_End) as [Item2 Name],
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = SD_ID_End) as [Item2 Desc],
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_End) as [Item2 TypeID],
			(SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_End)) as [Item2 TypeName],
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_End))  as [Item2 AbstractionID],
			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue 
				WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
					WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') 
						AND ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_End))
						 AND SDTable_ID = SDTable_ID_End 
						AND SD_ID = SD_ID_End) as [Item2 Environment]
	
		 INTO #TempTable1 
		FROM Relation NOLOCK
		WHERE Relation_ID = @ID

		/* * * 2nd table has items' container info  * * */
		SELECT  DISTINCT 

			(SELECT SDTable_ID_Container FROM Container WHERE Container_ID = [Container ID Item1]) as [Item1Container TableID],
			(SELECT SD_ID_Container FROM Container WHERE  Container_ID =  [Container ID Item1]) as [Item1Container ID],
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID =  [Container ID Item1])) as [Item1Container Name],
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID =  [Container ID Item1])) as [Item1Container Desc],
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID =  [Container ID Item1])) as [Item1Container TypeID],
			(SELECT ShapeType_Name FROM ShapeType  WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE  Container_ID =  [Container ID Item1]))) as [Item1Container TypeName],
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID =  [Container ID Item1])))  as [Item1Container AbstractionID],

			[Item1 TableID],
			[Item1 TypeID],
			[Item1 TypeName],
			[Item1 ID],
			[Item1 Name],
			[Item1 Desc],
			[Item1 AbstractionID],

			(SELECT SDTable_ID_Container FROM Container WHERE Container_ID =   [Container ID Item2]) as [Item2Container TableID],
			(SELECT SD_ID_Container FROM Container WHERE  Container_ID =   [Container ID Item2]) as [Item2Container ID],
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID =  [Container ID Item2])) as [Item2Container Name],
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID =   [Container ID Item2])) as [Item2Container Desc],
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID =   [Container ID Item2])) as [Item2Container TypeID],
			(SELECT ShapeType_Name FROM ShapeType  WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE  Container_ID =   [Container ID Item2]))) as [Item2Container TypeName],
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID =   [Container ID Item2])))  as [Item2Container AbstractionID],

			[Item2 TableID],
			[Item2 TypeID],
			[Item2 TypeName],
			[Item2 ID],
			[Item2 Name],
			[Item2 Desc],
			[Item2 AbstractionID],

			[Assoc ID],
			[Assoc Name],
			[Assoc Desc],
			[Assoc TypeID],
			[Assoc AbstractionID],
			[Assoc Direction]

	  	FROM #TempTable1 ORDER BY [Item2Container Name], [Item2 Name], [Assoc Name]
		
		DROP TABLE #TempTable1

	END

ELSE
	BEGIN

		SELECT  DISTINCT

			Container_ID as [Assoc ID],
			NULL as [Assoc Name],	
			NULL as [Assoc Desc],

			(CASE 
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEPOBJECT') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'CROSSRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICEOBJECT') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'CROSSRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'DEVICERELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'STEPRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'OBJECTRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEMOBJECT') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'CROSSRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESSSTEP') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'CROSSRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESS') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'BUSINESSRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEM') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'SYSTEMRELATION')
			 END) as [Assoc TypeID],
			Abstraction_ID as [Assoc AbstractionID],
			 'TO' as [Assoc Direction],
	
			SDTable_ID_Container  as [Item1 TableID],
			SD_ID_Container as [Item1 ID],
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = SD_ID_Container) as [Item1 Name],
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = SD_ID_Container) as [Item1 Desc],
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Container) as [Item1 TypeID],
			(SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Container)) as [Item1 TypeName],
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Container))  as [Item1 AbstractionID],
			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') AND ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Container)) AND SDTable_ID = SDTable_ID_Container AND SD_ID = SD_ID_Container) as [Item1 Environment],

			(CASE
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Container)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='SYSTEMOBJECT')
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Container))= (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='BUSINESSSTEP')
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Container))= (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'PIECE') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='OBJECTPIECE')
			 END) as [Container Item1 AbstractionID],


			SDTable_ID_Contained as[Item2 TableID],
			SD_ID_Contained as [Item2 ID],
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = SD_ID_Contained) as [Item2 Name],
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = SD_ID_Contained) as [Item2 Desc],
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained)  as [Item2 TypeID],
			(SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained)) as [Item2 TypeName],
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID =(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained))  as [Item2 AbstractionID],
			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue 
				WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
					WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') 
						AND ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Container))
						 AND SDTable_ID = SDTable_ID_Container 
						AND SD_ID = SD_ID_Container) as [Item2 Environment],

			(CASE
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID =(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='SYSTEMOBJECT')
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID =(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='BUSINESSSTEP')
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID =(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'PIECE') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='OBJECTPIECE')
			 END) as [Container Item2 AbstractionID]


		 INTO #TempTable3 
		FROM Container NOLOCK
		WHERE Container_ID = @ID 
			AND Abstraction_ID <> (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'ARTIFACT')


		SELECT  DISTINCT

			(SELECT SDTable_ID_Container FROM Container 
				WHERE SDTable_ID_Contained = [Item1 TableID]  AND SD_ID_Contained =  [Item1 ID] AND Abstraction_ID = [Container Item1 AbstractionID]
			) as[Item1Container TableID],
			(SELECT SD_ID_Container FROM Container 
				WHERE SDTable_ID_Contained =  [Item1 TableID]  AND SD_ID_Contained =  [Item1 ID] AND Abstraction_ID =  [Container Item1 AbstractionID]
			) as [Item1Container ID],
			(SELECT Shape_Name FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained =  [Item1 TableID]  AND SD_ID_Contained =  [Item1 ID] AND Abstraction_ID =  [Container Item1 AbstractionID]
				)
			) as [Item1Container Name],
			(SELECT Shape_Desc FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained =  [Item1 TableID]  AND SD_ID_Contained =  [Item1 ID] AND Abstraction_ID =  [Container Item1 AbstractionID]
				)
			) as [Item1Container Desc],
			(SELECT ShapeType_ID FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained =  [Item1 TableID]  AND SD_ID_Contained =  [Item1 ID] AND Abstraction_ID =  [Container Item1 AbstractionID]
				)
			) as [Item1Container TypeID],
			(SELECT ShapeType_Name FROM ShapeType  
				WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape 
					WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
						WHERE SDTable_ID_Contained =  [Item1 TableID]  AND SD_ID_Contained =  [Item1 ID] AND Abstraction_ID =  [Container Item1 AbstractionID]
					)
				)
			) as [Item1Container TypeName],
			(SELECT Abstraction_ID FROM ShapeType 
				WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape 
					WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
						WHERE SDTable_ID_Contained =   [Item1 TableID]  AND SD_ID_Contained =   [Item1 ID] AND Abstraction_ID =  [Container Item1 AbstractionID]
					)
				)
			)  as [Item1Container AbstractionID],

			[Item1 TableID],
			[Item1 TypeID],
			[Item1 TypeName],
			[Item1 ID],
			[Item1 Name],
			[Item1 Desc],
			[Item1 AbstractionID],
			[Container Item1 AbstractionID],
			[Container Item2 AbstractionID],

			(SELECT SDTable_ID_Container FROM Container 
				WHERE SDTable_ID_Contained = [Item2 TableID]  AND SD_ID_Contained = [Item2 ID] AND Abstraction_ID = [Container Item2 AbstractionID]
			) as  [Item2Container TableID],
			(SELECT SD_ID_Container FROM Container 
				WHERE SDTable_ID_Contained = [Item2 TableID]  AND SD_ID_Contained =  [Item2 ID] AND Abstraction_ID = [Container Item2 AbstractionID]
			) as  [Item2Container ID],
			(SELECT Shape_Name FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained = [Item2 TableID]  AND SD_ID_Contained =  [Item2 ID] AND Abstraction_ID = [Container Item2 AbstractionID]
				)
			) as  [Item2Container Name],
			(SELECT Shape_Desc FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained = [Item2 TableID]  AND SD_ID_Contained =  [Item2 ID] AND Abstraction_ID = [Container Item2 AbstractionID]
				)
			) as [Item2Container Desc],
			(SELECT ShapeType_ID FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained = [Item2 TableID]  AND SD_ID_Contained =  [Item2 ID] AND Abstraction_ID =  [Container Item2 AbstractionID]
				)
			) as [Item2Container TypeID],
			(SELECT ShapeType_Name FROM ShapeType  
				WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape 
					WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
						WHERE SDTable_ID_Contained = [Item2 TableID]  AND SD_ID_Contained =  [Item2 ID] AND Abstraction_ID = [Container Item2 AbstractionID]
					)
				)
			) as  [Item2Container TypeName],
			(SELECT Abstraction_ID FROM ShapeType 
				WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape 
					WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
						WHERE SDTable_ID_Contained = [Item2 TableID]  AND SD_ID_Contained =  [Item2 ID] AND Abstraction_ID = [Container Item2 AbstractionID]
					)
				)
			)  as [Item2Container AbstractionID],

			[Item2 TableID],
			[Item2 TypeID],
			[Item2 TypeName],
			[Item2 ID],
			[Item2 Name],
			[Item2 Desc],
			[Item2 AbstractionID],

			[Assoc ID],
			[Assoc Name],
			[Assoc Desc],
			[Assoc TypeID],
			[Assoc AbstractionID],
			[Assoc Direction]

	  	FROM #TempTable3 ORDER BY [Item2Container Name], [Item2 Name], [Assoc Name]

		DROP TABLE #TempTable3

	END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

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
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

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
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

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
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

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
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE [dbo].[GetItem] (@Table as int, @ID as int) 
AS

/*

OBJECTIVE
	retrieve item selected

INPUTS
	@Table - Table to search for
	@ID - ID to search for

OUTPUTS
	IF in Shape Table :  Shape, Lifecycle,ShapeType
	ElSE, all fields in  table

TASKS

NOTES

*/

DECLARE @T varchar(100)
DECLARE @T_ID varchar(103)
DECLARE @ProcSelect varchar(2000)

SET @T = (SELECT SDTable_Name FROM SDTable WHERE SDTable_ID = @Table)
SET @T_ID = @T + '_ID'

IF @T = 'Shape' 
	BEGIN
		SET @ProcSelect = "SELECT * FROM Shape, Lifecycle,ShapeType WHERE Shape_ID = " +  CAST(@ID as varchar(100)) + " AND Lifecycle.Lifecycle_ID = Shape.Lifecycle_ID AND ShapeType.ShapeType_ID = Shape.ShapeType_ID " 
	END
ELSE
	BEGIN
		SET @ProcSelect = "SELECT * FROM " + @T + " WHERE " + @T_ID + " = " +  CAST(@ID as varchar(100))
	END


EXEC (@ProcSelect)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[GetItem_Abstraction] (@Table as int, @ID as int) 
AS

/*

OBJECTIVE
	retrieve abstraction id of item

INPUTS
	@Table - Table to search for
	@ID - ID to search for

OUTPUTS
	Shape_ID, ShapeType_ID, Shape_Name, Shape_Desc, Lifecycle_ID, Abstraction_ID

TASKS

NOTES

*/


select Shape_ID, Shape.ShapeType_ID, Shape_Name, Shape_Desc, Lifecycle_ID, Abstraction_ID
from Shape 
	left join ShapeType  on Shape.ShapeType_ID = ShapeType.ShapeType_ID
where Shape_ID = @ID
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROCEDURE [dbo].[GetItem_AttributeValue] (@Table as int, @ID as int, @STA as int) 
AS

/*

OBJECTIVE
	retrieve shapetypeattribute(s) of an item (shape or relation)

INPUTS
	@Table - Table to search for
	@ID - ID to search for
	@STA - ShapeTypeAttribute to search for

OUTPUTS
	ShapeTypeAttribute_ID, ShapeTypeAttribute_Desc, 
	Attribute_ID, Attribute_Name, AttributeValue_ID, AttributeValue_Value

TASKS
	1. IF this is a shape
		1. IF STA is not specified, GET all attributes w/ their values if @STA is null
		2. ELSE GET specified @STA if value is not null
	2. ELSE this is a relation
		1. IF STA is not specified, GET all attributes w/ their values if @STA is null
		2. ELSE GET specified @STA if value is not null

NOTES
	GET all attributes w/ their values if @STA is null
	GET specified @STA if value is not null

*/
--- 1
IF @Table = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name='Shape')
	BEGIN
		IF @STA IS NULL
			BEGIN
				--- 1.1
				SELECT DISTINCT STA.ShapeTypeAttribute_ID, STA.ShapeTypeAttribute_Desc,
					A.Attribute_ID, A.Attribute_Name,
					AV.AttributeValue_ID, AV.AttributeValue_Value
				FROM AttributeValue AS AV 
					RIGHT JOIN ShapeTypeAttribute AS STA ON AV.ShapeTypeAttribute_ID = STA.ShapeTypeAttribute_ID
						AND AV.SDTable_ID = @Table AND AV.SD_ID = @ID 
					LEFT JOIN ShapeType AS ST ON STA.ShapeType_ID = ST.ShapeType_ID  				
					LEFT JOIN Attribute AS A ON STA.Attribute_ID = A.Attribute_ID
				WHERE ST.ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)
				ORDER BY A.Attribute_Name
			END
		ELSE
			BEGIN
				--- 1.2
				SELECT DISTINCT STA.ShapeTypeAttribute_ID, STA.ShapeTypeAttribute_Desc, 
					A.Attribute_ID, A.Attribute_Name,
					AV.AttributeValue_ID, AV.AttributeValue_Value
				FROM AttributeValue AS AV 
					RIGHT JOIN ShapeTypeAttribute AS STA ON AV.ShapeTypeAttribute_ID = STA.ShapeTypeAttribute_ID
						AND AV.SDTable_ID = @Table AND AV.SD_ID = @ID 
					LEFT JOIN ShapeType AS ST ON STA.ShapeType_ID = ST.ShapeType_ID  				
					LEFT JOIN Attribute AS A ON STA.Attribute_ID = A.Attribute_ID
				WHERE STA.ShapeTypeAttribute_ID = @STA
				ORDER BY A.Attribute_Name
			END
	END
ELSE
--- 2
	BEGIN
		IF @Table = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name='Relation')
			BEGIN
				DECLARE @Abstraction int
				DECLARE @Type int
				SET @Abstraction = (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @ID)
				SET @Type =
					CASE 
						WHEN @Abstraction = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='DEVICE') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'DEVICERELATION')
						WHEN @Abstraction = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='OBJECT') THEN  (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'OBJECTRELATION')
						WHEN @Abstraction = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='SYSTEM') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'SYSTEMRELATION')
						WHEN @Abstraction = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='BUSINESS') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'BUSINESSRELATION')
						WHEN @Abstraction = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='STEP') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'STEPRELATION')
					END
				--- 2.1
				IF @STA IS NULL
					BEGIN
						SELECT DISTINCT STA.ShapeTypeAttribute_ID, STA.ShapeTypeAttribute_Desc, 
							A.Attribute_ID, A.Attribute_Name,
							AV.AttributeValue_ID, AV.AttributeValue_Value
						FROM AttributeValue AS AV 
							RIGHT JOIN ShapeTypeAttribute AS STA ON AV.ShapeTypeAttribute_ID = STA.ShapeTypeAttribute_ID
								AND AV.SDTable_ID = @Table AND AV.SD_ID = @ID 
							LEFT JOIN ShapeType AS ST ON STA.ShapeType_ID = ST.ShapeType_ID  										LEFT JOIN Attribute AS A ON STA.Attribute_ID = A.Attribute_ID
						WHERE ST.ShapeType_ID = @Type
						ORDER BY A.Attribute_Name
					END
				--- 2.2
				ELSE
					BEGIN
						SELECT DISTINCT STA.ShapeTypeAttribute_ID, STA.ShapeTypeAttribute_Desc, 
							A.Attribute_ID, A.Attribute_Name,
							AV.AttributeValue_ID, AV.AttributeValue_Value
						FROM AttributeValue AS AV 
							RIGHT JOIN ShapeTypeAttribute AS STA ON AV.ShapeTypeAttribute_ID = STA.ShapeTypeAttribute_ID
								AND AV.SDTable_ID = @Table AND AV.SD_ID = @ID 
							LEFT JOIN ShapeType AS ST ON STA.ShapeType_ID = ST.ShapeType_ID  										LEFT JOIN Attribute AS A ON STA.Attribute_ID = A.Attribute_ID
						WHERE STA.ShapeTypeAttribute_ID = @STA
						ORDER BY A.Attribute_Name
					END
			END
	END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[GetItem_ConstrainedValues] (@Table as int, @ID as int) 
AS

/*

OBJECTIVE
	retrieve ConstrainedValue id of item

INPUTS
	@Table - Table to search for
	@ID - ID to search for

OUTPUTS
	all fields of ConstrainedValue table

TASKS

NOTES

*/

SELECT *
FROM ConstrainedValue
WHERE SDTable_ID = @Table 
	AND SD_ID = @ID
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[GetItem_Contained] (@Table as int, @ID as int, @Abstraction as int) 
AS


/*

OBJECTIVE
	retrieve item(s) contained by ID

INPUTS
	@Table - Table to search for
	@ID - ID to search for
	@Abstraction - type of container (artifact or other)

OUTPUTS
	Assoc_ID,Assoc_Name,Assoc_Desc,Assoc_TypeID,Assoc_AbstractionID,Assoc_Direction,
	Principal_TableID,Principal_ID,Principal_Name,Principal_Desc,Principal_TypeID,Principal_TypeName,Principal_AbstractionID,Principal_Environment,
	PrincipalContainer_TableID,PrincipalContainer_ID,PrincipalContainer_Name,PrincipalContainer_Desc,PrincipalContainer_TypeID,PrincipalContainer_TypeName,PrincipalContainer_AbstractionID,
	Related_TableID,Related_ID,Related_Name,Related_Desc,Related_TypeID,Related_TypeName,Related_AbstractionID,Related_Environment,
	RelatedContainer_TableID,RelatedContainer_ID,RelatedContainer_Name,RelatedContainer_Desc,RelatedContainer_TypeID,RelatedContainer_TypeName,RelatedContainer_AbstractionID

TASKS
	1. IF association is an artifact container
	2. ELSE (association is a shape container)
		1. CREATE temptable
		2. DELETE temptable

NOTES

*/

BEGIN TRAN

--- 1
IF @Abstraction = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'ARTIFACT') 
	BEGIN

		SELECT  DISTINCT

			Container_ID  as "Assoc_ID",
			NULL as "Assoc_Name",	
			NULL  as  "Assoc_Desc",
			NULL as "Assoc_TypeID",
			Abstraction_ID as "Assoc_AbstractionID",
			 'TO' as "Assoc_Direction",
	
			@Table  as "Principal_TableID",
			@ID as "Principal_ID",
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = @ID) as "Principal_Name",
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = @ID) as "Principal_Desc",
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID) as "Principal_TypeID",
			(SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) as "Principal_TypeName",
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID))  as "Principal_AbstractionID",
			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') AND ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) AND SDTable_ID = @Table AND SD_ID = @ID) as "Principal_Environment",

			NULL as "PrincipalContainer_TableID",
			NULL as "PrincipalContainer_ID",
			NULL as "PrincipalContainer_Name",
			NULL as "PrincipalContainer_Desc",
			NULL as "PrincipalContainer_TypeID",
			NULL as "PrincipalContainer_TypeName",
			NULL as "PrincipalContainer_AbstractionID",

			SDTable_ID_Contained as "Related_TableID",
			SD_ID_Contained as "Related_ID",
			(SELECT Artifact_Name FROM Artifact WHERE Artifact_ID = SD_ID_Contained) as "Related_Name",
			(SELECT Artifact_Loc FROM Artifact WHERE Artifact_ID = SD_ID_Contained) as "Related_Desc",
			NULL as "Related_TypeID",
			NULL as "Related_TypeName",
			@Abstraction  as "Related_AbstractionID",
			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') AND ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained)) AND SDTable_ID = SDTable_ID_Contained AND SD_ID = SD_ID_Contained) as "Related_Environment",

			NULL as "RelatedContainer_TableID",
			NULL as "RelatedContainer_ID",
			NULL as "RelatedContainer_Name",
			NULL as "RelatedContainer_Desc",
			NULL as "RelatedContainer_TypeID",
			NULL as "RelatedContainer_TypeName",
			NULL as "RelatedContainer_AbstractionID"

		FROM Container NOLOCK
		WHERE SDTable_ID_Container = @Table 
			AND SD_ID_Container = @ID 
			AND Abstraction_ID  = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'ARTIFACT')
		 ORDER BY Related_Name

	END
--- 2
ELSE
	BEGIN
		--- 2.1
		SELECT  DISTINCT

			Container_ID  as "Assoc_ID",
			NULL as "Assoc_Name",	
			NULL  as  "Assoc_Desc",

			(CASE 
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEPOBJECT') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'CROSSRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICEOBJECT') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'CROSSRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'DEVICERELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'STEPRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'OBJECTRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEMOBJECT') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'CROSSRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESSSTEP') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'CROSSRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESS') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'BUSINESSRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEM') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'SYSTEMRELATION')
			 END) as "Assoc_TypeID",
			Abstraction_ID as "Assoc_AbstractionID",
			 'TO' as "Assoc_Direction",
	
			@Table  as "Principal_TableID",
			@ID as "Principal_ID",
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = @ID) as "Principal_Name",
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = @ID) as "Principal_Desc",
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID) as "Principal_TypeID",
			(SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) as "Principal_TypeName",
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID))  as "Principal_AbstractionID",
			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') AND ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) AND SDTable_ID = @Table AND SD_ID = @ID) as "Principal_Environment", 

			(CASE
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='SYSTEMOBJECT')
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID))= (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='BUSINESSSTEP')
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID))= (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'PIECE') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='OBJECTPIECE')
			 END) as "Container_Principal_AbstractionID",


			SDTable_ID_Contained as "Related_TableID",
			SD_ID_Contained as "Related_ID",
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = SD_ID_Contained) as "Related_Name",
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = SD_ID_Contained) as "Related_Desc",
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained)  as "Related_TypeID",
			(SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained)) as "Related_TypeName",
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID =(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained))  as "Related_AbstractionID",

			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue 
				WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
					WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') 
						AND ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Container))
						 AND SDTable_ID = SDTable_ID_Container 
						AND SD_ID = SD_ID_Container) as "Related_Environment",


			(CASE
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID =(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='SYSTEMOBJECT')
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID =(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='BUSINESSSTEP')
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID =(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'PIECE') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='OBJECTPIECE')
			 END) as "Container_Related_AbstractionID"


		 INTO #TempTable1 
		FROM Container NOLOCK
		WHERE SDTable_ID_Container = @Table 
			AND SD_ID_Container = @ID 
			AND Abstraction_ID  <> (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'ARTIFACT')

		IF @Abstraction IS NOT NULL
			BEGIN
				DELETE FROM #TempTable1 WHERE Assoc_AbstractionID <> @Abstraction
			END


		SELECT  DISTINCT  *,

			(SELECT SDTable_ID_Container FROM Container 
				WHERE SDTable_ID_Contained = Principal_TableID  AND SD_ID_Contained = Principal_ID AND Abstraction_ID = Container_Principal_AbstractionID
			) as "PrincipalContainer_TableID",
			(SELECT SD_ID_Container FROM Container 
				WHERE SDTable_ID_Contained = Principal_TableID  AND SD_ID_Contained = Principal_ID AND Abstraction_ID = Container_Principal_AbstractionID
			) as "PrincipalContainer_ID",
			(SELECT Shape_Name FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained = Principal_TableID  AND SD_ID_Contained = Principal_ID AND Abstraction_ID = Container_Principal_AbstractionID
				)
			) as "PrincipalContainer_Name",
			(SELECT Shape_Desc FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained = Principal_TableID  AND SD_ID_Contained = Principal_ID AND Abstraction_ID = Container_Principal_AbstractionID
				)
			) as "PrincipalContainer_Desc",
			(SELECT ShapeType_ID FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained = Principal_TableID  AND SD_ID_Contained = Principal_ID AND Abstraction_ID = Container_Principal_AbstractionID
				)
			) as "PrincipalContainer_TypeID",
			(SELECT ShapeType_Name FROM ShapeType  
				WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape 
					WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
						WHERE SDTable_ID_Contained = Principal_TableID  AND SD_ID_Contained = Principal_ID AND Abstraction_ID = Container_Principal_AbstractionID
					)
				)
			) as "PrincipalContainer_TypeName",
			(SELECT Abstraction_ID FROM ShapeType 
				WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape 
					WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
						WHERE SDTable_ID_Contained = Principal_TableID  AND SD_ID_Contained = Principal_ID AND Abstraction_ID = Container_Principal_AbstractionID
					)
				)
			)  as "PrincipalContainer_AbstractionID",

			(SELECT SDTable_ID_Container FROM Container 
				WHERE SDTable_ID_Contained = Related_TableID  AND SD_ID_Contained = Related_ID AND Abstraction_ID = Container_Related_AbstractionID
			) as "RelatedContainer_TableID",
			(SELECT SD_ID_Container FROM Container 
				WHERE SDTable_ID_Contained = Related_TableID  AND SD_ID_Contained = Related_ID AND Abstraction_ID = Container_Related_AbstractionID
			) as "RelatedContainer_ID",
			(SELECT Shape_Name FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained = Related_TableID  AND SD_ID_Contained = Related_ID AND Abstraction_ID = Container_Related_AbstractionID
				)
			) as "RelatedContainer_Name",
			(SELECT Shape_Desc FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained = Related_TableID  AND SD_ID_Contained = Related_ID AND Abstraction_ID = Container_Related_AbstractionID
				)
			) as "RelatedContainer_Desc",
			(SELECT ShapeType_ID FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained = Related_TableID  AND SD_ID_Contained = Related_ID AND Abstraction_ID = Container_Related_AbstractionID
				)
			) as "RelatedContainer_TypeID",
			(SELECT ShapeType_Name FROM ShapeType  
				WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape 
					WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
						WHERE SDTable_ID_Contained = Related_TableID  AND SD_ID_Contained = Related_ID AND Abstraction_ID = Container_Related_AbstractionID
					)
				)
			) as "RelatedContainer_TypeName",
			(SELECT Abstraction_ID FROM ShapeType 
				WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape 
					WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
						WHERE SDTable_ID_Contained = Related_TableID  AND SD_ID_Contained = Related_ID AND Abstraction_ID = Container_Related_AbstractionID
					)
				)
			)  as "RelatedContainer_AbstractionID"

	  	FROM #TempTable1 ORDER BY RelatedContainer_Name, Related_Name, Assoc_Name

		--- 2.2
		DROP TABLE #TempTable1

	END

COMMIT TRAN
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE [dbo].[GetItem_Container] (@Table as int, @ID as int, @Abstraction as int) 

AS

/*

OBJECTIVE
	retrieve container item of this ID

INPUTS
	@Table - Table to search for
	@ID - ID to search for
	@Abstraction - type of container (artifact or other)

OUTPUTS
	Assoc_ID,Assoc_Name,Assoc_Desc,Assoc_TypeID,Assoc_AbstractionID,Assoc_Direction,
	Principal_TableID,Principal_ID,Principal_Name,Principal_Desc,Principal_TypeID,Principal_TypeName,Principal_AbstractionID,Principal_Environment,
	PrincipalContainer_TableID,PrincipalContainer_ID,PrincipalContainer_Name,PrincipalContainer_Desc,PrincipalContainer_TypeID,PrincipalContainer_TypeName,PrincipalContainer_AbstractionID,
	Related_TableID,Related_ID,Related_Name,Related_Desc,Related_TypeID,Related_TypeName,Related_AbstractionID,Related_Environment,
	RelatedContainer_TableID,RelatedContainer_ID,RelatedContainer_Name,RelatedContainer_Desc,RelatedContainer_TypeID,RelatedContainer_TypeName,RelatedContainer_AbstractionID

TASKS
	1. IF association is an artifact container
	2. ELSE (association is a shape container)
		1. CREATE temptable
		2. DELETE temptable

NOTES

*/

BEGIN TRAN
--- 1
IF @Abstraction = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'ARTIFACT') 
	BEGIN

		SELECT  DISTINCT

			Container_ID  as "Assoc_ID",
			NULL as "Assoc_Name",	
			NULL  as  "Assoc_Desc",
			NULL as "Assoc_TypeID",
			Abstraction_ID as "Assoc_AbstractionID",
			 'TO' as "Assoc_Direction",
	
			@Table  as "Principal_TableID",
			@ID as "Principal_ID",
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = @ID) as "Principal_Name",
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = @ID) as "Principal_Desc",
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID) as "Principal_TypeID",
			(SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) as "Principal_TypeName",
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID))  as "Principal_AbstractionID",
			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') AND ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) AND SDTable_ID = @Table AND SD_ID = @ID) as "Principal_Environment",

			NULL as "PrincipalContainer_TableID",
			NULL as "PrincipalContainer_ID",
			NULL as "PrincipalContainer_Name",
			NULL as "PrincipalContainer_Desc",
			NULL as "PrincipalContainer_TypeID",
			NULL as "PrincipalContainer_TypeName",
			NULL as "PrincipalContainer_AbstractionID",

			SDTable_ID_Contained as "Related_TableID",
			SD_ID_Contained as "Related_ID",
			(SELECT Artifact_Name FROM Artifact WHERE Artifact_ID = SD_ID_Contained) as "Related_Name",
			(SELECT Artifact_Loc FROM Artifact WHERE Artifact_ID = SD_ID_Contained) as "Related_Desc",
			NULL as "Related_TypeID",
			NULL as "Related_TypeName",
			@Abstraction  as "Related_AbstractionID",
			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') AND ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained)) AND SDTable_ID = SDTable_ID_Contained AND SD_ID = SD_ID_Contained) as "Related_Environment",

			NULL as "RelatedContainer_TableID",
			NULL as "RelatedContainer_ID",
			NULL as "RelatedContainer_Name",
			NULL as "RelatedContainer_Desc",
			NULL as "RelatedContainer_TypeID",
			NULL as "RelatedContainer_TypeName",
			NULL as "RelatedContainer_AbstractionID"

		FROM Container NOLOCK
		WHERE SDTable_ID_Container = @Table 
			AND SD_ID_Container = @ID 
			AND Abstraction_ID  = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'ARTIFACT')
		 ORDER BY Related_Name

	END

--- 2
ELSE
	BEGIN
		--- 2.1
		SELECT  DISTINCT

			Container_ID  as "Assoc_ID",
			NULL as "Assoc_Name",	
			NULL  as  "Assoc_Desc",

			(CASE 
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEPOBJECT') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'CROSSRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICEOBJECT') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'CROSSRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'DEVICERELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'STEPRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'OBJECTRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEMOBJECT') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'CROSSRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESSSTEP') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'CROSSRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESS') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'BUSINESSRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEM') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'SYSTEMRELATION')
			 END) as "Assoc_TypeID",
			Abstraction_ID as "Assoc_AbstractionID",
			 'FROM' as "Assoc_Direction",
	
			@Table  as "Principal_TableID",
			@ID as "Principal_ID",
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = @ID) as "Principal_Name",
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = @ID) as "Principal_Desc",
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID) as "Principal_TypeID",
			(SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) as "Principal_TypeName",
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID))  as "Principal_AbstractionID",
			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') AND ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) AND SDTable_ID = @Table AND SD_ID = @ID) as "Principal_Environment",

			(CASE
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='SYSTEMOBJECT')
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID))= (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='BUSINESSSTEP')
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID))= (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'PIECE') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='OBJECTPIECE')
			 END) as "Container_Principal_AbstractionID",

			SDTable_ID_Container as "Related_TableID",
			SD_ID_Container as "Related_ID",
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = SD_ID_Container) as "Related_Name",
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = SD_ID_Container) as "Related_Desc",
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Container)  as "Related_TypeID",
			(SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Container)) as "Related_TypeName",
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID =(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Container))  as "Related_AbstractionID",
			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue 
				WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
					WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') 
						AND ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Container))
						 AND SDTable_ID = SDTable_ID_Container 
						AND SD_ID = SD_ID_Container) as "Related_Environment",

			(CASE
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID =(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Container)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='SYSTEMOBJECT')
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID =(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Container)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='BUSINESSSTEP')
				WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID =(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Container)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'PIECE') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='OBJECTPIECE')
			 END) as "Container_Related_AbstractionID"



		 INTO #TempTable1 
		FROM Container NOLOCK
		WHERE SDTable_ID_Contained = @Table 
			AND SD_ID_Contained = @ID 
			AND Abstraction_ID  <> (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'ARTIFACT')


		IF @Abstraction IS NOT NULL
			BEGIN
				DELETE FROM #TempTable1 WHERE Assoc_AbstractionID <> @Abstraction
			END


		SELECT  DISTINCT *,

			(SELECT SDTable_ID_Container FROM Container 
				WHERE SDTable_ID_Contained = Principal_TableID  AND SD_ID_Contained = Principal_ID AND Abstraction_ID = Container_Principal_AbstractionID
			) as "PrincipalContainer_TableID",
			(SELECT SD_ID_Container FROM Container 
				WHERE SDTable_ID_Contained = Principal_TableID  AND SD_ID_Contained = Principal_ID AND Abstraction_ID = Container_Principal_AbstractionID
			) as "PrincipalContainer_ID",
			(SELECT Shape_Name FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained = Principal_TableID  AND SD_ID_Contained = Principal_ID AND Abstraction_ID = Container_Principal_AbstractionID
				)
			) as "PrincipalContainer_Name",
			(SELECT Shape_Desc FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained = Principal_TableID  AND SD_ID_Contained = Principal_ID AND Abstraction_ID = Container_Principal_AbstractionID
				)
			) as "PrincipalContainer_Desc",
			(SELECT ShapeType_ID FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained = Principal_TableID  AND SD_ID_Contained = Principal_ID AND Abstraction_ID = Container_Principal_AbstractionID
				)
			) as "PrincipalContainer_TypeID",
			(SELECT ShapeType_Name FROM ShapeType  
				WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape 
					WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
						WHERE SDTable_ID_Contained = Principal_TableID  AND SD_ID_Contained = Principal_ID AND Abstraction_ID = Container_Principal_AbstractionID
					)
				)
			) as "PrincipalContainer_TypeName",
			(SELECT Abstraction_ID FROM ShapeType 
				WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape 
					WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
						WHERE SDTable_ID_Contained = Principal_TableID  AND SD_ID_Contained = Principal_ID AND Abstraction_ID = Container_Principal_AbstractionID
					)
				)
			)  as "PrincipalContainer_AbstractionID",

			(SELECT SDTable_ID_Container FROM Container 
				WHERE SDTable_ID_Contained = Related_TableID  AND SD_ID_Contained = Related_ID AND Abstraction_ID = Container_Related_AbstractionID
			) as "RelatedContainer_TableID",
			(SELECT SD_ID_Container FROM Container 
				WHERE SDTable_ID_Contained = Related_TableID  AND SD_ID_Contained = Related_ID AND Abstraction_ID = Container_Related_AbstractionID
			) as "RelatedContainer_ID",
			(SELECT Shape_Name FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained = Related_TableID  AND SD_ID_Contained = Related_ID AND Abstraction_ID = Container_Related_AbstractionID
				)
			) as "RelatedContainer_Name",
			(SELECT Shape_Desc FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained = Related_TableID  AND SD_ID_Contained = Related_ID AND Abstraction_ID = Container_Related_AbstractionID
				)
			) as "RelatedContainer_Desc",
			(SELECT ShapeType_ID FROM Shape 
				WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
					WHERE SDTable_ID_Contained = Related_TableID  AND SD_ID_Contained = Related_ID AND Abstraction_ID = Container_Related_AbstractionID
				)
			) as "RelatedContainer_TypeID",
			(SELECT ShapeType_Name FROM ShapeType  
				WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape 
					WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
						WHERE SDTable_ID_Contained = Related_TableID  AND SD_ID_Contained = Related_ID AND Abstraction_ID = Container_Related_AbstractionID
					)
				)
			) as "RelatedContainer_TypeName",
			(SELECT Abstraction_ID FROM ShapeType 
				WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape 
					WHERE Shape_ID = (SELECT SD_ID_Container FROM Container 
						WHERE SDTable_ID_Contained = Related_TableID  AND SD_ID_Contained = Related_ID AND Abstraction_ID = Container_Related_AbstractionID
					)
				)
			)  as "RelatedContainer_AbstractionID"

	  	FROM #TempTable1 ORDER BY RelatedContainer_Name, Related_Name, Assoc_Name

		--- 2.2
		DROP TABLE #TempTable1

	END

COMMIT TRAN
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[GetItem_Relation] (@Relation as int, @Table as int, @ID as int, @Abstraction as int) 


/*

OBJECTIVE
	retrieve relation info

INPUTS
	@Relation - relation ID to search for
	@Table - Table to search for
	@ID - ID to search for
	@Abstraction - type of relation

OUTPUTS
	Assoc_ID,Assoc_Name,Assoc_Desc,Assoc_TypeID,Assoc_AbstractionID,Assoc_Direction,
	Container_ID_Principal
	Principal_TableID,Principal_ID,Principal_Name,Principal_Desc,Principal_TypeID,Principal_TypeName,Principal_AbstractionID,Principal_Environment,
	PrincipalContainer_TableID,PrincipalContainer_ID,PrincipalContainer_Name,PrincipalContainer_Desc,PrincipalContainer_TypeID,PrincipalContainer_TypeName,PrincipalContainer_AbstractionID,
	Container_ID_Related
	Related_TableID,Related_ID,Related_Name,Related_Desc,Related_TypeID,Related_TypeName,Related_AbstractionID,Related_Environment,
	RelatedContainer_TableID,RelatedContainer_ID,RelatedContainer_Name,RelatedContainer_Desc,RelatedContainer_TypeID,RelatedContainer_TypeName,RelatedContainer_AbstractionID

TASKS
	1. IF @Relation IS NOT NULL get that Relation only
		1. create a temptable first with just the items
		2. ADD TEMP COLUMN OF Container_ID to look for for each item
		3. DELETE temptable
	2. ELSE get all Relation of that item, setting Begin as Principal and End as Related
		1. create a temptable first with just the items
		2. ADD TEMP COLUMN OF Container_ID to look for for each item
		3. IF abstraction is specified, delete rows that do not match
		4. FILL in previously NULL columns
		5. DELETE temptable

NOTES

*/

AS


DECLARE @Column_var varchar(2000)
DECLARE @Column_int int

--- 1
IF @Relation  IS NOT NULL
	BEGIN
                               ---- 1.1
		SELECT  DISTINCT
			Relation_ID as "Assoc_ID",
			IsNULL(Relation_Name,'') as "Assoc_Name",	
			IsNULL(Relation_Desc,'') as "Assoc_Desc",
			(CASE 
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'STEPRELATION')
				WHEN Abstraction_ID =  (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'DEVICERELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'OBJECTRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESS') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'BUSINESSRELATION')
				WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEM') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'SYSTEMRELATION')
			 END) as "Assoc_TypeID",
			Abstraction_ID as "Assoc_AbstractionID",
			"TO" as "Assoc_Direction",

			--- 1.2
			(SELECT Container_ID FROM Container 
				WHERE SDTable_ID_Contained = SDTable_ID_Begin 
					AND SD_ID_Contained = SD_ID_Begin 
					AND Container.Abstraction_ID = (CASE 
					WHEN  (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @Relation) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESSSTEP')
					WHEN  (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @Relation) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE')
					WHEN  (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @Relation) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT')THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEMOBJECT')
					 END)
			) as "Container_ID_Principal",
	
			SDTable_ID_Begin  as "Principal_TableID",
			SD_ID_Begin as "Principal_ID",
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = SD_ID_Begin) as "Principal_Name",
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = SD_ID_Begin) as "Principal_Desc",
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Begin) as "Principal_TypeID",
			(SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Begin)) as "Principal_TypeName",
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Begin))  as "Principal_AbstractionID",
			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue 
				WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
					WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') 
						AND ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Begin))
						 AND SDTable_ID = SDTable_ID_Begin 
						AND SD_ID = SD_ID_Begin) as "Principal_Environment",

			--- 1.2
			(SELECT Container_ID FROM Container 
				WHERE SDTable_ID_Contained = SDTable_ID_End
					AND SD_ID_Contained = SD_ID_End
					AND Abstraction_ID = (CASE 
					WHEN (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @Relation) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESSSTEP')
					WHEN (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @Relation) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE')
					WHEN (SELECT Abstraction_ID FROM Relation WHERE Relation_ID = @Relation) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT')THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEMOBJECT')
				 END)
			) as "Container_ID_Related",

			SDTable_ID_End as "Related_TableID",
			SD_ID_End as "Related_ID",
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = SD_ID_End) as "Related_Name",
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = SD_ID_End) as "Related_Desc",
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_End) as "Related_TypeID",
			(SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_End)) as "Related_TypeName",
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_End))  as "Related_AbstractionID",
			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue 
				WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
					WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') 
						AND ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_End))
						 AND SDTable_ID = SDTable_ID_End 
						AND SD_ID = SD_ID_End) as "Related_Environment"
	
		 INTO #TempTable1 
		FROM Relation NOLOCK
		WHERE Relation_ID = @Relation

		/* * * 2nd table has items' container info  * * */
		SELECT  DISTINCT *,

			(SELECT SDTable_ID_Container FROM Container WHERE Container_ID = Container_ID_Principal) as "PrincipalContainer_TableID",
			(SELECT SD_ID_Container FROM Container WHERE  Container_ID = Container_ID_Principal) as "PrincipalContainer_ID",
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Principal)) as "PrincipalContainer_Name",
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Principal)) as "PrincipalContainer_Desc",
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Principal)) as "PrincipalContainer_TypeID",
			(SELECT ShapeType_Name FROM ShapeType  WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE  Container_ID = Container_ID_Principal))) as "PrincipalContainer_TypeName",
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Principal)))  as "PrincipalContainer_AbstractionID",

			(SELECT SDTable_ID_Container FROM Container WHERE Container_ID = Container_ID_Related) as "RelatedContainer_TableID",
			(SELECT SD_ID_Container FROM Container WHERE  Container_ID = Container_ID_Related) as "RelatedContainer_ID",
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Related)) as "RelatedContainer_Name",
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Related)) as "RelatedContainer_Desc",
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Related)) as "RelatedContainer_TypeID",
			(SELECT ShapeType_Name FROM ShapeType  WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE  Container_ID = Container_ID_Related))) as "RelatedContainer_TypeName",
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Related)))  as "RelatedContainer_AbstractionID"
	
	  	FROM #TempTable1 ORDER BY RelatedContainer_Name, Related_Name, Assoc_Name
		
		--- 1.3
		DROP TABLE #TempTable1

	END
--- 2
ELSE

	BEGIN
		--- 2.1

		DECLARE @NULL_varchar  VARCHAR(50)
		DECLARE @NULL_int  INT

		SELECT  DISTINCT

			Relation_ID  as "Assoc_ID",
			Relation_Name as "Assoc_Name",	
			Relation_Desc as  "Assoc_Desc",

			(CASE 
				WHEN (Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP')) THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'STEPRELATION')
				WHEN (Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE')) THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'DEVICERELATION')
				WHEN (Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT')) THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'OBJECTRELATION')
				WHEN (Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESS')) THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'BUSINESSRELATION')
				WHEN (Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEM')) THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'SYSTEMRELATION')
			 END) as "Assoc_TypeID",

			Abstraction_ID as "Assoc_AbstractionID",
			(CASE
				WHEN SD_ID_Begin = @ID THEN 'TO'
				ELSE  'FROM'
			END) as "Assoc_Direction",

			@NULL_int as "Container_ID_Principal",
	

			@Table  as "Principal_TableID",
			@ID as "Principal_ID",
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = @ID) as "Principal_Name",
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = @ID) as "Principal_Desc",
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID) as "Principal_TypeID",
			(SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) as "Principal_TypeName",
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID))  as "Principal_AbstractionID",

			@NULL_varchar as "Principal_Environment",

			@NULL_int as "Container_ID_Related",

			(CASE
				WHEN @ID = SD_ID_End THEN SDTable_ID_Begin
				ELSE  SDTable_ID_End
			END) as "Related_TableID",
			(CASE
				WHEN @ID = SD_ID_End THEN SD_ID_Begin
				ELSE  SD_ID_End
			END) as "Related_ID",
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = 
				(CASE
					WHEN @ID = SD_ID_End THEN SD_ID_Begin
					ELSE  SD_ID_End
				END)) as "Related_Name",
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID =
				(CASE
					WHEN @ID = SD_ID_End THEN SD_ID_Begin
					ELSE  SD_ID_End
				END)) as "Related_Desc",
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = 
				(CASE
					WHEN @ID = SD_ID_End THEN SD_ID_Begin
					ELSE  SD_ID_End
				END)) as "Related_TypeID",
			(SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = 
				(CASE
					WHEN @ID = SD_ID_End THEN SD_ID_Begin
					ELSE  SD_ID_End
				END))) as "Related_TypeName",
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = 
				(CASE
					WHEN @ID = SD_ID_End THEN SD_ID_Begin
					ELSE  SD_ID_End
				END)))  as "Related_AbstractionID",

		@NULL_varchar as "Related_Environment"

		 INTO #TempTable3 
		FROM Relation NOLOCK
		WHERE (SDTable_ID_Begin = @Table AND SD_ID_Begin = @ID) OR (SDTable_ID_End = @Table AND SD_ID_End = @ID)


		--- 2.2

		IF @Abstraction IS NOT NULL
			BEGIN
				DELETE FROM #TempTable3 WHERE Assoc_AbstractionID <> @Abstraction
			END

		--- 2.3

		UPDATE #TempTable3 SET Container_ID_Principal =
			(SELECT Container_ID FROM Container 
				WHERE SDTable_ID_Contained = #TempTable3.Principal_TableID
					AND SD_ID_Contained = #TempTable3.Principal_ID
					AND Abstraction_ID = (CASE 
					WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESSSTEP')
					WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE')
					WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEMOBJECT')
				 END)
			) 

		UPDATE #TempTable3 SET Principal_Environment =
			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue 
				WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
					WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') 
						AND ShapeType_ID = #TempTable3.Principal_TypeID)
						 AND SDTable_ID = #TempTable3.Principal_TableID
						AND SD_ID = #TempTable3.Principal_ID) 

		UPDATE #TempTable3 SET Container_ID_Related =
			(SELECT Container_ID FROM Container 
				WHERE SDTable_ID_Contained = #TempTable3.Related_TableID
					AND SD_ID_Contained = #TempTable3.Related_ID
					AND Abstraction_ID = (CASE 
					WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESSSTEP')
					WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE')
					WHEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = @ID)) = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEMOBJECT')
				 END)
			) 

		UPDATE #TempTable3 SET Related_Environment =
			(SELECT DISTINCT AttributeValue_Value FROM AttributeValue 
				WHERE ShapeTypeAttribute_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
					WHERE Attribute_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Environment') 
						AND ShapeType_ID = #TempTable3.Related_TypeID)
						 AND SDTable_ID = #TempTable3.Related_TableID
						AND SD_ID = #TempTable3.Related_ID) 

		/* * * 2nd table has items' container info  * * */


		SELECT  DISTINCT *,

			(SELECT SDTable_ID_Container FROM Container WHERE Container_ID = Container_ID_Principal) as "PrincipalContainer_TableID",
			(SELECT SD_ID_Container FROM Container WHERE  Container_ID = Container_ID_Principal) as "PrincipalContainer_ID",
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Principal)) as "PrincipalContainer_Name",
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Principal)) as "PrincipalContainer_Desc",
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Principal)) as "PrincipalContainer_TypeID",
			(SELECT ShapeType_Name FROM ShapeType  WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE  Container_ID = Container_ID_Principal))) as "PrincipalContainer_TypeName",
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Principal)))  as "PrincipalContainer_AbstractionID",

			(SELECT SDTable_ID_Container FROM Container WHERE Container_ID = Container_ID_Related) as "RelatedContainer_TableID",
			(SELECT SD_ID_Container FROM Container WHERE  Container_ID = Container_ID_Related) as "RelatedContainer_ID",
			(SELECT Shape_Name FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Related)) as "RelatedContainer_Name",
			(SELECT Shape_Desc FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Related)) as "RelatedContainer_Desc",
			(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Related)) as "RelatedContainer_TypeID",
			(SELECT ShapeType_Name FROM ShapeType  WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE  Container_ID = Container_ID_Related))) as "RelatedContainer_TypeName",
			(SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = (SELECT ShapeType_ID FROM Shape WHERE Shape_ID = (SELECT SD_ID_Container FROM Container WHERE Container_ID = Container_ID_Related)))  as "RelatedContainer_AbstractionID"
	
	  	FROM #TempTable3  ORDER BY RelatedContainer_Name, Related_Name, Assoc_Name
		
		--- 2.4
		DROP TABLE #TempTable3

	END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[GetItem_Search] (@Function as int, @Abstraction as int, @Type as int, @Attribute as int, @Value as varchar(1000)) 

AS

/*

OBJECTIVE
	retrieve item according to search criteria

INPUTS
	@Function - function(field) criteria
	@Abstraction - abstraction criteria
	@Type - shapetype criteria
	@Attribute -attribute criteria
	@Value - search string

OUTPUTS
	SDLogFunction, 
	Item_ID, Item_Name, Item_Desc, Item_Value, Item_Field, Item_Type, Item_TypeID, Item_Abstraction
	ShapeTypeAttribute_ID, 
	Attribute_ID, 

TASKS
	1. SELECT every record that fits the pattern
	2. FILTER OUT : DELETE BY FUNCTION CRITERIA
	3. FILTER OUT : DELETE BY ABSTRACTION CRITERIA
	4. FILTER OUT : DELETE BY SHAPETYPE CRITERIA
	5. FILTER OUT : DELETE BY ATTRIBUTE CRITERIA
	6. DELETE temptable

NOTES
	use the @Function criteria to sort out which field name to display (name, desciption, or attribute)
*/

DECLARE @Columnint int
DECLARE @Columnvar varchar(2000)
DECLARE @Pattern varchar(500)

SET @Pattern = "%" + CAST(@Value as varchar) + "%"
--- 1
SELECT 	(SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_ATTRIBUTEVALUE')  as "SDLogFunction", 
	Shape_ID as "Item_ID", Shape_Name as "Item_Name", Shape_Desc as "Item_Desc", AttributeValue_Value as "Item_Value",	
	STA.ShapeTypeAttribute_ID, A.Attribute_ID,  A.Attribute_Name as "Item_Field", 
	ST.ShapeType_Name as "Item_Type", ST.ShapeType_ID as "Item_TypeID", ST.Abstraction_ID as "Item_Abstraction"
	INTO #Temp
	FROM AttributeValue as AV 
		LEFT JOIN ShapeTypeAttribute as STA ON STA.ShapeTypeAttribute_ID = AV.ShapeTypeAttribute_ID 
		LEFT JOIN Attribute as A ON STA.Attribute_ID = A.Attribute_ID
		LEFT JOIN ShapeType as ST ON STA.ShapeType_ID = ST.ShapeType_ID
		LEFT JOIN Shape as S ON AV.SD_ID = S.Shape_ID
	WHERE AV.AttributeValue_Value LIKE @Pattern 
		AND STA.ShapeTypeAttribute_ID IS NOT NULL  AND AV.SDTable_ID = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Shape')
UNION
SELECT (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_NAME') as "SDLogFunction", 
	Shape_ID as "Item_ID", Shape_Name as "Item_Name", Shape_Desc as "Item_Desc", Shape_Name as "Item_Value",	
	@Columnint as "ShapeTypeAttribute_ID", @Columnint as "Attribute_ID", "Name" as "Item_Field", 
	ST.ShapeType_Name as "Item_Type", ST.ShapeType_ID as "Item_TypeID", ST.Abstraction_ID as "Item_Abstraction"
	FROM Shape as S 
		LEFT JOIN ShapeType as ST ON S.ShapeType_ID = ST.ShapeType_ID
	WHERE S.Shape_Name LIKE @Pattern
UNION
SELECT (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_DESCRIPTION')  as "SDLogFunction", Shape_ID as "Item_ID", Shape_Name as "Item_Name", Shape_Desc as "Item_Desc", Shape_Desc as "Item_Value",	
	@ColumnVar as "ShapeTypeAttribute_ID", @Columnint as "Attribute_ID", "Description" as "Item_Field", 
	ST.ShapeType_Name as "Item_Type", ST.ShapeType_ID as "Item_TypeID", ST.Abstraction_ID as "Item_Abstraction"
	FROM Shape as S 
		LEFT JOIN ShapeType as ST ON S.ShapeType_ID = ST.ShapeType_ID
	WHERE S.Shape_Desc LIKE @Pattern

--- 2
IF @Function IS NOT NULL
BEGIN
	DELETE FROM #Temp WHERE SDLogFunction <> @Function 
END

--- 3
IF @Abstraction IS NOT NULL
BEGIN
	DELETE FROM #Temp WHERE Item_Abstraction <> @Abstraction
END

--- 4
IF @Type IS NOT NULL
BEGIN
	DELETE FROM #Temp WHERE Item_TypeID <> @Type
END

--- 5
IF @Attribute IS NOT NULL
BEGIN
	DELETE FROM #Temp WHERE Attribute_ID <> @Attribute
END


SELECT * FROM #Temp ORDER BY Item_Type,  Item_Name,  Item_Field, Item_Value

--- 6
DROP TABLE #Temp
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[GetLifecycleList] AS

/*

OBJECTIVE
	retrieve list of Lifecycle

INPUTS

OUTPUTS
	all fields in Lifecycle table
TASKS

NOTES
*/

SELECT 
	* 
FROM 
	Lifecycle
ORDER BY 
	Lifecycle_ID
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[GetLog_AttributeValues](@Table as int, @ID as int) AS

DECLARE @dummyint INT	
DECLARE @dummyvar varchar(500)

DECLARE @intFunction INT

DECLARE @intTable_Relation INT 
DECLARE @intTable_Shape INT 
DECLARE @intTable_ShapeType INT 
DECLARE @intTable_Abstraction  INT

DECLARE @strTable_Shape INT 
DECLARE @strTable_ShapeType varchar(3)
DECLARE @strTable_Artifact varchar(3)
DECLARE @strTable_Abstraction varchar(3)

SET @intFunction= (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_RELATION')
SET @intTable_Relation= (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Relation')

SET @intTable_Shape= (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Shape')
SET @intTable_ShapeType= (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'ShapeType')
SET @intTable_Abstraction= (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Abstraction')

SET @strTable_Shape= CAST(@intTable_Shape as varchar(3))
SET @strTable_ShapeType= CAST(@intTable_ShapeType as varchar(3))
SET @strTable_Abstraction= CAST(@intTable_Abstraction as varchar(3))


-- GET ALL CONTAINER RELATIONSHIPS  OF SELECTED TABLE AND ID
select * into #temptable1
from sdlog 
where sdlog_note = CAST(@ID as varchar(10)) 
	and (sdlogfunction_id = 17 or sdlogfunction_id = 22)
	and sdtable_id = 6
	and sdlog_value = CAST(@Table as varchar(5)) 


-- CREATE ANOTHER TEMPTABLE WITH EXTRA COLUMNS
select *, 
	@dummyvar as "FunctionName", @dummyvar as "Attribute",  @dummyvar as "ItemName"
	into #temptable2
from sdlog 
where sdtable_id = 6
	and sd_id in (select distinct sd_id from #temptable1) 
order by sd_id, sdlog_datetime


UPDATE #temptable2 SET FunctionName = (SELECT SDLogFunction_Name FROM SDLogFunction WHERE SDLogFunction_ID = #temptable2.SDLogFunction_ID)

UPDATE #temptable2 SET ItemName = 
	CASE
		WHEN #temptable2.SDLog_Value = '4' AND #temptable2.SDLog_Note IS NOT NULL THEN (SELECT Shape_Name FROM Shape WHERE Shape_ID = CAST(#temptable2.SDLog_Note as int))
	END

--IF TEMP NAME IS STILL NULL, CHECK IN LOG TO GET OLD (DELETED) NAME

UPDATE #temptable2 SET ItemName = 
	CASE
		WHEN #temptable2.ItemName IS NULL AND #temptable2.SDLog_Value = '4' THEN (SELECT Top 1(SDLog_Value) FROM SDLog WHERE SDLogFunction_ID = 9 AND SDTable_ID = 4 AND SDLog_Note IS NULL AND SD_ID = CAST(#temptable2.SDLog_Note as int) ORDER BY SDLog_DateTime DESC )	
		ELSE #temptable2.ItemName
	END


UPDATE #temptable2 SET Attribute = 
	CASE
		WHEN #temptable2.SDLog_Value = '5' AND #temptable2.SDLog_Note IS NOT NULL THEN (SELECT TOP 1(SDLog_Value) FROM SDLog WHERE SDTable_ID = 5 AND SDLogFunction_ID =5 AND SDLog_Note IS NULL AND SD_ID = CAST(#temptable2.SDLog_Note as int) ORDER BY SDLog_DateTime DESC )	
	END


-- CREATE ANOTHER TEMPTABLE WITH EXTRA COLUMNS
select * from #temptable2

drop table #temptable1
drop table #temptable2
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[GetLog_AttributeValuesDeleted](@Table as int, @ID as int) AS


DECLARE @intFunctionSet int
DECLARE @intFunctionDel int
DECLARE @strTable varchar(6)
DECLARE @strID varchar(6)

SET @intFunctionSet = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_ATTRIBUTEVALUE')
SET @intFunctionDel = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_DELETE_ATTRIBUTEVALUE')
SET @strTable = CAST(@Table as varchar(6))
SET @strID = CAST(@ID as varchar(6))

select 	sdlog_id,
	sdtable_id,
	sd_id,
	sdlogfunction_id,
	sdlog_value,
	sdlog_note,
	sdlog_contact,
	sdlog_datetime,
	sta.shapetypeattribute_id,
	a.attribute_id,
	a.attribute_name
into #temptable
from sdlog nolock
	left join shapetypeattribute as sta on sta.shapetypeattribute_id = CAST(sdlog_note as int) 
	left join attribute as a on a.attribute_id = sta.attribute_id 
where sdtable_id in
(select sdtable_id from sdlog 
	where sdtable_id in (select sdtable_id from sdlog where sdlogfunction_id = @intFunctionSet and sdlog_value = @strTable and sdlog_note = @strID)
		and sd_id in (select sd_id from sdlog where sdlogfunction_id = @intFunctionSet and sdlog_value = @strTable and sdlog_note = @strID)
		and sdlogfunction_id = @intFunctionDel)
and 
sd_id in
(select sd_id from sdlog 
	where sdtable_id in (select sdtable_id from sdlog where sdlogfunction_id = @intFunctionSet and sdlog_value = @strTable and sdlog_note = @strID)
		and sd_id in (select sd_id from sdlog where sdlogfunction_id = @intFunctionSet and sdlog_value = @strTable and sdlog_note = @strID)
		and sdlogfunction_id = @intFunctionDel)


DECLARE @intFunctionSetSTA int
DECLARE @strFunctionSetSTA varchar(6)
DECLARE @strTableSTA varchar(6)
DECLARE @intFunctionSetA int
DECLARE @strTableA varchar(6)

/* grab the STA from SDLOG in case it has already been deleted from the STA table */
SET @intFunctionSetSTA = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_SHAPETYPEATTRIBUTE') 
SET @strFunctionSetSTA = CAST(@intFunctionSetSTA as varchar(6))
SET @strTableSTA = CAST((SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'ShapeTypeAttribute') as varchar(6))
SET @intFunctionSetA = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_ATTRIBUTE') 
SET @strTableA = CAST((SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Attribute') as varchar(6))

UPDATE #temptable set shapetypeattribute_id = 
	CASE
		WHEN (sdlog_value = @strFunctionSetSTA) THEN cast(sdlog_note as int) 
	END

update #temptable set attribute_id = 
	CASE
		WHEN attribute_id IS NULL THEN (SELECT sdlog_note FROM sdlog where sdtable_id = @strTableSTA and sd_id = #temptable.shapetypeattribute_id and sdlogfunction_id = @intFunctionSetSTA and sdlog_value = @strTableA )
		WHEN attribute_id is NOT NULL then attribute_id
	END 

/* grab the Attribute from SDLOG in case it has already been deleted from the Attribute table */
update #temptable set attribute_name = 
	CASE
		WHEN attribute_name is NULL then (SELECT sdlog_value FROM sdlog where sdtable_id = @strTableA and sd_id = #temptable.attribute_id and sdlogfunction_id = @intFunctionSetA)
		WHEN attribute_name is NOT NULL then attribute_name
	END 

select * from #temptable order by sdlog_id

drop table #temptable

/*

select * from sdlog
where sdtable_id in
(select sdtable_id from sdlog 
	where sdtable_id in (select sdtable_id from sdlog where sdlogfunction_id = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_ATTRIBUTEVALUE') 
		and (sdlog_value = CAST(@Table as varchar(6))) and (sdlog_note = CAST(@ID as varchar(6)))
		and sd_id in (select sd_id from sdlog where sdlogfunction_id = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_ATTRIBUTEVALUE') 
		and (sdlog_value = CAST(@Table as varchar(6))) and (sdlog_note = CAST(@ID as varchar(6)))
		and sdlogfunction_id = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_DELETE_ATTRIBUTEVALUE') )
and 
sd_id in
(select sd_id from sdlog 
	where sdtable_id in (select sdtable_id from sdlog where sdlogfunction_id = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_ATTRIBUTEVALUE') 
		and (sdlog_value = CAST(@Table as varchar(6))) and (sdlog_note = CAST(@ID as varchar(6)))
		and sd_id in (select sd_id from sdlog where sdlogfunction_id = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_ATTRIBUTEVALUE') 
		and (sdlog_value = CAST(@Table as varchar(6))) and (sdlog_note = CAST(@ID as varchar(6)))
		and sdlogfunction_id = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_DELETE_ATTRIBUTEVALUE') )

order by sdlog_id

*/
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[GetLog_AttributeValuesExisting](@Table as int, @ID as int)  AS

SELECT * FROM attributevalue as av
	left join shapetypeattribute as sta on sta.shapetypeattribute_id = av.shapetypeattribute_id
	left join attribute as a on a.attribute_id = sta.attribute_id
	left join sdlog as sdl on sdl.sdtable_id = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'AttributeValue')
		and av.attributevalue_id = sdl.sd_id 
	where av.sd_id = @ID 
		and av.sdtable_id = @Table 
		and sdl.sdlog_note is NULL
	order by attribute_name, sdlog_id
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[GetLog_Container](@ContainType as int, @Table as int, @ID as int) AS

DECLARE @dummyint INT	
DECLARE @dummyvar varchar(500)

DECLARE @intFunction_SetShape INT
SET @intFunction_SetShape= (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_SHAPE')
DECLARE @intFunction_SetArtifact INT
SET @intFunction_SetArtifact= (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_ARTIFACT')
DECLARE @intFunction_SetContainer INT
SET @intFunction_SetContainer= (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_CONTAINER')

DECLARE @intTable_Shape INT 
SET @intTable_Shape= (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Shape')
DECLARE @intTable_ShapeType INT 
SET @intTable_ShapeType= (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'ShapeType')
DECLARE @intTable_Container INT
SET @intTable_Container= (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Container')
DECLARE @intTable_Abstraction  INT
SET @intTable_Abstraction= (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Abstraction')
DECLARE @intTable_Artifact INT
SET @intTable_Artifact= (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Artifact')

DECLARE @strTable_Shape varchar(3)
SET @strTable_Shape= CAST(@intTable_Shape as varchar(3))
DECLARE @strTable_ShapeType varchar(3)
SET @strTable_ShapeType= CAST(@intTable_ShapeType as varchar(3))
DECLARE @strTable_Abstraction varchar(3)
SET @strTable_Abstraction= CAST(@intTable_Abstraction as varchar(3))
DECLARE @strTable_Artifact varchar(3)
SET @strTable_Artifact= CAST(@intTable_Artifact as varchar(3))

-- GET ALL CONTAINER RELATIONSHIPS  OF SELECTED TABLE AND ID

select * into #temptable1
from sdlog 
where sdlog_note = CAST(@ID as varchar(10)) 
	and sdlog_value = CAST(@Table as varchar(5)) 
	and sdtable_id = @intTable_Container


-- IF CONTAINERTYPE IS SPECIFIED, DELETE ALL OTHER CONTAINERTYPES
IF @ContainType IS NOT NULL
BEGIN
	DELETE FROM #temptable1 WHERE sdlogfunction_id <> @ContainType
END

-- CREATE ANOTHER TEMPTABLE WITH EXTRA COLUMNS
select *, 
	@dummyint as "ItemFunction", @dummyint as "ItemFunction2", @dummyvar as "FunctionName",
	@dummyint as "ItemTableID",  @dummyint as "ItemID", @dummyvar as "ItemName", @dummyint as "ItemType", @dummyint as "ItemAbstraction" 
	into #temptable2
from sdlog 
where sdtable_id = @intTable_Container
	and sd_id in (select distinct sd_id from #temptable1) 
order by sd_id, sdlog_datetime 


UPDATE #temptable2 SET ItemFunction2 =
	CASE
		WHEN SDLog_Value = @strTable_Artifact THEN @intFunction_SetArtifact
		WHEN SDLog_Value = @strTable_Shape THEN @intFunction_SetShape
	END


UPDATE #temptable2 SET ItemFunction = 
	CASE
		WHEN SDLog_Value = @strTable_Abstraction and SDLog_Note = '7' THEN @intFunction_SetArtifact
		ELSE SDLogFunction_ID
	END

UPDATE #temptable2 SET FunctionName = (SELECT SDLogFunction_Name FROM SDLogFunction WHERE SDLogFunction_ID = #temptable2.ItemFunction)


UPDATE #temptable2 SET ItemTableID =
	CASE
		WHEN ItemFunction2 IS NULL THEN NULL
		ELSE  CAST(#temptable2.SDLog_Value as int)
	END


UPDATE #temptable2 SET ItemID =
	CASE
		WHEN ItemFunction2 IS NULL THEN NULL
		ELSE  CAST(#temptable2.SDLog_Note as int)
	END



UPDATE #temptable2 SET ItemName = 
	CASE
		WHEN SDLog_Value = @strTable_Shape THEN (SELECT Shape_Name FROM Shape WHERE Shape_ID = CAST (#temptable2.SDLog_Note as int))
		WHEN SDLog_Value = @strTable_Artifact THEN (SELECT Artifact_Name FROM Artifact WHERE Artifact_ID = CAST (#temptable2.SDLog_Note as int))
	END

--IF TEMP NAME IS STILL NULL, CHECK IN LOG TO GET OLD (DELETED) NAME
UPDATE #temptable2 SET ItemName = 
	CASE
		WHEN #temptable2.ItemName IS NULL THEN (SELECT SDLog_Value FROM SDLog WHERE SD_ID = #temptable2.ItemID AND SDLogFunction_ID = #temptable2.ItemFunction2 AND SDTable_ID = #temptable2.ItemTableID AND SDLog_Note IS NULL)	
   		ELSE  #temptable2.ItemName
	END

update #temptable2 set ItemType = (SELECT SDLog_Note FROM SDLog WHERE SD_ID= #temptable2.ItemID  AND SDLogFunction_ID =  #temptable2.ItemFunction AND SDTable_ID = #temptable2.ItemTableID AND SDLog_Value = @strTable_ShapeType)	


update #temptable2 set ItemAbstraction =
	CASE
		WHEN SDLog_Value = @strTable_Abstraction THEN CAST(#temptable2.SDLog_Note as int)
		WHEN SDLog_Value = @strTable_Shape THEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID= ItemType)	
		WHEN SDLog_Value = @strTable_Artifact THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'ARTIFACT')
	END 




select * from #temptable2

drop table #temptable1
drop table #temptable2
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[GetLog_Relation](@Table as int, @ID as int) AS

DECLARE @dummyint INT	
DECLARE @dummyvar varchar(500)

DECLARE @intFunction INT

DECLARE @intTable_Relation INT 
DECLARE @intTable_Shape INT 
DECLARE @intTable_ShapeType INT 
DECLARE @intTable_Abstraction  INT

DECLARE @strTable_Shape varchar(3) 
DECLARE @strTable_ShapeType varchar(3)
DECLARE @strTable_Artifact varchar(3)
DECLARE @strTable_Abstraction varchar(3)

SET @intFunction= (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_RELATION')
SET @intTable_Relation= (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Relation')

SET @intTable_Shape= (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Shape')
SET @intTable_ShapeType= (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'ShapeType')
SET @intTable_Abstraction= (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Abstraction')

SET @strTable_Shape= CAST(@intTable_Shape as varchar(3))
SET @strTable_ShapeType= CAST(@intTable_ShapeType as varchar(3))
SET @strTable_Abstraction= CAST(@intTable_Abstraction as varchar(3))


-- GET ALL CONTAINER RELATIONSHIPS  OF SELECTED TABLE AND ID
select * into #temptable1
from sdlog 
where sdlog_note = CAST(@ID as varchar(10)) 
	and sdlog_value = CAST(@Table as varchar(5)) 
	and sdtable_id = @intTable_Relation


-- CREATE ANOTHER TEMPTABLE WITH EXTRA COLUMNS
select *, 
	@dummyint as "ItemFunction", @dummyint as "ItemFunction2", @dummyvar as "FunctionName", 
	@dummyint as "ItemTableID",  @dummyint as "ItemID", @dummyvar as "ItemName", @dummyint as "ItemType", @dummyint as "ItemAbstraction" 
	into #temptable2
from sdlog 
where sdtable_id = @intTable_Relation
	and sd_id in (select distinct sd_id from #temptable1) 
order by sd_id, sdlog_datetime


UPDATE #temptable2 SET ItemFunction =
	CASE
		WHEN #temptable2.SDLog_Note IS NULL THEN NULL
		ELSE @intFunction
	END  

UPDATE #temptable2 SET FunctionName = (SELECT SDLogFunction_Name FROM SDLogFunction WHERE SDLogFunction_ID = #temptable2.SDLogFunction_ID)


UPDATE #temptable2 SET ItemFunction2 =
	CASE
		WHEN SDLog_Value = @strTable_Shape AND SDLog_Note IS NOT NULL THEN (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_SHAPE')
	END

UPDATE #temptable2 SET ItemTableID =
	CASE
		WHEN #temptable2.ItemFunction IS NULL THEN NULL
		ELSE  CAST(#temptable2.SDLog_Value as int)
	END


UPDATE #temptable2 SET ItemID =
	CASE
		WHEN #temptable2.ItemFunction IS NULL THEN NULL
		ELSE  CAST(#temptable2.SDLog_Note as int)
	END

--UPDATE #temptable2 SET ItemName = (SELECT Shape_Name FROM Shape WHERE Shape_ID = CAST (#temptable2.SDLog_Note as int))
UPDATE #temptable2 SET ItemName = 
	CASE
		WHEN #temptable2.ItemFunction IS NULL THEN SDLog_Value
		ELSE (SELECT Shape_Name FROM Shape WHERE Shape_ID = #temptable2.ItemID)
	END

--IF TEMP NAME IS STILL NULL, CHECK IN LOG TO GET OLD (DELETED) NAME
UPDATE #temptable2 SET ItemName = 
	CASE
		WHEN #temptable2.ItemName IS NULL THEN (SELECT SDLog_Value FROM SDLog WHERE SD_ID = #temptable2.ItemID AND SDLogFunction_ID = #temptable2.ItemFunction2 AND SDTable_ID = #temptable2.ItemTableID AND SDLog_Note IS NULL)	
   		ELSE  #temptable2.ItemName
	END

update #temptable2 set ItemType = (SELECT SDLog_Note FROM SDLog WHERE SD_ID= #temptable2.ItemID AND SDLogFunction_ID =  (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_SHAPE') AND SDTable_ID = #temptable2.ItemTableID AND SDLog_Value = @strTable_ShapeType)	


update #temptable2 set ItemAbstraction =
	CASE
		WHEN #temptable2.ItemTableID = @intTable_Abstraction THEN CAST(#temptable2.SDLog_Note as int)
		WHEN #temptable2.ItemTableID = @intTable_Shape THEN (SELECT Abstraction_ID FROM ShapeType WHERE ShapeType_ID= #temptable2.ItemType)	
		WHEN #temptable2.ItemTableID IS NULL THEN NULL
	END 


-- CREATE ANOTHER TEMPTABLE WITH EXTRA COLUMNS
select * from #temptable2 order by sd_id, sdlog_datetime

drop table #temptable1
drop table #temptable2
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[GetLog_Shape](@Table as int,@ID as int) AS


DECLARE @varDummy  varchar(1000)

select  *, @varDummy as "FunctionName", @varDummy as "FunctionValue"	
	into #temptable2
from sdlog 
where sdtable_id = @Table and sd_id = @ID
order by sdlog_datetime

UPDATE #temptable2 SET FunctionName = 
	CASE
		WHEN (SDLogFunction_ID <> 9 AND SDLog_Note IS NULL)  THEN (SELECT SDLogFunction_Name FROM SDLogFunction WHERE SDLogFunction_ID =#temptable2.SDLogFunction_ID)
		WHEN (SDLogFunction_ID <> 9 AND SDLog_Note IS NOT NULL)  THEN (SELECT SDLogFunction_Name FROM SDLogFunction WHERE SDLogFunction_ID =#temptable2.SDLogFunction_ID)
		WHEN (SDLogFunction_ID =  9 AND SDLog_Note IS NULL)  THEN (SELECT SDLogFunction_Name FROM SDLogFunction WHERE SDLogFunction_ID = #temptable2.SDLogFunction_ID)
		WHEN (SDLogFunction_ID =  9 AND SDLog_Note IS NOT NULL)  THEN (SELECT SDLogFunction_Name FROM SDLogFunction WHERE SDLogFunction_ID =5)
	END

UPDATE #temptable2 SET FunctionValue = 
	CASE
		WHEN (SDLog_Note IS NULL)  THEN #temptable2.SDLog_Value
		WHEN (FunctionName =  'LOGFUNCTION_SET_LIFECYCLE')  THEN (SELECT LifeCycle_Name FROM LifeCycle WHERE LifeCycle_ID =CAST(#temptable2.SDLog_Note as INT))
		WHEN (FunctionName =  'LOGFUNCTION_SET_SHAPETYPEATTRIBUTE')  THEN (SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID =CAST(#temptable2.SDLog_Note as INT))
	END 

select * from #temptable2

drop table #temptable2
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE  [dbo].[GetReport_EnterpriseAttribute] (@A1 as int, @A2 as int, @A3 as int, @A4 as int, @A5 as int, @A6 as int)  AS

DECLARE @intDummy int
DECLARE @varDummy varchar(100)

SELECT 
	*,
	@varDummy as "Attribute1", 
	@varDummy as "Attribute2", 
	@varDummy as "Attribute3", 
	@varDummy as "Attribute4", 
	@varDummy as "Attribute5", 
	@varDummy as "Attribute6"
INTO tempReport
FROM vwEnterprise

DECLARE @AttributeName varchar(100)
DECLARE @AttributeID int
DECLARE @AbsID int
DECLARE @SDColumn varchar(100)
DECLARE @AbsName varchar(100)
DECLARE @SQL varchar(1000)

IF @A1 IS NOT NULL 
	BEGIN

		SET @AbsID = (select abstraction_id from abstraction where abstraction_id = (select abstraction_id from shapetype where shapetype_id = (select shapetype_id from shapetypeattribute where shapetypeattribute_id = @A1)))
		SET @AbsName = (select abstraction_name from abstraction where abstraction_id = @AbsID)
		SET @AttributeID =  (select shapetypeattribute.attribute_id from shapetypeattribute left join attribute on shapetypeattribute.attribute_id = attribute.attribute_id where shapetypeattribute_id = @A1)
		SET @AttributeName = @AbsName + ' ' + (select attribute_name from attribute where attribute_id = @AttributeID)

		EXEC sp_rename 'tempReport.Attribute1',   @AttributeName ,  'Column'

		IF @@ERROR = 0
		BEGIN
			SET @SDColumn = 
				CASE
					WHEN @AbsID = 1 THEN 'systemid'
					WHEN @AbsID = 2 THEN 'objectid'
					WHEN @AbsID = 3 THEN 'infrastructureid'
					WHEN @AbsID = 10 THEN 'businessprocessid'
					WHEN @AbsID = 11 THEN 'stepid'
				END
			
			set @SQL = 'UPDATE tempReport SET [' + @AttributeName + '] = (select attributevalue_value  from attributevalue where sdtable_id = 4 and sd_id = '
				+ @SDColumn + ' and shapetypeattribute_id in 
				(select shapetypeattribute_id from shapetypeattribute where attribute_id =  ' + CAST(@AttributeID as char(5)) 
				+ ' and shapetype_id in (select shapetype_id from shapetype where abstraction_id = ' +  CAST(@AbsID as char(5))  + ')))'

			exec (@sql)
		END

	END

IF @A2 IS NOT NULL 
	BEGIN

		SET @AbsID = (select abstraction_id from abstraction where abstraction_id = (select abstraction_id from shapetype where shapetype_id = (select shapetype_id from shapetypeattribute where shapetypeattribute_id = @A2)))
		SET @AbsName = (select abstraction_name from abstraction where abstraction_id = @AbsID)
		SET @AttributeID =  (select shapetypeattribute.attribute_id from shapetypeattribute left join attribute on shapetypeattribute.attribute_id = attribute.attribute_id where shapetypeattribute_id = @A2)
		SET @AttributeName = @AbsName + ' ' + (select attribute_name from attribute where attribute_id = @AttributeID)

		EXEC sp_rename 'tempReport.Attribute2',   @AttributeName ,  'Column'

		IF @@ERROR = 0
		BEGIN
			SET @SDColumn = 
				CASE
					WHEN @AbsID = 1 THEN 'systemid'
					WHEN @AbsID = 2 THEN 'objectid'
					WHEN @AbsID = 3 THEN 'infrastructureid'
					WHEN @AbsID = 10 THEN 'businessprocessid'  
					WHEN @AbsID = 11 THEN 'stepid'
				END
			
			set @SQL = 'UPDATE tempReport SET [' + @AttributeName + '] = (select attributevalue_value  from attributevalue where sdtable_id = 4 and sd_id = '
				+ @SDColumn + ' and shapetypeattribute_id in 
				(select shapetypeattribute_id from shapetypeattribute where attribute_id =  ' + CAST(@AttributeID as char(5)) 
				+ ' and shapetype_id in (select shapetype_id from shapetype where abstraction_id = ' +  CAST(@AbsID as char(5))  + ')))'

			exec (@sql)
		END

	END

IF @A3 IS NOT NULL 
	BEGIN

		SET @AbsID = (select abstraction_id from abstraction where abstraction_id = (select abstraction_id from shapetype where shapetype_id = (select shapetype_id from shapetypeattribute where shapetypeattribute_id = @A3)))
		SET @AbsName = (select abstraction_name from abstraction where abstraction_id = @AbsID)
		SET @AttributeID =  (select shapetypeattribute.attribute_id from shapetypeattribute left join attribute on shapetypeattribute.attribute_id = attribute.attribute_id where shapetypeattribute_id = @A3)
		SET @AttributeName = @AbsName + ' ' + (select attribute_name from attribute where attribute_id = @AttributeID)

		EXEC sp_rename 'tempReport.Attribute3',   @AttributeName ,  'Column'

		IF @@ERROR = 0
		BEGIN
			SET @SDColumn = 
				CASE
					WHEN @AbsID = 1 THEN 'systemid'
					WHEN @AbsID = 2 THEN 'objectid'
					WHEN @AbsID = 3 THEN 'infrastructureid'
					WHEN @AbsID = 10 THEN 'businessprocessid'  
					WHEN @AbsID = 11 THEN 'stepid'
				END
			
			set @SQL = 'UPDATE tempReport SET [' + @AttributeName + '] = (select attributevalue_value  from attributevalue where sdtable_id = 4 and sd_id = '
				+ @SDColumn + ' and shapetypeattribute_id in 
				(select shapetypeattribute_id from shapetypeattribute where attribute_id =  ' + CAST(@AttributeID as char(5)) 
				+ ' and shapetype_id in (select shapetype_id from shapetype where abstraction_id = ' +  CAST(@AbsID as char(5))  + ')))'

			exec (@sql)
		END


	END

IF @A4 IS NOT NULL 
	BEGIN
		SET @AbsID = (select abstraction_id from abstraction where abstraction_id = (select abstraction_id from shapetype where shapetype_id = (select shapetype_id from shapetypeattribute where shapetypeattribute_id = @A4)))
		SET @AbsName = (select abstraction_name from abstraction where abstraction_id = @AbsID)
		SET @AttributeID =  (select shapetypeattribute.attribute_id from shapetypeattribute left join attribute on shapetypeattribute.attribute_id = attribute.attribute_id where shapetypeattribute_id = @A4)
		SET @AttributeName = @AbsName + ' ' + (select attribute_name from attribute where attribute_id = @AttributeID)

		EXEC sp_rename 'tempReport.Attribute4',   @AttributeName ,  'Column'

		IF @@ERROR = 0
		BEGIN
			SET @SDColumn = 
				CASE
					WHEN @AbsID = 1 THEN 'systemid'
					WHEN @AbsID = 2 THEN 'objectid'
					WHEN @AbsID = 3 THEN 'infrastructureid'
					WHEN @AbsID = 10 THEN 'businessprocessid'  
					WHEN @AbsID = 11 THEN 'stepid'
				END
			
			set @SQL = 'UPDATE tempReport SET [' + @AttributeName + '] = (select attributevalue_value  from attributevalue where sdtable_id = 4 and sd_id = '
				+ @SDColumn + ' and shapetypeattribute_id in 
				(select shapetypeattribute_id from shapetypeattribute where attribute_id =  ' + CAST(@AttributeID as char(5)) 
				+ ' and shapetype_id in (select shapetype_id from shapetype where abstraction_id = ' +  CAST(@AbsID as char(5))  + ')))'

			exec (@sql)
		END
	END

IF @A5 IS NOT NULL 
	BEGIN
		SET @AbsID = (select abstraction_id from abstraction where abstraction_id = (select abstraction_id from shapetype where shapetype_id = (select shapetype_id from shapetypeattribute where shapetypeattribute_id = @A5)))
		SET @AbsName = (select abstraction_name from abstraction where abstraction_id = @AbsID)
		SET @AttributeID =  (select shapetypeattribute.attribute_id from shapetypeattribute left join attribute on shapetypeattribute.attribute_id = attribute.attribute_id where shapetypeattribute_id = @A5)
		SET @AttributeName = @AbsName + ' ' + (select attribute_name from attribute where attribute_id = @AttributeID)

		EXEC sp_rename 'tempReport.Attribute5',   @AttributeName ,  'Column'

		IF @@ERROR = 0
		BEGIN
			SET @SDColumn = 
				CASE
					WHEN @AbsID = 1 THEN 'systemid'
					WHEN @AbsID = 2 THEN 'objectid'
					WHEN @AbsID = 3 THEN 'infrastructureid'
					WHEN @AbsID = 10 THEN 'businessprocessid'  
					WHEN @AbsID = 11 THEN 'stepid'
				END
			
			set @SQL = 'UPDATE tempReport SET [' + @AttributeName + '] = (select attributevalue_value  from attributevalue where sdtable_id = 4 and sd_id = '
				+ @SDColumn + ' and shapetypeattribute_id in 
				(select shapetypeattribute_id from shapetypeattribute where attribute_id =  ' + CAST(@AttributeID as char(5)) 
				+ ' and shapetype_id in (select shapetype_id from shapetype where abstraction_id = ' +  CAST(@AbsID as char(5))  + ')))'

			exec (@sql)
		END
	END

IF @A6 IS NOT NULL 
	BEGIN
		SET @AbsID = (select abstraction_id from abstraction where abstraction_id = (select abstraction_id from shapetype where shapetype_id = (select shapetype_id from shapetypeattribute where shapetypeattribute_id = @A6)))
		SET @AbsName = (select abstraction_name from abstraction where abstraction_id = @AbsID)
		SET @AttributeID =  (select shapetypeattribute.attribute_id from shapetypeattribute left join attribute on shapetypeattribute.attribute_id = attribute.attribute_id where shapetypeattribute_id = @A6)
		SET @AttributeName = @AbsName + ' ' + (select attribute_name from attribute where attribute_id = @AttributeID)

		EXEC sp_rename 'tempReport.Attribute6',   @AttributeName ,  'Column'

		IF @@ERROR = 0
		BEGIN
			SET @SDColumn = 
				CASE
					WHEN @AbsID = 1 THEN 'systemid'
					WHEN @AbsID = 2 THEN 'objectid'
					WHEN @AbsID = 3 THEN 'infrastructureid'
					WHEN @AbsID = 10 THEN 'businessprocessid'  
					WHEN @AbsID = 11 THEN 'stepid'
				END
			
			set @SQL = 'UPDATE tempReport SET [' + @AttributeName + '] = (select attributevalue_value  from attributevalue where sdtable_id = 4 and sd_id = '
				+ @SDColumn + ' and shapetypeattribute_id in 
				(select shapetypeattribute_id from shapetypeattribute where attribute_id =  ' + CAST(@AttributeID as char(5)) 
				+ ' and shapetype_id in (select shapetype_id from shapetype where abstraction_id = ' +  CAST(@AbsID as char(5))  + ')))'

			exec (@sql)
		END
	END

SELECT * from tempReport

DROP TABLE tempReport
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE  [dbo].[GetReport_EnterpriseAttributeNew] (@A1 as int, @A2 as int, @A3 as int, @A4 as int, @A5 as int, @A6 as int)  AS

DECLARE @intDummy int
DECLARE @varDummy varchar(100)
DECLARE @AttributeName varchar(100)
DECLARE @AttributeID int
DECLARE @AbsID int
DECLARE @SDColumn varchar(100)
DECLARE @AbsName varchar(100)
DECLARE @SQL varchar(1000)


IF @A1 IS NOT NULL 
	BEGIN

		SET @AbsID = (select abstraction_id from abstraction where abstraction_id = (select abstraction_id from shapetype where shapetype_id = (select shapetype_id from shapetypeattribute where shapetypeattribute_id = @A1)))
		SET @AbsName = (select abstraction_name from abstraction where abstraction_id = @AbsID)
		SET @AttributeID =  (select shapetypeattribute.attribute_id from shapetypeattribute left join attribute on shapetypeattribute.attribute_id = attribute.attribute_id where shapetypeattribute_id = @A1)
		SET @AttributeName = @AbsName + ' ' + (select attribute_name from attribute where attribute_id = @AttributeID)
	END


SELECT 
	*,
	@varDummy as "Attribute1",
	@varDummy as "Attribute2", 
	@varDummy as "Attribute3", 
	@varDummy as "Attribute4", 
	@varDummy as "Attribute5", 
	@varDummy as "Attribute6"
INTO #tempReport
FROM vwEnterprise



IF @A1 IS NOT NULL 
	BEGIN

		SET @AbsID = (select abstraction_id from abstraction where abstraction_id = (select abstraction_id from shapetype where shapetype_id = (select shapetype_id from shapetypeattribute where shapetypeattribute_id = @A1)))
		SET @AbsName = (select abstraction_name from abstraction where abstraction_id = @AbsID)
		SET @AttributeID =  (select shapetypeattribute.attribute_id from shapetypeattribute left join attribute on shapetypeattribute.attribute_id = attribute.attribute_id where shapetypeattribute_id = @A1)
		SET @AttributeName = @AbsName + ' ' + (select attribute_name from attribute where attribute_id = @AttributeID)

		IF @@ERROR = 0
		BEGIN
			SET @SDColumn = 
				CASE
					WHEN @AbsID = 1 THEN 'systemid'
					WHEN @AbsID = 2 THEN 'objectid'
					WHEN @AbsID = 3 THEN 'infrastructureid'
					WHEN @AbsID = 10 THEN 'businessprocessid'
					WHEN @AbsID = 11 THEN 'stepid'
				END
			
			set @SQL = 'UPDATE #tempReport SET Attribute1 = (select attributevalue_value  from attributevalue where sdtable_id = 4 and sd_id = '
				+ @SDColumn + ' and shapetypeattribute_id in 
				(select shapetypeattribute_id from shapetypeattribute where attribute_id =  ' + CAST(@AttributeID as char(5)) 
				+ ' and shapetype_id in (select shapetype_id from shapetype where abstraction_id = ' +  CAST(@AbsID as char(5))  + ')))'

			exec (@sql)
		END

	END


--set @sql = 'SELECT *, Attribute1 AS [' + @AttributeName + '] FROM #tempreport'
--exec (@sql)

select * from #tempReport

DROP TABLE #tempReport
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE  [dbo].[GetReport_LevelAttributeList]  AS

select distinct 
	(select top 1 shapetypeattribute_id 
		from shapetypeattribute 
		where attribute_id = sta.attribute_id
			and shapetype_id in (select shapetype_id from shapetype where abstraction_id = ab.abstraction_id ) )as sta_id,
	(abstraction_name + ' ' + attribute_name) as sta_name,
	sta.attribute_id, attribute_name, ab.abstraction_id, abstraction_name
	from shapetypeattribute as sta
	left join attribute as a 
		on sta.attribute_id = a.attribute_id
	left join shapetype as st	
		on sta.shapetype_id = st.shapetype_id	
	left join abstraction as ab
		on ab.abstraction_id = st.abstraction_id
where ab.abstraction_id in (1,2,3,10,11)
order by ab.abstraction_id,  attribute_name
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE  [dbo].[GetReport_LevelRelationBusinessProcess]  AS



SELECT 
	shapecontainer_name as [Business Process Name],
	shapecontainer_desc as [Business Process Description],
	shapecontained_name as [Process Step Name],
	shapecontained_desc as [Process Step Description],
	shapecontained_type as [Process Step Type],
	relation_name as [Relation Name],
	relation_desc as [Relation Description],
	relationcontainer_begin_name as [Relation Begin Business Process Name],
	relationshape_begin_name as [Relation Begin Process Step Name],
	relationshape_begin_desc as [Relation Begin Process Step Desc],
	relationshape_begin_type as [Relation Begin Process Step Type],
	relationcontainer_end_name as [Relation End Business Process Name],
	relationshape_end_name as [Relation End Process Step Name],
	relationshape_end_desc as [Relation End Process Step Desc],
	relationshape_end_type as [Relation End Process Step Type]

FROM vwBusinessProcessLevel

ORDER BY [Business Process Name]
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE  [dbo].[GetReport_LevelRelationInfrastructure]  AS



SELECT 
	shapecontained_name as [Device Name],
	shapecontained_desc as [Device Description],
	shapecontained_type as [Device Type],
	shapecontainer_name as [Container Device Name],
	shapecontainer_desc as [Container Device Description],
	relation_name as [Relation Name],
	relation_desc as [Relation Description],
	relationshape_begin_name as [Relation Begin Device Name],
	relationshape_begin_desc as [Relation Begin Device Desc],
	relationshape_begin_type as [Relation Begin Device Type],
	relationshape_end_name as [Relation End Device Name],
	relationshape_end_desc as [Relation End Device Desc],
	relationshape_end_type as [Relation End Device Type]

FROM vwInfrastructureLevel

ORDER BY [Device Name], [Container Device Name]
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE  [dbo].[GetReport_LevelRelationSystem]  AS



SELECT 
	shapecontainer_name as [System Name],
	shapecontainer_desc as [System Description],
	shapecontained_name as [Object Name],
	shapecontained_desc as [Object Description],
	shapecontained_type as [Object Type],
	relation_name as [Relation Name],
	relation_desc as [Relation Description],
	relationcontainer_begin_name as [Relation Begin System Name],
	relationshape_begin_name as [Relation Begin Object Name],
	relationshape_begin_desc as [Relation Begin Object Desc],
	relationshape_begin_type as [Relation Begin Object Type],
	relationcontainer_end_name as [Relation End System Name],
	relationshape_end_name as [Relation End Object Name],
	relationshape_end_desc as [Relation End Object Desc],
	relationshape_end_type as [Relation End Object Type]

FROM vwSystemLevel

ORDER BY [System Name], [Object Name]
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE  [dbo].[GetReport_ShapeTypeAttribute] (@ID as int)  AS


select shape_id, shape_name, 
	(select sd_id_container from container where abstraction_id in (SELECT abstraction_id FROM abstraction WHERE abstraction_name = 'SYSTEMOBJECT' OR abstraction_name = 'BUSINESSSTEP') and sd_id_contained = s.shape_id) as sd_id_container,
	(select shape_name from shape where shape_id = (select sd_id_container from container where abstraction_id in (SELECT abstraction_id FROM abstraction WHERE abstraction_name = 'SYSTEMOBJECT' OR abstraction_name = 'BUSINESSSTEP') and sd_id_contained = s.shape_id)) as container_name,
	(select attribute_name from attribute where attribute_id = sta.attribute_id) as attribute_name,
	(select attributevalue_value from attributevalue where sdtable_id = 4 and sd_id = s.shape_id and shapetypeattribute_id = sta.shapetypeattribute_id) as attributevalue_value
into #temptable
from shape as s 
	join shapetypeattribute as sta on sta.shapetype_id = s.shapetype_id
where sta.shapetype_id = @ID

order by attribute_name
/*

select  shape_id, shape_name, sd_id_container,
	(SELECT Shape_name from shape where shape_id = sd_id_container) as container_name,
	 attribute_name, attributevalue_value 
	into #temptable
	from shapetypeattribute 
	left join attribute on shapetypeattribute.attribute_id = attribute.attribute_id
	left join shapetype on shapetype.shapetype_id  = shapetypeattribute.shapetype_id
	left join shape on shape.shapetype_id = shapetype.shapetype_id
	left join container on container.sd_id_contained = shape.shape_id 
		and container.sdtable_id_contained =  (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Shape') 
		and container.abstraction_id  in (SELECT abstraction_id FROM abstraction WHERE abstraction_name = 'SYSTEMOBJECT' OR abstraction_name = 'BUSINESSSTEP')
	left join attributevalue on attributevalue.sdtable_id = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Shape')
		and attributevalue.sd_id = shape.shape_id 
		and shapetypeattribute.shapetypeattribute_id = attributevalue.shapetypeattribute_id
where  shapetypeattribute.shapetype_id = @ID
*/

SET NOCOUNT ON
SET CONCAT_NULL_YIELDS_NULL OFF
DECLARE @SELECT_FROM_TABLE nvarchar(1000)

CREATE TABLE #columns (col1 int identity(1,1),col2 varchar(100) default 'No data')

SET @SELECT_FROM_TABLE='INSERT INTO #Columns(col2) SELECT DISTINCT Attribute_Name FROM #temptable '

EXEC sp_executesql @SELECT_FROM_TABLE

DECLARE @LoopCount int
DECLARE @RecordCount int
DECLARE @ColumnsToSelect varchar(2000)
DECLARE @SumStatements varchar(8000)
DECLARE @QUERY varchar(8000)
DECLARE @Column_Value varchar(2000)

SET @ColumnsToSelect=''
SET @RecordCount=(Select Count(*) FROM #Columns)
SET @LoopCount=0

WHILE @LoopCount<=@RecordCount
BEGIN
SET @LoopCount= @LoopCount + 1
SET @Column_Value=(Select col2 from #Columns where col1=@LoopCount)
if DataLength(@Column_Value)>0
BEGIN
SET @ColumnsToSelect= @ColumnsToSelect + ' P1.[' + @Column_Value + '] + '
SET @SumStatements=@SumStatements + ' MAX(CASE P.Attribute_Name WHEN ''' + @Column_Value + ''' THEN AttributeValue_Value ELSE NULL END) AS [' + @Column_Value + '], '

END
END

SET @ColumnsToSelect='P1.*  '


SET @SumStatements=LEFT(@SumStatements,len(@SumStatements)-1) + '  FROM #temptable AS P GROUP BY P.Shape_Name, P.Container_Name WITH CUBE) AS P1'
SET @QUERY='SELECT ' + @columnsToSelect + ' FROM ( SELECT DISTINCT MAX(Shape_Name) AS Shape,  MAX(Container_Name) as Container '

IF CHARINDEX('MAX',@SumStatements)>0
SET @QUERY=@QUERY + ',' + @SumStatements
ELSE
SET @QUERY=@QUERY + @SumStatements

--print @query

exEC sp_executesql @QUERY

drop table #temptable
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[GetShape] (@ID as int) 

AS

/*

OBJECTIVE
	retrieve shape info (according to shape ID)

INPUTS
	@ID  - shape ID

OUTPUTS
	Shape_ID, Shape_Name, Shape_Desc, ShapeType_ID, Lifecycle_ID, ShapeType_Name, Lifecycle_Name, Abstraction_ID, Table_ID
	ShapeContainer_ID, ShapeContainer_Name, ShapeContainer_TypeID

TASKS
	1. CREATE a temptable of shape info
	2. CREATE a temptable of shape's container
	3. SELECT shape info and its container info
	4. DELETE temptables

NOTES

*/

BEGIN TRAN

	--- 1
	SELECT  DISTINCT 
		Shape.Shape_ID,
		Shape.Shape_Name,
		Shape.Shape_Desc,
		Shape.ShapeType_ID,
		Shape.Lifecycle_ID,
		ShapeType.ShapeType_Name,
		Lifecycle.Lifecycle_Name,
		ShapeType.Abstraction_ID,
		(SELECT SDTable_ID FROM SDTable WHERE SDTable_Name ='Shape') AS [Table_ID]
	INTO #Temp1
	FROM Shape
		LEFT JOIN Lifecycle ON Shape.lifecycle_id = Lifecycle.lifecycle_id
		LEFT JOIN Shapetype ON Shape.shapetype_id = Shapetype.shapetype_id
	WHERE Shape_ID =@ID 

	--- 2
	SELECT #Temp1.*,
		SD_ID_Container as [ShapeContainer_ID]
	INTO #Temp2
	FROM #Temp1
		LEFT JOIN Container ON  SD_ID_Contained = #Temp1.Shape_ID
			AND SDTable_ID_Contained = #Temp1.Table_ID 	
			AND SDTable_ID_Container = #Temp1.Table_ID 
			AND Container.Abstraction_ID =
				(CASE
					WHEN #Temp1.Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='SYSTEMOBJECT')
					WHEN #Temp1.Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='BUSINESSSTEP')
					WHEN #Temp1.Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='DEVICE')
				 END)
	
	--- 3
	SELECT DISTINCT *,
		(SELECT Shape_Name FROM Shape WHERE Shape_ID = #Temp2.ShapeContainer_ID) as [ShapeContainer_Name],
		(SELECT ShapeType_ID FROM Shape WHERE Shape_ID = #Temp2.ShapeContainer_ID) as [ShapeContainer_TypeID] 
	FROM #Temp2

	--- 4
	DROP TABLE #Temp2
	DROP TABLE #Temp1

COMMIT TRAN
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[GetShapeList]  (@Abstraction as int, @ShapeType as int)

AS

/*

OBJECTIVE
	retrieve list of shapes according to shapetype/abstraction filter

INPUTS
	@ShapeType  - shapetype filter
	@Abstraction  - abstraction filter

OUTPUTS
	shape_id, shape_name, shape_desc,
	shapetype_id, shapetype_name,
	abstraction_id, abstraction_name 

TASKS
	1. IF abstraction is not specified
		1. IF shapetype is also not specified, RETURN all shapes
		2. ELSE (only shapetype is specified), RETURN shapes of this shapetype
	2. ELSE (abstraction is specified)
		1. IF shapetype is not specifed, RETURN all shapes of this abstraction
		2. ELSE  (shapetype is specified), RETURN all shapes of this abstraction and shapetype

NOTES

*/

--- 1
IF @Abstraction is not null 
	BEGIN
		--- 1.1
		IF @ShapeType is not null
			BEGIN
				select shape_id, shape_name, shape_desc,
					shapetype.shapetype_id, shapetype.shapetype_name,
					abstraction.abstraction_id, abstraction.abstraction_name  
				from abstraction
					left join shapetype on abstraction.abstraction_ID = shapetype.abstraction_ID 
					left join shape on shapetype.shapetype_id = shape.shapetype_id 
				where shape_name is not null 
					and abstraction.abstraction_id =@Abstraction
					and shapetype.shapetype_id = @ShapeType
				order by shape_name
			END
		--- 1.2
		ELSE
			BEGIN
				select shape_id, shape_name, shape_desc,
					shapetype.shapetype_id, shapetype.shapetype_name,
					abstraction.abstraction_id, abstraction.abstraction_name  
				from abstraction
					left join shapetype on abstraction.abstraction_ID = shapetype.abstraction_ID 
					left join shape on shapetype.shapetype_id = shape.shapetype_id 
				where shape_name is not null 
					and abstraction.abstraction_id =@Abstraction
				order by shape_name
			END
	END
--- 2
ELSE
	BEGIN
		--- 2.1
		IF @ShapeType is not null
			BEGIN
				select shape_id, shape_name, shape_desc,
					shapetype.shapetype_id, shapetype.shapetype_name,
					abstraction.abstraction_id, abstraction.abstraction_name  
				from abstraction
					left join shapetype on abstraction.abstraction_ID = shapetype.abstraction_ID 
					left join shape on shapetype.shapetype_id = shape.shapetype_id 
				where shape_name is not null 
					and shapetype.shapetype_id = @ShapeType
				order by shape_name
			END
		--- 2.2
		ELSE
			BEGIN
				select shape_id, shape_name, shape_desc,
					shapetype.shapetype_id, shapetype.shapetype_name,
					abstraction.abstraction_id, abstraction.abstraction_name  
				from abstraction
					left join shapetype on abstraction.abstraction_ID = shapetype.abstraction_ID 
					left join shape on shapetype.shapetype_id = shape.shapetype_id 
				where shape_name is not null 
				order by shape_name
			END
	END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[GetShapeList_Browser] (@Type as int) 

AS

/*

OBJECTIVE
	retrieve list  of items (according to shapetype)

INPUTS
	@Type  - shapetype filter

OUTPUTS
	Item_Table, Item_ID, Item_Name, Item_Desc, Item_TypeID, Item_TypeName,
	Container_ID, Container_TypeID, Container_Name, 
	Display_Name

TASKS
	1. CREATE a temptable of all items of this shapetype
	2. populate fields in temptable
	3. return records
	4. DELETE temptable

NOTES

*/

--- 1
DECLARE @Column_var varchar(500)
DECLARE @Column_int int

SELECT 
	(SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Shape') as "Item_Table",
	Shape_ID as "Item_ID" ,
	Shape_Name as "Item_Name",
	@Column_int as "Container_ID",
	@Column_int as "Container_TypeID",
	@Column_var as "Container_Name",
	ISNULL(Shape_Desc,'') as "Item_Desc",
	ShapeType_ID as "Item_TypeID",
	(SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = @Type) as "Item_TypeName",
	@Column_var as "Display_Name"
INTO #TempTable 
FROM Shape NOLOCK
	WHERE ShapeType_ID = @Type

--- 2
UPDATE  #TempTable SET Container_ID =
	CASE
		WHEN Item_TypeID IN (SELECT ShapeType_ID FROM ShapeType WHERE Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name ='OBJECT'))THEN (SELECT SD_ID_Container FROM Container WHERE SDTable_ID_Container = #TempTable.Item_Table AND SDTable_ID_Contained = #TempTable.Item_Table AND SD_ID_Contained = #TempTable.Item_ID AND Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='SYSTEMOBJECT'))
		WHEN Item_TypeID IN (SELECT ShapeType_ID FROM ShapeType WHERE Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name ='STEP'))THEN (SELECT SD_ID_Container FROM Container WHERE SDTable_ID_Container = #TempTable.Item_Table AND SDTable_ID_Contained = #TempTable.Item_Table AND SD_ID_Contained = #TempTable.Item_ID AND Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='BUSINESSSTEP'))
	END

UPDATE  #TempTable SET Container_TypeID = ISNULL((SELECT ShapeType_ID FROM Shape WHERE Shape_ID= #TempTable.Container_ID),'')

UPDATE  #TempTable SET Container_Name = ISNULL((SELECT Shape_Name FROM Shape WHERE Shape_ID= #TempTable.Container_ID),'')

UPDATE  #TempTable SET Display_Name =
	CASE
		WHEN Container_Name IS NOT NULL THEN Item_Name + ' [' + Container_Name  + ']' 
		ELSE Item_Name
	END


--- 3
SELECT * FROM #TempTable ORDER BY Display_Name

--- 4
DROP TABLE #TempTable
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[GetShapeList_Deletable] (@Type as int) 

AS

/*

OBJECTIVE
	retrieve list  of items (according to shapetype) that can be deleted

INPUTS
	@Type  - shapetype filter

OUTPUTS
	Item_Table, Item_ID, Item_Name, Item_Desc, Item_TypeID, Item_TypeName,
	Container_ID, Container_Name, 
	Display_Name

TASKS
	1. CREATE a temptable of all items of this shapetype
	2. DELETE from temptable those that do not have relations
	3. DELETE from temptable those that are not containers
	4. populate fields in temptable
	5. return records
	6. DELETE temptable

NOTES
	deletable items are those that  (1) do not contain other items and (2) do not have any relations
*/

--- 1
DECLARE @Column_var varchar(500)
DECLARE @Column_int int
SELECT 
	(SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Shape') as "Item_Table",
	Shape_ID as "Item_ID" ,
	Shape_Name as "Item_Name",
	Shape_Desc as "Item_Desc",
	ShapeType_ID as "Item_TypeID",
	@Column_var as "Item_TypeName",
	@Column_int as "Container_ID",
	@Column_var as "Container_Name",
	@Column_var as "Display_Name"
INTO #TempTable 
FROM Shape NOLOCK
	WHERE ShapeType_ID = @Type

--- 2
DELETE FROM #TempTable WHERE Item_ID IN (SELECT SD_ID_Begin FROM Relation WHERE SDTable_ID_Begin = Item_Table AND SD_ID_Begin = Item_ID)
DELETE FROM #TempTable WHERE Item_ID IN (SELECT SD_ID_End FROM Relation WHERE SDTable_ID_End = Item_Table AND SD_ID_End = Item_ID)
--- 3
DELETE FROM #TempTable WHERE Item_ID IN (SELECT SD_ID_Container FROM Container WHERE SDTable_ID_Container = Item_Table AND SD_ID_Container = Item_ID AND ((Abstraction_ID <> (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'ARTIFACT')) AND (Abstraction_ID <> (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'IP'))))

--- 4
UPDATE  #TempTable SET Container_ID =
	CASE
		WHEN Item_TypeID IN (SELECT ShapeType_ID FROM ShapeType WHERE Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name ='OBJECT'))THEN (SELECT SD_ID_Container FROM Container WHERE SDTable_ID_Container = #TempTable.Item_Table AND SDTable_ID_Contained = #TempTable.Item_Table AND SD_ID_Contained = #TempTable.Item_ID AND Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='SYSTEMOBJECT'))
		WHEN Item_TypeID IN (SELECT ShapeType_ID FROM ShapeType WHERE Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name ='STEP'))THEN (SELECT SD_ID_Container FROM Container WHERE SDTable_ID_Container = #TempTable.Item_Table AND SDTable_ID_Contained = #TempTable.Item_Table AND SD_ID_Contained = #TempTable.Item_ID AND Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='BUSINESSSTEP'))
	END

UPDATE  #TempTable SET Container_Name = (SELECT Shape_Name FROM Shape WHERE Shape_ID= #TempTable.Container_ID)

UPDATE  #TempTable SET Display_Name =
	CASE
		WHEN Container_Name IS NOT NULL THEN '[' + Container_Name  + '] ' + Item_Name 
		ELSE Item_Name
	END

--- 5
SELECT * FROM #TempTable ORDER BY Display_Name
--- 6
DROP TABLE #TempTable
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[GetShapeTypeAttribute] (@ID as int)  AS

/*

OBJECTIVE
	retrieve list  values according to shapetype

INPUTS
	@ID  - shapetypeattribute filter

OUTPUTS
	shapetypeattribute_id, shapetypeattribute_desc, 
	shape_id, shape_name, shape_desc,
	shapetype_id, shapetype_name,
	attribute_id, attribute_name, 
	constrainedvalue_values,
	attributevalue_id, attributevalue_value

TASKS
	1. SELECT according to shapetypeattribute ID

NOTES
*/

--- 1
select sta.shapetypeattribute_id, shapetypeattribute_desc, 
	shape_id, shape_name, shape_desc,
	st.shapetype_id, st.shapetype_name,
	a.attribute_id, a.attribute_name, 
	cv.constrainedvalue_values,
	av.attributevalue_id, av.attributevalue_value
from shapetypeattribute as sta
	left join attribute as a on sta.attribute_id = a.attribute_id
	left join shapetype as st on sta.shapetype_id = st.shapetype_id
	left join constrainedvalue as cv on sta.shapetypeattribute_id = cv.sd_id AND cv.sdtable_id = 5
	left join attributevalue as av on sta.shapetypeattribute_id = av.shapetypeattribute_id
	left join shape as s on s.shape_id = av.SD_id
where sta.shapetypeattribute_id = @iD

order by shape_name
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[GetShapeTypeAttributeList](@ST_ID as int,@A_ID as int) AS

/*

OBJECTIVE
	retrieve list of ShapeTypeAttributes according to shapetype/attribute filter

INPUTS
	@ST_ID  - shapetype filter
	@A_ID  - attribtue filter

OUTPUTS


TASKS
	1. IF shapetype is not specified
		1. IF attribute is also not specified, RETURN non-null shapetypes & attributes
		2. ELSE (only attribute is specified), RETURN non-null shapetypes & all attributes
	2. ELSE (shapetype is specified)
		1. IF attribute is not specifed, RETURN non-null attributes & all shapetypes

NOTES
*/

--- 1
IF @ST_ID = 0 
	BEGIN
		--- 1.1
		IF @A_ID = 0
			BEGIN 
				SELECT DISTINCT 
						ShapeTypeAttribute.ShapeTypeAttribute_ID,
						ShapeTypeAttribute.ShapeTypeAttribute_Desc,
						Attribute.Attribute_Name + ' - ' + ShapeType.ShapeType_Name as ShapeTypeAttribute_Name,
						ShapeType.ShapeType_ID, 
						ShapeType.ShapeType_Name, 
						Attribute.Attribute_ID,
						Attribute.Attribute_Name
				FROM Attribute
				RIGHT JOIN ShapeTypeAttribute ON Attribute.Attribute_ID = ShapeTypeAttribute.Attribute_ID 
				LEFT JOIN ShapeType ON ShapeTypeAttribute.ShapeType_ID = ShapeType.ShapeType_ID 
				ORDER BY Attribute.Attribute_Name, ShapeType.ShapeType_Name
			END 
		--- 1.2
		ELSE
			BEGIN 
				SELECT DISTINCT 
					ShapeTypeAttribute.ShapeTypeAttribute_ID,
					ShapeTypeAttribute.ShapeTypeAttribute_Desc,
					ShapeType.ShapeType_ID, 
					ShapeType.ShapeType_Name, 
					Attribute.Attribute_ID,
					Attribute.Attribute_Name
				FROM ShapeType 
				LEFT JOIN ShapeTypeAttribute ON ShapeType.ShapeType_ID = ShapeTypeAttribute.ShapeType_ID 
					AND (ShapeTypeAttribute.Attribute_ID = @A_ID OR ShapeTypeAttribute.Attribute_ID IS NULL)
				LEFT JOIN Attribute ON ShapeTypeAttribute.Attribute_ID = Attribute.Attribute_ID
				ORDER BY ShapeType_Name
			END 
	END	
--- 2
ELSE
	BEGIN
		--- 2.1
		IF @A_ID = 0
			BEGIN --IF shapetype only criteria
				SELECT DISTINCT 
					ShapeTypeAttribute.ShapeTypeAttribute_ID,
					ShapeTypeAttribute.ShapeTypeAttribute_Desc,
					ShapeType.ShapeType_ID, 
					ShapeType.ShapeType_Name, 
					Attribute.Attribute_ID,
					Attribute.Attribute_Name
				FROM Attribute
				LEFT JOIN ShapeTypeAttribute ON Attribute.Attribute_ID = ShapeTypeAttribute.Attribute_ID AND ShapeTypeAttribute.ShapeType_ID = @ST_ID
				LEFT JOIN ShapeType ON ShapeTypeAttribute.ShapeType_ID = ShapeType.ShapeType_ID 
				ORDER BY Attribute.Attribute_Name
			END --IF shapetype only criteria
	END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[GetShapeTypeList] (@Abstraction as int)  AS

/*

OBJECTIVE
	retrieve list of ShapeTypes

INPUTS
	@Abstraction - AbstractionID to look for

OUTPUTS
	all fields in ShapeType table

TASKS
	1. IF Abstraction is not specified, return all shapetypes
	2. ELSE, return all shapetypes of this Abstraction

NOTES
*/

-- 1
IF @Abstraction IS NULL 
	BEGIN
		SELECT * FROM ShapeType ORDER BY ShapeType_Name
	END
-- 2
ELSE
	BEGIN
		SELECT * FROM ShapeType WHERE Abstraction_ID = @Abstraction  ORDER BY ShapeType_Name
	END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[GetTableList] AS

/*

OBJECTIVE
	retrieve list of SDTable

INPUTS


OUTPUTS
	all fields in SDTable table

TASKS

NOTES
*/

SELECT 	
*
FROM 	
	SDTable
ORDER BY
	SDTable_Name
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[SetArtifact] (@Table as int, @ID as int, @Function as int, @Name as varchar(100), @Contact as varchar(500),@NewID as 
int out) 
AS

/*

OBJECTIVE
	set artifact

INPUTS
	@Table  - TABLE_ARTIFACT
	@ID  - Artifact ID
	@Function - LOGFUNCTION_SET_ARTIFACT
	@Value - name
	@Contact - user

OUTPUTS
	
TASKS
	1. INSERT new artifact
	2. RETURN new artifact ID 
	3. LOG entry

NOTES
	does not check for duplicate. checks (if any) should be done in the business logic level
*/

	--- 1
	INSERT INTO Artifact (Artifact_Name) VALUES (@Name)
	--- 2
	SET @NewID = SCOPE_IDENTITY()
	--- 3
	EXEC SetLog @Table, @NewID, @Function, @Name, NULL, @Contact
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[SetArtifact_Contact] (@Table as int, @ID as int, @Function as int, @Value as varchar(1000), @Contact as varchar(500)) 
AS

/*

OBJECTIVE
	set contact for artifact

INPUTS
	@Table  - TABLE_ARTIFACT
	@ID  - Artifact ID
	@Function - LOGFUNCTION_SET_CONTACT
	@Value - contact
	@Contact - user

OUTPUTS
	
TASKS
	1.UPDATE new contact of artifact
	2. LOG entry

NOTES

*/

UPDATE Artifact SET Artifact_Contact = @Value WHERE Artifact_ID = @ID
EXEC SetLog @Table, @ID, @Function, @Value, NULL, @Contact
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[SetArtifact_Desc] (@Table as int, @ID as int, @Function as int, @Value as varchar(1000), @Contact as varchar(500)) 
AS

/*

OBJECTIVE
	set description for artifact

INPUTS
	@Table  - TABLE_ARTIFACT
	@ID  - Artifact ID
	@Function - LOGFUNCTION_SET_DESCRIPTION
	@Value - description
	@Contact - user

OUTPUTS
	
TASKS
	1.UPDATE new description of artifact
	2. LOG entry

NOTES

*/

--- 1
UPDATE Artifact SET Artifact_Desc = @Value WHERE Artifact_ID = @ID
--- 2
EXEC SetLog @Table, @ID, @Function, @Value, NULL, @Contact
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[SetArtifact_Loc] (@Table as int, @ID as int, @Function as int, @Value as varchar(1000), @Contact as varchar(500)) 
AS

/*

OBJECTIVE
	set location for artifact

INPUTS
	@Table  - TABLE_ARTIFACT
	@ID  - Artifact ID
	@Function - LOGFUNCTION_SET_LOCATION
	@Value - location
	@Contact - user

OUTPUTS
	
TASKS
	1.UPDATE new location of artifact
	2. LOG entry

NOTES

*/

--- 1
UPDATE Artifact SET Artifact_Loc = @Value WHERE Artifact_ID = @ID
--- 2
EXEC SetLog @Table, @ID, @Function, @Value, NULL, @Contact
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[SetArtifact_Name] (@Table as int, @ID as int, @Function as int, @Value as varchar(1000), @Contact as varchar(500)) 
AS

/*

OBJECTIVE
	set name for artifact

INPUTS
	@Table  - TABLE_ARTIFACT
	@ID  - Artifact ID
	@Function - LOGFUNCTION_SET_NAME
	@Value - name
	@Contact - user

OUTPUTS
	
TASKS
	1.UPDATE new name of artifact
	2. LOG entry

NOTES

*/

-- 1
UPDATE Artifact SET Artifact_Name = @Value WHERE Artifact_ID = @ID
-- 2
EXEC SetLog @Table, @ID, @Function, @Value, NULL, @Contact
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[SetArtifact_Note] (@Table as int, @ID as int, @Function as int, @Value as varchar(1000), @Contact as varchar(500)) 
AS

/*

OBJECTIVE
	set note for artifact

INPUTS
	@Table  - TABLE_ARTIFACT
	@ID  - Artifact ID
	@Function - LOGFUNCTION_SET_NOTE
	@Value - note
	@Contact - user

OUTPUTS
	
TASKS
	1.UPDATE new note of artifact
	2. LOG entry

NOTES

*/

-- 1
UPDATE Artifact SET Artifact_Note = @Value WHERE Artifact_ID = @ID
-- 2
EXEC SetLog @Table, @ID, @Function, @Value, NULL, @Contact
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[SetAttribute] (@Table as int,@Function as int, @Value as varchar(1000), @Contact as varchar(1000) , @NewID as int 
out)
AS

/*

OBJECTIVE
	set  attribute

INPUTS
	@SDTable_ID - TABLE_ATTRIBUTE
	@Function - LOGFUNCTION_SET_NAME
	@Values - name of attribute
	@Contact - user

OUTPUTS
	@NewID - ID of new attribute
	
TASKS
	1.INSERT new attribute
	2. RETURN new ID
	3. LOG entry

NOTES

*/


	INSERT INTO Attribute VALUES(@Value)
	SET @NewID = SCOPE_IDENTITY()
	EXEC SetLog @Table, @NewID, @Function, @Value, NULL, @Contact
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[SetAttributeValue](@Table as int, @ID as int, @STA_ID as int, @Value as varchar(1000),  @Function as int, @Contact as 
varchar(100)) 

AS

/*

OBJECTIVE
	set  attribute

INPUTS
	@SDTable_ID - TABLE_ATTRIBUTE
	@Function - LOGFUNCTION_SET_NAME
	@Values - name of attribute
	@Contact - user

OUTPUTS
	@NewID - ID of new attribute
	
TASKS
	1. IF currently not in the ATTRIBUTEVALUE table
		1.  IF value is not empty string, insert into table
			1. LOG entry : value
			2. LOG entry : item
			3. LOG entry : shapetypeattribute
	2. ELSE (currently in ATTRIBUTEVALUE table)
		1. IF value is now an empty string, delete the attributevalue from the table
		2. ELSE update into table
		3. LOG entry : value

NOTES

*/


DECLARE @ProcTable int
SET @ProcTable  = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'AttributeValue')
DECLARE @ProcID int


--- 1
IF (SELECT COUNT(*) FROM AttributeValue WHERE SDTable_ID = @Table AND SD_ID = @ID AND ShapeTypeAttribute_ID = @STA_ID ) = 0 
	BEGIN
		--- 1.1
		IF @Value <> ''
			BEGIN
				DECLARE @STA_TABLE int
				SET @STA_TABLE  = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'ShapeTypeAttribute')
				INSERT INTO AttributeValue VALUES (@Table, @ID, @STA_ID, @Value)
				SET @ProcID  = SCOPE_IDENTITY()			
				-- 1.1.1
				EXEC SetLog @ProcTable, @ProcID, @Function, @Value, NULL, @Contact
				-- 1.1.2
				EXEC SetLog @ProcTable, @ProcID, @Function, @Table, @ID, @Contact
				-- LOG SHAPETYPEATTRIBUTE OF THIS VALUE
				EXEC SetLog @ProcTable, @ProcID, @Function, @STA_Table, @STA_ID, @Contact
			END
	END
--- 2
ELSE
	BEGIN
		SET @ProcID = (SELECT AttributeValue_ID FROM AttributeValue WHERE SDTable_ID = @Table AND SD_ID = @ID AND ShapeTypeAttribute_ID = @STA_ID)
		--- 2.1
		IF @Value = ''
			BEGIN
				DECLARE @ProcFunction int
				SET @ProcFunction  = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_DELETE_ATTRIBUTEVALUE')
				EXEC SetLog @Table, @ID, @ProcFunction, NULL, NULL, @Contact
				DELETE FROM AttributeValue WHERE AttributeValue_ID = @ProcID
			END

		ELSE
			BEGIN
				--- 2.2
				UPDATE AttributeValue SET AttributeValue_Value = @Value WHERE AttributeValue_ID = @ProcID
				--- 2.3
				EXEC SetLog @ProcTable, @ProcID, @Function, @Value, NULL, @Contact
			END
	END



SET NOCOUNT OFF
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[SetAttribute_Name] (@Table as int, @ID as int, @Function as int, @Value as varchar(1000), @Contact as varchar(500)) 
AS

/*

OBJECTIVE
	set name of attribute

INPUTS
	@SDTable_ID - TABLE_ATTRIBUTE
	@SD_ID - Attribute  ID
	@Function - LOGFUNCTION_SET_NAME
	@Values - name of attribute
	@Contact - user

OUTPUTS
	
TASKS
	1. UPDATE name of attribute
	2. LOG entry

NOTES

*/

-- 1
UPDATE Attribute SET Attribute_Name = @Value WHERE Attribute_ID = @ID
-- 2
EXEC SetLog @Table, @ID, @Function, @Value, NULL, @Contact
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[SetConstrainedValue] (@SDTable_ID as int, @SD_ID as int, @Function as int, @Values as varchar(2000), @Contact as varchar(1000))

AS

/*

OBJECTIVE
	set/reset constrained values

INPUTS
	@SDTable_ID - TABLE_SHAPETYPEATTRIBUTE
	@SD_ID - ShapeType ID
	@Function - LOGFUNCTION_DELETE_CONSTRAINEDVALUE, LOGFUNCTION_SET_CONSTRAINEDVALUE
	@Values - list of constrained values
	@Contact - user

OUTPUTS
	
TASKS
	1. prep local vars
	2. IF constrained values already exist for this entry
		1. but no longer has values
			1.  delete from ConstrainedValue table
		2. else  
			1. UPDATE ConstrainedValue table
			2. LOG entry

	3. ELSE if new entry
			1. INSERT in ConstrainedValue table
			2. LOG entry: constrained value list
			3. LOG ENTRY: shapetypeattribute it belongs to

NOTES

*/

--- 1
DECLARE @CVTable_ID int
SET @CVTable_ID = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'ConstrainedValue')
DECLARE @CV_ID int
SET @CV_ID = (SELECT ConstrainedValue_ID FROM ConstrainedValue WHERE SDTable_ID = @SDTable_ID AND SD_ID = @SD_ID)
--- 2
IF (SELECT COUNT(*) FROM ConstrainedValue WHERE SDTable_ID = @SDTable_ID AND SD_ID = @SD_ID) > 0
	BEGIN
		IF @Values = ''
			--- 2.1
			BEGIN 
				EXEC DeleteConstrainedValue @CVTable_ID, @CV_ID, @Function, @Contact
			END
		ELSE
			BEGIN
				--- 2.2
				UPDATE ConstrainedValue SET ConstrainedValue_Values = @Values WHERE SDTable_ID = @SDTable_ID AND SD_ID = @SD_ID
				--- 2.3
				EXEC SetLog @CVTable_ID, @CV_ID, @Function, @Values, NULL, @Contact
			END
	END
ELSE
--- 3
	BEGIN
		IF @Values <> ''
			BEGIN
				--- 3.1
				INSERT INTO ConstrainedValue (SDTable_ID, SD_ID, ConstrainedValue_Values) VALUES (@SDTable_ID, @SD_ID, @Values)
				--- 3.2
				EXEC SetLog @CVTable_ID, @CV_ID, @Function, @Values, NULL, @Contact
				--- 3.3
				EXEC SetLog @CVTable_ID, @CV_ID, @Function, @SDTable_ID, @SD_ID, @Contact
			END
	END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[SetContainer](@Table_Container as int, @ID_Container as int, @Table_Contained as int, @ID_Contained as int, @Abstraction_ID as int, @Function as int, @Contact as varchar(100)) AS

/*

OBJECTIVE
	set/reset item (shape or artifact) into its container

INPUTS
	@Table_Container - TABLE_SHAPE
	@ID_Container - ID of item container
	@Table_Contained - TABLE_ARTIFACT, TABLE_SHAPE 
	@ID_Contained - ID item/artifact contained
	@Abstraction_ID -  abstraction type of this container
	@Function - LOGFUNCTION_SET_CONTAINER
	@Contact - user

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

IF  (@assoc_id is NULL) or (@Abstraction_ID =  (select Abstraction_ID from Abstraction where Abstraction_Name = 'ARTIFACT'))
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
		-- 2.6
		IF @Abstraction_ID = (select Abstraction_ID from Abstraction WHERE Abstraction_Name = 'ARTIFACT') 
			begin
				 IF (select ShapeType_ID from Shape where Shape_ID = @ID_Container) IN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name IN ('SYSTEM','BUSINESSPROCESS'))
					begin
						--- 2.6.1
						declare temp1 cursor for select SD_ID_Contained from Container where SD_ID_Container = @ID_Container and Abstraction_ID in (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name IN ('SYSTEMOBJECT','BUSINESSPROCESS'))
						open temp1
						--- 2.6.2
						declare @contained int
						fetch next from temp1 into @contained
						while @@fetch_status = 0 
							begin
								--- 2.6.3
								insert into Container(SDTable_ID_Container, SD_ID_Container, SDTable_ID_Contained, SD_ID_Contained, Abstraction_ID)
									select @Table_Container, @contained, @Table_Contained, @ID_Contained, @Abstraction_ID
								--- 2.6.4
								exec  SetLog @Table, @New, @Function, @AbstractionTable, @Abstraction_ID, @Contact
								-- 2.6.5
								exec SetLog @Table, @New, @Function, @Table_Container, @contained, @Contact
								-- 2.6.6
								exec SetLog @Table, @New, @Function, @Table_Contained, @ID_Contained, @Contact
								fetch next from temp1 into @contained
							end

						close temp1
						deallocate temp1
					end
			end

	END
ELSE
	BEGIN
		--- 1.1
		declare @oldcontainer int
		set @oldcontainer = (select SD_ID_Container from Container where Container_ID = @assoc_id)

		--- 1.2
		declare @sdtable_container  int
 		set @sdtable_container = (select SDTable_ID from SDTable where SDTable_Name = 'Container')
		declare @function_delete int
 		set @function_delete = (select SDLogFunction_ID from SDLogFunction where SDLogFunction_Name = 'LOGFUNCTION_DELETE_CONTAINER')
		EXEC SetLog @sdtable_container, @assoc_id, @function_delete, NULL, 'Switch Container', @Contact

		--- 1.3
		update Container set SDTable_ID_Container = @Table_Container, SD_ID_Container = @ID_Container where Container_ID = @assoc_id
	
			--- 1.3.1
			declare @assoc_abstractionid int
			set @assoc_abstractionid = (select Abstraction_ID from Container where Container_ID = @assoc_id)
			declare @sdtable_abstraction int
			set @sdtable_abstraction = (select SDTable_ID from SDTable where SDTable_Name = 'Abstraction')
			EXEC SetLog @sdtable_container, @assoc_id, @Function, @sdtable_abstraction, @assoc_abstractionid, @Contact
			--- 1.3.2
			EXEC SetLog @sdtable_container, @assoc_id, @Function, @Table_Container, @ID_Container, @Contact
			--- 1.3.3
			EXEC SetLog @sdtable_container, @assoc_id, @Function, @Table_Contained, @ID_Contained, @Contact
	

		--- 1.4 	
		declare @abstraction_containerrelation int
		set @abstraction_containerrelation = (select 
			case	
				when @Abstraction_ID = (select Abstraction_ID from Abstraction where Abstraction_Name = 'SYSTEMOBJECT') then (select Abstraction_ID from Abstraction where Abstraction_Name = 'SYSTEM')
				when @Abstraction_ID = (select Abstraction_ID from Abstraction where Abstraction_Name = 'BUSINESSSTEP') then (select Abstraction_ID from Abstraction where Abstraction_Name = 'BUSINESS')
			end)
		declare @sdtable_relation int
		set @sdtable_relation = (select SDTable_ID from SDTable where SDTable_Name = 'Relation')
		set @function_delete = (select SDLogFunction_ID from SDLogFunction where SDLogFunction_Name = 'LOGFUNCTION_DELETE_RELATION')
		declare @function_set int
		set @function_set = (select SDLogFunction_ID from SDLogFunction where SDLogFunction_Name = 'LOGFUNCTION_SET_RELATION')

		--- 1.5
		declare related cursor for
		select distinct sd_id_container 
		from container 
		where sd_id_contained 
			in (select 
				case
					when sd_id_begin = @ID_Contained then sd_id_end
					when sd_id_end = @ID_Contained then sd_id_begin
				end 
				from relation 
				where sd_id_end = @ID_Contained or sd_id_begin = @ID_Contained) 
			and abstraction_id 
				in (select abstraction_id from abstraction where abstraction_name in ('SYSTEMOBJECT', 'BUSINESSSTEP'))

		open related
		
		declare @related_id int
		
		fetch next from related into @related_id
		
		while @@fetch_status = 0
		begin
			--- 1.6
			if (select count(*) from relation 
				where ( sd_id_begin in (select sd_id_contained from Container where sd_id_container = @related_id and abstraction_id = @Abstraction_ID)
						and sd_id_end in (select sd_id_contained from Container where sd_id_container = @oldcontainer and abstraction_id = @Abstraction_ID) )
					or ( sd_id_end in (select sd_id_contained from Container where sd_id_container = @related_id and abstraction_id = @Abstraction_ID)
						and sd_id_begin in (select sd_id_contained from Container where sd_id_container = @oldcontainer and abstraction_id = @Abstraction_ID) )
					and abstraction_id 
						in (select abstraction_id from abstraction where abstraction_name in ('OBJECT', 'STEP')) ) = 0
				begin
					--- 1.6.1
					declare @oldrelation int
					set @oldrelation = (select Relation_ID from Relation where 
						(SD_ID_Begin = @oldcontainer and SD_ID_End = @related_id)
						or (SD_ID_End = @oldcontainer and SD_ID_Begin = @related_id)
						and abstraction_id in (select abstraction_id from abstraction where abstraction_name in ('SYSTEM', 'BUSINESSPROCESS')) )
				--	delete from Relation where Relation_ID = @oldrelation
					exec DeleteRelation  @sdtable_relation, @oldrelation, @abstraction_containerrelation, @function_delete, @Contact
				end
			--- 1.7
			if (select count(*) from relation 
				where (sd_id_begin = @ID_Container and sd_id_end = @related_id)
					or (sd_id_begin = @related_id and sd_id_end = @ID_Container)
					and abstraction_id = @abstraction_containerrelation) = 0
				begin
					--- 1.7.1
					exec SetRelation  NULL, NULL, @Table_Container, @ID_Container, @Table_Container, @related_id, @abstraction_containerrelation, @function_set, @Contact 
				end

			fetch next from related into @related_id
		end
		
		close related
		deallocate related


		--- 1.8
		declare @abstraction_artifact int
		set @abstraction_artifact = (select Abstraction_ID from Abstraction where Abstraction_Name = 'ARTIFACT')
		declare @sdtable_artifact int
		set @sdtable_artifact = (select SDTable_ID from SDTable where SDTable_Name = 'Artifact')
		declare @function_set_artifact int
		set @function_set_artifact = (select SDLogFunction_ID from SDLogFunction where SDLogFunction_Name = 'LOGFUNCTION_SET_ARTIFACT')
		

		declare newartifacts cursor for
		select distinct SD_ID_Contained 
		from Container 
		where SD_ID_Container = @ID_Container and Abstraction_ID = @abstraction_artifact

		open newartifacts

		declare @newartifact_id int

		fetch next from newartifacts into @newartifact_id
		
		while @@fetch_status = 0
		begin
			if (select count(*) from Container where Abstraction_ID = @abstraction_artifact and SD_ID_Container = @ID_Contained and SD_ID_Contained = @newartifact_id) = 0
			begin
				--- 1.8.1
				insert into Container values (@Table_Contained, @ID_Contained, @sdtable_artifact, @newartifact_id, @abstraction_artifact)
				--- 1.8.2
				declare @newcontainer int
				set @newcontainer  = SCOPE_IDENTITY()
				exec SetLog @sdtable_container, @newcontainer, @function_set_artifact, @sdtable_abstraction, @abstraction_artifact, @Contact
				--- 1.8.3
				exec SetLog @sdtable_container, @newcontainer, @function_set_artifact, @Table_Contained, @ID_Contained, @Contact
				--- 1.8.4
				exec SetLog @sdtable_container, @newcontainer, @function_set_artifact, @sdtable_artifact, @newartifact_id, @Contact
				
				fetch next from newartifacts into @newartifact_id
				
			end
		end

		close newartifacts
		deallocate newartifacts

	END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[SetItem] (@Table as int, @ShapeType as int, @Lifecycle as int, @Function as int, @Value as varchar(1000), @Contact as varchar(1000), @NewID as int out) 

AS

/*

OBJECTIVE
	set description for a  ShapeTypeAttribute

INPUTS
	@Table - TABLE_SHAPETYPEATTRIBUTE
	@A_ID - Attribute ID
	@ST_ID - ShapeType ID
	@Function - LOGFUNCTION_SET_SHAPETYPEATTRIBUTE
	@Contact - user

OUTPUTS
	@NewID - ID of new Shape
	
TASKS
	1. INSERT new Shape
	2. SET/RETURN New ID 
	3. prep for LOG entries
	4. LOG Shape entry : Name
	5. LOG Shape entry : ShapeType
	6. LOG Shape entry : Lifecycle

NOTES
	this function does not check for duplicates. whether duplicates should/should not be allowed is determined in the business layer
*/

--- 1
INSERT INTO Shape (ShapeType_ID, Shape_Name, Lifecycle_ID) VALUES (@ShapeType,@Value,@Lifecycle)
--- 2
SET @NewID = SCOPE_IDENTITY()
--- 3
DECLARE @Table_ShapeType int
SET @Table_ShapeType = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'ShapeType')
DECLARE @Table_Lifecycle int
SET @Table_Lifecycle = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Lifecycle')
DECLARE @Function_Lifecycle int
SET @Function_Lifecycle = (SELECT SDLogFunction_ID FROM SDLogFunction WHERE SDLogFunction_Name = 'LOGFUNCTION_SET_LIFECYCLE')
--- 4
EXEC SetLog @Table, @NewID, @Function, @Value, NULL, @Contact
--- 5
EXEC SetLog @Table, @NewID, @Function, @Table_ShapeType, @ShapeType, @Contact
--- 6
EXEC SetLog @Table, @NewID, @Function_Lifecycle, @Table_Lifecycle, @Lifecycle, @Contact
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[SetItem_Desc] (@Table as int, @ID as int, @Function as int, @Value as varchar(1000), @Contact as varchar(500)) 
AS

/*

OBJECTIVE
	set description for a  Shape

INPUTS
	@Table -TABLE_SHAPE
	@ID - Shape ID
	@Function - LOGFUNCTION_SET_DESCRIPTION
	@Value - description
	@Contact - user

OUTPUTS
	
TASKS
	1. UPDATE description of Shape	
	2. LOG entry

NOTES

*/

--- 1
UPDATE Shape SET Shape_Desc = @Value WHERE Shape_ID = @ID
--- 2
EXEC SetLog @Table, @ID, @Function, @Value, NULL, @Contact
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[SetItem_Lifecycle] (@Table as int, @ID as int, @Function as int, @Value as varchar(1000), @Contact as varchar(500)) 
AS

/*

OBJECTIVE
	set lifecycle for a  Shape

INPUTS
	@Table -TABLE_SHAPE
	@ID - Shape ID
	@Function - LOGFUNCTION_SET_LIFECYCLE
	@Value - lifecycle
	@Contact - user

OUTPUTS
	
TASKS
	1. UPDATE lifecycle of Shape	
	2. prep local var for LOG entry
	3. LOG entry

NOTES

*/

-- 1
UPDATE Shape SET Lifecycle_ID = @Value WHERE Shape_ID = @ID
--- 2
DECLARE @TableLifecycle int
SET @TableLifecycle = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Lifecycle')
--- 3
EXEC SetLog @Table, @ID, @Function, @TableLifecycle, @Value, @Contact
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[SetItem_Name] (@Table as int, @ID as int, @Function as int, @Value as varchar(1000), @Contact as varchar(500)) 
AS

/*

OBJECTIVE
	set name for a  Shape

INPUTS
	@Table -TABLE_SHAPE
	@ID - Shape ID
	@Function - LOGFUNCTION_SET_NAME
	@Value - name
	@Contact - user

OUTPUTS
	
TASKS
	1. UPDATE name of Shape	
	2. LOG entry

NOTES

*/

UPDATE Shape SET Shape_Name = @Value WHERE Shape_ID = @ID
EXEC SetLog @Table, @ID, @Function, @Value, NULL, @Contact
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

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
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[SetRelation](@ID as int, @Relation as varchar(100), @Table_Begin as int, @ID_Begin as int, @Table_End as int, @ID_End as int, @Abstraction_ID as int, @Function as int, @Contact as varchar(100)) AS

/*

OBJECTIVE
	set/resets a relation

INPUTS
	@ID - Relation ID
	@Relation - name of relation
	@Table_Begin - table of the beginning ID (FROM)
	@ID_Begin - beginning ID (FROM)
	@Table_End - table of the end ID (TO)
	@ID_End - end ID (TO)
	@AbstractionID - abstraction type of relation
	@FUNCTION - LOGFUNCTION_SET_RELATION
	@Contact - user

OUTPUTS
	
TASKS
	1. do not allow for relation to connect to itself
	2. if @ID is null, this is to be a new relation, INSERT into Relations table
	3. prep local vars for LOG entry
	4. LOG entry : relation name
	5. LOG entry : relation abstraction
	6. LOG entry : relation beginning
	7. LOG entry : relation end
	8. IF this is an OBJECT/STEP RELATION, a relation between their containers might be necessary
		1. IF they have different containers,
			1. IF this container relation does not exist
			2. INSERT into Relations table
			3. LOG entry : relation name
			4. LOG entry : relation abstraction
			5. LOG entry : relation beginning
			6. LOG entry : relation end

NOTES
	currently, this is only used to set (create) a new relation, so NULL should be the @ID input

*/


BEGIN TRAN

--- 1
IF @Table_Begin <> @Table_End OR @ID_Begin <> @ID_End 
BEGIN
	--- 2
	IF @ID IS NULL 
	BEGIN
		INSERT INTO RELATION VALUES (@Table_Begin, @ID_Begin, @Table_End, @ID_End, @Relation,  NULL, @Abstraction_ID)
		--- 3
		DECLARE @New int
		SET @New  = SCOPE_IDENTITY()
		DECLARE @Table int
		SET @Table = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Relation')
		DECLARE @Table_Abstraction int
		SET @Table_Abstraction = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Abstraction')
		--- 4
		EXEC SetLog @Table, @New, @Function, @Relation, NULL, @Contact
		--- 5
		EXEC SetLog @Table, @New, @Function, @Table_Abstraction, @Abstraction_ID, @Contact
		--- 6
		EXEC SetLog @Table, @New, @Function, @Table_Begin, @ID_Begin, @Contact
		--- 7
		EXEC SetLog @Table, @New, @Function, @Table_End, @ID_End, @Contact
	

		--- 8
		IF @Abstraction_ID IN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT' OR Abstraction_Name ='STEP')  
			BEGIN
				DECLARE @Container_Abstraction int
				SET @Container_Abstraction = 
					CASE
						WHEN @Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT')  THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEMOBJECT')
						WHEN @Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP')  THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESSSTEP')
					END
				DECLARE @TempID_Begin int
				SET @TempID_Begin  = (SELECT SD_ID_Container FROM Container WHERE Abstraction_ID = @Container_Abstraction AND SDTable_ID_Contained = @Table_Begin AND SD_ID_Contained = @ID_Begin )
				DECLARE @TempID_End int
				SET @TempID_End  = (SELECT SD_ID_Container FROM Container WHERE Abstraction_ID = @Container_Abstraction AND SDTable_ID_Contained = @Table_End AND SD_ID_Contained = @ID_End )
				--- 8.1
				IF @TempID_Begin <> @TempID_End 
					BEGIN
						DECLARE @TempAbstraction int
						SET @TempAbstraction =
							CASE
								WHEN @Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT')  THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEM')
								WHEN @Abstraction_ID = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP')  THEN (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESS')
							END
						--- 8.1.1
						IF ((SELECT COUNT(*) FROM Relation WHERE SDTable_ID_Begin = @Table_Begin AND SD_ID_Begin = @TempID_Begin AND SDTable_ID_End = @Table_End AND SD_ID_End = @TempID_End AND Abstraction_ID = @TempAbstraction) = 0 )
							AND ((SELECT COUNT(*) FROM Relation WHERE SDTable_ID_Begin = @Table_End AND SD_ID_Begin = @TempID_End AND SDTable_ID_End = @Table_Begin AND SD_ID_End = @TempID_Begin AND Abstraction_ID = @TempAbstraction) = 0 )
							--- CREATE SYSTEM RELATION
							BEGIN
								--- 8.1.2
								INSERT INTO RELATION VALUES (@Table_Begin, @TempID_Begin, @Table_End, @TempID_End, NULL,  NULL, @TempAbstraction)
								SET @New  = SCOPE_IDENTITY()
								--- 8.1.3
								EXEC SetLog @Table, @New, @Function, NULL, NULL, @Contact
								--- 8.1.4
								EXEC SetLog @Table, @New, @Function, @Table_Abstraction, @TempAbstraction, @Contact
								--- 8.1.5
								EXEC SetLog @Table, @New, @Function, @Table_Begin, @TempID_Begin, @Contact
								--- 8.1.6
								EXEC SetLog @Table, @New, @Function, @Table_End, @TempID_End, @Contact
							END
					END
			END
	END
END

COMMIT TRAN
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

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
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[SetRelation_Direction] (@Table as int, @ID as int, @Function as int, @Begin_ID as int, @Contact as varchar(500)) 
AS

/*

OBJECTIVE
	set/reset direction for a  Relation

INPUTS
	@Table -TABLE_RELATION
	@ID - Relation ID
	@Function - LOGFUNCTION_SET_RELATION
	@Begin_ID - gets the current BeginID, to be switched to EndID later
	@Contact - user

OUTPUTS
	
TASKS
	1. prep local vars for direction switch
	2. UPDATE relation
	3. LOG entry : "NULL,NULL" SHOWS THAT RELATION HAS CHANGED DIRECTION
	4. LOG entry : Begin 
	5. LOG entry : End

NOTES

*/

--- 1
DECLARE @Table_Begin int
SET @Table_Begin = 
	CASE 
		WHEN @Begin_ID = (SELECT SD_ID_Begin FROM Relation WHERE Relation_ID = @ID) THEN (SELECT SDTable_ID_End FROM Relation WHERE Relation_ID = @ID)
		ELSE (SELECT SDTable_ID_Begin FROM Relation WHERE Relation_ID = @ID)
	END

DECLARE @Table_End int
SET @Table_End = 
	CASE 
		WHEN @Begin_ID = (SELECT SD_ID_Begin FROM Relation WHERE Relation_ID = @ID) THEN (SELECT SDTable_ID_Begin FROM Relation WHERE Relation_ID = @ID)
		ELSE (SELECT SDTable_ID_End FROM Relation WHERE Relation_ID = @ID)
	END

DECLARE @ID_Begin int
SET @ID_Begin = 
	CASE 
		WHEN @Begin_ID = (SELECT SD_ID_Begin FROM Relation WHERE Relation_ID = @ID) THEN (SELECT SD_ID_End FROM Relation WHERE Relation_ID = @ID)
		ELSE (SELECT SD_ID_Begin FROM Relation WHERE Relation_ID = @ID)
	END

DECLARE @ID_End int
SET @ID_End = 
	CASE 
		WHEN  @Begin_ID = (SELECT SD_ID_Begin FROM Relation WHERE Relation_ID = @ID) THEN @Begin_ID
		ELSE (SELECT SD_ID_End FROM Relation WHERE Relation_ID = @ID)
	END

BEGIN TRAN

--- 2
UPDATE Relation SET SDTable_ID_Begin = @Table_Begin, SD_ID_Begin = @ID_Begin, SDTable_ID_End = @Table_End, SD_ID_End = @ID_End WHERE Relation_ID = @ID

--- 3
EXEC SetLog @Table, @ID, @Function, NULL, NULL, @Contact
--- 4
EXEC SetLog @Table, @ID, @Function, @Table_Begin, @ID_Begin, @Contact
--- 5
EXEC SetLog @Table, @ID, @Function, @Table_End, @ID_End, @Contact

COMMIT TRAN
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

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
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[SetShapeTypeAttribute](@Table as int, @A_ID as int, @ST_ID as int,  @Function as int, @Contact as varchar(100),@NewID as int out) AS

/*

OBJECTIVE
	set description for a  ShapeTypeAttribute

INPUTS
	@Table - TABLE_SHAPETYPEATTRIBUTE
	@A_ID - Attribute ID
	@ST_ID - ShapeType ID
	@Function - LOGFUNCTION_SET_SHAPETYPEATTRIBUTE
	@Contact - user

OUTPUTS
	@NewID - ID of new ShapeTypeAttribute
	
TASKS
	1. IF ShapeTypeAttribute does not already exist
	2. RETURN new ShapeTypeAttribute ID
	3. prep for LOG entry, set name of new shapetypeattribute :  Attribute - ShapeType
	4. LOG ShapeTypeAttribute entry : Name
	5. LOG ShapeTypeAttribute entry : ShapeType
	6. LOG ShapeTypeAttribute entry : Attribute

NOTES

*/


BEGIN TRAN
	
--- 1
IF (SELECT COUNT(*) FROM ShapeTypeAttribute WHERE ShapeType_ID = @ST_ID AND Attribute_ID = @A_ID) = 0
   BEGIN
	--- 2
	INSERT INTO ShapeTypeAttribute VALUES (@ST_ID, @A_ID, NULL)
	SET @NewID = SCOPE_IDENTITY()
	--- 3
	DECLARE @Name varchar(200)
	SET @Name  = (SELECT Attribute_Name FROM Attribute WHERE Attribute_ID = @A_ID) + ' - ' + (SELECT ShapeType_Name FROM ShapeType WHERE ShapeType_ID = @ST_ID)
	DECLARE @ST_Table int
	SET @ST_Table  = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'ShapeType')
	DECLARE @A_Table int
	SET @A_Table  = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name =  'Attribute')
	--- 4
	EXEC SetLog @Table, @NewID, @Function, @Name, NULL, @Contact
	--- 5
	EXEC SetLog @Table, @NewID, @Function, @ST_Table, @ST_ID, @Contact
	--- 6
	EXEC SetLog @Table, @NewID, @Function, @A_Table, @A_ID, @Contact

    END

COMMIT TRAN

SET NOCOUNT OFF
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[SetShapeTypeAttribute_Desc] (@Table as int, @ID as int, @Function as int, @Value as varchar(1000), @Contact as varchar(500)) 
AS

/*

OBJECTIVE
	set description for a  ShapeTypeAttribute

INPUTS
	@Table - ShapeTypeAttribute table
	@ID - ShapeTypeAttribute ID
	@Function - LOGFUNCTION_SET_DESCRIPTION
	@Value - description
	@Contact - user

OUTPUTS
	
TASKS
	1. UPDATE description of ShapeTypeAttribute
	2. LOG entry

NOTES

*/

--- 1
UPDATE ShapeTypeAttribute SET ShapeTypeAttribute_Desc = @Value WHERE ShapeTypeAttribute_ID = @ID
--- 2
EXEC SetLog @Table, @ID, @Function, @Value, NULL, @Contact
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[TransferToLogging] AS


/*
--- change sdlogfunction_id = 11 for artifacts
update sdlog set sdlogfunction_id = 11 where sdlog_id in (select sdlog_id from sdlog where sdtable_id = 12 and sd_id in (select sd_id from sdlog where sdtable_id = 12 and sdlog_value = '1' and sdlog_note = '7' ))
*/

--- sdlogfunction_id = 1 : funnel into dbo.logging
insert into logging (SDLogFunction_ID, SDTable_ID, SD_ID, Abstraction_ID, Name1_Table_ID, Name1_ID, Name2_Table_ID, Name2_ID, Logging_Value, Logging_Contact, Logging_DateTime)
select SDLogFunction_ID, SDTable_ID, SD_ID, 7,SDTable_ID, SD_ID, NULL, NULL, SDLog_Value, SDLog_Contact, SDLog_DateTime
from sdlog
where sdlogfunction_id = 1


--- sdlogfunction_id = 2 : funnel into dbo.logging
insert into logging (SDLogFunction_ID, SDTable_ID, SD_ID, Abstraction_ID, Name1_Table_ID, Name1_ID, Name2_Table_ID, Name2_ID, Logging_Value, Logging_Contact, Logging_DateTime)
select SDLogFunction_ID, SDTable_ID, SD_ID, 7,SDTable_ID, SD_ID, NULL, NULL, SDLog_Value, SDLog_Contact, SDLog_DateTime
from sdlog
where sdlogfunction_id = 2


--- sdlogfunction_id = 3 : funnel into dbo.logging
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE crosstab 
@select varchar(8000),
@sumfunc varchar(100), 
@pivot varchar(100), 
@table varchar(100) 
AS

DECLARE @sql varchar(8000), @delim varchar(1)
SET NOCOUNT ON
SET ANSI_WARNINGS OFF

EXEC ('SELECT ' + @pivot + ' AS pivot INTO ##pivot FROM ' + @table + ' WHERE 1=2')
EXEC ('INSERT INTO ##pivot SELECT DISTINCT ' + @pivot + ' FROM ' + @table + ' WHERE ' + @pivot + ' Is Not Null')

SELECT @sql='',  @sumfunc=stuff(@sumfunc, len(@sumfunc), 1, ' END)' )

SELECT @delim=CASE Sign( CharIndex('char', data_type)+CharIndex('date', data_type) ) 
WHEN 0 THEN '' ELSE '''' END 
FROM tempdb.information_schema.columns 
WHERE table_name='##pivot' AND column_name='pivot'

SELECT @sql=@sql + '''' + convert(varchar(100), pivot) + ''' = ' + stuff(@sumfunc,charindex( '(', @sumfunc )+1, 0, ' CASE ' + @pivot + ' WHEN ' + @delim + convert(varchar(100), pivot) + @delim + ' THEN ' ) + ', ' FROM ##pivot

DROP TABLE ##pivot

SELECT @sql=left(@sql, len(@sql)-1)
SELECT @select=stuff(@select, charindex(' FROM ', @select)+1, 0, ', ' + @sql + ' ')

EXEC (@select)
SET ANSI_WARNINGS ON

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

