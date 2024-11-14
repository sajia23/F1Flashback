CREATE DATABASE f1_flashback;
USE f1_flashback;

CREATE TABLE country (
    country_id int NOT NULL AUTO_INCREMENT,
    country_key int NOT NULL,
    country_name varchar(255),
    PRIMARY KEY (country_id)
)

CREATE TABLE team (
    team_id int NOT NULL AUTO_INCREMENT,
    team_key int NOT NULL,
    team_name varchar(255),
    manufacturer varchar(255),
    PRIMARY KEY (team_id)
)

CREATE TABLE driver (
    driver_id int NOT NULL AUTO_INCREMENT,
    driver_number int NOT NULL,
    first_name varchar(255),
    last_name varchar(255),
    headshot_url varchar(255),
    team_key int,
    country_key int,
    name_acronym varchar(255),
    broadcast_name varchar(255),
    PRIMARY KEY (driver_id)
)

CREATE TABLE circuit (
    circuit_id int NOT NULL AUTO_INCREMENT,
    circuit_key int NOT NULL,
    circuit_short_name varchar(255),
    meeting_key int NOT NULL,
    meeting_name varchar(255),
    meeting_official_name varchar(255),
    country_key int NOT NULL,
    location varchar(255),
    year int,
    date_start date,
    date_end date,
    PRIMARY KEY (circuit_id)
)

CREATE TABLE session (
    session_id int NOT NULL AUTO_INCREMENT,
    session_key int NOT NULL,
    meeting_key int NOT NULL,
    date_start date,
    date_end date,
    session_name varchar(255),
    session_type_key int NOT NULL,
    PRIMARY KEY (session_id)
) 

CREATE TABLE session_type (
    session_type_id int NOT NULL AUTO_INCREMENT,
    session_type_key int NOT NULL,
    session_type_name varchar(255),
    PRIMARY KEY (session_type_id)
)

CREATE TABLE driver_session (
    driver_session_id int NOT NULL AUTO_INCREMENT,
    driver_number int,
    session_key int,
    meeting_key int,
    PRIMARY KEY (driver_session_id)
)

CREATE TABLE stint (
    stint_id int NOT NULL AUTO_INCREMENT,
    driver_number int NOT NULL,
    meeting_key int NOT NULL,
    session_key int NOT NULL,
    stint_number int,
    tyre_age_at_start int,
    lap_start int,
    lap_end int,
    compound varchar(255),
    PRIMARY KEY (stint_id)
)