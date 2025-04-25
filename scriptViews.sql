-- VIEW 1: idh pib escolaridade media
-- Objetivo: Comparar o IDH médio, PIB médio e a taxa média de escolaridade por região (considerando todos os anos).
CREATE VIEW view_idh_pib_escolaridade_media AS
SELECT 
    r.nomeRegiao,
    ROUND(AVG(p.valorPIB), 2) AS mediaPIB,
    ROUND(AVG(i.valorIDH), 3) AS mediaIDH,
    ROUND(AVG(e.taxaEscolaridade), 2) AS mediaEscolaridade
FROM Regiao r
JOIN PIB p ON r.idRegiao = p.Regiao_idRegiao
JOIN IDH i ON r.idRegiao = i.Regiao_idRegiao AND i.Ano_idAno = p.Ano_idAno
JOIN Escolaridade e ON r.idRegiao = e.Regiao_idRegiao AND e.Ano_idAno = p.Ano_idAno
WHERE e.nivelEscolaridade = 'Ensino Médio'
GROUP BY r.nomeRegiao;



-- VIEW 2: idh vs pib por ano
-- Objetivo: Ver a evolução temporal do IDH e PIB por região ano a ano. Vai ajudar a entender como o crescimento econômico acompanha (ou não) o desenvolvimento humano.
CREATE VIEW view_idh_vs_pib_por_ano AS
SELECT 
    a.ano,
    r.nomeRegiao,
    p.valorPIB,
    i.valorIDH
FROM PIB p
JOIN IDH i ON p.Ano_idAno = i.Ano_idAno AND p.Regiao_idRegiao = i.Regiao_idRegiao
JOIN Ano a ON p.Ano_idAno = a.idAno
JOIN Regiao r ON p.Regiao_idRegiao = r.idRegiao
ORDER BY a.ano, r.nomeRegiao;

-- VIEW 3: idh escolaridade superior
-- Objetivo: Ver se níveis mais altos de escolaridade (Ensino Superior) têm impacto no IDH das regiões. Isso vair ajudar a entender o peso da formação superior no desenvolvimento humano.
CREATE VIEW view_idh_escolaridade_superior AS
SELECT 
    r.nomeRegiao,
    a.ano,
    i.valorIDH,
    e.taxaEscolaridade AS taxaEnsinoSuperior
FROM IDH i
JOIN Escolaridade e ON i.Regiao_idRegiao = e.Regiao_idRegiao AND i.Ano_idAno = e.Ano_idAno
JOIN Regiao r ON i.Regiao_idRegiao = r.idRegiao
JOIN Ano a ON i.Ano_idAno = a.idAno
WHERE e.nivelEscolaridade = 'Ensino Superior'
ORDER BY r.nomeRegiao, a.ano;
