-- stored procedure para consultar se o usuario existe ou não no banco de dados.
-- se sim retorna true, senão retorna false

# ------------------------------ Consulta Usuario válido ----------------------------------
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_login;    -- procedure para retornar se existe o usuario ou não.
DELIMITER $$
CREATE PROCEDURE procedure_login (IN id varchar(25), IN pass varchar(25))
BEGIN
    IF (true = (select true from Usuario where (identificacao = id
                             and senha = md5(pass)))) THEN
        select true from dual; 
        
    ELSE 
        select false from dual;
    END IF;
    
END $$
DELIMITER ;  
# --------------------------------------------------------------------------------------------