SELECT
  artists.artist_name AS 'artista',
  albums.album_title AS 'album'
FROM
  artists
  INNER JOIN albums ON albums.followers_id = artists.followers_id
WHERE
  artists.artist_name = 'Elis Regina'
ORDER BY
  albums.album_title;