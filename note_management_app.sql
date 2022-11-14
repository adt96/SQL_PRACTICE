create database note_management_app;
use note_management_app;
CREATE TABLE User (
	user_id int primary key, 
    user_name varchar(255),
    user_added_date date, 
    user_password varchar(255), 
    user_mobile int 
);

CREATE TABLE Note (
note_id int primary key, 
note_title varchar(255),
 note_content varchar(255), 
 note_status varchar(255),
 note_creation_date date
);


CREATE TABLE Category (
category_id int primary key ,
 category_name varchar(255), 
 category_descr varchar(255), 
 category_creation_date date, 
 category_creator varchar(255)
);

CREATE TABLE Reminder (
reminder_id int primary key,
 reminder_name varchar(255),
 reminder_descr varchar(255),
 reminder_type varchar(255), 
 reminder_creation_date date, 
 reminder_creator varchar(255)
);


CREATE TABLE NoteCategory (
notecategory_id int primary key,
 note_id int, 
 category_id int,
 FOREIGN KEY(note_id) REFERENCES Note(note_id),
 FOREIGN KEY(category_id) REFERENCES Category(category_id)
);

CREATE TABLE Notereminder (
	notereminder_id int primary key,
    note_id int, 
    reminder_id int,
 FOREIGN KEY(note_id) REFERENCES Note(note_id),
 FOREIGN KEY(reminder_id) REFERENCES Reminder(reminder_id)
);


CREATE TABLE usernote (
	usernote_id int primary key,
    user_id int,
    note_id int,
 FOREIGN KEY(note_id) REFERENCES Note(note_id),
 FOREIGN KEY(note_id) REFERENCES Note(note_id)
);


INSERT INTO `Note` (`note_id`, `note_title`, `note_content`, `note_status`, `note_creation_date`) VALUES ('1', 'Note1', 'Note1-content', 'Inprogress', '2022-02-03');
INSERT INTO `Note` (`note_id`, `note_title`, `note_content`, `note_status`, `note_creation_date`) VALUES ('2', 'Note2', 'Note2-content', 'InActive', '2022-02-04');
INSERT INTO `Note` (`note_id`, `note_title`, `note_content`, `note_status`, `note_creation_date`) VALUES ('3', 'Note3', 'Note3-content', 'Active', '2021-02-10');
INSERT INTO `Note` (`note_id`, `note_title`, `note_content`, `note_status`, `note_creation_date`) VALUES ('4', 'Note4', 'Note4-content', '=Active', '2020-02-21');

INSERT INTO `Category` ( `category_id`, `category_name`,`category_descr`, `category_creation_date`, `category_creator`) VALUES ( '1','Category1', 'Category1-desc', '2022-01-05', '101');
INSERT INTO `Category` ( `category_id`, `category_name`,`category_descr`, `category_creation_date`, `category_creator`) VALUES ( '2','Category2', 'Category2-desc', '2021-01-06', '102');
INSERT INTO `Category` ( `category_id`, `category_name`,`category_descr`, `category_creation_date`, `category_creator`) VALUES ( '3','Category3', 'Category3-desc', '2019-01-11', '103');
INSERT INTO `Category` ( `category_id`, `category_name`,`category_descr`, `category_creation_date`, `category_creator`) VALUES ( '4','Category4', 'Category4-desc', '2022-01-10', '104');



INSERT INTO `NoteCategory` ( `notecategory_id`,`note_id`, `category_id`) VALUES ( '1', '2','1');
INSERT INTO `NoteCategory` ( `notecategory_id`,`note_id`, `category_id`) VALUES ( '2', '2','2');
INSERT INTO `NoteCategory` ( `notecategory_id`,`note_id`, `category_id`) VALUES ( '3', '2','1');
INSERT INTO `NoteCategory` ( `notecategory_id`,`note_id`, `category_id`) VALUES ( '4', '4','2');


INSERT INTO `User` (`user_id`,`user_name`,`user_added_date`,`user_password`,`user_mobile`) VALUES (1,'Aditya','1996-12-01','svns',1234);
INSERT INTO `User` (`user_id`,`user_name`,`user_added_date`,`user_password`,`user_mobile`) VALUES (2,'Sai','1991-12-12','sure',5678);

INSERT INTO `UserNote` ( `usernote_id`,`user_id`, `note_id`) VALUES ( '1', '2','1');
INSERT INTO `UserNote` ( `usernote_id`,`user_id`, `note_id`) VALUES ( '2', '1','2');
INSERT INTO `UserNote` ( `usernote_id`,`user_id`, `note_id`) VALUES ( '3', '1','1');

INSERT INTO `Reminder` ( `reminder_id`,`reminder_name`, `reminder_descr`, `reminder_type`, `reminder_creation_date`, `reminder_creator`) VALUES ( '1','rem1', 'rem1-desc', 'erveryday', '2004-03-26', '1');
INSERT INTO `Reminder` ( `reminder_id`,`reminder_name`, `reminder_descr`, `reminder_type`, `reminder_creation_date`, `reminder_creator`) VALUES ( '2','rem2', 'rem2-desc', 'erveryday', '2022-03-26', '2');

insert into notereminder values("1","4","1");
insert into notereminder values("2","2","2");

-- 1.Fetch the row from User table based on Id and Password.
select *from User where user_id=1 and user_password="svns";


-- 2.Fetch all the rows from Note table based on the field note_creation_date.
select * from note where note_creation_date='2022-02-03';


-- 3.Fetch all the Categories created after the particular Date.
select * from Category where category_creation_date >'2019-01-11';


-- 4.Fetch all the Note ID from UserNote table for a given User.
select note_id from Usernote where user_id=2;

-- 5.Write Update query to modify particular Note for the given note Id.
update  Note set note_title="Note1",note_content="Note1-content" ,note_status="completed" where note_id=2;

-- 6.Fetch all the Notes from the Note table by a particular User.
select * from User u INNER JOIN UserNote usernote  on u.user_id and usernote.user_id where u.user_id=1;

-- 7.Fetch all the Notes from the Note table for a particular Category.
SELECT * FROM Note INNER JOIN NoteCategory ON Note.note_id=NoteCategory.note_id where NoteCategory.category_id=1;

-- 8.Fetch all the reminder details for a given note id.
select * from Reminder r INNER JOIN Notereminder nr on r.reminder_id=nr.reminder_id where r.reminder_id=1;

-- 9.Fetch the reminder details for a given reminder id.
select * from Reminder where reminder_id=2;


-- 10.Write a query to create a new Note from particular User (Use Note and UserNote tables - insert statement).
insert into Note(`note_id`,`note_title`,`note_content`,`note_status`,`note_creation_date`)  values( "6","Note6", "note6-content", "Progress", "2020-06-21");
insert into NoteCategory(notecategory_id,note_id, category_id) values(last_insert_id(),2, 2);



-- 11.Write a query to create a new Note from particular User to particular Category(Use Note and NoteCategory tables - insert statement)

insert into Note(`note_id`,`note_title`,`note_content`,`note_status`,`note_creation_date`)  values( 16,"Note16", "note16-content", "Progress", "2020-05-22");
insert into NoteCategory(notecategory_id,note_id, category_id) values(last_insert_id(),4, 1);


-- 12.Write a query to set a reminder for a particular note (Use Reminder and NoteReminder tables - insert statement)
insert into Reminder (`reminder_id`,`reminder_name`,`reminder_descr`,`reminder_type`,`reminder_creation_date`,`reminder_creator`)  values("5","rem5", "rem5-desc", "1hr", "2000-06-20", 1);
insert into Notereminder values(last_insert_id(),4,2);

-- 13.Write a query to delete particular Note added by a User(Note and UserNote tables - delete statement)
delete from UserNote where user_id=2 AND note_id=2;
delete from Note where note_status="Inprogress";

-- 14.Write a query to delete particular Note from particular Category(Note and NoteCategory tables - delete statement)
delete from NoteCategory where category_id=5 AND note_id=2;
delete from Note where note_title="Note1";

-- 15.Create a trigger to delete all matching records from UserNote, NoteReminder and NoteCategory table when :
-- 15.1. A particular note is deleted from Note table (all the matching records from UserNote, NoteReminder and NoteCategory should be removed automatically)
DELIMITER //
create trigger del_note before delete on Note 
FOR EACH ROW 
Begin
 delete from UserNote where note_id=old.note_id; 
 delete from Notereminder where note_id=old.note_id;
 delete from NoteCategory where note_id=old.note_id;
 END; //
DELIMITER ;
delete from Note where note_id=6;


-- 15.2. A particular user is deleted from User table (all the matching notes should be removed automatically)
DELIMITER //
create trigger del_user before delete on User
FOR EACH ROW 
Begin delete from UserNote where note_id=old.user_id; delete from NoteReminder where note_id=old.user_id;  delete from Category where category_creator=old.user_id;  delete from NoteCategory where note_id=old.user_id;  END; //
DELIMITER ;









