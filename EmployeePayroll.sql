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
