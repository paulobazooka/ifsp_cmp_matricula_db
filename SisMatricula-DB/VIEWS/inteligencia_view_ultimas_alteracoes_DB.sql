use SisMatricula;
DROP VIEW IF EXISTS inteligencia_view_ultimas_alteracoes_DB;
CREATE VIEW inteligencia_view_ultimas_alteracoes_DB AS
select * from TabelaAlteracoes order by horaAlteracao DESC LIMIT 20;