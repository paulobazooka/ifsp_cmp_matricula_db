-- -----------------------------------------------------------------------------
-- Criando DATA PUMP manualmente.
-- -----------------------------------------------------------------------------
1) Acessar o DB
    mysql -h localhost -u DBA -p
    use TEMPLATE

2) Executar o DATA PUMP para gerar dados:
    mysql -h localhost -u DBA < DATA_PUMP/MESSAGES_PUMP.SQL > DATA_PUMP/MESSAGES_DATA.SQL -p

3) Carregar Backup:
    mysql -h localhost -u DBA < DATA_PUMP/MESSAGES_DATA.SQL -p

-- -----------------------------------------------------------------------------
-- Usando mysqldump
-- -----------------------------------------------------------------------------
-- COMPLETO
mysqldump --user=cbeluzo --password --all-databases > backup_20170606_all.sql
mysql -h localhost -u cbeluzo < backup_20170606_all.sql -p

-- DATABASE
mysqldump --user=cbeluzo --password TEMPLATE > backup_20170606_TEMPLATE.sql
mysql -h localhost -u DBA TEMPLATE < backup_20170606_TEMPLATE.sql -p

-- TABLE
mysqldump --user=cbeluzo --password TEMPLATE MESSAGES > MESSAGES.SQL
mysql -h localhost -u DBA TEMPLATE < backup_20170606_TEMPLATE.sql -p

mysqlimport [options] db_name textfile1 [textfile2 ...]
mysqlimport -L -u DBA TEMPLATE backup_20170606_TEMPLATE.sql -p
mysqlimport -L -u DBA TEMPLATE MESSAGES.SQL -p
-- -----------------------------------------------------------------------------
-- Usando select into outfile
-- -----------------------------------------------------------------------------
-- Extração
select * into outfile 'MESSAGES.SQL' from MESSAGES;

-- Carga
load data infile '/tmp/accounts.txt' into table accounts;

-- -----------------------------------------------------------------------------
Referência:
http://www.datadisk.co.uk/html_docs/mysql/backups.htm

https://dev.mysql.com/doc/refman/5.7/en/copying-databases.html

https://dev.mysql.com/doc/refman/5.7/en/mysqlimport.html

https://dev.mysql.com/doc/refman/5.7/en/load-data.html