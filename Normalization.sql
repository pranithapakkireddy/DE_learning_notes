create database college_db;

use college_db;

create table student_details(
student_id int,
student_name varchar(50),
courses varchar(100),
department_id int,
department_name varchar(50),);

select *from student_details;
exec sp_help 'student_details';

insert into student_details values
(1,'Anu','SQL,Python',101,'IT'),
(2,'Ravi','SQL,Java',102,'CSE'),
(3,'Priya','Python',101,'IT'),
(4,'Rahul','Java,SQL',102,'CSE');

--1nf

select student_id,student_name,trim(value) as course,department_id,department_name
into student_1nf
from student_details
cross apply string_split(courses,',');

select *from student_1nf;

--student_id cannot be pk so id,course is composite pk
alter table student_1nf
alter column student_id int not null;

alter table student_1nf
alter column course varchar(100) not null;

alter table student_1nf
add primary key(student_id,course);

--2nf(no partial dependencies) 
--id,course-pk department details depend on id but not course
--so split the table into student and student_courses tables

select distinct student_id,student_name,department_id,department_name
into students
from student_1nf;

select *from students;

select student_id,course
into student_courses 
from student_1nf;

select *from student_courses;

alter table students 
add primary key(student_id);

alter table student_courses
add primary key(student_id,course);

alter table student_courses
add foreign key(student_id) references students(student_id);

--3nf 
--student_id->department_id->dep_name
--create separate department table and remove depname from students

select distinct department_id,department_name into departments from students;

alter table students drop column department_name;

alter table departments 
alter column department_id int not null;

alter table departments
add primary key(department_id);

alter table students
add foreign key(department_id) references departments(department_id);

select *from students;
select *from departments;
select *from student_courses;