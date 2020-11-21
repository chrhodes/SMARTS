
CREATE PROCEDURE [dbo].[GetLog_AttributeValuesExisting](@Table as int, @ID as int)  AS

SELECT * FROM attributevalue as av
	left join shapetypeattribute as sta on sta.shapetypeattribute_id = av.shapetypeattribute_id
	left join attribute as a on a.attribute_id = sta.attribute_id
	left join sdlog as sdl on sdl.sdtable_id = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'AttributeValue')
		and av.attributevalue_id = sdl.sd_id 
	where av.sd_id = @ID 
		and av.sdtable_id = @Table 
		and sdl.sdlog_note is NULL
	order by attribute_name, sdlog_id
