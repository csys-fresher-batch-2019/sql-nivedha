create table book
(
book_id number,book_name varchar2(30) not null,author_name varchar2(30) not null,price number not null,publisher varchar2(30)not null,
version number,category varchar2(30) not null,active number,
constraint book_id_pk primary key(book_id),
constraint price_ck check (price>=0),
constraint book_id_uq unique(book_id,book_name,author_name,version),
constraint active_ck check (active in (0,1))
);
insert into book(book_id,book_name,author_name,price,publisher,version,category,active) values (1,'java','bala',500,'millinium',2,'technical',1);
insert into book(book_id,book_name,author_name,price,publisher,version,category,active) values (2,'oracle','sundar',600,'millinium',1,'technicaldb',0);
insert into book(book_id,book_name,author_name,price,publisher,version,category,active) values (3,'javanetbeans','bala',550,'millinium',5,'tech',1);
insert into book(book_id,book_name,author_name,price,publisher,version,category,active) values (4,'oracledb','sundarpitchai',699,'millinium',3,'nontechnical',0);
                            select * from book;
drop table book;

create table orders
(
order_id number,user_name varchar2(30) not null,book_id number not null,ordered_date timestamp default systimestamp not null,
delivered_date date not null,
total_amt number not null,qty number not null,status varchar2(30)not null,comments varchar2(500) not null,
constraint order_id_pk primary key(order_id),
constraint book_id_fk foreign key(book_id) references book(book_id),
constraint total_amt check (total_amt>=0),
constraint qty_ck check(qty>=1),
constraint status_ck check (status in ('delivered','cancel','shipping','not available')),
constraint order_id_uq unique(user_name,book_id,ordered_date)
);
insert into orders(order_id,user_name,book_id,delivered_date,total_amt,qty,status,comments) values 
(1,'nivedha',1,to_date ('12-26-2019','mm-dd-yyyy'),500,2,'delivered','no comments');
insert into orders(order_id,user_name,book_id,total_amt,qty,status,comments) values 
(2,'sujitha',2,to_date ('02-25-2019','mm-dd-yyyy'),900,5,'cancel','good');
insert into orders(order_id,user_name,book_id,total_amt,qty,status,comments) values 
(3,'kavitha',3,to_date ('03-14-2019','mm-dd-yyyy'),560,3,'cancel','comments');
select * from orders;
select * from book inner join orders on book.book_id=orders.book_id;
select * from book left join orders on book.book_id=orders.book_id;
select * from orders right join book on book.book_id=orders.book_id;
select * from orders full outer join book on book.book_id=orders.book_id;
drop table orders;
                            
                            create table books
                            (
                              books_id number,books_title varchar2(30) not null,books_price number,
                              constraint books_id_pk primary key(books_id),
                              constraint books_price_ck check(books_price>=0)
                              );
                        insert into books(books_id,books_title,books_price) values (1,'jdk',390);
                            insert into books(books_id,books_title,books_price) values (2,'java',499);
                            select * from books;

 create table books_stock
                            (
                              stock_id number,books_id number not null,quantity number,
                              constraint stock_id_pk primary key(stock_id),
                              constraint quantity_ck check(quantity>=1)
                              );
                        insert into books_stock(stock_id,books_id,quantity) values (1,1,3);
                            insert into books_stock(stock_id,books_id,quantity) values (2,3,4);
select * from books_stock;
                            
create table order_item
                            (
                              item_id number,order_id number not null,book_id number not null,quantity number not null,status varchar2(30),
                              constraint item_id_pk primary key(item_id),
                              constraint quantity_ck check(quantity>=1),
                              constraint status_ck check(status in('ordered','cancelled'))
                              );
                           insert into order_item(item_id,order_id,book_id,quantity,status) values (101,1,3,4,'ordered');
                           insert into order_item(item_id,order_id,book_id,quantity,status) values (102,2,4,5,'cancelled');
select * from order_item;
drop table order_item;
                                                         
                                                         
create table orderr
(
order_id number,user_name varchar2(30) not null,
tot_amt number not null,order_date timestamp default systimestamp,
deliver_date timestamp default systimestamp,status varchar2(30),
constraint orderr_id_pk primary key(order_id),
constraint total_amt_ck check(tot_amt>=1),
constraint statuss_ck check(status in('ordered','cancelled'))
);
insert into orderr
(order_id,user_name,tot_amt,status) values (1,'nivedha',3456,'ordered');

                            

                            
