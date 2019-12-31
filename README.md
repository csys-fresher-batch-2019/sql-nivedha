# TRAINING AND PLACEMENT SERVICE

* http://trainingandplacementservice.in

## Features

* user should be able to view all the courses available in the institution

### Feature 1: List all the courses

```sql
create table course
(
course_id number,
course_name varchar2(100) not null,
course_duration number not null,
course_fees number not null,
constraint course_id_pk primary key(course_id),
constraint course_name_uq unique(course_name),
constraint course_duration_ck check(course_duration in(3,6)),
constraint course_fees_ck check(course_fees>0)
);
create sequence course_id_seq start with 1001 increment by 4;
```
Insert Query:
```sql
insert into course(course_id,course_name,course_duration,course_fees) 
values (course_id_seq.nextval,'java','6',50000);
insert into course(course_id,course_name,course_duration,course_fees) 
values (course_id_seq.nextval,'.net','3',25000);
insert into course(course_id,course_name,course_duration,course_fees) 
values (course_id_seq.nextval,'oracle','6',50000);
```
Query:
```sql
select * from course;
drop table course;
drop sequence course_id_seq;
```

### Feature 2: list the user registration details

```sql
create table registration
(
user_id number,
user_name varchar2(50) not null,
user_password varchar2(8),
user_city varchar2(100)not null,
mobile_no number(10)not null,
mail_id varchar2(40)not null,
qualification varchar2(50) not null,
gender varchar2(10) not null,
course_name varchar2(100) not null,
constraint user_id_pk primary key(user_id),
constraint mobile_no_ck check(length(To_char(mobile_no))=10),
constraint mail_id_uqq unique(mail_id),
constraint gender_cck check(gender in('male','female')),
constraint course_name_uqq unique(user_id,course_name)
);
create sequence user_id_seq start with 101 increment by 1;
```
Insert Query:
```sql
insert into registration(user_id,user_name,user_password,user_city,mobile_no,mail_id,qualification,gender,course_name)VALUES 
(user_id_seq.nextval,'nivedha','nivi@12','pondicherry',9994204643,'nivij@gmail.com','MCA','female','java');
insert into registration(user_id,user_name,user_password,user_city,mobile_no,mail_id,qualification,gender,course_name)VALUES 
(user_id_seq.nextval,'sujitha','suji%56','chennai',9894906643,'suji@gmail.com','BE-ECE','female','oracle');
insert into registration(user_id,user_name,user_password,user_city,mobile_no,mail_id,qualification,gender,course_name)VALUES 
(user_id_seq.nextval,'brinda','brin#01','salem',9764904642,'brinda@gmail.com','Msc-CS','female','.net');
insert into registration(user_id,user_name,user_password,user_city,mobile_no,mail_id,qualification,gender,course_name)VALUES 
(user_id_seq.nextval,'sundar','sun_126','sivakasi',9344204643,'sundar@gmail.com','BE-IT','male','selenium');
insert into registration(user_id,user_name,user_password,user_city,mobile_no,mail_id,qualification,gender,course_name)VALUES 
(user_id_seq.nextval,'deepan','deep*28','chennai',9764320464,'deepan@gmail.com','BE-MECH','male','python');
```
Query:
```sql
select * from registration;
drop table registration;
drop sequence user_id_seq;
```
### Feature 3: List all the client companies

```sql
create table clientcmpy
(
client_id number,
company_name varchar2(30) not null,
company_type varchar2(30),
company_address varchar2(100)not null,
ph_no number(10) not null,
contact_person varchar2(40) not null,
email_id varchar2(40) not null,
nature_work varchar2(100) not null,
constraint client_id_pk primary key(client_id),
constraint company_name_uq unique(company_name),
constraint company_type_ck check(company_type in('software')),
constraint ph_no_ck check(length(To_char(ph_no))=10),
constraint email_idd_uq unique(email_id),
constraint nature_work_ck check (nature_work in('full-time','part-time'))
);
create sequence client_id_seq start with 10001 increment by 1;
```
Insert Query:
```sql
insert into clientcmpy(client_id,company_name,company_type,company_address,ph_no,contact_person,email_id,nature_work) 
values(client_id_seq.nextval,'chainsys','software','kelambakkam',9897654389,'deepa','chainsys@gmail.com','full-time');
insert into clientcmpy(client_id,company_name,company_type,company_address,ph_no,contact_person,email_id,nature_work) 
values(client_id_seq.nextval,'newgen','software','neelankarai',9643437889,'mohan','newgen@gmail.com','part-time');
```
Query:
```sql
select * from clientcmpy;
drop table clientcmpy;
drop sequence client_id_seq;
```
create table schedule
(
sl_no number,
client_id number,
company_name varchar2(100),
job_title varchar2(100) not null,
job_requirement varchar2(100) not null,
interview_date date not null,
interview_time varchar2(50) not null,
constraint sl_noo_pk primary key(sl_no),
constraint client_id_fkk foreign key(sl_no) references clientcmpy(client_id),
constraint company_name_uni unique(company_name)
);
drop table schedule;
create sequence client_id_sequ start with 10001 increment by 1;
insert into schedule(sl_no,client_id,company_name,job_title,job_requirement,interview_date,interview_time)
values(1,client_id_sequ.nextval,'chainsys','software developer','java',to_date('02-01-2020','dd-mm-yyyy'),'10AM');
insert into schedule(sl_no,client_id,company_name,job_title,job_requirement,interview_date,interview_time)
values(2,client_id_sequ.nextval,'newgen','sql developer','oracle',to_date('11-01-2020','dd-mm-yyyy'),'11AM');


create table interview
(
interview_id number,client_id number not null,place varchar2(50)not null,interview_date date not null,
user_id number,performance varchar2(100) not null,
salary number not null,date_of_joining date not null,remarks varchar2(100) not null,
constraint interview_id_pk primary key (interview_id),
constraint user_id_fk foreign key(user_id) references registration(user_id)
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
