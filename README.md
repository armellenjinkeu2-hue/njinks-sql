-- JOIN: Goals scored against Germany
SELECT player
FROM game JOIN goal ON game.id = goal.matchid
WHERE (team1 = 'GER' OR team2 = 'GER')
AND teamid <> 'GER'

-- JOIN with CASE WHEN: ENG match scores
SELECT mdate, team1,
SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
team2,
SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2
FROM game JOIN goal ON goal.matchid = game.id
WHERE (team1 = 'ENG' OR team2 = 'ENG')
GROUP BY mdate, matchid, team1, team2
