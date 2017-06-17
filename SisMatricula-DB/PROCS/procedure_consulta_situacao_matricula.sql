# --------------- procedure para consultar a situação da matricula do aluno -------------------     
DROP PROCEDURE IF EXISTS procedure_consulta_situacao_matricula;
DELIMITER $$
CREATE PROCEDURE procedure_consulta_situacao_matricula(IN codAluno int)
BEGIN 
select siglaTurma, 
       semestreTurma, 
       anoTurma, 
       nomeDisciplina,
       Horario.diaSemana,
       date_format(horaInicio, '%H:%i'),
       date_format(horaTermino,'%H:%i'),
       descricao
       
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
 






     
     














  
     


                               