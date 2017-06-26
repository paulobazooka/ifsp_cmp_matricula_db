USE SisMatricula;
Drop procedure if exists procedure_retorna_dependentes;
DELIMITER $$
CREATE PROCEDURE procedure_retorna_dependentes(IN codT INT)
BEGIN
select count(d.codDisciplina) as 'quantidade de pre-requisitos' 
from DisciplinaPreRequisitos d inner join
Turma t
where d.preRequisito = t.codDisciplina
and codTurma = codT;
END $$
DELIMITER ;
