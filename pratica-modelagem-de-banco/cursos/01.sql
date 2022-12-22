CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name VARCHAR(55) UNIQUE NOT NULL,
  cpf VARCHAR(11) UNIQUE NOT NULL,
  email VARCHAR(55) UNIQUE NOT NULL
);

CREATE TABLE students_teams (
  id SERIAL PRIMARY KEY,
  student_id INT REFERENCES "students"("id"),
  team_id INT REFERENCES "teams"("id"),
  join_date TIMESTAMP NOT NULL,
  left_date TIMESTAMP
);

CREATE TABLE teams (
  id SERIAL PRIMARY KEY,
  code VARCHAR(10) UNIQUE NOT NULL
);

CREATE TABLE grades (
  id SERIAL PRIMARY KEY,
  code VARCHAR(10) UNIQUE NOT NULL
);

CREATE TABLE modules (
  id SERIAL PRIMARY KEY,
  code VARCHAR(10) UNIQUE NOT NULL
);

CREATE TABLE projects (
  id SERIAL PRIMARY KEY,
  name VARCHAR(55) NOT NULL,
  owner_id INT REFERENCES "students"("id"),
  delivery_date TIMESTAMP NOT NULL,
  student_delivery_date TIMESTAMP NOT NULL,
  grade_id REFERENCES "grades"("id"),
  module_id REFERENCES "modules"("id")
)