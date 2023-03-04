DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE plan(
	plan_id INT AUTO_INCREMENT PRIMARY KEY,
	name_plan VARCHAR(50) NOT NULL,
	plan_price DOUBLE NOT NULL
);

CREATE TABLE users(
  user_id INT AUTO_INCREMENT PRIMARY KEY,
	user VARCHAR(50) NOT NULL,
	user_age SMALLINT NOT NULL,
	plan_id INT NOT NULL,
	subscription_date DATE NOT NULL,
	FOREIGN KEY (plan_id) REFERENCES plan(plan_id)
);

CREATE TABLE artists(
	followers_id INT AUTO_INCREMENT PRIMARY KEY,
	artist_name VARCHAR(50) NOT NULL
);

CREATE TABLE followers(
	user_id INT NOT NULL,
	followers_id INT NOT NULL,
	PRIMARY KEY (user_id, followers_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (followers_id) REFERENCES artists(followers_id)
);

CREATE TABLE albums(
	album_id INT AUTO_INCREMENT PRIMARY KEY,
	album_title VARCHAR(50) NOT NULL,
	followers_id INT NOT NULL,
	release_year SMALLINT NOT NULL,
	FOREIGN KEY (followers_id) REFERENCES artists(followers_id)
);

CREATE TABLE songs(
	music_id INT AUTO_INCREMENT PRIMARY KEY,
	song_title VARCHAR(50) NOT NULL,
	song_length SMALLINT NOT NULL,
	album_id INT NOT NULL,
	FOREIGN KEY (album_id) REFERENCES albums(album_id)
);

CREATE TABLE history(
	user_id INT NOT NULL,
	music_id INT NOT NULL,
	play_date DATETIME NOT NULL,
	PRIMARY KEY (user_id, music_id, play_date),
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (music_id) REFERENCES songs(music_id)
);


INSERT INTO
	plan (name_plan, plan_price)
VALUES
	('gratuito', 0.00),
	('universitário', 5.99),
	('pessoal', 6.99),
	('familiar', 7.99);

INSERT INTO
	users(
		user,
		user_age,
		plan_id,
		subscription_date
	)
VALUES
  ('Barbara Liskov', 82, 1, '2019-10-20'),
  ('Robert Cecil Martin', 58, 1, '2017-01-06'),
  ('Ada Lovelace', 37, 4, '2017-12-30'),
  ('Martin Fowler', 46, 4, '2017-01-17'),
  ('Sandi Metz', 58, 4, '2018-04-29'),
  ('Paulo Freire', 19, 2, '2018-02-14'),
  ('Bell Hooks', 26, 2, '2018-01-05'),
  ('Christopher Alexander', 85, 3, '2019-06-05'),
  ('Judith Butler', 45, 3, '2020-05-13'),
  ('Jorge Amado', 58, 3, '2017-02-17');

INSERT INTO
	artists(artist_name)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

INSERT INTO
	followers(user_id, followers_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 1),
  (6, 6),
  (7, 6),
  (9, 3),
  (10, 2);

INSERT INTO
	albums(album_title, followers_id, release_year)
VALUES
  ('Renaissance', 1, 2022),
  ('Jazz', 2, 1978),
  ('Hot Space', 2, 1982),
  ('Falso Brilhante', 3, 1998),
  ('Vento de Maio', 3, 2001),
  ('QVVJFA?', 4, 2003),
  ('Somewhere Far Beyond', 5, 2007),
  ('I Put A Spell On You', 6, 2012);

INSERT INTO
  songs(song_title, song_length, album_id)
VALUES
  ('BREAK MY SOUL', 279, 1),
  ('VIRGO''S GROOVE', 369, 1),
  ('ALIEN SUPERSTAR', 116, 1),
  ('Don''t Stop Me Now', 203, 2),
  ('Under Pressure', 152, 3),
  ('Como Nossos Pais', 105, 4),
  ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
  ('Samba em Paris', 267, 6),
  ('The Bard''s Song', 244, 7),
  ('Feeling Good', 100, 8);

INSERT INTO
	history(user_id, music_id, play_date)
VALUES
  (1, 8, "2022-02-28 10:45:55"),
  (1, 2, "2020-05-02 05:30:35"),
  (1, 10, "2020-03-06 11:22:33"),
  (2, 10, "2022-08-05 08:05:17"),
  (2, 9, "2020-01-02 07:40:33"),
  (3, 10, "2022-08-05 08:05:17"),
  (3, 2, "2020-12-05 18:38:30"),
  (4, 8, "2021-08-15 17:10:10"),
  (5, 8, "2022-01-09 01:44:33"),
  (5, 3, "2020-08-06 15:23:43"),
  (6, 7, "2017-01-24 00:31:17"),
  (6, 1, "2017-10-12 12:35:20"),
  (7, 4, "2011-12-15 22:30:49"),
  (8, 4, "2012-03-17 14:56:41"),
  (9, 9, "2022-02-24 21:14:22"),
  (10, 3, "2015-12-13 08:30:22");