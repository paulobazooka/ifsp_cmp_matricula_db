-- SELECT @@lc_time_names;
-- SET GLOBAL lc_time_names=pt_BR;
-- SET lc_time_names = 'pt_BR';

use SisMatricula;


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
               
               
               
-- Consulta das solicitações de matrículas
select nomeUsuario as 'Aluno', 
       nomeDisciplina as 'Disciplina',
       siglaTurma as 'Turma',
       descricao as 'Estado'
from Usuario natural join 
     Matricula natural join
     Turma natural join
     Disciplina natural join
     EstadoMat;
     
     
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
   **** Turmas abertas durante o semestre
   **** Disciplinas relacionadas ao curso
*/

-- Consulta de Matrículas no semestre corrente 
select siglaTurma as 'Turma', semestreTurma as 'Semestre', anoTurma as 'Ano', nomeDisciplina as 'Disciplina'  
from Disciplina natural join Turma natural join Matricula natural join Usuario where (identificacao = '160011111'
and codEstado = 3 and turmaEncerrada = false);

-- Consulta de Turmas para realização de Matriculas
select siglaTurma as 'Turma', semestreTurma as 'Semestre', anoTurma as 'Ano', nomeDisciplina as 'Disciplina'  
from Disciplina natural join Turma natural join Matricula;