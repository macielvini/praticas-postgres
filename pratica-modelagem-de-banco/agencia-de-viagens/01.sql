CREATE TABLE fligths (
  id SERIAL PRIMARY KEY,
  acronym VARCHAR(10) UNIQUE NOT NULL,
  departure_airport_id INT REFERENCES "airports"("id") NOT NULL,
  arrival_airport_id INT REFERENCES "airports"("id") NOT NULL,
  departure_time TIMESTAMP NOT NULL,
  arrival_time TIMESTAMP NOT NULL,
  company_id INT REFERENCES "companies"("id")
);

CREATE TABLE airports (
  id SERIAL PRIMARY KEY,
  acronym VARCHAR(10) UNIQUE NOT NULL,
  name VARCHAR(55) UNIQUE NOT NULL
);

CREATE TABLE companies (
  id SERIAL PRIMARY KEY,
  acronym VARCHAR(10) UNIQUE NOT NULL,
  name VARCHAR(55) UNIQUE NOT NULL
)