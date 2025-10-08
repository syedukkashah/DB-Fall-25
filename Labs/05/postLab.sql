
--Q11
select s.student_id, s.student_name, t.teacher_name, t.teacher_id, 
    s.city as student_city, t.city as teacher_city from 
        st s join teacher t on s.city = t.city;

--Q12
select t1.emp_id, t1.emp_name, t2.manager_id from emps t1 
    left join emps t2 on t1.emp_id = t2.manager_id;
    
--Q13
select * from emps e where e.dept_id not in (select d.dept_id from deps d);

--Q14
select * from deps t1 join 
    (select dept_id, avg(salary) as avg_salary from emps 
        group by dept_id having avg(salary) > 50000) t2 
            on t1.dept_id = t2.dept_id;

--Q15
select * from emps t1 join (select dept_id, avg(salary) as avg_salary from emps group by dept_id) t2 
            on t1.dept_id = t2.dept_id where t1.salary > t2.avg_salary;
            
--Q16
select * from deps d where d.dept_id in (select e.dept_id from emps e where e.salary >=30000);

--Q17
select * from st s join enrolls e on s.student_id = e.student_id 
    join crs c on e.course_id = c.course_id 
        where s.city = 'lahore';
        
--Q18
select e.emp_id, e.emp_name, e.hire_date, e.dept_id, e.manager_id
    from emps e join deps d on e.dept_id = d.dept_id 
        where e.hire_date between to_date('2020-01-01', 'YYYY-MM-DD') and to_date('2023-01-01', 'YYYY-MM-DD');
        

--Q19
select * from st s join enrolls e on s.student_id = e.student_id
    join crs c on e.course_id = c.course_id
        join teacher t on c.teacher_id = t.teacher_id
            where t.teacher_name = 'sir ali';
            
--Q20
select * from emps t1 join emps t2 on t1.emp_id = t2.manager_id 
    where t2.dept_id = t1.dept_id;
