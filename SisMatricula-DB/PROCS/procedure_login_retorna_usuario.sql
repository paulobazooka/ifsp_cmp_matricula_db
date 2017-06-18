/*   stored procedure que retorna os dados do usuario logado 
 *
 */
# ------------------ Procedure retornar os dados do Aluno/Usuario logado ---------------------------
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_login_retorna_usuario;    -- procedure para retornar o usuario
DELIMITER $$
CREATE PROCEDURE procedure_login_retorna_usuario (IN id varchar(25), IN pass varchar(25))
BEGIN
   
   DECLARE cod INT;
   SET cod = (select codUsuario from Usuario where identificacao = id and senha = md5(pass));
   
   select codUsuario,
	      identificacao,
	      nomeUsuario,                     
	      dataNas,
	      cpf,
	      date(ingresso),
	      email,
	      telefone1,
	      telefone2,
	      codTipoUsuario
          
   from Usuario   
   
   where identificacao = id and senha = md5(pass);
   
   insert into TabelaLogin(codUsuario) values (cod);
   
END $$
DELIMITER ; 
# --------------------------------------------------------------------------------------------------
