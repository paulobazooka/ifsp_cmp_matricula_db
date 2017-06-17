
USE SisMatricula;
DROP TRIGGER if exists trigger_alteracoes_update_usuario;
DELIMITER ||
CREATE TRIGGER trigger_alteracoes_update_usuario
AFTER UPDATE ON Usuario
FOR EACH ROW
BEGIN
     DECLARE cod INT;
     DECLARE _user VARCHAR(30);
     
     SET cod = new.codUsuario;
     SET _user = (select user());
     
     INSERT INTO TabelaAlteracoes(usuario, tabelaAlterada,  comando, linhaAlterada) VALUES
				                 (_user,      'Usuario', 'UPDATE',           cod);
END ||
DELIMITER ;

