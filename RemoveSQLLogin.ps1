$Login = 'u'

Test-DbaWindowsLogin -SqlInstance TEST -Login $Login
Remove-DbaDbUser -SqlInstance TEST -Confirm -User $Login
Remove-DbaLogin -SqlInstance TEST -Login $Login
