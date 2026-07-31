--From the table STADIUM, TEAM and PLAYER perform the following queries:  

--Part – A: 
SELECT * FROM STADIUM
SELECT * FROM TEAM
SELECT * FROM PLAYER
--1. Display players who belong to teams located in ‘Mumbai’. 
SELECT * FROM STADIUM S
INNER JOIN TEAM T
ON S.STADIUM_ID = T.HOME_STADIUM_ID
INNER JOIN PLAYER P
ON T.TEAM_ID = P.TEAM_ID
WHERE  STADIUM_CITY ='Mumbai'

--2. Display all teams and players. 
SELECT TEAM_NAME, PLAYER_FIRST_NAME FROM STADIUM S
INNER JOIN TEAM T
ON S.STADIUM_ID = T.HOME_STADIUM_ID
INNER JOIN PLAYER P
ON T.TEAM_ID = P.TEAM_ID

--3. Display players along with team wins and stadium city.
SELECT PLAYER_FIRST_NAME, TEAM_WINS FROM STADIUM S
INNER JOIN TEAM T
ON S.STADIUM_ID = T.HOME_STADIUM_ID
INNER JOIN PLAYER P
ON T.TEAM_ID = P.TEAM_ID

--4. Display team name and number of players in each team.
SELECT TEAM_NAME, COUNT(PLAYER_ID) AS NOOFPLAYERS
FROM STADIUM S
INNER JOIN TEAM T
ON S.STADIUM_ID = T.HOME_STADIUM_ID
INNER JOIN PLAYER P
ON T.TEAM_ID = P.TEAM_ID
GROUP BY TEAM_NAME

--5. Display team name, coach, and number of bowlers in each team. 
SELECT T.TEAM_NAME ,T.TEAM_COACH ,COUNT(PLAYER_ROLE) AS NOOFBOWLERS
FROM PLAYER P
INNER JOIN TEAM T
ON T.TEAM_ID = P.TEAM_ID
WHERE PLAYER_ROLE ='Bowler'
GROUP BY T.TEAM_NAME ,T.TEAM_COACH

--6. Display team name with count of batsmen, bowlers, and all-rounders. 
SELECT T.TEAM_NAME,
       SUM(CASE WHEN P.PLAYER_ROLE = 'Batsman' THEN 1 ELSE 0 END) AS BATSMAN,
       SUM(CASE WHEN P.PLAYER_ROLE = 'Bowler' THEN 1 ELSE 0 END) AS BOWLER,
       SUM(CASE WHEN P.PLAYER_ROLE = 'All-Rounder' THEN 1 ELSE 0 END) AS ALLROUNDER
FROM TEAM T
JOIN PLAYER P 
ON T.TEAM_ID = P.TEAM_ID
GROUP BY T.TEAM_NAME

--7. Display stadiums where teams have won more than 10 matches. 
SELECT STADIUM_NAME, TEAM_WINS
FROM STADIUM S
INNER JOIN TEAM T
ON S.STADIUM_ID = T.HOME_STADIUM_ID
WHERE TEAM_WINS > 10

--8. Display team name and number of players whose matches played is greater than 25. 
SELECT T.TEAM_NAME, COUNT(P.PLAYER_ID) AS MORETHAN25
FROM TEAM T
JOIN PLAYER P 
ON T.TEAM_ID = P.TEAM_ID
WHERE P.PLAYER_MATCHES_PLAYED > 25
GROUP BY T.TEAM_NAME

--9. Display team name and total number of players having jersey number greater than 30. 
SELECT T.TEAM_NAME, COUNT(P.PLAYER_ID) AS MORETHAN30
FROM TEAM T
JOIN PLAYER P 
ON T.TEAM_ID = P.TEAM_ID
WHERE P.PLAYER_JERSEY_NUMBER > 30
GROUP BY T.TEAM_NAME

--10. Display team name and total matches played by its players.
SELECT T.TEAM_NAME, SUM(P.PLAYER_MATCHES_PLAYED) AS TOTALMATCHES
FROM TEAM T
JOIN PLAYER P 
ON T.TEAM_ID = P.TEAM_ID
GROUP BY T.TEAM_NAME

--Part – B: 

--11. Display stadium city and total number of teams in each city. 
--12. Display team name and average matches played by players in each team. 
--13. Display team name and maximum matches played by any player in each team. 
--14. Display team name and minimum matches played by any player in each team. 
--15. Display stadium name and total number of players playing under teams of that stadium. 

--Part – C: 

--16. Display teams having more all-rounders than bowlers. 
--17. Display teams where difference between max and min player matches is greater than 5. 
--18. Display stadium city and total wins of teams in that city. 
--19. Display team name and total number of players for each role (grouped by role). 
--20. Display team name and total number of players whose name starts with ‘A’ 