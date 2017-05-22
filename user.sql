
-- Rotina para Deletar se existir os usários que utilizarão o sistema de matrícula
DROP USER if exists 'admin'@'localhost';       -- administrador do sistema 
DROP USER if exists 'aluno'@'localhost';       -- aluno
DROP USER if exists 'professor'@'locahost';    -- professor
DROP USER if exists 'tecnicoadm'@'localhost';  -- tecnico administrativo do instituto (CRE)
DROP USER if exists 'coordenador'@'localhost'; -- coordenador do curso

CREATE USER 'admin'@'localhost'        -- cria usuario administrador   
IDENTIFIED BY '@dministr4DOR';

CREATE USER 'coordenador'@'localhost'  -- cria usuario coordenador
IDENTIFIED BY 'c00rden@dorIFSP';
 
CREATE USER 'aluno'@'localhost'        -- cria usuario aluno
IDENTIFIED BY '@lun0IFSP';

CREATE USER 'professor'@'localhost'    -- cria usuario professor 
IDENTIFIED BY 'pr0fe$$orIFSP';

CREATE USER 'tecnicoadm'@'localhost'   -- cria usuario tecnico administrativo
IDENTIFIED BY 'tecn1co@dmIFSP';

USE SisMatricula;
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost';  -- garante privilegio total ao banco de dados SisMatricula ao administrador
/*
GRANT SELECT, UPDATE ON Usuario.
