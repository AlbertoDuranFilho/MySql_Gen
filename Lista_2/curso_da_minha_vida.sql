CREATE DATABASE db_curso_da_minha_vida;

USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias (
    id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,              
    area VARCHAR(40) NOT NULL,              
    descricao VARCHAR(255)                  
);

CREATE TABLE tb_cursos (
    id_curso BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    carga_horaria INT NOT NULL,            
    instrutor VARCHAR(80) NOT NULL,
    nivel VARCHAR(20) NOT NULL,             
    id_categoria BIGINT NOT NULL,
    CONSTRAINT fk_cursos_categorias
        FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_categorias (nome, area, descricao) VALUES
('Programação', 'Tecnologia', 'Linguagens de programação e desenvolvimento de software'),
('Design', 'Criatividade', 'Design gráfico, UX/UI e ferramentas criativas'),
('Marketing Digital', 'Negócios', 'Estratégias de marketing online e redes sociais'),
('Gestão e Negócios', 'Negócios', 'Administração, finanças e empreendedorismo'),
('Desenvolvimento Pessoal', 'Soft Skills', 'Produtividade, liderança e comunicação');

INSERT INTO tb_cursos (nome, preco, carga_horaria, instrutor, nivel, id_categoria) VALUES
('Java Completo: Do Zero ao Profissional', 799.90, 80, 'Carlos Silva', 'Intermediário', 1),
('Python para Data Science', 899.90, 60, 'Ana Costa', 'Avançado', 1),
('JavaScript Moderno: ES6+', 649.90, 50, 'Roberto Lima', 'Iniciante', 1),
('Design Gráfico com Photoshop e Illustrator', 549.90, 40, 'Juliana Martins', 'Iniciante', 2),
('UX/UI Design: Criando Experiências Incríveis', 1099.90, 70, 'Fernanda Souza', 'Intermediário', 2),
('Marketing Digital na Prática', 699.90, 45, 'João Pedro', 'Iniciante', 3),
('Gestão de Projetos Ágeis com Scrum', 849.90, 35, 'Marcos Oliveira', 'Intermediário', 4),
('Liderança e Comunicação Eficaz', 499.90, 30, 'Patrícia Alves', 'Iniciante', 5);

SELECT * FROM tb_cursos WHERE preco > 500.00;

SELECT * FROM tb_cursos WHERE preco BETWEEN 600.00 AND 1000.00;

SELECT * FROM tb_cursos WHERE nome LIKE '%J%';

SELECT * FROM tb_cursos INNER JOIN tb_categorias ON tb_cursos.id_categoria = tb_categorias.id_categoria;

SELECT * FROM tb_cursos INNER JOIN tb_categorias ON tb_cursos.id_categoria = tb_categorias.id_categoria WHERE tb_categorias.nome = 'Programação';