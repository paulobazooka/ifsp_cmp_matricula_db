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
DELIMITER ;  
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

select Turma.codTurma,
       Turma.siglaTurma, 
       codDisciplina,
       Disciplina.nomeDisciplina, 
       Horario.diaSemana, 
       date_format(horaInicio, '%H:%i'),
       date_format(horaTermino,'%H:%i')
       
from Disciplina natural join
     Turma      natural join
	 Horario                                  
                                                   
where Turma.turmaEncerrada = false
          and Turma.aberto = true 
                             order by nomeDisciplina ASC;      
# ----------------------------------------------------------------------------------------------------               
   
   
   
   
   
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

     
     
     
     
# ------------------------- procedure disciplinas concluídas -------------------------------   
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_disciplinas_concluidas;
DELIMITER $$
CREATE PROCEDURE procedure_disciplinas_concluidas(IN codAluno int) 
BEGIN
      select codDisciplina  as 'Codigo',
             nomeDisciplina as 'Disciplina',
             siglaTurma     as 'Turma',
             semestre       as 'Semestre',
             anoTurma       as 'Ano'
       
      from Disciplina natural join
           Turma      natural join
           Usuario    natural join
           DisciplinaConcluida
      
      where (codUsuario = codAluno) order by codDisciplina;

END $$
DELIMITER ;
# ------------------------------------------------------------------------------------------





# ------------------------- procedure disciplinas não concluidas -------------------------------   
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_disciplinas_nao_concluidas;
DELIMITER $$
CREATE PROCEDURE procedure_disciplinas_nao_concluidas(IN codAluno int, IN codCursoAluno int) 

PRINCIPAL: BEGIN
  
  DECLARE fim  INT DEFAULT 0;  -- declaração variável que controla o fim do loop
  DECLARE fim2 INT DEFAULT 0;  -- declaração variável que controla o fim do loop
  DECLARE var_cursor  INT;
  DECLARE var_cursor2 INT;
  
  
  
  -- Declaração do segundo cursor
  DECLARE _cursor CURSOR FOR  -- cursor irá apontar pra todas as disciplinas do curso em que o aluno está matriculado
     select codDisciplina     
     from   CursoDisciplina
     where (codCurso = codCursoAluno);
     
     
     
  -- Declaração do primeiro cursor
  DECLARE _cursor2 CURSOR FOR     -- declaração de cursor que irá olhar codDisciplina linha por linha e verificar qual foi concluida
     select d.codDisciplina
     
     from  Disciplina d inner join
		   Turma t     inner join
		   DisciplinaConcluida dc inner join
		   Usuario u  
	       
	 where (u.codUsuario = codAluno AND
            u.codUsuario = dc.codUsuario AND
            dc.codTurma = t.codTurma AND
            t.codDisciplina = d.codDisciplina);
  
  
  DROP TEMPORARY TABLE IF EXISTS TabelaTemporaria;
    CREATE TEMPORARY TABLE TabelaTemporaria (codDisciplinaTemp int);  -- criar tabela temporararia para armazenar as disciplinas não concluidas
   
   
   
  BLOCO_1: BEGIN
  DECLARE CONTINUE handler  -- senão encontrar mais linha, setar fim como true para sair do loop
	 FOR NOT found SET fim = 1;  
  OPEN _cursor;      
		COP_TAB: LOOP          
           FETCH _cursor INTO var_cursor;           
                IF (fim) THEN                   		
		           LEAVE COP_TAB;			   
               ELSE
                   insert into TabelaTemporaria VALUES (var_cursor); 
               END IF;    
		END LOOP COP_TAB;			
  CLOSE _cursor;
  END BLOCO_1;
  
  
  
  BLOCO_2: BEGIN
  DECLARE CONTINUE handler  -- senão encontrar mais linha, setar fim como true para sair do loop
	 FOR NOT found SET fim2 = 1;  
  OPEN _cursor2;
        DEL_TAB: LOOP
           FETCH _cursor2 INTO var_cursor2;
                IF (fim2) THEN                   		
		           LEAVE DEL_TAB;			   
                ELSE
                   delete from TabelaTemporaria where (codDisciplinaTemp = var_cursor2);
                END IF;   
        END LOOP DEL_TAB;           
  CLOSE _cursor2;
  END BLOCO_2;
  
  
  
  select codDisciplinaTemp as 'Codigo',
         siglaDisciplina   as 'Sigla', 
		 nomeDisciplina    as 'Disciplina' 
  from TabelaTemporaria, Disciplina
  where codDisciplina = codDisciplinaTemp;
  
  DROP TEMPORARY TABLE TabelaTemporaria;
                                
END PRINCIPAL $$
DELIMITER ;
# ------------------------------------------------------------------------------------------





# ------------------- Consulta de turmas abertas disponíveis para matrícula ---------------- 
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_consulta_turmas_disponíveis;
DELIMITER $$
CREATE PROCEDURE procedure_consulta_turmas_disponíveis(IN codAluno INT)
PRINCIPAL: BEGIN 

  drop temporary table if exists tbtemporaria;
	 create temporary table tbtemporaria 
		    select t.codDisciplina, 
                   t.nomeDisciplina, 
                   r.preRequisito 
			from      view_consulta_disciplinas_para_matricula t 
            left join DisciplinaPreRequisitos r
                      on t.codDisciplina = r.codDisciplina 
                      order by t.codDisciplina ASC;
                      
                      
    BLOCO1: BEGIN
		DECLARE fim    INT DEFAULT 0;
		DECLARE codDis INT;
		DECLARE codPre INT;
		
		DECLARE _cursor1 CURSOR FOR select t.codDisciplina, r.preRequisito from tbtemporaria; 
		
		DECLARE CONTINUE handler  -- senão encontrar mais linha, setar fim como true para sair do loop
		          FOR NOT found SET fim = 1;  
	
    
		OPEN _cursor1;
        
              LP1: LOOP
                 FETCH _cursor1 INTO codDis, codPre;
                    IF(fim) THEN
                      LEAVE LP1;
                    END IF;  
              END LOOP LP1;
				
	    CLOSE _cursor1;
  
     END BLOCO1;
  
drop temporary table if exists tbtemporaria;                     

END PRINCIPAL $$
DELIMITER ;
# ------------------------------------------------------------------------------------------






/* ############# Consultas para os Alunos do Curso ############
   **** Consulta de Matrículas no semestre corrente
   **** Consulta de situação de matriculas solicitadas
   **** Turmas abertas durante o semestre
   **** Disciplinas relacionadas ao curso
*/



# ------------------ Consulta de Disciplinas disponíveis para matrícula ------------------
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





# ---------------- view para consultar as disciplinas relacionadas ao curso ----------------
DROP VIEW IF EXISTS view_consulta_disciplinas_curso;
CREATE VIEW view_consulta_disciplinas_curso as
select codDisciplina   as 'Codigo',
       siglaDisciplina as 'Sigla',
       nomeDisciplina  as 'Disciplina',
       nomeCurso	   as 'Curso'

from Disciplina Natural join
     CursoDisciplina Natural join	
     Curso Order by nomeDisciplina;
# ------------------------------------------------------------------------------------------     
     
  
  
  
     
# --------------- procedure para consultar a situação da matricula do aluno -------------------     
DROP PROCEDURE IF EXISTS procedure_consulta_situacao_matricula;
DELIMITER $$
CREATE PROCEDURE procedure_consulta_situacao_matricula(IN codAluno int)
BEGIN 
select siglaTurma        as 'Turma', 
       semestreTurma     as 'Semestre', 
       anoTurma          as 'Ano', 
       nomeDisciplina    as 'Disciplina',
       Horario.diaSemana as 'Dia',
       date_format(horaInicio, '%H:%i') as 'Hora Inicio',
       date_format(horaTermino,'%H:%i') as 'Hora Fim',
       descricao         as 'Situação'
       
from Disciplina natural join 
     Turma      natural join 
     Matricula  natural join
     Usuario, 
     Horario,
     EstadoMat
     
where (Turma.codTurma = Horario.codTurma AND
       codUsuario = codAluno             AND 
       Matricula.codUsuario = codAluno   AND
       Matricula.concluido = false       AND
       Turma.aberto = true               AND
       EstadoMat.codEstado = Matricula.codEstado);
END $$
DELIMITER ;       -- call procedure_consulta_situacao_matricula(5);
# -----------------------------------------------------------------------------  



