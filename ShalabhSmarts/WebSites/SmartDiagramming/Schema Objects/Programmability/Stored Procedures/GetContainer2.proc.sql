
CREATE PROCEDURE [dbo].[GetContainer2] (@ID as int) 
AS

DECLARE @Column_var varchar(1000)
DECLARE @Column_int int
DECLARE @Temp int
DECLARE @Proc varchar(1000)


SELECT Container_ID,
	SDTable_ID_Container, SD_ID_Container,
	SDTable_ID_Contained, SD_ID_Contained,
	Abstraction_ID,
	-- FOR VISIO Drawing simplification
	Container_ID as "Relation_ID",
	@Column_int as "Relation_TypeID",
	@Column_var as "Relation_Name",
	@Column_var as "Relation_Desc",
	@Column_int as "Related_ContainerID",
	@Column_int as "Related_ContainerTypeID",
	@Column_int as "Related_ContainerAbstractionID",
	@Column_var as "Related_ContainerName",
	@Column_var as "Related_ContainerAbstraction",
	SDTable_ID_Container as "Item_Table",
	SD_ID_Container as "Item_ID",
	@Column_int as "Item_TypeID",
	@Column_int as "Item_AbstractionID",
	@Column_var as "Item_Name",
	@Column_var as "Item_Desc",
	@Column_var as "Item_TypeName",
	@Column_int as "Item_ContainerID",
	@Column_int as "Item_ContainerTypeID",
	@Column_int as "Item_ContainerAbstractionID",
	@Column_var as "Item_ContainerName",
	@Column_var as "Item_ContainerAbstraction",
	SDTable_ID_Contained as "Related_Table",
	SD_ID_Contained as "Related_ID",
	@Column_int as "Related_TypeID",
	@Column_int as "Related_AbstractionID",
	@Column_var as "Related_Name",
	@Column_var as "Related_Desc",
	@Column_var as "Related_TypeName",
	SDTable_ID_Container as "SDTable_ID_BEGIN",
	SD_ID_Container as "SD_ID_BEGIN",
	SDTable_ID_Contained as "SDTable_ID_END",
	SD_ID_Contained as "SD_ID_END",
	@Column_int as "Begin_TypeID",
	@Column_var as "Begin_TypeName",
	@Column_int as "End_TypeID",
	@Column_var as "End_TypeName"
INTO #Temp1 
FROM Container NOLOCK
WHERE Container_ID = @ID

	UPDATE  #Temp1 SET Relation_TypeID = 
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
	
	UPDATE  #Temp1 SET Item_TypeID = (SELECT DISTINCT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Container)
	UPDATE  #Temp1 SET Item_AbstractionID = (SELECT DISTINCT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = Item_TypeID)
	UPDATE  #Temp1 SET Item_Name = (SELECT DISTINCT Shape_Name FROM Shape WHERE Shape_ID = SD_ID_Container)
	UPDATE  #Temp1 SET Item_Desc = (SELECT DISTINCT Shape_Desc FROM Shape WHERE Shape_ID = SD_ID_Container)

	UPDATE #Temp1 SET Item_ContainerAbstraction=
		CASE 
			WHEN Item_AbstractionID= (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='SYSTEMOBJECT')
			WHEN Item_AbstractionID= (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='BUSINESSSTEP')
			WHEN Item_AbstractionID= (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'PIECE') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='OBJECTPIECE')
		END
	
	UPDATE #Temp1 SET Item_ContainerID=(SELECT DISTINCT SD_ID_Container FROM Container WHERE SD_ID_Contained = Item_ID AND SDTable_ID_Contained = Item_Table AND Abstraction_ID = Item_ContainerAbstraction)
	UPDATE #Temp1 SET Item_ContainerTypeID=(SELECT DISTINCT ShapeType_ID FROM Shape WHERE Shape_ID = Item_ContainerID)
	UPDATE #Temp1 SET Item_ContainerAbstractionID=(SELECT DISTINCT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = Item_ContainerTypeID)
	UPDATE #Temp1 SET Item_ContainerName=(SELECT DISTINCT Shape_Name FROM Shape WHERE Shape_ID = Item_ContainerID)


	UPDATE  #Temp1 SET Related_TypeID = (SELECT DISTINCT ShapeType_ID FROM Shape WHERE Shape_ID = SD_ID_Contained)
	UPDATE  #Temp1 SET Related_AbstractionID = (SELECT DISTINCT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = Related_TypeID)
	UPDATE  #Temp1 SET Related_Name = (SELECT DISTINCT Shape_Name FROM Shape WHERE Shape_ID = SD_ID_Contained)
	UPDATE  #Temp1 SET Related_Desc = (SELECT DISTINCT Shape_Desc FROM Shape WHERE Shape_ID = SD_ID_Contained)
	
	UPDATE #Temp1 SET Related_ContainerAbstraction=
		CASE 
			WHEN Related_AbstractionID= (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'OBJECT') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='SYSTEMOBJECT')
			WHEN Related_AbstractionID= (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'STEP') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='BUSINESSSTEP')
			WHEN Related_AbstractionID= (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name = 'PIECE') THEN (SELECT DISTINCT Abstraction_ID FROM Abstraction WHERE Abstraction_Name='OBJECTPIECE')
		END
	
	UPDATE #Temp1 SET Related_ContainerID=(SELECT DISTINCT SD_ID_Container FROM Container WHERE SD_ID_Contained = Related_ID AND SDTable_ID_Contained = Related_Table AND Abstraction_ID = Related_ContainerAbstraction)
	UPDATE #Temp1 SET Related_ContainerTypeID=(SELECT DISTINCT ShapeType_ID FROM Shape WHERE Shape_ID = Related_ContainerID)
	UPDATE #Temp1 SET Related_ContainerAbstractionID=(SELECT DISTINCT Abstraction_ID FROM ShapeType WHERE ShapeType_ID = Related_ContainerTypeID)
	UPDATE #Temp1 SET Related_ContainerName=(SELECT DISTINCT Shape_Name FROM Shape WHERE Shape_ID = Related_ContainerID)
	
	UPDATE  #Temp1 SET Begin_TypeID = (SELECT DISTINCT ShapeType_ID  FROM Shape WHERE Shape_ID  = SD_ID_Begin)
	UPDATE  #Temp1 SET Begin_TypeName = (SELECT DISTINCT ShapeType_Name  FROM ShapeType WHERE ShapeType_ID  = Begin_TypeID)
	UPDATE  #Temp1 SET End_TypeID = (SELECT DISTINCT ShapeType_ID  FROM Shape WHERE Shape_ID  = SD_ID_End)
	UPDATE  #Temp1 SET End_TypeName = (SELECT DISTINCT ShapeType_Name  FROM ShapeType WHERE ShapeType_ID  =  End_TypeID)


SELECT * FROM #Temp1

DROP TABLE #Temp1
