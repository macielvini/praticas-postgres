CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(255) NOT NULL,
  cpf VARCHAR(11) UNIQUE NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password TEXT NOT NULL
);

CREATE TABLE "customerPhones" (
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES "customers"("id") UNIQUE NOT NULL,
  number VARCHAR(12) UNIQUE NOT NULL,
  phone_type_id INT REFERENCES "phoneTypes"("id") NOT NULL
);

CREATE TABLE "phoneTypes" (
  id SERIAL PRIMARY KEY,
  type VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE "customerAdresses" (
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES "customers"("id") UNIQUE NOT NULL,
  street TEXT NOT NULL,
  number INT NOT NULL,
  complement TEXT,
  postal_code INT NOT NULL,
  city_id INT REFERENCES "cities"("id") UNIQUE NOT NULL
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  state_id INT REFERENCES "states"("id") NOT NULL
);

CREATE TABLE states (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE "bankAccount" (
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES "customers"("id") UNIQUE NOT NULL,
  agency INT NOT NULL,
  open_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  close_date TIMESTAMP
);

CREATE TABLE transactions (
  id SERIAL PRIMARY KEY,
  bank_account_id INT REFERENCES "bankAccount"("id") NOT NULL,
  amount INT NOT NULL,
  transaction_type_id INT REFERENCES "transactionTypes" NOT NULL,
  time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  description TEXT,
  cancelled BOOLEAN,
);

CREATE TABLE "transactionTypes" (
  id SERIAL PRIMARY KEY,
  type VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE "creditCards" (
  id SERIAL PRIMARY KEY,
  bank_account_id INT REFERENCES "bankAccount"("id") NOT NULL,
  name VARCHAR(255) REFERENCES "customers"("full_name") NOT NULL,
  number VARCHAR(12) UNIQUE NOT NULL,
  security_code INT NOT NULL,
  expiration_month TINYINT NOT NULL,
  expiration_year TINYINT NOT NULL,
  password TEXT NOT NULL,
  limit INT NOT NULL
);