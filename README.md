# TRAINING AND PLACEMENT SERVICE

* http://trainingandplacementservice.in

## MODULES

MODULES:

1.COURSE DETAILS
2.USER REGISTRATION DETAILS
3.USER COURSE DETAILS
4.CLIENT COMPANY DETAILS
5.INTERVIEW SCHEDULE DETAILS
6.INTERVIEW PERFORMANCE DETAILS

## Features

* user should be able to view all the courses available in the institution

### Feature 1: List all the courses


| course_id | course_name | course_duration | course_fees |
|-----------|-------------|-----------------|-------------|
| 1001      | java        | 6               | 20000       |
| 1005      | .net        | 3               | 10000       |


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
insert into course
(course_id,course_name,course_duration,course_fees) 
values 
(course_id_seq.nextval,'java','6',20000);
insert into course
(course_id,course_name,course_duration,course_fees) 
values 
(course_id_seq.nextval,'.net','3',10000);
```

Query:
```sql
select * from course;

--Display all the courses with fees
select course_name,course_fees from course;

--Display course and fees in id=1005
select course_name,course_fees from course where course_id=1005;

--Display the course fees in ascending order
select course_name,course_fees from course order by (course_fees)asc;

--Display the course fees above or equal to 20000
select course_name,course_fees from course where course_fees>=20000;

--Display the course count
select count(*) from course;

--Display the minimum course fees
select min(course_fees) from course;

--Display the maximum course fees
select max(course_fees) from course;

drop table course;
drop sequence course_id_seq;
```

### Feature 2: list the user registration details


| user_id | user_name | user_password | user_city   | mobile_no  | mail_id         | qualification | gender |  
|---------|-----------|---------------|-------------|------------|-----------------|---------------|--------|
| 201     | nivedha   | nivi@12       | pondicherry | 9994204643 | nivij@gmail.com | MCA           | female | 
| 203     | sujitha   | suji%56       | chennai     | 9894906643 | suji@gmail.com  | BE-ECE        | female | 


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
constraint user_id_pk primary key(user_id),
constraint mobile_no_ck check(length(To_char(mobile_no))=10),
constraint mail_id_uqq unique(mail_id),
constraint gender_cck check(gender in('male','female'))
);
create sequence user_id_seq start with 201 increment by 1;
```

Insert Query:
```sql
insert into registration
(user_id,user_name,user_password,user_city,mobile_no,mail_id,qualification,gender)
values 
(user_id_seq.nextval,'nivedha','nivi@12','pondicherry',9994204643,'nivij@gmail.com','MCA','female');
insert into registration
(user_id,user_name,user_password,user_city,mobile_no,mail_id,qualification,gender)
values 
(user_id_seq.nextval,'sujitha','suji%56','chennai',9894906643,'suji@gmail.com','BE-ECE','female');
```

Query:
```sql
select * from registration;

--Display the count of female users in the registration table
select count(*) from registration where gender='female';

--Display the user details where the qualification is MCA
select * from registration where qualification='MCA';

--Display the user count
select count(*) from registration;

--Display the user name in ascending order
select * from registration order by user_name asc;

drop table registration;
drop sequence user_id_seq;
```

### Feature 3: List all the user course details


| user_course_id | user_id | course_id | start_date | completion_date |
|----------------|---------|-----------|------------|-----------------|
| 2020           | 201     | 1001      | 01-01-2020 | 31-03-2020      |
| 2021           | 203     | 1005      | 05-03-2020 | 05-06-2020      |


```sql
create table usercourse
(
user_course_id number,
user_id number,
course_id number,
start_date date,
completion_date date,
constraint user_course_id_pk primary key(user_course_id),
constraint user_idd_fk foreign key(user_id) references registration(user_id),
constraint courses_idd_fk foreign key(course_id) references course(course_id),
constraint users_id_unq unique(user_id,course_id)
);
create sequence user_course_id_seq start with 2020;
create sequence user_id_sequ start with 201 increment by 1;
create sequence course_id_seqq start with 1001 increment by 4;
```

Insert Query:
```sql
insert into usercourse
(user_course_id,user_id,course_id,start_date,completion_date)
values 
(user_course_id_seq.nextval,user_id_sequ.nextval,course_id_seqq.nextval,
to_date('01-01-2020','dd-mm-yyyy'),to_date('31-03-2020','dd-mm-yyyy'));
insert into usercourse
(user_course_id,user_id,course_id,start_date,completion_date)
values 
(user_course_id_seq.nextval,user_id_sequ.nextval,course_id_seqq.nextval,
to_date('05-03-2020','dd-mm-yyyy'),to_date('05-06-2020','dd-mm-yyyy'));
```

Query:
```sql
select * from usercourse;
drop table usercourse;
```

### Feature 4: List all the client companies


| client_id | company_name | company_type | company_address | phone_no   | contact_person | email_id           | 
|-----------|--------------|--------------|-----------------|------------|----------------|--------------------|
| 1111      | chainsys     | software     | kelambakkam     | 9897654389 | deepa          | chainsys@gmail.com | 
| 1113      | newgen       | software     | neelankarai     | 9643437889 | mohan          | newgen@gmail.com   | 


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
constraint client_id_pk primary key(client_id),
constraint company_name_uq unique(company_name),
constraint company_type_ck check(company_type in('software')),
constraint ph_no_ck check(length(To_char(ph_no))=10),
constraint emaill_id_uq unique(email_id)
);
create sequence client_id_seq start with 1111 increment by 1;
```

Insert Query:
```sql
insert into clientcmpy
(client_id,company_name,company_type,company_address,ph_no,contact_person,email_id) 
values
(client_id_seq.nextval,'chainsys','software','kelambakkam',9897654389,'deepa','chainsys@gmail.com');
insert into clientcmpy
(client_id,company_name,company_type,company_address,ph_no,contact_person,email_id) 
values
(client_id_seq.nextval,'newgen','software','neelankarai',9643437889,'mohan','newgen@gmail.com');
```

Query:
```sql
select * from clientcmpy;

--Display the company name, contact number and contact person 
select company_name,ph_no,contact_person from clientcmpy;

--update the contact person in particular company
update clientcmpy set contact_person='nivedha' where company_name='chainsys';

--Display the client companies count
select count(*) from clientcmpy;

drop table clientcmpy;
drop sequence client_id_seq;
```

### Feature 5: List the interview schedule details


| interview_id | client_id | job_title          | job_requirement | interview_date | interview_time |
|--------------|-----------|--------------------|-----------------|----------------|----------------|
| 1            | 1111      | software developer | java            | 02-01-2020     | 10AM           |
| 2            | 1113      | sql developer      | oracle          | 11-01-2020     | 11AM           |


```sql
create table schedule
(
interview_id number,
client_id number,
job_title varchar2(100) not null,
job_requirement varchar2(100) not null,
created_date timestamp default current_timestamp,
interview_date date not null,
interview_time varchar2(50) not null,
constraint interview_id_pk primary key(interview_id),
constraint client_id_uni unique(client_id),
constraint client_id_fkk foreign key(client_id) references clientcmpy(client_id),
constraint interview_date_ck check (trunc(created_date) <= interview_date )
);
create sequence interview_id_seq start with 1;
create sequence client_id_sequ start with 1111 increment by 1;
```

Insert Query:
```sql
insert into schedule
(interview_id,client_id,job_title,job_requirement,interview_date,interview_time)
values
(interview_id_seq.nextval,client_id_sequ.nextval,'software developer','java',to_date('05-01-2020','dd-mm-yyyy'),'10AM');
insert into schedule
(interview_id,client_id,job_title,job_requirement,interview_date,interview_time)
values
(interview_id_seq.nextval,client_id_sequ.nextval,'sql developer','oracle',to_date('11-01-2020','dd-mm-yyyy'),'11AM');
```

Query:
```sql
select * from schedule;

--Display the client companies where the job requirement is 'java'
select * from clientcmpy where client_id=
(select client_id from schedule where job_requirement='java');

--Display the company details where the interview date is 05-01-2020
select * from clientcmpy where client_id=
(select client_id from schedule where interview_date='05-01-2020');

--Display the user details who are selected in the job title 'software developer' and the job requirement is 'java'
select * from registration where user_id=(select user_id from intervieww where client_id=
(select client_id from schedule where job_title='software developer' and job_requirement='java'));

--Diplay the course ,fees details of the user who perform 'better' in interview
select * from course where course_id=
(select course_id from usercourse where user_id=
(select user_id from intervieww where inter_perform='better'));

--Display the company details with interview schedule using join query
select c.client_id,c.company_name,c.contact_person,s.job_requirement,
s.job_title,s.interview_date,s.interview_time from 
clientcmpy c left join schedule s on c.client_id=s.client_id;

--Display the scheduled interview count
select count(*) from schedule;

drop table schedule;
drop sequence interview_id_seq;
drop sequence client_id_sequ;
```

### Feature 6: List the interview performance details


| sl_no | client_id | user_id | interview_performance | interview_status | marks | 
|-------|-----------|---------|-----------------------|------------------|-------|
|  1    | 1111      | 201     | good                  | selected         |  9    | 
|  2    | 1113      | 203     | better                | waiting          |  7    | 


```sql
create table intervieww
(
sl_no number,
client_id number not null,
user_id number not null,
inter_perform varchar2(100) not null,
inter_status varchar(50) not null,
marks number not null,
constraint serial_noo_pk primary key(sl_no),
constraint user_id_uniq unique(client_id,user_id),
constraint client_id_ffk foreign key(client_id) references clientcmpy(client_id),
constraint user_id_ffk foreign key(user_id) references registration(user_id),
constraint interv_perform_ck check (inter_perform in('good','better','bad')),
constraint interv_status_ck check (inter_status in('selected','waiting','rejected'))
);
create sequence sl_no_sqn start with 1;
create sequence clientt_id_sqn start with 1111 increment by 1;                          
create sequence user_id_sqn start with 201 increment by 1;

```

Insert Query:
```sql
insert into intervieww
(sl_no,client_id,user_id,inter_perform,inter_status,marks)
values
(sl_no_sqn.nextval,clientt_id_sqn.nextval,user_id_sqn.nextval,'good','selected',9);
insert into intervieww
(sl_no,client_id,user_id,inter_perform,inter_status,marks)
values
(sl_no_sqn.nextval,clientt_id_sqn.nextval,user_id_sqn.nextval,'better','waiting',6);
```

Query:
```sql
select * from intervieww;

--Display the user details with interview details using join query
select r.user_id,r.user_name,r.qualification,i.client_id,i.inter_perform,
i.inter_status,i.marks from registration r inner join intervieww i on r.user_id=i.user_id;

--Display the user details where their interview performane is 'good'
select user_id,user_name from registration where user_id=
(select user_id from intervieww where inter_perform='good');

--If the interview marks is greater than 5 the candidate status was updated into selected
update intervieww set inter_status='selected' where marks>5;

--Display the selected users in interview and interview performance is good
select user_id,user_name,qualification from registration where user_id=
(select user_id from intervieww where inter_perform='good' and inter_status='selected');

--Display the count of selected users in the interview
select count(*) from intervieww where inter_status='selected';

--this function update the interview status based on the interview marks 
select user_id,client_id,INTERVIEW_PERFORMANCE(5)as interview_performance from intervieww where user_id=202;

drop table intervieww;
drop sequence sl_no_sqn;
drop sequence clientt_id_sqn;
drop sequence user_id_sqn;
```
Function:
```sql
CREATE OR REPLACE FUNCTION INTERVIEW_PERFORMANCE(marks number)
RETURN VARCHAR2 AS 
v_status VARCHAR2(10);
BEGIN
if marks < 5 then
v_status := 'FAILED';
elsif marks < 8 then
v_status := 'WAITING';
else
v_status := 'SELECTED';
end if;
  RETURN v_status;
END INTERVIEW_PERFORMANCE;
```

