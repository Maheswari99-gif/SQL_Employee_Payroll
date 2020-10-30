#Welcome to sql
#UC1
create database employee_payroll;
USE employee_payroll;
select database();
#UC2
create table employee_payroll
(
id    INT unsigned NOT NULL AUTO_INCREMENT,
name  VARCHAR(150) NOT NULL,
salary DOUBLE NOT NULL,
start  DATE NOT NULL,
primary key (id)
);
Describe employee_payroll;
#UC3
INSERT INTO  employee_payroll (name,salary,start) VALUES
('Bill', 100000.00,'2018-01-03'),
('Mark', 300000.00,'2019-10-05'),
('Ambani',250000.00,'2017-09-02');
#UC4
select * from employee_payroll;
#UC5
select salary from employee_payroll where name='Bill';
select * from employee_payroll
where start BETWEEN CAST('2017-1-1' AS DATE) AND DATE(NOW());
#UC6
ALTER TABLE employee_payroll ADD gender CHAR(1) AFTER name;
update employee_payroll set gender='F' where name='Mark';
update employee_payroll set gender='M' where name='Bill';
update employee_payroll set gender='M' where name='Ambani';
#UC7
select AVG(salary) from employee_payroll where gender='M' group by gender;
select SUM(salary) from employee_payroll where gender='M' group by gender;
select MIN(salary) from employee_payroll where gender='M' group by gender;
select MAX(salary) from employee_payroll where gender='M' group by gender;
select COUNT(salary) from employee_payroll where gender='M' group by gender;
#UC8
ALTER TABLE employee_payroll ADD phone_number VARCHAR(250) AFTER name;
ALTER TABLE employee_payroll ADD address VARCHAR(250) AFTER phone_number;
ALTER TABLE employee_payroll ADD department VARCHAR(150) NOT NULL AFTER address;
ALTER TABLE employee_payroll ALTER address SET DEFAULT 'TBD';
#UC9
ALTER TABLE employee_payroll RENAME COLUMN salary TO basic_pay;
ALTER TABLE employee_payroll ADD deductions Double NOT NULL AFTER basic_pay;
ALTER TABLE employee_payroll ADD taxable_pay Double NOT NULL AFTER deductions;
ALTER TABLE employee_payroll ADD tax Double NOT NULL AFTER taxable_pay;
ALTER TABLE employee_payroll ADD net_pay Double NOT NULL AFTER tax;


