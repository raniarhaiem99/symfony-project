-- create_users_table.sql

-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS pocteofactory;

-- Use the created database
USE pocteofactory;

-- Create the users table if it doesn't exist
CREATE TABLE IF NOT EXISTS user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Insert sample data into the users table
INSERT INTO user (name) VALUES ('John Doe');
INSERT INTO user (name) VALUES ('Jane Smith');
INSERT INTO user (name) VALUES ('Alice Brown');
INSERT INTO user (name) VALUES ('Bob White');
