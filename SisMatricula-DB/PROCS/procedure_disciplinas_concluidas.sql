# ------------------------- procedure disciplinas concluídas -------------------------------   
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_disciplinas_concluidas;
DELIMITER $$
CREATE PROCEDURE procedure_disciplinas_concluidas(IN codAluno int) 
BEGIN
      select codDisciplina  as 'Codigo',
             nomeDisciplina as 'Disciplina',
             siglaTurma     as 'Turma',
             semestre       as 'Semestre',
             anoTurma       as 'Ano'
       
      from Disciplina natural join
           Turma      natural join
           Usuario    natural join
           DisciplinaConcluida
      
      where (codUsuario = codAluno) order by codDisciplina;

END $$
DELIMITER ;
# ------------------------------------------------------------------------------------------