create database ticket_system;
use ticket_system;

create table customer(customerid int primary key auto_increment,customer_name varchar(20),contactno varchar(12),email varchar(20));
insert into customer values(1,"aman","73847398504","aman@gmail.com");
insert into customer values(3,"sagar","73847898504","sagar@gmail.com");
insert into customer(customer_name,contactno,email )values("sagar","73847898504","sagar@gmail.com");
select * from customer;

create table movie(movie_id int primary key,movie_name varchar(20),movie_type varchar(10),rating varchar(20),start_time Time,end_time Time);
select * from movie;
insert into movie values(3,"DDLJ","romantic","5 stars",030000,060000);
insert into movie values(36,"drishyam","thriller","4 stars",050000,080000);
insert into movie values(37,"ironman","action","5 stars",080000,110000);
insert into movie values(39,"aashiqui2","romantic","5 stars",090000,000000);
delete from movie where movie_id=3;
select * from movie;

create table ticket(ticket_id int primary key,price numeric(6,2),seat_no varchar(10),movie_date date,movie_id int,customerid int,FOREIGN KEY (movie_id) REFERENCES movie(movie_id),FOREIGN KEY (customerid)  REFERENCES customer(customerid));
insert into ticket values(89,8976,"c1","2019-10-06",36,1);
select * from ticket;

delimiter //
create procedure book_ticket(IN movid int,custid int)
begin
insert into ticket values(90,7865,"c4","2019-06-19",movid,custid);
end//
delimiter ;
call book_ticket(39,3);
select * from ticket;

delimiter //
create procedure booking_details_by_date(IN mdate date)
begin
select customer_name,contactno,seat_no,customerid,email,movie_id from ticket t inner join customer c where t.customerid=c.customerid;
end//
delimiter ;
call booking_details_by_date("2019-06-19");