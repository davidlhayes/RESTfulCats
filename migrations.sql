CREATE DATABASE restfulcats;

\c restfulcats


CREATE TABLE cats (id SERIAL PRIMARY KEY, name varchar(255), breed varchar(255));

CREATE TABLE flights(id SERIAL PRIMARY KEY, airline varchar(255), flight_number varchar(25), aircraft varchar(255), origin varchar(3), destination varchar(3), altitude real, ground_speed real, latitude real,
longitude real);

CREATE TABLE bike_trails(id SERIAL PRIMARY KEY, name varchar(255), locale varchar(255), state varchar(2), length real, elev_change real);
