
CREATE VIEW dbo.vwInfrastructureLevel
AS

select 

	sd_id_container as shapecontainer_id,
	(SELECT shape_name from shape where shape_id = sd_id_container) as shapecontainer_name,
	(SELECT shape_desc from shape where shape_id = sd_id_container) as shapecontainer_desc,
	(SELECT shapetype_name from shapetype left join shape on shape.shapetype_id = shapetype.shapetype_id where shape_id = sd_id_container) as shapecontainer_type,

	shape_id as shapecontained_id, shape_name as shapecontained_name, shape_desc as shapecontained_desc,
	(SELECT shapetype_name from shapetype left join shape on shape.shapetype_id = shapetype.shapetype_id where shape_id = sd_id_contained) as shapecontained_type,

	relation_id, relation_name, relation_desc,

	(SELECT sd_id_container from container where sd_id_contained = sd_id_begin and abstraction_id = 4) as relationcontainer_begin_id,
	(SELECT shape_name from shape where shape_id = (SELECT sd_id_container from container where sd_id_contained = sd_id_begin and abstraction_id = 4)) as relationcontainer_begin_name,

	(SELECT shape_name from shape where shape_id = sd_id_begin and sdtable_id_begin = 4) as relationshape_begin_name,
	(SELECT shape_desc from shape where shape_id = sd_id_begin and sdtable_id_begin = 4) as relationshape_begin_desc,
	(SELECT shapetype_name from shapetype left join shape on shape.shapetype_id = shapetype.shapetype_id where shape_id = sd_id_begin) as relationshape_begin_type,

	(SELECT sd_id_container from container where sd_id_contained = sd_id_end and abstraction_id = 3 ) as relationcontainer_end_id,
	(SELECT shape_name from shape where shape_id = (SELECT sd_id_container from container where sd_id_contained = sd_id_end and abstraction_id = 3)) as relationcontainer_end_name,

	relation.sd_id_end as relationshape_end_id,
	(SELECT shape_name from shape where shape_id = sd_id_end and sdtable_id_end = 4) as relationshape_end_name,
	(SELECT shape_desc from shape where shape_id = sd_id_end and sdtable_id_end = 4) as relationshape_end_desc,
	(SELECT shapetype_name from shapetype left join shape on shape.shapetype_id = shapetype.shapetype_id where shape_id = sd_id_end) as relationshape_end_type

	from shape
	left join shapetype on shape.shapetype_id = shapetype.shapetype_id
	left join abstraction on abstraction.abstraction_id = shapetype.abstraction_id
	LEFT OUTER JOIN  dbo.Container
		ON dbo.Shape.Shape_ID = dbo.Container.SD_ID_Contained AND dbo.Container.SDTable_ID_Contained = 4 AND dbo.Container.Abstraction_id = 3
	LEFT OUTER JOIN  dbo.Relation 
		ON (dbo.Container.SD_ID_Contained = dbo.Relation.SD_ID_Begin OR dbo.Container.SD_ID_Contained = dbo.Relation.SD_ID_End) AND dbo.Relation.SDTable_ID_Begin = 4 AND dbo.Relation.SDTable_ID_End = 4 
where abstraction.abstraction_id =3


