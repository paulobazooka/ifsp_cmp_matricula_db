-- relação de quantos alunos desistiram de matriculas em turmas abertas -- Evasão

USE SisMatricula;      
drop view if exists inteligencia_view_matriculas_canceladas;
create view inteligencia_view_matriculas_canceladas as 
select codMatricula   as 'Codigo Matricula',
	   codUsuario     as 'Codigo Aluno',
	   nomeUsuario    as 'Aluno',       
       identificacao  as 'Prontuário', 
       nomeDisciplina as 'Disciplina',
       codTurma       as 'Codigo Turma',
       siglaTurma     as 'Turma',
       descricao      as 'Estado'
       
from Usuario natural join 
     Matricula natural join
     Turma natural join
     Disciplina natural join
     EstadoMat
     
where EstadoMat.codEstado = 4 AND
      Turma.turmaEncerrada = false
order by Usuario.nomeUsuario ASC;