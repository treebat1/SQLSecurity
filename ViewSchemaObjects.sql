--view objects in schemas


select p.name AS SchemaOwner, s.schema_id, s.name SchemaName, s.principal_id, o.object_id, o.name ObjectName
, o.type_desc ObjectDescription
from sys.schemas s
join sys.objects o on s.schema_id = o.schema_id
join sys.database_principals p on p.principal_id = s.principal_id
where  s.name in ('bridge')
--or p.name in ('UBOC-AD\ub62644','UBOC-AD\ub66844')
order by 1,2,3,4,5




--View count of objects by schemas.
select count(1) as TotalObjectsBySchema, p.name AS SchemaOwner, s.schema_id, s.name SchemaName
from sys.schemas s
left join sys.objects o on s.schema_id = o.schema_id
join sys.database_principals p on p.principal_id = s.principal_id
where s.schema_id < 10000
and s.schema_id not in (2,3,4)
--s.name in ('creditcard_risk','dim','fact')
--or p.name in ('UBOC-AD\ub62644','UBOC-AD\ub66844')
group by p.name, s.schema_id, s.name
order by 1 desc,2,3,4
