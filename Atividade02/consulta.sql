WITH atracacao_temp AS (
    SELECT
        a.UF,
        a.Regiao_Geografica,
        YEAR(a.Data_Atracacao) AS Ano,
        MONTH(a.Data_Atracacao) AS Mes,
        COUNT(a.IDAtracacao) AS Numero_Atracacoes,
        SUM(DATEDIFF(a.Data_Inicio_Operacao, a.Data_Atracacao)) AS Tempo_Esperando,
        SUM(DATEDIFF(a.Data_Termino_Operacao, a.Data_Inicio_Operacao)) AS Tempo_Atracado
    FROM atracacao_fato a
    WHERE (a.UF = 'CE' OR a.Regiao_Geografica = 'Nordeste' OR a.UF IS NULL) -- Ceará, Nordeste e Brasil
    AND (YEAR(a.Data_Atracacao) IN (2021, 2023)) -- Apenas 2021 e 2023
    GROUP BY a.UF, a.Regiao_Geografica, YEAR(a.Data_Atracacao), MONTH(a.Data_Atracacao)
)
SELECT
    CASE 
        WHEN UF = 'CE' THEN 'Ceará'
        WHEN Regiao_Geografica = 'Nordeste' THEN 'Nordeste'
        ELSE 'Brasil'
    END AS Localidade,
    Ano,
    Mes,
    Numero_Atracacoes,
    Tempo_Esperando AS Tempo_Esperando (Horas),
    Tempo_Atracado AS Tempo_Atracado (Horas)
FROM atracacao_temp
ORDER BY Localidade, Ano, Mes;