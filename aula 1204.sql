-- DROP DATABASE HOSPITAL;

CREATE DATABASE IF NOT EXISTS HOSPITAL;
USE HOSPITAL;

CREATE TABLE IF NOT EXISTS CARGO(
ID_CARGO INT PRIMARY KEY,
NOME VARCHAR(45) NOT NULL);

CREATE TABLE IF NOT EXISTS RISCOS_OCUPACIONAIS(
ID_RISCOS INT PRIMARY KEY,
NOME VARCHAR(45) NOT NULL);

CREATE TABLE IF NOT EXISTS MEDICO(
ID_MEDICO INT PRIMARY KEY,
CRM INT NOT NULL,
NOME VARCHAR(100) NOT NULL,
CPF VARCHAR(20) NOT NULL,
ESPECIALIDADE VARCHAR(30) NOT NULL,
DATA_NASCIMENTO DATE NOT NULL,
ENDERECO VARCHAR(200) NOT NULL,
TELEFONE VARCHAR(20) NOT NULL);

CREATE TABLE IF NOT EXISTS TIPO_EXAME(
ID_TIPO_EXAME INT PRIMARY KEY,
TIPO VARCHAR(50) NOT NULL);

CREATE TABLE IF NOT EXISTS RESULTADO_EXAME(
ID_TIPO_RESULTADO_EXAME INT PRIMARY KEY,
TIPO VARCHAR(30) NOT NULL);

CREATE TABLE IF NOT EXISTS EMPRESA(
ID_EMPRESA INT PRIMARY KEY,
CNPJ VARCHAR(20) NOT NULL,
NOME_FANTASIA VARCHAR(50) NOT NULL,
ENDERECO VARCHAR(200) NOT NULL,
TELEFONE VARCHAR(20) NOT NULL,
EMPRESA_ID_EMPRESA INT NOT NULL,
CONSTRAINT EMP_EMP FOREIGN KEY (EMPRESA_ID_EMPRESA) REFERENCES EMPRESA(ID_EMPRESA));

CREATE TABLE IF NOT EXISTS ATESTADO(
ID_ATESTADO INT PRIMARY KEY,
RESULTADO_RISCOS VARCHAR(100) NOT NULL,
RESULTADO VARCHAR(100) NOT NULL,
OBSERVACOES VARCHAR(300) NOT NULL,
MEDICO_ID INT NOT NULL,
FOREIGN KEY (MEDICO_ID) REFERENCES MEDICO(ID_MEDICO));

CREATE TABLE IF NOT EXISTS EXAME(
ID_EXAME INT PRIMARY KEY,
ESPECIALIDADE VARCHAR(50) NOT NULL,
DATA_REALIZACAO DATE NOT NULL,
RESULTADO_EXAME_ID_TIPO_RESULTADO_EXAME INT NOT NULL,
TIPO_EXAME_ID_TIPO_EXAME INT NOT NULL,
CONSTRAINT EXA_RES FOREIGN KEY(RESULTADO_EXAME_ID_TIPO_RESULTADO_EXAME) REFERENCES RESULTADO_EXAME(ID_TIPO_RESULTADO_EXAME),
CONSTRAINT EXA_TIP FOREIGN KEY(TIPO_EXAME_ID_TIPO_EXAME) REFERENCES TIPO_EXAME(ID_TIPO_EXAME));

CREATE TABLE IF NOT EXISTS FUNCIONARIO(
ID_FUNCIONARIO INT PRIMARY KEY,
NOME VARCHAR(100) NOT NULL,
CPF VARCHAR(20) NOT NULL,
DATA_NASCIMENTO DATE NOT NULL,
ENDERECO VARCHAR(200) NOT NULL,
TELEFONE VARCHAR(20) NOT NULL,
EMPRESA_ID_EMPRESA INT NOT NULL,
CARGO_ID_CARGO INT NOT NULL,
CONSTRAINT FUN_EMP FOREIGN KEY (EMPRESA_ID_EMPRESA) REFERENCES EMPRESA(ID_EMPRESA),
CONSTRAINT FUN_CAR FOREIGN KEY (CARGO_ID_CARGO) REFERENCES CARGO(ID_CARGO));

CREATE TABLE IF NOT EXISTS FUNCIONARIO_HAS_EXAME(
EXAME_ID_EXAME INT,
FUNCIONARIO_ID_FUNCIONARIO INT,
PRIMARY KEY(EXAME_ID_EXAME, FUNCIONARIO_ID_FUNCIONARIO),
FOREIGN KEY (EXAME_ID_EXAME) REFERENCES EXAME(ID_EXAME),
FOREIGN KEY (FUNCIONARIO_ID_FUNCIONARIO) REFERENCES FUNCIONARIO(ID_FUNCIONARIO));

CREATE TABLE IF NOT EXISTS EMPRESA_HAS_EXAME(
EXAME_ID_EXAME INT,
EMPRESA_ID_EMPRESA INT,
PRIMARY KEY(EXAME_ID_EXAME, EMPRESA_ID_EMPRESA),
FOREIGN KEY(EXAME_ID_EXAME) REFERENCES EXAME(ID_EXAME),
FOREIGN KEY(EMPRESA_ID_EMPRESA) REFERENCES EMPRESA(ID_EMPRESA));

CREATE TABLE IF NOT EXISTS EXAME_HAS_ATESTADO(
EXAME_ID_EXAME INT,
ATESTADO_ID_ATESTADO INT,
PRIMARY KEY(EXAME_ID_EXAME, ATESTADO_ID_ATESTADO),
FOREIGN KEY(EXAME_ID_EXAME) REFERENCES EXAME(ID_EXAME),
FOREIGN KEY(ATESTADO_ID_ATESTADO) REFERENCES ATESTADO(ID_ATESTADO));

CREATE TABLE IF NOT EXISTS CARGO_HAS_RISCOS_OCUPACIONAIS(
CARGO_ID_CARGO INT,
RISCOS_OCUPACIONAIS_ID_RISCOS INT,
PRIMARY KEY(CARGO_ID_CARGO, RISCOS_OCUPACIONAIS_ID_RISCOS),
FOREIGN KEY(CARGO_ID_CARGO) REFERENCES CARGO(ID_CARGO),
FOREIGN KEY(RISCOS_OCUPACIONAIS_ID_RISCOS) REFERENCES RISCOS_OCUPACIONAIS(ID_RISCOS));