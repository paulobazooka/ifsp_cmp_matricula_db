-- Alterar status matricula
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_alterar_status_matricula;
DELIMITER $$
CREATE PROCEDURE procedure_alterar_status_matricula(IN cod INT, IN estado INT)
BEGIN
    
    START TRANSACTION;  
    UPDATE Matricula SET codEstado = estado WHERE codMatricula = cod;
    
    IF (estado = (select codEstado from Matricula where codMatricula = cod)) THEN       
        COMMIT;
        select true from dual;
    ELSE    
        ROLLBACK;
        select false from dual;
    END IF;
    
    
END $$
DELIMITER ;
