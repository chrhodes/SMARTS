
CREATE PROCEDURE [dbo].[DeleteAttributeValue] (@Table as int, @ID as int, @Function as int, @Contact as varchar(500)) AS

/*

NOTES
	1.NOT SURE IF THIS IS EVEN USED 

*/

IF (SELECT COUNT(*) FROM AttributeValue WHERE AttributeValue_ID = @ID) > 0
	BEGIN
		EXEC SetLog @Table, @ID, @Function, NULL, NULL, @Contact
		DELETE FROM AttributeValue WHERE AttributeValue_ID = @ID
	END
