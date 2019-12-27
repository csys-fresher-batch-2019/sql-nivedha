create table book
(
book_id number,book_name varchar2(30) not null,author_name varchar2(30) not null,price number not null,publisher varchar2(30)not null,
version number,category varchar2(30) not null,active number),
constraint book_id_pk primary key(book_id),
constraint price_ck check (price>=0),
constraint book_id_uq unique(book_id,book_name,author_name,version),
constraint active_ck check (active in (0,1))
);
insert into book(book_id,book_name,author_name,price,publisher,version,category,active) values (1,'java','bala',500,'millinium',2,'technical',1);
insert into book(book_id,book_name,author_name,price,publisher,version,category,active) values (2,'oracle','sundar',600,'millinium',1,'technicaldb',0);
select * from book;


create table orders
(
order_id number,user_name varchar2(30) not null,book_id number not null,ordered_date default timestamp not null,delivered_date default timestamp not null,
total_amt number not null,qty number not null,status varchar2(30)not null,comments varchar2(500) not null,
constraint order_id_pk primary key(order_id),
constraint book_id_fk foreign key(book_id) references book(book_id),
constraint total_amt check (total_amt>=0),
constraint qty_ck check(qty>=1),
constraint status_ck check (status in ('delivered','cancel','shipping','not available'))
);
