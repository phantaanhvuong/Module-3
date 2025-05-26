create database codegym_management;
use codegym_management;
CREATE TABLE student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    birthday DATE,
    gender VARCHAR(15),
    email VARCHAR(255),
    score FLOAT,
    class_id INT UNIQUE,
    account_name VARCHAR(255) UNIQUE,
    FOREIGN KEY (class_id)
        REFERENCES class (id),
	FOREIGN KEY (account_name)
		REFERENCES account (name)
);
create table account(
    name varchar(255) primary key,
    password varchar(255),
    student_id int unique, 
    foreign key(student_id) references student(id) 
);
create table class(
	id int primary key auto_increment,
    name varchar(255)
);
create table room (
	id int primary key auto_increment,
    name varchar (255),
    class_id int,
    foreign key (class_id) references class(id)
);
create table instructor(
	id int primary key auto_increment,
    name varchar(255),
    birthday date,
    wage float
);
create table instructor_class(
	instructor_id int,
    class_id int,
    primary key (instructor_id, class_id),
    foreign key (instructor_id) references instructor(id),
    foreign key (class_id) references class(id)
);
