
--Q1
select * from emps t1 cross join deps t2;

--Q2
select * from emps t1 left join deps t2 on t1.dept_id = t2.dept_id;

--Q3
select t1.emp_name as employee, t2.emp_name as manager from emps t1 join emps t2 on t1.manager_id = t2.emp_id;

--Q4
select * from emps where emp_id not in (select emp_id from emp_project);

--Q5
select s.student_name, c.course_name from st s join enrolls e on s.student_id = e.student_id 
        join crs c on e.course_id = c.course_id;

--Q6
select * from custs c left join order_table o on c.cust_id = o.cust_id;

--Q7
select * from deps d left join emps e on d.dept_id = e.dept_id;

--Q8
select * from teacher t left join crs c on c.teacher_id = t.teacher_id;

--Q9
select dept_id, count(*) as total_employees from emps group by dept_id;

--Q10
select s.student_id, s.student_name, c.course_name, t.teacher_name from
    st s join enrolls e on s.student_id = e.student_id 
            join crs c on e.course_id = c.course_id 
                join teacher t on c.teacher_id = t.teacher_id;

