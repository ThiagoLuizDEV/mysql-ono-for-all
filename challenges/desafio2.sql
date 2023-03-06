SELECT
  (SELECT COUNT(music_id)  FROM songs) AS cancoes,
  (SELECT COUNT(followers_id) FROM artists) AS artistas,
  (SELECT COUNT(album_id)  FROM albums) AS albuns;