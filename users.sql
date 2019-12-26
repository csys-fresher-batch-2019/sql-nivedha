create table taskuser
(task_id number,user_id number,user_name varchar2(30) not null,e_mail varchar2(30),mail_password varchar2(10) not null),
constraint task_id_fk foreign key(task_id) references task(task_id),
constraint user_id_pk primary key(task_id),
constraint e_mail_uq unique(e_mail)
;
insert into taskuser(task_id,user_name,e_mail,mail_password) values (1,'nivedha','nivedhaj1997@gmail.com','nivedhaj');
insert into taskuser(task_id,user_name,e_mail,mail_password) values (2,'kavitha','kavithaj1997@gmail.com','kavithaj');
insert into taskuser(task_id,user_name,e_mail,mail_password) values (3,'xxxx','xxxj1997@gmail.com','nivedhaj');
select * from taskuser;
delete from taskuser;
