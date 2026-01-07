CREATE DATABASE db_rh;

USE db_rh;

CREATE TABLE tb_colaboradores(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) not null,
funcao VARCHAR(255) not null,
salario DECIMAL(7, 2),
tempo_contrato DATE
);

drop table tb_colaboradores;

insert into tb_colaboradores(nome, funcao, salario, tempo_contrato) values
("Alberto", "Desenvolvedor Full Stack", 12000.00, "2026-12-07"),
("Victor", "Engenheiro Eletricista", 8000.00, "2027-06-07"),
("Silvio", "Engenheiro Eletricista", 8000.00, "2026-12-31"),
("Déborah", "Médica", 10000.00, "2026-07-04"),
("Yasmim", "Dentista", 7000.00, "2027-01-10");

SELECT nome, salario from tb_colaboradores where salario > 2000 ;

SELECT nome, salario from tb_colaboradores where salario < 2000; 

UPDATE tb_colaboradores set salario = 1500 where id = 5;

