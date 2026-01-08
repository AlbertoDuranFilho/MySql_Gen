CREATE DATABASE db_cidade_das_carnes;

USE db_cidade_das_carnes;

CREATE TABLE tb_categorias (
    id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,             
    tipo_conservacao VARCHAR(30) NOT NULL, 
    origem VARCHAR(30) NOT NULL,           
    descricao VARCHAR(255)
);

CREATE TABLE tb_produtos (
    id_produto BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    preco_kg DECIMAL(10,2) NOT NULL,
    estoque_kg DECIMAL(10,2) NOT NULL,
    corte VARCHAR(60) NOT NULL,
    validade DATE,
    id_categoria BIGINT NOT NULL,
    CONSTRAINT fk_produtos_categorias
        FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_categorias (nome, tipo_conservacao, origem, descricao) VALUES
('Bovinos', 'Resfriado', 'Nacional', 'Carnes bovinas e cortes tradicionais'),
('Suínos', 'Resfriado', 'Nacional', 'Carnes suínas e derivados'),
('Aves', 'Congelado', 'Nacional', 'Frango, peru e cortes de aves'),
('Embutidos', 'Resfriado', 'Nacional', 'Linguiças, salsichas e similares'),
('Especiais', 'Congelado', 'Importado', 'Cortes premium e importados');

INSERT INTO tb_produtos (nome, preco_kg, estoque_kg, corte, validade, id_categoria) VALUES
('Picanha Bovina', 129.90, 25.00, 'Picanha', '2026-02-10', 1),
('Contra-filé Bovino', 69.90, 40.00, 'Contra-filé', '2026-02-08', 1),
('Costela Suína', 39.90, 35.50, 'Costela', '2026-02-12', 2),
('Lombo Suíno', 44.90, 28.00, 'Lombo', '2026-02-11', 2),
('Coxa e Sobrecoxa de Frango', 22.90, 60.00, 'Coxa/Sobrecoxa', '2026-03-01', 3),
('Coração de Frango', 34.90, 18.00, 'Miúdo', '2026-03-05', 3),
('Linguiça Calabresa', 49.90, 20.00, 'Calabresa', '2026-02-20', 4),
('Cordeiro (Carré) Importado', 149.90, 12.00, 'Carré', '2026-04-15', 5);

SELECT * FROM tb_produtos WHERE preco_kg > 50.00;

SELECT * FROM tb_produtos WHERE preco_kg BETWEEN 50.00 AND 150.00;

SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

SELECT * FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id_categoria;

SELECT * FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id_categoria WHERE tb_categorias.nome = 'Aves';