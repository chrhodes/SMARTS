﻿EXECUTE sp_addrolemember @rolename = N'db_owner', @membername = N'PACIFICMUTUAL\CRhodes';


GO
EXECUTE sp_addrolemember @rolename = N'db_datareader', @membername = N'SmartsAdmin';


GO
EXECUTE sp_addrolemember @rolename = N'db_datareader', @membername = N'SmartsUser';


GO
EXECUTE sp_addrolemember @rolename = N'db_datareader', @membername = N'SQLMonitor';


GO
EXECUTE sp_addrolemember @rolename = N'db_datawriter', @membername = N'SmartsAdmin';

