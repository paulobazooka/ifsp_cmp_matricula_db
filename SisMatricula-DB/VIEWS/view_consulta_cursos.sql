-- script para consultar os cursos disponíveis no campus

# ------------------- view consulta para cursos existentes no campus ------------------------
USE SisMatricula;
DROP VIEW IF EXISTS view_consulta_cursos;
CREATE VIEW view_consulta_cursos AS

      select codCurso,
			 nomeCurso,
             siglaCurso,
             dtCurso,
             descricao
      from Curso;       
# -------------------------------------------------------------------------------------------             

