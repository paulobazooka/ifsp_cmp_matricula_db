

SELECT 'CREATING TABLES...' AS ' ';
SOURCE TABLES/TABLES.SQL
SELECT TABLE_NAME AS 'TABLE CREATED:' FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Usuario';
SELECT TABLE_NAME AS 'TABLE CREATED:' FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Curso';
SELECT TABLE_NAME AS 'TABLE CREATED:' FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Disciplina';
SELECT TABLE_NAME AS 'TABLE CREATED:' FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Turma';
SELECT TABLE_NAME AS 'TABLE CREATED:' FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Matricula';
SELECT TABLE_NAME AS 'TABLE CREATED:' FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'TabelaAlteracoes';
SELECT TABLE_NAME AS 'TABLE CREATED:' FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'TabelaAssinaturaDigital';
SELECT TABLE_NAME AS 'TABLE CREATED:' FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Turno';
SELECT TABLE_NAME AS 'TABLE CREATED:' FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Horario';
SELECT TABLE_NAME AS 'TABLE CREATED:' FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'TipoUsuario';
SELECT TABLE_NAME AS 'TABLE CREATED:' FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'CursoDisciplina';
SELECT 'DONE!' AS ' ';


-- -----------------------------------------------------------------------------
SELECT 'CREATEING VIEWS...' AS ' ';
SOURCE VIEWS/view_consulta_cursos.sql
SOURCE VIEWS/view_consulta_dados_cadastrais.sql
SOURCE VIEWS/view_consulta_disciplinas_curso.sql
SOURCE VIEWS/view_consulta_disciplinas_para_matricula.sql
SOURCE VIEWS/view_consulta_turmas_abertas.sql
SOURCE VIEWS/view_solicitacoes_matriculas_coordenador.sql
SOURCE VIEWS/inteligencia_view_matriculas_canceladas.sql
SOURCE VIEWS/inteligencia_view_quantidade_reprovacoes_disciplina.sql
SOURCE VIEWS/inteligencia_view_quantidade_solicitacoes_matriculas.sql
SOURCE VIEWS/inteligencia_view_quantidade_turmas_prof.sql
SOURCE VIEWS/inteligencia_view_ultimas_alteracoes_DB.sql
SELECT TABLE_NAME AS 'VIEWS CREATED:' FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIKE 'view_%';
SELECT 'DONE!' AS ' ';

-- -----------------------------------------------------------------------------

SELECT 'CREATEING PROCEDURES...' AS ' ';
SOURCE PROCS/procedure_alterar_status_matricula.sql
SOURCE PROCS/procedure_cancelar_matricula_aluno.sql
SOURCE PROCS/procedure_consulta_dados_cadastrais.sql
SOURCE PROCS/procedure_consulta_situacao_matricula.sql
SOURCE PROCS/procedure_consulta_turmas_disponiveis.sql
SOURCE PROCS/procedure_delete_curso.sql
SOURCE PROCS/procedure_delete_disciplina.sql
SOURCE PROCS/procedure_delete_turma.sql
SOURCE PROCS/procedure_delete_usuario.sql
SOURCE PROCS/procedure_disciplinas_concluidas.sql
SOURCE PROCS/procedure_disciplinas_nao_concluidas.sql
SOURCE PROCS/procedure_inserir_disciplina.sql
SOURCE PROCS/procedure_insert_aluno.sql
SOURCE PROCS/procedure_insert_curso.sql
SOURCE PROCS/procedure_insert_turma.sql
SOURCE PROCS/procedure_login.sql
SOURCE PROCS/procedure_login_retorna_usuario.sql
SOURCE PROCS/procedure_logoff.sql
SOURCE PROCS/procedure_retorna_nome_dia.sql
SOURCE PROCS/procedure_retorna_semestre_atual.sql
SOURCE PROCS/procedure_solicitar_matricula.sql
SOURCE PROCS/procedure_update_aluno.sql
SOURCE PROCS/procedure_update_curso.sql
SOURCE PROCS/procedure_update_disciplina.sql
SOURCE PROCS/procedure_update_turma.sql
SOURCE PROCS/procedure_update_usuario.sql
SELECT 'DONE!' AS ' ';

-- -----------------------------------------------------------------------------
SELECT 'CREATEING TRIGGERS...' AS ' ';
SOURCE TRIGGERS/trigger_alteracoes_delete_curso.sql
SOURCE TRIGGERS/trigger_alteracoes_delete_disciplina.sql
SOURCE TRIGGERS/trigger_alteracoes_delete_matricula.sql
SOURCE TRIGGERS/trigger_alteracoes_delete_turma.sql
SOURCE TRIGGERS/trigger_alteracoes_delete_usuario.sql
SOURCE TRIGGERS/trigger_alteracoes_insert_curso.sql
SOURCE TRIGGERS/trigger_alteracoes_insert_disciplina.sql
SOURCE TRIGGERS/trigger_alteracoes_insert_matricula.sql
SOURCE TRIGGERS/trigger_alteracoes_insert_turma.sql
SOURCE TRIGGERS/trigger_alteracoes_insert_usuario.sql
SOURCE TRIGGERS/trigger_alteracoes_update_curso.sql
SOURCE TRIGGERS/trigger_alteracoes_update_disciplina.sql
SOURCE TRIGGERS/trigger_alteracoes_update_matricula.sql
SOURCE TRIGGERS/trigger_alteracoes_update_turma.sql
SOURCE TRIGGERS/trigger_alteracoes_update_usuario.sql
SOURCE TRIGGERS/trigger_atualiza_disciplina_concluida_update.sql
SOURCE TRIGGERS/trigger_atualiza_turma.sql
SELECT 'DONE!' AS ' ';


SELECT 'CREATING USERS AND PERMISSIONS...' AS ' ';
SOURCE USERS/DB_SISMATRICULA__permissions.SQL
SELECT 'DONE!' AS ' ';