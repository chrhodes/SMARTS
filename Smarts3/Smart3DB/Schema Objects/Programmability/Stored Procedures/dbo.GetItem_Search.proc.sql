
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
