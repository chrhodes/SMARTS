
CREATE PROCEDURE  [dbo].[GetReport_LevelRelationBusinessProcess]  AS



SELECT 
	shapecontainer_name as [Business Process Name],
	shapecontainer_desc as [Business Process Description],
	shapecontained_name as [Process Step Name],
	shapecontained_desc as [Process Step Description],
	shapecontained_type as [Process Step Type],
	relation_name as [Relation Name],
	relation_desc as [Relation Description],
	relationcontainer_begin_name as [Relation Begin Business Process Name],
	relationshape_begin_name as [Relation Begin Process Step Name],
	relationshape_begin_desc as [Relation Begin Process Step Desc],
	relationshape_begin_type as [Relation Begin Process Step Type],
	relationcontainer_end_name as [Relation End Business Process Name],
	relationshape_end_name as [Relation End Process Step Name],
	relationshape_end_desc as [Relation End Process Step Desc],
	relationshape_end_type as [Relation End Process Step Type]

FROM vwBusinessProcessLevel

ORDER BY [Business Process Name]
