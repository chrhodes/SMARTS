
CREATE PROCEDURE [dbo].[DeleteConstrainedValue] (@Table as int, @ID as int, @Function as int, @Contact as varchar(500)) AS


IF (SELECT COUNT(*) FROM ConstrainedValue WHERE ConstrainedValue_ID = @ID) > 0
	BEGIN
		EXEC SetLog @Table, @ID, @Function, NULL, NULL, @Contact
		DELETE FROM ConstrainedValue WHERE ConstrainedValue_ID = @ID
	END
