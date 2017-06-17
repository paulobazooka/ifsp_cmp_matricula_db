USE SisMatricula;
DROP TRIGGER if exists trigger_alteracoes_delete_usuario;
DELIMITER ||
CREATE TRIGGER trigger_alteracoes_delete_usuario
AFTER DELETE ON Usuario
FOR EACH ROW
BEGIN
     DECLARE cod INT;
     DECLARE _user VARCHAR(30);
     
     SET cod = old.codUsuario;
     SET _user = (select user());
     
     INSERT INTO TabelaAlteracoes(usuario, tabelaAlterada,  comando, linhaAlterada) VALUES
				                 (_user,      'Usuario', 'DELETE',           cod);
END ||
DELIMITER ;
# ----------------------------------------------------------------------------------------------------