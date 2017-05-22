
# Criar trigger para atualizar a tabela turma toda vez que a matricula for aceita
USE SisMatricula;
DROP TRIGGER if exists trigger_atualiza_turma;
DELIMITER ||
CREATE TRIGGER trigger_atualiza_turma
AFTER UPDATE ON Matricula
FOR EACH ROW
BEGIN

IF (NEW.codEstado = 3) THEN		 -- Se a matricula foi deferida...
	IF (OLD.codEstado = 1) THEN  -- Se houve solicitação anteriormente
    UPDATE Turma t
	SET t.matriculasRealizadas = t.matriculasRealizadas + 1 
    WHERE t.codTurma = New.codTurma;
	INSERT INTO AssinaturaDigitalMatricula (codMatricula, assinatura) VALUES
			    (NEW.codMatricula, md5(NEW.codMatricula + NEW.codTurma + NEW.codUsuario + NEW.dtMatricula + now()));
    END IF;
    
ELSEIF (NEW.codEstado = 4) THEN	 -- Se a matricula foi cancelada...
    IF (OLD.codEstado = 3) THEN  -- Se a matricula havia sido deferida
	UPDATE Turma t
	SET t.matriculasRealizadas = t.matriculasRealizadas - 1 
    WHERE t.codTurma = New.codTurma;
    END IF;
    
ELSEIF (NEW.codEstado = 5) THEN	 -- Se houve abandono na disciplina...
    IF (OLD.codEstado = 3) THEN  -- Se a matricula havia sido deferida
	UPDATE Turma t
	SET t.matriculasRealizadas = t.matriculasRealizadas - 1 
    WHERE t.codTurma = New.codTurma;
	END IF;
END IF;

END ||
DELIMITER ;


