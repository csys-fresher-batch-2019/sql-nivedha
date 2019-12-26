create table task 
(
task_id number,
task_name varchar2(50) not null,
task_by varchar2(30),
task_dd date,
task_cd date,
constraint task_id_pk primary key(task_id),
constraint task_name_uq unique(task_name)
);
insert into task
(
task_id, task_name, task_by, task_dd, task_cd) values
(1,'java','nivedha',to_date('27-12-2019','dd-mm-yyyy'),to_date('26-12-2019','dd-mm-yyyy')
);
insert into task
(
task_id, task_name, task_by, task_dd, task_cd) values
(2,'oracle','kavitha',to_date('25-12-2019','dd-mm-yyyy'),to_date('24-12-2019','dd-mm-yyyy')
);
insert into task
(
task_id, task_name, task_by, task_dd, task_cd) values
(3,'sql','sathvika',to_date('28-12-2019','dd-mm-yyyy'),to_date('29-12-2019','dd-mm-yyyy')
);
select * from task;


