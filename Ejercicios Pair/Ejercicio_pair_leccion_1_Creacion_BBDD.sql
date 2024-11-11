CREATE SCHEMA mi_ejercicio;
USE mi_ejercicio;

CREATE TABLE empleadas (
	id_empleada INT NOT NULL,
    salario FLOAT, 
    nombre VARCHAR(255),
    apellido VARCHAR(255),
    pais VARCHAR(255),
    PRIMARY KEY (id_empleada)
);

CREATE TABLE personas2 (
    id INT NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    nombre VARCHAR(255),
    edad INT CHECK (edad > 16),
    ciudad varchar(255) DEFAULT 'Madrid',
	PRIMARY KEY (id)
);


CREATE TABLE empleadas (
	id_empleada INT NOT NULL AUTO_INCREMENT,
    salario FLOAT, 
    nombre VARCHAR(255),
    apellido VARCHAR(255),
    pais VARCHAR(255),
    PRIMARY KEY (id_empleada)
);
CREATE TABLE empleadas_en_proyectos (
    id_empleada INT NOT NULL,
    id_proyectos INT NOT NULL,
    PRIMARY KEY(id_empleada, id_proyecto),
    FOREIGN KEY (id_empleada) 
	REFERENCES empleadas(id_empleada)
	ON DELETE CASCADE
);

CREATE TABLE customers (
    id_customer INT NOT NULL,
    nombre_customer VARCHAR(255),
    apellido_customer VARCHAR(255),
    email_customer VARCHAR(255),
    direccion_customer VARCHAR(255),
    PRIMARY KEY (id_customer)
);

 CREATE TABLE employees (
    id_employee INT NOT NULL,
    nombre_employee VARCHAR(255),
    apellido_employee VARCHAR(255),
    email_employee VARCHAR(255),
    salario FLOAT,
    PRIMARY KEY (id_employee)
);   

CREATE TABLE new_customers (
    id_customer INT NOT NULL,
    nombre_customer VARCHAR(255),
    apellido_customer VARCHAR(255),
    email_customer VARCHAR(255),
    direccion_customer VARCHAR(255),
    credito FLOAT CHECK (credito >= 0)
    PRIMARY KEY(id_customer)
);
    
CREATE TABLE new_employees (
    id_employee INT NOT NULL,
    nombre_employee VARCHAR(255),
    apellido_employee VARCHAR(255),
    email_employee VARCHAR(255),
    salario FLOAT,
    PRIMARY KEY (id_employee)
);   
