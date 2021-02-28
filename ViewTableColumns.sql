SELECT tbl.name as table_name, c.column_id, c.name,  t.name as datatype
FROM sys.columns AS c  
JOIN sys.tables AS tbl   
    ON c.[object_id] = tbl.[object_id]
join sys.types t
on c.system_type_id = t.system_type_id
WHERE tbl.name = 'h_dim_loan'
order by 1,2,3,4