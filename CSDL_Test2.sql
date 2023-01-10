create database CSDL_Test2;
use CSDL_Test2;
create table Subjects (
                          SubjectID int(4) not null auto_increment primary key,
                          SubjectName varchar(50) not null
);
create table Classes (
                         ClassID int(4) not null auto_increment primary key,
                         ClassName varchar(50) not null
);
create table Students (
                          StudentID int(4) not null auto_increment primary key,
                          StudentName varchar(50) not null,
                          Age int(4) not null,
                          Email varchar(100) not null
);
create table ClassStudent (
                              StudentID int(4) not null,
                              ClassID int(4) not null,
                              foreign key (ClassID) references Classes(ClassID),
                              foreign key (StudentID) references Students(StudentID)
);
create table Marks (
                       Mark int(4) not null,
                       SubjectID int not null,
                       StudentID int not null,
                       foreign key (SubjectID) references Subjects(SubjectID),
                       foreign key (StudentID) references Students(StudentID)
);
INSERT INTO Students (StudentName, Age, Email)
VALUES ('Nguyen Quang An','18','an@yahoo.com'),
       ('Nguyen Cong Vinh','20','vinh@gmail.com'),
       ('Nguyen Van Quyen','19','quyen'),
       ('Pham Thanh Binh','25','binh@com'),
       ('Nguyen Van Tai Em','30','taiem@sport.vn');
INSERT INTO Classes ( ClassName)
VALUES ('C0706L'),
       ('C0708G');
INSERT INTO ClassStudent (StudentID,ClassID)
VALUES ('1','1'),
       ('2', '1'),
       ('3', '2'),
       ('4', '2'),
       ('5', '2');
INSERT INTO Subjects (SubjectName)
VALUES ('SQL'),
       ('Java'),
       ('C'),
       ('Visual Basic');
INSERT INTO Marks (Mark, SubjectID, StudentID)
VALUES ('8', '1', '1'),
       ('4', '2', '1'),
       ('9', '1', '1'),
       ('7', '1', '3'),
       ('3', '1', '4'),
       ('5', '2', '5'),
       ('8', '3', '3'),
       ('1', '3', '5'),
       ('3', '2', '4');
-- Hiển thị danh sách tất cả các học viên--
select StudentID,StudentName from Students;
-- Hiển thị danh sách tất cả các môn học --
select * from Subjects;
-- Tính điểm trung bình
select avg(Marks.Mark) Trung_Binh from Marks;
-- Hiển thị môn học nào có học sinh thi được điểm cao nhất
select Subjects.SubjectName from Subjects join Marks where Subjects.SubjectID = Marks.SubjectID order by Marks.Mark desc limit 1;
-- Đánh số thứ tự của điểm theo chiều giảm dần.
select * from Marks order by Mark desc;
-- Thay đổi kiểu dữ liệu của cột SubjectName thành varchar(max)
alter table Subjects modify column SubjectName varchar(255);
-- Cập nhập thêm dòng chữ <<Đây là môn học>> vào trước các bảng ghi trên cột SubjectName trong bảng Subjects
UPDATE `CSDL_Test2`.`Subjects` SET `SubjectName` = 'Đây là môn học SQL' WHERE (`SubjectID` = '1');
UPDATE `CSDL_Test2`.`Subjects` SET `SubjectName` = 'Đây là môn học Java' WHERE (`SubjectID` = '2');
UPDATE `CSDL_Test2`.`Subjects` SET `SubjectName` = 'Đây là môn học C' WHERE (`SubjectID` = '3');
UPDATE `CSDL_Test2`.`Subjects` SET `SubjectName` = 'Đây là môn học Visual Basic' WHERE (`SubjectID` = '4');
-- Viet Check Constraint de kiem tra do tuoi nhap vao trong bang Student yeu cau Age >15 va Age < 50
alter table Students add check (Age > 15 and Age < 50 );
-- Loại bỏ tất cả quan hệ giữa các bảng.
ALTER TABLE `CSDL_Test2`.`Marks`
DROP FOREIGN KEY `Marks_ibfk_2`,
DROP FOREIGN KEY `Marks_ibfk_1`;
ALTER TABLE `CSDL_Test2`.`Marks`
DROP INDEX `StudentID` ,
DROP INDEX `SubjectID` ;
;
ALTER TABLE `CSDL_Test2`.`ClassStudent`
DROP FOREIGN KEY `ClassStudent_ibfk_2`,
DROP FOREIGN KEY `ClassStudent_ibfk_1`;
ALTER TABLE `CSDL_Test2`.`ClassStudent`
DROP INDEX `StudentID` ,
DROP INDEX `ClassID` ;
;
ALTER TABLE `CSDL_Test2`.`ClassStudent`
DROP FOREIGN KEY `ClassStudent_ibfk_2`,
DROP FOREIGN KEY `ClassStudent_ibfk_1`;
ALTER TABLE `CSDL_Test2`.`ClassStudent`
DROP INDEX `StudentID` ,
DROP INDEX `ClassID` ;
;
-- Xóa học viên có StudentID = 1;
DELETE FROM `CSDL_Test2`.`Students` WHERE (`StudentID` = '1');
-- Trong bảng student thêm một column Status có kiểu dữ liệu là Bit và có giá trị Default là 1.
alter table `CSDL_Test2`.`Students`
    add column `Status` BIT(1);
-- Cập nhập giá trị Status trong bảng Student thành 0;
update Students set `Status` = `0` where StudentID = 1;




