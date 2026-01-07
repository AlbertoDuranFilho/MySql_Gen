CREATE DATABASE db_ecommerce;

USE db_ecommerce;

CREATE TABLE tb_produtos(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) not null,
preco DECIMAL(6,2) not null,
quantidade int,
data_entrada date
);

insert into tb_produtos(nome, preco, quantidade, data_entrada) values
("Placa de vídeo", 6000, 300, "2026-01-07"),
("Mouse", 300, 1000, "2026-01-01"),
("Teclado", 150, 400, "2026-01-07"),
("Processador", 1000, 230, "2026-01-03"),
("Monitor", 1500, 600, "2026-01-01"),
("Fone de ouvido", 90, 1400, "2026-01-04"),
("Notbook", 4000, 200, "2026-01-04"),
("SSD", 175, 2300, "2026-01-05");

SELECT nome, preco from tb_produtos where preco > 500;

SELECT nome, preco from tb_produtos where preco < 500;

UPDATE tb_produtos set preco = 260 WHERE id = 2;

