CREATE DATABASE IF NOT EXISTS IndicadoresSociais;
USE IndicadoresSociais;

-- Tabela Ano
CREATE TABLE Ano (
    idAno INT AUTO_INCREMENT PRIMARY KEY,
    ano YEAR
);

-- Tabela Regiao
CREATE TABLE Regiao (
    idRegiao INT AUTO_INCREMENT PRIMARY KEY,
    nomeRegiao VARCHAR(45)
);

-- Tabela PIB
CREATE TABLE PIB (
    idPIB INT AUTO_INCREMENT PRIMARY KEY,
    valorPIB DECIMAL(20,2),
    Ano_idAno INT,
    Regiao_idRegiao INT,
    FOREIGN KEY (Ano_idAno) REFERENCES Ano(idAno),
    FOREIGN KEY (Regiao_idRegiao) REFERENCES Regiao(idRegiao)
);

-- Tabela IDH
CREATE TABLE IDH (
    idIDH INT AUTO_INCREMENT PRIMARY KEY,
    valorIDH INT,
    Ano_idAno INT,
    Regiao_idRegiao INT,
    FOREIGN KEY (Ano_idAno) REFERENCES Ano(idAno),
    FOREIGN KEY (Regiao_idRegiao) REFERENCES Regiao(idRegiao)
);

-- Tabela Escolaridade
CREATE TABLE Escolaridade (
    idEscolaridade INT AUTO_INCREMENT PRIMARY KEY,
    nivelEscolaridade VARCHAR(45),
    taxaEscolaridade INT,
    Ano_idAno INT,
    Regiao_idRegiao INT,
    FOREIGN KEY (Ano_idAno) REFERENCES Ano(idAno),
    FOREIGN KEY (Regiao_idRegiao) REFERENCES Regiao(idRegiao)
);

