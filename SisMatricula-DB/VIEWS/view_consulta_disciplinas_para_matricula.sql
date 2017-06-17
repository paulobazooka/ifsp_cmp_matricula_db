 -- script para consulta de disciplinas/ turmas que estão disponíveis para matrícula  

# ------------------ Consulta de Disciplinas disponíveis gerais para matrícula ------------------
DROP VIEW IF EXISTS view_consulta_disciplinas_para_matricula;
CREATE VIEW view_consulta_disciplinas_para_matricula as
select codTurma,
       siglaTurma, 
       semestreTurma, 	
       anoTurma, 
       codDisciplina,
       nomeDisciplina,
       diaSemana,
       date_format(horaInicio, '%H:%i'),
       date_format(horaTermino,'%H:%i')
       
from Disciplina natural join 
     Turma      natural join 
     Horario    
     
where (Turma.aberto = true AND Turma.turmaEncerrada = FALSE);
# -----------------------------------------------------------------------------------------
