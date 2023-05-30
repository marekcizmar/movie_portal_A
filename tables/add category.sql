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

ALTER TABLE movie
ADD tailer TEXT;


UPDATE movie
SET rated = 0
WHEN title = ''
;

ALTER TABLE movie
ADD trailer TEXT;



UPDATE movie
SET trailer = 'https://www.youtube.com/watch?v=7TavVZMewpY'
WHERE title = 'The Lion King'
;

UPDATE movie
SET trailer = 'https://www.youtube.com/watch?v=tL4McUzXfFI'
WHERE title = 'Jojo Rabbit'
;
UPDATE movie
SET trailer = 'https://www.youtube.com/watch?v=hEJnMQG9ev8'
WHERE title = 'Mad Max: Fury Road'
;
UPDATE movie
SET trailer = 'https://www.youtube.com/watch?v=zAGVQLHvwOY'
WHERE title = 'Joker'
;
UPDATE movie
SET trailer = 'https://www.youtube.com/watch?v=WHJpYm9CwrM'
WHERE title = 'Ready Player One'
;
UPDATE movie
SET trailer = 'https://www.youtube.com/watch?v=Way9Dexny3w'
WHERE title = 'Dune'
;
UPDATE movie
SET trailer = 'https://www.youtube.com/watch?v=mqqft2x_Aa4'
WHERE title = 'The Batman'
;
UPDATE movie
SET trailer = 'https://www.youtube.com/watch?v=g4Hbz2jLxvQ'
WHERE title = 'Spider-Man: Into the Spider-Verse'
;
UPDATE movie
SET trailer = 'https://www.youtube.com/watch?v=eyKOgnaf0BU'
WHERE title = 'Baywatch'
;
UPDATE movie
SET trailer = 'https://www.youtube.com/watch?v=xGon_kZAVtU'
WHERE title = 'San Andreas'
;
UPDATE movie
SET trailer = 'https://www.youtube.com/watch?v=S3AVcCggRnU'
WHERE title = 'Ted 2'
;
UPDATE movie
SET trailer = 'https://www.youtube.com/watch?v=CmRih_VtVAs'
WHERE title = 'Suicide Squad'
;
UPDATE movie
SET trailer = 'https://www.youtube.com/watch?v=Skpu5HaVkOc'
WHERE title = 'Fast & Furious 7'
;
UPDATE movie
SET trailer = 'https://www.youtube.com/watch?v=BIhNsAtPbPI'
WHERE title = 'No Time to Die'
;
UPDATE movie
SET trailer = 'https://www.youtube.com/watch?v=yg8116aeD7E'
WHERE title = 'Coco'
;
UPDATE movie
SET trailer = 'https://www.youtube.com/watch?v=xKJmEC5ieOk'
WHERE title = 'It'
;
UPDATE movie
SET trailer = 'https://www.youtube.com/watch?v=xjDjIWPwcPU'
WHERE title = 'Black Panther'
;
UPDATE movie
SET trailer = 'https://www.youtube.com/watch?v=6ZfuNTqbHE8'
WHERE title = 'Avengers: Infinity War'
;
UPDATE movie
SET trailer = 'https://www.youtube.com/watch?v=2QKg5SZ_35I'
WHERE title = 'Jumanji: Welcome to the Jungle'
;
UPDATE movie
SET trailer = 'https://www.youtube.com/watch?v=jWM0ct-OLsM'
WHERE title = 'Zootopia'
;
UPDATE movie
SET trailer = 'https://www.youtube.com/watch?v=DzfpyUB60YY'
WHERE title = 'Get Out'
;
UPDATE movie
SET trailer = 'https://www.youtube.com/watch?v=Mq4m3yAoW8E'
WHERE title = 'Murder on the Orient Express'
;
UPDATE movie
SET trailer = 'https://www.youtube.com/watch?v=gCcx85zbxz4'
WHERE title = 'Blade Runner 2049'
;
