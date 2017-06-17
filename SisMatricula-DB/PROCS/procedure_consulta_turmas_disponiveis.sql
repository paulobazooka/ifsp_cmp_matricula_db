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
     
create temporary table T1 
select tm.codTurma, 
	   t.siglaTurma, 
       d.nomeDisciplina, 
       u.nomeUsuario as 'professor1',
       u.nomeUsuario as 'professor2',
       h.diaSemana, 
	   concat(date_format(h.horaInicio, '%H-'),date_format(h.horaTermino,'%H')) as 'horario' 
from TurmasParaMatricula tm natural join
	 Turma t natural join 
     Disciplina d, 
     Horario h, 
     Usuario u,
     
     ProfessorTurma p
where t.codTurma = h.codTurma AND 
      t.codTurma = p.codTurma AND 
      p.codUsuario = u.codUsuario 
order by t.codTurma;
       

   
       BLOCO2: BEGIN
       DECLARE prof1 VARCHAR(100);
       DECLARE prof2 VARCHAR(100);
       DECLARE cod   INT;
       DECLARE _fim int default 0;
       
	   DECLARE _cur CURSOR FOR select codTurma from T1; 
		
	   DECLARE CONTINUE handler  -- senão encontrar mais linha, setar fim como true para sair do loop
		          FOR NOT found SET _fim = 1;        
       
                           OPEN _cur;   
								
                                LP3: LOOP
								FETCH _cur INTO cod;
                                    
                                    IF(_fim) THEN 
                                      LEAVE LP3;
                                    ELSE 
                                      CREATE TEMPORARY TABLE T2 SELECT codTurma, professor1 FROM T1 where codTurma = cod;
                                      SET prof1 = (select professor1 from T2 order by codTurma DESC LIMIT 1);                                    
									  UPDATE T1 SET professor2 = prof1 where codTurma = cod;  
									  DROP TEMPORARY TABLE T2;
                                    END IF;                                                                   
								END LOOP LP3; 
                                   
                           CLOSE _cur;     
       END BLOCO2;
       
       
       
 select * from T1 where professor1 != professor2;
       
DROP TEMPORARY TABLE T1;
DROP TEMPORARY TABLE tabelinharequisitos;  
DROP TEMPORARY TABLE tbtemporaria;
DROP TEMPORARY TABLE TurmasParaMatricula;                     

END PRINCIPAL $$
DELIMITER ;
# ------------------------------------------------------------------------------------------
