1) Criar conta no c9
    Incluir seu email na planilha: https://goo.gl/iEr7gs

2) Criar Maquina Virtual Ubuntu-blank

3) Instalar Mysql
    mysql-ctl install
    
4) Inicializar Instancia
    mysql-ctl start
    *Salvar o log com informações de seu usuario root e DB padrao

5) Conectando com o servidor usando usuario root, por terminal de linha de commando CLI
    mysql-ctl cli

6) Testar execução de scripts SQL
    source 01_CREATE_DB_TEMPLATE.SQL > 01_CREATE_DB_TEMPLATE.LOG
    mysql -h localhost -u DBA -p
    use template
    exit

7) Testar execução de scripts SQL (DESCONECTADO)
    mysql -h localhost -u cbeluzo < 01_CREATE_DB_TEMPLATE.SQL > LOGS/01_CREATE_DB_TEMPLATE.LOG

8) Criar objetos do seu DB TEMPLATE com user DBA
    mysql -h localhost -u DBA < 02_INSTALL_TEMPLATE.SQL > LOGS/02_INSTALL_TEMPLATE.LOG -p

9) Iniciar implementacao de seu DB


-- ----------------------------------------------------------------------------
Referências

Mysql Commands
https://dev.mysql.com/doc/refman/5.7/en/mysql-commands.html

Mysql Batch Mode
https://dev.mysql.com/doc/refman/5.7/en/batch-mode.html

Mysql on C9
https://community.c9.io/t/setting-up-mysql/1718

Comandos SQL
https://www.w3schools.com/sql/

Data Dictionary
https://dev.mysql.com/doc/refman/5.5/en/information-schema.html

MySQL CLI Commands
https://dev.mysql.com/doc/refman/5.7/en/mysql-commands.html

USEFUL COMMANDS:

SHOW DATABASES;
SHOW TABLES;
EXIT;
