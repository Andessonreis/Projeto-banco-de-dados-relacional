-- Criando a tabela problema
CREATE TABLE IF NOT EXISTS problema (
  id INT PRIMARY KEY,
  nome_problema VARCHAR(100),
  descricao VARCHAR(100)
);

-- Criando a tabela manutenção
CREATE TABLE IF NOT EXISTS manutencao (
  id INT PRIMARY KEY,
  id_problema INT,
  placa VARCHAR(10),
  FOREIGN KEY (placa) REFERENCES veiculos(placa) ON DELETE CASCADE,
  FOREIGN KEY (id_problema) REFERENCES problema(id) ON DELETE CASCADE
);

-- Tabela do registro das manutenções
CREATE TABLE IF NOT EXISTS registro_manutencao (
  id INT PRIMARY KEY,
  id_manutencao INT,
  custo DECIMAL(10,3),
  data_entrada DATE,
  prioridade BOOLEAN,
  FOREIGN KEY (id_manutencao) REFERENCES manutencao(id) ON DELETE CASCADE
);

-- Inserindo os dados na tabela problema
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
