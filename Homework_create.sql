CREATE TABLE IF NOT EXISTS Genre (
	id SERIAL PRIMARY KEY NOT NULL UNIQUE, 
	name VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Artist (
	id SERIAL PRIMARY KEY, 
	name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS genre_artist (
	artist_id INTEGER REFERENCES Artist(id), 
	genre_id INTEGER REFERENCES Genre(id),
	constraint ag primary key (artist_id, genre_id)
); 

CREATE TABLE IF NOT EXISTS Album (
	id SERIAL PRIMARY KEY, 
	name VARCHAR(60) NOT NULL,
	date_creation DATE

);

CREATE TABLE IF NOT EXISTS Artist_album (
	artist_id INTEGER REFERENCES Artist(id), 
	album_id INTEGER REFERENCES Album(id),
	constraint aa primary key (artist_id, album_id)
); 

CREATE TABLE IF NOT EXISTS Track (
	id SERIAL PRIMARY KEY UNIQUE, 
	name VARCHAR(60) NOT NULL,
	date_cration DATE,
	duration TIME,
	id_album INTEGER REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS Compilation (
	id SERIAL PRIMARY KEY, 
	name VARCHAR(60) NOT NULL,
	date_cration DATE
);

CREATE TABLE IF NOT EXISTS compilation_track (
	compilation_id integer REFERENCES Compilation(id), 
	track_id integer REFERENCES Track(id),
	constraint ct primary key (compilation_id, track_id)
); 