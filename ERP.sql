SHOW DATABASES; 
create database erp;
use erp;

CREATE TABLE teacher (
    tprn INT PRIMARY KEY,
    fname VARCHAR(15),
    lname VARCHAR(15),
    passwords VARCHAR(15),
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE panel (
    panel_name VARCHAR(30) PRIMARY KEY,
    total_student INT
);

CREATE TABLE Subjects (
    panel_name VARCHAR(20),
    course_id INT ,
    FOREIGN KEY (panel_name) REFERENCES panel(panel_name),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE student (
    sprn INT PRIMARY KEY,
    fname VARCHAR(20),
    mname VARCHAR(20),
    lname VARCHAR(20),
    roll_no VARCHAR(20),
    password VARCHAR(15)
);

CREATE TABLE course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(15),
    tprn INT
);

CREATE TABLE attendance (
    sprn INT,
    tprn INT,
    day VARCHAR(20),
    status VARCHAR(10),
    PRIMARY KEY (sprn, tprn, day),
    FOREIGN KEY (sprn) REFERENCES student(sprn),
    FOREIGN KEY (tprn) REFERENCES teacher(tprn)
);

CREATE TABLE timetable (
    tprn INT,
    day VARCHAR(20),
    time VARCHAR(20),
    panel_name VARCHAR(30),
    PRIMARY KEY (tprn, day, time),
    FOREIGN KEY (tprn) REFERENCES teacher(tprn),
    FOREIGN KEY (panel_name) REFERENCES panel(panel_name)
);
insert into teacher values('10412023','shamla','mantri','test@12345','104');
insert into course values('104','MMC','10412023');
update  course set course_name ='MMC' where tprn=10412023;

alter table course drop column tprn;
select * from course;
select * from teacher;	
drop database erp;
