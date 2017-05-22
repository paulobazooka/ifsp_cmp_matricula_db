-- Consulta das Turmas/Disciplinas ativas aluno --
use SisMatricula;
drop procedure if exists procedure_aluno_turmas_ativas;  -- se existir procedimento, deletar.

DELIMITER $$
CREATE PROCEDURE procedure_aluno_turmas_ativas (in codAluno int) -- entrar com o codigo do aluno
BEGIN
select siglaTurma     as 'Turma',
       nomeDisciplina as 'Disciplina',
       semestre 	  as 'Semestre',
       anoTurma 	  as 'Ano'
from   Disciplina natural join
       Turma      natural join
       Matricula  natural join
       Usuario    natural join
       TipoUsuario
where TipoUsuario.codTipoUsuario = 5   -- tipo de usuário aluno
  AND Usuario.codUsuario = codAluno
  AND concluido = 0;
END $$
DELIMITER ;

call procedure_aluno_turmas_ativas(5);




-- Consulta de disciplinas já concluídas --
use SisMatricula;
drop procedure if exists procedure_aluno_turmas_concluidas;  -- se existir procedimento, deletar.

DELIMITER $$
CREATE PROCEDURE procedure_aluno_turmas_concluidas (in codAluno int) -- entrar com o codigo do aluno
BEGIN
select t.siglaTurma     as 'Turma',
       d.nomeDisciplina as 'Disciplina',
       d.semestre 	  as 'Semestre',
       t.anoTurma 	  as 'Ano'
       
from   Disciplina d natural join
       Turma      t natural join
       DisciplinaConcluida dc natural join
       Usuario  u   natural join
       TipoUsuario tp
       
       
where  tp.codTipoUsuario = 5
  and  u.codUsuario = codAluno;
END $$
DELIMITER ;

call procedure_aluno_turmas_concluidas(5);




-- Consultar dados Aluno --
use SisMatricula;
drop procedure if exists procedure_aluno_retorna_dados;

DELIMITER $$
CREATE PROCEDURE procedure_aluno_retorna_dados(in codAluno int) -- entrar com o codigo do aluno
BEGIN
select identificacao 					 as 'Prontuário',
       nomeUsuario   					 as 'Aluno',
       date_format(dataNas, '%d/%m/%Y')  as 'Data Nascimento',
       cpf			                     as 'CPF',
       date_format(ingresso, '%d/%m/%Y') as 'Ingresso',
       email		 					 as 'e-mail',
       telefone1     					 as 'Telefone 1',
       telefone2     				     as 'Telefone 2'
from Usuario 
     
where codUsuario = codAluno;     
END $$
DELIMITER ;

call procedure_aluno_retorna_dados(6);