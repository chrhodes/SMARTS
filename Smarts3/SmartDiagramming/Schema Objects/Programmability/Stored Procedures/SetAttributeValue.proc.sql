
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
