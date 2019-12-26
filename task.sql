create table task 
(
task_id number,
task_name varchar2(50) not null,
task_by varchar2(30) not null,
task_dd date not null,
task_cd date,
  task_status varchar(30),
constraint task_id_pk primary key(task_id),
constraint task_name_uq unique(task_name),
 constraint task_status_ck check(task_status in('completed','notcompleted') 
);
insert into task
(
task_id, task_name, task_by, task_dd, task_cd) values
(1,'java','nivedha',to_date('27-12-2019','dd-mm-yyyy'),to_date('26-12-2019','dd-mm-yyyy','completed')
);

insert into task
(
task_id, task_name, task_by, task_dd, task_cd) values
(2,'sql','sathvika',to_date('28-12-2019','dd-mm-yyyy'),to_date('29-12-2019','dd-mm-yyyy','notcompleted')
);
select * from task where task_status='completed';


