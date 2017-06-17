USE SisMatricula;      
drop view if exists inteligencia_view_quantidade_solicitacoes_matriculas;
create view inteligencia_view_quantidade_solicitacoes_matriculas as

select u.nomeUsuario as 'Aluno',  
       count(m.codMatricula) 'Qtd Solicitações'
       
from Turma t natural join
     Matricula m natural join
     Usuario u
                                                   
where  t.turmaEncerrada = 0
     and codEstado = 1
group by u.nomeUsuario;  