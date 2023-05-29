ALTER TABLE movie
ADD viewed INT;

ALTER TABLE movie
ADD rated INT;

UPDATE movie
SET viewed = 0
;

UPDATE movie
SET rated = 0
;

SELECT * FROM movie;