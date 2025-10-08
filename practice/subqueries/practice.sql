 select * from movies;

--highest rated movie
select * from movies where score = (select max(score) from movies);

-- movie w/ highest profit (independent scalar subquery)
select * from movies where (gross - budget) = (select max(gross - budget) from movies);

--or we could use order by
select * from (select * from movies order by (gross - budget) desc) where rownum = 1;

-- how many movies have a rating > avg rating of movies 
select count(*) as num_high_rated_movies from movies where score > (select avg(score) from movies); 

--highest rated movie of 2000
select * from movies where score = (select max(score) from movies where year = 2000) and year = 2000;

--highest rated movie whose votes > avg movie votes
select * from movies where score = 
    (select max(score) from movies where votes > 
        (select avg(votes) from movies));

select * from orders;
select * from users;

-- users who never ordered (independent row subquery)
select * from users where user_id not in (select distinct user_id from orders);

--find all movies make by top 3 directors (in terms of total gross income)
select * from movies where director in
    (select * from 
        (select director from 
            movies group by director order by sum(gross) desc) where rownum<=3) order by director;



--find all movies of actors whose filmography's avg rating > 8.5 and take 25000 votes as cutoff

select * from movies where star in 
    (select star from movies where votes > 25000 group by star having avg(score) > 8.5);  
                
-- most profitable movie of each year
select * from movies where 
    ((gross - budget), year) in (select max(gross - budget), year from movies group by year) 
        order by year;

-- highest rated movie of each genre votes cutoff of 25000

select * from movies where (genre, score) in (select genre, max(score) from movies where votes > 25000 group by genre) and votes > 25000;

--highest grossing movies of top 5 actor, director combo in terms of total gross income 
select * from movies where (star, director) in (
    select * from(select star, director from 
        movies group by star, director order by sum(gross) desc) 
            where rownum<= 5);


-- correlated subquery 
-- the inner query will use some value from the outer query
 
 --all movies that have a rating higher than the avg rating of movies in the same genre
select * from movies m1 where score > (select avg(score) from movies m2 where m1.genre = m2.genre);


 
 
 
 
 
 --favourite food of each customer 
select * from orders;









-- subqueries with select 

-- % of votes for each movie compared to the total num of votes 

select name,(votes/ (select sum(votes) from movies)*100) as vote_ratio from movies;

--dislay name, genre, score and avg score of the movies from that genre
select name, genre, score, (select round(avg(score), 2) from 
    movies m2 where m2.genre = m1.genre) as avg_genre_score from
        movies m1;

-- usage with from
-- display avg rating of all resteraunts

select * from resteraunts;
select * from orders;

--join question (revisit)
select r_name, avg_rating from (
    select r_id, avg(restaurant_rating) as avg_rating from orders group by r_id;

 
--usage with having

--genres having avg score > avg score of all movies

select genre from movies group by genre having avg(score) > (select avg(score) from movies);


--subquery with insert

--populate a already created loyal_customers table with records of only those customers who have ordered 
--food more than 3 times

--join question

select user_id, count(*) from orders group by user_id;

create table directors_test(director_id number primary key, name varchar2(50), country varchar2(20));
create table movie_test(movie_id number primary key, name varchar2(50), genre varchar2(20), score number (3,2), 
                        votes number (8), director_id number (3), 
                        foreign key(director_id) references directors_test(director_id));
                        
                        
drop table movie_test;
drop table directors_test;

insert into directors_test values(101, 'Christopher Nolan', 'UK');
insert into directors_test values(102, 'James Cameron', 'Canada');
insert into directors_test values(103, 'Greta Gerwig', 'USA');

insert into movie_test values (1, 'Inception', 'Sci-Fi', 9.0, 800000, 101);
insert into movie_test values (2, 'Interstellar', 'Sci-Fi', 8.6, 750000, 101);
insert into movie_test values (3, 'Dunkirk', 'War', 7.9, 500000, 101);
insert into movie_test values (4, 'Titanic', 'Romance', 7.8, 1000000, 102);
insert into movie_test values (5, 'Avatar', 'Sci-Fi', 7.9, 1200000, 102);

select * from movie_test;
select * from directors_test;


select * from movie_test where score = (select max(score) from movie_test);
select * from movie_test where score in (select max(score) from movie_test group by genre);
select * from movie_test where score > any
    (select score from movie_test where director_id = 
        (select director_id from directors_test where name = 'James Cameron'));
            
select * from movie_test where score > all
    (select score from movie_test where director_id = 
        (select director_id from directors_test where name = 'James Cameron'));
        


create table cust(customer_id number primary key, first_name varchar2(50), last_name varchar2(50), country varchar2(50), score number(3));

create table ord (order_id number primary key, customer_id number(2), foreign key(customer_id) references cust(customer_id), order_date date, quantity number(4));

insert into cust values(1, 'Maria', 'Cramer', 'Germany', 350);
insert into cust values(2, 'John', 'Steel', 'USA', 900);
insert into cust values(3, 'Georg', 'Pipps', 'UK', 750);
insert into cust values(4, 'Martin', 'Muller', 'Germany', 500);
insert into cust values(5, 'Peter', 'Franken', 'USA', NULL);

insert into ord values (1001, 1, to_date('2021-01-11', 'YYYY-MM-DD'), 250);
insert into ord values (1002, 2, to_date('2021-04-05', 'YYYY-MM-DD'), 1150);
insert into ord values (1003, 3, to_date('2021-06-18', 'YYYY-MM-DD'), 500);
insert into ord values (1004, 5, to_date('2021-08-31', 'YYYY-MM-DD'), 750);

select * from ord;
select * from cust;
--orders from customes whose score > 500 using customer id

--correlated subquery
select * from ord o where customer_id = (select customer_id from cust c where o.customer_id = c.customer_id and score > 500);

--using in
select * from ord where customer_id in (select customer_id from cust where score > 500);

--using exists
select * from ord o where exists(select 1 from cust c where c.customer_id = o.customer_id and score > 500);
