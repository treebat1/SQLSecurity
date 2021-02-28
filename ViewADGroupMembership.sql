declare @winlogins table 
(acct_name sysname, 
acct_type varchar(10), 
act_priv varchar(10), 
login_name sysname,  
perm_path sysname) 
declare @group sysname 
insert into @winlogins 
exec xp_logininfo 'uboc-ad\71313_CreditCard_Ops' , 'members'   

SELECT *
FROM @winlogins sp 