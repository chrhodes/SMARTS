
CREATE PROCEDURE  [dbo].[GetReport_ShapeTypeAttribute] (@ID as int)  AS


select shape_id, shape_name, 
	(select sd_id_container from container where abstraction_id in (SELECT abstraction_id FROM abstraction WHERE abstraction_name = 'SYSTEMOBJECT' OR abstraction_name = 'BUSINESSSTEP') and sd_id_contained = s.shape_id) as sd_id_container,
	(select shape_name from shape where shape_id = (select sd_id_container from container where abstraction_id in (SELECT abstraction_id FROM abstraction WHERE abstraction_name = 'SYSTEMOBJECT' OR abstraction_name = 'BUSINESSSTEP') and sd_id_contained = s.shape_id)) as container_name,
	(select attribute_name from attribute where attribute_id = sta.attribute_id) as attribute_name,
	(select attributevalue_value from attributevalue where sdtable_id = 4 and sd_id = s.shape_id and shapetypeattribute_id = sta.shapetypeattribute_id) as attributevalue_value
into #temptable
from shape as s 
	join shapetypeattribute as sta on sta.shapetype_id = s.shapetype_id
where sta.shapetype_id = @ID

order by attribute_name
/*

select  shape_id, shape_name, sd_id_container,
	(SELECT Shape_name from shape where shape_id = sd_id_container) as container_name,
	 attribute_name, attributevalue_value 
	into #temptable
	from shapetypeattribute 
	left join attribute on shapetypeattribute.attribute_id = attribute.attribute_id
	left join shapetype on shapetype.shapetype_id  = shapetypeattribute.shapetype_id
	left join shape on shape.shapetype_id = shapetype.shapetype_id
	left join container on container.sd_id_contained = shape.shape_id 
		and container.sdtable_id_contained =  (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Shape') 
		and container.abstraction_id  in (SELECT abstraction_id FROM abstraction WHERE abstraction_name = 'SYSTEMOBJECT' OR abstraction_name = 'BUSINESSSTEP')
	left join attributevalue on attributevalue.sdtable_id = (SELECT SDTable_ID FROM SDTable WHERE SDTable_Name = 'Shape')
		and attributevalue.sd_id = shape.shape_id 
		and shapetypeattribute.shapetypeattribute_id = attributevalue.shapetypeattribute_id
where  shapetypeattribute.shapetype_id = @ID
*/

SET NOCOUNT ON
SET CONCAT_NULL_YIELDS_NULL OFF
DECLARE @SELECT_FROM_TABLE nvarchar(1000)

CREATE TABLE #columns (col1 int identity(1,1),col2 varchar(100) default 'No data')

SET @SELECT_FROM_TABLE='INSERT INTO #Columns(col2) SELECT DISTINCT Attribute_Name FROM #temptable '

EXEC sp_executesql @SELECT_FROM_TABLE

DECLARE @LoopCount int
DECLARE @RecordCount int
DECLARE @ColumnsToSelect varchar(2000)
DECLARE @SumStatements varchar(8000)
DECLARE @QUERY varchar(8000)
DECLARE @Column_Value varchar(2000)

SET @ColumnsToSelect=''
SET @RecordCount=(Select Count(*) FROM #Columns)
SET @LoopCount=0

WHILE @LoopCount<=@RecordCount
BEGIN
SET @LoopCount= @LoopCount + 1
SET @Column_Value=(Select col2 from #Columns where col1=@LoopCount)
if DataLength(@Column_Value)>0
BEGIN
SET @ColumnsToSelect= @ColumnsToSelect + ' P1.[' + @Column_Value + '] + '
SET @SumStatements=@SumStatements + ' MAX(CASE P.Attribute_Name WHEN ''' + @Column_Value + ''' THEN AttributeValue_Value ELSE NULL END) AS [' + @Column_Value + '], '

END
END

SET @ColumnsToSelect='P1.*  '


SET @SumStatements=LEFT(@SumStatements,len(@SumStatements)-1) + '  FROM #temptable AS P GROUP BY P.Shape_Name, P.Container_Name WITH CUBE) AS P1'
SET @QUERY='SELECT ' + @columnsToSelect + ' FROM ( SELECT DISTINCT MAX(Shape_Name) AS Shape,  MAX(Container_Name) as Container '

IF CHARINDEX('MAX',@SumStatements)>0
SET @QUERY=@QUERY + ',' + @SumStatements
ELSE
SET @QUERY=@QUERY + @SumStatements

--print @query

exEC sp_executesql @QUERY

drop table #temptable
