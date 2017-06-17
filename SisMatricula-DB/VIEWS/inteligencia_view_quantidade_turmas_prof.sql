USE SisMatricula;      
drop view if exists inteligencia_view_quantidade_turmas_prof;
create view inteligencia_view_quantidade_turmas_prof as

select u.nomeUsuario as 'Professor',  
       count(t.codTurma) 'Qtd Turmas'
       
from Disciplina d natural join
     Turma t   natural join
     ProfessorTurma p natural join
     Usuario u
                                                   
where  t.turmaEncerrada = 0
group by u.nomeUsuario;  