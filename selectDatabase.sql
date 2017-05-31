-- SELECT @@lc_time_names;
-- SET GLOBAL lc_time_names=pt_BR;
-- SET lc_time_names = 'pt_BR';

use SisMatricula;

/*
  ############ Consulta Usuario válido ############
  ***** retornar se o usuario existe ou não no banco de dados
*/
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_login;    -- procedure para retornar se existe o usuario ou não.
DELIMITER $$
CREATE PROCEDURE procedure_login (IN id varchar(25), IN pass varchar(25))
BEGIN
    IF (true = (select true from Usuario where (identificacao = id
                             and senha = md5(pass)))) THEN
        select true from dual; 
        
    ELSE 
        select false from dual;
    END IF;
    
END $$
DELIMITER ;



USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_login_retorna_usuario;    -- procedure para retornar o usuario
DELIMITER $$
CREATE PROCEDURE procedure_login_retorna_usuario (IN id varchar(25), IN pass varchar(25))
BEGIN
   select codUsuario,
	      identificacao,
	      nomeUsuario,                     
	      dataNas,
	      cpf,
	      date(ingresso),
	      email,
	      telefone1,
	      telefone2,
	      codTipoUsuario
   from Usuario   
   where identificacao = id and senha = md5(pass);
END $$
DELIMITER ;

call procedure_login_retorna_usuario('170000011', 'fgh987');




/* ############# Consultas para o Coordenador do Curso ############
   **** Consulta de Solicitações de matrículas
   **** Turmas abertas durante o semestre
   **** Disciplinas relacionadas ao curso
*/

-- Consulta das Turmas abertas por ordem do dia da semana.
select Disciplina.nomeDisciplina as 'Disciplina', Turma.siglaTurma   as 'Turma',
       Horario.diaSemana         as 'Dia',        Horario.horaInicio as 'Inicio',
       Horario.horaTermino       as 'Termino'       
from Disciplina natural join
     Turma      natural join
	 Horario 
where Turma.turmaEncerrada = false 
order by Horario.diaSemana ASC;      
               
               

DROP VIEW IF EXISTS view_solicitacoes_matriculas_coordenador;
CREATE VIEW view_solicitacoes_matriculas_coordenador as             
-- Consulta das solicitações de matrículas
select nomeUsuario as 'Aluno',
       codUsuario as 'codigo Aluno',
       identificacao as 'Prontuário', 
       nomeDisciplina as 'Disciplina',
       siglaTurma as 'Turma',
       descricao as 'Estado'
       
from Usuario natural join 
     Matricula natural join
     Turma natural join
     Disciplina natural join
     EstadoMat
     
where EstadoMat.codEstado = 1
and month(Matricula.dtMatricula) = month(now())
and  year(Matricula.dtMatricula) =  year(now())
order by Usuario.nomeUsuario ASC;
     
     
-- Consulta das disciplinas existentes
select semestre		  as 'Semestre',
       nomeDisciplina as 'Disciplina',
       nomeCurso      as 'Curso'
from Disciplina Natural Join
     CursoDisciplina Natural join
     Curso
order by semestre;






/* ############# Consultas para os Alunos do Curso ############
   **** Consulta de Matrículas no semestre corrente
   **** Consulta de situação de matriculas solicitadas
   **** Turmas abertas durante o semestre
   **** Disciplinas relacionadas ao curso
*/

-- Consulta de Matrículas no semestre corrente 
select siglaTurma as 'Turma', 
       semestreTurma as 'Semestre', 
       anoTurma as 'Ano', 
       nomeDisciplina as 'Disciplina',
       horaInicio as 'Hora Inicio',
       horaTermino as 'Hora Fim'
       
from Disciplina natural join 
     Turma      natural join 
     Matricula  natural join
     Usuario, 
     Horario
     
where (Turma.codTurma = Horario.codTurma AND
       identificacao = '160011111' AND 
       codEstado = 3 and turmaEncerrada = true);


-- Consulta de Turmas para realização de Matriculas
select siglaTurma     as 'Turma', 
       semestreTurma  as 'Semestre', 	
       anoTurma       as 'Ano', 
       nomeDisciplina as 'Disciplina',
       horaInicio     as 'Horario Inicio',
       horaTermino    as 'Horario Termino'
       
from Disciplina natural join 
     Turma      natural join 
     Horario    
     
where (aberto = false);


-- Consulta de Disciplinas relacionadas ao curso
select siglaDisciplina as 'Sigla',
       nomeDisciplina  as 'Disciplina',
       nomeCurso	   as 'Curso'

from Disciplina Natural join
     CursoDisciplina Natural join	
     Curso Order by nomeDisciplina;
     
-- Consulta da situação das Matrículas
select siglaTurma as 'Turma', 
       semestreTurma as 'Semestre', 
       anoTurma as 'Ano', 
       nomeDisciplina as 'Disciplina',
       horaInicio as 'Hora Inicio',
       horaTermino as 'Hora Fim'
       
from Disciplina natural join 
     Turma      natural join 
     Matricula  natural join
     Usuario, 
     Horario
     
where (Turma.codTurma = Horario.codTurma AND
       identificacao = '160011111' AND 
       codEstado = 3 and turmaEncerrada = true);
     