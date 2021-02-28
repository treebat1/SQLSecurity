SELECT tbl.name as table_name, c.name,  c.is_masked, c.masking_function, t.name as datatype
FROM sys.masked_columns AS c  
JOIN sys.tables AS tbl   
    ON c.[object_id] = tbl.[object_id]
join sys.types t
on c.system_type_id = t.system_type_id
WHERE is_masked = 1
order by t.name


/*
grant unmask to TEST_ROLE

revoke unmask to TEST_ROLE
*/