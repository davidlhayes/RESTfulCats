CREATE DATABASE restfulcats;

\c restfulcats


CREATE TABLE cats (id SERIAL PRIMARY KEY, name varchar(255), breed varchar(255));
