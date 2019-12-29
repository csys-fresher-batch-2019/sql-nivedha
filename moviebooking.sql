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
create table theater
(
theater_name varchar2(50),theater_id number,theater_address varchar2(40) not null,theater_rating number,movie_list varchar2(100)not null,
movie_rating number not null,
constraint theater_name_pk primary key(theater_name),
constraint theater_id_fk foreign key(theater_id) references movie(theater_id),
constraint theater_rating_ck check(theater_rating<=5),
constraint movie_rating_ck check(movie_rating<=5)
);
