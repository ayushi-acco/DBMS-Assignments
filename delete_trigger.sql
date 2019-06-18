create table employee_audit5(empname varchar(20),
empid INT NOT NULL primary KEY,
deptid varchar(10),empsalary numeric(8,2),
action varchar(10),changedate date);

delimiter $$
create trigger after_employee_delete
after delete on employee
for each row
begin
insert into employee_audit5 values(
OLD.empname,
OLD.empid,
OLD.deptid,
OLD.empsalary,
"delete",NOW());
end$$
delimiter ;

delete from employee where empname="ranjh"; 
select * from employee_audit5;

create table employee_audit6(empname varchar(20),
empid INT,
deptid varchar(10),empsalary numeric(8,2),
action varchar(10),changedate date);
delimiter $$
create trigger before_employee_delete
before delete on employee
for each row
begin
insert into employee_audit5 values(
OLD.empname,
OLD.empid,
OLD.deptid,
OLD.empsalary,
"delete",NOW());
end$$
delimiter ;

delete from employee where empname="radhe";
select * from employee_audit6;
