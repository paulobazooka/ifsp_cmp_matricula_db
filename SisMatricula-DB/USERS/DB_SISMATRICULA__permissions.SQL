-- Rotina para Deletar se existir os usários que utilizarão o sistema de matrícula
USE SisMatricula;



-- usuário para verificar e realizar o login no sistema (Java)
DROP USER IF EXISTS 'login'@'localhost'; -- usuário para login
CREATE USER 'login'@'localhost' IDENTIFIED BY 'login';

-- usuário administrador do banco, total acesso ao banco
DROP USER if exists 'admin'@'localhost';       -- administrador do sistema 
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';

-- usuário coordenador dos cursos acesso total ao insert, update e delete da massa de dados
DROP USER if exists 'coordenador'@'localhost'; -- coordenador do curso
CREATE USER 'coordenador'@'localhost' IDENTIFIED BY 'coordenador';

-- usuário aluno acesso restrito à algumas views e procedures
DROP USER if exists 'aluno'@'localhost';       -- aluno
CREATE USER 'aluno'@'localhost' IDENTIFIED BY 'aluno';

-- usuário professor acesso restrito à algumas views e procedures
DROP USER if exists 'professor'@'localhost';    -- professor
CREATE USER 'professor'@'localhost' IDENTIFIED BY 'professor';

-- usuário tecnico administrativo acesso restrito à algumas views e procedures
DROP USER if exists 'tecnicoadm'@'localhost';  -- tecnico administrativo do instituto (CRE)
CREATE USER 'tecnicoadm'@'localhost' IDENTIFIED BY 'tecnicoadm';

-- privilégios para o usuario logar no sistema
GRANT ALL ON procedure_login                 TO 'login'@'localhost';
GRANT ALL ON procedure_login_retorna_usuario TO 'login'@'localhost';



# ------------------------------ PRIVILÉGIOS ---------------------------------------------

-- privilégios para o dba
GRANT ALL ON SisMatricula.* TO 'admin'@'localhost'; 



-- privilégios para o coordenador
GRANT ALL    ON procedure_login                          TO 'coordenador'@'localhost';
GRANT ALL    ON procedure_login_retorna_usuario 		 TO 'coordenador'@'localhost';
GRANT ALL    ON procedure_consulta_dados_cadastrais 	 TO 'coordenador'@'localhost';
GRANT ALL    ON procedure_update_usuario 				 TO 'coordenador'@'localhost';
GRANT SELECT ON view_consulta_disciplinas_curso 		 TO 'coordenador'@'localhost';
GRANT SELECT ON view_consulta_disciplinas_para_matricula TO 'coordenador'@'localhost';
GRANT SELECT ON view_consulta_turmas_abertas 			 TO 'coordenador'@'localhost';
GRANT SELECT ON view_consulta_cursos 					 TO 'coordenador'@'localhost';
GRANT SELECT ON view_solicitacoes_matriculas_coordenador TO 'coordenador'@'localhost';
GRANT ALL 	 ON procedure_insert_curso 					 TO 'coordenador'@'localhost';
GRANT ALL 	 ON procedure_delete_curso 					 TO 'coordenador'@'localhost';
GRANT ALL 	 ON procedure_update_curso 					 TO 'coordenador'@'localhost';
GRANT ALL 	 ON procedure_insert_aluno 					 TO 'coordenador'@'localhost';
GRANT ALL 	 ON procedure_update_aluno 					 TO 'coordenador'@'localhost';
GRANT ALL 	 ON procedure_delete_aluno 					 TO 'coordenador'@'localhost';
GRANT ALL 	 ON procedure_inserir_disciplina 			 TO 'coordenador'@'localhost';
GRANT ALL 	 ON procedure_update_disciplina 		     TO 'coordenador'@'localhost';
GRANT ALL 	 ON procedure_delete_disciplina 			 TO 'coordenador'@'localhost';
GRANT ALL 	 ON procedure_inserir_turma 			     TO 'coordenador'@'localhost';
GRANT ALL 	 ON procedure_update_turma 					 TO 'coordenador'@'localhost';
GRANT ALL 	 ON procedure_delete_turma 					 TO 'coordenador'@'localhost';
GRANT ALL 	 ON procedure_alterar_status_matricula       TO 'coordenador'@'localhost';



-- privilégios para aluno
GRANT SELECT ON view_consulta_disciplinas_curso          TO 'aluno'@'localhost'; 
GRANT SELECT ON view_consulta_disciplinas_para_matricula TO 'aluno'@'localhost';
GRANT SELECT ON view_consulta_turmas_abertas             TO 'aluno'@'localhost';
GRANT SELECT ON view_consulta_disciplinas_para_matricula TO 'aluno'@'localhost';
GRANT SELECT ON view_consulta_cursos 					 TO 'aluno'@'localhost';
GRANT ALL 	 ON procedure_solicitar_matricula 		     TO 'aluno'@'localhost';
GRANT ALL 	 ON procedure_cancelar_matricula 			 TO 'aluno'@'localhost';
GRANT ALL    ON procedure_consulta_dados_cadastrais      TO 'aluno'@'localhost';
GRANT ALL    ON procedure_update_aluno 					 TO 'aluno'@'localhost';
GRANT ALL    ON procedure_login   						 TO 'aluno'@'localhost';
GRANT ALL    ON procedure_login_retorna_usuario 		 TO 'aluno'@'localhost';
GRANT ALL    ON procedure_consulta_sitaucao_matricula    TO 'aluno'@'localhost';
GRANT ALL    ON procedure_disciplinas_concluidas         TO 'aluno'@'localhost';
GRANT ALL    ON procedure_disciplinas_nao_concluidas     TO 'aluno'@'localhost';



-- privilégios para professor
GRANT SELECT ON view_consulta_disciplinas_curso  	TO 'professor'@'localhost';
GRANT SELECT ON view_consulta_turmas_abertas 		TO 'professor'@'localhost';
GRANT SELECT ON view_consulta_cursos 				TO 'professor'@'localhost';
GRANT ALL    ON procedure_login 					TO 'professor'@'localhost';
GRANT ALL    ON procedure_login_retorna_usuario		TO 'professor'@'localhost';
GRANT ALL    ON procedure_consulta_dados_cadastrais TO 'professor'@'localhost';
GRANT ALL    ON procedure_update_usuario 			TO 'professor'@'localhost';

  
-- privilégios tecnico administrativo
GRANT ALL 	 ON procedure_login 					     TO 'tecnicoadm'@'localhost';
GRANT ALL    ON procedure_login_retorna_usuario 	     TO 'tecnicoadm'@'localhost';
GRANT SELECT ON view_solicitacoes_matriculas_coordenador TO 'coordenador'@'localhost';
GRANT ALL    ON procedure_alterar_status_matricula       TO 'coordenador'@'localhost';



FLUSH PRIVILEGES;

