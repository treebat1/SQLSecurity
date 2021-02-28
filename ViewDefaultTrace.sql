--SELECT * FROM ::fn_trace_getinfo(0)



SELECT t.starttime
, t.textdata
, t.NTUserName
, t.HostName
, t.ApplicationName
, t.LoginName
, t.ObjectName
, t.DatabaseName
, t.DBUserName
, t.SessionLoginName
, e.name EventName
, cat.name CategoryName
--, *
FROM ::fn_trace_gettable('C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Log\log_2434.trc',0) t
     INNER JOIN sys.trace_events e
          ON t.eventclass = trace_event_id
     INNER JOIN sys.trace_categories AS cat
          ON e.category_id = cat.category_id
--where 
--LoginName like 'Corp%'
--and e.name = 'Object:Deleted'
--TargetLoginName like 'Corp\CTG%'
--and 
--cat.name = 'Security Audit'
--t.DatabaseName = ''--
--DatabaseName <> 'tempdb'   
--and 
--StartTime >= '11/18/2015'
--and (hostname <> 'criley-pc' or hostname is null)
--AND 
--cat.name = 'Objects'
--AND 
--(e.name like '%Login%')  
--or e.name like '%Created%')
--or 
--t.TextData like '%No Stats%'
--order by StartTime desc
--and OBJECTNAME = 'subscription'
ORDER BY t.StartTime desc