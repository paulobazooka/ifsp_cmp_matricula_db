-- script para consulta das turmas abertas por ordem do dia da semana (alfabética)

# ------------------ view das Turmas abertas por ordem do dia da semana ----------------------------
USE SisMatricula;
DROP VIEW IF EXISTS view_consulta_turmas_abertas;
CREATE VIEW view_consulta_turmas_abertas as

select t.codTurma,
	   t.siglaTurma, 
	   t.codDisciplina,
	   d.nomeDisciplina, 
       h.diaSemana, 
	   date_format(h.horaInicio, '%H:%i'),
	   date_format(h.horaTermino,'%H:%i'),
       u.nomeUsuario
       
from Disciplina d natural join
     Turma t   natural join
	 Horario h,
     Turma t2 natural join
     ProfessorTurma p natural join
     Usuario u
                                                   
where    t.turmaEncerrada = 0
          and t.aberto = 1 
          and t.codTurma = p.codTurma
          and t2.codTurma = t.codTurma
                             order by d.nomeDisciplina ASC;     
# ---------------------------------------------------------------------------------------------------- 