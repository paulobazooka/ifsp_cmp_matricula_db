-- stored procedure para retornar o nome do dia da semana

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