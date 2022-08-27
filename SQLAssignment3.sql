--1]
select * from emp where job='Manager'

select * from emp
--2]
select ename,sal as 'Salary' from emp where sal > 1000

--3]
select ename,sal as 'Salary' from emp where ename <> 'James'

--4]
select ename as Name from emp where ename like 'S%'

--5]
select ename as Name from emp where ename like '%A%'

--6]
select ename as Name from emp where ename like '__L%'

--7]
select ename,sal/30 as 'Daily Salary' from emp where ename='Jones'

--8]
select sum(sal) as 'Total Monthly Salary' from emp 

--9]
select  avg(sal) as 'Average Annual Salary' from emp

--10]
select ename,job,sal,deptno from emp where job<>'SALESMAN' and deptno!=30

--11]
select distinct(deptno) from emp;

--12]
select ename as Employee,sal as 'Monthly Salary' from emp where sal > 1500 and deptno in(10,30)

--13]
select ename,job,sal from emp where job in ('Manager','Analyst') and sal not in(1000,3000,5000)

--14]
select ename as 'Employee',sal as 'Salary',comm as 'Commission' from emp
where comm > (sal*0.1)

--15]
select * from emp where ename like '%LL%' and deptno = 30 or mgrid=7782

--16]
select count(empno) as 'No of Employess' from emp 
 where DATEDIFF(YEAR, hiredate,GETDATE()) between 10 and 20;

 --17]
select t1.dname,t2.ename from dept t1 join emp t2 
on t1.deptno=t2.deptno
order by t1.dname asc,t2.ename desc

--18]
select ename,DATEDIFF(YEAR, hiredate, GETDATE()) as 'Experience' from emp
where ename='MILLER'
