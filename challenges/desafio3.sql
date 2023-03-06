SELECT
  users.user AS 'pessoa_usuaria',
  COUNT(*) AS 'musicas_ouvidas',
  ROUND(SUM(songs.song_length) / 60, 2) AS 'total_minutos'
FROM
  users
  JOIN history USING (user_id)
  JOIN songs USING (music_id)
GROUP BY
  users.user
ORDER BY
  users.user;