# ------------------ Triggers para capturar alterações feitas na tabela Curso ----------------------
USE SisMatricula;
DROP TRIGGER if exists trigger_alteracoes_insert_curso;
DELIMITER ||
CREATE TRIGGER trigger_alteracoes_insert_curso
AFTER INSERT ON Curso
FOR EACH ROW
BEGIN
     DECLARE cod INT;
     DECLARE _user VARCHAR(30);
     
     SET cod = (select codCurso from Curso order by codCurso DESC LIMIT 1);
     SET _user = (select user());
     
     INSERT INTO TabelaAlteracoes(usuario, tabelaAlterada,  comando, linhaAlterada) VALUES
				                 (_user,      'Curso', 'INSERT',           cod);
END ||
DELIMITER ;
