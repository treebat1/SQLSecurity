SELECT encrypt_option, * 
FROM sys.dm_exec_connections
order by 1 desc



SELECT auth_scheme,  count(1) as Total
FROM sys.dm_exec_connections
group by auth_scheme


SELECT * 
FROM sys.dm_exec_connections
where auth_scheme = 'NTLM'