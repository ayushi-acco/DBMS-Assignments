create table employee_audit3(empname varchar(20),
empid INT NOT NULL primary KEY,
deptid varchar(10),empsalary numeric(8,2),
action varchar(10),changedate date);

delimiter $$
create trigger before_employee_insert
before insert on employee
for each row
begin
insert into employee_audit3 values(
new.empname,
new.empid,
new.deptid,
new.empsalary,
"insert",NOW());
end$$
delimiter ;

insert into employee values("kratika",423,"6",8907);
select * from employee;
select * from employee_audit3;

create table employee_audit4(empname varchar(20),
empid INT NOT NULL primary KEY,
deptid varchar(10),empsalary numeric(8,2),
action varchar(10),changedate date);

delimiter $$
create trigger after_employee_insert
after insert on employee
for each row
begin
insert into employee_audit4 values(
new.empname,
new.empid,
new.deptid,
new.empsalary,
"insert",NOW());
end$$
delimiter ;

insert into employee values("radhe",143,"5",89);
select * from employee_audit4;
select * from employee;