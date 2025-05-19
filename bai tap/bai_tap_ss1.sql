create database student_management;
use student_management;
create table class(
	id int,
    `name` varchar(255)
);


create table teacher(
	id int,
    `name` varchar (255),
    age int check (age>18),
    country varchar (255)
    );
select * from class;
select * from teacher;
insert into class(id,name) values(1, 'c02');
insert into class(id,name) values(2, 'c03');
insert into teacher(id, name , age, country) values(1,'hoa',20,'quảng nam');
insert into teacher(id, name , age, country) values(2,'quỳnh',21,'danang');