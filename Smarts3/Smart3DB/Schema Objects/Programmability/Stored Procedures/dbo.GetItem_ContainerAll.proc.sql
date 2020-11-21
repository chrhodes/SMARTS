
CREATE PROCEDURE [dbo].[GetItem_ContainerAll](@Table as int, @ID as int) AS

SET NOCOUNT ON

DECLARE @SD_ID_Container int
DECLARE @SD_ID_Contained int

CREATE TABLE #Temp(SD_ID_Contained int, SD_ID_Container int, Name_Container varchar(500), ShapeType_Container int, Abstraction_Container int)
SELECT @SD_ID_Container = SD_ID_Container FROM Container WHERE SDTable_ID_Contained = @Table and SD_ID_Contained = @ID
SELECT @SD_ID_Contained = @ID

WHILE @@Rowcount > 0
	BEGIN
		INSERT #Temp(SD_ID_Contained, SD_ID_Container, Name_Container, ShapeType_Container, Abstraction_Container)
		SELECT SD_ID_Contained, SD_ID_Container, Shape_Name, ShapeType.ShapeType_ID, ShapeType.Abstraction_ID FROM Container 
			LEFT JOIN Shape ON Shape.Shape_ID = SD_ID_Container 
			LEFT JOIN ShapeType ON Shape.ShapeType_ID = ShapeType.ShapeType_ID WHERE SD_ID_Container = @SD_ID_Container AND SD_ID_Contained = @SD_ID_Contained
		SELECT @SD_ID_Contained = @SD_ID_Container
		SELECT @SD_ID_Container = SD_ID_Container FROM Container WHERE SDTable_ID_Contained = @Table AND SD_ID_Contained = @SD_ID_Container
	END

SELECT * FROM #Temp 

DROP TABLE #Temp
