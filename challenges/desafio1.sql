DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE IF NOT EXISTS users(
user_id INT AUTO_INCREMENT NOT NULL,
user VARCHAR(40) NOT NULL,
age TINYINT,
date_signature DATETIME NOT NULL,
plan_id INT NOT NULL,
PRIMARY KEY (user_id),
FOREIGN KEY (plan_id) REFERENCES plan(plan_id)
);

INSERT INTO users(user, age, date_signature, plan_id)
VALUES
('Barbara Liskov', 82, '2019-10-20', 1),
('Robert Cecil Martin', 58, '2017-01-06', 1),
('Ada Lovelace', 37, '2017-12-30', 2),
('Martin Fowler', 46, '2017-01-17', 2),
('Sandi Metz', 58, '2019-04-29', 2),
('Paulo Freire', 19, '2019-02-14', 3),
('Bell Hooks', 26, '2019-01-05', 3),
('Christopher Alexander', 85, '2019-06-05', 4),
('Judith Butler', 45, '2020-05-13', 4),
('Jorge Amado', 58, '2017-02-17', 4);

CREATE TABLE IF NOT EXISTS plan(
plan_id INT AUTO_INCREMENT NOT NULL,
name_plan VARCHAR(20) NOT NULL,
price DECIMAL(1, 2) NOT NULL,
PRIMARY KEY (plan_id)
);

INSERT INTO plan (name_plan, price)
VALUES
('gratuito', 0.00),
('familiar', 7.99),
('universitário', 5.99),
('pessoal',6.99);

CREATE TABLE IF NOT EXISTS history(
music_id INT NOT NULL,
user_id INT NOT NULL,
date_reproduction DATETIME NOT NULL,
PRIMARY KEY (music_id, user_id),
FOREIGN KEY (music_id) REFERENCES songs(music_id),
FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS history(
  music_id INT NOT NULL,
  user_id INT NOT NULL,
  date_reproduction DATETIME NOT NULL,
  PRIMARY KEY (music_id, user_id),
  FOREIGN KEY (music_id) REFERENCES songs(music_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO history(music_id, date_reproduction, user_id)
VALUES
  (8,'2022-02-28 10:45:55',1),
  (2,'2020-05-02 05:30:35',1),
  (10,'2020-03-06 11:22:33',1),
  (10,'2022-08-05 08:05:17',2),
  (7,'2020-01-02 07:40:33',2),
  (10,'2020-11-13 16:55:13',3),
  (2,'2020-12-05 18:38:30',3),
  (8,'2021-08-15 17:10:10',4),
  (8,'2022-01-09 01:44:33',5),
  (5,'2020-08-06 15:23:43',5),
  (7,'2017-01-24 00:31:17',6),
  (1,'2017-10-12 12:35:20',6),
  (4,'2011-12-15 22:30:49',7),
  (4,'2012-03-17 14:56:41',8),
  (9,'2022-02-24 21:14:22',9),
  (3,'2015-12-13 08:30:22',10);

CREATE TABLE IF NOT EXISTS followers(
  followers_id INT NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY (user_id, followers_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (followers_id) REFERENCES artists(followers_id)
);

INSERT INTO followers(user_id,followers_id)
  VALUES
  (1,1),
  (1,2),
  (1,3),
  (2,1),
  (2,3),
  (3,2),
  (4,4),
  (5,5),
  (5,6),
  (6,6),
  (6,1),
  (7,6),
  (9,3),
  (10,2);

CREATE TABLE IF NOT EXISTS artists(
  artist_id INT AUTO_INCREMENT NOT NULL,
  artist_name VARCHAR(50) NOT NULL,
  PRIMARY KEY(artist_id)
);

INSERT INTO artists (artist_name)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

CREATE TABLE IF NOT EXISTS albums(
  album_id INT AUTO_INCREMENT NOT NULL,  
  artist_id INT NOT NULL,
  album_title VARCHAR(50) NOT NULL,
  release_year YEAR,
  PRIMARY KEY (album_id),
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

INSERT INTO albums (album_title, artist_id, release_year)
VALUES
  ('Renaissance', 1, 2022),
  ('Jazz', 2, 1978),
  ('Hot Space', 2, 1982),
  ('Falso Brilhante', 3, 1998),
  ('Vento de Maio', 3, 2001),
  ('QVVJFA?', 4, 2003),
  ('Somewhere Far Beyond', 5, 2007),
  ('I Put A Spell On You', 6, 2012);

CREATE TABLE IF NOT EXISTS songs(
  song_id INT AUTO_INCREMENT NOT NULL,
  album_id INT NOT NULL,
  song_title VARCHAR(50) NOT NULL,
  duration SMALLINT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES albums(album_id)
);

INSERT INTO songs(song_title, duration, album_id)
VALUES 
  ("BREAK MY SOUL", 279, 1),
  ("VIRGO'S GROOVE", 369, 1),
  ("ALIEN SUPERSTAR", 116, 1),
  ("Don't Stop Me Now", 203, 2),
  ("Under Pressure", 152, 3),
  ("Como Nossos Pais", 105, 4),
  ("O Medo de Amar é o Medo de Ser Livre", 207, 5),
  ("Samba em Paris", 267, 6),
  ("The Bard's Song", 244, 7),
  ("Feeling Good", 100, 8);
