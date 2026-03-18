Select * from projects;
# Q1
Select *, date(from_unixtime(created_at)) as created_date, 
date(from_unixtime(deadline)) as Deadline_date, date(from_unixtime(updated_at))as updated_date,
date(from_unixtime(state_changed_at)) as state_changed_date, 
date(from_unixtime(state_changed_at)) as  successful_date, 
date(from_unixtime(launched_at)) as launched_date from projects;

---------------------------------------------------------------------------------

# Q2

Select 
DATE(from_unixtime(min(created_at))) as min_date, 
DATE(from_unixtime(max(created_at))) as max_date 
from projects;

SELECT year(from_unixtime(created_at)) as created_year from projects;

SELECT MONTH(from_unixtime(created_at)) as monthno from projects;

SELECT monthname(from_unixtime(created_at)) as Month_fullname from projects;

SELECT concat('Q', QUARTER(from_unixtime(created_at))) as Quarter_project from projects;

SELECT  DATE_FORMAT(from_unixtime(created_at), '%Y-%b') as Year_mon 
from projects;

SELECT dayofweek(from_unixtime(created_at)) as weekday_no from projects;

SELECT dayname(from_unixtime(created_at)) as weekday_no from projects;

SELECT
    CASE
       WHEN MONTH(from_unixtime(created_at))>=4 THEN CONCAT ('FM', 
       MONTH(from_unixtime(created_at)) -3)
       ELSE CONCAT('FM',
       MONTH(from_unixtime(created_at)) +9 )
       END AS Financial_month
       from projects;
       
       
 SELECT 
    CASE
      WHEN MONTH(from_unixtime(created_at)) between 4 AND 6 THEN 'FQ1'
       WHEN MONTH(from_unixtime(created_at)) between 7 AND 9 THEN 'FQ2'
       WHEN MONTH(from_unixtime(created_at)) between 10 AND 12 THEN 'FQ3'
       ELSE 'FQ4' 
       END AS Financial_quarter
       from projects;

select
year(from_unixtime(created_at)) as created_year ,
MONTH(from_unixtime(created_at)) as monthno ,
monthname(from_unixtime(created_at)) as Month_fullname,
concat('Q', QUARTER(from_unixtime(created_at))) as Quarter_project,
DATE_FORMAT(from_unixtime(created_at), '%Y-%b') as Year_mon ,
dayofweek(from_unixtime(created_at)) as weekday_no,
dayname(from_unixtime(created_at)) as weekday_no,
CASE
       WHEN MONTH(from_unixtime(created_at))>=4 THEN CONCAT ('FM', 
       MONTH(from_unixtime(created_at)) -3)
       ELSE CONCAT('FM',
       MONTH(from_unixtime(created_at)) +9 )
       END AS Financial_month,
CASE
      WHEN MONTH(from_unixtime(created_at)) between 4 AND 6 THEN 'FQ1'
       WHEN MONTH(from_unixtime(created_at)) between 7 AND 9 THEN 'FQ2'
       WHEN MONTH(from_unixtime(created_at)) between 10 AND 12 THEN 'FQ3'
       ELSE 'FQ4' 
       END AS Financial_quarter
from projects;





----------------------------------------------------------------------------------
# Q6

select state ,sum(usd_pledged) as Total_amount_raised from projects where state = 'successful' group by state;

select state, sum(backers_count) as Total_backers from projects where state ='successful';

select state, round(AVG((deadline - launched_at)/86400.0),2) as Average_days_Successful From projects where state = 'successful'
group by state;
