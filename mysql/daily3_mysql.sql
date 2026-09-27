use internship_prep;

show tables;
create table messy_data(patient_id int , district varchar(50),glucose_level int);

desc messy_data;

insert into messy_data (patient_id , district,glucose_level) values
(201,"Ernakulam",105),
(202,"UDUPI",142),
(202,"UDUPI",142),
(204,"ernakulam",NULL),
(205,"Manipal",98);

select * from messy_data;


select distinct district from messy_data;
#clean the data
# lower the district name ,fill the null value with 0

select patient_id,
lower(trim(district)) as cleaned_district,
coalesce(glucose_level,0) as clean_glucose
from messy_data;


#remvoe duplicate rows from messy_data
select distinct patient_id,district,glucose_level from messy_data;

#change value of null = 100 , capitalize the district
select patient_id,
upper(trim(district)) as upper_district,
coalesce(glucose_level,100) as glucose_clean
from messy_data;


#count distinct district in messy_data
select count(distinct district) from messy_data;

select count(distinct patient_id) from messy_data;

select distinct district,patient_id from messy_data;

select count(distinct district) as count_of_unque_district,
count(distinct patient_id) as count_of_uniqe_patient_id
from messy_data;

select distinct district from messy_data order by district asc;
select distinct district from messy_data order by district desc;

#
select district from messy_data group by district;



