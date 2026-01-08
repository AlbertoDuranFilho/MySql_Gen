create DATABASE db_generation_game_online;

use db_generation_game_online;

create table tb_classes(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) not null,
    talento_passivo VARCHAR(255),
    arma VARCHAR(255) not null
);


CREATE TABLE tb_personagens(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) not null,
    genero VARCHAR(1) not null,
    ataque INT,
    defesa INT,
    raca VARCHAR(255) not null,
    classeid BIGINT,
    CONSTRAINT fk_personagens_classes
    FOREIGN KEY (classeid) REFERENCES tb_classes (id)
);

INSERT INTO tb_classes(nome, talento_passivo, arma) values
('Guerreiro', 'Aumenta defesa física', 'Espada'),
('Mago', 'Regenera mana lentamente', 'Cajado'),
('Arqueiro', 'Aumenta chance de crítico', 'Arco'),
('Ladino', 'Ataque furtivo aprimorado', 'Adaga'),
('Clérigo', 'Aura de proteção', 'Martelo');

INSERT INTO tb_personagens(nome, genero, ataque, defesa, raca, classeid) values
('Arthos', 'M', 1900, 4200, 'Humano', 1),
('Lyra', 'F', 4800, 2200, 'Elfa', 3),
('Darian', 'M', 3000, 1600, 'Humano', 2),
('Kael', 'M', 1700, 1400, 'Elfo Negro', 4),
('Bruna', 'F', 1200, 3800, 'Anã', 5),
('Selene', 'F', 4100, 2100, 'Elfa', 2),
('Ragnar', 'M', 5000, 1800, 'Orc', 1),
('Mira', 'F', 2800, 3000, 'Humana', 3);

SELECT * from tb_personagens WHERE ataque > 2000;

SELECT * from tb_personagens where defesa between 1000 and 2000;

SELECT * from tb_personagens where nome like '%C%';

SELECT * from tb_personagens INNER JOIN tb_classes on tb_personagens.classeid = tb_classes.id;

SELECT * from tb_personagens INNER JOIN tb_classes on tb_personagens.classeid = tb_classes.id WHERE tb_personagens.classeid = 3;