--Q11
select * from departments where department_id in (select department_id from student group by department_id having sum(fee_paid) > 1000000);

--Q12
select * from department where dept_id in(
select dept_id from faculty where salary > 100000 group by dept_id having count(*) > 5);


--Q13
delete from student where gpa < (select avg(gpa) from student);

--modifying tables before moving on to further questions...
insert into course values (6, 'Quantum Computing', 1, 30000); 
update faculty set joining_date = to_date('01-01-1990','DD-MM-YYYY') where faculty_name = 'George';
insert into enrollment values (1, 3);
insert into enrollment values (6, 5);

--Q14
delete from course where course_id not in (select distinct course_id from enrollment);

--Q15
create table high_fee_students(student_id number primary key, student_name varchar2(50), dept_id number(2), gpa number(3,2), fee_paid number(7));
insert into high_fee_students select * from student where fee_paid > (select round(avg(fee_paid),2) from student);
select * from high_fee_students;

--Q16
create table retired_faculty(faculty_id int primary key,
  faculty_name varchar2(50),
  dept_id number,
  salary number,
  joining_date date,
  foreign key (dept_id) references department(dept_id) on delete set null);
select * from faculty;
insert into retired_faculty select * from faculty where joining_date = (select min(joining_date) from faculty);
select * from retired_faculty;

--Q17
select * from department where dept_id = (
    select dept_id from
        (select dept_id from 
            student group by dept_id 
                order by sum(fee_paid) desc) 
                    where rownum = 1);
                    
-- Q18
select * from course where course_id in (
    select course_id from 
        (select course_id from enrollment 
            group by course_id 
                order by count(*) desc) 
                    where rownum <=3);
                    
--Q19
select * from student where gpa > (select avg(gpa) from student) and 
    (student_id in (select student_id from enrollment group by student_id having count(*) > 3));


--Q20. Find faculty who do not teach any course and insert them into Unassigned_Faculty.
create table unassigned_faculty as 
    (select * from faculty where faculty_id not in (select faculty_id from faculty_course));
    
select * from unassigned_faculty;
