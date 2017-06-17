-- cancelar matricula aluno
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_cancelar_matricula_aluno;
DELIMITER $$
CREATE PROCEDURE procedure_cancelar_matricula_aluno(IN cod INT, IN codAluno INT)
BEGIN
    
    START TRANSACTION;  
    UPDATE Matricula SET EstadoMat = 4 WHERE cod = codMatricula AND codAluno = codUsuario;
    
    IF (estado = (select estadoMat from Matricula where cod = codMatricula)) THEN       
        COMMIT;
        select true from dual;
    ELSE    
        ROLLBACK;
        select false from dual;
    END IF;
    
END $$
DELIMITER ;