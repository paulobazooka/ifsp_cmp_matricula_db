/* SELECT @@lc_time_names;
   SET GLOBAL lc_time_names=pt_BR;
   SET lc_time_names = 'pt_BR';
   SELECT @@lc_time_names;
*/


# --------------------- view para consulta de usuarios coordenador -------------------
USE SisMatricula;
DROP VIEW IF EXISTS view_consulta_dados_cadastrais;
CREATE VIEW view_consulta_dados_cadastrais as

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
   from Usuario;       
# -------------------------------------------------------------------------------------------





# ------------------- view consulta para cursos existentes no campus ------------------------
USE SisMatricula;
DROP VIEW IF EXISTS view_consulta_cursos;
CREATE VIEW view_consulta_cursos AS

      select codCurso,
			 nomeCurso,
             siglaCurso,
             dtCurso,
             descricao
      from Curso;       
# -------------------------------------------------------------------------------------------             





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
     


          

# ------------------ view das Turmas abertas por ordem do dia da semana ----------------------------
USE SisMatricula;
DROP VIEW IF EXISTS view_consulta_turmas_abertas;
CREATE VIEW view_consulta_turmas_abertas as

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
   
   
   
   
   
   

# ------------------ Consulta de Disciplinas disponíveis gerais para matrícula ------------------
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

     


