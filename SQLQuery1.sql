select *from employee;
select *from department;
select *from Employee_Project;
select *from Project;
select *from Attendance;
select *from Salary_History;

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

select e.employee_id,e.first_name+' '+e.last_name as employee_name, m.first_name+' '+m.last_name as manager_name
from employee e
left join employee m on e.manager_id=m.employee_id;

select e.employee_id, e.first_name+' '+e.last_name as employee_name
from employee e 
left join employee m on e.manager_id=m.employee_id
where m.manager_id is null;

select d.department_name,count(e.employee_id) as employee_count
from department d 
left join employee e on d.department_id=e.department_id
group by department_name;

select e.employee_id,first_name,last_name
from employee e
left join employee_project p on e.employee_id=p.employee_id
where p.project_id is null
--39
select e.first_name+' '+e.last_name as employee_name,project_name,role,hours_worked
from employee e 
join employee_project p on e.employee_id = p.employee_id
join project k on p.project_id = k.project_id
order by k.project_name;

select p.project_name , count(*) as employee_count
from project p
left join employee_project ep on ep.project_id=p.project_id
group by p.project_id,p.project_name
order by employee_count desc;

select @@version;



