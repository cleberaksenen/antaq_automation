SELECT
    CASE
        WHEN UF = 'CE' THEN 'Ceará'
        WHEN RegiaoGeografica = 'Nordeste' THEN 'Nordeste'
        ELSE 'Brasil'
    END AS Localidade,
    
    Ano_Inicio_Operacao AS Ano,
    Mes_Inicio_Operacao AS Mes,
    
    COUNT(IDAtracacao) AS Numero_Atracoes,

    AVG(DATEDIFF(HOUR, DataAtracacao, DataChegada)) AS Tempo_Espera_Horas,

    AVG(DATEDIFF(HOUR, DataAtracacao, DataDesatracacao)) AS Tempo_Atracado_Horas

FROM
    atracacao_fato
WHERE
    Ano_Inicio_Operacao IN (2021, 2023)

    AND (
        UF = 'CE'  -- Ceará
        OR RegiaoGeografica = 'Nordeste'  -- Nordeste
        OR UF IS NOT NULL  -- Brasil (geral)
    )
GROUP BY
    Localidade, Ano, Mes
ORDER BY
    Localidade, Ano, Mes;
