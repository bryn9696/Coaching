CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(60) UNIQUE, password VARCHAR(60), email VARCHAR(70) UNIQUE, phone_number BIGINT);
CREATE TABLE jobs (id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES users(id), pay INTEGER, job VARCHAR(60), description VARCHAR(240));
CREATE TABLE bookings (id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES users(id), job_id INTEGER REFERENCES jobs(id), date VARCHAR(60), approved BOOLEAN);

This is for both coaching and coaching_test databases.
