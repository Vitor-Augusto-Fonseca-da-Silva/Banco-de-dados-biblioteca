CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE administracao(
	Id INT(8) PRIMARY KEY AUTO_INCREMENT,
    login VARCHAR(45) NOT NULL,
    senha VARCHAR(45) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(45) NOT NULL UNIQUE,
    genero VARCHAR(45) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    telefone VARCHAR(45) NOT NULL,
    cargo VARCHAR(45) NOT NULL
);

CREATE TABLE usuario(
	Id INT(8) PRIMARY KEY AUTO_INCREMENT,
    login VARCHAR(45) NOT NULL,
    senha VARCHAR(45) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(45) NOT NULL,
    genero VARCHAR(45) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    telefone VARCHAR(45) NOT NULL
);

CREATE TABLE autor(
	Id INT(8) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    genero VARCHAR(45) NOT NULL,
    nacionalidade VARCHAR(45) NOT NULL
);

CREATE TABLE editora(
	Id INT(8) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    nacionalidade VARCHAR(45) NOT NULL
);

CREATE TABLE categoria(
	Id INT(8) PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(45) NOT NULL
);

CREATE TABLE livro(
	Id INT(8) AUTO_INCREMENT,
    ISBN VARCHAR(45),
    edicao VARCHAR(45) NOT NULL,
    qtde_paginas VARCHAR(45) NOT NULL,
    ano VARCHAR(45) NOT NULL,
    titulo VARCHAR(45) NOT NULL,
    idioma VARCHAR(45) NOT NULL,
    situacao VARCHAR(45) NOT NULL,
    id_autor INT(8) NOT NULL,
    id_editora INT(8) NOT NULL,
    id_categoria INT(8) NOT NULL,
	id_administracao INT(8),
    FOREIGN KEY (id_autor) REFERENCES autor(id),
    FOREIGN KEY (id_editora) REFERENCES editora(id),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id),
    FOREIGN KEY (id_administracao) REFERENCES administracao(id),
    PRIMARY KEY (id,ISBN)
);

CREATE TABLE emprestimo(
	Id INT(8) PRIMARY KEY AUTO_INCREMENT,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE NOT NULL,
    valor_multa FLOAT,
    situacao_emprestimo VARCHAR(45) NOT NULL,
    id_livro INT(8) NOT NULL,
    id_administracao INT(8),
    id_usuario INT(8) NOT NULL,
	FOREIGN KEY (id_livro) REFERENCES livro(id),
	FOREIGN KEY (id_administracao) REFERENCES administracao(id),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);