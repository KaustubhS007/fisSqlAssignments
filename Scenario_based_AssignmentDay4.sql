create database lib;

--1]
create table book(id int primary key,title varchar(80),author varchar(40),isbn NUMERIC(12) unique,published_date date)

insert into book values(1,'My First Sql Book','Mary Parker',981482029127,'2012-02-22'),(2,'My Second Sql Book','John Mayer',857300923713,'1972-07-03'),(3,'My First Sql Book','Cary Flint',523120967812,'2015-10-18')

select * from book where author like '%er'

--2]
create table reviews(id int references  book(id)  ,book_id int,reviewer_name varchar(80),content varchar(40),rating int,published_date date)

insert into reviews values(1,1,'John Smith','My First Review',4,'2017-12-10'),(2,2,'John Smith','My Second Review',5,'2017-10-13'),(2,2,'Alice Parker','Another Review',1,'2017-10-22')

select b.title ,b.author  ,r.reviewer_name  from book b join reviews r on b.id=r.id

--3]
select reviewer_name from reviews group by reviewer_name having  count(book_id) >1

--4]
create table customer(id int primary key,name varchar(80),age int, address varchar(20),salary int )

insert into customer values(1,'Ramesh',32,'Ahmeadabad',2000),(2,'Khilan',25,'Delhi',1500),(3,'Kaushik',23,'Kota',2000),
(4,'Chaitali',25,'Mumbai',6500),(5,'Hardik',25,'Bhopal',8500),(6,'Komal',22,'MP',4500),(7,'Muffy',24,'Indore',10000)

select name,address from customer where address like '%o%'

--5]
create table orders(oid int,date date,customerid int,amount int)

insert into orders values(102,'2009-10-08',3,3000),(100,'2009-10-08',3,1500),(101,'2009-11-20',2,1560),(103,'2008-05-20',4,2060)

select date,count(customerid) as 'Total no of orders' from orders group by date having count(customerid) >1


--6] 
create  table employee(id int primary key,name varchar(80),age int, address varchar(20),salary int )

insert into employee values(1,'Ramesh',32,'Ahmeadabad',2000),(2,'Khilan',25,'Delhi',1500),(3,'Kaushik',23,'Kota',2000),
(4,'Chaitali',25,'Mumbai',6500),(5,'Hardik',25,'Bhopal',8500),(6,'Komal',22,'MP',NULL),(7,'Muffy',24,'Indore',NULL)


select lower(name) as name from employee where salary is NULL


--7]
create table Studentdetails  (RegisterNo int,Name varchar(20),Age int ,Qualification varchar(20),MobileNo Numeric(10),Mailid varchar(20),Location varchar(20),Gender varchar(2)) 

insert into Studentdetails values(2,'Sai',22,'B.E',9952836777,'Sai@gmail.com','Chennai','M'),
(3,'Kumar',20,'BSC',7890125648,'Kumar@gmail.com','Madurai','M'),
(4,'Selvi',22,'B.Tech',8904567342,'selvi@gamil.com','Selam','F'),
(5,'Nisha',25,'M.E',7834672310,'Nisha@gmail.com','Theni','F'),
(6,'SaiSaran',21,'B.A',7890345678,'saran@gmail.com','Madurai','F'),
(7,'Tom',23,'BCA',8901234675,'Tom@gmail.com','Pune','M')

select * from Studentdetails

select sum(case when Gender='M' then 1 else 0 end) as 'No of Males',
sum(case when Gender='F' then 1 else 0 end) as 'No of Females'
from Studentdetails

--8]
create table Coursedetails(C_ID varchar(5) primary key,
C_Name varchar(30),
Start_date date,
End_date date,
Fee int)

create table CourseRegistration(RegisterNo int,
Cid varchar(5) references Coursedetails(C_ID),
Batch varchar(2)
)

insert into Coursedetails values('DN003','DotNet','2018-02-01','2018-02-28',15000),
('DV004','Data Visualization','2018-03-01','2018-04-15',15000),
('JA002','Advanced Java','2018-01-02','2018-01-20',10000),
('JC001','Core Java','2018-01-02','2018-01-12',3000)

insert into CourseRegistration values(2,'DN003','FN'),
(3,'DV004','AN'),
(4,'JA002','FN'),
(2,'JA002','AN'),
(5,'JC001','FN')

select * from Coursedetails
select * from CourseRegistration

select cr.Cid,cd.C_Name,count(cr.Cid) as 'No of Students'  from Coursedetails cd join CourseRegistration cr on cd.C_ID=cr.Cid where Start_date between '2018-01-02' and '2018-02-28' group by cd.C_Name,cr.Cid order by cr.Cid desc

--9]
create table Customer1(customer_id int primary key,
first_name varchar(30),
last_name varchar(30)
)

create table Order1(order_id int primary key,
order_date date,
amount float,
customer_id int
)

insert into Customer1 values(1,'George','Washington'),
(2,'John','Adams'),
(3,'Thomas','Jefferson'),
(4,'James','Madison'),
(5,'James','Mpnroe')

insert into Order1 values(1,'1776-07-04',234.56,1),
(2,'1760-03-14',78.50,3),
(3,'1784-05-23',124.00,2),
(4,'1790-09-03',65.50,3),
(5,'1795-07-21',25.50,10),
(6,'1787-11-27',14.40,9)

select * from Customer1
select * from Order1

select c.first_name,c.last_name from Customer1 c
where c.customer_id in (select o.customer_id from Order1 o group by customer_id having count(o.customer_id)=2)


--10]
select REVERSE(Name) as 'Reverse order Student Name',UPPER(Location) as 'Location in UpperCase'
from Studentdetails

create table Product(Id int primary key, ProductName varchar(30), SupplierId int, UnitPrice int, Package varchar(20), IsDiscontinued varchar(5) )

create table OrderItem(Id int primary key, OrderId int, ProductId int, UnitPrice int, Quantity int)
create table Order11(Id int primary key, OrderDate date, OrderNumber int, CustomerId int, TotalAmount int )

--11]
create view OrderDetails as select p.ProductName,ot.Quantity,o.OrderNumber from 
Product p,OrderItem ot,Order11 o

select * from OrderDetails

select * from Studentdetails

select * from Coursedetails

select * from CourseRegistration

--12]
select C_Name from Coursedetails  where C_ID in (select Cid from CourseRegistration  where RegisterNo in (select RegisterNo from Studentdetails where Name='Nisha'))
