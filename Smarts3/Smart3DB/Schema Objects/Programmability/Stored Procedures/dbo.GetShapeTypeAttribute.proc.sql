
CREATE PROCEDURE [dbo].[GetShapeTypeAttribute] (@ID as int)  AS

/*

OBJECTIVE
	retrieve list  values according to shapetype

INPUTS
	@ID  - shapetypeattribute filter

OUTPUTS
	shapetypeattribute_id, shapetypeattribute_desc, 
	shape_id, shape_name, shape_desc,
	shapetype_id, shapetype_name,
	attribute_id, attribute_name, 
	constrainedvalue_values,
	attributevalue_id, attributevalue_value

TASKS
	1. SELECT according to shapetypeattribute ID

NOTES
*/

--- 1
select sta.shapetypeattribute_id, shapetypeattribute_desc, 
	shape_id, shape_name, shape_desc,
	st.shapetype_id, st.shapetype_name,
	a.attribute_id, a.attribute_name, 
	cv.constrainedvalue_values,
	av.attributevalue_id, av.attributevalue_value
from shapetypeattribute as sta
	left join attribute as a on sta.attribute_id = a.attribute_id
	left join shapetype as st on sta.shapetype_id = st.shapetype_id
	left join constrainedvalue as cv on sta.shapetypeattribute_id = cv.sd_id AND cv.sdtable_id = 5
	left join attributevalue as av on sta.shapetypeattribute_id = av.shapetypeattribute_id
	left join shape as s on s.shape_id = av.SD_id
where sta.shapetypeattribute_id = @iD

order by shape_name
