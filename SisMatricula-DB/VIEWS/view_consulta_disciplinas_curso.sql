-- script para consultar as discipinas relacionadas aos cursos 

# ---------------- view para consultar as disciplinas relacionadas ao curso ----------------
DROP VIEW IF EXISTS view_consulta_disciplinas_curso;
CREATE VIEW view_consulta_disciplinas_curso as
select codDisciplina   as 'Codigo',
       siglaDisciplina as 'Sigla',
       nomeDisciplina  as 'Disciplina',
       nomeCurso	   as 'Curso'

from Disciplina Natural join
     CursoDisciplina Natural join	
     Curso Order by nomeDisciplina;
# ------------------------------------------------------------------------------------------     