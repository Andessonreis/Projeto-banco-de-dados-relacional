CREATE DATABASE tt_sis_vei;
USE tt_sis_vei;
-- Cração de tabelas



CREATE TABLE IF NOT EXISTS cargos(
	id INTEGER AUTO_INCREMENT,
    nome VARCHAR(50),
    salario FLOAT,
    PRIMARY KEY(id)
);

-- CREATE INDEX idx_cargos_id ON cargos (id);

CREATE TABLE IF NOT EXISTS informacoes_funcionario(
    cpf VARCHAR(12),
    nome VARCHAR(50),
    data_nascimento DATE,
    PRIMARY KEY(cpf)
);

CREATE TABLE IF NOT EXISTS enderecos( -- essa aqui não precisa pois ja foi definido mais if da no mesmo
	id INTEGER AUTO_INCREMENT,
    uf VARCHAR(3),
    cidade VARCHAR(50),
    bairro VARCHAR(50),
    logradouro VARCHAR(50),
    numero INTEGER,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS funcionarios(
	id INTEGER AUTO_INCREMENT,
    informacoes VARCHAR(12),
    endereco INTEGER,
    cargo INTEGER,
    PRIMARY KEY(id),
    FOREIGN KEY(informacoes) REFERENCES informacoes_funcionario(cpf),
    FOREIGN KEY(endereco) REFERENCES enderecos(id),
    FOREIGN KEY(cargo) REFERENCES cargos(id)
);

-- inserindo nas tabelas 

INSERT INTO informacoes_funcionario(cpf, nome, data_nascimento) VALUES
	('12345678901', 'Jeremias Silva', 1999-10-10), -- As datas tbm tem que ter ''
	('12345678902', 'Jeremias Silva', 1977-10-10),
	('12345678903', 'Jeremias Silva', 1980-10-10);

INSERT INTO enderecos(uf, cidade, bairro, logradouro, numero) VALUES
	('BA', 'Irecê', 'Bairro 1', 'Rua 1', 20),
	('BA', 'Irecê', 'Bairro 2', 'Rua 2', 21),
	('BA', 'Irecê', 'Bairro 3', 'Rua 3', 22);
    
INSERT INTO cargos(nome, salario) VALUES
	('Estagiário', 603.00),
	('Vendedor', 964.80),
	('Gerente', 1543.68);
    
INSERT INTO funcionarios(informacoes, endereco, cargo) VALUES
	('12345678901', 1, 1),
	('12345678902', 2, 2),
	('12345678903', 3, 3);
    

    
DROP DATABASE tt_sis_vei;
    