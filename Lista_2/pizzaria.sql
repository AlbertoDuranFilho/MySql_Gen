CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias (
    id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,             
    tamanho_padrao VARCHAR(20) NOT NULL,    
    descricao VARCHAR(255)
);

CREATE TABLE tb_pizzas (
    id_pizza BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    ingredientes VARCHAR(255) NOT NULL,
    borda_recheada BOOLEAN NOT NULL DEFAULT FALSE,
    id_categoria BIGINT NOT NULL,
    CONSTRAINT fk_pizzas_categorias
        FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_categorias (tipo, tamanho_padrao, descricao) VALUES
('Salgada Tradicional', 'Grande', 'Pizzas clássicas e mais pedidas'),
('Salgada Especial', 'Grande', 'Combinações especiais e ingredientes premium'),
('Doce', 'Média', 'Pizzas doces para sobremesa'),
('Vegetariana', 'Grande', 'Sem carnes, com legumes e queijos'),
('Premium', 'Grande', 'Ingredientes nobres e receitas exclusivas');

INSERT INTO tb_pizzas (nome, preco, ingredientes, borda_recheada, id_categoria) VALUES
('Margherita', 49.90, 'Molho de tomate, mussarela, manjericão', FALSE, 1),
('Mussarela', 44.90, 'Molho de tomate, mussarela, orégano', FALSE, 1),
('Calabresa', 46.90, 'Molho de tomate, mussarela, calabresa, cebola', TRUE, 1),
('Frango com Catupiry', 58.90, 'Molho de tomate, frango, catupiry, milho', TRUE, 2),
('Quatro Queijos', 62.00, 'Mussarela, provolone, parmesão, gorgonzola', FALSE, 2),
('Moda da Casa', 79.90, 'Mussarela, pepperoni, champignon, azeitona', TRUE, 5),
('Chocolate com Morango', 55.00, 'Chocolate, morango, leite condensado', FALSE, 3),
('Mista Veg', 52.50, 'Mussarela, tomate, palmito, rúcula, azeitona', FALSE, 4);

SELECT * FROM tb_pizzas WHERE preco > 45.00;

SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;

SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';

SELECT * FROM tb_pizzas INNER JOIN tb_categorias ON tb_pizzas.id_categoria = tb_categorias.id_categoria;

SELECT * FROM tb_pizzas INNER JOIN tb_categorias ON tb_pizzas.id_categoria = tb_categorias.id_categoria WHERE tb_categorias.tipo = 'Doce';