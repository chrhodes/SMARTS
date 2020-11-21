
DECLARE @intAbstraction_Object int
DECLARE @intAbstraction_SystemObject int
SET @intAbstraction_Object = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT')
SET @intAbstraction_SystemObject = (SELECT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEMOBJECT')

CREATE TABLE #tmpTable
(
	[System Name] varchar(100),
	[System ID] int,
	[Object ShapeTypeID] int,
	[Object ShapeTypeName] varchar(100),
	[Object Name] varchar(100),	
	[Object ID] int,
	[System - Business Owner] varchar(100),
	[System - IT Responsible Area] varchar(100),
	[System - IT Technical Lead] varchar(100),
	[System - Business Criticality] varchar(100),
	[System - Financial Impact] varchar(100),
	[Business Owner] varchar(100),
	[IT Responsible Area] varchar(100),
	[IT Technical Lead] varchar(100),
	[Platform] varchar(100),
	[Software Language] varchar(100),
	[Security Authorizers] varchar(100),
	[Security Externally Facing] varchar(100),
	[Security Internal Security DB] varchar(100),
	[Security Point of Entry] varchar(100),
	[Security Reviewers] varchar(100),
	[Data Classification] varchar(100)
)


DECLARE @Column_var varchar(100)
DECLARE @Column_int int

INSERT INTO #tmpTable
SELECT 	@Column_var as [System_Name],
	C.SD_ID_Container as [System_ID], 
	ST.ShapeType_ID as [Object_ShapeTypeID],
	ST.ShapeType_Name as [Object_ShapeTypeName],
	[Shape_Name] as [Object_Name],
	[Shape_ID] as [Object_ID],
	@Column_var as [System - Business Owner],
	@Column_var as [System - IT Responsible Area],
	@Column_var as [System - IT Technical Lead],
	@Column_var as [System - Business Criticality],
	@Column_var as [System - Financial Statement Impact],
	@Column_var as [Business Owner],
	@Column_var as [IT Responsible Area],
	@Column_var as [IT Technical Lead],
	@Column_var as [Platform],
	@Column_var as [Software Language],
	@Column_var as [Security Authorizers],
	@Column_var as [Security Externally Facing],
	@Column_var as [Security Internal Security DB],
	@Column_var as [Security Point of Entry],
	@Column_var as [Security Reviewers],
	@Column_var as [Data Classification]

FROM Shape SC
	LEFT JOIN ShapeType ST ON ST.ShapeType_ID = SC.ShapeType_ID 
	LEFT JOIN Container C ON C.SD_ID_Contained = SC.Shape_ID AND C.Abstraction_ID = @intAbstraction_SystemObject
WHERE ST.ShapeType_ID IN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name IN ('APPLICATION', 'DATA', 'FILEREPORT'))

UPDATE #tmpTable SET [System Name] = (SELECT Shape_Name FROM Shape WHERE Shape_ID = #tmpTable.[System ID])


--- GET SYSTEMS ATTRIBUTES
DECLARE @intShapeType_ID int
SET @intShapeType_ID = (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'SYSTEM')

DECLARE @STA_ID int
SET @STA_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
		WHERE ShapeType_ID = @intShapeType_ID
			AND Attribute_ID = (SELECT Attribute_ID FROM Attribute 
						WHERE Attribute_Name = 'Business : Area Owner'))
UPDATE #tmpTable SET [System - Business Owner] = 
	(SELECT AttributeValue_Value FROM AttributeValue AV
		WHERE #tmpTable.[System ID] = AV.SD_ID AND AV.ShapeTypeAttribute_ID = @STA_ID)


SET @STA_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
		WHERE ShapeType_ID = @intShapeType_ID
			AND Attribute_ID = (SELECT Attribute_ID FROM Attribute 
						WHERE Attribute_Name = 'IT : Responsible Area'))
UPDATE #tmpTable SET [System - IT Responsible Area] = 
	(SELECT AttributeValue_Value FROM AttributeValue AV
		WHERE #tmpTable.[System ID] = AV.SD_ID AND AV.ShapeTypeAttribute_ID = @STA_ID)


SET @STA_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
		WHERE ShapeType_ID = @intShapeType_ID
			AND Attribute_ID = (SELECT Attribute_ID FROM Attribute 
						WHERE Attribute_Name = 'IT : Technical Lead'))
UPDATE #tmpTable SET [System - IT Technical Lead] = 
	(SELECT AttributeValue_Value FROM AttributeValue AV
		WHERE #tmpTable.[System ID] = AV.SD_ID AND AV.ShapeTypeAttribute_ID = @STA_ID)


SET @STA_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
		WHERE ShapeType_ID = @intShapeType_ID
			AND Attribute_ID = (SELECT Attribute_ID FROM Attribute 
						WHERE Attribute_Name = 'Audit Info : Business Criticality'))
UPDATE #tmpTable SET [System - Business Criticality] = 
	(SELECT AttributeValue_Value FROM AttributeValue AV
		WHERE #tmpTable.[System ID] = AV.SD_ID AND AV.ShapeTypeAttribute_ID = @STA_ID)


SET @STA_ID = (SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute 
		WHERE ShapeType_ID = @intShapeType_ID
			AND Attribute_ID = (SELECT Attribute_ID FROM Attribute 
						WHERE Attribute_Name = 'Audit Info : Financial Statement Impact'))
UPDATE #tmpTable SET [System - Financial Impact] = 
	(SELECT AttributeValue_Value FROM AttributeValue AV
		WHERE #tmpTable.[System ID] = AV.SD_ID AND AV.ShapeTypeAttribute_ID = @STA_ID)


--- OBJECT ATTRIBUTES
UPDATE #tmpTable SET [Business Owner] = 
	(SELECT AttributeValue_Value FROM AttributeValue AV
		WHERE AV.SD_ID = #tmpTable.[Object ID] AND AV.ShapeTypeAttribute_ID = 
			(SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute
				WHERE  ShapeType_ID = #tmpTable.[Object ShapeTypeID]
				AND Attribute_ID = (SELECT Attribute_ID FROM Attribute 
							WHERE Attribute_Name = 'Business : Area Owner')))

UPDATE #tmpTable SET [IT Responsible Area] = 
	(SELECT AttributeValue_Value FROM AttributeValue AV
		WHERE AV.SD_ID = #tmpTable.[Object ID] AND AV.ShapeTypeAttribute_ID = 
			(SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute
				WHERE  ShapeType_ID = #tmpTable.[Object ShapeTypeID]
				AND Attribute_ID = (SELECT Attribute_ID FROM Attribute 
							WHERE Attribute_Name = 'IT : Responsible Area')))

UPDATE #tmpTable SET [IT Technical Lead] = 
	(SELECT AttributeValue_Value FROM AttributeValue AV
		WHERE AV.SD_ID = #tmpTable.[Object ID] AND AV.ShapeTypeAttribute_ID = 
			(SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute
				WHERE  ShapeType_ID = #tmpTable.[Object ShapeTypeID]
				AND Attribute_ID = (SELECT Attribute_ID FROM Attribute 
							WHERE Attribute_Name = 'IT : Technical Lead')))

UPDATE #tmpTable SET [Platform] = 
	(SELECT AttributeValue_Value FROM AttributeValue AV
		WHERE AV.SD_ID = #tmpTable.[Object ID] AND AV.ShapeTypeAttribute_ID = 
			(SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute
				WHERE  ShapeType_ID = #tmpTable.[Object ShapeTypeID]
				AND Attribute_ID = (SELECT Attribute_ID FROM Attribute 
							WHERE Attribute_Name = 'Platform')))

UPDATE #tmpTable SET [Software Language] = 
	(SELECT AttributeValue_Value FROM AttributeValue AV
		WHERE AV.SD_ID = #tmpTable.[Object ID] AND AV.ShapeTypeAttribute_ID = 
			(SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute
				WHERE  ShapeType_ID = #tmpTable.[Object ShapeTypeID]
				AND Attribute_ID = (SELECT Attribute_ID FROM Attribute 
							WHERE Attribute_Name = 'Software : Language(s)')))

UPDATE #tmpTable SET [Security Authorizers] = 
	(SELECT AttributeValue_Value FROM AttributeValue AV
		WHERE AV.SD_ID = #tmpTable.[Object ID] AND AV.ShapeTypeAttribute_ID = 
			(SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute
				WHERE  ShapeType_ID = #tmpTable.[Object ShapeTypeID]
				AND Attribute_ID = (SELECT Attribute_ID FROM Attribute 
							WHERE Attribute_Name = 'Security : Authorizers')))

UPDATE #tmpTable SET [Security Externally Facing] = 
	(SELECT AttributeValue_Value FROM AttributeValue AV
		WHERE AV.SD_ID = #tmpTable.[Object ID] AND AV.ShapeTypeAttribute_ID = 
			(SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute
				WHERE  ShapeType_ID = #tmpTable.[Object ShapeTypeID]
				AND Attribute_ID = (SELECT Attribute_ID FROM Attribute 
							WHERE Attribute_Name = 'Security : Externally Facing')))

UPDATE #tmpTable SET [Security Internal Security DB] = 
	(SELECT AttributeValue_Value FROM AttributeValue AV
		WHERE AV.SD_ID = #tmpTable.[Object ID] AND AV.ShapeTypeAttribute_ID = 
			(SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute
				WHERE  ShapeType_ID = #tmpTable.[Object ShapeTypeID]
				AND Attribute_ID = (SELECT Attribute_ID FROM Attribute 
							WHERE Attribute_Name = 'Security : Internal Security DB')))

UPDATE #tmpTable SET [Security Point of Entry] = 
	(SELECT AttributeValue_Value FROM AttributeValue AV
		WHERE AV.SD_ID = #tmpTable.[Object ID] AND AV.ShapeTypeAttribute_ID = 
			(SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute
				WHERE  ShapeType_ID = #tmpTable.[Object ShapeTypeID]
				AND Attribute_ID = (SELECT Attribute_ID FROM Attribute 
							WHERE Attribute_Name = 'Security : Point of Entry')))

UPDATE #tmpTable SET [Security Reviewers] = 
	(SELECT AttributeValue_Value FROM AttributeValue AV
		WHERE AV.SD_ID = #tmpTable.[Object ID] AND AV.ShapeTypeAttribute_ID = 
			(SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute
				WHERE  ShapeType_ID = #tmpTable.[Object ShapeTypeID]
				AND Attribute_ID = (SELECT Attribute_ID FROM Attribute 
							WHERE Attribute_Name = 'Security : Reviewers')))

UPDATE #tmpTable SET [Data Classification] = 
	(SELECT AttributeValue_Value FROM AttributeValue AV
		WHERE AV.SD_ID = #tmpTable.[Object ID] AND AV.ShapeTypeAttribute_ID = 
			(SELECT ShapeTypeAttribute_ID FROM ShapeTypeAttribute
				WHERE  ShapeType_ID = #tmpTable.[Object ShapeTypeID]
				AND Attribute_ID = (SELECT Attribute_ID FROM Attribute 
							WHERE Attribute_Name = 'Data : Classification')))

SELECT * FROM #tmpTable ORDER BY [System Name], [Object ShapeTypeName], [Object Name]

--- CLEAN IT UP
DROP TABLE #tmpTable

