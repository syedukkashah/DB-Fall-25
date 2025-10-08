create table deps (
    dept_id number primary key,
    dept_name varchar2(50),
    location varchar2(50)
);

create table emps (
    emp_id number primary key,
    emp_name varchar2(50),
    salary number(10,2),
    hire_date date,
    dept_id number references deps(dept_id),
    manager_id number references emps(emp_id)
);

create table project (
    proj_id number primary key,
    proj_name varchar2(50),
    dept_id number references deps(dept_id)
);

create table emp_project (
    emp_id number references emps(emp_id),
    proj_id number references project(proj_id),
    primary key (emp_id, proj_id)
);

create table teacher (
    teacher_id number primary key,
    teacher_name varchar2(50),
    city varchar2(50)
);

create table crs (
    course_id number primary key,
    course_name varchar2(50),
    teacher_id number references teacher(teacher_id)
);

create table st (
    student_id number primary key,
    student_name varchar2(50),
    city varchar2(50)
);

create table enrolls (
    student_id number references st(student_id),
    course_id number references crs(course_id),
    primary key (student_id, course_id)
);

create table custs (
    cust_id number primary key,
    cust_name varchar2(50)
);

create table order_table (
    order_id number primary key,
    cust_id number references custs(cust_id),
    order_date date
);

--populating tables
insert into deps values (1, 'it', 'lahore');
insert into deps values (2, 'hr', 'karachi');
insert into deps values (3, 'finance', 'islamabad');

insert into emps values (101, 'ali', 65000, date '2021-05-15', 1, null);
insert into emps values (102, 'sara', 55000, date '2022-01-10', 1, 101);
insert into emps values (103, 'ahmed', 72000, date '2020-11-20', 2, null);
insert into emps values (104, 'fatima', 48000, date '2023-03-05', 2, 103);
insert into emps values (105, 'usman', 51000, date '2022-09-12', 1, 101);
insert into emps values (106, 'hamza', 80000, date '2021-08-01', 3, null);

insert into project values (201, 'ai research', 1);
insert into project values (202, 'recruitment portal', 2);
insert into project values (203, 'budget planner', 3);


insert into teacher values (301, 'sir ali', 'lahore');
insert into teacher values (302, 'madam zara', 'karachi');
insert into teacher values (303, 'sir omar', 'lahore');

insert into crs values (401, 'database systems', 301);
insert into crs values (402, 'web dev', 301);
insert into crs values (403, 'ai', 303);
insert into crs values (404, 'management', 302);

insert into st values (501, 'ahsan', 'lahore');
insert into st values (502, 'sana', 'lahore');
insert into st values (503, 'bilal', 'karachi');
insert into st values (504, 'hira', 'islamabad');

insert into enrolls values (501, 401);
insert into enrolls values (501, 402);
insert into enrolls values (502, 403);
insert into enrolls values (503, 404);
-- student 504 not enrolled (for “no course” query)

insert into custs values (601, 'kamran');
insert into custs values (602, 'ali');
insert into custs values (603, 'nida');
insert into custs values (604, 'junaid');

insert into order_table values (701, 601, date '2023-05-10');
insert into order_table values (702, 601, date '2023-06-15');
insert into order_table values (703, 602, date '2023-04-25');
-- customers 603 and 604 have no orders (for outer join question)

select * from deps;
select * from emps;
select * from project;
select * from emp_project;
select * from teacher;
select * from crs;
select * from st;
select * from enrolls;
select * from custs;
select * from order_table;
