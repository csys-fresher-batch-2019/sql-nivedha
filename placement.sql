create table registration
(
user_id number,user_name varchar2(30) not null,user_address varchar2(100)not null,mobile_no number(10) not null,
mail_id varchar2(40) not null,
qualification varchar2(50) not null,gender varchar2(10) not null,
constraint user_id_pk primary key(user_id),
constraint gender_ck check(gender in('male','female'))
);

