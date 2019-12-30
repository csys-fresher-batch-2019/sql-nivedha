# TRAINING AND PLACEMENT SERVICE

* http://trainingandplacementservice.in

## Features

* user should be able to view all the courses available in the institution

### Feature 1: List all the courses

```sql
create table course
(
course_id number,
course_name varchar2(30) not null,
course_duration varchar2(100)not null,
course_fees number not null,
constraint course_id_pk primary key(course_id)
);
```
```sql
Query:
create sequence course_id_seq start with 1001 increment by 4;
insert into course(course_id,course_name,course_duration,course_fees) values (course_id_seq.nextval,'java','1 year',50000);
insert into course(course_id,course_name,course_duration,course_fees) values (course_id_seq.nextval,'.net','6 months',25000);
insert into course(course_id,course_name,course_duration,course_fees) values (course_id_seq.nextval,'java','1 year',50000);

select * from course;
drop table course;
drop sequence course_id_seq;
```sql

create table registration
(
user_id number,user_name varchar2(30) not null,user_password varchar2(20),user_address varchar2(100)not null,mobile_no number(10) not null,
mail_id varchar2(40) not null,
qualification varchar2(50) not null,gender varchar2(10) not null,
constraint user_id_pk primary key(user_id),
constraint mobile_no check(mobile_no not like('%[^0-9]%')),
constraint gender_ck check(gender in('male','female'))
);
create sequence user_id_seq start with 101 increment by 1;
insert into registration(user_id,user_name,user_password,user_address,mobile_no,mail_id,qualification,gender)VALUES 
(user_id_seq.nextval,'nivedha','nivi@12','pondicherry',9994204643,'nivij@gmail.com','MCA','female');
insert into registration(user_id,user_name,user_password,user_address,mobile_no,mail_id,qualification,gender)VALUES 
(user_id_seq.nextval,'sujitha','suji%56','chennai',9894906643,'suji@gmail.com','BE-ECE','female');
insert into registration(user_id,user_name,user_password,user_address,mobile_no,mail_id,qualification,gender)VALUES 
(user_id_seq.nextval,'brinda','brin#01','salem',9764904642,'brinda@gmail.com','Msc-CS','female');
insert into registration(user_id,user_name,user_password,user_address,mobile_no,mail_id,qualification,gender)VALUES 
(user_id_seq.nextval,'sundar','sun_126','sivagasi',9344204643,'sundar@gmail.com','BE-IT','male');
insert into registration(user_id,user_name,user_password,user_address,mobile_no,mail_id,qualification,gender)VALUES 
(user_id_seq.nextval,'deepan','deep*28','chennai',9764320464,'deepan@gmail.com','BE-MECH','male');
select * from registration;
drop table registration;
drop sequence user_id_seq;


create table interview
(
interview_id number,client_id number not null,place varchar2(50)not null,interview_date date not null,
user_id number,performance varchar2(100) not null,
salary number not null,date_of_joining date not null,remarks varchar2(100) not null,
constraint interview_id_pk primary key (interview_id),
constraint user_id_fk foreign key(user_id) references registration(user_id)
);
                           
create table client
(
client_id number,company_name varchar2(30) not null,company_address varchar2(100)not null,mobile_no number(10) not null,
contact_person varchar2(40) not null,
mail_id varchar2(40) not null,
nature_work varchar2(100) not null,
constraint client_id_pk primary key(client_id)
);
                           
create table fees
(
s_no number,course_id number,user_id number not null,amount number,amount_status varchar(30),
constraint s_no_pk primary key(s_no),
constraint user_id_fk foreign key(user_id) references registration(user_id),
constraint amount_ck check(amount>0),
constraint amount_status_ck check(amount_status in('paid','notpaid'))
);
create table report
(
sl_no number,no_reg number not null,training_details number not null,
completion_details number not null,selection_list number not null,pending_list number not,
rejected_list number not null,total_fees_collected number not null,
constraint sl_no_pk primary key(sl_no)
);
