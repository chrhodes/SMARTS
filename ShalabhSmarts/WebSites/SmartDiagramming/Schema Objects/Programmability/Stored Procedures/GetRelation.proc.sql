
CREATE PROCEDURE [dbo].[GetRelation] (@ID as int) 


AS

DECLARE @Column_var varchar(100)
DECLARE @Column_var2 varchar(1000)
DECLARE @Column_int int
DECLARE @T varchar(100)
DECLARE @T_ID varchar(103)
DECLARE @T_Column varchar(1000)
DECLARE @Proc varchar(1000)

SELECT 
	Relation_ID, Relation_Name,	Relation_Desc,
	@Column_int as "Relation_TypeID",
	Abstraction_ID,
	SDTable_ID_Begin as "Item_Table",
	SD_ID_Begin as "Item_ID",
	@Column_int as "Item_TypeID",
	@Column_int as "Item_AbstractionID",
	@Column_var as "Item_Name",
	@Column_var2 as "Item_Desc",
	@Column_var as "Item_TypeName",
	@Column_int as "Item_ContainerID",
	@Column_int as "Item_ContainerTypeID",
	@Column_int as "Item_ContainerAbstractionID",
	@Column_var as "Item_ContainerName",
	@Column_var as "Item_ContainerAbstraction",
	@Column_var2 as "Direction",
	SDTable_ID_End as "Related_Table",
	SD_ID_End as "Related_ID",
	@Column_var as "Related_Name",
	@Column_var2 as "Related_Desc",
	@Column_int as "Related_TypeID",
	@Column_int as "Related_AbstractionID",
	@Column_var as "Related_TypeName",
	@Column_int as "Related_ContainerID",
	@Column_int as "Related_ContainerTypeID",
	@Column_int as "Related_ContainerAbstractionID",
	@Column_var as "Related_ContainerName",
	@Column_var as "Related_ContainerAbstraction",
	SDTable_ID_Begin, SD_ID_Begin,
	@Column_var as "Begin_Name",
	@Column_var2 as "Begin_Desc",
	@Column_int as "Begin_TypeID",
	@Column_var as "Begin_TypeName",
	SDTable_ID_End, SD_ID_End,
	@Column_var as "End_Name",
	@Column_var2 as "End_Desc",
	@Column_int as "End_TypeID",
	@Column_var as "End_TypeName"
INTO #TempTable 
FROM Relation NOLOCK
WHERE Relation_ID = @ID


UPDATE  #TempTable SET Begin_Name = (SELECT DISTINCT Shape_Name  FROM Shape WHERE Shape_ID  = SD_ID_Begin)
UPDATE  #TempTable SET Begin_Desc = (SELECT DISTINCT Shape_Desc  FROM Shape WHERE Shape_ID  = SD_ID_Begin)
UPDATE  #TempTable SET Begin_TypeID = (SELECT DISTINCT ShapeType_ID  FROM Shape WHERE Shape_ID  = SD_ID_Begin)
UPDATE  #TempTable SET Begin_TypeName = (SELECT DISTINCT ShapeType_Name  FROM ShapeType WHERE ShapeType_ID  = Begin_TypeID)
UPDATE  #TempTable SET End_Name = (SELECT DISTINCT Shape_Name  FROM Shape WHERE Shape_ID  = SD_ID_Begin)
UPDATE  #TempTable SET End_Desc = (SELECT DISTINCT Shape_Desc  FROM Shape WHERE Shape_ID  = SD_ID_Begin)
UPDATE  #TempTable SET End_TypeID = (SELECT DISTINCT ShapeType_ID  FROM Shape WHERE Shape_ID  = SD_ID_End)
UPDATE  #TempTable SET End_TypeName = (SELECT DISTINCT ShapeType_Name  FROM ShapeType WHERE ShapeType_ID  =  End_TypeID)

UPDATE #TempTable SET Relation_TypeID=
	CASE 
		WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEPOBJECT') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'CROSSRELATION')
		WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICEOBJECT') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'CROSSRELATION')
		WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'STEPRELATION')
		WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'DEVICE') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'DEVICERELATION')
		WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'OBJECTRELATION')
		WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEMOBJECT') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'CROSSRELATION')
		WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESSSTEP') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'CROSSRELATION')
		WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESS') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'BUSINESSRELATION')
		WHEN Abstraction_ID = (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEM') THEN (SELECT ShapeType_ID FROM ShapeType WHERE ShapeType_Name = 'SYSTEMRELATION')

	END

UPDATE #TempTable SET Item_Name=
	CASE 
		WHEN Item_Table = SDTable_ID_Begin AND Item_ID = SD_ID_Begin THEN Begin_Name
		WHEN Item_Table = SDTable_ID_End AND Item_ID = SD_ID_End THEN End_Name
	END
UPDATE #TempTable SET Item_Desc=
	CASE 
		WHEN Item_Table = SDTable_ID_Begin AND Item_ID = SD_ID_Begin THEN Begin_Desc
		WHEN Item_Table = SDTable_ID_End AND Item_ID = SD_ID_End THEN End_Desc
	END
UPDATE #TempTable SET Direction =
	CASE 
		WHEN Item_Table = SDTable_ID_Begin AND Item_ID = SD_ID_Begin THEN 'To'
		WHEN Item_Table = SDTable_ID_End AND Item_ID = SD_ID_End THEN 'From'
	END
UPDATE #TempTable SET Related_Table =
	CASE 
		WHEN Item_Table = SDTable_ID_Begin AND Item_ID = SD_ID_Begin THEN SDTable_ID_End
		WHEN Item_Table = SDTable_ID_End AND Item_ID = SD_ID_End THEN SDTable_ID_Begin
	END
UPDATE #TempTable SET Related_ID =
	CASE 
		WHEN Item_Table = SDTable_ID_Begin AND Item_ID = SD_ID_Begin THEN SD_ID_End
		WHEN Item_Table = SDTable_ID_End AND Item_ID = SD_ID_End THEN SD_ID_Begin
	END
UPDATE #TempTable SET Related_Name=
	CASE 
		WHEN Item_Table = SDTable_ID_Begin AND Item_ID = SD_ID_Begin THEN End_Name
		WHEN Item_Table = SDTable_ID_End AND Item_ID = SD_ID_End THEN Begin_Name
	END
UPDATE #TempTable SET Related_Desc=
	CASE 
		WHEN Item_Table = SDTable_ID_Begin AND Item_ID = SD_ID_Begin THEN End_Desc
		WHEN Item_Table = SDTable_ID_End AND Item_ID = SD_ID_End THEN Begin_Desc
	END
UPDATE #TempTable SET Item_TypeID=
	CASE 
		WHEN Item_Table = SDTable_ID_Begin AND Item_ID = SD_ID_Begin THEN Begin_TypeID
		WHEN Item_Table = SDTable_ID_End AND Item_ID = SD_ID_End THEN End_TypeID
	END
UPDATE #TempTable SET Item_AbstractionID=(SELECT DISTINCT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = Item_TypeID)
UPDATE #TempTable SET Item_TypeName=
	CASE 
		WHEN Item_Table = SDTable_ID_Begin AND Item_ID = SD_ID_Begin THEN Begin_TypeName
		WHEN Item_Table = SDTable_ID_End AND Item_ID = SD_ID_End THEN End_TypeName
	END
UPDATE #TempTable SET Related_TypeID=
	CASE 
		WHEN Item_Table = SDTable_ID_Begin AND Item_ID = SD_ID_Begin THEN End_TypeID
		WHEN Item_Table = SDTable_ID_End AND Item_ID = SD_ID_End THEN Begin_TypeID
	END
UPDATE #TempTable SET Related_AbstractionID=(SELECT DISTINCT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = Related_TypeID)

UPDATE #TempTable SET Related_TypeName=
	CASE 
		WHEN Item_Table = SDTable_ID_Begin AND Item_ID = SD_ID_Begin THEN End_TypeName
		WHEN Item_Table = SDTable_ID_End AND Item_ID = SD_ID_End THEN Begin_TypeName
	END

UPDATE #TempTable SET Item_ContainerAbstraction=
	CASE 
		WHEN Abstraction_ID= (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEM') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='SYSTEM')
		WHEN Abstraction_ID= (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESS') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='BUSINESS')
		WHEN Abstraction_ID= (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='SYSTEMOBJECT')
		WHEN Abstraction_ID= (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='BUSINESSSTEP')
		WHEN Abstraction_ID= (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'PIECE') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='OBJECTPIECE')
	END

/*
UPDATE #TempTable SET Item_ContainerID=(SELECT DISTINCT SD_ID_Container FROM Container WHERE SD_ID_Contained = Item_ID AND SDTable_ID_Contained = Item_Table AND Abstraction_ID = Item_ContainerAbstraction)
UPDATE #TempTable SET Item_ContainerTypeID=(SELECT DISTINCT ShapeType_ID FROM Shape WHERE Shape_ID = Item_ContainerID)
UPDATE #TempTable SET Item_ContainerAbstractionID=(SELECT DISTINCT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = Item_ContainerTypeID)
UPDATE #TempTable SET Item_ContainerName=(SELECT DISTINCT Shape_Name FROM Shape WHERE Shape_ID = Item_ContainerID)

UPDATE #TempTable SET Related_ContainerAbstraction=
	CASE 
		WHEN Abstraction_ID= (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'SYSTEM') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='SYSTEM')
		WHEN Abstraction_ID= (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'BUSINESS') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='BUSINESS')
		WHEN Abstraction_ID= (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='SYSTEMOBJECT')
		WHEN Abstraction_ID= (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='BUSINESSSTEP')
		WHEN Abstraction_ID= (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'PIECE') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='OBJECTPIECE')
	END

UPDATE #TempTable SET Related_ContainerID=(SELECT DISTINCT SD_ID_Container FROM Container WHERE SD_ID_Contained = Related_ID AND SDTable_ID_Contained = Related_Table AND Abstraction_ID = Related_ContainerAbstraction)
UPDATE #TempTable SET Related_ContainerTypeID=(SELECT DISTINCT ShapeType_ID FROM Shape WHERE Shape_ID = Related_ContainerID)
UPDATE #TempTable SET Related_ContainerAbstractionID=(SELECT DISTINCT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = Related_ContainerTypeID)
UPDATE #TempTable SET Related_ContainerName=(SELECT DISTINCT Shape_Name FROM Shape WHERE Shape_ID = Related_ContainerID)
*/
SELECT * FROM #TempTable ORDER BY Relation_Name

DROP TABLE #TempTable
