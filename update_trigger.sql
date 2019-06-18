create table employee_audit1(empname varchar(20),
empid INT,
deptid varchar(10),empsalary numeric(8,2),
action varchar(10),changedate date);
delimiter $$
create trigger before_employee_update
before update on employee
for each row
begin
insert into employee_audit1 values(
OLD.empname,
OLD.empid,
OLD.deptid,
OLD.empsalary,
"update",NOW());
end$$
delimiter ;

update employee set empname="arjun" where empname="aarohi";
select * from employee;
select * from employee_audit1;

create table employee_audit2(empname varchar(20),
empid INT NOT NULL primary KEY,
deptid varchar(10),empsalary numeric(8,2),
action varchar(10),changedate date);
delimiter $$
create trigger after_employee_update
after update on employee
for each row
begin
insert into employee_audit1 values(
OLD.empname,
OLD.empid,
OLD.deptid,
OLD.empsalary,
"update",NOW());
end$$
delimiter ;

select * from employee;
update employee set empname="priya" where empid=14;