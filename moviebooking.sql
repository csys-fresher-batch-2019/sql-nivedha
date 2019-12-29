create table users
(
user_id number,user_name varchar2(30),email_id varchar2(30),epassword varchar2(8),mobile_no number(10),gender varchar2(10),
constraint user_id_pk primary key(user_id),constraint gender_ck check(gender in('male','female'))
);
create table movie
(
movie_id number,theater_id number not null,movie_type varchar2(30) not null,movie_status varchar2(40)not null,
constraint movie_id_pk primary key(movie_id),constraint movie_type_ck check(movie_type in('english','tamil','hindi','telugu','malayalam')),
constraint movie_status_ck check(movie_status in('available','notavailable'))
);
