create table registration
(
user_id number,user_name varchar2(30) not null,user_address varchar2(100)not null,mobile_no number(10) not null,
mail_id varchar2(40) not null,
qualification varchar2(50) not null,gender varchar2(10) not null,
constraint user_id_pk primary key(user_id),
constraint gender_ck check(gender in('male','female'))
);

create table course
(
course_id number,course_name varchar2(30) not null,duration varchar2(100)not null,fees number not null,
constraint course_id_pk primary key(course_id)
);

create table client
(
client_id number,company_name varchar2(30) not null,company_address varchar2(100)not null,mobile_no number(10) not null,
contact_person varchar2(40) not null,
mail_id varchar2(40) not null,
nature_work varchar2(100) not null,
constraint client_id_pk primary key(client_id)
);

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
sl_no number,no_reg number,training_details number,
completion_details number,selection_list number,pending_list number,rejected_list number,total_fees_collected number,
constraint sl_no_pk primary key(sl_no)
);
