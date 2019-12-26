create table taskuser
(task_id number,user_name varchar2(30),e_mail varchar2(30),mail_password varchar2(10));
insert into taskuser(task_id,user_name,e_mail,mail_password) values (1,'nivedha','nivedhaj1997@gmail.com','nivedhaj');
insert into taskuser(task_id,user_name,e_mail,mail_password) values (2,'kavitha','kavithaj1997@gmail.com','kavithaj');
insert into taskuser(task_id,user_name,e_mail,mail_password) values (3,'xxxx','xxxj1997@gmail.com','nivedhaj');
select * from taskuser;
