GRANT EXECUTE on master.[dbo].[isMatch] TO [COLO\ResonanceAgent]
GRANT EXECUTE on master.[dbo].[isMatch] TO [Resonance]


GRANT EXECUTE on master.[dbo].[RegEx_Replace] TO [COLO\ResonanceAgent]
GRANT EXECUTE on master.[dbo].[RegEx_Replace] TO [Resonance]




GRANT EXECUTE on msdb.dbo.sp_start_job TO [colo\SQLAgentAccount]



GRANT EXECUTE on master.[dbo].[isMatch] TO [Resonance]

USE master
GRANT EXECUTE ON xp_sqlagent_enum_jobs TO [COLO\CORP TS Read Only];


USE master
GRANT EXECUTE ON [sys].[xp_sqlagent_is_starting] TO [COLO\CORP TS Read Only];





GRANT EXECUTE on [dbo].[Get_Database_By_Account] TO  [CORP\TS Read Only];