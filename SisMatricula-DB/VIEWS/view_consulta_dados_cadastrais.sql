
-- scrpit para consultar todos os usuários do sistema, administrador, coordenador, alunos, professores e tecnicos administrativos


# --------------------- view para consulta de usuarios coordenador -------------------
USE SisMatricula;
DROP VIEW IF EXISTS view_consulta_dados_cadastrais;
CREATE VIEW view_consulta_dados_cadastrais as

   select codUsuario,
		  identificacao,
		  nomeUsuario, 					 
		  dataNas,
          cpf,
          ingresso,
          email,
          telefone1,
          telefone2,
          codTipoUsuario
   from Usuario;       
# -------------------------------------------------------------------------------------------
