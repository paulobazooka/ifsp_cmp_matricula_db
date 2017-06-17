-- solicitar matricula
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_solicitar_matricula;
DELIMITER $$
CREATE PROCEDURE procedure_solicitar_matricula(IN codTur INT, IN codAluno INT)
BEGIN
    
    START TRANSACTION;  
    INSERT INTO Matricula(codTurma, codUsuario) VALUES (codTur, codAluno);
    
    IF (codAluno = (select codUsuario from Matricula order by codMatricula DESC LIMIT 1) AND
        codTur = (select codTurma from Matricula order by codMatricula DESC LIMIT 1)) THEN       
        COMMIT;
        select true from dual;
    ELSE    
        ROLLBACK;
        select false from dual;
    END IF;
    
    
END $$
DELIMITER ;