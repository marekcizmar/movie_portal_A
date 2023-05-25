CREATE TABLE movie(
	id SERIAL PRIMARY KEY,
	title VARCHAR(255),
	year INT,
	genre INT,
	summary TEXT,
	image TEXT,
	quality VARCHAR(100),
	lenght INT
);

CREATE TABLE genre(
	id SERIAL PRIMARY KEY,
	title VARCHAR(255)
);


