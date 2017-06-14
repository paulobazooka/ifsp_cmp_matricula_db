
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
DELIMITER ;  
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
DELIMITER ;  
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
DELIMITER ; 
# --------------------------------------------------------------------------------------------------




# ---------------------- procedure para consultar dados cadastrais ----------------------------------
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_consulta_dados_cadastrais;
DELIMITER $$
CREATE PROCEDURE procedure_consulta_dados_cadastrais(IN codusuario INT) 
BEGIN
     select codUsuario,
		    identificacao,
		    nomeUsuario, 					 
		    dataNas,
            cpf,
            ingresso,
            email,
            telefone1,
            telefone2,
            codTipoUsuario
      from Usuario
      where codUsuario = codusuario;        
END $$
DELIMITER ;
# --------------------------------------------------------------------------------



-- Inserir novo Aluno
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_insert_aluno;
DELIMITER $$
CREATE PROCEDURE procedure_insert_aluno(IN id varchar(20),
                                             IN nome varchar(75),
                                             IN sen varchar(50),
                                             IN data_nas date,
                                             IN CPF bigint,
                                             IN ing date,
                                             IN em varchar(50),
                                             IN tel1 varchar(15),
                                             IN tel2 varchar(15))

BEGIN
  
  START TRANSACTION;
  INSERT INTO Usuario(identificacao, nomeUsuario, senha, dataNas, cpf, ingresso, 
                                    email, telefone1, telefone2, codTipoUsuario) VALUES
                      (id, nome, MD5(sen), data_nas, CPF, ing, em, tel1, tel2, 5);            
  
  IF (id = (select identificacao from Usuario ORDER BY codUsuario DESC LIMIT 1)) THEN
	COMMIT;
    SELECT true from dual;
  ELSE
    ROLLBACK;
    SELECT false from dual;
  END IF; 
     
END $$
                                             
DELIMITER ;       




-- alterar aluno geral
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_update_aluno;
DELIMITER $$
CREATE PROCEDURE procedure_update_aluno(IN cod int,										
									    IN nome varchar(75),										
										IN data_nas date,																		
										IN em varchar(50),
										IN tel1 varchar(15),
										IN tel2 varchar(15))

BEGIN
  
  START TRANSACTION;
  
  UPDATE Usuario SET nomeUsuario = nome, dataNas = data_nas, email = em,
                          telefone1 = tel1, telefone2 = tel2 WHERE codUsuario = cod; 
                                  
  IF (nome = (select nome from Usuario where codUsuario = cod) AND
	  data_nas = (select dataNas from Usuario where codUsuario = cod) AND
      em = (select email from Usuario where codUsuario = cod) AND
	  tel1 = (select telefone1 from Usuario where codUsuario = cod) AND
      tel2 = (select telefone2 from Usuario where codUsuario = cod))        THEN
      
	COMMIT;
    SELECT true from dual;
    
  ELSE
    ROLLBACK;
    SELECT false from dual;
  END IF; 
     
END $$
                                             
DELIMITER ;     



-- delete usuario geral
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_delete_usuario;
DELIMITER $$
CREATE PROCEDURE procedure_delete_usuario(IN cod int)

BEGIN
  
  START TRANSACTION;
  
  DELETE FROM Usuario WHERE codUsuario = cod; 
                                  
  IF ((select codUsuario from Usuario where codUsuario = cod) is null) THEN      
 	  COMMIT;
      SELECT true from dual;
    
  ELSE
    ROLLBACK;
    SELECT false from dual;
  END IF; 
     
END $$
                                             
DELIMITER ;                                                                                             



-- Inserir novo curso
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_insert_curso;
DELIMITER $$
CREATE PROCEDURE procedure_insert_curso(IN nome VARCHAR(100), 
									    IN sigl VARCHAR(10), 
										IN dtcriacao DATE,
                                        IN descr TEXT)

BEGIN
   
      START TRANSACTION;  
  INSERT INTO Curso (nomeCurso, siglaCurso, dtCurso, descricao) VALUES
                    (nome, sigl, dtcriacao, descr);  
                                  
  IF (nome = (select nomeCurso from Curso ORDER BY codCurso DESC LIMIT 1)) THEN      
 	  COMMIT;
      SELECT true from dual;
    
  ELSE
      ROLLBACK;
    SELECT false from dual;
  END IF; 
     
END $$
                                             
DELIMITER ; 




-- Alterar Curso --
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_update_curso;
DELIMITER $$
CREATE PROCEDURE procedure_update_curso(IN cod INT,
                                        IN nome VARCHAR(100), 
									    IN sigl VARCHAR(10), 
										IN dtcriacao DATE,
                                        IN descr TEXT)

BEGIN
   
      START TRANSACTION;  
  UPDATE Curso SET nomeCurso = nome, siglaCurso = sigl, dtCurso = dtcriacao, descricao = descricao
               WHERE codCurso = cod;
  
  IF (nome = (select nomeCurso from Curso WHERE codCurso = cod)  AND
      sigl = (select siglaCurso from Curso WHERE codCurso = cod) AND
      dtcriacao = (select dtCurso from Curso WHERE codCurso = cod) AND
      descr = (select descricao from Curso WHERE codCurso = cod)) THEN      
 	  COMMIT;
      SELECT true from dual;
    
  ELSE
      ROLLBACK;
    SELECT false from dual;
  END IF; 
     
END $$
                                             
DELIMITER ;



-- deletar curso
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_delete_curso;
DELIMITER $$
CREATE PROCEDURE procedure_delete_curso(IN cod int)

BEGIN
  
  START TRANSACTION;
  
  DELETE FROM Curso WHERE codCurso = cod; 
                                  
  IF ((select codCurso from Curso where codCurso = cod) is null) THEN      
 	  COMMIT;
      SELECT true from dual;
    
  ELSE
    ROLLBACK;
    SELECT false from dual;
  END IF; 
     
END $$
                                             
DELIMITER ;                                                                                             


-- criar disciplina
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_inserir_disciplina;
DELIMITER $$
CREATE PROCEDURE procedure_inserir_disciplina(IN nome VARCHAR(100), IN sigla VARCHAR(6), IN semest INT, IN horas INT, IN ement TEXT)
BEGIN
     
     START TRANSACTION;
     INSERT INTO Disciplina (nomeDisciplina, 
							 semestre,						                    						
							 siglaDisciplina,                        
							 totalHoras,
							 ementa) VALUES                             
                             (nome, semest, sigla, horas, ement);
                                  
  IF (nome = (select nomeDisciplina from Disciplina ORDER BY codDisciplina DESC LIMIT 1)) THEN      
 	  COMMIT;
      SELECT true from dual;    
  ELSE
      ROLLBACK;
      SELECT false from dual;
  END IF; 

END $$
DELIMITER ;




-- Alterar Curso --
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_update_disciplina;
DELIMITER $$
CREATE PROCEDURE procedure_update_disciplina(IN cod INT, IN nome VARCHAR(100), IN sigla VARCHAR(6), IN semest INT, IN horas INT, IN ement TEXT)
                                       
BEGIN
   
      START TRANSACTION;  
      UPDATE Disciplina SET nomeDisciplina = nome, siglaDisciplina = sigl, 
             semestre = semest, totalHoras = horas, ementa = ement
	  WHERE codDisciplina = cod;
  
  IF (nome = (select nomeDisciplina from Disciplina WHERE codDisciplina = cod)  AND
      sigl = (select siglaDisciplina from Disciplina WHERE codDisciplina = cod) AND
      semest = (select semestre from Disciplina WHERE codDisciplina = cod) AND
      horas = (select totalHoras from Disciplina WHERE codDisciplina = cod) AND
      ement = (select ementa from Disciplina WHERE codDisciplina = cod)) THEN      
 	  COMMIT;
      SELECT true from dual;    
  ELSE
      ROLLBACK;
      SELECT false from dual;
  END IF; 
     
END $$
                                             
DELIMITER ;



-- Deletar Disciplina
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_delete_disciplina;
DELIMITER $$
CREATE PROCEDURE procedure_delete_disciplina(IN cod int)
BEGIN
  
  START TRANSACTION;  
  DELETE FROM Disciplina WHERE codDisciplina = cod; 
                                  
  IF ((select codDisciplina from Disciplina where codDisciplina = cod) is null) THEN      
 	  COMMIT;
      SELECT true from dual;    
  ELSE
      ROLLBACK;
      SELECT false from dual;
  END IF; 
     
END $$                                             
DELIMITER ;   



-- Criar Turma 
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_insert_turma;
DELIMITER $$
CREATE PROCEDURE procedure_insert_turma(IN sigl VARCHAR(10), 
										IN codCur INT, 
                                        IN codDisc INT,
										IN anoT INT,
                                        IN semestre INT,
                                        IN codTur INT,
                                        IN num_vagas INT,
									    IN diaSema VARCHAR(20),
                                        IN horaIN time,
                                        IN horaFIM time)

BEGIN
DECLARE codigo_turma INT;
   
      START TRANSACTION;  
  INSERT INTO Turma (siglaTurma, codCurso, codDisciplina, anoTurma, semestreTurma, codTurno, 
                     vagas, matriculasRealizadas, turmaEncerrada, aberto) VALUES
                    (sigl, codCur, codDisc, anoT, semestre, codTur, num_vagas, 0, false, true); 

  
  SET codigo_turma = (select codTurma from Turma ORDER BY codTurma DESC LIMIT 1);
  
  INSERT INTO Horario(codTurma, diaSemana, horaInicio, horaTermino) VALUES 
                     (codigo_turma, diaSema, horaIN, horaFIM);                   
                                  
  IF (sigl = (select siglaTurma from Turma ORDER BY codTurma DESC LIMIT 1)) THEN      
 	  COMMIT;
      SELECT true from dual;    
  ELSE
      ROLLBACK;
      SELECT false from dual;
  END IF; 
     
END $$
DELIMITER ;





-- Alterar Turma --
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_update_turma;
DELIMITER $$
CREATE PROCEDURE procedure_update_turma(IN cod INT, 
                                        IN sigl VARCHAR(10), 
										IN codCur INT, 
                                        IN codDisc INT,
										IN anoT INT,
                                        IN semestre INT,
                                        IN codTur INT,
                                        IN num_vagas INT,
									    IN diaSema VARCHAR(20),
                                        IN horaIN time,
                                        IN horaFIM time)
                                       
BEGIN
   
      START TRANSACTION;      
      UPDATE Turma SET siglaTurma = sigl, codCurso = codCur, codDisciplina = codDisc, anoTurma = anoT, 
             semestreTurma = semestre, codTurno = codTur, vagas = num_vagas
	  WHERE codTurma = cod;
      
      UPDATE Horario SET diaSemana = diaSema, horaInicio = horaIN, horaTermino = horaFIM
      WHERE codTurma = cod;
      
  IF (sigl = (select siglaTurma from Turma WHERE codTurma = cod)  AND
      codCur = (select codCurso from Turma WHERE codTurma = cod) AND
      anoT = (select anoTurma from Turma WHERE codTurma = cod) AND
      codTur = (select codTurno from Turma WHERE codTurma = cod) AND
      num_vagas = (select vagas from Turma WHERE codTurma = cod) AND
      diaSema = (select diaSemana from Horario WHERE codTurma = cod) AND
      horaIN = (select horaInicio from Horario WHERE codTurma = cod) AND
      horaFIM = (select horaTermino from Horario WHERE codTurma = cod)) THEN      
 	  COMMIT;
      SELECT true from dual;    
  ELSE
      ROLLBACK;
      SELECT false from dual;
  END IF; 
     
END $$                                             
DELIMITER ; 




-- Deletar Turma  
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_delete_turma;
DELIMITER $$
CREATE PROCEDURE procedure_delete_turma(IN cod int)
BEGIN
  
  START TRANSACTION;  
  DELETE FROM Turma   WHERE codTurma = cod;
  DELETE FROM Horario WHERE codTurma = cod;
                                  
  IF ((select codTurma from Turma where codTurma = cod is null)   AND
	 (select codTurma from Horario where codTurma = cod is null)) THEN      
 	  COMMIT;
      SELECT true from dual;    
  ELSE
      ROLLBACK;
      SELECT false from dual;
  END IF; 
     
END $$                                             
DELIMITER ;    


-- solicitar matricula
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_solicitar_matricula;
DELIMITER $$
CREATE PROCEDURE procedure_solicitar_matricula(IN codTur INT, IN codAluno INT)
BEGIN
    
    START TRANSACTION;  
    INSERT INTO Matricula(codTurma, codUsuario) VALUES (codTur, codAluno);
    
    IF (codAluno = (select codUsuario from Matricula order by codMatricula DESC LIMIT 1) AND
        codTur = (select codTurma from Matricula order by codMatricula DESC LIMIT 1)) THEN       
        COMMIT;
        select true from dual;
    ELSE    
        ROLLBACK;
        select false from dual;
    END IF;
    
    
END $$
DELIMITER ;

 
 
 
-- Alterar status matricula
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_alterar_status_matricula;
DELIMITER $$
CREATE PROCEDURE procedure_alterar_status_matricula(IN cod INT, IN estado INT)
BEGIN
    
    START TRANSACTION;  
    UPDATE Matricula SET EstadoMat = estado WHERE cod = codMatricula;
    
    IF (estado = (select estadoMat from Matricula where cod = codMatricula)) THEN       
        COMMIT;
        select true from dual;
    ELSE    
        ROLLBACK;
        select false from dual;
    END IF;
    
    
END $$
DELIMITER ;




-- cancelar matricula aluno
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_cancelar_matricula_aluno;
DELIMITER $$
CREATE PROCEDURE procedure_cancelar_matricula_aluno(IN cod INT, IN codAluno INT)
BEGIN
    
    START TRANSACTION;  
    UPDATE Matricula SET EstadoMat = 4 WHERE cod = codMatricula AND codAluno = codUsuario;
    
    IF (estado = (select estadoMat from Matricula where cod = codMatricula)) THEN       
        COMMIT;
        select true from dual;
    ELSE    
        ROLLBACK;
        select false from dual;
    END IF;
    
END $$
DELIMITER ;

     
     
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
DROP PROCEDURE IF EXISTS procedure_consulta_turmas_disponiveis;
DELIMITER $$
CREATE PROCEDURE procedure_consulta_turmas_disponiveis(IN codAluno INT)
PRINCIPAL: BEGIN 
     
     -- Cria tabela que irá associar as turmas abertas com as disciplinas de pre requisitos
	 drop temporary table if exists tbtemporaria;
	 create temporary table tbtemporaria 
		    select t.codDisciplina, 
                   t.codTurma, 
                   r.preRequisito 
			from      view_consulta_disciplinas_para_matricula t 
            left join DisciplinaPreRequisitos r
                      on t.codDisciplina = r.codDisciplina 
                      order by t.codDisciplina ASC;
                      
                      
     -- Cria tabela de cada disciplina com seus pre requisitos
     drop temporary table if exists tabelinharequisitos;
     create temporary table tabelinharequisitos select t.codDisciplina, 
											           t.codTurma, 
											           r.preRequisito        
										 from      view_consulta_disciplinas_para_matricula t 
										 inner join DisciplinaPreRequisitos r

										 on t.codDisciplina = r.codDisciplina; 
										 
                                           
     BLOCO1: BEGIN
		DECLARE fim    INT DEFAULT 0;  
        DECLARE fim2   INT DEFAULT 0; 
		DECLARE codDis INT;
		DECLARE codPre INT;
        DECLARE codT   INT;
		DECLARE flag   INT DEFAULT 0;
        
		DECLARE _cursor1 CURSOR FOR select * from tbtemporaria; 
		
		DECLARE CONTINUE handler  -- senão encontrar mais linha, setar fim como true para sair do loop
		          FOR NOT found SET fim = 1;  
                  
	    drop temporary table if exists TurmasParaMatricula;
        CREATE TEMPORARY TABLE TurmasParaMatricula(codTurma INT);
		
        OPEN _cursor1;        
              LP1: LOOP
                 FETCH _cursor1 INTO codDis, codT, codPre;
                    IF (fim) THEN
                      LEAVE LP1;
                    ELSE
                        IF (codPre is null) THEN
                           INSERT INTO TurmasParaMatricula (codTurma) VALUES (codT);
                        ELSE
                           BLOCO2: BEGIN
                                                     
                           DECLARE codRequi INT;
                           DECLARE codTur  INT;
                           DECLARE codDis2  INT;
                           
                           DECLARE _cursor2 CURSOR FOR select * from tabelinharequisitos where codDisciplina = codDis;
                           DECLARE CONTINUE handler  -- senão encontrar mais linha, setar fim como true para sair do loop
		                           FOR NOT found SET fim2 = 1; 
                                
                                OPEN _cursor2;   
								LP2: LOOP
								FETCH _cursor2 INTO codDis2, codTur, codRequi;
                                    IF(fim2) THEN 
                                      LEAVE LP2;
                                    ELSE 
                                       IF((select codDisciplina from Disciplina natural join Turma natural join DisciplinaConcluida natural join Usuario
                                                    where codUsuario = codAluno and codDisciplina = codRequi) is not null) THEN
                                          SET flag = 1;                                          
                                       ELSE
                                          SET flag = 0;
                                       END IF;
                                    END IF;                                
								END LOOP LP2; 
                                   
                           CLOSE _cursor2;     
                           END BLOCO2;
                           SET fim2 = 0;
                           
						          IF(flag = 1) THEN
									 SET flag = 0;
									 insert into TurmasParaMatricula VALUES (codT); 
								  END IF;
                        END IF;   
                    END IF;
              END LOOP LP1;
	    CLOSE _cursor1;
  
     END BLOCO1;
     
 select codTurma from TurmasParaMatricula;

DROP TEMPORARY TABLE tabelinharequisitos;  
DROP TEMPORARY TABLE tbtemporaria;
DROP TEMPORARY TABLE TurmasParaMatricula;                     

END PRINCIPAL $$
DELIMITER ;
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
DELIMITER ;       
# -----------------------------------------------------------------------------  

                               