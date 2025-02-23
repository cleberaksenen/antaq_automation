-- Criar o banco de dados
CREATE DATABASE fiec_antaq;
USE fiec_antaq;

-- Criar a tabela "atracacao_fato"
CREATE TABLE atracacao_fato (
    IDAtracacao INT PRIMARY KEY,
    Tipo_Navegacao_Atracacao TEXT,
    CDTUP VARCHAR(7),
    Nacionalidade_Armador INT,
    IDBerco VARCHAR(11),
    FlagMCOperacaoAtracacao INT,
    Berco TEXT,
    Terminal TEXT,
    Porto_Atracacao TEXT,
    Municipio TEXT,
    Apelido_Instalacao_Portuaria TEXT,
    UF TEXT,
    Complexo_Portuario TEXT,
    SGUF VARCHAR(2),
    Tipo_Autoridade_Portuaria TEXT,
    Regiao_Geografica TEXT,
    No_Capitania BIGINT,
    No_IMO BIGINT,
    Data_Atracacao DATETIME,
    Data_Chegada DATETIME,
    Data_Desatracacao DATETIME,
    Data_Inicio_Operacao DATETIME,
    Data_Termino_Operacao DATETIME,
    Tipo_Operacao TEXT,
    Ano_Inicio_Operacao INT,
    Mes_Inicio_Operacao INT
);

-- Criar a tabela "carga_fato"
CREATE TABLE carga_fato (
    IDCarga INT PRIMARY KEY,
    IDAtracacao INT,
    Origem VARCHAR(10),
    Destino VARCHAR(10),
    CDMercadoria VARCHAR(10),
    Tipo_Operacao_Carga VARCHAR(50),
    Carga_Geral_Acondicionamento VARCHAR(255),
    ConteinerEstado VARCHAR(50),
    Tipo_Navegacao VARCHAR(50),
    FlagAutorizacao CHAR(1),
    Percurso_Transporte_Vias_Interiores VARCHAR(255),
    Percurso_Transporte_Interiores VARCHAR(255),
    STNaturezaCarga VARCHAR(50),
    STSH2 VARCHAR(50),
    STSH4 VARCHAR(50),
    Natureza_Carga VARCHAR(100),
    Sentido VARCHAR(50),
    TEU INT,
    QTCarga INT,
    VLPesoCargaBruta DECIMAL(15,6),
    FOREIGN KEY (IDAtracacao) REFERENCES atracacao_fato(IDAtracacao)
);

-- Índices para otimização
CREATE INDEX idx_atracacao_data ON atracacao_fato(Data_Atracacao);
CREATE INDEX idx_carga_tipo_navegacao ON carga_fato(Tipo_Navegacao);
CREATE INDEX idx_carga_porto ON carga_fato(Porto_Atracacao);