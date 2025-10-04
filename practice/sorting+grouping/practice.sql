
-- sorting
select * from phones;
--top 5 samsungs with biggest screen size
select * from (select * from phones where brand_name = 'samsung' order by screen_size desc) where rownum<=5; 
--phones in desc order of total cams
select model, num_rear_cameras + num_front_cameras as total_cams from phones where 
    (num_rear_cameras + num_front_cameras) is not null 
    order by total_cams desc;

--sort by decreasing ppi sqrt of sqr res_width + sq res_height
select model, sqrt(resolution_width*resolution_width + resolution_height*resolution_height) as ppi from phones 
    order by ppi;
    
select * from movies;

--2nd largest battery
select * from (select model, battery_capacity from phones where battery_capacity is not null order by battery_capacity desc);
delete from movies where gross is null;

--name, rating of worst rated apple device

--we can use sub query
select model, rating from phones where rating = (select min(rating) from phones) and brand_name = 'apple';

-- or we can sort
select * from (select model, rating from phones where brand_name = 'apple' order by rating) where rownum =1;

-- sort phones alphabetically and then on basis of rating in desc order
select brand_name, model, rating from phones where rating is not null order by brand_name asc, rating desc;

-- sort phones alphabetically and then on basis of price in asc order
select brand_name, model, price from phones order by brand_name,price;

--grouping 
select brand_name, count(*) as num_phones, round(avg(price), 2) as average_price, max(rating) as max_`rating, round(avg(screen_size), 2) as average_screen_size, 
round(avg(battery_capacity), 2)as average_battery_capacity from phones group by brand_name order by num_phones desc;

--group by has_nfc and get avg price and avg rating
select has_nfc, round(avg(price), 2) as average_price, round(avg(rating), 2) as avg_rating from phones group by has_nfc; 

-- group by extended mem available and get avg price
select extended_memory_available, avg(price) as average_price from phones group by extended_memory_available;

--group smartphones by brand and processor and get count of model, avg rear cam res
select brand_name, processor_brand, count(*) as num_models, round(avg(primary_camera_rear), 2)
as average_rear_cam_resolution from phones 
group by brand_name, processor_brand ;

-- top 5 expensive brands
select * from(select brand_name, round(avg(price),2) as average_price from phones group by brand_name order by average_price desc) where rownum<=5;
--avg price of 5g vs non 5g phones
select has_5g, round(avg(price),2) as average_price from phones group by has_5g;
--group by brand and find brand w/ most num of models that have nfc and ir blaster
select brand_name, count(*) as num_models from phones where has_nfc = 'True' and has_ir_blaster = 'True' group by brand_name order by num_models desc;
-- find 5g samsung phones and avg price of nfc and non nfc phones
select round(avg(price),2) as average_price, has_nfc from phones where brand_name = 'samsung' group by has_nfc;

--having clause
--costliest brands having at least 20 phones
--flitering on the basis of an aggregate operation
select brand_name, count(*) as num_models, round(avg(price), 2) as avg_price from phones group by brand_name having count(*) > 20 order by avg_price desc ;

--average ratings of brans with more than 40 models
select brand_name, count(*) as num_models, round(avg(rating), 2) as avg_rating from phones group by brand_name having count(*) > 40 order by avg_rating desc ;

--top 3 brands w/ highest avg ram that have refresh rate of at least 90hz, fast charging available and models>=10
select * from (select brand_name, round(avg(ram_capacity), 2) as avg_ram, count(*) as num_models, round(avg(refresh_rate), 2) as avg_refresh_rate
from phones where fast_charging_available = 1 and refresh_rate>=90 group by brand_name having count(*)>=10 order by avg_ram desc) 
where rownum<=3;

--avg price of all brands with avg rating > 70 and models >10 among all 5g enabled phones
select brand_name, 
    round(avg(price), 2) as avg_price, round(avg(rating), 2) as avg_rating, 
    count(*) as num_models from phones 
    where has_5g = 'True'
    group by brand_name 
    having (round(avg(rating), 2) > 70 and  count(*) > 10) 
    order by avg_price desc;


--top 5 batsmen in ipl
select * from(select batter, sum(total_run) as total_runs from ipl group by batter order by total_runs desc) where rownum<=5;

--2nd highest 6 hitter
--we can create a temporary table table to display the result when we have to extract a row != 1 
select batter, count(*) as num_sixes from ipl where batsman_run = 6 group by batter order by num_sixes desc;

--top 10 batsmen with centuries in ipl
select * from (
    select batter, count(batter) as centuries from 
    (select id, batter, sum(batsman_run) from ipl group by id, batter 
    having sum(batsman_run)>=100 order by batter) 
    group by batter order by centuries desc)
    where rownum<=10;

-- top 5 batsmen w/ highest SR who have played a min of 1000 balls
select * from
    (select batter, round((sum(batsman_run)/count(*))*100, 2) as strike_rate from ipl 
    group by batter having count(*)>=1000 order by strike_rate desc)
    where rownum<=5;


