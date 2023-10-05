-- Tabela Endereços
CREATE TABLE IF NOT EXISTS enderecos(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  uf VARCHAR(3),
  cidade VARCHAR(255),
  bairro VARCHAR(255),
  logradouro VARCHAR(255),
  numero INTEGER
);

-- Inserindo valores na tabela endereços
INSERT INTO enderecos(uf, cidade, bairro, logradouro, numero) 
VALUES 	('BA', 'IRECÊ', 'BARRIO1', 'RUA1', 100),
		    ('SP', 'SPCITY', 'BARRIO2', 'RUA1', 101),
		    ('RJ', 'RJCITY', 'BARRIO3', 'RUA3', 102),
		    ('SC', 'SCCITY', 'BARRIO4', 'RUA4', 103),
		    ('MT', 'MTCITY', 'BARRIO5', 'RUA5', 104);

SELECT * FROM enderecos;

-- Tabela Contatos
CREATE TABLE IF NOT EXISTS contatos(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  telefone VARCHAR(255),
  email VARCHAR(255) UNIQUE
);

-- Inserindo valores na tabela contatos
INSERT INTO contatos(telefone, email)
VALUES	('74-999999999', 'pessoa1@gmail.com'),
		    ('74-999999998', 'pessoa2@gmail.com'),
		    ('74-999999997', 'pessoa3@gmail.com'),
        ('74-999999996', 'pessoa4@gmail.com'),
        ('74-999999995', 'pessoa5@gmail.com');
SELECT * FROM contatos;

-- Tablea de cnhs
CREATE TABLE IF NOT EXISTS cnhs(
  numero_carteira VARCHAR(14) PRIMARY KEY,
  categoria_habilitacao  VARCHAR(10),
  data_validade DATE
);

-- Inserindo valores na tabela cnhs
INSERT INTO cnhs(numero_carteira, categoria_habilitacao, data_validade)
VALUES	('12345678901', 'A', '2024-10-5'),
		    ('12345678902', 'AB', '2024-10-6'),
        ('12345678903', 'AB', '2024-10-7'),
        ('12345678904', 'B', '2024-10-8'),
        ('12345678905', 'B', '2024-10-9');
SELECT * FROM cnhs;

-- Criando tabela clientes
CREATE TABLE IF NOT EXISTS clientes( 
  cpf VARCHAR(12) PRIMARY KEY, 
  nome VARCHAR(255),
  data_nascimento DATE,
  id_endereco INTEGER,
  id_cnh VARCHAR(14),
  id_contato INTEGER,
  FOREIGN KEY (id_endereco) REFERENCES enderecos(id),
  FOREIGN KEY (id_cnh) REFERENCES cnhs(numero_carteira),
  FOREIGN KEY (id_contato) REFERENCES contatos(id)
  ); 

-- Inserindo valores na tabela clientes
  INSERT INTO clientes(cpf, nome, data_nascimento, id_endereco,id_cnh,id_contato)
VALUES	 ('12345678910', 'Almarir souza', '1980-01-20', 1,'12345678901', 1),
         ('12345678911', 'Almarir silva', '1990-10-25', 2,'12345678902', 2),
			   ('12345678912', 'Fernando costa', '2000-11-18', 3,'12345678903', 3),
         ('12345678913', 'Alirio silva', '2005-05-19', 4,'12345678904', 4),
         ('12345678914', 'Mauricio de costa', '2000-05-10', 5,'12345678905', 5);
            
SELECT * FROM clientes;