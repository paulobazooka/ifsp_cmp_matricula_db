USE SisMatricula;

INSERT INTO Curso(nomeCurso, siglaCurso, dtCurso, descricao) VALUES 
				 ('Análise e Desenvolvimento de Sistemas', 'ADS','2013-06-01', null),
                 ('Técnico em Análise e Desenvolvimento de Sistemas', 'TADS', '2017-01-01', null),
                 ('Técnico em Eletroeletrônica', 'TEE', '2016-01-01', null);
                 
INSERT INTO Disciplina(semestre,                     nomeDisciplina,    siglaDisciplina,      totalHoras,    ementa) VALUES 
					  (	      1,          'Algoritmo e Programação',              'APO',           80,    	 	'A disciplina permite o desenvolvimento do raciocínio lógico por meio do formalismo de linguagem de programação e abordando os princípios da representação e manipulação da informação.'),
                      (	      4,	      'Arquitetura de Software',     	      'RAS',           80,    	 	'A disciplina apresenta conceitos, evolução e importância da arquitetura de software. O componente curricular trabalha com análise e projeto no processo de desenvolvimento, padrões de arquitetura, padrões de distribuição, camadas no desenvolvimento de software, tipos de arquitetura de software, mapeamento de modelos, integração do sistema e estratégias de manutenção de software'),
                      (       3,	  'Análise Orientada à Objetos',              'AOO',           80,    	    'A disciplina contempla a análise e modelagem de sistemas seguindo o paradigma da orientação a objetos, utilizando os padrões de notação de modelagem orientada a objetos'),
                      (       1,      'Arquitetura de Computadores',         	  'ARQ',           40,    	 	'A disciplina faz um estudo da arquitetura de computadores e seus componentes visando a análise da estrutura individual e a interação entre os componentes fundamentais.'),
                      (       2,	             'Banco de Dados I',         	  'BD1',  		   80,       	'A disciplina introduz conceitos básicos da teoria de banco de dados envolvendo aspectos da arquitetura, modelagem conceitual com ênfase ao modelo entidade-relacionamento e ao modelo relacional, adotando uma linguagem para definição e manipulação de dados.'),
                      (	      3,                'Banco de Dados II',              'BD2',  		   80,       	'A disciplina apresenta a realização do projeto e implementação de um banco de dados, identificando as estratégias de otimização de consultas, os procedimentos para recuperação de falhas, as restrições de integridade e as técnicas de controle de concorrência.'),
                      (	      1,          'Comunicação e Expressão',     		  'CEE',  		   40,		 	'A disciplina contempla o uso da língua portuguesa e da linguagem não verbal no mundo contemporâneo e o desenvolvimento de capacidades estratégicas na recepção de textos orais e escritos. Contempla também a compreensão da diversidade cultural por meio da leitura e interpretação de textos, bem como a promoção de debates acerca da diversidade étnica e linguística brasileira.'),
                      (	      5,              'Desenvolvimento WEB',	  		  'DWE',  		   80,       	'A disciplina apresenta os fundamentos para a compreensão dos princípios relacionados com a elaboração, formatação e inclusão de funcionalidades em páginas web.'), 
                      (	      2,           'Engenharia de Software',      		  'ESW',  		   80,       	'A disciplina aborda aspectos gerais de qualidade de software, a importância da qualidade para o desenvolvimento de software, o relacionamento entre qualidade e testes de software, e modelos de qualidade para software.'),
                      (	      6,                 'Empreendedorismo',			  'EMP',  		   40,       	'sem informação'),
                      (	      4,                      'Estatística',			  'EST',  		   40,       	'sem informação'),
                      (	      3,             'Estrutura de Dados I',	  		  'ED1',  		   80,       	'A disciplina apresenta os conceitos e aplicações da programação modular, e as estruturas de dados lineares empregadas no desenvolvimento de sistemas.'),
                      (	      5,               'Gestão de Projetos',       	      'GPR',  		   80,       	'A disciplina contempla a compreensão das áreas de conhecimento de gerenciamento de projetos, incluindo as entradas e saídas de cada processo.'),
                      (	      1, 'História da Ciência e Tecnologia',       	      'HCT',  		   40,       	'A disciplina trata dos conceitos científicos e suas aplicações tecnológicas ao longo da história, analisadas sob o enfoque da Educação, da Ciência e da Tecnologia, e suas relações com o desenvolvimento econômico-social.'),
                      (	      1,                   'Inglês Técnico',              'ING',  		   40,       	'A disciplina contempla a compreensão técnica da língua inglesa na prática de informática por meio de atividades de leitura e escrita de vocabulário técnico.'),
                      (	      2,          'Inglês Técnico Avançado',           	  'IGT',  		   40,       	'O Componente curricular trabalha o desenvolvimento de conhecimentos intermediários da Língua Inglesa para o uso na área da Informática através do estudo das formas gramaticais e de textos específicos da área. Pretende desenvolver habilidades de leitura e interpretação de textos em língua inglesa, propiciando ao aluno a aplicação de diferentes técnicas de leitura para ampliação da compreensão de textos no idioma.'),
                      (       3,      'Interação Humano-Computador',       	      'IHC',  		   40,       	'A disciplina aborda os principais paradigmas de interface e de interação com o usuário e como eles abordam os problemas de ergonomia e usabilidade das aplicações.'),
                      (       2,       'Introdução à Administração',      	      'ADM',  		   40,       	'A disciplina contempla o estudo da evolução da teoria da administração e noções de organização dos processo administrativos.'),
                      (	      1,       'Linguagem de Programação I',              'LP1',  		   80,       	'A disciplina permite o desenvolvimento do raciocínio lógico por meio do formalismo de linguagem de programação e abordando os princípios da representação e manipulação da informação. A disciplina aborda conceitos de algoritmos de programação estruturada, entrada e saída de dados, tipos de dados, variáveis, operadores aritméticos, funções, declarações para controle do fluxo do programa, variáveis do tipo pointer e register, arrays, pré-processador, estruturas, união e arquivos em disco.'),
                      (	      2,      'Linguagem de Programação II',       	      'LP2',  		   80,       	'A disciplina apresenta os fundamentos para o desenvolvimento de sistemas de software baseados no paradigma orientado a objetos numa linguagem visual.'),
                      (	      3,     'Linguagem de Programação III',      	      'LP3',  		   80,       	'A disciplina engloba a análise, planejamento e desenvolvimento de sistemas de computação, utilizando uma ferramenta de programação do tipo RAD (Rapid Application Development) com suporte ao paradigma de orientação a objetos.'),
                      (	      1,                       'Matemática',			  'MAT',  		   80,       	'A disciplina aborda os conceitos da estatística descritiva e de cálculo de probabilidades, apresentando conhecimentos para a utilização de sistemas de apuração de dados e cálculos estatísticos utilizando ferramentas computacionais.'),
                      (	      3,            'Matemática Financeira',              'MFI',  		   40,       	'A disciplina aborda a compreensão dos conceitos de juros simples e compostos, e suas aplicações nas operações de descontos. Também são abordadas operações de financiamento que permitem entender e auxiliar a tomada de decisão das melhores condições de financiamento. Por fim, a disciplina aborda o processo de análise de investimentos com a Equivalência de Fluxos de Caixa e Taxa Interna de Retorno, que visam auxiliar as escolhas que os profissionais podem ter,otimizando os recursos, minimizando as perdas, e maximizando a lucratividade das empresas.'),
                      (	      5,               'Metodologias Ágeis',              'MTA',  		   40,       	'A disciplina apresenta metodologias ágeis no desenvolvimento de sistemas, enfatizando a importância da construção de software com qualidade, de forma iterativa e incremental com flexibilidade para reagir ao feedback dos usuários.'),
                      (	      5,            'Projeto de Sistemas I',              'PS1',  		   40,       	'A disciplina consolida as competências e habilidades adquiridas durante o curso em um projeto de desenvolvimento de software, que deverá ser baseado em problemas reais, abordando estratégias de desenvolvimento, modelos de análise e de projeto e implementação. O trabalho possibilita ao aluno a integração de teoria e prática, verificando a capacidade de síntese do aprendizado adquirido durante o curso e utilização das normas da Associação Brasileira de Normas Técnicas (ABNT).'),
                      (       6,           'Projeto de Sistemas II',			  'PS2',  		   40,       	'sem informação'),	
                      (       5,            'Qualidade de Software',              'QSW',  		   80,       	'A disciplina aborda aspectos gerais de qualidade de software, a importância da qualidade para o desenvolvimento de software, o relacionamento entre qualidade e testes de software, e modelos de qualidade para software.'),
                      (       4,            'Redes de Computadores',              'RCO',           80,          'sem informação'), 
                      (       5,                 'Serviços de Rede', 			  'SSR',  		   80,       	'A disciplina aborda a implantação e configuração dos principais serviços de rede. O componente curricular apresenta e explica os principais aspectos necessários para a implantação de um sistema em rede com vários serviços disponíveis ao usuário. Toda a disciplina é desenvolvida em ambiente de software livre, sendo também uma introdução ao Linux.'),
                      (       2,            'Sistemas Operacionais',			  'SOP',  		   80,       	'sem informação'),
                      (       6,          'Segurança da Informação',		      'SSI',  		   80,       	'sem informação'),
                      (       6,                'Tópicos Especiais',			  'TPE',  		   80,       	'sem informação');
         

INSERT INTO Turno(codTurno,    nomeTurno) VALUES
                 (       1,   'Matutino'),
                 (		 2, 'Vespertino'),
                 (       3,    'Noturno'); 

INSERT INTO EstadoMat(codEstado,     descricao) VALUES
                     (        1,  'Solicitado'),
                     (        2,  'Indeferido'),
                     (        3,    'Deferido'),
                     (        4,   'Cancelada'),
                     (        5,    'Abandono');
                     
-- pré requisitos das disciplinas
/*INSERT INTO DisciplinaPreRequisitos(codDisciplina, preRequisito) VALUES
								   (            20,           1),
                                   (            20,          19),
                                   (            29,           4),
                                   (			16,          15),
                                   (            23,          22),
                                   (             6,           5),
                                   (            21,          20),
                                   (            21,           5),
                                   (            12,          20),
                                   (             3,           9),
                                   (            17,           9),
                                   (            11,          22),
                                   (            ,           1),*/
         
-- relaciona cursos com as disciplinas
INSERT INTO CursoDisciplina(codCurso, codDisciplina) VALUES
						   (       1,             1),
                           (       1,             2),
						   (       1,             3),
                           (       1,             4),
                           (       1,             5),
                           (       1,             6),
                           (       1,             7),
                           (       1,             8),
                           (       1,             9),
                           (       1,            10),
                           (       1,            11),
                           (       1,            12),
                           (       1,            13),
                           (       1,            14),
                           (       1,            15),
                           (       1,            16),
                           (       1,            17),
                           (       1,            18),
                           (       1,            19),
                           (       1,            20),
                           (       1,            21),
                           (       1,            22),
                           (       1,            23),
                           (       1,            24),
                           (       1,            25),
                           (       1,            26),
                           (       1,            27),
                           (       1,            28),
                           (       1,            29),
                           (       1,            30),
                           (       1,            31);
						
   
INSERT INTO TipoUsuario (descricao)  VALUES
                        ('Administrador'),
                        ('Coordenador'),
                        ('Tecnico Administrativo'),
                        ('Professor'),
                        ('Aluno Superior'),
                        ('Aluno Técnico');
                       
   
-- Usuários para teste padrão                      
INSERT INTO Usuario(        senha,      nomeUsuario,      identificacao,         dataNas,           cpf,      ingresso,             email,       telefone1,      telefone2,  codTipoUsuario) VALUES
                   (md5('admin1'),  'Administrador',        'mat000001',    '1970-01-08',   12345678900,  '2013-06-01',  'admin@admin.if',   '19234567891',  '19998787878',               1),
                   (md5('123456'),    'Professor X',        'mat000002',    '1980-02-17',   00987654321,  '2013-06-02',   'profx@prof.if',   '15654798641',  '15794654678',               4),
				   (md5('612335'),    'Professor Y',        'mat000003',    '1979-09-22',   00987650078,  '2013-06-02',   'profy@prof.if',   '18987462216',  '18233278984',               4),
				   (md5('812345'),    'Professor W',        'mat000004',    '1978-11-25',   03984454321,  '2014-01-01',   'profw@prof.if',   '65222222222',  '65777777777',               4),
                   (md5('123457'),        'Aluno A',	    '160011111',    '1990-03-12',   99999998999,  '2016-01-01', 'alunoa@aluno.if',   '11987456465',  '11789798789',               5),
                   (md5('912345'),        'Aluno B',        '150011456',    '1995-04-03',   98888988889,  '2015-02-01', 'alunob@aluno.if',   '48987987987',  '48222141111',               5),
                   (md5('111545'),        'Aluno C',        '140011789',    '1985-05-10',   30012456789,  '2014-02-15', 'alunoc@aluno.if',   '66555555555',  '66787878787',               5),
                   (md5('012345'),        'Aluno D',  	    '170011213',    '1991-10-16',   99999000099,  '2017-02-02', 'alunod@aluno.if',   '19988555414',  '19327354894',               5),
                   (md5('555556'),        'Aluno E', 		'170011982',    '1997-07-07',   99111998999,  '2017-02-02', 'alunoe@aluno.if',   '19854654654',  '19111111111',               5),
                   (md5('122245'),        'Aluno F',  	    '130011458',    '1988-06-13',   93129998999,  '2013-06-01', 'alunof@aluno.if',   '19321454616',  '19333333333',               5),
                   (md5('320145'),        'Aluno G',		'160011147',    '1959-07-31',   12345678911,  '2016-02-02', 'alunoG@aluno.if',   '19525252525',  '19123456465',               5);
                   
                   

                   
-- Aluno Curso matriculado teste padrão
INSERT INTO AlunoCurso(codCurso, codUsuario) VALUES
                      (       1,          5),
                      (       1,          6),
                      (       1,          7),
                      (       1,          8),
                      (       1,          9),
                      (       1,         10),
                      (       1,         11);



-- Turmas para teste padrão
INSERT INTO Turma(siglaTurma, codCurso, codDisciplina,   anoTurma,   semestreTurma,   codTurno,  vagas,   turmaEncerrada, aberto) VALUES
				 ('APO1301',         1,             1,       2013,              02,          3,     40,            false,   true),
                 ('LP11301',         1,            19,       2013,              02,          3,     40,            false,   true),
                 ('ING1301',         1,            15,       2013,              02,          3,     40,            false,   true),
                 ('HCT1301',         1,            14,       2013,              02,          3,     40, 	       false,   true),
                 ('MAT1301',         1,            22,       2013,              02,          3,     40, 	       false,   true),
                 ('ARQ1301',         1,             4,       2013,              02,          3,     40,            false,   true),
                 ('CEE1301',         1,             7,       2013,              02,          3,     40,            false,   true);



-- Inserir horarios para as turmas
INSERT INTO Horario(codTurma, diaSemana, horaInicio, horaTermino) VALUES
				   (       1,         2,    '19:00',     '22:40'),
                   (       2,         3,    '19:00',     '22:40'),
                   (       3,         4,    '19:00',     '20:40'),
                   (       7,         4,    '21:00',     '22:40'),
                   (       5,         6,    '19:00',     '20:40'),
                   (       6,         6,    '21:00',     '22:40'),
                   (       4,         5,    '19:00',     '22:40');



INSERT INTO Matricula(codTurma, codUsuario,       codEstado) VALUES
					 (       1,          5,				  1),
                     (       1,          6, 			  1),
                     (       1,          7, 			  2),
                     (       1,          8, 			  1),
                     (       1,          9, 			  2),
                     (       2,          6, 			  1),
                     (       2,          7, 			  3),
                     (       2,          8, 			  1),
                     (       3,          5, 			  3),
                     (       3,          9, 			  1),
                     (       4,          5, 			  1),
                     (       4,          8, 			  1),
                     (       4,          6, 			  3),
                     (       4,          9, 			  1),
                     (       5,          9, 			  2),
                     (       5,          8, 			  1),
                     (       5,          7, 			  2);




-- tabela de professores turma para teste padrão
INSERT INTO ProfessorTurma(codUsuario, codTurma) VALUES
						  (         2,        1),
                          (         3,        1),
                          (         4,        2),
                          (         3,        2),
                          (         2,        3),
                          (         3,        4),
                          (         4,        5),
                          (         2,        6);



 INSERT INTO DisciplinaConcluida(codTurma, codUsuario) VALUES
								(       1,          5),
                                (       3,          5),
                                (       4,          5);
                                
