select * from user_test;
select * from memberships;
select * from groups;

--cross join (cartesian product)
select * from user_test t1 cross join groups t2;

--inner join (common columns)
select * from user_test t1 inner join memberships t2 on t1.user_id = t2.user_id; 

--left join
select * from memberships t1 left join user_test t2 on t1.user_id = t2.user_id;

--right join
select * from memberships t1 right join user_test t2 on t1.user_id = t2.user_id;

--full outer join 
select * from memberships t1 full outer join user_test t2 on t1.user_id = t2.user_id;

--SET OPERATIONS

--union (keeps distinct common items, removes duplicate rows)
--union all performs union w/o removing duplicate rows
--intersect returns rows that appear in both tables
--minus returns only distinct rows that appear in the 1st result set but not in 2nd result set

select * from person1;
select * from person2;

select * from person1 union select * from person2;
select * from person1 union all select * from person2;
select * from person1 intersect select * from person2;
select * from person1 minus select * from person2;

 -- self join (table joined with itself), one table is treated as two different tables
 -- comapring salaries of two employees who work in the same department
 -- finding pairs of customers who have the same billing address
 
 
 select * from students;
 select * from class;
 
 --joining more than 1 col
 select * from students t1 join class t2 on t1.class_id = t2.class_id and t1.enrollment_year = t2.class_year;
 
 select * from details;
 select * from ords;
 select * from category;
 select * from use;
 
 --find order id, name and city by joining users and orders
 select order_id, name, city from ords t1 join use t2 on t2.user_id = t1.user_id;
-- find order_id, product category
select order_id, vertical from details t1 join category t2 on t1.category_id = t2.category_id;

--all orders place in pune
select order_id from ords t1 join use t2 on t1.user_id = t2.user_id where t2.city = 'Pune' and t2.name = 'Sarita';

