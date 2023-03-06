SELECT
  artists.artist_name AS 'artista',
  albums.album_title AS 'album',
  COUNT(followers.followers_id) AS 'pessoas_seguidoras'
FROM
  artists
  INNER JOIN albums ON artists.followers_id = albums.followers_id
  INNER JOIN followers ON followers.followers_id = artists.followers_id
GROUP BY artists.artist_name, albums.album_title
ORDER BY COUNT(followers.followers_id) DESC, artists.artist_name, albums.album_title;