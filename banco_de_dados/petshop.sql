-- Tabela CLIENTES
CREATE TABLE CLIENTES (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(200)
);

-- Tabela PETS
CREATE TABLE PETS (
    id_pet INT PRIMARY KEY,
    nome VARCHAR(100),
    raca VARCHAR(50),
    peso DECIMAL(5, 2),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTES(id_cliente)
);

-- Tabela SERVIÇOS
CREATE TABLE SERVICOS (
    id_servico INT PRIMARY KEY,
    tipo_servico VARCHAR(100),
    valor DECIMAL(10, 2),
    ativo BOOLEAN
);

-- Tabela FUNCIONÁRIOS
CREATE TABLE FUNCIONARIOS (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    funcao VARCHAR(100),
    salario DECIMAL(10, 2)
);

-- Tabela PRODUTOS
CREATE TABLE PRODUTOS (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(100),
    valor_produto DECIMAL(10, 2)
);


# Quantos serviços o funcionário realizou:
SELECT f.nome AS nome_funcionario, COUNT(*) AS quantidade_servicos_realizados
FROM FUNCIONARIOS f
JOIN SERVICOS_REALIZADOS sr ON f.id_funcionario = sr.id_funcionario
GROUP BY f.nome;

# Quantos serviços o cliente contratou:
SELECT c.nome AS nome_cliente, COUNT(*) AS quantidade_servicos_contratados
FROM CLIENTES c
JOIN PETS p ON c.id_cliente = p.id_cliente
JOIN SERVICOS_REALIZADOS sr ON p.id_pet = sr.id_pet
GROUP BY c.nome;

# Qual o estoque de produtos:
SELECT nome_produto, SUM(quantidade) AS estoque
FROM PRODUTOS_ESTOQUE
GROUP BY nome_produto;

# Relação de cliente e pets:
SELECT c.nome AS nome_cliente, p.nome AS nome_pet
FROM CLIENTES c
JOIN PETS p ON c.id_cliente = p.id_cliente;

#Faturamento:
SELECT SUM(valor) AS faturamento_total
FROM SERVICOS_REALIZADOS;