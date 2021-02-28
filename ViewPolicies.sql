SELECT *
  FROM msdb..syspolicy_management_facets
  WHERE execution_mode % 2 = 1;