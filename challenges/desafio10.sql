CREATE TABLE FavoriteSongs 
(
    user_id	INT,
    song_id	INT,
    CONSTRAINT PRIMARY KEY (user_id, song_id),
      FOREIGN KEY (user_id) REFERENCES Users (user_id),
      FOREIGN KEY (song_id) REFERENCES Songs (song_id)
) engine = InnoDB;

INSERT INTO FavoriteSongs (user_id, song_id) VALUES
	('1', '1'),
	('1', '3'),
	('1', '5'),
	('2', '4'),
	('3', '2'),
	('3', '1'),
	('4', '6'),
	('4', '4'),
	('5', '5'),
	('5', '10'),
	('8', '4'),
	('9', '6'),
	('10', '1');

-- Descomente e altere as linhas abaixo:

-- CREATE TABLE SpotifyClone.tabela(
--     coluna1 tipo restricoes,
--     coluna2 tipo restricoes,
--     colunaN tipo restricoes,
-- ) engine = InnoDB;

-- INSERT INTO SpotifyClone.tabela (coluna1, coluna2)
-- VALUES
--   ('exemplo de dados 1', 'exemplo de dados A'),
--   ('exemplo de dados 2', 'exemplo de dados B'),
--   ('exemplo de dados 3', 'exemplo de dados C');
