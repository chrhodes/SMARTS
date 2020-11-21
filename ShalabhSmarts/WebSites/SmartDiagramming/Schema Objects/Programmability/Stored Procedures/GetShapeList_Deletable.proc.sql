
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
