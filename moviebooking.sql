create table users
(
user_id number,user_name varchar2(30),email_id varchar2(30),password varchar2(8),mobile_no number(10),gender varchar2(10),
constraint user_id_pk primary key(user_id),constraint gender_ck check(gender in('male','female'))
);
