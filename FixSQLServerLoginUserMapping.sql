--Fix Login user mismatch

--go



--this shows what users are unlinked to logins.
exec sp_change_users_login 'report'


exec sp_change_users_login @Action = 'Update_One', @usernamepattern = 'Resonance', @LoginName = 'Resonance'
exec sp_change_users_login @Action = 'Update_One', @usernamepattern = 'SQLStartJob', @LoginName = 'SQLStartJob'


