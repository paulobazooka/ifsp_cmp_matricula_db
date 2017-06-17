
USE SisMatricula;      
drop view if exists inteligencia_view_quantidade_reprovacoes_disciplina;
create view inteligencia_view_quantidade_reprovacoes_disciplina as

select d.nomeDisciplina as 'Disciplina',  
       count(m.concluido) 'Quantidade Reprovações'
       
from Disciplina d natural join
     Turma t natural join
     Matricula m 
                                                   
where  t.turmaEncerrada = true and
	   m.concluido = 0
      
group by d.nomeDisciplina;  