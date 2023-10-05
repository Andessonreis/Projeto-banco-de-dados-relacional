CREATE DATABASE IF NOT EXISTS tt_sis_vei;
USE tt_sis_vei;

-- ############## ESCOPO DAS INFORMAÇÕES PESSOAIS ##############
CREATE TABLE IF NOT EXISTS enderecos(
	id INTEGER AUTO_INCREMENT,
    uf VARCHAR(3),
    cidade VARCHAR(50),
    bairro VARCHAR(50),
    logradouro VARCHAR(50),
    numero INTEGER,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS contatos(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  telefone VARCHAR(255),
  email VARCHAR(255) UNIQUE
);

CREATE TABLE IF NOT EXISTS informacoes_pessoais(
    cpf VARCHAR(12),
    nome VARCHAR(50),
    data_nascimento DATE,
    PRIMARY KEY(cpf)
);

-- ############## ESCOPO DO FUNCIONÁRIO ##############

CREATE TABLE IF NOT EXISTS cargos(
	id INTEGER AUTO_INCREMENT,
    nome VARCHAR(50),
    salario FLOAT,
    PRIMARY KEY(id)
);

-- CREATE INDEX idx_cargos_id ON cargos (id);

CREATE TABLE IF NOT EXISTS funcionarios(
	id INTEGER AUTO_INCREMENT,
    informacoes VARCHAR(12),
    endereco INTEGER,
    cargo INTEGER,
    PRIMARY KEY(id),
    FOREIGN KEY(informacoes) REFERENCES informacoes_pessoais(cpf),
    FOREIGN KEY(endereco) REFERENCES enderecos(id),
    FOREIGN KEY(cargo) REFERENCES cargos(id)
);

INSERT INTO contatos(telefone, email) VALUES
	('74999112233', 'user@gmail.com'),
	('74999112234', 'user2@gmail.com'),
	('74999122335', 'user3@gmail.com'),
  ('74999122336', 'user4@gmail.com'),
  ('74999122337', 'user5@gmail.com'),
  ('74999122338', 'user6@gmail.com');
    
INSERT INTO informacoes_pessoais(cpf, nome, data_nascimento) VALUES
	('12345678901', 'Tadeu Amaral',     '1999-10-10'),
	('12345678902', 'Jeremias Silva',   '1980-10-10'),
	('12345678903', 'Astrovildo Silva', '1980-10-10'),
  ('12345678904', 'Ildebram Costa',   '1980-10-10'),
  ('12345678905', 'Yago Fernandes',   '1980-10-10'),
  ('12345678906', 'Almarir Lopes',    '1980-10-10');

INSERT INTO enderecos(uf, cidade, bairro, logradouro, numero) VALUES
	('BA', 'Irecê', 'Bairro 1', 'Rua 1', 20),
	('BA', 'Irecê', 'Bairro 2', 'Rua 2', 21),
	('BA', 'Irecê', 'Bairro 3', 'Rua 3', 22),
  ('BA', 'Irecê', 'Bairro 4', 'Rua 4', 23),
  ('BA', 'Irecê', 'Bairro 5', 'Rua 5', 24),
  ('BA', 'Irecê', 'Bairro 6', 'Rua 6', 25);
    
INSERT INTO cargos(nome, salario) VALUES
	('Estagiário', 603.00),
	('Vendedor', 964.80),
	('Gerente', 1543.68);
    
INSERT INTO funcionarios(informacoes, endereco, cargo) VALUES
	('12345678901', 1, 1),
	('12345678902', 2, 2),
	('12345678903', 3, 3);

-- ############## ESCOPO DO CLIENTE ############## 


CREATE TABLE IF NOT EXISTS cnhs(
  numero_carteira VARCHAR(14) PRIMARY KEY,
  categoria_habilitacao  VARCHAR(10),
  data_validade DATE
);

CREATE TABLE IF NOT EXISTS clientes(
  id INTEGER PRIMARY KEY  AUTO_INCREMENT,
  id_informacoes VARCHAR(12),
  id_endereco INTEGER,
  id_cnh VARCHAR(14),
  id_contato INTEGER,
  FOREIGN KEY (id_endereco) REFERENCES enderecos(id),
  FOREIGN KEY (id_cnh) REFERENCES cnhs(numero_carteira),
  FOREIGN KEY (id_contato) REFERENCES contatos(id),
  FOREIGN KEY (id_informacoes) REFERENCES informacoes_pessoais(cpf)
);

INSERT INTO cnhs(numero_carteira, categoria_habilitacao, data_validade)
VALUES	('00345678901', 'A', '2024-10-5'),
		    ('00345678902', 'AB', '2024-10-6'),
        ('00345678903', 'AB', '2024-10-7');

INSERT INTO clientes(id_informacoes, id_endereco, id_cnh, id_contato)
VALUES	('12345678904', 4, '00345678901', 4),
        ('12345678905', 5, '00345678902', 5),
        ('12345678906', 6, '00345678903', 6);


-- ############## ESCOPO DO VEICULO ############## 
CREATE TABLE modelos (
  id INTEGER,
  marca VARCHAR(50),
  n_portas INT,
  n_assentos INT,
  t_combustivel VARCHAR(20),
  ano INTEGER,
  PRIMARY KEY(id)
);

CREATE TABLE veiculos (
  placa VARCHAR(10),
  cor VARCHAR(20),
  data_de_aquisicao DATE,
  esta_em_manutencao BOOLEAN,
  km DECIMAL(10, 2),
  id_modelo INT,
  PRIMARY KEY (placa),
  FOREIGN KEY (id_modelo) REFERENCES modelos(id)
);

INSERT INTO modelos (id, marca, n_portas, n_assentos, t_combustivel, ano)
VALUES
  (1, 'Jeep', 4, 5, 'Diesel', 2020),
  (2, 'Chevrolet', 4, 5, 'Álcool', 2018),
  (3, 'Ford', 4, 5, 'Gasolina', 2019);
  
INSERT INTO veiculos (placa, cor, data_de_aquisicao, esta_em_manutencao, km, id_modelo)
VALUES
  ('KBE-3742', 'Preto', '2020-03-15', TRUE, 13000, 1),
  ('JXY-9411', 'Azul', '2018-10-24', FALSE, 20000, 2),
  ('OJU-7266', 'Vermelho', '2019-06-05', TRUE, 30000, 3);
  
-- ############## ESCOPO DO ALUGUEL ############## 

CREATE TABLE IF NOT EXISTS ALUGUEL(
id_reserva INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id_reserva),
horario_do_aluguel TIME,
data_retirada DATE,
status_pagamento BOOLEAN,
valor_do_aluguel FLOAT,
data_devolucao DATE,
num_registro_cliente INT,
placa_carro VARCHAR(10),
id_funcionario INT,
FOREIGN KEY(id_funcionario) REFERENCES funcionarios(id),
FOREIGN KEY(placa_carro) REFERENCES veiculos(placa),
FOREIGN KEY(num_registro_cliente) REFERENCES clientes (id)
);



INSERT INTO ALUGUEL (horario_do_aluguel,data_retirada,status_pagamento,valor_do_aluguel,data_devolucao,num_registro_cliente,placa_carro,id_funcionario)
VALUES('10:32:00', '2015-02-05', TRUE, 1259.00, '2015-02-25', '1', 'KBE-3742', '1'),
('12:28:00', '2019-04-23', FALSE, 950.00, '2019-05-28', '1', 'JXY-9411', '2'),
('19:52:00', '2020-03-01', TRUE, 1490.00, '2020-04-15', '3', 'OJU-7266', '3');

-- ############## ESCOPO DO PROBLEMAS DE MANUTENÇÃO ############## 

CREATE TABLE IF NOT EXISTS problema (
  id INTEGER PRIMARY KEY,
  nome_problema VARCHAR(100),
  descricao VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS manutencao (
  id INTEGER PRIMARY KEY,
  id_problema INTEGER,
  placa VARCHAR(10),
  FOREIGN KEY (placa) REFERENCES veiculos(placa) ON DELETE CASCADE,
  FOREIGN KEY (id_problema) REFERENCES problema(id) ON DELETE CASCADE
);

-- Tabela do registro das manutenções
CREATE TABLE IF NOT EXISTS registro_manutencao (
  id INTEGER PRIMARY KEY,
  id_manutencao INT,
  custo DECIMAL(10,3),
  data_entrada DATE,
  prioridade BOOLEAN,
  FOREIGN KEY (id_manutencao) REFERENCES manutencao(id) ON DELETE CASCADE
);

INSERT INTO problema (id, nome_problema, descricao)
VALUES (1, 'Problema de ignicao', 'O veículo não liga ou demora muito para ligar quando a chave é virada'),
       (2, 'Barulho no motor', 'O motor faz barulhos incomuns durante a condução'),
       (3, 'Problema de freio', 'Os freios não respondem adequadamente quando acionados');


INSERT INTO manutencao (id, placa, id_problema)
VALUES
  (1, 'KBE-3742', 1),
  (2, 'JXY-9411', 2),
  (3, 'OJU-7266', 3);

INSERT INTO registro_manutencao (id, id_manutencao, custo, data_entrada, prioridade)
VALUES
  (1, 1, 4200.00, '2022-03-19', TRUE),
  (2, 2, 15000.00, '2022-02-04', FALSE),
  (3, 3, 300.00, '2022-03-01', FALSE);

SELECT * FROM veiculos;
-- DROP DATABASE tt_sis_vei;

