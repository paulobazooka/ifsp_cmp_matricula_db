-- procedure que retorna os dados cadastrais do usuario


# ---------------------- procedure para consultar dados cadastrais ----------------------------------
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_consulta_dados_cadastrais;
DELIMITER $$
CREATE PROCEDURE procedure_consulta_dados_cadastrais(IN codusuario INT) 
BEGIN
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
      from Usuario
      where codUsuario = codusuario;        
END $$
DELIMITER ;
# --------------------------------------------------------------------------------