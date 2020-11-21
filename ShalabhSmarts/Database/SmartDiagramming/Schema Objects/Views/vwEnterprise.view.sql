
CREATE VIEW dbo.vwEnterprise
AS 

select 

	(SELECT sd_id_container from container where sd_id_contained = SToBP.SD_ID_Container and abstraction_id = 12 ) as BusinessProcessID,
	(SELECT shape_name from shape where shape_id = (SELECT sd_id_container from container where sd_id_contained = SToBP.SD_ID_Container and abstraction_id = 12)) as BusinessProcessName,

	SToBP.SD_ID_Container as StepID, (Select Shape_Name from Shape WHERE Shape_ID = SToBP.SD_ID_Container) AS StepName,
	(Select Shape_Desc from Shape WHERE Shape_ID = SToBP.SD_ID_Container) AS StepDesc,
	(SELECT shapetype_name from shapetype left join shape on shape.shapetype_id = shapetype.shapetype_id where shape_id = SToBP.SD_ID_Container) as StepType,

	(SELECT sd_id_container from container where sd_id_contained = IToS.SD_ID_Contained and abstraction_id = 4 ) as SystemID,
	(SELECT shape_name from shape where shape_id = (SELECT sd_id_container from container where sd_id_contained = IToS.SD_ID_Contained and abstraction_id = 4)) as SystemName,

	IToS.SD_ID_Contained as ObjectID, (Select Shape_Name from Shape WHERE Shape_ID = IToS.SD_ID_Contained) AS ObjectName,
	(Select Shape_Desc from Shape WHERE Shape_ID = IToS.SD_ID_Contained) AS ObjectDesc,
	(SELECT shapetype_name from shapetype left join shape on shape.shapetype_id = shapetype.shapetype_id where shape_id = IToS.SD_ID_Contained) as ObjectType,

	 shape.shape_id as InfrastructureID, shape.shape_name as InfrastructureName, shape.shape_desc as InfrastructureDesc, 
	(SELECT shapetype_name from shapetype where shapetype_id = shape.shapetype_id) as InfrastructureType

	from shape
	left join shapetype on shape.shapetype_id = shapetype.shapetype_id
	left join abstraction on abstraction.abstraction_id = shapetype.abstraction_id
	LEFT OUTER JOIN  Container as IToS
		ON dbo.Shape.Shape_ID = IToS.SD_ID_Container AND IToS.SDTable_ID_Contained = 4 AND IToS.Abstraction_id = 6
	LEFT OUTER JOIN  Container as SToBP
		ON IToS.SD_ID_Contained = SToBP.SD_ID_Contained AND SToBP.SDTable_ID_Contained = 4 AND SToBP.Abstraction_id = 14

where abstraction.abstraction_id = 3 

UNION

select 

	(SELECT sd_id_container from container where sd_id_contained = SToBP.SD_ID_Container and abstraction_id = 12 ) as BusinessProcessID,
	(SELECT shape_name from shape where shape_id = (SELECT sd_id_container from container where sd_id_contained = SToBP.SD_ID_Container and abstraction_id = 12)) as BusinessProcessName,

	SToBP.SD_ID_Container as StepID, (Select Shape_Name from Shape WHERE Shape_ID = SToBP.SD_ID_Container) AS StepName,
	(Select Shape_Desc from Shape WHERE Shape_ID = SToBP.SD_ID_Container) AS StepDesc,
	(SELECT shapetype_name from shapetype left join shape on shape.shapetype_id = shapetype.shapetype_id where shape_id = SToBP.SD_ID_Container) as StepType,

	(SELECT sd_id_container from container where sd_id_contained = SToO.SD_ID_Contained and abstraction_id = 4 ) as SystemID,
	(SELECT shape_name from shape where shape_id = (SELECT sd_id_container from container where sd_id_contained = SToO.SD_ID_Contained and abstraction_id = 4)) as SystemName,

	 shape.shape_id as ObjectID, shape.shape_name as ObjectName, shape.shape_desc as ObjectDesc, 
	(SELECT shapetype_name from shapetype where shapetype_id = shape.shapetype_id) as ObjectType,

	IToS.SD_ID_Container as InfrastructureID, (Select Shape_Name from Shape WHERE Shape_ID = IToS.SD_ID_Container) AS InfrastructureName,
	(Select Shape_Desc from Shape WHERE Shape_ID = IToS.SD_ID_Container) AS InfrastructureDesc,
	(SELECT shapetype_name from shapetype left join shape on shape.shapetype_id = shapetype.shapetype_id where shape_id = IToS.SD_ID_Container) as InfrastructureType
	
	from shape
	left join shapetype on shape.shapetype_id = shapetype.shapetype_id
	left join abstraction on abstraction.abstraction_id = shapetype.abstraction_id
	LEFT OUTER JOIN  Container as SToO
		ON dbo.Shape.Shape_ID = SToO.SD_ID_Contained AND SToO.SDTable_ID_Contained = 4 AND SToO.Abstraction_id = 4
	LEFT OUTER JOIN  Container as IToS
		ON dbo.Shape.Shape_ID = IToS.SD_ID_Contained AND IToS.SDTable_ID_Contained = 4 AND IToS.Abstraction_id = 6
	LEFT OUTER JOIN  Container as SToBP
		ON dbo.Shape.Shape_ID = SToBP.SD_ID_Contained AND SToBP.SDTable_ID_Contained = 4 AND SToBP.Abstraction_id = 14

where abstraction.abstraction_id = 2 

UNION

select 

	BPToS.Sd_ID_Container as BusinessProcessID,
	(SELECT shape_name from shape where shape_id = BPToS.Sd_ID_Container) as BusinessProcessName,

	shape.shape_id as StepID, shape.shape_name as StepName, shape.shape_desc as StepDesc, 
	(SELECT shapetype_name from shapetype where shapetype_id = shape.shapetype_id) as StepType,

	(SELECT sd_id_container from container where sd_id_contained = SToS.SD_ID_Contained and abstraction_id = 4 ) as SystemID,
	(Select shape_name from shape where shape_id =(SELECT sd_id_container from container where sd_id_contained = SToS.SD_ID_Contained and abstraction_id = 4 )) as SystemName,

	SToS.SD_ID_Contained as ObjectID, (Select Shape_Name from Shape WHERE Shape_ID = SToS.SD_ID_Contained) AS ObjectName,
	(Select Shape_Desc from Shape WHERE Shape_ID = SToS.SD_ID_Contained) AS ObjectDesc,
	(SELECT shapetype_name from shapetype left join shape on shape.shapetype_id = shapetype.shapetype_id where shape_id = SToS.SD_ID_Contained) as ObjectType,

	stoi.sd_id_container as InfrastructureID,
	(SELECT shape_name from shape where shape_id = stoi.sd_id_container) as InfrastructureName,
	(SELECT shape_desc  from shape where shape_id = stoi.sd_id_container) as InfrastructureDesc,
	(SELECT shapetype_name from shapetype left join shape on shape.shapetype_id = shapetype.shapetype_id where shape_id = SToI.SD_ID_Container) as InfrastructureType

	from shape
	left join shapetype on shape.shapetype_id = shapetype.shapetype_id
	left join abstraction on abstraction.abstraction_id = shapetype.abstraction_id
	LEFT OUTER JOIN Container as SToS
		ON shape.shape_ID = SToS.SD_ID_Container AND SToS.SDTable_ID_Container = 4 AND SToS.Abstraction_id = 14
	LEFT OUTER JOIN Container as BPToS
		ON shape.shape_id = BPToS.SD_ID_Contained AND BPToS.SDTable_ID_Contained = 4 AND BPToS.Abstraction_id = 12
	LEFT OUTER JOIN Container as SToI
		ON SToS.Sd_ID_Contained = SToI.SD_ID_Contained AND SToI.SDTable_ID_Contained = 4 AND SToI.Abstraction_id = 6

where abstraction.abstraction_id = 11

UNION

select 

	NULL as BusinessProcessID,
	NULL as BusinessProcessName,

	NULL as StepID, NULL AS StepName,
	NULL AS StepDesc,
	NULL as StepType,

	 shape.shape_id as SystemID, shape.shape_name as SystemName,

	NULL as ObjectID, NULL as ObjectName, NULL as ObjectDesc, 
	NULL as ObjectType,

	NULL as InfrastructureID, NULL AS InfrastructureName,
	NULL AS InfrastructureDesc, NULL as InfrastructureType
	

	from shape
	where shape_id not in (select sd_id_container from container where sd_id_container in (select SHAPE_ID from shape where shapetype_id = 9) and abstraction_id = 4 and sdtable_id_container = 4) and shapetype_id = 9

UNION

select 


	 shape.shape_id as BusinessProcessID, shape.shape_name as BusinessProcessName,

	NULL as StepID, NULL AS StepName,
	NULL AS StepDesc,
	NULL as StepType,

	NULL as SystemID, NULL as SystemName,

	NULL as ObjectID, NULL as ObjectName, NULL as ObjectDesc, 
	NULL as ObjectType,

	NULL as InfrastructureID, NULL AS InfrastructureName,
	NULL AS InfrastructureDesc, NULL as InfrastructureType

	from shape
	where shape_id not in (select sd_id_container from container where sd_id_container in (select SHAPE_ID from shape where shapetype_id = 25) and abstraction_id = 12 and sdtable_id_container = 4) and shapetype_id = 25


UNION

select 

	NULL as BusinessProcessID,  NULL as BusinessProcessName,

	NULL as StepID, NULL AS StepName,
	NULL AS StepDesc,
	NULL as StepType,

	NULL as SystemID, NULL as SystemName,

	NULL as ObjectID, NULL as ObjectName, NULL as ObjectDesc, 
	NULL as ObjectType,

	 shape.shape_id as InfrastructureID, shape.shape_name as InfrastructureName,shape.shape_desc as InfrastructureDesc, 
	(SELECT shapetype_name from shapetype where shapetype_id = shape.shapetype_id) as InfrastructureType

	from shape
	where shape_id not in (select sd_id_container from container where sd_id_container in (select SHAPE_ID from shape where shapetype_id IN (SELECT Shapetype_id from shapetype where abstraction_id = 3)) and abstraction_id = 6 and sdtable_id_container = 4) and shapetype_id in (SELECT Shapetype_id from shapetype where abstraction_id = 3)





