-- stored procedure que salva no banco de dados a hora que o usuario saiu do sistema (Java)

# ------------------------ procedure para logoff ------------------------------------
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_logoff;    -- procedure para logoff
DELIMITER $$
CREATE PROCEDURE procedure_logoff (IN cod INT)
BEGIN
   
   DECLARE codlog2 INT;
   SET codlog2 = (select codLog from TabelaLogin where codUsuario = cod ORDER BY codLog DESC LIMIT 1);
   
   UPDATE TabelaLogin SET horaSaiu = current_timestamp() where (codLog = codlog2 and horaSaiu = NULL);
   
END $$
DELIMITER ; 