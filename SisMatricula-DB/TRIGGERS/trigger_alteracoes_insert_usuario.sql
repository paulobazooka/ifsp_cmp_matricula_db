# ------------------ Triggers para capturar alterações feitas na tabela Usuario ----------------------
USE SisMatricula;
DROP TRIGGER if exists trigger_alteracoes_insert_usuario;
DELIMITER ||
CREATE TRIGGER trigger_alteracoes_insert_usuario
AFTER INSERT ON Usuario
FOR EACH ROW
BEGIN
     DECLARE cod INT;
     DECLARE _user VARCHAR(30);
     
     SET cod = (select codUsuario from Usuario order by codUsuario DESC LIMIT 1);
     SET _user = (select user());
     
     INSERT INTO TabelaAlteracoes(usuario, tabelaAlterada,  comando, linhaAlterada) VALUES
				                 (_user,      'Usuario', 'INSERT',           cod);
END ||
DELIMITER ;


