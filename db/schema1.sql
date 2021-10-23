DROP DATABASE IF EXISTS company_db;

CREATE DATABASE company_db;

USE company_db;

DROP TABLE IF EXISTS department;

CREATE TABLE IF NOT EXISTS department(
id INT AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS role;

CREATE TABLE IF NOT EXISTS role(
id INT AUTO_INCREMENT,
title VARCHAR(30) NOT NULL,
salary DECIMAL NOT NULL,
department_id INT,
    PRIMARY KEY(id),
	    FOREIGN KEY(department_id)
	    REFERENCES department(id)
ON DELETE SET NULL
);

DROP TABLE IF EXISTS employee;

CREATE TABLE IF NOT EXISTS employee(
id INT NOT NULL AUTO_INCREMENT ,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
role_id INT ,
manager_id INT ,
    PRIMARY KEY (id),
        FOREIGN KEY (role_id)
        REFERENCES role(id) 
 ON DELETE SET NULL,
        FOREIGN KEY (manager_id) 
        REFERENCES employee(id)  
 ON DELETE SET NULL
);



