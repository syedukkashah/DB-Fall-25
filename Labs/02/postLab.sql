spool postLabOutput.txt
--Q20. Find the department that has the maximum number of employees.
prompt Q11 Output: 
select lpad(first_name, 15, '*') from employees;
--Q12
prompt Q12 Output: 
select trim(' Oracle') from dual;
--Q13
prompt Q13 Output: 
select initcap(first_name) as firstname, initcap(last_name) as lastname from employees;
--Q14
prompt Q14 Output: 
select next_day('20-AUG-2022', 'Monday') from dual;
--Q15
prompt Q15 Output: 
select to_char(to_date('25-DEC-2023', 'DD-MM-YYYY'), 'MM-YYYY') as myDate from dual;
--Q16
prompt Q16 Output: 
select distinct salary as salaries from employees order by salary asc;
--Q17
prompt Q17 Output: 
select round(salary, -2) as rounded_salaries from employees;
--Q18
prompt Q18 Output: 
select * from (select department_id, count(employee_id) as numEmployees from employees group by department_id order by numEmployees desc) where rownum = 1;
--Q19
prompt Q19 Output: 
select * from (select department_id, sum(salary) as salaryBudget from employees group by department_id order by salaryBudget desc) where rownum <= 3;
--Q2
prompt Q20 Output:
select * from (select department_id, count(employee_id) as numEmployees from employees group by department_id order by numEmployees desc) where rownum = 1;
spool off