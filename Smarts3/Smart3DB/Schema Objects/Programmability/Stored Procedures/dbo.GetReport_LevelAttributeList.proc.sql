
CREATE PROCEDURE  [dbo].[GetReport_LevelAttributeList]  AS

select distinct 
	(select top 1 shapetypeattribute_id 
		from shapetypeattribute 
		where attribute_id = sta.attribute_id
			and shapetype_id in (select shapetype_id from shapetype where abstraction_id = ab.abstraction_id ) )as sta_id,
	(abstraction_name + ' ' + attribute_name) as sta_name,
	sta.attribute_id, attribute_name, ab.abstraction_id, abstraction_name
	from shapetypeattribute as sta
	left join attribute as a 
		on sta.attribute_id = a.attribute_id
	left join shapetype as st	
		on sta.shapetype_id = st.shapetype_id	
	left join abstraction as ab
		on ab.abstraction_id = st.abstraction_id
where ab.abstraction_id in (1,2,3,10,11)
order by ab.abstraction_id,  attribute_name
