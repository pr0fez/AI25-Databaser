RESTORE DATABASE bokhandel
FROM DISK = '/home/raphael/Downloads/everyloop.bak'
WITH MOVE 'Bokhandel_Boken' TO '/var/opt/mssql/data/bokhandel.mdf',
MOVE 'Bokhandel_Boken_log' TO '/var/opt/mssql/data/bokhandel_log.ldf';

RESTORE FILELISTONLY
FROM DISK = '/home/raphael/Downloads/my_backup.bak'
use master;
alter database [bokhandel] set single_user with rollback immediate;

