-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: SisMatricula
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AlunoCurso`
--

DROP TABLE IF EXISTS `AlunoCurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AlunoCurso` (
  `codCurso` int(11) NOT NULL,
  `codUsuario` int(11) NOT NULL,
  `concluido` tinyint(1) NOT NULL DEFAULT '0',
  KEY `codCurso` (`codCurso`),
  KEY `codUsuario` (`codUsuario`),
  CONSTRAINT `AlunoCurso_ibfk_1` FOREIGN KEY (`codCurso`) REFERENCES `Curso` (`codCurso`) ON DELETE CASCADE,
  CONSTRAINT `AlunoCurso_ibfk_2` FOREIGN KEY (`codUsuario`) REFERENCES `Usuario` (`codUsuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AlunoCurso`
--

LOCK TABLES `AlunoCurso` WRITE;
/*!40000 ALTER TABLE `AlunoCurso` DISABLE KEYS */;
INSERT INTO `AlunoCurso` VALUES (1,5,0),(1,6,0),(1,7,0),(1,8,0),(1,9,0),(1,10,0),(1,11,0);
/*!40000 ALTER TABLE `AlunoCurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Curso`
--

DROP TABLE IF EXISTS `Curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Curso` (
  `codCurso` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCurso` varchar(100) NOT NULL,
  `siglaCurso` varchar(5) NOT NULL,
  `dtCurso` date DEFAULT NULL,
  `descricao` text,
  PRIMARY KEY (`codCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Curso`
--

LOCK TABLES `Curso` WRITE;
/*!40000 ALTER TABLE `Curso` DISABLE KEYS */;
INSERT INTO `Curso` VALUES (1,'Análise e Desenvolvimento de Sistemas','ADS','2013-06-01',NULL),(2,'Técnico em Análise e Desenvolvimento de Sistemas','TADS','2017-01-01',NULL),(3,'Técnico em Eletroeletrônica','TEE','2016-01-01',NULL);
/*!40000 ALTER TABLE `Curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CursoDisciplina`
--

DROP TABLE IF EXISTS `CursoDisciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CursoDisciplina` (
  `codCurso` int(11) DEFAULT NULL,
  `codDisciplina` int(11) DEFAULT NULL,
  KEY `codCurso` (`codCurso`),
  KEY `codDisciplina` (`codDisciplina`),
  CONSTRAINT `CursoDisciplina_ibfk_1` FOREIGN KEY (`codCurso`) REFERENCES `Curso` (`codCurso`) ON DELETE CASCADE,
  CONSTRAINT `CursoDisciplina_ibfk_2` FOREIGN KEY (`codDisciplina`) REFERENCES `Disciplina` (`codDisciplina`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CursoDisciplina`
--

LOCK TABLES `CursoDisciplina` WRITE;
/*!40000 ALTER TABLE `CursoDisciplina` DISABLE KEYS */;
INSERT INTO `CursoDisciplina` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31);
/*!40000 ALTER TABLE `CursoDisciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Disciplina`
--

DROP TABLE IF EXISTS `Disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Disciplina` (
  `codDisciplina` int(11) NOT NULL AUTO_INCREMENT,
  `nomeDisciplina` varchar(100) NOT NULL,
  `semestre` int(11) NOT NULL,
  `siglaDisciplina` varchar(6) NOT NULL,
  `totalHoras` int(11) DEFAULT NULL,
  `ementa` text,
  PRIMARY KEY (`codDisciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Disciplina`
--

LOCK TABLES `Disciplina` WRITE;
/*!40000 ALTER TABLE `Disciplina` DISABLE KEYS */;
INSERT INTO `Disciplina` VALUES (1,'Algoritmo e Programação',1,'APO',80,'A disciplina permite o desenvolvimento do raciocínio lógico por meio do formalismo de linguagem de programação e abordando os princípios da representação e manipulação da informação.'),(2,'Arquitetura de Software',4,'RAS',80,'A disciplina apresenta conceitos, evolução e importância da arquitetura de software. O componente curricular trabalha com análise e projeto no processo de desenvolvimento, padrões de arquitetura, padrões de distribuição, camadas no desenvolvimento de software, tipos de arquitetura de software, mapeamento de modelos, integração do sistema e estratégias de manutenção de software'),(3,'Análise Orientada à Objetos',3,'AOO',80,'A disciplina contempla a análise e modelagem de sistemas seguindo o paradigma da orientação a objetos, utilizando os padrões de notação de modelagem orientada a objetos'),(4,'Arquitetura de Computadores',1,'ARQ',40,'A disciplina faz um estudo da arquitetura de computadores e seus componentes visando a análise da estrutura individual e a interação entre os componentes fundamentais.'),(5,'Banco de Dados I',2,'BD1',80,'A disciplina introduz conceitos básicos da teoria de banco de dados envolvendo aspectos da arquitetura, modelagem conceitual com ênfase ao modelo entidade-relacionamento e ao modelo relacional, adotando uma linguagem para definição e manipulação de dados.'),(6,'Banco de Dados II',3,'BD2',80,'A disciplina apresenta a realização do projeto e implementação de um banco de dados, identificando as estratégias de otimização de consultas, os procedimentos para recuperação de falhas, as restrições de integridade e as técnicas de controle de concorrência.'),(7,'Comunicação e Expressão',1,'CEE',40,'A disciplina contempla o uso da língua portuguesa e da linguagem não verbal no mundo contemporâneo e o desenvolvimento de capacidades estratégicas na recepção de textos orais e escritos. Contempla também a compreensão da diversidade cultural por meio da leitura e interpretação de textos, bem como a promoção de debates acerca da diversidade étnica e linguística brasileira.'),(8,'Desenvolvimento WEB',5,'DWE',80,'A disciplina apresenta os fundamentos para a compreensão dos princípios relacionados com a elaboração, formatação e inclusão de funcionalidades em páginas web.'),(9,'Engenharia de Software',2,'ESW',80,'A disciplina aborda aspectos gerais de qualidade de software, a importância da qualidade para o desenvolvimento de software, o relacionamento entre qualidade e testes de software, e modelos de qualidade para software.'),(10,'Empreendedorismo',6,'EMP',40,'sem informação'),(11,'Estatística',4,'EST',40,'sem informação'),(12,'Estrutura de Dados I',3,'ED1',80,'A disciplina apresenta os conceitos e aplicações da programação modular, e as estruturas de dados lineares empregadas no desenvolvimento de sistemas.'),(13,'Gestão de Projetos',5,'GPR',80,'A disciplina contempla a compreensão das áreas de conhecimento de gerenciamento de projetos, incluindo as entradas e saídas de cada processo.'),(14,'História da Ciência e Tecnologia',1,'HCT',40,'A disciplina trata dos conceitos científicos e suas aplicações tecnológicas ao longo da história, analisadas sob o enfoque da Educação, da Ciência e da Tecnologia, e suas relações com o desenvolvimento econômico-social.'),(15,'Inglês Técnico',1,'ING',40,'A disciplina contempla a compreensão técnica da língua inglesa na prática de informática por meio de atividades de leitura e escrita de vocabulário técnico.'),(16,'Inglês Técnico Avançado',2,'IGT',40,'O Componente curricular trabalha o desenvolvimento de conhecimentos intermediários da Língua Inglesa para o uso na área da Informática através do estudo das formas gramaticais e de textos específicos da área. Pretende desenvolver habilidades de leitura e interpretação de textos em língua inglesa, propiciando ao aluno a aplicação de diferentes técnicas de leitura para ampliação da compreensão de textos no idioma.'),(17,'Interação Humano-Computador',3,'IHC',40,'A disciplina aborda os principais paradigmas de interface e de interação com o usuário e como eles abordam os problemas de ergonomia e usabilidade das aplicações.'),(18,'Introdução à Administração',2,'ADM',40,'A disciplina contempla o estudo da evolução da teoria da administração e noções de organização dos processo administrativos.'),(19,'Linguagem de Programação I',1,'LP1',80,'A disciplina permite o desenvolvimento do raciocínio lógico por meio do formalismo de linguagem de programação e abordando os princípios da representação e manipulação da informação. A disciplina aborda conceitos de algoritmos de programação estruturada, entrada e saída de dados, tipos de dados, variáveis, operadores aritméticos, funções, declarações para controle do fluxo do programa, variáveis do tipo pointer e register, arrays, pré-processador, estruturas, união e arquivos em disco.'),(20,'Linguagem de Programação II',2,'LP2',80,'A disciplina apresenta os fundamentos para o desenvolvimento de sistemas de software baseados no paradigma orientado a objetos numa linguagem visual.'),(21,'Linguagem de Programação III',3,'LP3',80,'A disciplina engloba a análise, planejamento e desenvolvimento de sistemas de computação, utilizando uma ferramenta de programação do tipo RAD (Rapid Application Development) com suporte ao paradigma de orientação a objetos.'),(22,'Matemática',1,'MAT',80,'A disciplina aborda os conceitos da estatística descritiva e de cálculo de probabilidades, apresentando conhecimentos para a utilização de sistemas de apuração de dados e cálculos estatísticos utilizando ferramentas computacionais.'),(23,'Matemática Financeira',3,'MFI',40,'A disciplina aborda a compreensão dos conceitos de juros simples e compostos, e suas aplicações nas operações de descontos. Também são abordadas operações de financiamento que permitem entender e auxiliar a tomada de decisão das melhores condições de financiamento. Por fim, a disciplina aborda o processo de análise de investimentos com a Equivalência de Fluxos de Caixa e Taxa Interna de Retorno, que visam auxiliar as escolhas que os profissionais podem ter,otimizando os recursos, minimizando as perdas, e maximizando a lucratividade das empresas.'),(24,'Metodologias Ágeis',5,'MTA',40,'A disciplina apresenta metodologias ágeis no desenvolvimento de sistemas, enfatizando a importância da construção de software com qualidade, de forma iterativa e incremental com flexibilidade para reagir ao feedback dos usuários.'),(25,'Projeto de Sistemas I',5,'PS1',40,'A disciplina consolida as competências e habilidades adquiridas durante o curso em um projeto de desenvolvimento de software, que deverá ser baseado em problemas reais, abordando estratégias de desenvolvimento, modelos de análise e de projeto e implementação. O trabalho possibilita ao aluno a integração de teoria e prática, verificando a capacidade de síntese do aprendizado adquirido durante o curso e utilização das normas da Associação Brasileira de Normas Técnicas (ABNT).'),(26,'Projeto de Sistemas II',6,'PS2',40,'sem informação'),(27,'Qualidade de Software',5,'QSW',80,'A disciplina aborda aspectos gerais de qualidade de software, a importância da qualidade para o desenvolvimento de software, o relacionamento entre qualidade e testes de software, e modelos de qualidade para software.'),(28,'Redes de Computadores',4,'RCO',80,'sem informação'),(29,'Serviços de Rede',5,'SSR',80,'A disciplina aborda a implantação e configuração dos principais serviços de rede. O componente curricular apresenta e explica os principais aspectos necessários para a implantação de um sistema em rede com vários serviços disponíveis ao usuário. Toda a disciplina é desenvolvida em ambiente de software livre, sendo também uma introdução ao Linux.'),(30,'Sistemas Operacionais',2,'SOP',80,'sem informação'),(31,'Segurança da Informação',6,'SSI',80,'sem informação'),(32,'Tópicos Especiais',6,'TPE',80,'sem informação');
/*!40000 ALTER TABLE `Disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DisciplinaConcluida`
--

DROP TABLE IF EXISTS `DisciplinaConcluida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DisciplinaConcluida` (
  `codUsuario` int(11) DEFAULT NULL,
  `codTurma` int(11) DEFAULT NULL,
  KEY `codUsuario` (`codUsuario`),
  KEY `codTurma` (`codTurma`),
  CONSTRAINT `DisciplinaConcluida_ibfk_1` FOREIGN KEY (`codUsuario`) REFERENCES `Usuario` (`codUsuario`) ON DELETE CASCADE,
  CONSTRAINT `DisciplinaConcluida_ibfk_2` FOREIGN KEY (`codTurma`) REFERENCES `Turma` (`codTurma`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DisciplinaConcluida`
--

LOCK TABLES `DisciplinaConcluida` WRITE;
/*!40000 ALTER TABLE `DisciplinaConcluida` DISABLE KEYS */;
/*!40000 ALTER TABLE `DisciplinaConcluida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DisciplinaPreRequisitos`
--

DROP TABLE IF EXISTS `DisciplinaPreRequisitos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DisciplinaPreRequisitos` (
  `codDisciplina` int(11) NOT NULL,
  `preRequisito` int(11) NOT NULL,
  KEY `codDisciplina` (`codDisciplina`),
  KEY `preRequisito` (`preRequisito`),
  CONSTRAINT `DisciplinaPreRequisitos_ibfk_1` FOREIGN KEY (`codDisciplina`) REFERENCES `Disciplina` (`codDisciplina`) ON DELETE CASCADE,
  CONSTRAINT `DisciplinaPreRequisitos_ibfk_2` FOREIGN KEY (`preRequisito`) REFERENCES `Disciplina` (`codDisciplina`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DisciplinaPreRequisitos`
--

LOCK TABLES `DisciplinaPreRequisitos` WRITE;
/*!40000 ALTER TABLE `DisciplinaPreRequisitos` DISABLE KEYS */;
/*!40000 ALTER TABLE `DisciplinaPreRequisitos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EstadoMat`
--

DROP TABLE IF EXISTS `EstadoMat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EstadoMat` (
  `codEstado` int(11) NOT NULL,
  `descricao` varchar(20) NOT NULL,
  PRIMARY KEY (`codEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EstadoMat`
--

LOCK TABLES `EstadoMat` WRITE;
/*!40000 ALTER TABLE `EstadoMat` DISABLE KEYS */;
INSERT INTO `EstadoMat` VALUES (1,'Solicitado'),(2,'Indeferido'),(3,'Deferido');
/*!40000 ALTER TABLE `EstadoMat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Horario`
--

DROP TABLE IF EXISTS `Horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Horario` (
  `codTurma` int(11) NOT NULL,
  `diaSemana` int(11) NOT NULL,
  `horaInicio` time NOT NULL,
  `horaTermino` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Horario`
--

LOCK TABLES `Horario` WRITE;
/*!40000 ALTER TABLE `Horario` DISABLE KEYS */;
INSERT INTO `Horario` VALUES (1,2,'19:00:00','22:40:00'),(2,3,'19:00:00','22:40:00'),(3,4,'19:00:00','20:40:00'),(7,4,'21:00:00','22:40:00'),(5,6,'19:00:00','20:40:00'),(6,6,'21:00:00','22:40:00'),(4,5,'19:00:00','22:40:00');
/*!40000 ALTER TABLE `Horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Matricula`
--

DROP TABLE IF EXISTS `Matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Matricula` (
  `codMatricula` int(11) NOT NULL AUTO_INCREMENT,
  `codTurma` int(11) NOT NULL,
  `codUsuario` int(11) NOT NULL,
  `dtMatricula` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `concluido` tinyint(1) NOT NULL DEFAULT '0',
  `codEstado` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`codMatricula`),
  KEY `codTurma` (`codTurma`),
  KEY `codUsuario` (`codUsuario`),
  KEY `codEstado` (`codEstado`),
  CONSTRAINT `Matricula_ibfk_1` FOREIGN KEY (`codTurma`) REFERENCES `Turma` (`codTurma`) ON DELETE CASCADE,
  CONSTRAINT `Matricula_ibfk_2` FOREIGN KEY (`codUsuario`) REFERENCES `Usuario` (`codUsuario`) ON DELETE CASCADE,
  CONSTRAINT `Matricula_ibfk_3` FOREIGN KEY (`codEstado`) REFERENCES `EstadoMat` (`codEstado`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Matricula`
--

LOCK TABLES `Matricula` WRITE;
/*!40000 ALTER TABLE `Matricula` DISABLE KEYS */;
INSERT INTO `Matricula` VALUES (1,1,5,'2017-05-05 00:44:53',0,1),(2,1,6,'2017-05-05 00:44:53',0,1),(3,1,7,'2017-05-05 00:44:53',0,2),(4,1,8,'2017-05-05 00:44:53',0,1),(5,1,9,'2017-05-05 00:44:53',0,2),(6,2,6,'2017-05-05 00:44:53',0,1),(7,2,7,'2017-05-05 00:44:53',0,3),(8,2,8,'2017-05-05 00:44:53',0,1),(9,3,5,'2017-05-05 00:44:53',0,3),(10,3,9,'2017-05-05 00:44:53',0,1),(11,4,5,'2017-05-05 00:44:53',0,1),(12,4,8,'2017-05-05 00:44:53',0,1),(13,4,6,'2017-05-05 00:44:53',0,3),(14,4,9,'2017-05-05 00:44:53',0,1),(15,5,9,'2017-05-05 00:44:53',0,2),(16,5,8,'2017-05-05 00:44:53',0,1),(17,5,7,'2017-05-05 00:44:53',0,2);
/*!40000 ALTER TABLE `Matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProfessorTurma`
--

DROP TABLE IF EXISTS `ProfessorTurma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProfessorTurma` (
  `codUsuario` int(11) NOT NULL,
  `codTurma` int(11) NOT NULL,
  KEY `codUsuario` (`codUsuario`),
  KEY `codTurma` (`codTurma`),
  CONSTRAINT `ProfessorTurma_ibfk_1` FOREIGN KEY (`codUsuario`) REFERENCES `Usuario` (`codUsuario`) ON DELETE CASCADE,
  CONSTRAINT `ProfessorTurma_ibfk_2` FOREIGN KEY (`codTurma`) REFERENCES `Turma` (`codTurma`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProfessorTurma`
--

LOCK TABLES `ProfessorTurma` WRITE;
/*!40000 ALTER TABLE `ProfessorTurma` DISABLE KEYS */;
INSERT INTO `ProfessorTurma` VALUES (2,1),(3,1),(4,2),(3,2),(2,3),(3,4),(4,5),(2,6);
/*!40000 ALTER TABLE `ProfessorTurma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TelefoneUsuario`
--

DROP TABLE IF EXISTS `TelefoneUsuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TelefoneUsuario` (
  `codUsuario` int(11) DEFAULT NULL,
  `numTelefone` varchar(15) DEFAULT NULL,
  KEY `codUsuario` (`codUsuario`),
  CONSTRAINT `TelefoneUsuario_ibfk_1` FOREIGN KEY (`codUsuario`) REFERENCES `Usuario` (`codUsuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TelefoneUsuario`
--

LOCK TABLES `TelefoneUsuario` WRITE;
/*!40000 ALTER TABLE `TelefoneUsuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `TelefoneUsuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipoUsuario`
--

DROP TABLE IF EXISTS `TipoUsuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TipoUsuario` (
  `codTipoUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(25) NOT NULL,
  PRIMARY KEY (`codTipoUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoUsuario`
--

LOCK TABLES `TipoUsuario` WRITE;
/*!40000 ALTER TABLE `TipoUsuario` DISABLE KEYS */;
INSERT INTO `TipoUsuario` VALUES (1,'Administrador'),(2,'Coordenador'),(3,'Tecnico Administrativo'),(4,'Professor'),(5,'Aluno Superior'),(6,'Aluno Técnico');
/*!40000 ALTER TABLE `TipoUsuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Turma`
--

DROP TABLE IF EXISTS `Turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Turma` (
  `codTurma` int(11) NOT NULL AUTO_INCREMENT,
  `siglaTurma` varchar(10) DEFAULT NULL,
  `codCurso` int(11) NOT NULL,
  `codDisciplina` int(11) NOT NULL,
  `anoTurma` int(11) NOT NULL,
  `semestreTurma` int(11) NOT NULL,
  `codTurno` int(11) DEFAULT NULL,
  `vagas` int(11) NOT NULL DEFAULT '0',
  `matriculasRealizadas` int(11) NOT NULL DEFAULT '0',
  `turmaEncerrada` tinyint(1) NOT NULL DEFAULT '0',
  `aberto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codTurma`),
  KEY `codTurno` (`codTurno`),
  KEY `codCurso` (`codCurso`),
  KEY `codDisciplina` (`codDisciplina`),
  CONSTRAINT `Turma_ibfk_1` FOREIGN KEY (`codTurno`) REFERENCES `Turno` (`codTurno`) ON DELETE CASCADE,
  CONSTRAINT `Turma_ibfk_2` FOREIGN KEY (`codCurso`) REFERENCES `Curso` (`codCurso`) ON DELETE CASCADE,
  CONSTRAINT `Turma_ibfk_3` FOREIGN KEY (`codDisciplina`) REFERENCES `Disciplina` (`codDisciplina`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Turma`
--

LOCK TABLES `Turma` WRITE;
/*!40000 ALTER TABLE `Turma` DISABLE KEYS */;
INSERT INTO `Turma` VALUES (1,'APO1301',1,1,2013,2,3,40,0,0,1),(2,'LP11301',1,19,2013,2,3,40,0,0,1),(3,'ING1301',1,15,2013,2,3,40,0,0,1),(4,'HCT1301',1,14,2013,2,3,40,0,0,1),(5,'MAT1301',1,22,2013,2,3,40,0,0,1),(6,'ARQ1301',1,4,2013,2,3,40,0,0,1),(7,'CEE1301',1,7,2013,2,3,40,0,0,1);
/*!40000 ALTER TABLE `Turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Turno`
--

DROP TABLE IF EXISTS `Turno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Turno` (
  `codTurno` int(11) NOT NULL,
  `nomeTurno` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codTurno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Turno`
--

LOCK TABLES `Turno` WRITE;
/*!40000 ALTER TABLE `Turno` DISABLE KEYS */;
INSERT INTO `Turno` VALUES (1,'Matutino'),(2,'Vespertino'),(3,'Noturno');
/*!40000 ALTER TABLE `Turno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario` (
  `codUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `identificacao` varchar(15) NOT NULL,
  `nomeUsuario` varchar(100) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `dataNas` date NOT NULL,
  `cpf` bigint(20) NOT NULL,
  `ingresso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(75) NOT NULL,
  `codTipoUsuario` int(11) NOT NULL,
  PRIMARY KEY (`codUsuario`),
  KEY `codTipoUsuario` (`codTipoUsuario`),
  CONSTRAINT `Usuario_ibfk_1` FOREIGN KEY (`codTipoUsuario`) REFERENCES `TipoUsuario` (`codTipoUsuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (1,'mat000001','Administrador','e00cf25ad42683b3df678c61f42c6bda','1970-01-08',12345678900,'2013-06-01 03:00:00','admin@admin.if',1),(2,'mat000002','Professor X','e10adc3949ba59abbe56e057f20f883e','1980-02-17',987654321,'2013-06-02 03:00:00','profx@prof.if',4),(3,'mat000003','Professor Y','fa1036a7356f25096297c40b43d508fb','1979-09-22',987650078,'2013-06-02 03:00:00','profy@prof.if',4),(4,'mat000004','Professor W','af052076ec5d117ff6f16f616d436b19','1978-11-25',3984454321,'2014-01-01 02:00:00','profw@prof.if',4),(5,'160011111','Aluno A','f1887d3f9e6ee7a32fe5e76f4ab80d63','1990-03-12',99999998999,'2016-01-01 02:00:00','alunoa@aluno.if',5),(6,'150011456','Aluno B','5961f2505be01e4022aa387b4fd3b617','1995-04-03',98888988889,'2015-02-01 02:00:00','alunob@aluno.if',5),(7,'140011789','Aluno C','58eda19795477cda385783b84ee92827','1985-05-10',30012456789,'2014-02-15 02:00:00','alunoc@aluno.if',5),(8,'170011213','Aluno D','d6a9a933c8aafc51e55ac0662b6e4d4a','1991-10-16',99999000099,'2017-02-02 02:00:00','alunod@aluno.if',5),(9,'170011982','Aluno E','339832539ac6b3f54bbed74dc56269d0','1997-07-07',99111998999,'2017-02-02 02:00:00','alunoe@aluno.if',5),(10,'130011458','Aluno F','9d2f4c128d74dd2555b232799150e97b','1988-06-13',93129998999,'2013-06-01 03:00:00','alunof@aluno.if',5),(11,'160011147','Aluno G','4277e6ee55f246e89a60d84e8b275b82','1959-07-31',12345678911,'2016-02-02 02:00:00','alunoG@aluno.if',5);
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-05 21:42:08
