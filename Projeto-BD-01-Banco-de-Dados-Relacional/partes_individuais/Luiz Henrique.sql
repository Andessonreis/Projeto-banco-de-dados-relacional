-- crio a table veiculo
CREATE TABLE veiculos (
  placa VARCHAR(10),
  cor VARCHAR(20),
  data_de_aquisicao DATE,
  esta_em_manutencao BOOLEAN,
  km DECIMAL(10, 2),
  id_modelo INT,
  PRIMARY KEY (placa),
  FOREIGN KEY (id_modelo) REFERENCES modelo(id)
);
-- insiro os dados na table veiculo
INSERT INTO veiculos (placa, cor, data_de_aquisicao, esta_em_manutencao, km, id_modelo)
VALUES
  ('KBE-3742', 'Preto', '2020-03-15', TRUE, 13000, 1),
  ('JXY-9411', 'Azul', '2018-10-24', FALSE, 20000, 2),
  ('OJU-7266', 'Vermelho', '2019-06-05', TRUE, 30000, 3);
-- crio a table modelo
CREATE TABLE modelo (
  id INT PRIMARY KEY,
  marca VARCHAR(50),
  n_portas INT,
  n_assentos INT,
  t_combustivel VARCHAR(20),
  ano INT
);
-- aqui eu insiro os dados table modelo
INSERT INTO modelo (id, marca, n_portas, n_assentos, t_combustivel, ano)
VALUES
  (1, 'Jeep', 4, 5, 'Diesel', 2020),
  (2, 'Chevrolet', 4, 5, 'Álcool', 2018),
  (3, 'Ford', 4, 5, 'Gasolina', 2019);

-- agr dou select pra ver as tabelas  
SELECT * FROM modelo;
SELECT * FROM veiculos;
-- qualque coisa e so mandar um waskzapp =)