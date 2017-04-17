DROP TABLE IF EXISTS pokemons;
DROP TABLE IF EXISTS trainers;


create TABLE pokemons (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  poke_type VARCHAR,
  cp VARCHAR,
  trainer_id INT,
  img_url VARCHAR

);

create TABLE trainers (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  level INT,
  img_url VARCHAR
);
