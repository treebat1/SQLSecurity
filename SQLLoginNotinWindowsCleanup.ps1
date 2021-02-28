$Login = 'UBOC-AD\xu87472'

Test-DbaWindowsLogin -SqlInstance 10.174.110.218\DATAMARTDEV -Login $Login
Remove-DbaDbUser -SqlInstance 10.174.110.218\DATAMARTDEV -Confirm -User $Login
Remove-DbaLogin -SqlInstance 10.174.110.218\DATAMARTDEV -Login $Login
