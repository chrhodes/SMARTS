DECLARE @intAbstraction_BusinessStep int
DECLARE @intAbstraction_BusinessProcess int
SET @intAbstraction_BusinessStep = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP')
SET @intAbstraction_BusinessProcess = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESSSTEP')

CREATE TABLE #tmpTable
(
	[BP Name] varchar(100),
	[BP ID] int,
	[PS ShapeTypeID] int,
	[PS ShapeTypeName] varchar(100),
	[PS Name] varchar(100),	
	[PS ID] int,
	[BP Cyclical Considerations] varchar(100),
	[BP Department] varchar(100),
	[BP Division] varchar(100),
	[BusinessProcess ID] varchar(100),
	[BP Location Performed] varchar(100),
	[BP RTO] varchar(100),
	[BP RTO Unit] varchar(100),
	[BP Notes] varchar(100),
	[PS Level] varchar(100),
	[PS Order] varchar(100)
)


DECLARE @Column_var varchar(100)
DECLARE @Column_int int

INSERT INTO #tmpTable
SELECT 	@Column_var as [BP Name],
	C.SD_ID_Container as [BP ID], 
	ST.ShapeType_ID as [PS ShapeTypeID],
	ST.ShapeType_Name as [PS ShapeTypeName],
	[Shape_Name] as [PS Name],
	[Shape_ID] as [PS ID],
	@Column_var as [BP Cyclical Considerations],
	@Column_var as [BP Department],
	@Column_var as [BP Division],
	@Column_var as [BusinessProcess ID],
	@Column_var as [BP Location Performed],
	@Column_var as [BP RTO],
	@Column_var as [BP RTO Unit],
	@Column_var as [BP Notes],
	@Column_var as [PS Level],
	@Column_var as [PS Order]

FROM Shape SC
	LEFT JOIN ShapeType ST ON ST.ShapeType_ID = SC.ShapeType_ID 
	RIGHT JOIN Container C ON C.SD_ID_Contained = SC.Shape_ID AND C.Abstraction_ID = @intAbstraction_BusinessProcess
WHERE ST.ShapeType_ID IN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name IN ('STEP', 'DECISION', 'START', 'END'))

UPDATE #tmpTable SET [BP Name] = (SELECT Shape_Name FROM Shape WHERE Shape_ID = #tmpTable.[BP ID])


--- GET BP ATTRIBUTES
DECLARE @intShapeType_ID int
SET @intShapeType_ID = (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'BUSINESSPROCESS')

DECLARE @STA_ID int
SET @STA_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
		WHERE ShapeType_ID = @intShapeType_ID
			AND Attribute_ID = (SELECT Attribute_ID FROM Attribute 
						WHERE Attribute_Name = 'Business Process : Cyclical Considerations'))
UPDATE #tmpTable SET [BP Cyclical Considerations] = 
	(SELECT AttributeValue_Value FROM AttributeValue AV
		WHERE #tmpTable.[BP ID] = AV.SD_ID AND AV.ShapeTypeAttribute_ID = @STA_ID)


SET @STA_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
		WHERE ShapeType_ID = @intShapeType_ID
			AND Attribute_ID = (SELECT Attribute_ID FROM Attribute 
						WHERE Attribute_Name = 'Business Process : Department'))
UPDATE #tmpTable SET [BP Department] = 
	(SELECT AttributeValue_Value FROM AttributeValue AV
		WHERE #tmpTable.[BP ID] = AV.SD_ID AND AV.ShapeTypeAttribute_ID = @STA_ID)



SET @STA_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
		WHERE ShapeType_ID = @intShapeType_ID
			AND Attribute_ID = (SELECT Attribute_ID FROM Attribute 
						WHERE Attribute_Name = 'Business Process : Division'))
UPDATE #tmpTable SET [BP Division] = 
	(SELECT AttributeValue_Value FROM AttributeValue AV
		WHERE #tmpTable.[BP ID] = AV.SD_ID AND AV.ShapeTypeAttribute_ID = @STA_ID)


SET @STA_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
		WHERE ShapeType_ID = @intShapeType_ID
			AND Attribute_ID = (SELECT Attribute_ID FROM Attribute 
						WHERE Attribute_Name = 'Business Process : ID'))
UPDATE #tmpTable SET [BusinessProcess ID] = 
	(SELECT AttributeValue_Value FROM AttributeValue AV
		WHERE #tmpTable.[BP ID] = AV.SD_ID AND AV.ShapeTypeAttribute_ID = @STA_ID)

SET @STA_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
		WHERE ShapeType_ID = @intShapeType_ID
			AND Attribute_ID = (SELECT Attribute_ID FROM Attribute 
						WHERE Attribute_Name = 'Business Process : Location Performed'))
UPDATE #tmpTable SET [BP Location Performed] = 
	(SELECT AttributeValue_Value FROM AttributeValue AV
		WHERE #tmpTable.[BP ID] = AV.SD_ID AND AV.ShapeTypeAttribute_ID = @STA_ID)

SET @STA_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
		WHERE ShapeType_ID = @intShapeType_ID
			AND Attribute_ID = (SELECT Attribute_ID FROM Attribute 
						WHERE Attribute_Name = 'Business Process : RTO'))
UPDATE #tmpTable SET [BP RTO] = 
	(SELECT AttributeValue_Value FROM AttributeValue AV
		WHERE #tmpTable.[BP ID] = AV.SD_ID AND AV.ShapeTypeAttribute_ID = @STA_ID)

SET @STA_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
		WHERE ShapeType_ID = @intShapeType_ID
			AND Attribute_ID = (SELECT Attribute_ID FROM Attribute 
						WHERE Attribute_Name = 'Business Process : RTO Unit'))
UPDATE #tmpTable SET [BP RTO Unit] = 
	(SELECT AttributeValue_Value FROM AttributeValue AV
		WHERE #tmpTable.[BP ID] = AV.SD_ID AND AV.ShapeTypeAttribute_ID = @STA_ID)

SET @STA_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
		WHERE ShapeType_ID = @intShapeType_ID
			AND Attribute_ID = (SELECT Attribute_ID FROM Attribute 
						WHERE Attribute_Name = 'Business Process : Notes'))
UPDATE #tmpTable SET [BP Notes] = 
	(SELECT AttributeValue_Value FROM AttributeValue AV
		WHERE #tmpTable.[BP ID] = AV.SD_ID AND AV.ShapeTypeAttribute_ID = @STA_ID)

--- BUSINESS STEP ATTRIBUTES
DECLARE @A_ID int
SET @A_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Business Process : Step Level')
UPDATE #tmpTable SET [PS Level] = 
	(SELECT AttributeValue_Value FROM AttributeValue AV
		WHERE AV.SD_ID = #tmpTable.[PS ID] AND AV.ShapeTypeAttribute_ID = 
			(SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute
				WHERE  ShapeType_ID = #tmpTable.[PS ShapeTypeID]
				AND Attribute_ID = @A_ID))

SET @A_ID = (SELECT Attribute_ID FROM Attribute WHERE Attribute_Name = 'Business Process : Step Order')
UPDATE #tmpTable SET [PS Order] = 
	(SELECT AttributeValue_Value FROM AttributeValue AV
		WHERE AV.SD_ID = #tmpTable.[PS ID] AND AV.ShapeTypeAttribute_ID = 
			(SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute
				WHERE  ShapeType_ID = #tmpTable.[PS ShapeTypeID]
				AND Attribute_ID = @A_ID))

SELECT * FROM #tmpTable ORDER BY [BP Name], [PS ShapeTypeName], [PS Order]

--- CLEAN IT UP
DROP TABLE #tmpTable
