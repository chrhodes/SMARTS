
CREATE PROCEDURE  [dbo].[GetReport_LevelRelationInfrastructure]  AS



SELECT 
	shapecontained_name as [Device Name],
	shapecontained_desc as [Device Description],
	shapecontained_type as [Device Type],
	shapecontainer_name as [Container Device Name],
	shapecontainer_desc as [Container Device Description],
	relation_name as [Relation Name],
	relation_desc as [Relation Description],
	relationshape_begin_name as [Relation Begin Device Name],
	relationshape_begin_desc as [Relation Begin Device Desc],
	relationshape_begin_type as [Relation Begin Device Type],
	relationshape_end_name as [Relation End Device Name],
	relationshape_end_desc as [Relation End Device Desc],
	relationshape_end_type as [Relation End Device Type]

FROM vwInfrastructureLevel

ORDER BY [Device Name], [Container Device Name]
