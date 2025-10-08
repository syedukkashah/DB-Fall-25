--Q1
select dept_id, count(*) as num_students from student group by dept_id;

select course_id from enrollment where student_id = (select student_id from student where student_name = 'Ali');

--Q2
select avg(gpa), dept_id from student group by dept_id;
select dept_id from student group by dept_id having avg(gpa) > 3.0;

--Q3
select course_name, (select avg(fee) from student s, enrollment e 
    where s.student_id = e.student_id and
            c.course_id = e.course_id) as avg_fee from course c;
            
--Q4
select dept_id, count(*) as num_faculty_members from faculty group by dept_id;

--Q5
select * from faculty where salary > 
    (select avg(salary) from faculty);
    
--Q6
select * from student where gpa > 
    any(select gpa from student where dept_id = 
        (select dept_id from department where dept_name = 'CS')); 
        
--Q7
select * from (
    select student_id, student_name, gpa from student order by gpa desc)
        where rownum<=3;
        
--Q8
-- this query returns students that are enrolled in some of the courses that Ali is enrolled in
select * from student where student_id in (
    select distinct student_id from enrollment where course_id in (
        select course_id from enrollment where student_id = 
            (select student_id from student where student_name = 'Ali')) 
                and student_id != (select student_id from student where student_name = 'Ali'));
                
-- this query returns students that are enrolled in ALL of the courses Ali is enrolled in (AT LEAST the courses Ali is enrolled in)
select * from student s where not exists( --retreving all students that don't satisfy the condition
    select * from enrollment e_ali where e_ali.student_id = (select student_id from student where student_name = 'Ali') --get ali ID
    and e_ali.course_id not in(select e_stu.course_id from enrollment e_stu where e_stu.student_id = s.student_id)) 
    and s.student_id != (SELECT student_id FROM student WHERE student_name = 'Ali');
    
--Q9
select dept_id, sum(fee_paid) as fee_collected from student group by dept_id;

--Q10
select * from course where course_id in 
    (select course_id from enrollment where student_id in
        (select student_id from student where gpa > 3.5));
        
        
