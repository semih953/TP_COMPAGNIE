--1    
SELECT * FROM PILOTE

--2    
SELECT DISTINCT VILLEDEP
FROM VOL
	 	
--3    
SELECT * FROM VOL

--4    
SELECT NOMAVION
FROM AVION
WHERE NOMAVION LIKE "AIRBUS %"

--5    
SELECT NOMPILOTE
FROM PILOTE 
WHERE NOMPILOTE LIKE "_I%"

--6    
SELECT * FROM AVION 
WHERE CAPACITE BETWEEN 200 AND 300

--7    
SELECT NOMAVION, NUMAVION, LOCALISATION 
FROM AVION 
WHERE LOCALISATION != 'NICE' AND CAPACITE > 200 ORDER BY NUMAVION DESC;

--8
SELECT NOMPILOTE 
FROM PILOTE 
WHERE NUMPILOTE IN(	SELECT NUMPILOTE 
					FROM VOL 
					WHERE VILLEDEP = 'Paris')

--9
SELECT NOMPILOTE 
FROM PILOTE 
WHERE ADRESSE  IN(SELECT LOCALISATION
                  FROM AVION
                  WHERE NOMAVION LIKE "AIRBUS %")

--10
SELECT NOMPILOTE 
FROM PILOTE 
WHERE NUMPILOTE IN(SELECT NUMPILOTE
                   FROM VOL
                   WHERE NUMAVION IN(SELECT NUMAVION
                                             FROM VOL
                                             WHERE NUMPILOTE=2))

--11
SELECT NUMAVION, NOMAVION
FROM AVION
WHERE CAPACITE BETWEEN 200 AND 300 AND LOCALISATION IN(SELECT VILLEDEP
                                                       FROM VOL
                                                       WHERE NUMVOL = "USA050")

--12
SELECT *
FROM AVION
WHERE CAPACITE > (
                    SELECT MAX(CAPACITE)
                    FROM AVION
                    WHERE LOCALISATION = "NICE")

--13
SELECT *
FROM AVION
WHERE CAPACITE > (
                    SELECT MIN(CAPACITE)
                    FROM AVION
                    WHERE LOCALISATION = "NICE")

--14
SELECT *
FROM PILOTE
WHERE ADRESSE IN (
					SELECT LOCALISATION
					FROM AVION
					WHERE NOMAVION LIKE 'AIRBUS%')
AND NUMPILOTE IN (	SELECT NUMPILOTE
					FROM VOL
					WHERE VILLEDEP IN (	SELECT VILLEARR
                   						FROM VOL
				   						WHERE NUMPILOTE IN (SELECT NUMPILOTE 
					                          		       	FROM PILOTE
                       			       						WHERE NOMPILOTE LIKE "ADER %")))
