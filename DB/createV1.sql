CREATE DATABASE IF NOT EXISTS car_dealership;
USE car_dealership;

-- Create Person table
CREATE TABLE IF NOT EXISTS Person (
    ssn VARCHAR(11) PRIMARY KEY,
    f_name VARCHAR(50),
    m_intial VARCHAR(1),
    l_name VARCHAR(50),
    address VARCHAR(100),
    state VARCHAR(2),
    DOB VARCHAR(10),
    gender VARCHAR(1),
    email VARCHAR(100),
    phone VARCHAR(12)
);

-- Create owner table
CREATE TABLE IF NOT EXISTS owner (
    owner_id INT PRIMARY KEY
);

-- Create Location table
CREATE TABLE IF NOT EXISTS Location (
    loc_name VARCHAR(50),
    loc_no INT PRIMARY KEY,
    loc_email VARCHAR(100),
    loc_address VARCHAR(100),
    state VARCHAR(2),
    manager_id INT,
    owner_id INT
);

-- Create Location_Phone table
CREATE TABLE IF NOT EXISTS Location_Phone (
    loc INT,
    loc_phone VARCHAR(12),
    FOREIGN KEY (loc) REFERENCES Location(loc_no)
);

-- Create Client table
CREATE TABLE IF NOT EXISTS Client (
    client_id INT PRIMARY KEY,
    ssn VARCHAR(11),
    credit_score INT,
    owner_id INT,
    FOREIGN KEY (ssn) REFERENCES Person(ssn),
    FOREIGN KEY (owner_id) REFERENCES owner(owner_id)
);

-- Create Employee table
CREATE TABLE IF NOT EXISTS Employee (
    Employee_id INT PRIMARY KEY,
    ssn VARCHAR(11),
    position VARCHAR(20),
    supervisor_id INT,
    location_no INT,
    service_id INT,
    FOREIGN KEY (ssn) REFERENCES Person(ssn),
    FOREIGN KEY (location_no) REFERENCES Location(loc_no)
);

-- Create Vehicle table
CREATE TABLE IF NOT EXISTS Vehicle (
    VIN VARCHAR(17) PRIMARY KEY,
    fuel VARCHAR(20),
    make VARCHAR(50),
    model VARCHAR(1),
    year INT,
    color VARCHAR(20),
    milage INT,
    used BOOLEAN,
    owner_id INT,
    FOREIGN KEY (owner_id) REFERENCES owner(owner_id)
);

-- Create Service table
CREATE TABLE IF NOT EXISTS Service (
    serv_id INT PRIMARY KEY,
    serv_type VARCHAR(20),
    serv_date VARCHAR(10),
    client_id INT,
    VIN VARCHAR(17),
    FOREIGN KEY (client_id) REFERENCES Client(client_id),
    FOREIGN KEY (VIN) REFERENCES Vehicle(VIN)
);

-- Create technical_service table
CREATE TABLE IF NOT EXISTS technical_service (
    serv_id INT PRIMARY KEY,
    duration INT,
    hourly_rate DECIMAL(10,2),
    price DECIMAL(10,2),
    FOREIGN KEY (serv_id) REFERENCES Service(serv_id)
);

-- Create trading table
CREATE TABLE IF NOT EXISTS trading (
    serv_id INT PRIMARY KEY,
    type_trading VARCHAR(10),
    interest_rate DECIMAL(5,2),
    deal_price DECIMAL(10,2),
    FOREIGN KEY (serv_id) REFERENCES Service(serv_id)
);