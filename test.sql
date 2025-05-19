create database if not exists my_database;

use my_database;
--  tạo bảng
create table students (
	id int primary key,
    `name` varchar(255)
);

-- alter table students add primary key (id);
alter table studens add column age int;

select * from students;
-- chỉ lấy name
select name from students;
-- hiển thị dữ liệu my_tableaddress
insert into students(id,name) values(1,'vuong');
insert into students(id,name) values(2,'vuong2');
-- chỉnh sửa dữ liệu
update students set name = 'vuong' where id = 1;
-- xoá dữ liệu
delete from students where id = 2;
-- xoá hết bảng
drop table my_table;
