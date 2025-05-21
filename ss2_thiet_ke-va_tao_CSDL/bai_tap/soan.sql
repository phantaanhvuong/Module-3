create database if not exists c0225g1;
use c0225g1;
create table jame(
username varchar(50) primary key,
`password`  varchar(50)
);
create table class(
id int primary key auto_increment,
name varchar(50)
);
create table room(
id int primary key auto_increment,
name varchar(50),
class_id int,
foreign key(class_id) references class(id)
);
create table student(
id int primary key auto_increment,
name varchar(50),
gender boolean,
birthday date,
email varchar(100),
point float,
username varchar(50) unique,
class_id int,
foreign key(username) references jame(username),
foreign key(class_id) references class(id)
);
create table instructor(
id int primary key auto_increment,
name varchar(50),
birthday date,
salary float
);
create table instructor_class(
 instructor_id int,
 class_id int,
 start_time date,
 end_time_time date,
 primary key (instructor_id,class_id),
 foreign key(instructor_id) references instructor(id),
 foreign key(class_id) references class(id)
);

INSERT INTO jame (username, password) VALUES
('vuong123', '123haha'),
('huhuhihi', 'abcd'),
('hahaha', 'abcd');
INSERT INTO class (name) VALUES
('lớp buổi sáng'),
('lớp buổi chiều'),
('lớp buổi tối');
INSERT INTO room (name, class_id) VALUES
('Phòng A', 1),
('Phòng B', 2),
('Phòng C', 3);
INSERT INTO student (name, gender, birthday, email, point, username, class_id) VALUES
('Phan Tá Anh Vương', 1, '2004-12-10', 'anhvuong@gmail.com', 9.5, 'vuong123', 1),
('Sơn Tùng',1, '2002-09-22', 'tungson@gmail.com', 7.5, 'huhuhihi', 2),
('Tống Thị Lệ Quyên', 0, '2003-02-22', 'lequyen@gmail.com', 10.0, 'hahaha', 3);

INSERT INTO instructor (name, birthday, salary) VALUES
('Thầy Chánh', '1985-08-06', 20000000),
('Cô Cô', '1995-04-09', 19000000),
('Thầy Đồ', '1978-10-24', 1000000);

INSERT INTO instructor_class (instructor_id, class_id, start_time, end_time_time) VALUES
(1, 1, '2025-04-03', '2025-10-03'),
(2, 2, '2025-04-03', '2025-10-03'),
(3, 3, '2025-04-03', '2025-10-03');

-- 1. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào.
select student.*,class.name as 'class_name' from student join class on student.class_id=class.id; 

-- 2. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào và cả các bạn đã đăng ký nhưng chưa có lớp học.
select student.*, class.name from student left join class on student.class_id = class.id;

select student.*,class.name as 'class_name', group_concat(room.name) as 'room_name' from student left join class on student.class_id = class.id join room on class.id = room.class_id;
-- 4. Lấy thông tin của các học viên tên “Hai” và 'Huynh’.
select * from student where name like '% huynh' or name like '% hai';

-- 5. Lấy ra học viên có điểm lớn hơn 5 .
select * from student where point > 5;

-- 6. Lấy ra học viên có họ là “nguyen”
select * from student where name like 'nguyen %';

-- 7. Thông kế số lượng học sinh theo từng loại điểm.
select point, COUNT(*) AS so_luong from student group by point order by point;

-- 8 . Thông kế số lượng học sinh theo điểm và điểm phải lớn hơn 5
select COUNT(*) AS so_luong_hoc_sinh_co_diem_lon_hon_5 from student where point > 5 group by point ;

-- 9. Thông kế số lượng học sinh theo điểm lớn hơn 5 và chỉ hiện thị với số lượng>=2
select point,COUNT(*) AS so_luong from student where point > 5 group by point having COUNT(*) >= 2;

-- 10. Lấy ra danh sách học viên của lớp c1121g1 và sắp xếp tên học viên theo alphabet.
select A.* from student A inner join class B on a.class_id = b.id where b.name = 'lớp buổi sáng' order by A.name asc;