create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;
create table class(
	id int primary key auto_increment,
    class_name varchar (255),
    startdate date,
    `status` boolean
);
create table student(
	id int primary key auto_increment,
    student_name varchar(255),
    address varchar(255),
    phone char(11),
	class_id int ,
    `status` boolean,
    foreign key(class_id) references class(id)
);
create table `subject`(
	id int primary key auto_increment,
    sub_name varchar(255),
    credit int,
    `status` boolean
);
create table mark(
	mark_id int primary key auto_increment,
    sub_id int,
    student_id int,
    mark int,
    exam_times int,
    foreign key(student_id) references student(id),
    foreign key(sub_id) references `subject`(id)
);
INSERT INTO class(class_name,startdate,`status`) VALUES 
( 'A1', '2008-12-20', 1),
 ( 'A2', '2008-12-22', 1),
 ( 'B3', current_date, 0);
INSERT INTO student (student_name, address, phone, `Status`, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1),
		('Manh', 'HCM', '0123123123', 0, 2);
INSERT INTO student (student_name, address,`Status`, class_id)
values ('Hoa', 'Hai phong', 1, 1);
INSERT INTO `subject`
VALUES (1, 'CF', 5, 1),
 (2, 'C', 6, 1),
 (3, 'HDJ', 5, 1),
 (4, 'RDBMS', 10, 1);
 INSERT INTO mark (sub_id, student_id, mark, exam_times)
VALUES (1, 1, 8, 1),
 (1, 2, 10, 2),
 (2, 1, 12, 1);
 -- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
 select student.student_name from student where student_name like 'h%';
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12
select c.* from class c where month(c.startdate)=12;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select s.* from `subject` sub where sub.credit between 3 and 5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update student set class_id = 2 where id = 1;
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select s.student_name,sub.sub_name,m.mark from student s 
join mark m on s.id = m.student_id
join `subject` sub on m.sub_id = sub.id 
order by m.mark desc, s.student_name asc;
