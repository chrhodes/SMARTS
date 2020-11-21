
CREATE PROCEDURE [dbo].[GetItem_ContainedAll](@Table as int, @ID as int) AS

SET NOCOUNT ON

DECLARE @SD_ID_Container int
DECLARE @SD_ID_Contained int

CREATE TABLE #Temp(SD_ID_Container int, SD_ID_Contained int, Name_Contained varchar(500), ShapeType_Contained int, Abstraction_Contained int)
SELECT @SD_ID_Contained = SD_ID_Contained FROM Container WHERE SDTable_ID_Container = @Table and SD_ID_Container = @ID
SELECT @SD_ID_Container = @ID
INSERT INTO #Temp(SD_ID_Container, SD_ID_Contained, Name_Contained, ShapeType_Contained, Abstraction_Contained)
SELECT SD_ID_Container, SD_ID_Contained, Shape_Name, ShapeType.ShapeType_ID, ShapeType.Abstraction_ID FROM Container 
	LEFT JOIN Shape ON Shape.Shape_ID = SD_ID_Container 
	LEFT JOIN ShapeType ON Shape.ShapeType_ID = ShapeType.ShapeType_ID WHERE SD_ID_Container = @SD_ID_Container

WHILE @@Rowcount > 0
	BEGIN
--		SELECT @SD_ID_Container = (SELECT SD_ID_Contained FROM #Temp WHERE SD_ID_Container = @SD_ID_Container)
		INSERT INTO #Temp(SD_ID_Container, SD_ID_Contained, Name_Contained, ShapeType_Contained, Abstraction_Contained)
		SELECT SD_ID_Container, SD_ID_Contained, Shape_Name, ShapeType.ShapeType_ID, ShapeType.Abstraction_ID FROM Container 
			LEFT JOIN Shape ON Shape.Shape_ID = SD_ID_Container 
			LEFT JOIN ShapeType ON Shape.ShapeType_ID = ShapeType.ShapeType_ID 
			WHERE SD_ID_Container IN (SELECT SD_ID_Contained FROM #Temp WHERE SD_ID_Container = @SD_ID_Container)
	END

SELECT * FROM #Temp 

DROP TABLE #Temp
