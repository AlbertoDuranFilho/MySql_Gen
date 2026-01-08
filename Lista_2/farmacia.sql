CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias (
    id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,              
    setor VARCHAR(40) NOT NULL,             
    exige_receita BOOLEAN NOT NULL DEFAULT FALSE,
    descricao VARCHAR(255)
);

CREATE TABLE tb_produtos (
    id_produto BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    marca VARCHAR(60) NOT NULL,
    estoque INT NOT NULL,
    validade DATE,
    id_categoria BIGINT NOT NULL,
    CONSTRAINT fk_produtos_categorias
        FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_categorias (nome, setor, exige_receita, descricao) VALUES
('Medicamentos', 'Saúde', TRUE, 'Medicamentos com e sem prescrição (controle na venda)'),
('Cosméticos', 'Beleza', FALSE, 'Cuidados pessoais e estética'),
('Higiene', 'Higiene', FALSE, 'Produtos de higiene diária'),
('Vitaminas e Suplementos', 'Saúde', FALSE, 'Vitaminas, minerais e suplementação'),
('Infantil', 'Cuidados', FALSE, 'Itens para bebês e crianças');

INSERT INTO tb_produtos (nome, preco, marca, estoque, validade, id_categoria) VALUES
('Paracetamol 750mg (20 comprimidos)', 18.90, 'Genérico', 120, '2027-05-30', 1),
('Antialérgico Cetirizina 10mg (12 comprimidos)', 29.90, 'Genérico', 80, '2026-11-15', 1),
('Creme Hidratante Corporal 400ml', 54.90, 'Nivea', 40, '2027-02-10', 2),
('Protetor Solar FPS 60 200ml', 89.90, 'La Roche-Posay', 25, '2026-12-20', 2),
('Creme Dental 90g', 6.50, 'Colgate', 200, '2027-08-01', 3),
('Shampoo Anticaspa 200ml', 32.00, 'Clear', 60, '2027-03-12', 3),
('Vitamina C 1g (20 comprimidos efervescentes)', 39.90, 'Cimed', 70, '2027-01-25', 4),
('Pomada para Assaduras 60g', 27.50, 'Hipoglós', 55, '2026-10-05', 5);

SELECT * FROM tb_produtos WHERE preco > 50.00;

SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 60.00;

SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

SELECT * FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id_categoria;

SELECT * FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id_categoria WHERE tb_categorias.nome = 'Cosméticos';