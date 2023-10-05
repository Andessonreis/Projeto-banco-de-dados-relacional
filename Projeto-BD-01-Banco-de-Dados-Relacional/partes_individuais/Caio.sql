--Criação da tabela ALUGUEL, essa mesma, que é um relacionamento ternário entre funcionários, clientes e veiculos

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

--Inserindo na tabela ALUGUEL

INSERT INTO ALUGUEL (horario_do_aluguel,data_retirada,status_pagamento,valor_do_aluguel,data_devolucao,num_registro_cliente,placa_carro,id_funcionario)
VALUES('10:32:00', '2015-02-05', TRUE, 1259.00, '2015-02-25', '1', 'KBE-3742', '1'),
('12:28:00', '2019-04-23', FALSE, 950.00, '2019-05-28', '1', 'JXY-9411', '2'),
('19:52:00', '2020-03-01', TRUE, 1490.00, '2020-04-15', '3', 'OJU-7266', '3');


