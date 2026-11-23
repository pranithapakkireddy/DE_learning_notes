select *from employee;
select *from department;

select first_name,last_name,job_title,salary 
from employee
where salary>60000;

select first_name+' '+last_name as name,salary,department_id
from employee
where department_id=1 and salary>60000;

select first_name,last_name,department_id 
from employee
where department_id=2 or department_id=3;

select first_name,last_name,salary 
from employee order by salary desc;

select distinct job_title from employee;

select first_name,last_name,job_title,salary
from employee
where salary between 50000 and 80000;

select first_name,last_name,job_title
from employee
where first_name like'a%';

select first_name,last_name,salary 
from employee
where last_name like '%a';

select first_name,last_name,department_id,salary
from employee 
where department_id in (1,3,5);

select first_name,last_name,department_id
from employee
where department_id not in (2,4);

select first_name,last_name,manager_id
from employee
where manager_id is null;

select name from sys.tables;


select department_id,count(*) as employee_count
from employee
group by department_id
having count(*)>3;

select department_id,avg(salary) as average_salary
from employee 
group by department_id 
having avg(salary)>65000;

select department_id, avg(salary) as average_salary
from employee
where salary>50000
group by department_id
having avg(salary)>65000;

select department_id,gender,count(*) as employee_count
from employee
group by department_id, gender;

select department_id, max(salary) as highest_salary
from employee
group by(department_id);

select department_id,count(*) as employee_count
from employee
group by(department_id)
having count(*)>=4;

select first_name,last_name,department_name
from employee e
join department d on e.department_id=d.department_id;

select first_name,last_name,department_name,salary
from employee e
join department d on e.department_id=d.department_id
where d.department_name='IT';

select first_name,last_name,department_name,salary
from employee e
join department d on e.department_id=d.department_id
order by salary desc;

select department_name,count(*) as employee_count
from department d
join employee e on e.department_id=d.department_id
group by department_name;

select department_name, avg(salary) as average_salary
from department d
join employee e on e.department_id=d.department_id
group by department_name
order by average_salary desc; 

select e.first_name+' '+e.last_name as employee_name,m.first_name+' '+m.last_name as manager_name
from employee e
join employee m on e.manager_id=m.employee_id;




