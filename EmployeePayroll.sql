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
