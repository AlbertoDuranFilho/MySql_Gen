CREATE DATABASE db_construindo_vidas;

USE db_construindo_vidas;

CREATE TABLE tb_categorias (
    id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,           
    setor VARCHAR(40) NOT NULL,          
    descricao VARCHAR(255)               
);

CREATE TABLE tb_produtos (
    id_produto BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    marca VARCHAR(60) NOT NULL,
    estoque INT NOT NULL,
    unidade VARCHAR(20) NOT NULL, 
    id_categoria BIGINT NOT NULL,
    CONSTRAINT fk_produtos_categorias
        FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_categorias (nome, setor, descricao) VALUES
('Hidráulica', 'Instalação', 'Tubos, conexões, registros e acessórios'),
('Elétrica', 'Instalação', 'Fios, disjuntores, tomadas e iluminação'),
('Ferramentas', 'Ferramentas', 'Ferramentas manuais e elétricas'),
('Acabamento', 'Acabamento', 'Tintas, revestimentos, pisos e acessórios'),
('Estrutural', 'Estrutural', 'Cimento, areia, brita, blocos e afins');

INSERT INTO tb_produtos (nome, preco, marca, estoque, unidade, id_categoria) VALUES
('Cimento CP II 50kg', 42.90, 'Votoran', 180, 'SC', 5),
('Areia Média Lavada', 129.90, 'Fornecedor Local', 35, 'M3', 5),
('Tinta Acrílica Fosca 18L', 189.90, 'Suvinil', 22, 'UN', 4),
('Porcelanato 60x60 (Caixa)', 149.90, 'Portobello', 40, 'CX', 4),
('Furadeira de Impacto 650W', 279.90, 'Bosch', 15, 'UN', 3),
('Chave de Fenda 6"', 19.90, 'Tramontina', 120, 'UN', 3),
('Cabo Flexível 2,5mm (Rolo 100m)', 239.90, 'Prysmian', 18, 'RL', 2),
('Conexão PVC Joelho 25mm', 4.90, 'Tigre', 300, 'UN', 1);

SELECT * FROM tb_produtos WHERE preco > 100.00;

SELECT * FROM tb_produtos WHERE preco BETWEEN 70.00 AND 150.00;

SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

SELECT * FROM tb_produtos INNER JOIN tb_categorias  ON tb_produtos.id_categoria = tb_categorias.id_categoria;

SELECT * FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id_categoria WHERE tb_categorias.nome = 'Hidráulica';