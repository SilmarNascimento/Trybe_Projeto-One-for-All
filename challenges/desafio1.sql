DROP SCHEMA IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE SpotifyClone.Plans (
    plan_id	INT,
    title	VARCHAR(512) NOT NULL,
    price	DOUBLE NOT NULL,
    CONSTRAINT PRIMARY KEY (plan_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.Plans (plan_id, title, price) VALUES
	('1', 'gratuito', '0.00'),
	('2', 'familiar', '7.99'),
	('3', 'universitário', '5.99'),
	('4', 'pessoal', '6.99');
    
CREATE TABLE SpotifyClone.Users (
    user_id	INT,
    name	VARCHAR(512) NOT NULL,
    age	INT NOT NULL,
    plan_id	INT,
    CONSTRAINT PRIMARY KEY (user_id),
				FOREIGN KEY (plan_id) REFERENCES Plans (plan_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.Users (user_id, Name, Age, plan_id) VALUES
	('1', 'Barbara Liskov', '82', '1'),
	('2', 'Robert Cecil Martin', '58', '1'),
	('3', 'Ada Lovelace', '37', '2'),
	('4', 'Martin Fowler', '46', '2'),
	('5', 'Sandi Metz', '58', '2'),
	('6', 'Paulo Freire', '19', '3'),
	('7', 'Bell Hooks', '26', '3'),
	('8', 'Christopher Alexander', '85', '4'),
	('9', 'Judith Butler', '45', '4'),
	('10', 'Jorge Amado', '58', '4');

CREATE TABLE SpotifyClone.UserPlan (
    user_id	INT,
    plan_id	INT,
    purchase_date	VARCHAR(512) NOT NULL,
    CONSTRAINT PRIMARY KEY (user_id, plan_id),
		    FOREIGN KEY (user_id) REFERENCES Users (user_id),
        FOREIGN KEY (plan_id) REFERENCES Plans (plan_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.UserPlan (user_id, plan_id, purchase_date) VALUES
	('1', '1', '2019-10-20'),
	('2', '1', '2017-01-06'),
	('3', '2', '2017-12-30'),
	('4', '2', '2017-01-17'),
	('5', '2', '2018-04-29'),
	('6', '3', '2018-02-14'),
	('7', '3', '2018-01-05'),
	('8', '4', '2019-06-05'),
	('9', '4', '2020-05-13'),
	('10', '4', '2017-02-17');

CREATE TABLE SpotifyClone.Artists (
    artist_id	INT,
    name	VARCHAR(512) NOT NULL,
    CONSTRAINT PRIMARY KEY (artist_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.Artists (artist_id, name) VALUES
	('1', 'Baco Exu do Blues'),
	('2', 'Beyoncé'),
	('3', 'Blind Guardian'),
	('4', 'Elis Regina'),
	('5', 'Nina Simone'),
	('6', 'Queen');

CREATE TABLE SpotifyClone.FollowingArtists (
    user_id	INT,
    artist_id	INT,
    CONSTRAINT PRIMARY KEY (user_id, artist_id),
		    FOREIGN KEY (user_id) REFERENCES Users (user_id),
        FOREIGN KEY (artist_id) REFERENCES Artists (artist_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.FollowingArtists (user_id, artist_id) VALUES
	('1', '2'),
	('1', '6'),
	('1', '4'),
	('2', '2'),
	('2', '4'),
	('3', '6'),
	('4', '1'),
	('5', '3'),
	('5', '5'),
	('6', '5'),
	('6', '2'),
	('7', '5'),
	('9', '4'),
	('10', '6');

CREATE TABLE SpotifyClone.Albums (
    album_id	INT,
    title	VARCHAR(512) NOT NULL,
    artist_id	INT,
    release_year	INT NOT NULL,
    CONSTRAINT PRIMARY KEY (album_id),
		FOREIGN KEY (artist_id) REFERENCES Artists (artist_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.Albums (album_id, title, artist_id, release_year) VALUES
	('1', 'Falso Brilhante', '4', '1998'),
	('2', 'Hot Space', '6', '1982'),
	('3', 'I Put A Spell On You', '5', '2012'),
	('4', 'Jazz', '6', '1978'),
	('5', 'QVVJFA?', '1', '2003'),
	('6', 'Renaissance', '2', '2022'),
	('7', 'Somewhere Far Beyond', '3', '2007'),
	('8', 'Vento de Maio', '4', '2001');

CREATE TABLE SpotifyClone.Songs (
    song_id	INT,
    title	VARCHAR(512) NOT NULL,
    album_id	INT,
    duration	INT NOT NULL,
    CONSTRAINT PRIMARY KEY (song_id),
		FOREIGN KEY (album_id) REFERENCES Albums (album_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.Songs (song_id, title, album_id, duration) VALUES
	('1', "ALIEN SUPERSTAR", '6', '116'),
	('2', "BREAK MY SOUL", '6', '279'),
	('3', "Como Nossos Pais", '1', '105'),
	('4', "Don\'t Stop Me Now", '4', '203'),
	('5', "Feeling Good", '3', '100'),
	('6', "O Medo de Amar é o Medo de Ser Livre", '8', '207'),
	('7', "Samba em Paris", '5', '267'),
	('8', "The Bard\'s Song", '7', '244'),
	('9', "Under Pressure", '2', '152'),
	('10', "VIRGO\'S GROOVE", '6', '369');
    
CREATE TABLE SpotifyClone.History 
(
    user_id	INT,
    song_id	INT,
    play_date	VARCHAR(512) NOT NULL,
    CONSTRAINT PRIMARY KEY (user_id, song_id),
		    FOREIGN KEY (user_id) REFERENCES Users (user_id),
        FOREIGN KEY (song_id) REFERENCES Songs (song_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.History (user_id, song_id, play_date) VALUES
	('1', '7', '2022-02-28 10:45:55'),
	('1', '10', '2020-05-02 05:30:35'),
	('1', '5', '2020-03-06 11:22:33'),
	('2', '5', '2020-01-02 07:40:33'),
	('2', '6', '2022-08-05 08:05:17'),
	('3', '5', '2020-12-05 18:38:30'),
	('3', '10', '2020-11-13 16:55:13'),
	('4', '7', '2021-08-15 17:10:10'),
	('5', '7', '2022-01-09 01:44:33'),
	('5', '9', '2020-08-06 15:23:43'),
	('6', '6', '2017-01-24 00:31:17'),
	('6', '2', '2017-10-12 12:35:20'),
	('7', '4', '2011-12-15 22:30:49'),
	('8', '4', '2012-03-17 14:56:41'),
	('9', '8', '2022-02-24 21:14:22'),
	('10', '1', '2015-12-13 08:30:22');
