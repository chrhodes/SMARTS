
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
