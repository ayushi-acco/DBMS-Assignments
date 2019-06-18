create database company;
use company;

create table employee(empname varchar(20),
empid INT NOT NULL,
deptid varchar(10),empsalary numeric(8,2));

create table department(depname varchar(20),
deptid INT NOT NULL,
empcount INT);

alter table employee add primary key(empid);
alter table department add primary key(deptid);

insert into employee values("ruhi",12,1,300);
insert into employee values("ashish",14,1,3000);
insert into employee values("ranjh",15,2,390);
insert into employee values("aayushi",13,1,356);

select * from employee;

insert into department values("CSE",1,4);
insert into department values("IT",2,3);
insert into department values("AU",3,5);

select * from department;

