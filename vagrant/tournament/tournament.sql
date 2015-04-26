-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

CREATE DATABASE tournament;

\c tournament

CREATE TABLE IF NOT EXISTS players (
	id serial PRIMARY KEY,
	name text 
);

CREATE TABLE IF NOT EXISTS matches (
	id serial PRIMARY KEY,
	winner integer REFERENCES players (id),
	loser integer REFERENCES players (id)
);

CREATE VIEW total_matches AS
	SELECT players.id, count(*) AS num FROM players 
	JOIN matches ON players.id = matches.winner OR players.id = matches.loser
	GROUP BY players.id
;

CREATE VIEW total_wins AS
	SELECT players.id, count(matches.winner) AS wins FROM players 
	JOIN matches ON players.id = matches.winner GROUP BY players.id
;

