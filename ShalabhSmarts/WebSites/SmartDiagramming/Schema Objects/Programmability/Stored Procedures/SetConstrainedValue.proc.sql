
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
