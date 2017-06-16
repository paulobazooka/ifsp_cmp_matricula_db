USE SisMatricula;

-- Tabela tipo de usuário: coordenador curso, servidor cre, professor, aluno

CREATE TABLE TipoUsuario(codTipoUsuario int primary key auto_increment,
						 descricao varchar(25) not null);
 
  
 
CREATE TABLE Turno(codTurno int primary key,
                   nomeTurno VARCHAR(20));
 
 
 
CREATE TABLE EstadoMat(codEstado int primary key,
                       descricao varchar(20) not null); 
 
 
-- Tabela usuário/administrador
CREATE TABLE Usuario(codUsuario int primary key auto_increment,
                     identificacao varchar(15) not null,
                     nomeUsuario varchar(100) not null,                     
					 senha varchar(75) not null, 					 
                     dataNas date not null,
                     cpf bigint not null,
                     ingresso datetime not null default current_timestamp(),
                     email varchar(75) not null,
                     telefone1 varchar(15) default null,
                     telefone2 varchar(15) default null,
                     codTipoUsuario int not null,
                     FOREIGN KEY (codTipoUsuario) REFERENCES TipoUsuario(codTipoUsuario) ON DELETE CASCADE);  
      
      
-- Tabela curso      
CREATE TABLE Curso(codCurso int primary key auto_increment,
				   nomeCurso varchar(100) not null,
                   siglaCurso varchar(5) not null,
                   dtCurso date,
                   descricao text);
       
       
       
-- Tabela das disciplinas	
CREATE TABLE Disciplina(codDisciplina int primary key auto_increment,
					    nomeDisciplina varchar(100) not null,
                        semestre int not null,						                    						
						siglaDisciplina varchar(6) not null,                        
                        totalHoras int,
						ementa text);



-- Tabela Turma
CREATE TABLE Turma(codTurma int primary key auto_increment,
                   siglaTurma varchar(10),
				   codCurso int not null,                   
                   codDisciplina int not null,				   
                   anoTurma int not null,
                   semestreTurma int not null,
                   codTurno int,
                   vagas int not null default 0,
                   matriculasRealizadas int not null default 0,
                   turmaEncerrada boolean not null default false,
                   aberto boolean not null default false,                   
                   FOREIGN KEY (codTurno)      REFERENCES Turno(codTurno) ON DELETE CASCADE,
				   FOREIGN KEY (codCurso)      REFERENCES Curso(codCurso) ON DELETE CASCADE,
                   FOREIGN KEY (codDisciplina) REFERENCES Disciplina(codDisciplina) ON DELETE CASCADE);



-- Tabela para relacionar a turma com os horarios.
CREATE TABLE Horario(codTurma int not null,
                     diaSemana varchar(15) not null,
					 horaInicio time not null,
					 horaTermino time not null,
                     FOREIGN KEY(codTurma) REFERENCES Turma(codTurma) ON DELETE CASCADE);





-- Tabela Matrícula                   
CREATE TABLE Matricula(codMatricula int primary key auto_increment,
					   codTurma int not null,
                       codUsuario int not null,                       
                       dtMatricula datetime not null default current_timestamp(),
                       concluido boolean not null default false,
                       codEstado int not null default 1,
                       FOREIGN KEY (codTurma)   REFERENCES Turma(codTurma)      ON DELETE CASCADE,
                       FOREIGN KEY (codUsuario) REFERENCES Usuario(codUsuario)  ON DELETE CASCADE,
                       FOREIGN KEY (codEstado)  REFERENCES EstadoMat(codEstado) ON DELETE CASCADE);   



-- Tabela professor(s) por turma
CREATE TABLE ProfessorTurma(codUsuario int not null,
						    codTurma int not null,
                            FOREIGN KEY (codUsuario) REFERENCES Usuario(codUsuario) ON DELETE CASCADE,
                            FOREIGN KEY (codTurma)   REFERENCES Turma(codTurma)     ON DELETE CASCADE);



-- tabela aluno curso matriculado
CREATE TABLE AlunoCurso(codCurso int not null,
						codUsuario int not null,
                        concluido boolean not null default false,
                        FOREIGN KEY (codCurso)   REFERENCES Curso(codCurso)     ON DELETE CASCADE,
                        FOREIGN KEY (codUsuario) REFERENCES Usuario(codUsuario) ON DELETE CASCADE);                        



-- tabela das disciplinas com pré requisitos                             
CREATE TABLE DisciplinaPreRequisitos(codDisciplina int not null,
									 preRequisito int not null,
                                     FOREIGN KEY (codDisciplina) REFERENCES Disciplina(codDisciplina) ON DELETE CASCADE,
                                     FOREIGN KEY (preRequisito)  REFERENCES Disciplina(codDisciplina) ON DELETE CASCADE);


										
 -- Tabela das disciplinas do curso                                       
CREATE TABLE CursoDisciplina(codCurso int, 
                             codDisciplina int,                             
                             FOREIGN KEY (codCurso)      REFERENCES Curso(codCurso)           ON DELETE CASCADE,
                             FOREIGN KEY (codDisciplina) REFERENCES Disciplina(codDisciplina) ON DELETE CASCADE);
                        
                        
    

CREATE TABLE DisciplinaConcluida(codUsuario int,
								 codTurma int,
                                 FOREIGN KEY (codUsuario) REFERENCES Usuario(codUsuario) ON DELETE CASCADE,
                                 FOREIGN KEY (codTurma)   REFERENCES Turma(codTurma)     ON DELETE CASCADE);
                                 


CREATE TABLE AssinaturaDigitalMatricula(codAss int primary key auto_increment,
										codMatricula int,
                                        dtDeferimento datetime not null default now(),
                                        assinatura varchar(200),
                                        FOREIGN KEY (codMatricula) REFERENCES Matricula(codMatricula) ON DELETE CASCADE);
                                                                       


CREATE TABLE TabelaLogin(codLog INT PRIMARY KEY AUTO_INCREMENT, 
                         codUsuario INT, 
                         horaEntrou datetime not null default current_timestamp(), 
                         horaSaiu datetime,
                         FOREIGN KEY (codUsuario) REFERENCES Usuario(codUsuario));
                         




CREATE TABLE TabelaAlteracoes(codAlteracao INT PRIMARY KEY AUTO_INCREMENT,
							  usuario VARCHAR(20),
							  horaAlteracao datetime not null default current_timestamp(),
                              tabelaAlterada VARCHAR(100),
                              comando VARCHAR(200),
                              linhaAlterada INT);
                             
                              





-- trigger auxilar para povoar as tabelas DisciplinaConcluida e AssinaturaDigitalMatricula
USE SisMatricula;
DROP TRIGGER if exists trigger_atualiza_disciplina_concluida_insert;
DELIMITER ||
CREATE TRIGGER trigger_atualiza_disciplina_concluida_insert
AFTER INSERT ON Matricula
FOR EACH ROW
BEGIN
     if (NEW.concluido = true) THEN  -- Se a disciplina foi concluida
         INSERT DisciplinaConcluida (codUsuario, codTurma) VALUES  -- inserir na tabela DisciplinaConcluida os campos codUsuario, codTurma
	     (NEW.codUsuario, NEW.codTurma);                           -- os campos recém adicionados na tabela matricula
     end if;
     
     if (NEW.codEstado = 3) THEN     -- Se a matricula foi deferida...
         INSERT INTO AssinaturaDigitalMatricula (codMatricula, assinatura, dtDeferimento) VALUES  -- inserir na tabela
			    (NEW.codMatricula, md5(NEW.codMatricula + NEW.codTurma + NEW.codUsuario +        -- comprovação da matricula
                 NEW.dtMatricula + now()), NEW.dtMatricula);                                    -- através dos campos indicados
     end if;

END ||
DELIMITER ;



USE SisMatricula;
DROP TRIGGER if exists trigger_alteracoes_insert_matricula;
DELIMITER ||
CREATE TRIGGER trigger_alteracoes_insert_matricula
AFTER INSERT ON Matricula
FOR EACH ROW
BEGIN
     DECLARE cod INT;
     DECLARE _user VARCHAR(30);
     
     SET cod = (select codMatricula from Matricula order by codMatricula DESC LIMIT 1);
     SET _user = (select user());
     
     INSERT INTO TabelaAlteracoes(usuario, tabelaAlterada,  comando, linhaAlterada) VALUES
				                 (_user,      'Matricula', 'INSERT',           cod);
END ||
DELIMITER ;