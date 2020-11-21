
CREATE PROCEDURE  [dbo].[GetReport_LevelRelationSystem]  AS



SELECT 
	shapecontainer_name as [System Name],
	shapecontainer_desc as [System Description],
	shapecontained_name as [Object Name],
	shapecontained_desc as [Object Description],
	shapecontained_type as [Object Type],
	relation_name as [Relation Name],
	relation_desc as [Relation Description],
	relationcontainer_begin_name as [Relation Begin System Name],
	relationshape_begin_name as [Relation Begin Object Name],
	relationshape_begin_desc as [Relation Begin Object Desc],
	relationshape_begin_type as [Relation Begin Object Type],
	relationcontainer_end_name as [Relation End System Name],
	relationshape_end_name as [Relation End Object Name],
	relationshape_end_desc as [Relation End Object Desc],
	relationshape_end_type as [Relation End Object Type]

FROM vwSystemLevel

ORDER BY [System Name], [Object Name]
