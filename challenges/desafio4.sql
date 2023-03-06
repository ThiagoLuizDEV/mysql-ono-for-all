SELECT
  users.user AS 'pessoa_usuaria',
  IF(YEAR(MAX(history.play_date)) >= 2021, 'Ativa', 'Inativa') AS 'status_pessoa_usuaria'
FROM
  users
  INNER JOIN
    history ON history.user_id = users.user_id
GROUP BY users.user
ORDER BY users.user;
