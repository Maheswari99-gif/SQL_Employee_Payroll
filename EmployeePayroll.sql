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
#UC10
UPDATE employee_payroll SET department = 'Sales' WHERE name = 'Mark';
INSERT INTO employee_payroll
(name, department, gender, basic_pay, deductions, taxable_pay, tax, net_pay, start) VALUES
('Mark', 'Marketing', 'F', 3000000.00, 1000000.00, 2000000.00, 500000.00, 1500000.00, '2019-10-05');
SELECT * FROM employee_payroll WHERE name = 'Mark';
#UC11                                                            
create table company (
    comp_id int unsigned not null primary key,
    comp_name varchar(50) not null
);

create table employee (
    emp_id int unsigned not null primary key,
    name varchar(50) not null,
    comp_id int unsigned,
    phn_no varchar(50) not null,
    address varchar(250) not null,
    gender char(1),
    start_date date not null,
    foreign key (comp_id) references company (comp_id)
);

create table department (
    dept_id int  not  null primary key,
    dept_name varchar(50) not null
);

create table payroll (
    emp_id int unsigned not null,
    basic_pay double not null,
    deductions double not null,
    taxable_pay double not null,
    income_tax double not null,
    net_pay double not null,
    foreign key (emp_id) references employee (emp_id)
);

create table employee_department (
    emp_id int unsigned not null,
    dept_id int not null,
    foreign key (emp_id) references employee (emp_id),
    foreign key (dept_id) references department (dept_id)
);
INSERT INTO payroll(emp_id,basic_pay,deductions,taxable_pay,income_tax,net_pay) VALUES
('E1',10000,5000,15000,2000,16000),
('E2',20000,4000,20000,4000,26000),
('E3',30000,3000,30000,3000,37000);
SELECT * FROM payroll;

INSERT INTO employee (emp_id,name,comp_id,phn_no,address,gender,start_date) VALUES
('E1','Bill','C1','12345678','AP','M','2010-06-22'),
('E2','Mark','C2','245132613','AP','M','2016-10-15'),
('E3','Terisa','C3','34567832','AP','F','2018-01-11');
SELECT * FROM employee;

INSERT INTO department(dept_id,dept_name) VALUES
('D1', 'training'),
('D2', 'sales'),
('D3', 'marketing');
SELECT * FROM department;
INSERT INTO employee_department(emp_id,dept_id) VALUES
('E1','D1'),
('E2','D3'),
('E3','D2');
SELECT * FROM employee_department;
SELECT gender,SUM(net_pay),AVG(net_pay),MIN(net_pay),MAX(net_pay) 
FROM employee JOIN payroll 
ON employee.emp_id = payroll.emp_id
GROUP BY gender ; 
select gender,COUNT(*) from employee_details group by gender;
#UC12
SELECT * FROM payroll;
SELECT * FROM employee;
SELECT * FROM department;
SELECT * FROM employee_department;

SELECT name,basic_pay,deductions,taxable_pay,income_tax,net_pay 
FROM employee JOIN payroll 
ON employee.emp_id = payroll.emp_id
HAVING name = 'Bill';              

SELECT start_date,name,basic_pay,deductions,taxable_pay,income_tax,net_pay 
FROM employee JOIN payroll 
ON employee.emp_id = payroll.emp_id
HAVING start_date BETWEEN CAST('2010-01-01' as date) and date(now());








