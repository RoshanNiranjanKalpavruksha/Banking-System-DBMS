

create database my_bank;

\c my_bank


create table bank(B_code varchar(20) primary key, B_name varchar(20), Mainoffice_address varchar(20));

create table branch(B_code varchar(20), Br_id varchar(20) primary key, Br_name varchar(20), Br_address varchar(20), foreign key(B_code) references bank);

create table employee(Emp_id varchar(20) primary key, Emp_Tablname varchar(20), Emp_startdate date);

create table employee_phno(Emp_id varchar(20), Emp_phno int, primary key(Emp_id,Emp_phno), foreign key(Emp_id) references employee);

create table customer(Cust_id varchar(20) primary key, Cust_name varchar(20), Cust_address varchar(20));

create table customer_phno(Cust_id varchar(20), Cust_phno int, primary key(Cust_id,Cust_phno), foreign key(Cust_id) references customer);

create table account(Acc_no varchar(20) primary key, Acc_type varchar(20), roi int, balance int, Br_id varchar(20), foreign key(Br_id) references branch);

create table loan(Loan_id varchar(20) primary key, Loan_amount int, Loan_years int, Br_id varchar(20), foreign key(Br_id) references branch);

create table payment(Loan_id varchar(20), Pay_no varchar(20), Pay_date date, Pay_amount int, primary key(Loan_id,Pay_no), foreign key(Loan_id) references loan);

create table custacc(Cust_id varchar(20),Acc_no varchar(20), primary key(Cust_id,Acc_no), foreign key(Cust_id) references customer, foreign key(Acc_no) references account on delete cascade);

create table Depo(Cust_id varchar(20),Acc_no varchar(20),Depo_date date,Depo_amnt int, primary key(Cust_id,Acc_no), foreign key(Cust_id) references customer, foreign key(Acc_no) references account on delete cascade);

create table Withd(Cust_id varchar(20),Acc_no varchar(20),Withd_date date,Withd_amnt int, primary key(Cust_id,Acc_no), foreign key(Cust_id) references customer, foreign key(Acc_no) references account on delete cascade);

create table Loan_payment(Loan_id varchar(20), Pay_no varchar(20),primary key(Loan_id,Pay_no), foreign key(Loan_id,Pay_no) references payment);

create table Takencare_by(Cust_id varchar(20), Emp_id varchar(20), primary key(Cust_id,Emp_id), foreign key(Cust_id) references customer, foreign key(Emp_id) references employee );

create table Borrrow(Cust_id varchar(20), Loan_id varchar(20), primary key(Cust_id,Loan_id), foreign key(Cust_id) references customer, foreign key(Loan_id) references loan);


insert into bank values ('ABC123', 'Indian Bank', 'Bangalore');

insert into bank values ('DEF456', 'Canara Bank', 'Mangalore');

insert into bank values ('GHI789', 'Punjab Bank', 'Punjab');

insert into bank values ('JKL321', 'Syndicate Bank', 'Jaipur');

insert into bank values ('MNO654', 'Swiss Bank', 'Delhi');

insert into bank values ('PQR987', 'ICICI Bank', 'Chennai');

insert into bank values ('STU963', 'Mahila Bank', 'Pune');

insert into bank values ('VWX852', 'Peoples Bank', 'Goa');

insert into bank values ('YZA741', 'Society Bank', 'Jaipur');

insert into bank values ('BCD858', 'Janahitha Bank', 'Bangalore');



insert into branch values ('ABC123', '1', 'Indian Bank1', 'Tumakuru');

insert into branch values ('ABC123', '2', 'Indian Bank2', 'Hyderabad');

insert into branch values ('DEF456', '3', 'Canara Bank1', 'Odisa');

insert into branch values ('GHI789', '4', 'Punjab Bank1', 'Punjab');

insert into branch values ('GHI789', '5', 'Punjab Bank2', 'Odisa');

insert into branch values ('GHI789', '6', 'Punjab Bank3', 'UP');

insert into branch values ('JKL321', '7', 'Syndicate Bank1', 'Bangalore');

insert into branch values ('MNO654', '8', 'Swiss Bank1', 'Pune');

insert into branch values ('PQR987', '9', 'ICICI Bank1', 'Jaipur');

insert into branch values ('PQR987', '10', 'ICICI Bank2', 'Delhi');

insert into branch values ('STU963', '11', 'Mahila Bank1', 'Delhi');

insert into branch values ('VWX852', '12', 'Peoples Bank1', 'UP');

insert into branch values ('YZA741', '13', 'Society Bank1', 'Punjab');

insert into branch values ('YZA741', '14', 'Society Bank2', 'Goa');

insert into branch values ('YZA741', '15', 'Society Bank3', 'Bangalore');

insert into branch values ('YZA741', '16', 'Society Bank4', 'Chennai');

insert into branch values ('BCD858', '17', 'Janahitha Bank1', 'Hyderabad');



insert into employee values ('A1', 'Ram', '2015-12-21');

insert into employee values ('B1', 'Keerthi', '2016-11-15');

insert into employee values ('A3', 'Raju', '2003-08-08');

insert into employee values ('C1', 'Aniket', '2015-06-03');

insert into employee values ('A5', 'Raghu', '2019-12-12');

insert into employee values ('B2', 'Ram', '2015-11-25');

insert into employee values ('B3', 'Sham', '2018-12-31');

insert into employee values ('D1', 'Pearl', '2016-11-20');

insert into employee values ('C2', 'Harini', '1999-05-01');

insert into employee values ('D6', 'Jay', '2003-02-06');

 
insert into employee_phno values ('D6', 6362100151);

insert into employee_phno values ('A5', 8756692412);

insert into employee_phno values ('A1', 4587963210);

insert into employee_phno values ('D1', 9987456321);

insert into employee_phno values ('A1', 1234567890);

insert into employee_phno values ('B3', 7894561235);

insert into employee_phno values ('C2', 8795525425);

insert into employee_phno values ('C1', 9980893654);

insert into employee_phno values ('B2', 8889654234);

insert into employee_phno values ('B1', 9844998273);

insert into employee_phno values ('A3', 9980891973);

insert into employee_phno values ('D6', 9980369354);

insert into employee_phno values ('B1', 6362113556);

 
insert into customer values ('A111B', 'Uma', 'Bangalore');

insert into customer values ('A222B', 'Pavithra', 'Jaipur');

insert into customer values ('A333B', 'Shree', 'Chennai');

insert into customer values ('A444B', 'Gary', 'Hyderabad');

insert into customer values ('A555B', 'Dhruv', 'Delhi');

insert into customer values ('A666B', 'Prathik', 'Goa');

insert into customer values ('A777B', 'Nagesh', 'Punjab');

insert into customer values ('A888B', 'Tomy', 'Bangalore');

insert into customer values ('A999B', 'Tarun', 'Punjab');

insert into customer values ('A000B', 'Yukthi', 'Odisa');



insert into customer_phno values ('A111B', 1234568521);

insert into customer_phno values ('A222B', 9876541596);

insert into customer_phno values ('A222B', 3578964121);

insert into customer_phno values ('A333B', 8569741232);

insert into customer_phno values ('A444B', 7598461235);

insert into customer_phno values ('A555B', 8795454555);

insert into customer_phno values ('A666B', 8521697431);

insert into customer_phno values ('A666B', 5896741236);

insert into customer_phno values ('A777B', 8589674125);

insert into customer_phno values ('A888B', 5796284621);

insert into customer_phno values ('A999B', 1258964715);

insert into customer_phno values ('A999B', 9982564757);

insert into customer_phno values ('A000B', 6362100152);

 
insert into account values ('JK123', 'Saving', 8, 5500, '1');

insert into account values ('LK546', 'Kids', 2, 3210, '2');

insert into account values ('PO589', 'Saving', 5, 450, '3');

insert into account values ('RF456', 'Deposit', 9, 9000, '4');

insert into account values ('TH896', 'Saving', 3, 8700, '5');

insert into account values ('SA546', 'Kids', 8, 4500, '6');

insert into account values ('FG323', 'NRI', 9, 6300, '7');

insert into account values ('HJ555', 'Deposit', 6, 1210, '8');

insert into account values ('RQ861', 'Kids', 1, 8625, '9');

insert into account values ('QE123', 'Saving', 4, 525, '10');

insert into account values ('JL453', 'NRI', 7, 1100, '11');

insert into account values ('EQ333', 'Saving', 6, 6785, '12');

insert into account values ('NM852', 'Kids', 2, 50, '13');

insert into account values ('ZF485', 'Deposit', 3, 1100, '14');

insert into account values ('ZX369', 'Saving', 4, 5500, '15');

insert into account values ('KL875', 'Kids', 8, 8975, '16');

insert into account values ('OI100', 'Deposit', 9, 500, '17');

insert into account values ('UI001', 'Saving', 6, 3200, '1');

insert into account values ('UY500', 'Salary', 7, 3000, '11');

insert into account values ('TE999', 'Deposit', 8, 7530, '16');

insert into account values ('SA775', 'Deposit', 1, 1111, '9');

insert into account values ('YG666', 'NRI', 3, 9873, '5');

 
insert into loan values ('IO9', 30000, 1, '1');

insert into loan values ('IH5', 45000, 2, '2');

insert into loan values ('HO9', 65000, 3, '3');

insert into loan values ('IL7', 78900, 4, '4');

insert into loan values ('LO9', 45450, 5, '5');

insert into loan values ('IN6', 62530, 1, '6');

insert into loan values ('NO4', 60000, 2, '7');

insert into loan values ('UY3', 80000, 2, '8');

insert into loan values ('IY1', 52500, 3, '9');

insert into loan values ('YO3', 11110, 4, '10');

insert into loan values ('IR2', 10200, 5, '11');

insert into loan values ('RO9', 30300, 1, '12');

insert into loan values ('IS7', 58000, 6, '13');

insert into loan values ('SD6', 99999, 8, '14');

insert into loan values ('DD5', 85800, 5, '15');

insert into loan values ('XZ4', 36950, 4, '16');

insert into loan values ('CV8', 75800, 3, '17');

insert into loan values ('IM8', 8750, 6, '5');

insert into loan values ('IU1', 87000, 3, '2');

 
insert into payment values ('IO9', '1', '2019-12-21', 3000);

insert into payment values ('IH5', '2', '2018-08-15', 2520);

insert into payment values ('UY3', '3', '2017-06-20', 1510);

insert into payment values ('YO3', '4', '2015-03-18', 4500);

insert into payment values ('XZ4', '5', '2016-11-17', 300);

insert into payment values ('IM8', '6', '2020-10-16', 500);

insert into payment values ('IU1', '7', '2019-02-25', 1000);

insert into payment values ('SD6', '8', '2021-09-22', 3000);

insert into payment values ('DD5', '9', '2018-05-21', 400);

insert into payment values ('RO9', '0', '2017-01-14', 2400);

insert into payment values ('IO9', '2', '2019-12-21', 3000);

 
insert into Depo values ('A111B', 'JK123', '2021-09-10', 3000);

insert into Depo values ('A222B', 'LK546', '2021-09-11', 200);

insert into Depo values ('A333B', 'PO589', '2021-09-10', 6000);

insert into Depo values ('A444B', 'RF456', '2021-09-12', 500);

insert into Depo values ('A555B', 'TH896', '2021-09-12', 1000);

insert into Depo values ('A666B', 'SA546', '2021-09-11', 700);

insert into Depo values ('A777B', 'FG323', '2021-09-12', 8500);

insert into Depo values ('A888B', 'HJ555', '2021-09-11', 2510);

insert into Depo values ('A999B', 'JL453', '2021-09-10', 3500);

insert into Depo values ('A000B', 'JK123', '2021-09-11', 8000);

insert into Depo values ('A333B', 'JK123', '2021-09-10', 4000);

insert into Depo values ('A222B', 'SA546', '2021-09-10', 6000);



insert into Withd values ('A111B', 'JK123', '2021-09-10', 300);

insert into Withd values ('A222B', 'LK546', '2021-09-11', 20);

insert into Withd values ('A333B', 'PO589', '2021-09-10', 600);

insert into Withd values ('A444B', 'RF456', '2021-09-12', 50);

insert into Withd values ('A555B', 'TH896', '2021-09-12', 100);

insert into Withd values ('A666B', 'SA546', '2021-09-11', 70);

insert into Withd values ('A777B', 'FG323', '2021-09-12', 850);

insert into Withd values ('A888B', 'HJ555', '2021-09-11', 250);

insert into Withd values ('A999B', 'JL453', '2021-09-10', 300);

insert into Withd values ('A000B', 'JK123', '2021-09-11', 800);

insert into Withd values ('A333B', 'JK123', '2021-09-10', 400);

insert into Withd values ('A222B', 'SA546', '2021-09-10', 600);

 
insert into custacc values ('A111B', 'JK123');

insert into custacc values ('A222B', 'LK546');

insert into custacc values ('A333B', 'PO589');

insert into custacc values ('A444B', 'RF456');

insert into custacc values ('A555B', 'TH896');

insert into custacc values ('A666B', 'SA546');

insert into custacc values ('A777B', 'FG323');

insert into custacc values ('A888B', 'HJ555');

insert into custacc values ('A999B', 'JL453');

 
insert into Loan_payment values ('IO9', '1');

insert into Loan_payment values ('IH5', '2');

insert into Loan_payment values ('UY3', '3');

insert into Loan_payment values ('YO3', '4');

insert into Loan_payment values ('XZ4', '5');

insert into Loan_payment values ('IM8', '6');

insert into Loan_payment values ('IU1', '7');

insert into Loan_payment values ('SD6', '8');

insert into Loan_payment values ('DD5', '9');

insert into Loan_payment values ('RO9', '0');

insert into Loan_payment values ('IO9', '2');

 
insert into Takencare_by values ('A111B', 'A1');

insert into Takencare_by values ('A222B', 'B1');

insert into Takencare_by values ('A333B', 'A3');

insert into Takencare_by values ('A444B', 'C1');

insert into Takencare_by values ('A555B', 'A5');

insert into Takencare_by values ('A666B', 'B2');

insert into Takencare_by values ('A777B', 'B3');

insert into Takencare_by values ('A888B', 'D1');

insert into Takencare_by values ('A999B', 'D6');

insert into Takencare_by values ('A000B', 'C2');

insert into Takencare_by values ('A888B', 'B2');

insert into Takencare_by values ('A555B', 'A1');

insert into Takencare_by values ('A555B', 'C2');

insert into Takencare_by values ('A111B', 'D1');

                                 
insert into Borrrow values ('A111B', 'IO9');

insert into Borrrow values ('A222B', 'IH5');

insert into Borrrow values ('A333B', 'DD5');

insert into Borrrow values ('A444B', 'SD6');

insert into Borrrow values ('A555B', 'XZ4');

insert into Borrrow values ('A666B', 'YO3');

insert into Borrrow values ('A777B', 'UY3');

insert into Borrrow values ('A888B', 'IO9');

insert into Borrrow values ('A999B', 'IM8');

insert into Borrrow values ('A000B', 'IU1');


--1
select (select balance from account a,custacc c2,customer c3 where c3.cust_name='Uma' and c3.cust_id=c2.cust_id and c2.acc_no=a.acc_no)+(select sum(d.depo_amnt) from depo d,customer c where c.cust_name = 'Uma' and c.cust_id = d.cust_id )-( select sum(w.withd_amnt) from withd w,customer c where c.cust_name = 'Uma' and c.cust_id = w.cust_id);


--2
update account set balance=balance + (roi*balance/1200);


--3
select loan_amount - (select sum(pay_amount) from payment p,borrrow b,customer c where p.loan_id = b.loan_id and b.cust_id = c.cust_id and c.cust_name ='Uma') from loan l ,customer c ,borrrow b where b.cust_id = c.cust_id and c.cust_name ='Uma' and b.loan_id = l.loan_id;


--4
create view detail as select l.loan_years,l.loan_id from loan l where l.loan_id = (select b.loan_id from borrrow b where b.cust_id =(select cust_id from customer c where c.cust_name = 'Uma'));

select * from detail;

select (select 12*d.loan_years from detail d) - count(*) from payment p where p.loan_id =(select d.loan_id from detail d);



--5
delete from account a where a.acc_no = (select acc_no from custacc where cust_id = (select cust_id from customer where cust_name='Shree')) ;


--6
insert into customer values ('B111C', 'Raj', 'Bangalore');

insert into account values ('JK999', 'Saving', 8, 5500, '1');

insert into custacc values ('B111C','JK999');



--7
update account set br_id = (select br_id from branch b where b.br_name = 'Canara Bank1') where acc_no in (select acc_no from custacc a where a.cust_id = (select c.cust_id from customer c where c.cust_name = 'Shree'));


--8
select e.emp_id ,e.emp_name ,e.emp_startdate from employee e ,takencare_by tb ,customer c where c.cust_name = 'Uma' and c.cust_id =tb.cust_id and tb.emp_id =e.emp_id ;


 
select * from employee e where e.emp_name = 'Jay';

 

select date_part('year',current_date) -date_part('year',(select emp_startdate from employee e where e.emp_name = 'Jay'));


--9
select c.cust_id ,c.cust_name ,c.cust_address,a.acc_no,a.acc_type ,a.roi  from customer c,account a,custacc ca where a.acc_no = ca.acc_no and c.cust_id = ca.cust_id and c.cust_name = 'Shree';


--10
CREATE USER shiv WITH PASSWORD 'ram' valid UNTIL '2022-01-01';


drop user if exists ram;




