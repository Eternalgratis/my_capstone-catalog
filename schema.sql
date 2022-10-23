CREATE DATABASE my_catalog;

-- Create table called labels
CREATE TABLE labels (
	id INT GENERATED ALWAYS AS IDENTITY,
	title	varchar(50),
	color	varchar(50)
)


-- Create table called books
CREATE TABLE books (
	id INT GENERATED ALWAYS AS IDENTITY UNIQUE,
	publisher	varchar(50), 
	cover_state	varchar(5), 
  publish_date DATE,
  archived BOOLEAN,
  label_id INT,
  CONSTRAINT fk_label_id FOREIGN KEY (label_id) REFERENCES label(id),
)

-- Author table
CREATE TABLE author (
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name varchar(200),
    last_name varchar(200),
    PRIMARY KEY (id) );


-- Game table
CREATE TABLE game (
     id INT GENERATED ALWAYS AS IDENTITY,
     name VARCHAR(200),
     source_id INT,
     multiplayer BOOLEAN,
     publish_date DATE,
    last_played_at DATE,
    archived BOOLEAN,
    PRIMARY KEY (id),
    ADD CONSTRAINT fk_game_source FOREIGN KEY (source_id) REFERENCES source(id)
);

/* Create Music_album table */
CREATE TABLE music_album(
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    on_spotify BOOLEAN NOT NULL,
    publish_date DATE NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT fk_genre FOREIGN KEY(genre_id) REFERENCES genre(id)
);

CREATE TABLE genre (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name varchar(250) NOT NULL,
    PRIMARY KEY (id)
);