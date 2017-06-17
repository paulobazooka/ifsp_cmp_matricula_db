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
