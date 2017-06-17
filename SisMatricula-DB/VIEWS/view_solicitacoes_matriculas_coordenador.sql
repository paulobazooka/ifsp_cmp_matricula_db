 -- script para retornar as solicitações de matriculas feitas pelos alunos afim de deferimento/indeferimento
   
# ------------------- view das solicitações de matrículas feitas pelos alunos ------------------------
USE SisMatricula;
DROP VIEW IF EXISTS view_solicitacoes_matriculas_coordenador;
CREATE VIEW view_solicitacoes_matriculas_coordenador as             

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
     
where EstadoMat.codEstado = 1
and month(Matricula.dtMatricula) = month(now())
and  year(Matricula.dtMatricula) =  year(now())
order by Usuario.nomeUsuario ASC;
# -----------------------------------------------------------------------------------
