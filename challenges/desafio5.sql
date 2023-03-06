SELECT
  songs.song_title AS 'cancao',
  COUNT(history.music_id) AS 'reproducoes'
FROM
  songs
  INNER JOIN history ON history.music_id = songs.music_id
GROUP BY
  songs.music_id
ORDER BY
  reproducoes DESC,
  cancao
LIMIT 2;