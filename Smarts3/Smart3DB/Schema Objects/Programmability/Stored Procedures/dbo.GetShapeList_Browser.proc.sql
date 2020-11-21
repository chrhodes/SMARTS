
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
