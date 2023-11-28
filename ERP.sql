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
    passwords VARCHAR(15),
    panel_name VARCHAR(30)
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
    panel_name varchar(10),
    FOREIGN KEY (panel_name) REFERENCES panel(panel_name),
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



select * from course;
select * from teacher;	
select * from student;
select * from Subjects;
select * from panel;
select * from timetable;
select * from attendance;




DELIMITER //
CREATE FUNCTION validate_teacher_login(tprn_param VARCHAR(255), password_param VARCHAR(255)) RETURNS INT
BEGIN
    DECLARE password_val VARCHAR(255);
    SELECT passwords INTO password_val
    FROM teacher
    WHERE tprn = tprn_param;
    IF password_val = password_param THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END //
DELIMITER ;
SELECT validate_teacher_login('10412023', 'test@12345') AS result;
DELIMITER //
CREATE FUNCTION validate_student_login(sprn_param VARCHAR(255), password_param VARCHAR(255)) RETURNS INT
BEGIN
    DECLARE password_val VARCHAR(255);
    SELECT passwords INTO password_val
    FROM student
    WHERE sprn = sprn_param;
    IF password_val = password_param THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END//
DELIMITER ;




insert into student values('103000','Rajesh','Rahul','Pandey','28','test@12345','A');
insert into student values('103001','Ramesh','prajval','Prajapati','06','test@12345','A');
insert into student values('103002','Pravin','Babu','Patidar','17','test@12345','A');
insert into student values('103003','Jayesh','Jaybhai','Patel','04','test@12345','A');
insert into student values('103004','Sujal','Prathmesh','Deshmukh','23','test@12345','A');
insert into student values('103005','Pratham','Ravindra','Rathod','32','test@12345','A');
insert into student values('103006','Johan','Rahul','Pandey','28','test@12345','A');
insert into student values('103007','Rishab','Manish','Burad','36','test@12345','A');
insert into student values('103008','Shubham','Datta','Rai','42','test@12345','A');
insert into student values('103009','Samarth','Pankaj','Hatwar','28','test@12345','A');
INSERT INTO student (sprn, fname, mname, lname, roll_no, passwords, panel_name)
VALUES('103010', 'John', 'Doe', 'Smith', '01', 'test@12345', 'B'),
('103011', 'Jane', 'Marie', 'Johnson', '02', 'test@12345', 'B'),
('103012', 'Robert', 'William', 'Miller', '03', 'test@12345', 'B'),
('103013', 'Emily', 'Grace', 'Davis', '04', 'test@12345', 'B'),
('103014', 'Michael', 'Alexander', 'Brown', '05', 'test@12345', 'B'),
('103015', 'Sophia', 'Isabella', 'Taylor', '06', 'test@12345', 'B'),
('103016', 'Daniel', 'Joseph', 'Anderson', '07', 'test@12345', 'B'),
('103017', 'Olivia', 'Evelyn', 'Clark', '08', 'test@12345', 'B'),
('103018', 'Samarth', 'Pankaj', 'Hatwar', '09', 'test@12345', 'B'),
('103019', 'Ava', 'Madison', 'White', '10', 'test@12345', 'B');
INSERT INTO student (sprn, fname, mname, lname, roll_no, passwords, panel_name)
VALUES('103020', 'Alice', 'Marie', 'Johnson', '01', 'test@12345', 'C'),
('103021', 'Bob', 'William', 'Miller', '02', 'test@12345', 'C'),
('103022', 'Charlie', 'Doe', 'Smith', '03', 'test@12345', 'C'),
('103023', 'David', 'Grace', 'Davis', '04', 'test@12345', 'C'),
('103024', 'Eva', 'Alexander', 'Brown', '05', 'test@12345', 'C'),
('103025', 'Frank', 'Isabella', 'Taylor', '06', 'test@12345', 'C'),
('103026', 'Grace', 'Joseph', 'Anderson', '07', 'test@12345', 'C'),
('103027', 'Henry', 'Evelyn', 'Clark', '08', 'test@12345', 'C'),
('103028', 'Ivy', 'Pankaj', 'Hatwar', '09', 'test@12345', 'C'),
('103029', 'Jack', 'Madison', 'White', '10', 'test@12345', 'C');
INSERT INTO student (sprn, fname, mname, lname, roll_no, passwords, panel_name)
VALUES('103030', 'Emma', 'Rose', 'Anderson', '01', 'test@12345', 'D'),
('103031', 'Finn', 'Michael', 'Thompson', '02', 'test@12345', 'D'),
('103032', 'Giselle', 'Daniel', 'Harrison', '03', 'test@12345', 'D'),
('103033', 'Harry', 'Grace', 'Carter', '04', 'test@12345', 'D'),
('103034', 'Isla', 'William', 'Bennett', '05', 'test@12345', 'D'),
('103035', 'Jacob', 'Isabella', 'Fisher', '06', 'test@12345', 'D'),
('103036', 'Katie', 'Joseph', 'Gardner', '07', 'test@12345', 'D'),
('103037', 'Leo', 'Evelyn', 'Parker', '08', 'test@12345', 'D'),
('103038', 'Mia', 'Ethan', 'Wright', '09', 'test@12345', 'D'),
('103039', 'Noah', 'Madison', 'Hayes', '10', 'test@12345', 'D');


insert into course values('2001','DBMS',102000);
insert into course values('2002','OS',102001);
insert into course values('2003','FDS',102002);
insert into course values('2004','MMC',102003);
insert into course values('2005','DETT',102004);


insert into teacher values ('102000','Shilpa','Sonavane','test@12345','2001');
insert into teacher values ('102001','Ranjana','Agrawal','test@12345','2002');
insert into teacher values ('102002','Shridevi','Karande','test@12345','2003');
insert into teacher values ('102003','Shamla','Mantri','test@12345','2004');
insert into teacher values ('102004','Prerna','Jain','test@12345','2005');


insert into panel values('A','10');
insert into panel values('B','10');
insert into panel values('C','10');
insert into panel values('D','10');


insert into Subjects values('A','2001');
insert into Subjects values('A','2002');
insert into Subjects values('A','2003');
insert into Subjects values('A','2004');
insert into Subjects values('A','2005');
INSERT INTO Subjects (panel_name, course_id) VALUES ('B', '2001');
INSERT INTO Subjects (panel_name, course_id) VALUES ('B', '2002');
INSERT INTO Subjects (panel_name, course_id) VALUES ('B', '2003');
INSERT INTO Subjects (panel_name, course_id) VALUES ('B', '2004');
INSERT INTO Subjects (panel_name, course_id) VALUES ('B', '2005');
INSERT INTO Subjects (panel_name, course_id)
VALUES ('C', '2001'),('C', '2002'),('C', '2003'),('C', '2004'),('C', '2005');
INSERT INTO Subjects (panel_name, course_id)
VALUES ('D', '2001'),('D', '2002'),('D', '2003'),('D', '2004');

select t.day,t.tprn,s.sprn,s.panel_name from timetable as t join student s on t.panel_name=s.panel_name;


INSERT INTO timetable (tprn, day, time, panel_name)
VALUES
('102002', 'Monday', '10:00', 'A'),
('102002', 'Tuesday', '10:00', 'A'),
('102002', 'Wednesday', '10:00', 'A'),
('102002', 'Thursday', '10:00', 'A'),
('102002', 'Friday', '10:00', 'A'),
('102001', 'Monday', '11:00', 'A'),
('102001', 'Tuesday', '11:00', 'A'),
('102001', 'Wednesday', '11:00', 'A'),
('102001', 'Thursday', '11:00', 'A'),
('102001', 'Friday', '11:00', 'A'),
('102003', 'Monday', '13:00', 'A'),
('102003', 'Tuesday', '13:00', 'A'),
('102003', 'Wednesday', '13:00', 'A'),
('102003', 'Thursday', '13:00', 'A'),
('102003', 'Friday', '13:00', 'A'),
('102004', 'Monday', '14:00', 'A'),
('102004', 'Tuesday', '14:00', 'A'),
('102004', 'Wednesday', '14:00', 'A'),
('102004', 'Thursday', '14:00', 'A'),
('102004', 'Friday', '14:00', 'A'),
('102000', 'Monday', '15:00', 'A'),
('102000', 'Tuesday', '15:00', 'A'),
('102000', 'Wednesday', '15:00', 'A'),
('102000', 'Thursday', '15:00', 'A'),
('102000', 'Friday', '15:00', 'A'),
('102000', 'Monday', '10:00', 'B'),
('102000', 'Tuesday', '10:00', 'B'),
('102000', 'Wednesday', '10:00', 'B'),
('102000', 'Thursday', '10:00', 'B'),
('102000', 'Friday', '10:00', 'B'),
('102003', 'Monday', '11:00', 'B'),
('102003', 'Tuesday', '11:00', 'B'),
('102003', 'Wednesday', '11:00', 'B'),
('102003', 'Thursday', '11:00', 'B'),
('102003', 'Friday', '11:00', 'B'),
('102004', 'Monday', '13:00', 'B'),
('102004', 'Tuesday', '13:00', 'B'),
('102004', 'Wednesday', '13:00', 'B'),
('102004', 'Thursday', '13:00', 'B'),
('102004', 'Friday', '13:00', 'B'),
('102001', 'Monday', '14:00', 'B'),
('102001', 'Tuesday', '14:00', 'B'),
('102001', 'Wednesday', '14:00', 'B'),
('102001', 'Thursday', '14:00', 'B'),
('102001', 'Friday', '14:00', 'B'),
('102002', 'Monday', '15:00', 'B'),
('102002', 'Tuesday', '15:00', 'B'),
('102002', 'Wednesday', '15:00', 'B'),
('102002', 'Thursday', '15:00', 'B'),
('102002', 'Friday', '15:00', 'B'),
('102003', 'Monday', '10:00', 'C'),
('102003', 'Tuesday', '10:00', 'C'),
('102003', 'Wednesday', '10:00', 'C'),
('102003', 'Thursday', '10:00', 'C'),
('102003', 'Friday', '10:00', 'C'),
('102004', 'Monday', '11:00', 'C'),
('102004', 'Tuesday', '11:00', 'C'),
('102004', 'Wednesday', '11:00', 'C'),
('102004', 'Thursday', '11:00', 'C'),
('102004', 'Friday', '11:00', 'C'),
('102002', 'Monday', '13:00', 'C'),
('102002', 'Tuesday', '13:00', 'C'),
('102002', 'Wednesday', '13:00', 'C'),
('102002', 'Thursday', '13:00', 'C'),
('102002', 'Friday', '13:00', 'C'),
('102000', 'Monday', '14:00', 'C'),
('102000', 'Tuesday', '14:00', 'C'),
('102000', 'Wednesday', '14:00', 'C'),
('102000', 'Thursday', '14:00', 'C'),
('102000', 'Friday', '14:00', 'C'),
('102001', 'Monday', '15:00', 'C'),
('102001', 'Tuesday', '15:00', 'C'),
('102001', 'Wednesday', '15:00', 'C'),
('102001', 'Thursday', '15:00', 'C'),
('102001', 'Friday', '15:00', 'C'),
('102001', 'Monday', '10:00', 'D'),
('102001', 'Tuesday', '10:00', 'D'),
('102001', 'Wednesday', '10:00', 'D'),
('102001', 'Thursday', '10:00', 'D'),
('102001', 'Friday', '10:00', 'D'),
('102002', 'Monday', '11:00', 'D'),
('102002', 'Tuesday', '11:00', 'D'),
('102002', 'Wednesday', '11:00', 'D'),
('102002', 'Thursday', '11:00', 'D'),
('102002', 'Friday', '11:00', 'D'),
('102000', 'Monday', '13:00', 'D'),
('102000', 'Tuesday', '13:00', 'D'),
('102000', 'Wednesday', '13:00', 'D'),
('102000', 'Thursday', '13:00', 'D'),
('102000', 'Friday', '13:00', 'D'),
('102003', 'Monday', '14:00', 'D'),
('102003', 'Tuesday', '14:00', 'D'),
('102003', 'Wednesday', '14:00', 'D'),
('102003', 'Thursday', '14:00', 'D'),
('102003', 'Friday', '14:00', 'D');



DELIMITER $$
create procedure insert_attend()
begin 
declare c_day varchar(10);
declare c_tprn int;
declare c_sprn int;
declare c_pannel varchar(10);
declare done int default 0;
declare curr cursor for
select t.day,t.tprn,s.sprn,s.panel_name from timetable as t join student s on t.panel_name=s.panel_name;
declare continue handler for not found set done =1;
open curr;
repeat
fetch curr into c_day,  c_tprn,  c_sprn,  c_pannel;
insert into attendance values(c_sprn,c_tprn,c_day, NULL, c_pannel);
UNTIL DONE
END REPEAT;
CLOSE CURR;
END $$
DELIMITER ;
call insert_attend();
delimiter $$
create procedure update_att2(in prn1 int,in prn2 int, in st varchar(3))
begin
update attendance set status=st where tprn=prn1 and sprn=prn2;
end$$
delimiter ;	
select * from attendance where tprn=102000 and sprn=103000;
select * from attendance;



