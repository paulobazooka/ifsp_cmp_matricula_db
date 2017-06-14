-- Rotina para Deletar se existir os usários que utilizarão o sistema de matrícula
USE SisMatricula;

DROP USER if exists 'admin'@'localhost';       -- administrador do sistema 
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';

DROP USER if exists 'aluno'@'localhost';       -- aluno
CREATE USER 'aluno'@'localhost' IDENTIFIED BY 'aluno';
-- privilégios para aluno
GRANT SELECT ON view_consulta_disciplinas_curso TO 'aluno'@'localhost'; 
GRANT SELECT ON view_consulta_disciplinas_para_matricula TO 'aluno'@'localhost';
GRANT SELECT ON view_consulta_turmas_abertas TO 'aluno'@'localhost';
GRANT SELECT ON view_consulta_disciplinas_para_matricula TO 'aluno'@'localhost';
GRANT SELECT ON view_consulta_cursos TO 'aluno'@'localhost';
GRANT SELECT ON procedure_solicitar_matricula TO 'aluno'@'localhost';
GRANT SELECT ON procedure_cancelar_matricula TO 'aluno'@'localhost';
GRANT SELECT ON procedure_consulta_dados_cadastrais TO 'aluno'@'localhost';
GRANT SELECT ON procedure_update_aluno TO 'aluno'@'localhost';
GRANT SELECT ON procedure_login TO 'aluno'@'localhost';
GRANT SELECT ON procedure_login_retorna_usuario TO 'aluno'@'localhost';
GRANT SELECT ON procedure_consulta_sitaucao_matricula TO 'aluno'@'localhost';


DROP USER if exists 'professor'@'localhost';    -- professor
CREATE USER 'professor'@'localhost' IDENTIFIED BY 'professor';

DROP USER if exists 'tecnicoadm'@'localhost';  -- tecnico administrativo do instituto (CRE)
CREATE USER 'tecnicoadm'@'localhost' IDENTIFIED BY 'tecnicoadm';

DROP USER if exists 'coordenador'@'localhost'; -- coordenador do curso
CREATE USER 'coordenador'@'localhost' IDENTIFIED BY 'coordenador';







USE SisMatricula;



