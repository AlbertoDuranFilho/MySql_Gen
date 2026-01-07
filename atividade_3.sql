CREATE DATABASE db_escola;

USE db_escola;

CREATE TABLE tb_estudantes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  data_nascimento DATE NOT NULL,
  turma VARCHAR(20) NOT NULL,
  email VARCHAR(255),
  nota DECIMAL(4,2) NOT NULL
);

INSERT INTO estudantes (nome, data_nascimento, turma, email, nota) VALUES
('Ana Souza','2008-03-14', '8A', 'ana.souza@escola.com',      8.50),
('Bruno Lima','2007-11-02', '9B', 'bruno.lima@escola.com',     6.70),
('Carla Oliveira', '2008-07-28', '8A', 'carla.oliveira@escola.com', 7.20),
('Diego Santos', '2007-01-19', '9A', 'diego.santos@escola.com',   5.90),
('Eduarda Reis', '2008-12-05', '8B', 'eduarda.reis@escola.com',   9.10),
('Felipe Rocha', '2007-06-30', '9B', 'felipe.rocha@escola.com',   7.00),
('Gabi Martins', '2008-09-10', '8B', 'gabi.martins@escola.com',   6.40),
('Hugo Ferreira', '2007-04-23', '9A', 'hugo.ferreira@escola.com',  7.80);

SELECT * FROM estudantes WHERE nota > 7.0;

SELECT * FROM estudantes WHERE nota < 7.0;

UPDATE estudantes SET nota = 7.30 WHERE id = 2;