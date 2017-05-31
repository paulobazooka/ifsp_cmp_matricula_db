 /*SELECT @@lc_time_names;
   SET GLOBAL lc_time_names=pt_BR;
   SET lc_time_names = 'pt_BR';
   SELECT @@lc_time_names;
*/


# ----------------- Procedure para retornar o semestre atual ---------------------
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_retorna_semestre_atual;
DELIMITER $$
CREATE PROCEDURE procedure_retorna_semestre_atual() 
BEGIN

    if(select (month(now())/6) > 1) THEN
       select 2; 
    else
       select 1;    
    end if;

END $$
DELIMITER ;  -- call procedure_retorna_semestre_atual();
# --------------------------------------------------------------------------------





# ----------------- Procedure para retornar o nome do dia da semana ---------------------
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_retorna_nome_dia;
DELIMITER $$
CREATE PROCEDURE procedure_retorna_nome_dia(IN dia INT) 
BEGIN
    
    if(dia <8 && dia > 0) THEN
       if (dia = 1) then select 'Domingo';
		 elseif (dia = 2) then select 'Segunda-Feira';
            elseif (dia = 3) then select 'Terça-Feira';
               elseif (dia = 4) then select 'Quarta-Feira';
                  elseif (dia = 5) then select 'Quinta-Feira';
                     elseif (dia = 6) then select 'Sexta-Feira';
                        elseif (dia = 7) then select 'Sabado-Feira';
	   end if;
    end if;

END $$
DELIMITER ;  -- call procedure_retorna_nome_dia(3);
# --------------------------------------------------------------------------------





# ------------------------------ Consulta Usuario válido ----------------------------------
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
DELIMITER ;   -- call procedure_login('170000011', 'fgh987');
# --------------------------------------------------------------------------------------------
 




# ------------------ Procedure retornar os dados do Aluno/Usuario logado ---------------------------
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
DELIMITER ; -- call procedure_login_retorna_usuario('170000011', 'fgh987');
# --------------------------------------------------------------------------------------------------





# ------------------ view das Turmas abertas por ordem do dia da semana ----------------------------
USE SisMatricula;
DROP VIEW IF EXISTS view_turmas_abertas;
CREATE VIEW view_turmas_abertas as

select Turma.codTurma            as 'Codigo',
       Turma.siglaTurma          as 'Turma', 
       Disciplina.nomeDisciplina as 'Disciplina', 
       Horario.diaSemana         as 'Dia', 
       Horario.horaInicio        as 'Inicio',
       Horario.horaTermino       as 'Termino' 
       
from Disciplina natural join
     Turma      natural join
	 Horario 
     
where Turma.turmaEncerrada = false order by Horario.diaSemana ASC;      
# ----------------------------------------------------------------------------------------------------               
   
   
   
   
   
# ------------------- view das solicitações de matrículas feitas pelos alunos ------------------------
DROP VIEW IF EXISTS view_solicitacoes_matriculas_coordenador;
CREATE VIEW view_solicitacoes_matriculas_coordenador as             

select codUsuario as 'codigo Aluno',
	   nomeUsuario as 'Aluno',       
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
# -----------------------------------------------------------------------------------

     
     
     
     
# ------------------------- procedure disciplinas concluídas -------------------------------   
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_disciplinas_concluidas;
DELIMITER $$
CREATE PROCEDURE procedure_disciplinas_concluidas(IN codAluno int) 
BEGIN
      select nomeDisciplina as 'Disciplina',
             siglaTurma     as 'Turma',
             semestre       as 'Semestre',
             anoTurma       as 'Ano'
       
      from Disciplina natural join
           Turma      natural join
           Usuario    natural join
           DisciplinaConcluida
      
      where (codUsuario = codAluno);

END $$
DELIMITER ;
# ------------------------------------------------------------------------------------------





# ------------------------- procedure disciplinas não concluidas -------------------------------   
/*USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_disciplinas_nao_concluidas;
DELIMITER $$
CREATE PROCEDURE procedure_disciplinas_Nao_concluidas(IN codAluno int) 
BEGIN
      select codDisciplina  as 'Codigo',
             nomeDisciplina as 'Disciplina'            
            
       
      from Disciplina natural join
           Curso natural join
           Usuario
      
      where (
      codUsuario = 29 
      AND codDisciplina if not exists (select codDisciplina, siglaTurma from Turma natural join Usuario natural join DisciplinaConcluida where codUsuario = 5));

END $$
DELIMITER ;*/
# ------------------------------------------------------------------------------------------








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
       codEstado = 1);
     