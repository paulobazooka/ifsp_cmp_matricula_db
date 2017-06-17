# Criar trigger para atualizar a tabela disciplina concluida quando for mudado o status de conclusão na matricula
USE SisMatricula;
DROP TRIGGER if exists trigger_atualiza_disciplina_concluida_update;
DELIMITER ||
CREATE TRIGGER trigger_atualiza_disciplina_concluida_update
AFTER UPDATE ON Matricula
FOR EACH ROW
BEGIN
IF (NEW.concluido = true) THEN		 -- Se houve conclusão da disciplina   
         INSERT DisciplinaConcluida (codUsuario, codTurma) VALUES 
	     (NEW.codUsuario, NEW.codTurma);
   
END IF;

END ||
DELIMITER ;