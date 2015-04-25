-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

CREATE TABLE IF NOT EXISTS players (
	id serial PRIMARY KEY,
	name text 
);

CREATE TABLE IF NOT EXISTS matches (
	id serial PRIMARY KEY,
	player1_id integer REFERENCES players (id),
	player2_id integer REFERENCES players (id),
	result boolean
);

