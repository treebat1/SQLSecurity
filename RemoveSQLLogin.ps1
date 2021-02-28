$Login = 'uboc-ad\ub56406'

Test-DbaWindowsLogin -SqlInstance car-dmsql-tst\DATAMARTTEST -Login $Login
Remove-DbaDbUser -SqlInstance car-dmsql-tst\DATAMARTTEST -Confirm -User $Login
Remove-DbaLogin -SqlInstance car-dmsql-tst\DATAMARTTEST -Login $Login
