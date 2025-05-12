CREATE DATABASE estoque;
USE estoque;

CREATE TABLE fornecedores (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	contato VARCHAR(100)
);

CREATE TABLE produtos (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	quantidade INT NOT NULL,
	preco DECIMAL(8,2) NOT NULL
);

CREATE TABLE estoque (
	id INT AUTO_INCREMENT PRIMARY KEY,
	id_produto INT NOT NULL,
	id_fornecedor INT NOT NULL,
	quantidade INT NOT NULL,
	data_entrada DATE NOT NULL,
	FOREIGN KEY (id_produto) REFERENCES produtos(id),
	FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id)
);

INSERT INTO fornecedores (nome, contato) VALUES
('Distribuidora Alpha', 'alpha@fornecedores.com'),
('Comercial Beta', 'beta@fornecedores.com'),
('Atacadão XPTO', 'contato@xpto.com');

INSERT INTO produtos (nome, quantidade, preco) VALUES
('Caderno Universitário', 120, 14.90),
('Caneta Azul', 300, 2.50),
('Mochila Escolar', 50, 89.99),
('Lápis Preto', 500, 1.25),
('Estojo Escolar', 80, 15.00);

INSERT INTO estoque (id_produto, id_fornecedor, quantidade, data_entrada) VALUES
(1, 1, 100, '2025-05-10'),
(2, 2, 200, '2025-05-11'),
(3, 1, 30,  '2025-05-12'),
(4, 3, 400, '2025-05-13'),
(5, 2, 60,  '2025-05-14');

SELECT * FROM produtos WHERE preco > 50;

SELECT id_produto, SUM(quantidade) AS total_entrada FROM estoque GROUP BY id_produto;

SELECT 
	produtos.nome AS Nome_Produto,
    fornecedores.nome AS Nome_Fornecedor,
    estoque.quantidade,
    estoque.data_entrada
FROM estoque
INNER JOIN produtos ON estoque.id_produto = produtos.id
INNER JOIN fornecedores ON estoque.id_fornecedor = fornecedores.id;

SELECT 
	produtos.nome AS Nome_Produto,
    fornecedores.nome AS Nome_Fornecedor
FROM estoque
INNER JOIN produtos ON estoque.id_produto = produtos.id
INNER JOIN fornecedores ON estoque.id_fornecedor = fornecedores.id
WHERE fornecedores.nome LIKE "%Beta%";
